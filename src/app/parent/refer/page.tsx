import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentParent } from "@/lib/auth";
import { Logo } from "@/components/logo";
import { LogoutButton } from "@/components/logout-button";
import { ReferShare } from "@/components/refer-share";
import {
  getOrCreateReferralCode,
  getReferralStats,
  REFERRAL_BONUS_POINTS,
} from "@/lib/referrals";

export default async function ReferPage() {
  const parent = await getCurrentParent();
  if (!parent) redirect("/login");

  const [code, stats] = await Promise.all([
    getOrCreateReferralCode(parent.id),
    getReferralStats(parent.id),
  ]);

  const statCards = [
    { label: "Friends joined", value: stats.friendsJoined, icon: "👪" },
    { label: "Successful invites", value: stats.successful, icon: "✅" },
    { label: "Bonus points earned", value: stats.pointsEarned, icon: "⭐" },
  ];

  return (
    <div className="flex flex-1 flex-col">
      <header className="flex flex-wrap items-center justify-between gap-3 border-b border-slate-200 bg-white px-4 py-4 sm:px-6">
        <span className="flex items-center gap-2">
          <Link href="/parent" aria-label="Parent dashboard">
            <Logo iconClass="h-7 w-7" textClass="text-lg" />
          </Link>
          <span className="text-sm font-semibold text-slate-400">· Invite</span>
        </span>
        <div className="flex items-center gap-3">
          <Link
            href="/parent"
            className="text-sm font-semibold text-slate-600 hover:text-indigo-700"
          >
            ← Dashboard
          </Link>
          <LogoutButton />
        </div>
      </header>

      <main className="relative flex-1 overflow-hidden">
        {/* abstract background */}
        <div
          aria-hidden
          className="pointer-events-none absolute inset-0 -z-10 overflow-hidden bg-gradient-to-br from-indigo-50 via-sky-50 to-fuchsia-50"
        >
          <div className="tl-blob absolute -left-24 -top-20 h-72 w-72 rounded-full bg-indigo-300/40 blur-3xl" />
          <div
            className="tl-blob absolute -right-16 top-10 h-72 w-72 rounded-full bg-fuchsia-300/40 blur-3xl"
            style={{ animationDelay: "-6s" }}
          />
          <span className="tl-twinkle absolute left-[70%] top-[12%] text-3xl select-none">
            ✨
          </span>
        </div>

        <div className="mx-auto w-full max-w-2xl px-4 py-8 sm:px-6">
          <div className="text-center">
            <div className="mx-auto mb-3 flex h-16 w-16 items-center justify-center rounded-2xl bg-white text-4xl shadow-md">
              🎁
            </div>
            <h1 className="font-display text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl">
              Invite friends, earn together
            </h1>
            <p className="mx-auto mt-3 max-w-md text-base text-slate-600">
              Share TopicLeap with other parents. When a friend joins and adds
              a learner, <strong>every kid on both sides</strong> gets{" "}
              <strong>{REFERRAL_BONUS_POINTS} bonus points</strong>. It&apos;s
              free — and more fun together.
            </p>
          </div>

          {/* stats */}
          <div className="mt-7 grid grid-cols-3 gap-3">
            {statCards.map((s) => (
              <div
                key={s.label}
                className="rounded-2xl border border-white/60 bg-white/85 p-4 text-center shadow-sm backdrop-blur"
              >
                <div className="text-2xl">{s.icon}</div>
                <div className="mt-1 font-display text-2xl font-extrabold text-slate-900">
                  {s.value}
                </div>
                <div className="text-xs font-medium text-slate-500">
                  {s.label}
                </div>
              </div>
            ))}
          </div>

          {/* share card */}
          <div className="mt-6 rounded-3xl border border-white/60 bg-white/90 p-6 shadow-xl backdrop-blur sm:p-8">
            <ReferShare code={code} bonus={REFERRAL_BONUS_POINTS} />
          </div>

          {/* how it works */}
          <div className="mt-6 rounded-3xl border border-white/60 bg-white/70 p-6 backdrop-blur sm:p-8">
            <h2 className="font-display text-lg font-extrabold text-slate-900">
              How it works
            </h2>
            <ol className="mt-4 space-y-3">
              {[
                "Share your link or code with another parent.",
                "They sign up for a free TopicLeap account using it.",
                `They add their first learner — and you both get ${REFERRAL_BONUS_POINTS} points per child.`,
              ].map((step, i) => (
                <li key={i} className="flex gap-3">
                  <span className="flex h-7 w-7 shrink-0 items-center justify-center rounded-full bg-indigo-600 text-sm font-bold text-white">
                    {i + 1}
                  </span>
                  <span className="pt-0.5 text-sm text-slate-700">{step}</span>
                </li>
              ))}
            </ol>
          </div>
        </div>
      </main>
    </div>
  );
}
