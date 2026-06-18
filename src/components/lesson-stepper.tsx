"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import type { LessonStep } from "@/lib/types";

const TYPE_BADGE: Record<string, { label: string; cls: string }> = {
  explain: { label: "Learn", cls: "bg-sky-50 text-sky-700" },
  worked_example: { label: "Example", cls: "bg-amber-50 text-amber-700" },
  check: { label: "Quick check", cls: "bg-violet-50 text-violet-700" },
};

export function LessonStepper({
  steps,
  topicId,
  then,
}: {
  steps: LessonStep[];
  topicId: string;
  then?: string;
}) {
  const router = useRouter();
  const [i, setI] = useState(0);
  const [picked, setPicked] = useState<string | null>(null);

  const step = steps[i];
  const isLast = i === steps.length - 1;
  const badge = TYPE_BADGE[step.type] ?? TYPE_BADGE.explain;
  const progress = Math.round(((i + 1) / steps.length) * 100);

  function next() {
    if (isLast) {
      router.push(then === "worksheet" ? `/learn/${topicId}/worksheet` : `/learn/${topicId}`);
      return;
    }
    setPicked(null);
    setI((n) => n + 1);
  }
  function back() {
    if (i === 0) return;
    setPicked(null);
    setI((n) => n - 1);
  }

  return (
    <div>
      {/* progress */}
      <div className="mb-4">
        <div className="mb-1 flex justify-between text-xs text-slate-500">
          <span>
            Step {i + 1} of {steps.length}
          </span>
          <span>{progress}%</span>
        </div>
        <div className="h-2 w-full overflow-hidden rounded-full bg-slate-200">
          <div
            className="h-full rounded-full bg-indigo-600 transition-all"
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      <Card>
        <CardContent className="p-6">
          <span
            className={`inline-block rounded-full px-2.5 py-1 text-xs font-semibold ${badge.cls}`}
          >
            {badge.label}
          </span>
          <h2 className="mt-3 text-xl font-bold">{step.title}</h2>
          <p className="mt-2 whitespace-pre-line leading-relaxed text-slate-700">
            {step.body}
          </p>

          {step.type === "check" && step.prompt && step.choices && (
            <div className="mt-5 rounded-xl bg-slate-50 p-4">
              <p className="font-semibold">{step.prompt}</p>
              <div className="mt-3 grid gap-2">
                {step.choices.map((c) => {
                  const chosen = picked === c.id;
                  const isCorrect = c.id === step.answer;
                  let cls = "border-slate-300 bg-white hover:bg-slate-100";
                  if (picked) {
                    if (isCorrect) cls = "border-emerald-500 bg-emerald-50";
                    else if (chosen) cls = "border-red-400 bg-red-50";
                    else cls = "border-slate-200 bg-white opacity-70";
                  }
                  return (
                    <button
                      key={c.id}
                      type="button"
                      disabled={!!picked}
                      onClick={() => setPicked(c.id)}
                      className={`rounded-xl border px-4 py-2.5 text-left font-medium transition ${cls}`}
                    >
                      {c.label}
                    </button>
                  );
                })}
              </div>
              {picked && (
                <p
                  className={`mt-3 text-sm font-medium ${
                    picked === step.answer ? "text-emerald-700" : "text-red-700"
                  }`}
                >
                  {picked === step.answer ? "✅ Nice!" : "Not quite — "}
                  {step.explanation}
                </p>
              )}
            </div>
          )}
        </CardContent>
      </Card>

      <div className="mt-5 flex justify-between">
        <Button variant="outline" onClick={back} disabled={i === 0}>
          ← Back
        </Button>
        <Button onClick={next} size="lg">
          {isLast
            ? then === "worksheet"
              ? "Start worksheet →"
              : "Finish 🎉"
            : "Next →"}
        </Button>
      </div>
    </div>
  );
}
