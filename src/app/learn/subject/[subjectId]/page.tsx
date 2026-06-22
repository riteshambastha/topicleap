import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress, isTopicComplete } from "@/lib/progress";
import { getViewGrade } from "@/lib/view-grade";
import { topicIcon, subjectGradient } from "@/lib/topic-icons";
import { LogoutButton } from "@/components/logout-button";
import { Logo } from "@/components/logo";

export default async function SubjectPage({
  params,
}: {
  params: Promise<{ subjectId: string }>;
}) {
  const { subjectId } = await params;
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: subject } = await supabase
    .from("subjects")
    .select("id, slug, name")
    .eq("id", subjectId)
    .maybeSingle();
  if (!subject) notFound();

  const viewGrade = await getViewGrade(child.grade_level);
  const { data: topics } = await supabase
    .from("topics")
    .select("id, slug, name, description, standard_code")
    .eq("subject_id", subjectId)
    .eq("grade_level", viewGrade)
    .order("sort_order");

  const topicIds = (topics ?? []).map((t) => t.id);
  const { data: wsRows } = await supabase
    .from("worksheets")
    .select("id, topic_id")
    .in("topic_id", topicIds.length ? topicIds : ["00000000-0000-0000-0000-000000000000"]);

  const { completedWorksheets, bestByWorksheet } = await getProgress(supabase, child.id);
  const grad = subjectGradient(subject.slug);

  // per-topic worksheet ids + completion + best score
  const wsByTopic = new Map<string, string[]>();
  for (const w of wsRows ?? []) {
    const arr = wsByTopic.get(w.topic_id) ?? [];
    arr.push(w.id);
    wsByTopic.set(w.topic_id, arr);
  }
  const completedTopics = new Set<string>();
  const bestByTopic = new Map<string, number>();
  for (const [tid, ids] of wsByTopic) {
    if (isTopicComplete(ids, completedWorksheets)) completedTopics.add(tid);
    const best = Math.max(0, ...ids.map((id) => bestByWorksheet.get(id) ?? 0));
    if (ids.some((id) => bestByWorksheet.has(id))) bestByTopic.set(tid, best);
  }

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-2 border-b border-white/60 bg-white/75 px-4 py-4 backdrop-blur sm:px-6">
        <Link href="/learn" className="inline-flex items-center gap-1.5" aria-label="Back to TopicLeap home">
          <span className="text-slate-400">←</span>
          <Logo iconClass="h-7 w-7" textClass="text-lg" />
        </Link>
        <div className="flex items-center gap-3">
          <span className="text-sm text-slate-500">Hi, {child.display_name}!</span>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto w-full max-w-5xl flex-1 p-4 sm:p-6">
        <div className={`mb-6 rounded-3xl bg-gradient-to-br ${grad} p-6 text-white`}>
          <Link href="/learn" className="text-sm font-semibold text-white/80 hover:text-white">
            ← All subjects
          </Link>
          <h1 className="mt-1 text-3xl font-extrabold">{subject.name}</h1>
          <p className="text-white/90">{(topics ?? []).length} topics to explore</p>
        </div>

        <div className="grid gap-3 sm:grid-cols-2">
          {(topics ?? []).map((t) => {
            const done = completedTopics.has(t.id);
            const best = bestByTopic.get(t.id);
            return (
              <Link key={t.id} href={`/learn/${t.id}`} className="group">
                <div
                  className={`flex h-full items-start gap-3 rounded-2xl border p-4 transition group-hover:-translate-y-0.5 group-hover:shadow-md ${
                    done ? "border-teal-400 bg-teal-50" : "border-slate-200 bg-white"
                  }`}
                >
                  <div className="relative shrink-0">
                    <div
                      className={`flex h-12 w-12 items-center justify-center rounded-2xl bg-gradient-to-br ${grad} text-2xl shadow-sm`}
                    >
                      {topicIcon(t.slug, subject.slug)}
                    </div>
                    {done && (
                      <span className="absolute -right-1.5 -top-1.5 flex h-5 w-5 items-center justify-center rounded-full bg-teal-500 text-xs font-bold text-white ring-2 ring-white">
                        ✓
                      </span>
                    )}
                  </div>
                  <div className="min-w-0 flex-1">
                    <div className="flex flex-wrap items-center gap-2">
                      <p className="font-bold text-slate-900">{t.name}</p>
                      {t.standard_code && (
                        <span className="rounded-full bg-white px-2 py-0.5 text-xs font-semibold text-slate-500 ring-1 ring-slate-200">
                          {t.standard_code}
                        </span>
                      )}
                    </div>
                    {t.description && (
                      <p className="mt-1 line-clamp-2 text-sm text-slate-500">
                        {t.description}
                      </p>
                    )}
                    <p className="mt-2 text-sm font-semibold">
                      {done ? (
                        <span className="text-teal-600">
                          ✓ Completed{best != null ? ` · best ${best}%` : ""}
                        </span>
                      ) : (
                        <span className="text-indigo-600">Start →</span>
                      )}
                    </p>
                  </div>
                </div>
              </Link>
            );
          })}
        </div>
      </main>
    </div>
  );
}
