import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
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
    .select("id, name, description, standard_code")
    .eq("id", topicId)
    .maybeSingle();
  if (!topic) notFound();

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
      title: "📘➕📝 Learn + Worksheet",
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
    <main className="mx-auto w-full max-w-2xl p-6">
      <Link href="/learn" className="text-sm text-slate-500 hover:underline">
        ← Back to topics
      </Link>
      <div className="mt-3 mb-6">
        <h1 className="text-2xl font-extrabold">{topic.name}</h1>
        {topic.description && (
          <p className="mt-1 text-slate-600">{topic.description}</p>
        )}
      </div>

      <p className="mb-3 font-semibold text-slate-700">How do you want to start?</p>
      <div className="grid gap-3">
        {modes.map((m) => (
          <Link key={m.key} href={m.href}>
            <Card className="transition hover:border-indigo-400 hover:shadow-md">
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
