import Link from "next/link";
import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";
import { LessonStepper } from "@/components/lesson-stepper";
import type { LessonStep } from "@/lib/types";

export default async function LessonPage({
  params,
  searchParams,
}: {
  params: Promise<{ topicId: string }>;
  searchParams: Promise<{ then?: string }>;
}) {
  const { topicId } = await params;
  const { then } = await searchParams;

  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: lesson } = await supabase
    .from("lessons")
    .select("id, title, steps")
    .eq("topic_id", topicId)
    .order("sort_order")
    .limit(1)
    .maybeSingle();

  if (!lesson) notFound();
  const steps = (lesson.steps ?? []) as LessonStep[];

  return (
    <main className="mx-auto w-full max-w-2xl p-6">
      <Link
        href={`/learn/${topicId}`}
        className="text-sm text-slate-500 hover:underline"
      >
        ← Exit lesson
      </Link>
      <h1 className="mt-3 mb-5 text-2xl font-extrabold">{lesson.title}</h1>
      <LessonStepper steps={steps} topicId={topicId} then={then} />
    </main>
  );
}
