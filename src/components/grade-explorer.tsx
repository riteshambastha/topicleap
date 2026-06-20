"use client";

import { useRouter } from "next/navigation";
import { VIEW_GRADE_COOKIE } from "@/lib/view-grade-cookie";
import { gradeShort, gradeLabel } from "@/lib/grade-label";

const GRADES = [0, 1, 2, 3, 4, 5, 6, 7, 8];

/**
 * Lets a kid browse other grades "for fun" without changing their home grade.
 * Grades with content are tappable; empty ones show "soon". The choice is
 * stored in a cookie so the server pages render that grade's topics.
 */
export function GradeExplorer({
  homeGrade,
  viewGrade,
  availableGrades,
}: {
  homeGrade: number;
  viewGrade: number;
  availableGrades: number[];
}) {
  const router = useRouter();
  const available = new Set(availableGrades);

  function pick(g: number) {
    if (g === viewGrade) return;
    // session-ish cookie for browsing; cleared after 30 days
    document.cookie = `${VIEW_GRADE_COOKIE}=${g}; path=/; max-age=${60 * 60 * 24 * 30}`;
    router.refresh();
  }

  function reset() {
    document.cookie = `${VIEW_GRADE_COOKIE}=; path=/; max-age=0`;
    router.refresh();
  }

  return (
    <div className="rounded-2xl border border-white/60 bg-white/70 p-4 backdrop-blur">
      <div className="mb-2 flex items-center justify-between">
        <p className="text-sm font-bold text-slate-700">
          🔭 Explore a grade
          {viewGrade !== homeGrade && (
            <span className="ml-2 rounded-full bg-amber-100 px-2 py-0.5 text-xs font-bold text-amber-700">
              exploring {gradeLabel(viewGrade)}
            </span>
          )}
        </p>
        {viewGrade !== homeGrade && (
          <button
            type="button"
            onClick={reset}
            className="text-xs font-semibold text-indigo-600 hover:underline"
          >
            ⌂ Back to my grade ({gradeShort(homeGrade)})
          </button>
        )}
      </div>
      <div className="grid grid-cols-5 gap-2 sm:grid-cols-9">
        {GRADES.map((g) => {
          const isHome = g === homeGrade;
          const active = g === viewGrade;
          const has = available.has(g);
          return (
            <button
              key={g}
              type="button"
              disabled={!has}
              onClick={() => pick(g)}
              title={
                has
                  ? `${gradeLabel(g)}${isHome ? " (your grade)" : ""}`
                  : `${gradeLabel(g)} — coming soon`
              }
              className={`relative flex flex-col items-center justify-center rounded-xl border-2 py-1.5 text-sm font-extrabold transition ${
                active
                  ? "border-indigo-600 bg-indigo-600 text-white"
                  : has
                    ? "border-slate-200 bg-white text-slate-700 hover:border-indigo-300 hover:bg-indigo-50"
                    : "cursor-not-allowed border-slate-100 bg-slate-50 text-slate-300"
              }`}
            >
              {gradeShort(g)}
              {isHome && (
                <span className="absolute -right-1 -top-1 text-[10px]">⭐</span>
              )}
              {!has && (
                <span className="text-[8px] font-semibold uppercase tracking-tight">
                  soon
                </span>
              )}
            </button>
          );
        })}
      </div>
    </div>
  );
}
