/**
 * Wraps every kid-facing page in a colorful, gently animated backdrop:
 * soft floating color blobs + drifting doodles. Pure CSS, lightweight, and
 * disabled automatically for users who prefer reduced motion.
 */
import { SoundToggle } from "@/components/sound-toggle";
import { AppFooter } from "@/components/app-footer";

export default function LearnLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <div className="relative flex flex-1 flex-col">
      <SoundToggle />
      <div
        aria-hidden
        className="pointer-events-none fixed inset-0 -z-10 overflow-hidden"
      >
        {/* base wash */}
        <div className="absolute inset-0 bg-gradient-to-br from-indigo-50 via-sky-50 to-fuchsia-50" />

        {/* floating color blobs */}
        <div className="tl-blob absolute -left-24 -top-24 h-80 w-80 rounded-full bg-indigo-300/45 blur-3xl" />
        <div
          className="tl-blob absolute -right-16 top-24 h-72 w-72 rounded-full bg-fuchsia-300/45 blur-3xl"
          style={{ animationDelay: "-6s" }}
        />
        <div
          className="tl-blob absolute bottom-[-90px] left-1/3 h-96 w-96 rounded-full bg-amber-200/50 blur-3xl"
          style={{ animationDelay: "-12s" }}
        />
        <div
          className="tl-blob absolute left-[-40px] top-1/2 h-64 w-64 rounded-full bg-emerald-200/50 blur-3xl"
          style={{ animationDelay: "-9s" }}
        />
        <div
          className="tl-blob absolute right-[20%] bottom-[-60px] h-72 w-72 rounded-full bg-sky-300/40 blur-3xl"
          style={{ animationDelay: "-3s" }}
        />

        {/* drifting doodles */}
        <span className="tl-floaty absolute left-[7%] top-[16%] text-4xl opacity-20 select-none">⭐</span>
        <span className="tl-floaty-slow absolute right-[10%] top-[34%] text-5xl opacity-20 select-none">✏️</span>
        <span className="tl-floaty-slow absolute left-[13%] bottom-[12%] text-4xl opacity-20 select-none">➗</span>
        <span className="tl-floaty absolute right-[16%] bottom-[16%] text-5xl opacity-15 select-none">🔬</span>
        <span className="tl-floaty absolute left-[46%] top-[8%] text-3xl opacity-20 select-none">📚</span>
        <span className="tl-twinkle absolute left-[70%] top-[14%] text-3xl select-none">✨</span>
        <span className="tl-twinkle absolute left-[28%] top-[44%] text-2xl select-none">✨</span>
      </div>

      {children}
      <AppFooter />
    </div>
  );
}
