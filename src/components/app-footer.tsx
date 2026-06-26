import Link from "next/link";

/** Slim, unobtrusive footer for in-app pages — keeps Feedback reachable. */
export function AppFooter() {
  return (
    <footer className="mt-auto border-t border-slate-200/70 bg-white/60 backdrop-blur">
      <div className="mx-auto flex w-full max-w-6xl flex-col items-center justify-between gap-2 px-4 py-4 text-sm sm:flex-row sm:px-6">
        <span className="text-slate-400">
          © {new Date().getFullYear()} TopicLeap
        </span>
        <Link
          href="/feedback"
          className="font-semibold text-slate-500 transition hover:text-indigo-700"
        >
          💬 Feedback &amp; Support
        </Link>
      </div>
    </footer>
  );
}
