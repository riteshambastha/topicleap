import Anthropic from "@anthropic-ai/sdk";
import type { SupabaseClient } from "@supabase/supabase-js";

export interface KidStats {
  totalPoints: number;
  topicsCompleted: number;
  totalTopics: number;
  accuracy: number; // 0-100
  worksheetsCompleted: number;
  lastTopicName: string | null;
  lastScorePct: number | null;
}

type AttemptRow = {
  correct_count: number;
  total_questions: number;
  worksheets: { topic_id: string; topics: { name: string } | null } | null;
};

export function firstName(displayName: string): string {
  return (displayName || "friend").trim().split(/\s+/)[0];
}

/** Compute a child's achievement stats (works with any RLS-scoped or admin client). */
export async function getKidStats(
  supabase: SupabaseClient,
  child: { id: string; grade_level: number },
): Promise<KidStats> {
  const [{ data: ledger }, { data: attemptsData }, { count: totalTopics }] =
    await Promise.all([
      supabase.from("points_ledger").select("points").eq("child_id", child.id),
      supabase
        .from("attempts")
        .select("correct_count, total_questions, worksheets(topic_id, topics(name))")
        .eq("child_id", child.id)
        .eq("status", "completed")
        .order("completed_at", { ascending: false }),
      supabase
        .from("topics")
        .select("id", { count: "exact", head: true })
        .eq("grade_level", child.grade_level),
    ]);

  const totalPoints = (ledger ?? []).reduce((a, r) => a + (r.points ?? 0), 0);
  const rows = (attemptsData ?? []) as unknown as AttemptRow[];

  const topicIds = new Set<string>();
  let correct = 0;
  let total = 0;
  for (const r of rows) {
    total += r.total_questions;
    correct += r.correct_count;
    const tid = r.worksheets?.topic_id;
    if (tid) topicIds.add(tid);
  }

  const last = rows[0];
  return {
    totalPoints,
    topicsCompleted: topicIds.size,
    totalTopics: totalTopics ?? 0,
    accuracy: total > 0 ? Math.round((100 * correct) / total) : 0,
    worksheetsCompleted: rows.length,
    lastTopicName: last?.worksheets?.topics?.name ?? null,
    lastScorePct:
      last && last.total_questions > 0
        ? Math.round((100 * last.correct_count) / last.total_questions)
        : null,
  };
}

/** Deterministic, encouraging message used when no AI key is configured. */
export function fallbackSummary(name: string, s: KidStats): string {
  if (s.worksheetsCompleted === 0) {
    return `Welcome, ${name}! You're all set to start your learning adventure. Pick a subject, try your first worksheet, and you'll start earning points right away. A little practice each day adds up fast!`;
  }
  const lead =
    s.accuracy >= 85
      ? `Wow, ${name}, you're on fire!`
      : s.accuracy >= 60
        ? `Great work, ${name}!`
        : `You're building real skills, ${name}!`;
  const recent = s.lastTopicName
    ? ` Your latest win was "${s.lastTopicName}"${s.lastScorePct != null ? ` with ${s.lastScorePct}%` : ""}.`
    : "";
  return (
    `${lead} So far you've finished ${s.worksheetsCompleted} worksheet${s.worksheetsCompleted === 1 ? "" : "s"} ` +
    `across ${s.topicsCompleted} topic${s.topicsCompleted === 1 ? "" : "s"}, earned ${s.totalPoints} points, ` +
    `and answered ${s.accuracy}% correctly.${recent} ` +
    `There are ${Math.max(s.totalTopics - s.topicsCompleted, 0)} more topics waiting — keep practicing a little every day and you'll master them all!`
  );
}

/** AI summary via Claude Haiku, falling back to a template if no key/errors. */
export async function generateSummaryText(
  name: string,
  s: KidStats,
): Promise<string> {
  const apiKey = process.env.ANTHROPIC_API_KEY;
  if (!apiKey) return fallbackSummary(name, s);

  try {
    const client = new Anthropic({ apiKey });
    const msg = await client.messages.create({
      model: "claude-haiku-4-5-20251001",
      max_tokens: 220,
      system:
        "You are a warm, upbeat learning coach for a child in elementary school (around 9-10 years old). " +
        "Write a short motivational note (2-3 sentences, max ~60 words) addressed to the child by their first name. " +
        "Celebrate their specific achievements using the numbers given, then encourage them that with regular practice " +
        "they can master even more. Be specific, kind, and age-appropriate. Plain text only, no markdown, at most one emoji. " +
        "Do not ask questions. Never mention you are an AI.",
      messages: [
        {
          role: "user",
          content:
            `Child's first name: ${name}\n` +
            `Points earned: ${s.totalPoints}\n` +
            `Worksheets completed: ${s.worksheetsCompleted}\n` +
            `Topics completed: ${s.topicsCompleted} out of ${s.totalTopics} available\n` +
            `Overall accuracy: ${s.accuracy}%\n` +
            (s.lastTopicName
              ? `Most recent topic: "${s.lastTopicName}"${s.lastScorePct != null ? ` (${s.lastScorePct}%)` : ""}\n`
              : "") +
            `Write the motivational note now.`,
        },
      ],
    });
    const text = msg.content
      .filter((b): b is Anthropic.TextBlock => b.type === "text")
      .map((b) => b.text)
      .join(" ")
      .trim();
    return text || fallbackSummary(name, s);
  } catch {
    return fallbackSummary(name, s);
  }
}

/** Compute stats, generate the summary, and upsert it. Best-effort. */
export async function regenerateSummary(
  admin: SupabaseClient,
  child: { id: string; display_name: string; grade_level: number },
): Promise<void> {
  try {
    const stats = await getKidStats(admin, child);
    const summary = await generateSummaryText(firstName(child.display_name), stats);
    await admin.from("kid_summaries").upsert(
      {
        child_id: child.id,
        summary,
        total_points: stats.totalPoints,
        topics_completed: stats.topicsCompleted,
        accuracy: stats.accuracy,
        worksheets_completed: stats.worksheetsCompleted,
        generated_at: new Date().toISOString(),
      },
      { onConflict: "child_id" },
    );
  } catch {
    // Never let summary generation break the main flow.
  }
}
