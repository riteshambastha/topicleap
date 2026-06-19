import { NextResponse, after } from "next/server";
import { createAdminClient } from "@/lib/supabase/admin";
import { getCurrentChild } from "@/lib/auth";
import { isAnswerCorrect } from "@/lib/grade";
import { regenerateSummary } from "@/lib/summary";
import type { GradeResponse, GradedQuestionResult } from "@/lib/types";

/**
 * Grade a worksheet submission server-side.
 *  - The child is taken from the SESSION (not the request body), so a kid can
 *    only record attempts for themselves.
 *  - Correct answers are read with the service-role key and never returned
 *    until after grading, so they never sit in the browser ahead of time.
 *  - Writes the attempt, per-question answers, and a points_ledger row.
 */
export async function POST(
  req: Request,
  { params }: { params: Promise<{ worksheetId: string }> },
) {
  const { worksheetId } = await params;

  const child = await getCurrentChild();
  if (!child) {
    return NextResponse.json(
      { error: "You must be signed in as a learner." },
      { status: 401 },
    );
  }

  let body: { answers?: { questionId: string; response: string | null }[] };
  try {
    body = await req.json();
  } catch {
    return NextResponse.json({ error: "Invalid request body." }, { status: 400 });
  }
  const submitted = body.answers ?? [];
  const responseByQ = new Map(submitted.map((a) => [a.questionId, a.response]));

  const admin = createAdminClient();

  const { data: questions, error: qErr } = await admin
    .from("questions")
    .select("id, question_type, correct_answer, points, sort_order")
    .eq("worksheet_id", worksheetId)
    .order("sort_order");

  if (qErr || !questions || questions.length === 0) {
    return NextResponse.json(
      { error: "Worksheet has no questions." },
      { status: 404 },
    );
  }

  // Grade.
  const results: GradedQuestionResult[] = [];
  let correctCount = 0;
  let pointsEarned = 0;
  let maxPoints = 0;

  for (const q of questions) {
    maxPoints += q.points;
    const response = responseByQ.get(q.id) ?? null;
    const correct = isAnswerCorrect(
      q.question_type as "mcq" | "fill_in",
      q.correct_answer,
      response,
    );
    const awarded = correct ? q.points : 0;
    if (correct) correctCount += 1;
    pointsEarned += awarded;
    results.push({
      questionId: q.id,
      isCorrect: correct,
      pointsAwarded: awarded,
      correctAnswer: q.correct_answer,
      yourResponse: response ?? "",
    });
  }

  // Persist the attempt.
  const { data: attempt, error: attErr } = await admin
    .from("attempts")
    .insert({
      child_id: child.id,
      worksheet_id: worksheetId,
      status: "completed",
      total_questions: questions.length,
      correct_count: correctCount,
      points_earned: pointsEarned,
      completed_at: new Date().toISOString(),
    })
    .select("id")
    .single();

  if (attErr || !attempt) {
    return NextResponse.json(
      { error: attErr?.message ?? "Could not save attempt." },
      { status: 500 },
    );
  }

  // Persist per-question answers.
  const answerRows = results.map((r) => ({
    attempt_id: attempt.id,
    question_id: r.questionId,
    response: r.yourResponse,
    is_correct: r.isCorrect,
    points_awarded: r.pointsAwarded,
  }));
  const { error: ansErr } = await admin.from("answers").insert(answerRows);
  if (ansErr) {
    return NextResponse.json({ error: ansErr.message }, { status: 500 });
  }

  // Write points to the ledger (leaderboard UI is a later milestone).
  if (pointsEarned > 0) {
    await admin.from("points_ledger").insert({
      child_id: child.id,
      points: pointsEarned,
      source_type: "worksheet_attempt",
      source_id: attempt.id,
      reason: `Worksheet: ${correctCount}/${questions.length} correct`,
    });
  }

  // Refresh the kid's motivational summary AFTER the response is sent,
  // so grading stays fast. Best-effort; failures are swallowed.
  after(async () => {
    await regenerateSummary(createAdminClient(), {
      id: child.id,
      display_name: child.display_name,
      grade_level: child.grade_level,
    });
  });

  const payload: GradeResponse = {
    attemptId: attempt.id,
    correctCount,
    totalQuestions: questions.length,
    pointsEarned,
    maxPoints,
    results,
  };
  return NextResponse.json(payload);
}
