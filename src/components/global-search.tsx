"use client";

import { useMemo, useState } from "react";
import Link from "next/link";

export interface SearchItem {
  topicId: string;
  name: string;
  subject: string;
  standard: string | null;
  completed: boolean;
}

export function GlobalSearch({ items }: { items: SearchItem[] }) {
  const [q, setQ] = useState("");

  const results = useMemo(() => {
    const query = q.trim().toLowerCase();
    if (!query) return [];
    return items
      .filter((it) =>
        [it.name, it.subject, it.standard ?? ""]
          .join(" ")
          .toLowerCase()
          .includes(query),
      )
      .slice(0, 8);
  }, [q, items]);

  return (
    <div className="relative">
      <div className="relative">
        <span className="pointer-events-none absolute left-4 top-1/2 -translate-y-1/2 text-slate-400">
          🔎
        </span>
        <input
          value={q}
          onChange={(e) => setQ(e.target.value)}
          placeholder="Search any topic, subject, or standard…"
          className="h-12 w-full rounded-2xl border border-slate-300 bg-white pl-11 pr-4 text-base shadow-sm placeholder:text-slate-400 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-400"
        />
      </div>

      {q.trim() && (
        <div className="absolute z-20 mt-2 w-full overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-lg">
          {results.length === 0 ? (
            <p className="px-4 py-3 text-sm text-slate-500">
              No matches for “{q}”.
            </p>
          ) : (
            <ul className="max-h-80 overflow-auto">
              {results.map((it) => (
                <li key={it.topicId}>
                  <Link
                    href={`/learn/${it.topicId}`}
                    className="flex items-center justify-between gap-3 border-b border-slate-100 px-4 py-3 last:border-0 hover:bg-indigo-50"
                  >
                    <span className="min-w-0">
                      <span className="block truncate font-semibold text-slate-800">
                        {it.name}
                      </span>
                      <span className="block text-xs text-slate-500">
                        {it.subject}
                        {it.standard ? ` · ${it.standard}` : ""}
                      </span>
                    </span>
                    {it.completed && (
                      <span className="shrink-0 rounded-full bg-teal-100 px-2.5 py-1 text-xs font-bold text-teal-700">
                        ✓ Done
                      </span>
                    )}
                  </Link>
                </li>
              ))}
            </ul>
          )}
        </div>
      )}
    </div>
  );
}
