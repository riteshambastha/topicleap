import type { SupabaseClient } from "@supabase/supabase-js";

export interface Progress {
  /** topic ids the child has completed at least one worksheet attempt for */
  completedTopics: Set<string>;
  /** topic id -> best score percentage */
  bestByTopic: Map<string, number>;
}

type AttemptRow = {
  status: string;
  correct_count: number;
  total_questions: number;
  worksheets: { topic_id: string } | null;
};

/** Per-child progress derived from completed worksheet attempts (RLS-scoped). */
export async function getProgress(
  supabase: SupabaseClient,
  childId: string,
): Promise<Progress> {
  const { data } = await supabase
    .from("attempts")
    .select("status, correct_count, total_questions, worksheets(topic_id)")
    .eq("child_id", childId)
    .eq("status", "completed");

  const rows = (data ?? []) as unknown as AttemptRow[];
  const completedTopics = new Set<string>();
  const bestByTopic = new Map<string, number>();

  for (const a of rows) {
    const tid = a.worksheets?.topic_id;
    if (!tid) continue;
    completedTopics.add(tid);
    const pct =
      a.total_questions > 0
        ? Math.round((100 * a.correct_count) / a.total_questions)
        : 0;
    bestByTopic.set(tid, Math.max(bestByTopic.get(tid) ?? 0, pct));
  }

  return { completedTopics, bestByTopic };
}
