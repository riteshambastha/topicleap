import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentParent } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { LogoutButton } from "@/components/logout-button";
import { EditChildForm } from "@/components/edit-child-form";
import { gradeLabel } from "@/lib/grade-label";
import { Logo } from "@/components/logo";
import { Card, CardContent } from "@/components/ui/card";

type AttemptRow = {
  id: string;
  status: string;
  total_questions: number;
  correct_count: number;
  points_earned: number;
  completed_at: string | null;
  started_at: string;
  worksheets: { title: string; topics: { name: string } | null } | null;
};

function pct(n: number, d: number) {
  return d > 0 ? Math.round((n / d) * 100) : 0;
}

function fmtDate(iso: string | null) {
  if (!iso) return "—";
  return new Date(iso).toLocaleDateString(undefined, {
    month: "short",
    day: "numeric",
    year: "numeric",
  });
}

export default async function ChildReportPage({
  params,
}: {
  params: Promise<{ childId: string }>;
}) {
  const { childId } = await params;

  const parent = await getCurrentParent();
  if (!parent) redirect("/login");

  const supabase = await createClient();

  // RLS ensures this only returns a child in the parent's own family.
  const { data: child } = await supabase
    .from("children")
    .select("id, username, display_name, grade_level")
    .eq("id", childId)
    .maybeSingle();
  if (!child) notFound();

  const { data: attemptsData } = await supabase
    .from("attempts")
    .select(
      "id, status, total_questions, correct_count, points_earned, completed_at, started_at, worksheets(title, topics(name))",
    )
    .eq("child_id", childId)
    .order("completed_at", { ascending: false });

  const attempts = (attemptsData ?? []) as unknown as AttemptRow[];

  const { data: ledger } = await supabase
    .from("points_ledger")
    .select("points")
    .eq("child_id", childId);

  // ---- aggregate stats ----
  const totalPoints = (ledger ?? []).reduce((a, r) => a + (r.points ?? 0), 0);
  const worksheetsDone = attempts.length;
  const totalQuestions = attempts.reduce((a, r) => a + r.total_questions, 0);
  const totalCorrect = attempts.reduce((a, r) => a + r.correct_count, 0);
  const accuracy = pct(totalCorrect, totalQuestions);
  const bestScore = attempts.reduce(
    (best, r) => Math.max(best, pct(r.correct_count, r.total_questions)),
    0,
  );

  const stats = [
    { label: "Points earned", value: totalPoints, suffix: "⭐", tint: "from-amber-400 to-orange-500" },
    { label: "Worksheets done", value: worksheetsDone, suffix: "", tint: "from-indigo-400 to-violet-500" },
    { label: "Accuracy", value: `${accuracy}%`, suffix: "", tint: "from-emerald-400 to-teal-500" },
    { label: "Best score", value: `${bestScore}%`, suffix: "", tint: "from-sky-400 to-blue-500" },
  ];

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-200 bg-white px-4 py-4 sm:px-6">
        <Link href="/parent" className="inline-flex items-center gap-1.5" aria-label="Back to parent dashboard">
          <span className="text-slate-400">←</span>
          <Logo iconClass="h-7 w-7" textClass="text-lg" />
          <span className="text-sm font-semibold text-slate-400">· Parent</span>
        </Link>
        <div className="flex items-center gap-3">
          <span className="hidden text-sm text-slate-500 sm:inline">
            {parent.email}
          </span>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto w-full max-w-5xl flex-1 p-4 sm:p-6">
        {/* hero */}
        <Card className="mb-6 overflow-hidden">
          <div className="h-2 w-full bg-gradient-to-r from-indigo-500 to-violet-500" />
          <CardContent className="flex flex-col items-start gap-4 p-5 sm:flex-row sm:items-center sm:gap-5 sm:p-7">
            <div className="flex h-16 w-16 shrink-0 items-center justify-center rounded-2xl bg-indigo-100 text-4xl">
              🎒
            </div>
            <div className="min-w-0 flex-1">
              <h1 className="text-2xl font-extrabold tracking-tight sm:text-3xl">
                {child.display_name}
              </h1>
              <p className="text-slate-500">
                @{child.username} · {gradeLabel(child.grade_level)}
              </p>
            </div>
            <div className="rounded-2xl bg-amber-50 px-5 py-3 text-center">
              <p className="text-3xl font-extrabold text-amber-600 sm:text-4xl">
                {totalPoints}
              </p>
              <p className="text-xs font-semibold uppercase tracking-wide text-amber-700">
                points
              </p>
            </div>
          </CardContent>
        </Card>

        {/* edit details */}
        <Card className="mb-6">
          <CardContent className="p-5">
            <EditChildForm
              childId={child.id}
              initialDisplayName={child.display_name}
              initialUsername={child.username}
              initialGrade={child.grade_level}
            />
          </CardContent>
        </Card>

        {/* stat cards */}
        <div className="mb-8 grid grid-cols-2 gap-3 sm:gap-4 lg:grid-cols-4">
          {stats.map((s) => (
            <Card key={s.label} className="overflow-hidden">
              <div className={`h-1.5 w-full bg-gradient-to-r ${s.tint}`} />
              <CardContent className="p-4 sm:p-5">
                <p className="text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl">
                  {s.value}
                  {s.suffix && <span className="ml-1 text-xl">{s.suffix}</span>}
                </p>
                <p className="mt-1 text-sm font-medium text-slate-500">
                  {s.label}
                </p>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* attempt history */}
        <h2 className="mb-3 text-lg font-bold text-slate-700">Worksheet history</h2>
        {attempts.length === 0 ? (
          <Card>
            <CardContent className="p-6 text-center text-slate-500">
              No worksheets completed yet. Once {child.display_name} finishes a
              worksheet, it&apos;ll show up here.
            </CardContent>
          </Card>
        ) : (
          <div className="grid gap-3">
            {attempts.map((a) => {
              const score = pct(a.correct_count, a.total_questions);
              const good = score >= 80;
              const ok = score >= 50 && score < 80;
              const scoreCls = good
                ? "bg-emerald-100 text-emerald-700"
                : ok
                  ? "bg-amber-100 text-amber-700"
                  : "bg-red-100 text-red-700";
              return (
                <Card key={a.id}>
                  <CardContent className="flex flex-col gap-3 p-4 sm:flex-row sm:items-center sm:justify-between sm:p-5">
                    <div className="min-w-0">
                      <p className="truncate font-bold text-slate-900">
                        {a.worksheets?.title ?? "Worksheet"}
                      </p>
                      <p className="text-sm text-slate-500">
                        {a.worksheets?.topics?.name ?? ""} · {fmtDate(a.completed_at ?? a.started_at)}
                      </p>
                    </div>
                    <div className="flex items-center gap-3">
                      <span className="rounded-full bg-amber-50 px-3 py-1 text-sm font-bold text-amber-600">
                        +{a.points_earned} ⭐
                      </span>
                      <span
                        className={`rounded-full px-3 py-1 text-sm font-bold ${scoreCls}`}
                      >
                        {a.correct_count}/{a.total_questions} · {score}%
                      </span>
                    </div>
                  </CardContent>
                </Card>
              );
            })}
          </div>
        )}
      </main>
    </div>
  );
}
