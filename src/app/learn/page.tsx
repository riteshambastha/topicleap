import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { LogoutButton } from "@/components/logout-button";
import { Card, CardContent } from "@/components/ui/card";

export default async function LearnHome() {
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: subjects } = await supabase
    .from("subjects")
    .select("id, name, slug")
    .order("sort_order");

  // Topics for this learner's grade level.
  const { data: topics } = await supabase
    .from("topics")
    .select("id, name, description, standard_code, subject_id")
    .eq("grade_level", child.grade_level)
    .order("sort_order");

  const topicsBySubject = new Map<string, typeof topics>();
  for (const t of topics ?? []) {
    const arr = topicsBySubject.get(t.subject_id) ?? [];
    arr.push(t);
    topicsBySubject.set(t.subject_id, arr);
  }

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-2 border-b border-slate-200 bg-white px-4 py-4 sm:px-6">
        <span className="text-lg font-bold text-indigo-700">TopicLeap</span>
        <div className="flex items-center gap-3">
          <span className="text-sm text-slate-500">
            Hi, {child.display_name}! · Grade {child.grade_level}
          </span>
          <LogoutButton />
        </div>
      </header>

      <main className="mx-auto w-full max-w-5xl flex-1 p-4 sm:p-6">
        <h1 className="mb-6 text-2xl font-extrabold sm:text-3xl">
          What do you want to learn?
        </h1>

        {(subjects ?? []).map((subject) => {
          const subjectTopics = topicsBySubject.get(subject.id) ?? [];
          if (subjectTopics.length === 0) return null;
          return (
            <section key={subject.id} className="mb-8">
              <h2 className="mb-3 text-lg font-bold text-slate-700">
                {subject.name}
              </h2>
              <div className="grid gap-3 sm:grid-cols-2">
                {subjectTopics.map((t) => (
                  <Link key={t.id} href={`/learn/${t.id}`}>
                    <Card className="transition hover:border-indigo-400 hover:shadow-md">
                      <CardContent className="p-5">
                        <div className="flex items-center justify-between">
                          <p className="text-lg font-bold">{t.name}</p>
                          {t.standard_code && (
                            <span className="rounded-full bg-indigo-50 px-2.5 py-1 text-xs font-semibold text-indigo-700">
                              {t.standard_code}
                            </span>
                          )}
                        </div>
                        {t.description && (
                          <p className="mt-1 text-sm text-slate-500">
                            {t.description}
                          </p>
                        )}
                      </CardContent>
                    </Card>
                  </Link>
                ))}
              </div>
            </section>
          );
        })}

        {(topics ?? []).length === 0 && (
          <p className="text-slate-500">
            No topics for your grade yet — check back soon!
          </p>
        )}
      </main>
    </div>
  );
}
