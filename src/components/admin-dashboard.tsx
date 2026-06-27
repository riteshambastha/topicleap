"use client";

import { useState } from "react";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import type { AdminData, Family } from "@/lib/admin-data";

function fmtDate(iso: string | null): string {
  if (!iso) return "—";
  return new Date(iso).toLocaleDateString(undefined, {
    year: "numeric",
    month: "short",
    day: "numeric",
  });
}

function gradeLabel(g: number): string {
  return g === 0 ? "Kindergarten" : `Grade ${g}`;
}

type Tab = "families" | "feedback" | "referrals";

export function AdminDashboard({ data }: { data: AdminData }) {
  const router = useRouter();
  const [tab, setTab] = useState<Tab>("families");

  async function logout() {
    await fetch("/api/admin/logout", { method: "POST" });
    router.replace("/admin/login");
    router.refresh();
  }

  const tabs: { id: Tab; label: string; count: number }[] = [
    { id: "families", label: "Families", count: data.stats.parents },
    { id: "feedback", label: "Feedback", count: data.stats.feedback },
    { id: "referrals", label: "Referrals", count: data.referrals.length },
  ];

  const statCards = [
    { label: "Parents", value: data.stats.parents },
    { label: "Signed in", value: data.stats.signedInParents },
    { label: "Learners", value: data.stats.kids },
    { label: "Worksheets done", value: data.stats.worksheetsCompleted },
    { label: "Feedback", value: data.stats.feedback },
    { label: "Referrals rewarded", value: data.stats.referralsRewarded },
  ];

  return (
    <div className="min-h-screen bg-slate-100">
      {/* top bar */}
      <header className="border-b border-slate-200 bg-slate-900 text-white">
        <div className="mx-auto flex max-w-6xl items-center justify-between px-4 py-4 sm:px-6">
          <div className="flex items-center gap-2">
            <span className="font-display text-lg font-extrabold">
              TopicLeap
            </span>
            <span className="rounded-full bg-white/15 px-2 py-0.5 text-xs font-bold">
              Admin
            </span>
          </div>
          <Button
            variant="ghost"
            size="sm"
            onClick={logout}
            className="text-white hover:bg-white/10"
          >
            Log out
          </Button>
        </div>
      </header>

      <main className="mx-auto max-w-6xl px-4 py-6 sm:px-6">
        {/* stat strip */}
        <div className="grid grid-cols-2 gap-3 sm:grid-cols-3 lg:grid-cols-6">
          {statCards.map((s) => (
            <div
              key={s.label}
              className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm"
            >
              <div className="font-display text-2xl font-extrabold text-slate-900">
                {s.value}
              </div>
              <div className="text-xs font-medium text-slate-500">
                {s.label}
              </div>
            </div>
          ))}
        </div>

        {/* tabs */}
        <div className="mt-6 flex gap-2 border-b border-slate-200">
          {tabs.map((t) => (
            <button
              key={t.id}
              onClick={() => setTab(t.id)}
              className={`-mb-px border-b-2 px-4 py-2.5 text-sm font-semibold transition ${
                tab === t.id
                  ? "border-indigo-600 text-indigo-700"
                  : "border-transparent text-slate-500 hover:text-slate-800"
              }`}
            >
              {t.label}{" "}
              <span className="ml-1 rounded-full bg-slate-200 px-1.5 text-xs text-slate-600">
                {t.count}
              </span>
            </button>
          ))}
        </div>

        <div className="mt-6">
          {tab === "families" && <FamiliesTab families={data.families} />}
          {tab === "feedback" && <FeedbackTab rows={data.feedback} />}
          {tab === "referrals" && <ReferralsTab rows={data.referrals} />}
        </div>
      </main>
    </div>
  );
}

function Empty({ text }: { text: string }) {
  return (
    <div className="rounded-2xl border border-dashed border-slate-300 bg-white p-10 text-center text-slate-500">
      {text}
    </div>
  );
}

function FamiliesTab({ families }: { families: Family[] }) {
  if (families.length === 0) return <Empty text="No parents yet." />;
  return (
    <div className="grid gap-4">
      {families.map((f) => (
        <div
          key={f.parentId}
          className="overflow-hidden rounded-2xl border border-slate-200 bg-white shadow-sm"
        >
          <div className="flex flex-wrap items-center justify-between gap-2 border-b border-slate-100 bg-slate-50 px-5 py-3">
            <div>
              <div className="font-semibold text-slate-900">
                {f.displayName}{" "}
                <span className="font-normal text-slate-500">· {f.email}</span>
              </div>
              <div className="text-xs text-slate-500">
                Joined {fmtDate(f.joinedAt)} · Last sign-in{" "}
                {f.lastSignInAt ? (
                  fmtDate(f.lastSignInAt)
                ) : (
                  <span className="font-semibold text-amber-600">Never</span>
                )}
              </div>
            </div>
            <span className="rounded-full bg-indigo-50 px-2.5 py-1 text-xs font-bold text-indigo-700">
              {f.kids.length} {f.kids.length === 1 ? "learner" : "learners"}
            </span>
          </div>

          {f.kids.length === 0 ? (
            <div className="px-5 py-4 text-sm text-slate-400">
              No learners added yet.
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-left text-sm">
                <thead className="text-xs uppercase tracking-wide text-slate-400">
                  <tr>
                    <th className="px-5 py-2 font-semibold">Learner</th>
                    <th className="px-3 py-2 font-semibold">Grade</th>
                    <th className="px-3 py-2 font-semibold">Worksheets</th>
                    <th className="px-3 py-2 font-semibold">Questions</th>
                    <th className="px-3 py-2 font-semibold">Accuracy</th>
                    <th className="px-5 py-2 font-semibold">Points</th>
                  </tr>
                </thead>
                <tbody>
                  {f.kids.map((k) => (
                    <tr
                      key={k.id}
                      className="border-t border-slate-100 text-slate-700"
                    >
                      <td className="px-5 py-2.5">
                        <span className="font-medium text-slate-900">
                          {k.displayName}
                        </span>{" "}
                        <span className="text-slate-400">@{k.username}</span>
                      </td>
                      <td className="px-3 py-2.5">{gradeLabel(k.gradeLevel)}</td>
                      <td className="px-3 py-2.5">{k.worksheetsCompleted}</td>
                      <td className="px-3 py-2.5">{k.questionsAnswered}</td>
                      <td className="px-3 py-2.5">
                        {k.accuracyPct === null ? (
                          <span className="text-slate-400">—</span>
                        ) : (
                          <span
                            className={
                              k.accuracyPct >= 80
                                ? "font-semibold text-emerald-600"
                                : k.accuracyPct >= 50
                                  ? "font-semibold text-amber-600"
                                  : "font-semibold text-rose-600"
                            }
                          >
                            {k.accuracyPct}%
                          </span>
                        )}
                      </td>
                      <td className="px-5 py-2.5 font-semibold text-indigo-700">
                        {k.pointsEarned}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      ))}
    </div>
  );
}

function FeedbackTab({
  rows,
}: {
  rows: AdminData["feedback"];
}) {
  if (rows.length === 0) return <Empty text="No feedback submitted yet." />;
  return (
    <div className="grid gap-3">
      {rows.map((r) => (
        <div
          key={r.id}
          className="rounded-2xl border border-slate-200 bg-white p-4 shadow-sm"
        >
          <div className="mb-1 flex flex-wrap items-center gap-2">
            <span className="font-semibold text-slate-900">{r.fullName}</span>
            {r.isParent === true && (
              <span className="rounded-full bg-emerald-50 px-2 py-0.5 text-xs font-bold text-emerald-700">
                Parent
              </span>
            )}
            {r.isParent === false && (
              <span className="rounded-full bg-sky-50 px-2 py-0.5 text-xs font-bold text-sky-700">
                Not a parent
              </span>
            )}
            <span className="ml-auto text-xs text-slate-400">
              {fmtDate(r.createdAt)}
            </span>
          </div>
          <p className="whitespace-pre-wrap text-sm text-slate-700">
            {r.message}
          </p>
        </div>
      ))}
    </div>
  );
}

function ReferralsTab({
  rows,
}: {
  rows: AdminData["referrals"];
}) {
  if (rows.length === 0) return <Empty text="No referrals yet." />;
  return (
    <div className="overflow-x-auto rounded-2xl border border-slate-200 bg-white shadow-sm">
      <table className="w-full text-left text-sm">
        <thead className="bg-slate-50 text-xs uppercase tracking-wide text-slate-400">
          <tr>
            <th className="px-5 py-3 font-semibold">Referrer</th>
            <th className="px-3 py-3 font-semibold">Invited</th>
            <th className="px-3 py-3 font-semibold">Code</th>
            <th className="px-3 py-3 font-semibold">Status</th>
            <th className="px-3 py-3 font-semibold">Points</th>
            <th className="px-5 py-3 font-semibold">Date</th>
          </tr>
        </thead>
        <tbody>
          {rows.map((r) => (
            <tr key={r.id} className="border-t border-slate-100 text-slate-700">
              <td className="px-5 py-2.5">{r.referrerEmail}</td>
              <td className="px-3 py-2.5">
                {r.invitedEmail ?? (
                  <span className="text-slate-400">pending signup</span>
                )}
              </td>
              <td className="px-3 py-2.5 font-mono text-xs tracking-wider text-slate-500">
                {r.code}
              </td>
              <td className="px-3 py-2.5">
                {r.status === "rewarded" ? (
                  <span className="rounded-full bg-emerald-50 px-2 py-0.5 text-xs font-bold text-emerald-700">
                    Rewarded
                  </span>
                ) : (
                  <span className="rounded-full bg-amber-50 px-2 py-0.5 text-xs font-bold text-amber-700">
                    Pending
                  </span>
                )}
              </td>
              <td className="px-3 py-2.5">{r.rewardPoints || "—"}</td>
              <td className="px-5 py-2.5 text-slate-500">
                {fmtDate(r.createdAt)}
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
