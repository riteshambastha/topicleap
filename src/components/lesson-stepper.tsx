"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import type { LessonStep } from "@/lib/types";

const TYPE_STYLE: Record<
  string,
  { label: string; emoji: string; badge: string; accent: string }
> = {
  explain: {
    label: "Learn",
    emoji: "📘",
    badge: "bg-sky-100 text-sky-800",
    accent: "from-sky-400 to-blue-500",
  },
  worked_example: {
    label: "Example",
    emoji: "✏️",
    badge: "bg-amber-100 text-amber-800",
    accent: "from-amber-400 to-orange-500",
  },
  check: {
    label: "Quick check",
    emoji: "🧠",
    badge: "bg-violet-100 text-violet-800",
    accent: "from-violet-500 to-fuchsia-500",
  },
};

const LETTERS = ["A", "B", "C", "D", "E", "F"];

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
  const style = TYPE_STYLE[step.type] ?? TYPE_STYLE.explain;
  const progress = Math.round(((i + 1) / steps.length) * 100);

  function next() {
    if (isLast) {
      router.push(
        then === "worksheet" ? `/learn/${topicId}/worksheet` : `/learn/${topicId}`,
      );
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
      <div className="mb-5">
        <div className="mb-1.5 flex justify-between text-sm font-semibold text-slate-500">
          <span>
            Step {i + 1} of {steps.length}
          </span>
          <span>{progress}%</span>
        </div>
        <div className="h-3 w-full overflow-hidden rounded-full bg-slate-200">
          <div
            className={`h-full rounded-full bg-gradient-to-r ${style.accent} transition-all`}
            style={{ width: `${progress}%` }}
          />
        </div>
      </div>

      <Card className="overflow-hidden">
        {/* colorful top strip */}
        <div className={`h-2 w-full bg-gradient-to-r ${style.accent}`} />
        <CardContent className="p-6 sm:p-8">
          <span
            className={`inline-flex items-center gap-1.5 rounded-full px-4 py-1.5 text-sm font-bold ${style.badge}`}
          >
            <span>{style.emoji}</span>
            {style.label}
          </span>
          <h2 className="mt-4 text-2xl font-extrabold tracking-tight text-slate-900 sm:text-3xl">
            {step.title}
          </h2>
          <p className="mt-3 whitespace-pre-line text-lg leading-relaxed text-slate-700 sm:text-xl">
            {step.body}
          </p>

          {step.type === "check" && step.prompt && step.choices && (
            <div className="mt-6 rounded-2xl border-2 border-violet-200 bg-gradient-to-br from-violet-50 to-fuchsia-50 p-5 sm:p-6">
              <p className="text-xl font-extrabold text-violet-900 sm:text-2xl">
                {step.prompt}
              </p>
              <div className="mt-4 grid gap-3 sm:grid-cols-2">
                {step.choices.map((c, idx) => {
                  const chosen = picked === c.id;
                  const isCorrect = c.id === step.answer;
                  let cls =
                    "border-slate-200 bg-white hover:border-violet-400 hover:bg-violet-50";
                  let chip = "bg-violet-100 text-violet-700";
                  if (picked) {
                    if (isCorrect) {
                      cls = "border-emerald-500 bg-emerald-50";
                      chip = "bg-emerald-500 text-white";
                    } else if (chosen) {
                      cls = "border-red-400 bg-red-50";
                      chip = "bg-red-400 text-white";
                    } else {
                      cls = "border-slate-200 bg-white opacity-60";
                    }
                  }
                  return (
                    <button
                      key={c.id}
                      type="button"
                      disabled={!!picked}
                      onClick={() => setPicked(c.id)}
                      className={`flex items-center gap-3 rounded-2xl border-2 px-5 py-4 text-left text-xl font-bold text-slate-800 shadow-sm transition ${cls}`}
                    >
                      <span
                        className={`flex h-9 w-9 shrink-0 items-center justify-center rounded-full text-base font-extrabold ${chip}`}
                      >
                        {LETTERS[idx]}
                      </span>
                      {c.label}
                    </button>
                  );
                })}
              </div>
              {picked && (
                <div
                  className={`mt-5 rounded-xl p-4 text-lg font-semibold ${
                    picked === step.answer
                      ? "bg-emerald-100 text-emerald-800"
                      : "bg-red-100 text-red-800"
                  }`}
                >
                  {picked === step.answer ? "🎉 Nice work! " : "🤔 Not quite — "}
                  {step.explanation}
                </div>
              )}
            </div>
          )}
        </CardContent>
      </Card>

      <div className="mt-6 flex justify-between">
        <Button variant="outline" size="lg" onClick={back} disabled={i === 0}>
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
