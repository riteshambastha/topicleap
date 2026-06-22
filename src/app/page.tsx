import Link from "next/link";
import { redirect } from "next/navigation";
import { getCurrentChild, getCurrentParent } from "@/lib/auth";
import { BannerCarousel } from "@/components/banner-carousel";
import { Logo } from "@/components/logo";

const SUBJECTS = [
  { name: "Math", emoji: "🔢", grad: "from-indigo-500 to-violet-500", blurb: "Counting, place value, multiplication, fractions, area & more." },
  { name: "Reading", emoji: "📖", grad: "from-sky-500 to-blue-500", blurb: "Main idea, inference, vocabulary, sequencing and comprehension." },
  { name: "Science", emoji: "🔬", grad: "from-emerald-500 to-teal-500", blurb: "Forces, life cycles, weather, energy, habitats and more." },
  { name: "Writing & Letters", emoji: "🔤", grad: "from-rose-500 to-pink-500", blurb: "Letters, sounds, grammar, punctuation and sentence skills." },
];

const STEPS = [
  { n: "1", emoji: "🧭", title: "Pick a subject & topic", body: "Kids choose what to learn from a friendly, colorful menu — or search any topic." },
  { n: "2", emoji: "📘", title: "Learn step by step", body: "Interactive lessons explain ideas with worked examples and quick checks, read aloud on tap." },
  { n: "3", emoji: "🏆", title: "Practice & earn points", body: "Auto-graded worksheets give instant feedback, points, and confetti for great scores." },
];

const FEATURES = [
  { emoji: "✨", title: "Interactive lessons", body: "Step-by-step explanations with worked examples and built-in checks — not just videos." },
  { emoji: "⚡", title: "Instant auto-grading", body: "Every worksheet is scored the moment it's submitted, with the right answers shown." },
  { emoji: "🔊", title: "Read-aloud audio", body: "A Listen button reads questions and lessons aloud — perfect for early and emerging readers." },
  { emoji: "🤖", title: "AI progress coach", body: "A personalized, encouraging summary celebrates each child's wins and nudges them onward." },
  { emoji: "🎉", title: "Rewards that motivate", body: "Points, progress bars, and confetti make practice feel like play." },
  { emoji: "🔒", title: "Private & parent-safe", body: "Supervised kid logins and per-family data isolation keep everything safe and yours." },
];

export default async function Home() {
  // Logged-in users skip the marketing site.
  if (await getCurrentChild()) redirect("/learn");
  if (await getCurrentParent()) redirect("/parent");

  return (
    <div className="flex flex-1 flex-col bg-white">
      {/* ---------------- ANNOUNCEMENT BAR ---------------- */}
      <div className="bg-gradient-to-r from-amber-400 via-orange-500 to-pink-500 text-white">
        <div className="mx-auto flex w-full max-w-6xl flex-wrap items-center justify-center gap-x-2 gap-y-1 px-4 py-2.5 text-center text-sm font-semibold sm:text-base">
          <span aria-hidden>☀️ 🏕️</span>
          <span>
            <span className="font-extrabold">Ready for Summer Camp!</span>{" "}
            Let your kid study a little along with all the fun —{" "}
            <span className="font-extrabold">all for FREE.</span> Built by a parent,
            for parents &amp; their kids.
          </span>
          <Link
            href="/signup"
            className="rounded-full bg-white/95 px-3 py-1 text-xs font-bold text-orange-600 shadow-sm transition hover:bg-white sm:text-sm"
          >
            Join free →
          </Link>
        </div>
      </div>

      {/* ---------------- NAV ---------------- */}
      <header className="sticky top-0 z-40 border-b border-slate-200/70 bg-white/80 backdrop-blur">
        <nav className="mx-auto flex w-full max-w-6xl items-center justify-between px-4 py-3 sm:px-6">
          <Link href="/" aria-label="TopicLeap home">
            <Logo iconClass="h-8 w-8" textClass="text-xl" />
          </Link>
          <div className="hidden items-center gap-7 text-sm font-semibold text-slate-600 md:flex">
            <a href="#how" className="hover:text-indigo-700">How it works</a>
            <a href="#subjects" className="hover:text-indigo-700">Subjects</a>
            <a href="#features" className="hover:text-indigo-700">Features</a>
            <a href="#parents" className="hover:text-indigo-700">For parents</a>
          </div>
          <div className="flex items-center gap-2 sm:gap-3">
            <Link
              href="/login"
              className="rounded-xl px-3 py-2 text-sm font-semibold text-slate-700 hover:bg-slate-100"
            >
              Log in
            </Link>
            <Link
              href="/signup"
              className="rounded-xl bg-indigo-600 px-4 py-2 text-sm font-semibold text-white shadow-sm transition hover:bg-indigo-700"
            >
              Sign up free
            </Link>
          </div>
        </nav>
      </header>

      <main className="flex-1">
        {/* ---------------- HERO BANNER SLIDER ---------------- */}
        <BannerCarousel />

        {/* ---------------- STATS STRIP ---------------- */}
        <section className="border-y border-slate-200 bg-slate-50">
          <div className="mx-auto grid w-full max-w-6xl grid-cols-2 gap-6 px-4 py-8 sm:px-6 md:grid-cols-4">
            {[
              { big: "K–8", small: "grade levels" },
              { big: "4", small: "core subjects" },
              { big: "1000s", small: "practice questions" },
              { big: "100%", small: "auto-graded" },
            ].map((s) => (
              <div key={s.small} className="text-center">
                <p className="font-display text-3xl font-extrabold text-indigo-700 sm:text-4xl">
                  {s.big}
                </p>
                <p className="mt-1 text-sm font-medium text-slate-500">{s.small}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ---------------- HOW IT WORKS ---------------- */}
        <section id="how" className="mx-auto w-full max-w-6xl px-4 py-20 sm:px-6">
          <div className="mx-auto max-w-2xl text-center">
            <p className="font-semibold uppercase tracking-widest text-indigo-600">
              How it works
            </p>
            <h2 className="font-display mt-2 text-3xl font-extrabold text-slate-900 sm:text-4xl">
              Three simple steps to “I get it!”
            </h2>
          </div>
          <div className="mt-12 grid gap-6 md:grid-cols-3">
            {STEPS.map((s) => (
              <div key={s.n} className="relative rounded-3xl border border-slate-200 bg-white p-7 shadow-sm">
                <div className="flex h-14 w-14 items-center justify-center rounded-2xl bg-indigo-50 text-3xl">
                  {s.emoji}
                </div>
                <span className="font-display absolute right-6 top-6 text-5xl font-extrabold text-slate-100">
                  {s.n}
                </span>
                <h3 className="font-display mt-5 text-xl font-bold text-slate-900">
                  {s.title}
                </h3>
                <p className="mt-2 leading-relaxed text-slate-600">{s.body}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ---------------- SUBJECTS ---------------- */}
        <section id="subjects" className="bg-slate-50 py-20">
          <div className="mx-auto w-full max-w-6xl px-4 sm:px-6">
            <div className="mx-auto max-w-2xl text-center">
              <p className="font-semibold uppercase tracking-widest text-indigo-600">
                Subjects
              </p>
              <h2 className="font-display mt-2 text-3xl font-extrabold text-slate-900 sm:text-4xl">
                A full curriculum, beautifully organized
              </h2>
              <p className="mt-3 text-slate-600">
                Every subject is broken into bite-sized topics, each with a lesson
                and short worksheets aligned to grade-level standards.
              </p>
            </div>
            <div className="mt-12 grid gap-5 sm:grid-cols-2 lg:grid-cols-4">
              {SUBJECTS.map((s) => (
                <div key={s.name} className="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-sm transition hover:-translate-y-1 hover:shadow-md">
                  <div className={`flex items-center justify-center bg-gradient-to-br ${s.grad} py-10 text-6xl`}>
                    {s.emoji}
                  </div>
                  <div className="p-5">
                    <h3 className="font-display text-lg font-bold text-slate-900">{s.name}</h3>
                    <p className="mt-1.5 text-sm leading-relaxed text-slate-600">{s.blurb}</p>
                  </div>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* ---------------- FEATURES ---------------- */}
        <section id="features" className="mx-auto w-full max-w-6xl px-4 py-20 sm:px-6">
          <div className="mx-auto max-w-2xl text-center">
            <p className="font-semibold uppercase tracking-widest text-indigo-600">
              Why TopicLeap
            </p>
            <h2 className="font-display mt-2 text-3xl font-extrabold text-slate-900 sm:text-4xl">
              Built to make learning stick — and fun
            </h2>
          </div>
          <div className="mt-12 grid gap-5 sm:grid-cols-2 lg:grid-cols-3">
            {FEATURES.map((f) => (
              <div key={f.title} className="rounded-3xl border border-slate-200 bg-white p-6 shadow-sm transition hover:border-indigo-200 hover:shadow-md">
                <div className="flex h-12 w-12 items-center justify-center rounded-2xl bg-gradient-to-br from-indigo-50 to-fuchsia-50 text-2xl">
                  {f.emoji}
                </div>
                <h3 className="font-display mt-4 text-lg font-bold text-slate-900">{f.title}</h3>
                <p className="mt-2 leading-relaxed text-slate-600">{f.body}</p>
              </div>
            ))}
          </div>
        </section>

        {/* ---------------- FOR PARENTS ---------------- */}
        <section id="parents" className="bg-slate-50 py-20">
          <div className="mx-auto grid w-full max-w-6xl items-center gap-12 px-4 sm:px-6 lg:grid-cols-2">
            <div>
              <p className="font-semibold uppercase tracking-widest text-indigo-600">
                For parents
              </p>
              <h2 className="font-display mt-2 text-3xl font-extrabold text-slate-900 sm:text-4xl">
                See real progress, stay in control
              </h2>
              <p className="mt-4 text-lg leading-relaxed text-slate-600">
                Create a safe login for each child, then watch a clear report card:
                points earned, accuracy, worksheets done, and recent activity.
              </p>
              <ul className="mt-6 space-y-3">
                {[
                  "Supervised kid logins with a simple username + PIN",
                  "Per-child report cards and an AI progress summary",
                  "Set each child's grade — and let them explore others for fun",
                  "Private by design: each family only sees its own data",
                ].map((t) => (
                  <li key={t} className="flex items-start gap-3 text-slate-700">
                    <span className="mt-0.5 flex h-6 w-6 shrink-0 items-center justify-center rounded-full bg-emerald-100 text-sm font-bold text-emerald-700">
                      ✓
                    </span>
                    {t}
                  </li>
                ))}
              </ul>
              <Link
                href="/signup"
                className="mt-8 inline-flex items-center justify-center rounded-2xl bg-indigo-600 px-7 py-3.5 text-base font-bold text-white shadow-lg shadow-indigo-600/20 transition hover:-translate-y-0.5 hover:bg-indigo-700"
              >
                Create a free parent account →
              </Link>
            </div>

            {/* mock report card */}
            <div className="overflow-hidden rounded-3xl border border-slate-200 bg-white shadow-2xl shadow-indigo-600/10">
              <div className="bg-gradient-to-br from-indigo-600 via-violet-600 to-fuchsia-600 p-6 text-white">
                <p className="text-xs font-semibold uppercase tracking-widest text-white/70">
                  Progress
                </p>
                <p className="font-display mt-1 text-2xl font-extrabold">Hi, Maya! 🚀</p>
                <p className="mt-2 text-sm text-white/90">
                  You&apos;ve earned 240 points across 9 worksheets with 88% accuracy —
                  amazing work! Keep practicing a little each day.
                </p>
              </div>
              <div className="grid grid-cols-2 gap-3 p-5 sm:grid-cols-4">
                {[
                  { v: "240", l: "Points", c: "text-amber-600" },
                  { v: "6", l: "Topics", c: "text-indigo-600" },
                  { v: "88%", l: "Accuracy", c: "text-emerald-600" },
                  { v: "9", l: "Worksheets", c: "text-sky-600" },
                ].map((s) => (
                  <div key={s.l} className="rounded-2xl border border-slate-100 bg-slate-50 p-3 text-center">
                    <p className={`font-display text-2xl font-extrabold ${s.c}`}>{s.v}</p>
                    <p className="text-xs font-medium text-slate-500">{s.l}</p>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </section>

        {/* ---------------- CTA ---------------- */}
        <section className="px-4 py-20 sm:px-6">
          <div className="relative mx-auto w-full max-w-5xl overflow-hidden rounded-[2rem] bg-gradient-to-br from-indigo-600 via-violet-600 to-fuchsia-600 px-6 py-16 text-center text-white shadow-xl">
            <div aria-hidden className="pointer-events-none absolute inset-0">
              <span className="tl-floaty absolute left-[10%] top-6 text-3xl opacity-30">⭐</span>
              <span className="tl-floaty-slow absolute right-[12%] top-10 text-4xl opacity-30">✏️</span>
              <span className="tl-floaty absolute bottom-6 left-[20%] text-3xl opacity-30">🎉</span>
            </div>
            <h2 className="font-display text-3xl font-extrabold sm:text-4xl">
              Ready to make learning their favorite part of the day?
            </h2>
            <p className="mx-auto mt-3 max-w-xl text-lg text-white/90">
              Join families using TopicLeap to learn, practice, and grow — free to start.
            </p>
            <div className="mt-8 flex flex-wrap justify-center gap-3">
              <Link
                href="/signup"
                className="inline-flex items-center justify-center rounded-2xl bg-white px-7 py-3.5 text-base font-bold text-indigo-700 shadow-lg transition hover:-translate-y-0.5"
              >
                Get started free →
              </Link>
              <Link
                href="/login"
                className="inline-flex items-center justify-center rounded-2xl border-2 border-white/60 px-7 py-3.5 text-base font-bold text-white transition hover:bg-white/10"
              >
                Log in
              </Link>
            </div>
          </div>
        </section>
      </main>

      {/* ---------------- FOOTER ---------------- */}
      <footer className="border-t border-slate-200 bg-white">
        <div className="mx-auto flex w-full max-w-6xl flex-col items-center justify-between gap-4 px-4 py-8 sm:flex-row sm:px-6">
          <Logo iconClass="h-6 w-6" textClass="text-base" />
          <div className="flex flex-wrap items-center justify-center gap-5 text-sm font-medium text-slate-500">
            <a href="#how" className="hover:text-indigo-700">How it works</a>
            <a href="#subjects" className="hover:text-indigo-700">Subjects</a>
            <a href="#features" className="hover:text-indigo-700">Features</a>
            <Link href="/login" className="hover:text-indigo-700">Log in</Link>
            <Link href="/signup" className="hover:text-indigo-700">Sign up</Link>
          </div>
          <span className="text-sm text-slate-400">
            © {new Date().getFullYear()} TopicLeap
          </span>
        </div>
      </footer>
    </div>
  );
}
