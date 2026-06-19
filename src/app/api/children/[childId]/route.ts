import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentParent } from "@/lib/auth";

function kidEmail(username: string) {
  return `${username}@kids.topicleap.com`;
}

/** Parent edits a supervised child's details (name, username, grade, PIN). */
export async function PATCH(
  req: Request,
  { params }: { params: Promise<{ childId: string }> },
) {
  const { childId } = await params;

  const parent = await getCurrentParent();
  if (!parent) {
    return NextResponse.json(
      { error: "You must be signed in as a parent." },
      { status: 401 },
    );
  }

  let body: {
    displayName?: string;
    username?: string;
    gradeLevel?: number;
    pin?: string;
  };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }

  const admin = createAdminClient();

  // Verify the child belongs to this parent.
  const { data: child } = await admin
    .from("children")
    .select("id, parent_id, auth_user_id, username")
    .eq("id", childId)
    .maybeSingle();
  if (!child || child.parent_id !== parent.id) {
    return NextResponse.json({ error: "Learner not found." }, { status: 404 });
  }

  const updates: Record<string, unknown> = {};

  // Display name
  if (body.displayName !== undefined) {
    const displayName = body.displayName.trim();
    if (!displayName) {
      return NextResponse.json({ error: "Display name is required." }, { status: 400 });
    }
    updates.display_name = displayName;
  }

  // Grade
  if (body.gradeLevel !== undefined) {
    const gradeLevel = Number(body.gradeLevel);
    if (!Number.isInteger(gradeLevel) || gradeLevel < 1 || gradeLevel > 12) {
      return NextResponse.json({ error: "Grade must be between 1 and 12." }, { status: 400 });
    }
    updates.grade_level = gradeLevel;
  }

  // Username (also updates the auth login email)
  let newUsername: string | null = null;
  if (body.username !== undefined) {
    const username = body.username.trim().toLowerCase();
    if (!/^[a-z0-9_]{3,20}$/.test(username)) {
      return NextResponse.json(
        { error: "Username must be 3–20 characters: letters, numbers, underscore." },
        { status: 400 },
      );
    }
    if (username !== child.username) {
      const { data: clash } = await admin
        .from("children")
        .select("id")
        .eq("username", username)
        .maybeSingle();
      if (clash) {
        return NextResponse.json({ error: "That username is taken." }, { status: 409 });
      }
      newUsername = username;
      updates.username = username;
    }
  }

  // PIN reset
  const pin = body.pin?.trim();
  if (pin) {
    if (!/^\d{4,6}$/.test(pin)) {
      return NextResponse.json({ error: "PIN must be 4–6 digits." }, { status: 400 });
    }
  }

  // Update the auth user if username or PIN changed.
  if (newUsername || pin) {
    const authPatch: { email?: string; password?: string } = {};
    if (newUsername) authPatch.email = kidEmail(newUsername);
    if (pin) authPatch.password = pin;
    const { error: authErr } = await admin.auth.admin.updateUserById(
      child.auth_user_id,
      authPatch,
    );
    if (authErr) {
      return NextResponse.json({ error: authErr.message }, { status: 400 });
    }
  }

  if (Object.keys(updates).length > 0) {
    const { error: rowErr } = await admin
      .from("children")
      .update(updates)
      .eq("id", childId);
    if (rowErr) {
      return NextResponse.json({ error: rowErr.message }, { status: 400 });
    }
  }

  return NextResponse.json({ ok: true });
}
