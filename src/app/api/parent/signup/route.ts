import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Create the parent root account. We use the admin client with
 * email_confirm:true so the parent can sign in immediately (no email
 * confirmation step needed for the M1 demo).
 */
export async function POST(req: Request) {
  let body: { email?: string; password?: string; displayName?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }

  const email = body.email?.trim().toLowerCase();
  const password = body.password ?? "";
  const displayName = body.displayName?.trim() || "Parent";

  if (!email || !password) {
    return NextResponse.json(
      { error: "Email and password are required." },
      { status: 400 },
    );
  }
  if (password.length < 6) {
    return NextResponse.json(
      { error: "Password must be at least 6 characters." },
      { status: 400 },
    );
  }

  const admin = createAdminClient();

  const { data: created, error: createErr } = await admin.auth.admin.createUser({
    email,
    password,
    email_confirm: true,
    user_metadata: { role: "parent" },
  });

  if (createErr || !created.user) {
    return NextResponse.json(
      { error: createErr?.message ?? "Could not create account." },
      { status: 400 },
    );
  }

  const { error: rowErr } = await admin.from("parents").insert({
    auth_user_id: created.user.id,
    email,
    display_name: displayName,
  });

  if (rowErr) {
    // Roll back the auth user so the email can be reused.
    await admin.auth.admin.deleteUser(created.user.id);
    return NextResponse.json({ error: rowErr.message }, { status: 400 });
  }

  return NextResponse.json({ ok: true });
}
