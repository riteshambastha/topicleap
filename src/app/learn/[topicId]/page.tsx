import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress, isTopicComplete, topicDoneCount } from "@/lib/progress";
import { topicIcon, subjectGradient } from "@/lib/topic-icons";
import { Card, CardContent } from "@/components/ui/card";

export default async function TopicPage({
  params,
}: {
  params: Promise<{ topicId: string }>;
}) {
  const { topicId } = await params;
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: topic } = await supabase
    .from("topics")
    .select("id, slug, name, description, standard_code, subject_id, subjects(slug)")
    .eq("id", topicId)
    .maybeSingle();
  if (!topic) notFound();
  const subjSlug = (topic.subjects as unknown as { slug: string } | null)?.slug;

  const [{ data: lesson }, { data: worksheets }] = await Promise.all([
    supabase.from("lessons").select("id").eq("topic_id", topicId).maybeSingle(),
    supabase
      .from("worksheets")
      .select("id, title, sort_order")
      .eq("topic_id", topicId)
      .order("sort_order"),
  ]);

  const wsList = worksheets ?? [];
  const wsIds = wsList.map((w) => w.id);

  // question count per worksheet (for points display)
  const { data: qRows } = await supabase
    .from("questions")
    .select("worksheet_id")
    .in("worksheet_id", wsIds.length ? wsIds : ["00000000-0000-0000-0000-000000000000"]);
  const qCount = new Map<string, number>();
  for (const q of qRows ?? []) {
    qCount.set(q.worksheet_id, (qCount.get(q.worksheet_id) ?? 0) + 1);
  }

  const { completedWorksheets, bestByWorksheet } = await getProgress(supabase, child.id);
  const done = topicDoneCount(wsIds, completedWorksheets);
  const total = wsIds.length;
  const allDone = isTopicComplete(wsIds, completedWorksheets);
  const pct = total ? Math.round((done / total) * 100) : 0;
  const firstWsId = wsList[0]?.id;

  return (
    <main className="mx-auto w-full max-w-4xl p-4 sm:p-6">
      <Link
        href={`/learn/subject/${topic.subject_id}`}
        className="text-sm text-slate-500 hover:underline"
      >
        ← Back to topics
      </Link>

      {/* topic header with icon + progress */}
      <div className="mt-3 mb-6 flex items-start gap-4">
        <div
          className={`flex h-16 w-16 shrink-0 items-center justify-center rounded-2xl bg-gradient-to-br ${subjectGradient(subjSlug)} text-4xl shadow-sm`}
        >
          {topicIcon(topic.slug, subjSlug)}
        </div>
        <div className="min-w-0 flex-1">
          <div className="flex flex-wrap items-center gap-2">
            <h1 className="text-2xl font-extrabold sm:text-3xl">{topic.name}</h1>
            {topic.standard_code && (
              <span className="rounded-full bg-indigo-50 px-2.5 py-1 text-xs font-semibold text-indigo-700">
                {topic.standard_code}
              </span>
            )}
            {allDone && (
              <span className="rounded-full bg-teal-100 px-3 py-1 text-xs font-bold text-teal-700">
                ✓ All worksheets done!
              </span>
            )}
          </div>
          {topic.description && (
            <p className="mt-1 text-slate-600">{topic.description}</p>
          )}
          {total > 0 && (
            <div className="mt-3 max-w-md">
              <div className="mb-1 flex justify-between text-xs font-semibold text-slate-500">
                <span>{done} of {total} worksheets done</span>
                <span>{pct}%</span>
              </div>
              <div className="h-2.5 w-full overflow-hidden rounded-full bg-slate-200">
                <div
                  className={`h-full rounded-full ${allDone ? "bg-teal-500" : "bg-gradient-to-r " + subjectGradient(subjSlug)}`}
                  style={{ width: `${pct}%` }}
                />
              </div>
            </div>
          )}
        </div>
      </div>

      {/* lesson */}
      {lesson && (
        <div className="mb-6 grid gap-3 sm:grid-cols-2">
          <Link href={`/learn/${topicId}/lesson`}>
            <Card className="h-full transition hover:border-indigo-400 hover:shadow-md">
              <CardContent className="p-5">
                <p className="text-lg font-bold">📘 Learn the lesson</p>
                <p className="mt-1 text-sm text-slate-500">
                  Step through the explanation and examples.
                </p>
              </CardContent>
            </Card>
          </Link>
          {firstWsId && (
            <Link href={`/learn/${topicId}/lesson?then=worksheet`}>
              <Card className="h-full transition hover:border-indigo-400 hover:shadow-md">
                <CardContent className="p-5">
                  <p className="text-lg font-bold">📘 ➕ 📝 Learn, then practice</p>
                  <p className="mt-1 text-sm text-slate-500">
                    Do the lesson, then jump into Worksheet 1.
                  </p>
                </CardContent>
              </Card>
            </Link>
          )}
        </div>
      )}

      {/* worksheets */}
      <h2 className="mb-3 text-lg font-bold text-slate-700">Worksheets</h2>
      {total === 0 ? (
        <p className="text-slate-500">No worksheets for this topic yet.</p>
      ) : (
        <div className="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
          {wsList.map((w, i) => {
            const wsDone = completedWorksheets.has(w.id);
            const best = bestByWorksheet.get(w.id);
            const points = (qCount.get(w.id) ?? 0) * 10;
            return (
              <Link key={w.id} href={`/learn/${topicId}/worksheet/${w.id}`} className="group">
                <div
                  className={`flex h-full flex-col rounded-2xl border-2 p-4 transition group-hover:-translate-y-0.5 group-hover:shadow-md ${
                    wsDone ? "border-teal-400 bg-teal-50" : "border-slate-200 bg-white"
                  }`}
                >
                  <div className="flex items-center justify-between">
                    <span
                      className={`flex h-10 w-10 items-center justify-center rounded-xl text-lg font-extrabold ${
                        wsDone ? "bg-teal-500 text-white" : "bg-indigo-100 text-indigo-700"
                      }`}
                    >
                      {wsDone ? "✓" : i + 1}
                    </span>
                    <span className="rounded-full bg-amber-50 px-2.5 py-1 text-xs font-bold text-amber-600">
                      {points} pts
                    </span>
                  </div>
                  <p className="mt-3 font-bold text-slate-900">{w.title}</p>
                  <p className="mt-0.5 text-sm font-semibold">
                    {wsDone ? (
                      <span className="text-teal-600">
                        ✓ Done{best != null ? ` · best ${best}%` : ""}
                      </span>
                    ) : (
                      <span className="text-indigo-600">Start →</span>
                    )}
                  </p>
                </div>
              </Link>
            );
          })}
        </div>
      )}
    </main>
  );
}
