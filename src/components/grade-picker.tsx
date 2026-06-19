"use client";

const GRADES = [1, 2, 3, 4, 5, 6, 7, 8];

/** A friendly grid of grade pills instead of a plain dropdown. */
export function GradePicker({
  value,
  onChange,
  grades = GRADES,
}: {
  value: number;
  onChange: (g: number) => void;
  grades?: number[];
}) {
  return (
    <div role="group" aria-label="Grade" className="grid grid-cols-4 gap-2">
      {grades.map((g) => {
        const active = g === value;
        return (
          <button
            key={g}
            type="button"
            aria-pressed={active}
            onClick={() => onChange(g)}
            className={`flex flex-col items-center justify-center rounded-xl border-2 py-2 transition ${
              active
                ? "border-indigo-600 bg-indigo-600 text-white shadow-sm"
                : "border-slate-200 bg-white text-slate-700 hover:border-indigo-300 hover:bg-indigo-50"
            }`}
          >
            <span
              className={`text-[10px] font-semibold uppercase tracking-wide ${
                active ? "text-white/80" : "text-slate-400"
              }`}
            >
              Grade
            </span>
            <span className="text-xl font-extrabold leading-none">{g}</span>
          </button>
        );
      })}
    </div>
  );
}
