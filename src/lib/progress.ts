import type { SupabaseClient } from "@supabase/supabase-js";

export interface Progress {
  /** worksheet ids the child has completed at least once */
  completedWorksheets: Set<string>;
  /** worksheet id -> best score percentage */
  bestByWorksheet: Map<string, number>;
}

type AttemptRow = {
  worksheet_id: string;
  correct_count: number;
  total_questions: number;
};

/** Per-child progress derived from completed worksheet attempts (RLS-scoped). */
export async function getProgress(
  supabase: SupabaseClient,
  childId: string,
): Promise<Progress> {
  const { data } = await supabase
    .from("attempts")
    .select("worksheet_id, correct_count, total_questions")
    .eq("child_id", childId)
    .eq("status", "completed");

  const rows = (data ?? []) as AttemptRow[];
  const completedWorksheets = new Set<string>();
  const bestByWorksheet = new Map<string, number>();

  for (const a of rows) {
    completedWorksheets.add(a.worksheet_id);
    const pct =
      a.total_questions > 0
        ? Math.round((100 * a.correct_count) / a.total_questions)
        : 0;
    bestByWorksheet.set(
      a.worksheet_id,
      Math.max(bestByWorksheet.get(a.worksheet_id) ?? 0, pct),
    );
  }

  return { completedWorksheets, bestByWorksheet };
}

/** A topic is complete when it has worksheets and all are completed. */
export function isTopicComplete(
  worksheetIds: string[],
  completed: Set<string>,
): boolean {
  return worksheetIds.length > 0 && worksheetIds.every((id) => completed.has(id));
}

/** How many of a topic's worksheets are done. */
export function topicDoneCount(
  worksheetIds: string[],
  completed: Set<string>,
): number {
  return worksheetIds.filter((id) => completed.has(id)).length;
}
