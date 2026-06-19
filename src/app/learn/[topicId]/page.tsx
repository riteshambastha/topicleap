import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { getProgress } from "@/lib/progress";
import { topicIcon, subjectGradient } from "@/lib/topic-icons";
import { Card, CardContent } from "@/components/ui/card";

export default async function TopicModePage({
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

  const { data: lesson } = await supabase
    .from("lessons")
    .select("id")
    .eq("topic_id", topicId)
    .order("sort_order")
    .limit(1)
    .maybeSingle();

  const { data: worksheet } = await supabase
    .from("worksheets")
    .select("id")
    .eq("topic_id", topicId)
    .order("sort_order")
    .limit(1)
    .maybeSingle();

  let questionCount = 0;
  if (worksheet) {
    const { count } = await supabase
      .from("questions")
      .select("id", { count: "exact", head: true })
      .eq("worksheet_id", worksheet.id);
    questionCount = count ?? 0;
  }

  const { completedTopics, bestByTopic } = await getProgress(supabase, child.id);
  const done = completedTopics.has(topicId);
  const best = bestByTopic.get(topicId);

  const modes = [
    {
      key: "learn",
      title: "📘 Learn",
      blurb: "Walk through the lesson step by step.",
      href: `/learn/${topicId}/lesson`,
      show: !!lesson,
    },
    {
      key: "learn-worksheet",
      title: "📘 ➕ 📝 Learn + Worksheet",
      blurb: "Do the lesson, then jump straight into practice.",
      href: `/learn/${topicId}/lesson?then=worksheet`,
      show: !!lesson && !!worksheet,
    },
    {
      key: "worksheet",
      title: "📝 Worksheet only",
      blurb: "Skip ahead and test yourself for points.",
      href: `/learn/${topicId}/worksheet`,
      show: !!worksheet,
    },
  ].filter((m) => m.show);

  return (
    <main className="mx-auto w-full max-w-4xl p-4 sm:p-6">
      <Link
        href={`/learn/subject/${topic.subject_id}`}
        className="text-sm text-slate-500 hover:underline"
      >
        ← Back to topics
      </Link>

      <div className="mt-3 mb-6 flex items-start gap-4">
        <div
          className={`flex h-16 w-16 shrink-0 items-center justify-center rounded-2xl bg-gradient-to-br ${subjectGradient(subjSlug)} text-4xl shadow-sm`}
        >
          {topicIcon(topic.slug, subjSlug)}
        </div>
        <div>
        <div className="flex flex-wrap items-center gap-2">
          <h1 className="text-2xl font-extrabold sm:text-3xl">{topic.name}</h1>
          {topic.standard_code && (
            <span className="rounded-full bg-indigo-50 px-2.5 py-1 text-xs font-semibold text-indigo-700">
              {topic.standard_code}
            </span>
          )}
          {done && (
            <span className="rounded-full bg-teal-100 px-3 py-1 text-xs font-bold text-teal-700">
              ✓ Completed{best != null ? ` · best ${best}%` : ""}
            </span>
          )}
        </div>
        {topic.description && (
          <p className="mt-1 text-slate-600">{topic.description}</p>
        )}
        {questionCount > 0 && (
          <p className="mt-2 text-sm font-medium text-slate-500">
            📝 {questionCount} practice questions
          </p>
        )}
        </div>
      </div>

      <p className="mb-3 font-semibold text-slate-700">How do you want to start?</p>
      <div className="grid gap-3 sm:grid-cols-3">
        {modes.map((m) => (
          <Link key={m.key} href={m.href}>
            <Card className="h-full transition hover:border-indigo-400 hover:shadow-md">
              <CardContent className="p-5">
                <p className="text-lg font-bold">{m.title}</p>
                <p className="mt-1 text-sm text-slate-500">{m.blurb}</p>
              </CardContent>
            </Card>
          </Link>
        ))}
      </div>
    </main>
  );
}
