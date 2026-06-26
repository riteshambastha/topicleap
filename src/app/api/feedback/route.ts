import { NextResponse } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";

/**
 * Public feedback / support submissions (no login required).
 * A lightweight server-side math captcha guards against basic bots:
 * the client sends the two addends it showed plus the user's answer, and
 * we re-check that answer === a + b here.
 */
export async function POST(req: Request) {
  let body: {
    fullName?: string;
    isParent?: boolean | null;
    message?: string;
    captcha?: { a?: number; b?: number; answer?: number | string };
  };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }

  const fullName = (body.fullName ?? "").trim().slice(0, 120);
  const message = (body.message ?? "").trim().slice(0, 2000);

  if (fullName.length < 2) {
    return NextResponse.json(
      { error: "Please enter your full name." },
      { status: 400 },
    );
  }
  if (message.length < 5) {
    return NextResponse.json(
      { error: "Please add a little more detail to your message." },
      { status: 400 },
    );
  }

  // Server-side captcha verification.
  const a = Number(body.captcha?.a);
  const b = Number(body.captcha?.b);
  const answer = Number(body.captcha?.answer);
  if (
    !Number.isFinite(a) ||
    !Number.isFinite(b) ||
    !Number.isFinite(answer) ||
    answer !== a + b
  ) {
    return NextResponse.json(
      { error: "Captcha answer was incorrect. Please try again." },
      { status: 400 },
    );
  }

  const isParent =
    typeof body.isParent === "boolean" ? body.isParent : null;

  const admin = createAdminClient();
  const { error } = await admin.from("feedback").insert({
    full_name: fullName,
    is_parent: isParent,
    message,
    user_agent: req.headers.get("user-agent")?.slice(0, 300) ?? null,
  });
  if (error) {
    return NextResponse.json({ error: error.message }, { status: 400 });
  }
  return NextResponse.json({ ok: true });
}
