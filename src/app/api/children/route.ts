import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentParent } from "@/lib/auth";
import { processReferralsOnChildAdded } from "@/lib/referrals";

/** Synthetic email used internally for a kid's auth.users row. */
function kidEmail(username: string) {
  return `${username}@kids.topicleap.com`;
}

/**
 * Parent creates a supervised child login (username + PIN).
 * Must be called by a logged-in parent. The PIN is stored as the child's
 * Supabase Auth password against a synthetic email.
 */
export async function POST(req: Request) {
  const parent = await getCurrentParent();
  if (!parent) {
    return NextResponse.json(
      { error: "You must be signed in as a parent." },
      { status: 401 },
    );
  }

  let body: { username?: string; displayName?: string; pin?: string; gradeLevel?: number };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }

  const username = body.username?.trim().toLowerCase();
  const displayName = body.displayName?.trim();
  const pin = body.pin?.trim() ?? "";
  const gradeLevel = Number(body.gradeLevel ?? 4);

  if (!username || !/^[a-z0-9_]{3,20}$/.test(username)) {
    return NextResponse.json(
      { error: "Username must be 3–20 characters: letters, numbers, underscore." },
      { status: 400 },
    );
  }
  if (!displayName) {
    return NextResponse.json({ error: "Display name is required." }, { status: 400 });
  }
  if (!/^\d{4,6}$/.test(pin)) {
    return NextResponse.json({ error: "PIN must be 4–6 digits." }, { status: 400 });
  }
  if (!Number.isInteger(gradeLevel) || gradeLevel < 0 || gradeLevel > 12) {
    return NextResponse.json({ error: "Please pick a valid grade." }, { status: 400 });
  }

  const admin = createAdminClient();

  // Reject duplicate username before creating an auth user.
  const { data: existing } = await admin
    .from("children")
    .select("id")
    .eq("username", username)
    .maybeSingle();
  if (existing) {
    return NextResponse.json({ error: "That username is taken." }, { status: 409 });
  }

  const { data: created, error: createErr } = await admin.auth.admin.createUser({
    email: kidEmail(username),
    password: pin,
    email_confirm: true,
    user_metadata: { role: "child", username },
  });
  if (createErr || !created.user) {
    return NextResponse.json(
      { error: createErr?.message ?? "Could not create child login." },
      { status: 400 },
    );
  }

  const { error: rowErr } = await admin.from("children").insert({
    parent_id: parent.id,
    auth_user_id: created.user.id,
    username,
    display_name: displayName,
    grade_level: gradeLevel,
  });
  if (rowErr) {
    await admin.auth.admin.deleteUser(created.user.id);
    return NextResponse.json({ error: rowErr.message }, { status: 400 });
  }

  // Settle any pending referral now that this family has a learner.
  // Best-effort: never fail child creation on referral bookkeeping.
  try {
    await processReferralsOnChildAdded(parent.id);
  } catch {
    /* ignore */
  }

  return NextResponse.json({ ok: true, username });
}
