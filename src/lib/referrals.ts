/**
 * Parent-to-parent referral logic. All functions are SERVER-ONLY: they use
 * the service-role admin client and must never be imported into client code.
 *
 * Flow:
 *  1. A parent shares their code (getOrCreateReferralCode).
 *  2. A friend signs up via /signup?ref=CODE -> captureReferral records a
 *     pending referral linking referrer -> invited parent.
 *  3. When a parent adds a learner, processReferralsOnChildAdded fires. A
 *     referral is rewarded only once BOTH sides have >=1 child, so the bonus
 *     is never lost regardless of who adds a kid first.
 */
import { createAdminClient } from "@/lib/supabase/admin";

/** Bonus points granted to EACH child on BOTH sides per successful referral. */
export const REFERRAL_BONUS_POINTS = 100;

/** Cookie that carries a referral code from the invite link through signup. */
export const REFERRAL_COOKIE = "tl_ref";

/** Unambiguous code alphabet (no 0/O/1/I) -> 6 chars, e.g. "K7QF2M". */
const CODE_ALPHABET = "ABCDEFGHJKLMNPQRSTUVWXYZ23456789";

function randomCode(len = 6): string {
  let out = "";
  for (let i = 0; i < len; i++) {
    out += CODE_ALPHABET[Math.floor(Math.random() * CODE_ALPHABET.length)];
  }
  return out;
}

/** Get the parent's referral code, generating + persisting one if needed. */
export async function getOrCreateReferralCode(
  parentId: string,
): Promise<string> {
  const admin = createAdminClient();
  const { data: existing } = await admin
    .from("parents")
    .select("referral_code")
    .eq("id", parentId)
    .maybeSingle();
  if (existing?.referral_code) return existing.referral_code;

  // Try a few times in the (rare) event of a code collision.
  for (let attempt = 0; attempt < 6; attempt++) {
    const code = randomCode();
    const { error } = await admin
      .from("parents")
      .update({ referral_code: code })
      .eq("id", parentId)
      .is("referral_code", null);
    if (!error) {
      const { data: check } = await admin
        .from("parents")
        .select("referral_code")
        .eq("id", parentId)
        .maybeSingle();
      if (check?.referral_code) return check.referral_code;
    }
  }
  throw new Error("Could not generate a referral code. Please try again.");
}

/**
 * Record a pending referral when a newly-signed-up parent used an invite code.
 * No-ops on self-referral, unknown codes, or if the invited parent already has
 * a referral row.
 */
export async function captureReferral(
  invitedParentId: string,
  code: string | undefined | null,
): Promise<void> {
  const clean = (code ?? "").trim().toUpperCase();
  if (!clean) return;

  const admin = createAdminClient();
  const { data: referrer } = await admin
    .from("parents")
    .select("id")
    .eq("referral_code", clean)
    .maybeSingle();
  if (!referrer) return; // unknown code
  if (referrer.id === invitedParentId) return; // self-referral

  // One referral per invited parent (unique constraint also enforces this).
  const { data: already } = await admin
    .from("referrals")
    .select("id")
    .eq("invited_parent_id", invitedParentId)
    .maybeSingle();
  if (already) return;

  await admin.from("referrals").insert({
    referrer_parent_id: referrer.id,
    invited_parent_id: invitedParentId,
    code: clean,
    status: "pending",
  });
}

async function childIds(parentId: string): Promise<string[]> {
  const admin = createAdminClient();
  const { data } = await admin
    .from("children")
    .select("id")
    .eq("parent_id", parentId);
  return (data ?? []).map((c) => c.id);
}

/** Grant the two-sided bonus for one referral and mark it rewarded. */
async function rewardReferral(referral: {
  id: string;
  referrer_parent_id: string;
  invited_parent_id: string;
}): Promise<void> {
  const admin = createAdminClient();
  const [refKids, invKids] = await Promise.all([
    childIds(referral.referrer_parent_id),
    childIds(referral.invited_parent_id),
  ]);
  // Only reward once both sides actually have a learner.
  if (refKids.length === 0 || invKids.length === 0) return;

  const rows = [...refKids, ...invKids].map((cid) => ({
    child_id: cid,
    points: REFERRAL_BONUS_POINTS,
    source_type: "referral",
    source_id: referral.id,
    reason: "Referral bonus 🎁",
  }));
  const { error: ledgerErr } = await admin.from("points_ledger").insert(rows);
  if (ledgerErr) return; // leave pending; will retry on next trigger

  await admin
    .from("referrals")
    .update({
      status: "rewarded",
      rewarded_at: new Date().toISOString(),
      reward_points: REFERRAL_BONUS_POINTS,
    })
    .eq("id", referral.id)
    .eq("status", "pending"); // guard against double-reward races
}

/**
 * Called after a parent adds a learner. Settles any pending referral where
 * this parent is the invitee OR the referrer, rewarding only when both sides
 * now have a child.
 */
export async function processReferralsOnChildAdded(
  parentId: string,
): Promise<void> {
  const admin = createAdminClient();
  const { data: pending } = await admin
    .from("referrals")
    .select("id, referrer_parent_id, invited_parent_id")
    .eq("status", "pending")
    .or(`invited_parent_id.eq.${parentId},referrer_parent_id.eq.${parentId}`);

  for (const r of pending ?? []) {
    await rewardReferral(r);
  }
}

export type ReferralStats = {
  friendsJoined: number; // pending + rewarded
  successful: number; // rewarded
  pointsEarned: number; // referral points across this parent's children
};

/** Summary numbers for the refer page. */
export async function getReferralStats(
  parentId: string,
): Promise<ReferralStats> {
  const admin = createAdminClient();
  const { data: refs } = await admin
    .from("referrals")
    .select("status")
    .eq("referrer_parent_id", parentId);
  const friendsJoined = refs?.length ?? 0;
  const successful = (refs ?? []).filter((r) => r.status === "rewarded").length;

  const kids = await childIds(parentId);
  let pointsEarned = 0;
  if (kids.length) {
    const { data: ledger } = await admin
      .from("points_ledger")
      .select("points")
      .eq("source_type", "referral")
      .in("child_id", kids);
    pointsEarned = (ledger ?? []).reduce((s, r) => s + (r.points ?? 0), 0);
  }
  return { friendsJoined, successful, pointsEarned };
}
