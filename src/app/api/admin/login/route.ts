import { NextResponse } from "next/server";
import {
  ADMIN_COOKIE,
  adminConfigured,
  expectedToken,
  sessionCookieOptions,
  verifyCredentials,
} from "@/lib/admin-auth";

export async function POST(req: Request) {
  if (!adminConfigured()) {
    return NextResponse.json(
      {
        error:
          "Admin login isn't configured. Set ADMIN_USERNAME and ADMIN_PASSWORD.",
      },
      { status: 500 },
    );
  }

  let body: { username?: string; password?: string };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request." }, { status: 400 });
  }

  if (!verifyCredentials(body.username ?? "", body.password ?? "")) {
    return NextResponse.json(
      { error: "Invalid username or password." },
      { status: 401 },
    );
  }

  const res = NextResponse.json({ ok: true });
  res.cookies.set(ADMIN_COOKIE, expectedToken(), sessionCookieOptions());
  return res;
}
