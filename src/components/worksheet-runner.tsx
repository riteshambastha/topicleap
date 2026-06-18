"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import type { GradeResponse, PublicQuestion } from "@/lib/types";

export function WorksheetRunner({
  worksheetId,
  topicId,
  title,
  questions,
}: {
  worksheetId: string;
  topicId: string;
  title: string;
  questions: PublicQuestion[];
}) {
  const router = useRouter();
  const [responses, setResponses] = useState<Record<string, string>>({});
  const [result, setResult] = useState<GradeResponse | null>(null);
  const [submitting, setSubmitting] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const allAnswered = useMemo(
    () => questions.every((q) => (responses[q.id] ?? "").trim().length > 0),
    [questions, responses],
  );

  function setResponse(id: string, value: string) {
    setResponses((r) => ({ ...r, [id]: value }));
  }

  async function submit() {
    setSubmitting(true);
    setError(null);
    const res = await fetch(`/api/worksheets/${worksheetId}/grade`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        answers: questions.map((q) => ({
          questionId: q.id,
          response: responses[q.id] ?? null,
        })),
      }),
    });
    const data = await res.json();
    setSubmitting(false);
    if (!res.ok) {
      setError(data.error ?? "Could not grade worksheet.");
      return;
    }
    setResult(data as GradeResponse);
    window.scrollTo({ top: 0, behavior: "smooth" });
  }

  // ---------- RESULTS SCREEN ----------
  if (result) {
    const pct = Math.round((result.correctCount / result.totalQuestions) * 100);
    const resultById = new Map(result.results.map((r) => [r.questionId, r]));
    return (
      <div>
        <Card className="mb-6 border-indigo-200 bg-indigo-50">
          <CardContent className="p-6 text-center">
            <p className="text-sm font-semibold uppercase tracking-wide text-indigo-600">
              Results
            </p>
            <p className="mt-1 text-5xl font-extrabold text-indigo-700">
              {result.correctCount}/{result.totalQuestions}
            </p>
            <p className="mt-1 text-slate-600">{pct}% correct</p>
            <p className="mt-4 inline-block rounded-full bg-amber-100 px-4 py-1.5 text-lg font-bold text-amber-700">
              ⭐ +{result.pointsEarned} points
            </p>
          </CardContent>
        </Card>

        <div className="grid gap-3">
          {questions.map((q, idx) => {
            const r = resultById.get(q.id);
            const correct = r?.isCorrect;
            const yourLabel =
              q.question_type === "mcq"
                ? (q.choices?.find((c) => c.id === r?.yourResponse)?.label ??
                  r?.yourResponse)
                : r?.yourResponse;
            const correctLabel =
              q.question_type === "mcq"
                ? (q.choices?.find((c) => c.id === r?.correctAnswer)?.label ??
                  r?.correctAnswer)
                : r?.correctAnswer;
            return (
              <Card
                key={q.id}
                className={correct ? "border-emerald-300" : "border-red-300"}
              >
                <CardContent className="p-5">
                  <div className="flex items-start justify-between gap-3">
                    <p className="font-semibold">
                      {idx + 1}. {q.prompt}
                    </p>
                    <span className="text-xl">{correct ? "✅" : "❌"}</span>
                  </div>
                  <p className="mt-2 text-sm text-slate-600">
                    Your answer:{" "}
                    <span className={correct ? "text-emerald-700" : "text-red-700"}>
                      {yourLabel || "—"}
                    </span>
                  </p>
                  {!correct && (
                    <p className="text-sm text-slate-600">
                      Correct answer:{" "}
                      <span className="font-semibold text-emerald-700">
                        {correctLabel}
                      </span>
                    </p>
                  )}
                </CardContent>
              </Card>
            );
          })}
        </div>

        <div className="mt-6 flex gap-3">
          <Button variant="outline" onClick={() => router.push("/learn")}>
            Back to topics
          </Button>
          <Button
            onClick={() => {
              setResult(null);
              setResponses({});
            }}
          >
            Try again
          </Button>
        </div>
      </div>
    );
  }

  // ---------- WORKSHEET FORM ----------
  return (
    <div>
      <h1 className="mb-1 text-2xl font-extrabold">{title}</h1>
      <p className="mb-5 text-sm text-slate-500">
        Answer all {questions.length} questions, then check your score.
      </p>

      <div className="grid gap-4">
        {questions.map((q, idx) => (
          <Card key={q.id}>
            <CardContent className="p-5">
              <p className="font-semibold">
                {idx + 1}. {q.prompt}
              </p>

              {q.question_type === "mcq" && q.choices ? (
                <div className="mt-3 grid gap-2 sm:grid-cols-2">
                  {q.choices.map((c) => {
                    const chosen = responses[q.id] === c.id;
                    return (
                      <button
                        key={c.id}
                        type="button"
                        onClick={() => setResponse(q.id, c.id)}
                        className={`rounded-xl border px-4 py-2.5 text-left font-medium transition ${
                          chosen
                            ? "border-indigo-500 bg-indigo-50"
                            : "border-slate-300 bg-white hover:bg-slate-100"
                        }`}
                      >
                        {c.label}
                      </button>
                    );
                  })}
                </div>
              ) : (
                <Input
                  className="mt-3 max-w-xs"
                  inputMode="numeric"
                  placeholder="Type your answer"
                  value={responses[q.id] ?? ""}
                  onChange={(e) => setResponse(q.id, e.target.value)}
                />
              )}
            </CardContent>
          </Card>
        ))}
      </div>

      {error && <p className="mt-4 text-sm text-red-600">{error}</p>}

      <div className="mt-6">
        <Button size="lg" onClick={submit} disabled={!allAnswered || submitting}>
          {submitting ? "Checking…" : "Check my answers"}
        </Button>
        {!allAnswered && (
          <p className="mt-2 text-sm text-slate-500">
            Answer every question to check your score.
          </p>
        )}
      </div>
    </div>
  );
}
