/**
 * SERVER-ONLY admin authentication for the TopicLeap admin dashboard.
 *
 * A single fixed admin identity is configured via environment variables:
 *   ADMIN_USERNAME, ADMIN_PASSWORD   (required to enable admin login)
 *   ADMIN_SESSION_SECRET             (optional; signs the session cookie)
 *
 * On login we set an httpOnly cookie holding an HMAC of the credentials, so it
 * can't be forged without knowing the password. No secrets live in the repo.
 */
import crypto from "crypto";
import { cookies } from "next/headers";
import { redirect } from "next/navigation";

export const ADMIN_COOKIE = "tl_admin";
const MAX_AGE = 60 * 60 * 8; // 8 hours

const adminUser = () => process.env.ADMIN_USERNAME ?? "";
const adminPass = () => process.env.ADMIN_PASSWORD ?? "";
const secret = () =>
  process.env.ADMIN_SESSION_SECRET ??
  process.env.SUPABASE_SERVICE_ROLE_KEY ??
  "topicleap-admin-fallback";

/** True only when both username and password env vars are set. */
export function adminConfigured(): boolean {
  return adminUser().length > 0 && adminPass().length > 0;
}

/** The opaque session token stored in the cookie. */
export function expectedToken(): string {
  return crypto
    .createHmac("sha256", secret())
    .update(`${adminUser()}:${adminPass()}`)
    .digest("hex");
}

function safeEqual(a: string, b: string): boolean {
  const ab = Buffer.from(a);
  const bb = Buffer.from(b);
  return ab.length === bb.length && crypto.timingSafeEqual(ab, bb);
}

/** Verify a username/password pair against the configured admin identity. */
export function verifyCredentials(username: string, password: string): boolean {
  if (!adminConfigured()) return false;
  return (
    safeEqual(username, adminUser()) && safeEqual(password, adminPass())
  );
}

export function sessionCookieOptions() {
  return {
    httpOnly: true,
    secure: process.env.NODE_ENV === "production",
    sameSite: "lax" as const,
    path: "/",
    maxAge: MAX_AGE,
  };
}

/** Whether the current request carries a valid admin session cookie. */
export async function isAdmin(): Promise<boolean> {
  if (!adminConfigured()) return false;
  const token = (await cookies()).get(ADMIN_COOKIE)?.value;
  if (!token) return false;
  return safeEqual(token, expectedToken());
}

/** Use in admin server pages — redirects to the login screen if not signed in. */
export async function requireAdmin(): Promise<void> {
  if (!(await isAdmin())) redirect("/admin/login");
}
