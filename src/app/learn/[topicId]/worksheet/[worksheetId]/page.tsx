import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { WorksheetRunner } from "@/components/worksheet-runner";
import type { PublicQuestion } from "@/lib/types";

export default async function WorksheetPage({
  params,
}: {
  params: Promise<{ topicId: string; worksheetId: string }>;
}) {
  const { topicId, worksheetId } = await params;

  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: worksheet } = await supabase
    .from("worksheets")
    .select("id, title, topic_id")
    .eq("id", worksheetId)
    .maybeSingle();
  if (!worksheet || worksheet.topic_id !== topicId) notFound();

  // sibling worksheets for "Worksheet N of M" + next
  const { data: siblings } = await supabase
    .from("worksheets")
    .select("id, sort_order")
    .eq("topic_id", topicId)
    .order("sort_order");
  const list = siblings ?? [];
  const idx = list.findIndex((w) => w.id === worksheetId);
  const total = list.length;
  const nextWorksheetId = idx >= 0 && idx < total - 1 ? list[idx + 1].id : null;

  // NOTE: correct_answer is intentionally NOT selected — grading is server-side.
  const { data: questions } = await supabase
    .from("questions")
    .select("id, question_type, prompt, choices, points, sort_order")
    .eq("worksheet_id", worksheetId)
    .order("sort_order");

  return (
    <main className="mx-auto w-full max-w-3xl p-4 sm:p-6">
      <Link
        href={`/learn/${topicId}`}
        className="text-sm text-slate-500 hover:underline"
      >
        ← Exit worksheet
      </Link>
      <div className="mt-4">
        <WorksheetRunner
          worksheetId={worksheet.id}
          topicId={topicId}
          title={worksheet.title}
          worksheetNumber={idx >= 0 ? idx + 1 : 1}
          totalWorksheets={total}
          nextWorksheetId={nextWorksheetId}
          questions={(questions ?? []) as PublicQuestion[]}
        />
      </div>
    </main>
  );
}
