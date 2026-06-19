import { notFound, redirect } from "next/navigation";
import { getCurrentChild } from "@/lib/auth";
import { createClient } from "@/lib/supabase/server";

/**
 * Redirector: sends the kid to the FIRST worksheet of the topic.
 * Used by the "Learn, then practice" flow and any legacy links.
 */
export default async function WorksheetRedirect({
  params,
}: {
  params: Promise<{ topicId: string }>;
}) {
  const { topicId } = await params;
  const child = await getCurrentChild();
  if (!child) redirect("/kids");

  const supabase = await createClient();
  const { data: first } = await supabase
    .from("worksheets")
    .select("id")
    .eq("topic_id", topicId)
    .order("sort_order")
    .limit(1)
    .maybeSingle();

  if (!first) notFound();
  redirect(`/learn/${topicId}/worksheet/${first.id}`);
}
