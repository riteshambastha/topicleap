import { createClient } from "@/lib/supabase/server";

/** Returns the currently authenticated auth user, or null. */
export async function getUser() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  return user;
}

/** Resolve the logged-in user to a child row (kid session), or null. */
export async function getCurrentChild() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null;

  const { data } = await supabase
    .from("children")
    .select("id, parent_id, username, display_name, grade_level")
    .eq("auth_user_id", user.id)
    .maybeSingle();

  return data;
}

/** Resolve the logged-in user to a parent row (parent session), or null. */
export async function getCurrentParent() {
  const supabase = await createClient();
  const {
    data: { user },
  } = await supabase.auth.getUser();
  if (!user) return null;

  const { data } = await supabase
    .from("parents")
    .select("id, email, display_name")
    .eq("auth_user_id", user.id)
    .maybeSingle();

  return data;
}
