"use client";

import { useEffect, useState, useCallback } from "react";
import Link from "next/link";

/* ---------- generated SVG banner art ---------- */

function SubjectsArt() {
  return (
    <svg viewBox="0 0 420 320" className="h-full w-full" role="img" aria-label="Subject cards">
      <defs>
        <filter id="s1" x="-20%" y="-20%" width="140%" height="140%">
          <feDropShadow dx="0" dy="6" stdDeviation="8" floodColor="#0f172a" floodOpacity="0.18" />
        </filter>
      </defs>
      <circle cx="330" cy="70" r="60" fill="#ffffff" opacity="0.12" />
      <circle cx="80" cy="250" r="44" fill="#ffffff" opacity="0.12" />
      <g filter="url(#s1)">
        <g transform="rotate(-8 120 130)">
          <rect x="60" y="80" width="110" height="110" rx="22" fill="#ffffff" />
          <text x="115" y="150" fontSize="52" textAnchor="middle">🔢</text>
        </g>
        <g transform="rotate(7 280 110)">
          <rect x="225" y="60" width="110" height="110" rx="22" fill="#ffffff" />
          <text x="280" y="130" fontSize="52" textAnchor="middle">📖</text>
        </g>
        <g transform="rotate(6 150 240)">
          <rect x="95" y="190" width="110" height="110" rx="22" fill="#ffffff" />
          <text x="150" y="260" fontSize="52" textAnchor="middle">🔬</text>
        </g>
        <g transform="rotate(-7 300 245)">
          <rect x="245" y="195" width="110" height="110" rx="22" fill="#ffffff" />
          <text x="300" y="265" fontSize="52" textAnchor="middle">🔤</text>
        </g>
      </g>
      <text x="210" y="60" fontSize="34" textAnchor="middle">🚀</text>
      <text x="360" y="180" fontSize="24">⭐</text>
      <text x="40" y="120" fontSize="22">✨</text>
    </svg>
  );
}

function WorksheetArt() {
  return (
    <svg viewBox="0 0 420 320" className="h-full w-full" role="img" aria-label="Worksheet and rewards">
      <defs>
        <filter id="s2" x="-20%" y="-20%" width="140%" height="140%">
          <feDropShadow dx="0" dy="6" stdDeviation="8" floodColor="#0f172a" floodOpacity="0.18" />
        </filter>
      </defs>
      <circle cx="340" cy="80" r="58" fill="#ffffff" opacity="0.12" />
      <circle cx="70" cy="250" r="40" fill="#ffffff" opacity="0.12" />
      <g filter="url(#s2)">
        <rect x="110" y="55" width="200" height="210" rx="20" fill="#ffffff" />
        <rect x="134" y="80" width="120" height="14" rx="7" fill="#c7d2fe" />
        {[120, 152, 184, 216].map((y, i) => (
          <g key={y}>
            <circle cx="142" cy={y} r="11" fill={i < 3 ? "#10b981" : "#e2e8f0"} />
            {i < 3 && (
              <path d={`M137 ${y} l4 4 l7 -8`} stroke="#fff" strokeWidth="2.5" fill="none" strokeLinecap="round" strokeLinejoin="round" />
            )}
            <rect x="162" y={y - 7} width="120" height="14" rx="7" fill="#eef2ff" />
          </g>
        ))}
      </g>
      <text x="330" y="70" fontSize="40" textAnchor="middle">🏆</text>
      <text x="70" y="120" fontSize="26">⭐</text>
      <text x="360" y="240" fontSize="24">🎉</text>
      <text x="90" y="300" fontSize="22">✨</text>
    </svg>
  );
}

function ProgressArt() {
  return (
    <svg viewBox="0 0 420 320" className="h-full w-full" role="img" aria-label="Progress report">
      <defs>
        <filter id="s3" x="-20%" y="-20%" width="140%" height="140%">
          <feDropShadow dx="0" dy="6" stdDeviation="8" floodColor="#0f172a" floodOpacity="0.18" />
        </filter>
      </defs>
      <circle cx="340" cy="240" r="54" fill="#ffffff" opacity="0.12" />
      <circle cx="80" cy="80" r="40" fill="#ffffff" opacity="0.12" />
      <g filter="url(#s3)">
        <rect x="95" y="60" width="230" height="200" rx="20" fill="#ffffff" />
        <text x="120" y="100" fontSize="26">📈</text>
        <rect x="158" y="84" width="120" height="12" rx="6" fill="#e2e8f0" />
        <rect x="158" y="104" width="84" height="10" rx="5" fill="#eef2ff" />
        {[
          { x: 130, h: 50, c: "#6366f1" },
          { x: 168, h: 78, c: "#8b5cf6" },
          { x: 206, h: 64, c: "#ec4899" },
          { x: 244, h: 96, c: "#10b981" },
        ].map((b) => (
          <rect key={b.x} x={b.x} y={232 - b.h} width="26" height={b.h} rx="6" fill={b.c} />
        ))}
        <line x1="120" y1="234" x2="300" y2="234" stroke="#e2e8f0" strokeWidth="2" />
      </g>
      <text x="330" y="90" fontSize="34" textAnchor="middle">⭐</text>
      <text x="70" y="250" fontSize="26">👍</text>
    </svg>
  );
}

interface Slide {
  grad: string;
  eyebrow: string;
  title: string;
  text: string;
  cta: string;
  href: string;
  Art: () => React.ReactElement;
}

const SLIDES: Slide[] = [
  {
    grad: "from-indigo-600 via-violet-600 to-fuchsia-600",
    eyebrow: "Kindergarten → Grade 8",
    title: "Where kids love to learn",
    text: "Interactive, step-by-step lessons across Math, Reading, Science, and Writing — built to make learning feel like play.",
    cta: "Get started free →",
    href: "/signup",
    Art: SubjectsArt,
  },
  {
    grad: "from-emerald-600 to-teal-600",
    eyebrow: "Practice & Rewards",
    title: "Practice that feels like play",
    text: "Auto-graded worksheets give instant feedback, points, and confetti for great scores — so kids stay motivated.",
    cta: "Try it free →",
    href: "/signup",
    Art: WorksheetArt,
  },
  {
    grad: "from-sky-600 to-blue-700",
    eyebrow: "For Parents",
    title: "See real progress",
    text: "Create safe kid logins and watch a clear report card: points, accuracy, and an encouraging AI summary.",
    cta: "Create a free account →",
    href: "/signup",
    Art: ProgressArt,
  },
];

export function BannerCarousel() {
  const [i, setI] = useState(0);
  const n = SLIDES.length;
  const go = useCallback((idx: number) => setI(((idx % n) + n) % n), [n]);

  useEffect(() => {
    const reduce =
      typeof window !== "undefined" &&
      window.matchMedia?.("(prefers-reduced-motion: reduce)").matches;
    if (reduce) return;
    const t = setInterval(() => setI((c) => (c + 1) % n), 5500);
    return () => clearInterval(t);
  }, [n]);

  return (
    <section className="relative overflow-hidden" aria-roledescription="carousel">
      <div
        className="flex transition-transform duration-700 ease-out"
        style={{ transform: `translateX(-${i * 100}%)` }}
      >
        {SLIDES.map((s, idx) => {
          const Art = s.Art;
          return (
            <div
              key={idx}
              className={`w-full shrink-0 bg-gradient-to-br ${s.grad}`}
              aria-hidden={idx !== i}
            >
              <div className="mx-auto grid w-full max-w-6xl items-center gap-6 px-4 py-12 sm:px-6 lg:grid-cols-2 lg:py-16">
                <div className="text-white">
                  <span className="inline-flex items-center rounded-full bg-white/20 px-4 py-1.5 text-sm font-semibold backdrop-blur">
                    {s.eyebrow}
                  </span>
                  <h1 className="font-display mt-4 text-4xl font-extrabold leading-tight sm:text-5xl">
                    {s.title}
                  </h1>
                  <p className="mt-4 max-w-lg text-lg text-white/90">{s.text}</p>
                  <div className="mt-7 flex flex-wrap gap-3">
                    <Link
                      href={s.href}
                      className="inline-flex items-center justify-center rounded-2xl bg-white px-7 py-3.5 text-base font-bold text-indigo-700 shadow-lg transition hover:-translate-y-0.5"
                    >
                      {s.cta}
                    </Link>
                    <Link
                      href="/kids"
                      className="inline-flex items-center justify-center rounded-2xl border-2 border-white/60 px-7 py-3.5 text-base font-bold text-white transition hover:bg-white/10"
                    >
                      🎒 I&apos;m a learner
                    </Link>
                  </div>
                </div>
                <div className="mx-auto h-56 w-full max-w-md sm:h-72">
                  <Art />
                </div>
              </div>
            </div>
          );
        })}
      </div>

      {/* arrows */}
      <button
        type="button"
        onClick={() => go(i - 1)}
        aria-label="Previous slide"
        className="absolute left-3 top-1/2 hidden h-10 w-10 -translate-y-1/2 items-center justify-center rounded-full bg-white/30 text-white backdrop-blur transition hover:bg-white/50 sm:flex"
      >
        ←
      </button>
      <button
        type="button"
        onClick={() => go(i + 1)}
        aria-label="Next slide"
        className="absolute right-3 top-1/2 hidden h-10 w-10 -translate-y-1/2 items-center justify-center rounded-full bg-white/30 text-white backdrop-blur transition hover:bg-white/50 sm:flex"
      >
        →
      </button>

      {/* dots */}
      <div className="absolute bottom-4 left-1/2 flex -translate-x-1/2 gap-2">
        {SLIDES.map((_, idx) => (
          <button
            key={idx}
            type="button"
            onClick={() => go(idx)}
            aria-label={`Go to slide ${idx + 1}`}
            className={`h-2.5 rounded-full transition-all ${
              idx === i ? "w-7 bg-white" : "w-2.5 bg-white/50 hover:bg-white/80"
            }`}
          />
        ))}
      </div>
    </section>
  );
}
