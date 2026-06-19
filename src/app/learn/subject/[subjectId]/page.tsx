import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress } from "@/lib/progress";
import { topicIcon, subjectGradient } from "@/lib/topic-icons";
import { LogoutButton } from "@/components/logout-button";

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

  const { data: topics } = await supabase
    .from("topics")
    .select("id, slug, name, description, standard_code")
    .eq("subject_id", subjectId)
    .eq("grade_level", child.grade_level)
    .order("sort_order");

  const { completedTopics, bestByTopic } = await getProgress(supabase, child.id);
  const grad = subjectGradient(subject.slug);

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-2 border-b border-slate-200 bg-white px-4 py-4 sm:px-6">
        <Link href="/learn" className="text-lg font-bold text-indigo-700">
          ← TopicLeap
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
