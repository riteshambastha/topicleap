import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress, isTopicComplete } from "@/lib/progress";
import { getViewGrade } from "@/lib/view-grade";
import { gradeLabel } from "@/lib/grade-label";
import { topicIcon } from "@/lib/topic-icons";
import { LogoutButton } from "@/components/logout-button";
import { GlobalSearch, type SearchItem } from "@/components/global-search";
import { GradeExplorer } from "@/components/grade-explorer";
import { Logo } from "@/components/logo";

type LessonStepLite = { title?: string; body?: string; prompt?: string };

const THEME: Record<string, { emoji: string; grad: string; soft: string }> = {
  math: { emoji: "🔢", grad: "from-indigo-500 to-violet-500", soft: "bg-indigo-50" },
  science: { emoji: "🔬", grad: "from-emerald-500 to-teal-500", soft: "bg-emerald-50" },
  reading: { emoji: "📖", grad: "from-sky-500 to-blue-500", soft: "bg-sky-50" },
  writing: { emoji: "✏️", grad: "from-amber-500 to-orange-500", soft: "bg-amber-50" },
  letters: { emoji: "🔤", grad: "from-rose-500 to-pink-500", soft: "bg-rose-50" },
};
const FALLBACK = { emoji: "📚", grad: "from-slate-500 to-slate-600", soft: "bg-slate-50" };

export default async function LearnHome() {
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const viewGrade = await getViewGrade(child.grade_level);

  const [
    { data: subjects },
    { data: topics },
    { data: lessons },
    { data: wsRows },
    { data: gradeRows },
  ] = await Promise.all([
    supabase.from("subjects").select("id, slug, name").order("sort_order"),
    supabase
      .from("topics")
      .select("id, slug, name, subject_id, standard_code")
      .eq("grade_level", viewGrade)
      .order("sort_order"),
    supabase.from("lessons").select("topic_id, steps"),
    supabase
      .from("worksheets")
      .select("id, topic_id, topics!inner(grade_level)")
      .eq("topics.grade_level", viewGrade),
    supabase.from("topics").select("grade_level"),
  ]);

  const availableGrades = Array.from(
    new Set((gradeRows ?? []).map((r) => r.grade_level as number)),
  ).sort((a, b) => a - b);

  const { completedWorksheets } = await getProgress(supabase, child.id);

  // worksheet ids per topic -> a topic is "complete" when all are done
  const wsByTopic = new Map<string, string[]>();
  for (const w of (wsRows ?? []) as unknown as { id: string; topic_id: string }[]) {
    const arr = wsByTopic.get(w.topic_id) ?? [];
    arr.push(w.id);
    wsByTopic.set(w.topic_id, arr);
  }
  const completedTopics = new Set<string>();
  for (const [tid, ids] of wsByTopic) {
    if (isTopicComplete(ids, completedWorksheets)) completedTopics.add(tid);
  }

  // Build a searchable blob of lesson text per topic.
  const lessonText = new Map<string, string>();
  for (const l of lessons ?? []) {
    const steps = (l.steps ?? []) as LessonStepLite[];
    const text = steps
      .map((s) => `${s.title ?? ""} ${s.body ?? ""} ${s.prompt ?? ""}`)
      .join(" ");
    lessonText.set(l.topic_id, text);
  }

  const subjectName = new Map((subjects ?? []).map((s) => [s.id, s.name]));
  const subjectSlug = new Map((subjects ?? []).map((s) => [s.id, s.slug]));
  const topicsBySubject = new Map<string, NonNullable<typeof topics>>();
  for (const t of topics ?? []) {
    const arr = topicsBySubject.get(t.subject_id) ?? [];
    arr.push(t);
    topicsBySubject.set(t.subject_id, arr);
  }

  const searchItems: SearchItem[] = (topics ?? []).map((t) => ({
    topicId: t.id,
    name: t.name,
    subject: subjectName.get(t.subject_id) ?? "",
    standard: t.standard_code,
    icon: topicIcon(t.slug, subjectSlug.get(t.subject_id)),
    keywords: lessonText.get(t.id) ?? "",
    completed: completedTopics.has(t.id),
  }));

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-2 border-b border-white/60 bg-white/75 px-4 py-4 backdrop-blur sm:px-6">
        <Logo iconClass="h-7 w-7" textClass="text-lg" />
        <div className="flex items-center gap-3">
          <span className="hidden text-sm text-slate-500 sm:inline">
            Hi, {child.display_name}! · {gradeLabel(child.grade_level)}
          </span>
          <Link
            href="/learn/progress"
            className="rounded-xl bg-indigo-50 px-3 py-1.5 text-sm font-semibold text-indigo-700 transition hover:bg-indigo-100"
          >
            📊 My Progress
          </Link>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto w-full max-w-5xl flex-1 p-4 sm:p-6">
        <div className="mb-5">
          <GlobalSearch items={searchItems} />
        </div>

        <div className="mb-6">
          <GradeExplorer
            homeGrade={child.grade_level}
            viewGrade={viewGrade}
            availableGrades={availableGrades}
          />
        </div>

        <h1 className="mb-5 text-2xl font-extrabold sm:text-3xl">
          {viewGrade === child.grade_level
            ? "Pick a subject"
            : `Exploring ${gradeLabel(viewGrade)}`}
        </h1>

        {(topics ?? []).length === 0 && (
          <div className="mb-6 rounded-2xl border border-white/60 bg-white/70 p-6 text-center text-slate-600 backdrop-blur">
            No topics for {gradeLabel(viewGrade)} yet — more grades are coming soon! 🚀
          </div>
        )}

        <div className="grid grid-cols-2 gap-4 lg:grid-cols-4">
          {(subjects ?? [])
            .filter((s) => (topicsBySubject.get(s.id) ?? []).length > 0)
            .map((s) => {
            const theme = THEME[s.slug] ?? FALLBACK;
            const subjTopics = topicsBySubject.get(s.id) ?? [];
            const total = subjTopics.length;
            const done = subjTopics.filter((t) => completedTopics.has(t.id)).length;
            const allDone = total > 0 && done === total;
            const pct = total ? Math.round((done / total) * 100) : 0;
            return (
              <Link key={s.id} href={`/learn/subject/${s.id}`} className="group">
                <div
                  className={`flex h-full flex-col overflow-hidden rounded-3xl border bg-white shadow-sm transition group-hover:-translate-y-0.5 group-hover:shadow-md ${
                    allDone ? "border-teal-400" : "border-slate-200"
                  }`}
                >
                  <div
                    className={`flex items-center justify-center bg-gradient-to-br ${theme.grad} py-7 text-5xl`}
                  >
                    {theme.emoji}
                  </div>
                  <div className="flex flex-1 flex-col p-4">
                    <p className="text-base font-extrabold leading-tight text-slate-900 sm:text-lg">
                      {s.name}
                    </p>
                    <p className="mt-0.5 text-sm text-slate-500">{total} topics</p>

                    <div className="mt-auto pt-3">
                      <div className="mb-1 flex items-center justify-between text-xs font-semibold">
                        <span className={allDone ? "text-teal-600" : "text-slate-500"}>
                          {allDone ? "✓ All done!" : `${done}/${total} done`}
                        </span>
                      </div>
                      <div className="h-2 w-full overflow-hidden rounded-full bg-slate-100">
                        <div
                          className={`h-full rounded-full ${allDone ? "bg-teal-500" : "bg-gradient-to-r " + theme.grad}`}
                          style={{ width: `${pct}%` }}
                        />
                      </div>
                    </div>
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
