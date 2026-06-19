import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress, isTopicComplete } from "@/lib/progress";
import { getKidStats, firstName, fallbackSummary } from "@/lib/summary";
import { subjectGradient } from "@/lib/topic-icons";
import { LogoutButton } from "@/components/logout-button";
import { Card, CardContent } from "@/components/ui/card";

type RecentRow = {
  correct_count: number;
  total_questions: number;
  points_earned: number;
  completed_at: string | null;
  worksheets: { title: string; topics: { name: string } | null } | null;
};

export default async function ProgressPage() {
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const name = firstName(child.display_name);

  const stats = await getKidStats(supabase, child);

  const [{ data: summaryRow }, { data: subjects }, { data: topics }, { data: recentData }] =
    await Promise.all([
      supabase
        .from("kid_summaries")
        .select("summary, generated_at")
        .eq("child_id", child.id)
        .maybeSingle(),
      supabase.from("subjects").select("id, slug, name").order("sort_order"),
      supabase
        .from("topics")
        .select("id, subject_id")
        .eq("grade_level", child.grade_level),
      supabase
        .from("attempts")
        .select("correct_count, total_questions, points_earned, completed_at, worksheets(title, topics(name))")
        .eq("child_id", child.id)
        .eq("status", "completed")
        .order("completed_at", { ascending: false })
        .limit(5),
    ]);

  const { data: wsRows } = await supabase
    .from("worksheets")
    .select("id, topic_id, topics!inner(grade_level)")
    .eq("topics.grade_level", child.grade_level);

  const { completedWorksheets } = await getProgress(supabase, child.id);
  const summary = summaryRow?.summary ?? fallbackSummary(name, stats);
  const recent = (recentData ?? []) as unknown as RecentRow[];

  // topic -> worksheet ids; a topic counts as done when all its worksheets are done
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

  const perSubject = (subjects ?? []).map((s) => {
    const subjTopics = (topics ?? []).filter((t) => t.subject_id === s.id);
    const done = subjTopics.filter((t) => completedTopics.has(t.id)).length;
    return {
      name: s.name,
      grad: subjectGradient(s.slug),
      done,
      total: subjTopics.length,
      pct: subjTopics.length ? Math.round((done / subjTopics.length) * 100) : 0,
    };
  });

  const statCards = [
    { label: "Points", value: stats.totalPoints, suffix: "⭐", tint: "from-amber-400 to-orange-500" },
    { label: "Topics done", value: `${stats.topicsCompleted}/${stats.totalTopics}`, suffix: "", tint: "from-indigo-400 to-violet-500" },
    { label: "Accuracy", value: `${stats.accuracy}%`, suffix: "", tint: "from-emerald-400 to-teal-500" },
    { label: "Worksheets", value: stats.worksheetsCompleted, suffix: "", tint: "from-sky-400 to-blue-500" },
  ];

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-2 border-b border-white/60 bg-white/75 px-4 py-4 backdrop-blur sm:px-6">
        <Link href="/learn" className="text-lg font-bold text-indigo-700">
          ← TopicLeap
        </Link>
        <div className="flex items-center gap-3">
          <span className="text-sm text-slate-500">Hi, {name}!</span>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto w-full max-w-5xl flex-1 p-4 sm:p-6">
        {/* motivational hero */}
        <div className="mb-6 overflow-hidden rounded-3xl bg-gradient-to-br from-indigo-600 via-violet-600 to-fuchsia-600 p-6 text-white shadow sm:p-8">
          <p className="text-sm font-semibold uppercase tracking-widest text-white/70">
            Your progress
          </p>
          <h1 className="mt-1 text-3xl font-extrabold sm:text-4xl">
            Hi, {name}! 🚀
          </h1>
          <p className="mt-3 max-w-3xl text-lg leading-relaxed text-white/95">
            {summary}
          </p>
        </div>

        {/* stat cards */}
        <div className="mb-8 grid grid-cols-2 gap-3 sm:gap-4 lg:grid-cols-4">
          {statCards.map((s) => (
            <Card key={s.label} className="overflow-hidden">
              <div className={`h-1.5 w-full bg-gradient-to-r ${s.tint}`} />
              <CardContent className="p-4 sm:p-5">
                <p className="text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl">
                  {s.value}
                  {s.suffix && <span className="ml-1 text-xl">{s.suffix}</span>}
                </p>
                <p className="mt-1 text-sm font-medium text-slate-500">{s.label}</p>
              </CardContent>
            </Card>
          ))}
        </div>

        <div className="grid gap-6 lg:grid-cols-2">
          {/* per-subject progress */}
          <section>
            <h2 className="mb-3 text-lg font-bold text-slate-700">Subjects</h2>
            <div className="grid gap-3">
              {perSubject.map((s) => (
                <Card key={s.name}>
                  <CardContent className="p-4">
                    <div className="mb-1.5 flex items-center justify-between text-sm font-semibold">
                      <span className="text-slate-800">{s.name}</span>
                      <span className="text-slate-500">{s.done}/{s.total}</span>
                    </div>
                    <div className="h-2.5 w-full overflow-hidden rounded-full bg-slate-100">
                      <div
                        className={`h-full rounded-full bg-gradient-to-r ${s.grad}`}
                        style={{ width: `${s.pct}%` }}
                      />
                    </div>
                  </CardContent>
                </Card>
              ))}
            </div>
          </section>

          {/* recent activity */}
          <section>
            <h2 className="mb-3 text-lg font-bold text-slate-700">Recent worksheets</h2>
            {recent.length === 0 ? (
              <Card>
                <CardContent className="p-6 text-center text-slate-500">
                  No worksheets yet — finish one to see it here!
                </CardContent>
              </Card>
            ) : (
              <div className="grid gap-3">
                {recent.map((r, i) => {
                  const pct = r.total_questions
                    ? Math.round((100 * r.correct_count) / r.total_questions)
                    : 0;
                  const good = pct >= 80;
                  const cls = good
                    ? "bg-emerald-100 text-emerald-700"
                    : pct >= 50
                      ? "bg-amber-100 text-amber-700"
                      : "bg-rose-100 text-rose-700";
                  return (
                    <Card key={i}>
                      <CardContent className="flex items-center justify-between gap-3 p-4">
                        <div className="min-w-0">
                          <p className="truncate font-semibold text-slate-800">
                            {r.worksheets?.topics?.name ?? r.worksheets?.title ?? "Worksheet"}
                          </p>
                          <p className="text-xs text-slate-500">+{r.points_earned} points</p>
                        </div>
                        <span className={`shrink-0 rounded-full px-3 py-1 text-sm font-bold ${cls}`}>
                          {r.correct_count}/{r.total_questions}
                        </span>
                      </CardContent>
                    </Card>
                  );
                })}
              </div>
            )}
          </section>
        </div>

        <div className="mt-8 text-center">
          <Link
            href="/learn"
            className="inline-flex h-12 items-center justify-center rounded-2xl bg-indigo-600 px-8 text-base font-semibold text-white transition hover:bg-indigo-700"
          >
            Keep learning →
          </Link>
        </div>
      </main>
    </div>
  );
}
