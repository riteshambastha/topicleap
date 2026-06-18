import { createClient } from "@supabase/supabase-js";

/**
 * Server-ONLY admin client using the service-role key. Bypasses RLS.
 * Used for privileged actions: creating child logins and grading worksheets
 * (so correct answers never reach the browser). Never import this in client code.
 */
export function createAdminClient() {
  return createClient(
    process.env.NEXT_PUBLIC_SUPABASE_URL!,
    process.env.SUPABASE_SERVICE_ROLE_KEY!,
    { auth: { autoRefreshToken: false, persistSession: false } },
  );
}
