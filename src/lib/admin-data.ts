/**
 * SERVER-ONLY data access for the admin dashboard. Uses the service-role
 * client so it can read across ALL families (bypassing RLS). Never import
 * into client components.
 */
import { createAdminClient } from "@/lib/supabase/admin";

export type KidProgress = {
  id: string;
  displayName: string;
  username: string;
  gradeLevel: number;
  worksheetsCompleted: number;
  pointsEarned: number;
  questionsAnswered: number;
  accuracyPct: number | null;
};

export type Family = {
  parentId: string;
  email: string;
  displayName: string;
  joinedAt: string;
  lastSignInAt: string | null;
  kids: KidProgress[];
};

export type FeedbackRow = {
  id: string;
  fullName: string;
  isParent: boolean | null;
  message: string;
  createdAt: string;
};

export type ReferralRow = {
  id: string;
  referrerEmail: string;
  invitedEmail: string | null;
  code: string;
  status: string;
  rewardPoints: number;
  createdAt: string;
  rewardedAt: string | null;
};

export type AdminData = {
  families: Family[];
  feedback: FeedbackRow[];
  referrals: ReferralRow[];
  stats: {
    parents: number;
    signedInParents: number;
    kids: number;
    worksheetsCompleted: number;
    feedback: number;
    referralsRewarded: number;
  };
};

export async function getAdminData(): Promise<AdminData> {
  const admin = createAdminClient();

  // Pull everything we need in parallel.
  const [
    parentsRes,
    childrenRes,
    attemptsRes,
    feedbackRes,
    referralsRes,
    authRes,
  ] = await Promise.all([
    admin
      .from("parents")
      .select("id, email, display_name, created_at, auth_user_id")
      .order("created_at", { ascending: false }),
    admin
      .from("children")
      .select("id, parent_id, display_name, username, grade_level"),
    admin
      .from("attempts")
      .select("child_id, status, total_questions, correct_count, points_earned"),
    admin
      .from("feedback")
      .select("id, full_name, is_parent, message, created_at")
      .order("created_at", { ascending: false })
      .limit(500),
    admin
      .from("referrals")
      .select(
        "id, referrer_parent_id, invited_parent_id, code, status, reward_points, created_at, rewarded_at",
      )
      .order("created_at", { ascending: false })
      .limit(500),
    admin.auth.admin.listUsers({ page: 1, perPage: 1000 }),
  ]);

  const parents = parentsRes.data ?? [];
  const children = childrenRes.data ?? [];
  const attempts = attemptsRes.data ?? [];
  const feedback = feedbackRes.data ?? [];
  const referrals = referralsRes.data ?? [];

  // auth_user_id -> last_sign_in_at
  const lastSignIn = new Map<string, string | null>();
  for (const u of authRes.data?.users ?? []) {
    lastSignIn.set(u.id, u.last_sign_in_at ?? null);
  }

  // Aggregate attempts per child.
  type Agg = {
    completed: number;
    points: number;
    questions: number;
    correct: number;
  };
  const byChild = new Map<string, Agg>();
  for (const a of attempts) {
    const agg =
      byChild.get(a.child_id) ??
      { completed: 0, points: 0, questions: 0, correct: 0 };
    if (a.status === "completed") agg.completed += 1;
    agg.points += a.points_earned ?? 0;
    agg.questions += a.total_questions ?? 0;
    agg.correct += a.correct_count ?? 0;
    byChild.set(a.child_id, agg);
  }

  // Kids grouped by parent.
  const kidsByParent = new Map<string, KidProgress[]>();
  for (const c of children) {
    const agg = byChild.get(c.id);
    const kid: KidProgress = {
      id: c.id,
      displayName: c.display_name,
      username: c.username,
      gradeLevel: c.grade_level,
      worksheetsCompleted: agg?.completed ?? 0,
      pointsEarned: agg?.points ?? 0,
      questionsAnswered: agg?.questions ?? 0,
      accuracyPct:
        agg && agg.questions > 0
          ? Math.round((agg.correct / agg.questions) * 100)
          : null,
    };
    const list = kidsByParent.get(c.parent_id) ?? [];
    list.push(kid);
    kidsByParent.set(c.parent_id, list);
  }

  // parent id -> email (for referral display)
  const emailById = new Map<string, string>();
  for (const p of parents) emailById.set(p.id, p.email);

  const families: Family[] = parents.map((p) => ({
    parentId: p.id,
    email: p.email,
    displayName: p.display_name,
    joinedAt: p.created_at,
    lastSignInAt: lastSignIn.get(p.auth_user_id) ?? null,
    kids: (kidsByParent.get(p.id) ?? []).sort((a, b) =>
      a.displayName.localeCompare(b.displayName),
    ),
  }));

  const feedbackRows: FeedbackRow[] = feedback.map((f) => ({
    id: f.id,
    fullName: f.full_name,
    isParent: f.is_parent,
    message: f.message,
    createdAt: f.created_at,
  }));

  const referralRows: ReferralRow[] = referrals.map((r) => ({
    id: r.id,
    referrerEmail: emailById.get(r.referrer_parent_id) ?? "—",
    invitedEmail: r.invited_parent_id
      ? emailById.get(r.invited_parent_id) ?? "—"
      : null,
    code: r.code,
    status: r.status,
    rewardPoints: r.reward_points ?? 0,
    createdAt: r.created_at,
    rewardedAt: r.rewarded_at,
  }));

  const stats = {
    parents: families.length,
    signedInParents: families.filter((f) => f.lastSignInAt).length,
    kids: children.length,
    worksheetsCompleted: families.reduce(
      (s, f) => s + f.kids.reduce((k, kid) => k + kid.worksheetsCompleted, 0),
      0,
    ),
    feedback: feedbackRows.length,
    referralsRewarded: referralRows.filter((r) => r.status === "rewarded")
      .length,
  };

  return { families, feedback: feedbackRows, referrals: referralRows, stats };
}
