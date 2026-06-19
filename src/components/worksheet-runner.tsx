"use client";

import { useMemo, useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import type { GradeResponse, PublicQuestion } from "@/lib/types";

const LETTERS = ["A", "B", "C", "D", "E", "F"];

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

  const answeredCount = useMemo(
    () => questions.filter((q) => (responses[q.id] ?? "").trim().length > 0).length,
    [questions, responses],
  );
  const allAnswered = answeredCount === questions.length;
  const progress = Math.round((answeredCount / questions.length) * 100);

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
    const cheer =
      pct >= 90 ? "Amazing! 🌟" : pct >= 70 ? "Great job! 🎉" : pct >= 50 ? "Nice effort! 👍" : "Keep practicing! 💪";
    const heroGrad =
      pct >= 70 ? "from-emerald-500 to-teal-500" : pct >= 50 ? "from-amber-500 to-orange-500" : "from-rose-500 to-pink-500";

    return (
      <div>
        <div className={`mb-6 overflow-hidden rounded-3xl bg-gradient-to-br ${heroGrad} p-8 text-center text-white shadow`}>
          <p className="text-sm font-semibold uppercase tracking-widest text-white/80">
            {cheer}
          </p>
          <p className="mt-2 text-6xl font-extrabold">
            {result.correctCount}/{result.totalQuestions}
          </p>
          <p className="mt-1 text-lg text-white/90">{pct}% correct</p>
          <p className="mt-4 inline-block rounded-full bg-white/25 px-5 py-2 text-xl font-bold backdrop-blur">
            ⭐ +{result.pointsEarned} points
          </p>
        </div>

        <div className="grid gap-3">
          {questions.map((q, idx) => {
            const r = resultById.get(q.id);
            const correct = r?.isCorrect;
            const yourLabel =
              q.question_type === "mcq"
                ? (q.choices?.find((c) => c.id === r?.yourResponse)?.label ?? r?.yourResponse)
                : r?.yourResponse;
            const correctLabel =
              q.question_type === "mcq"
                ? (q.choices?.find((c) => c.id === r?.correctAnswer)?.label ?? r?.correctAnswer)
                : r?.correctAnswer;
            return (
              <div
                key={q.id}
                className={`rounded-2xl border-2 p-5 ${
                  correct ? "border-emerald-300 bg-emerald-50" : "border-rose-300 bg-rose-50"
                }`}
              >
                <div className="flex items-start justify-between gap-3">
                  <p className="font-semibold text-slate-800">
                    {idx + 1}. {q.prompt}
                  </p>
                  <span className="text-2xl">{correct ? "✅" : "❌"}</span>
                </div>
                <p className="mt-2 text-sm text-slate-600">
                  Your answer:{" "}
                  <span className={correct ? "font-semibold text-emerald-700" : "font-semibold text-rose-700"}>
                    {yourLabel || "—"}
                  </span>
                </p>
                {!correct && (
                  <p className="text-sm text-slate-600">
                    Correct answer:{" "}
                    <span className="font-semibold text-emerald-700">{correctLabel}</span>
                  </p>
                )}
              </div>
            );
          })}
        </div>

        <div className="mt-6 flex flex-wrap gap-3">
          <Button variant="outline" size="lg" onClick={() => router.push(`/learn/${topicId}`)}>
            Back to topic
          </Button>
          <Button variant="success" size="lg" onClick={() => router.push("/learn/progress")}>
            📊 See my progress
          </Button>
          <Button
            size="lg"
            onClick={() => {
              setResult(null);
              setResponses({});
              window.scrollTo({ top: 0, behavior: "smooth" });
            }}
          >
            Try again 🔁
          </Button>
        </div>
      </div>
    );
  }

  // ---------- WORKSHEET FORM ----------
  return (
    <div>
      <h1 className="mb-1 text-2xl font-extrabold sm:text-3xl">{title}</h1>
      <p className="mb-4 text-sm text-slate-500">
        Answer all {questions.length} questions, then check your score.
      </p>

      {/* sticky-ish progress */}
      <div className="mb-6">
        <div className="mb-1 flex justify-between text-xs font-semibold text-slate-500">
          <span>{answeredCount} of {questions.length} answered</span>
          <span>{progress}%</span>
        </div>
        <div className="h-2.5 w-full overflow-hidden rounded-full bg-slate-200">
          <div
            className="h-full rounded-full bg-gradient-to-r from-indigo-500 to-violet-500 transition-all"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      <div className="grid gap-4">
        {questions.map((q, idx) => {
          const answered = (responses[q.id] ?? "").trim().length > 0;
          return (
            <div
              key={q.id}
              className={`overflow-hidden rounded-2xl border-2 bg-white transition ${
                answered ? "border-indigo-300" : "border-slate-200"
              }`}
            >
              <div className="flex items-start gap-3 p-5">
                <span
                  className={`flex h-8 w-8 shrink-0 items-center justify-center rounded-full text-sm font-extrabold ${
                    answered ? "bg-indigo-500 text-white" : "bg-slate-100 text-slate-600"
                  }`}
                >
                  {idx + 1}
                </span>
                <div className="min-w-0 flex-1">
                  <p className="text-lg font-bold text-slate-900">{q.prompt}</p>

                  {q.question_type === "mcq" && q.choices ? (
                    <div className="mt-3 grid gap-2 sm:grid-cols-2">
                      {q.choices.map((c, ci) => {
                        const chosen = responses[q.id] === c.id;
                        return (
                          <button
                            key={c.id}
                            type="button"
                            onClick={() => setResponse(q.id, c.id)}
                            className={`flex items-center gap-3 rounded-xl border-2 px-4 py-3 text-left text-base font-semibold transition ${
                              chosen
                                ? "border-indigo-500 bg-indigo-50 text-indigo-900"
                                : "border-slate-200 bg-white text-slate-700 hover:border-indigo-300 hover:bg-indigo-50/50"
                            }`}
                          >
                            <span
                              className={`flex h-7 w-7 shrink-0 items-center justify-center rounded-full text-sm font-extrabold ${
                                chosen ? "bg-indigo-500 text-white" : "bg-slate-100 text-slate-600"
                              }`}
                            >
                              {LETTERS[ci]}
                            </span>
                            {c.label}
                          </button>
                        );
                      })}
                    </div>
                  ) : (
                    <Input
                      className="mt-3 max-w-xs text-lg"
                      inputMode="text"
                      placeholder="Type your answer"
                      value={responses[q.id] ?? ""}
                      onChange={(e) => setResponse(q.id, e.target.value)}
                    />
                  )}
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {error && <p className="mt-4 text-sm text-rose-600">{error}</p>}

      <div className="mt-6">
        <Button size="lg" onClick={submit} disabled={!allAnswered || submitting}>
          {submitting ? "Checking…" : "Check my answers ✨"}
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
