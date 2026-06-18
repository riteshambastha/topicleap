import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { WorksheetRunner } from "@/components/worksheet-runner";
import type { PublicQuestion } from "@/lib/types";

export default async function WorksheetPage({
  params,
}: {
  params: Promise<{ topicId: string }>;
}) {
  const { topicId } = await params;

  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: worksheet } = await supabase
    .from("worksheets")
    .select("id, title")
    .eq("topic_id", topicId)
    .order("sort_order")
    .limit(1)
    .maybeSingle();
  if (!worksheet) notFound();

  // NOTE: correct_answer is intentionally NOT selected — grading is server-side.
  const { data: questions } = await supabase
    .from("questions")
    .select("id, question_type, prompt, choices, points, sort_order")
    .eq("worksheet_id", worksheet.id)
    .order("sort_order");

  return (
    <main className="mx-auto w-full max-w-2xl p-6">
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
          questions={(questions ?? []) as PublicQuestion[]}
        />
      </div>
    </main>
  );
}
