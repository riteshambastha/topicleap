"use client";

import { useState, useEffect, useCallback } from "react";
import Link from "next/link";
import { Logo } from "@/components/logo";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";

function newCaptcha() {
  return {
    a: Math.floor(Math.random() * 8) + 1, // 1..8
    b: Math.floor(Math.random() * 8) + 1, // 1..8
  };
}

export default function FeedbackPage() {
  const [fullName, setFullName] = useState("");
  const [isParent, setIsParent] = useState<boolean | null>(null);
  const [message, setMessage] = useState("");
  const [captcha, setCaptcha] = useState({ a: 0, b: 0 });
  const [captchaInput, setCaptchaInput] = useState("");
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const [done, setDone] = useState(false);

  // Generate captcha on the client only (avoids hydration mismatch).
  const refreshCaptcha = useCallback(() => {
    setCaptcha(newCaptcha());
    setCaptchaInput("");
  }, []);
  useEffect(() => {
    refreshCaptcha();
  }, [refreshCaptcha]);

  async function onSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError(null);

    if (Number(captchaInput) !== captcha.a + captcha.b) {
      setError("That captcha answer isn't right — give it another go.");
      refreshCaptcha();
      return;
    }

    setLoading(true);
    const res = await fetch("/api/feedback", {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        fullName,
        isParent,
        message,
        captcha: { a: captcha.a, b: captcha.b, answer: Number(captchaInput) },
      }),
    });
    const data = await res.json().catch(() => ({}));
    setLoading(false);

    if (!res.ok) {
      setError(data.error ?? "Something went wrong. Please try again.");
      refreshCaptcha();
      return;
    }
    setDone(true);
  }

  return (
    <main className="relative flex min-h-screen flex-col overflow-hidden bg-gradient-to-br from-indigo-50 via-sky-50 to-fuchsia-50">
      {/* ---------- abstract decorative background ---------- */}
      <div aria-hidden className="pointer-events-none absolute inset-0 -z-10 overflow-hidden">
        <div className="tl-blob absolute -left-24 -top-24 h-80 w-80 rounded-full bg-indigo-300/40 blur-3xl" />
        <div
          className="tl-blob absolute -right-20 top-16 h-72 w-72 rounded-full bg-fuchsia-300/40 blur-3xl"
          style={{ animationDelay: "-6s" }}
        />
        <div
          className="tl-blob absolute bottom-[-100px] left-1/4 h-96 w-96 rounded-full bg-amber-200/45 blur-3xl"
          style={{ animationDelay: "-12s" }}
        />
        <div
          className="tl-blob absolute right-[18%] bottom-[-60px] h-72 w-72 rounded-full bg-emerald-200/45 blur-3xl"
          style={{ animationDelay: "-9s" }}
        />
        {/* soft floating doodles */}
        <span className="tl-floaty absolute left-[8%] top-[22%] hidden text-4xl opacity-20 select-none sm:block">💬</span>
        <span className="tl-floaty-slow absolute right-[10%] top-[40%] hidden text-5xl opacity-20 select-none sm:block">⭐</span>
        <span className="tl-twinkle absolute left-[72%] top-[16%] text-3xl select-none">✨</span>
        <span className="tl-twinkle absolute left-[24%] bottom-[14%] text-2xl select-none">✨</span>
      </div>

      {/* ---------- top bar ---------- */}
      <header className="mx-auto flex w-full max-w-3xl items-center justify-between px-4 py-5 sm:px-6">
        <Link href="/" aria-label="TopicLeap home">
          <Logo iconClass="h-8 w-8" textClass="text-xl" />
        </Link>
        <Link
          href="/"
          className="text-sm font-semibold text-slate-600 hover:text-indigo-700"
        >
          ← Back home
        </Link>
      </header>

      {/* ---------- content ---------- */}
      <div className="mx-auto w-full max-w-2xl flex-1 px-4 pb-16 pt-2 sm:px-6">
        <div className="mb-6 text-center">
          <span className="inline-flex items-center gap-2 rounded-full bg-white/70 px-4 py-1.5 text-xs font-bold text-indigo-700 shadow-sm ring-1 ring-indigo-100">
            💛 We read every message
          </span>
          <h1 className="mt-4 font-display text-3xl font-extrabold tracking-tight text-slate-900 sm:text-4xl">
            Feedback &amp; Support
          </h1>
          <p className="mx-auto mt-3 max-w-md text-base text-slate-600">
            Found a bug, have an idea, or need a hand? Tell us anything — your
            words help us make TopicLeap better for kids and parents.
          </p>
        </div>

        {done ? (
          <div className="rounded-3xl border border-emerald-200 bg-white/90 p-8 text-center shadow-xl backdrop-blur">
            <div className="mx-auto mb-4 flex h-16 w-16 items-center justify-center rounded-full bg-emerald-100 text-4xl">
              🎉
            </div>
            <h2 className="font-display text-2xl font-extrabold text-slate-900">
              Thank you{fullName ? `, ${fullName.split(" ")[0]}` : ""}!
            </h2>
            <p className="mx-auto mt-2 max-w-sm text-slate-600">
              Your message is in. We truly appreciate you helping us improve.
            </p>
            <div className="mt-6 flex flex-col justify-center gap-3 sm:flex-row">
              <Link href="/">
                <Button className="w-full sm:w-auto">Back to home</Button>
              </Link>
              <Button
                variant="outline"
                className="w-full sm:w-auto"
                onClick={() => {
                  setDone(false);
                  setFullName("");
                  setIsParent(null);
                  setMessage("");
                  refreshCaptcha();
                }}
              >
                Send another
              </Button>
            </div>
          </div>
        ) : (
          <form
            onSubmit={onSubmit}
            className="rounded-3xl border border-white/60 bg-white/85 p-6 shadow-xl backdrop-blur sm:p-8"
          >
            {/* Full name */}
            <div className="space-y-2">
              <Label htmlFor="fullName">Full name</Label>
              <Input
                id="fullName"
                value={fullName}
                onChange={(e) => setFullName(e.target.value)}
                placeholder="e.g. Tia Sharma"
                autoComplete="name"
                required
              />
            </div>

            {/* Parent? */}
            <div className="mt-5 space-y-2">
              <Label>Are you a parent?</Label>
              <div className="grid grid-cols-2 gap-3">
                {[
                  { label: "Yes 👪", val: true },
                  { label: "No 🙋", val: false },
                ].map((opt) => {
                  const active = isParent === opt.val;
                  return (
                    <button
                      key={opt.label}
                      type="button"
                      onClick={() => setIsParent(opt.val)}
                      className={`h-12 rounded-xl border-2 text-sm font-bold transition ${
                        active
                          ? "border-indigo-500 bg-indigo-50 text-indigo-700 shadow-sm"
                          : "border-slate-200 bg-white text-slate-600 hover:border-slate-300"
                      }`}
                      aria-pressed={active}
                    >
                      {opt.label}
                    </button>
                  );
                })}
              </div>
            </div>

            {/* Message */}
            <div className="mt-5 space-y-2">
              <Label htmlFor="message">Feedback / Support details</Label>
              <textarea
                id="message"
                value={message}
                onChange={(e) => setMessage(e.target.value)}
                rows={5}
                maxLength={2000}
                placeholder="Share your feedback, an idea, or what you need help with…"
                className="flex w-full rounded-xl border border-slate-300 bg-white px-4 py-3 text-base shadow-sm placeholder:text-slate-400 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-400"
                required
              />
              <p className="text-right text-xs text-slate-400">
                {message.length}/2000
              </p>
            </div>

            {/* Captcha */}
            <div className="mt-5 space-y-2">
              <Label htmlFor="captcha">
                Quick check — what is{" "}
                <span className="font-extrabold text-indigo-700">
                  {captcha.a} + {captcha.b}
                </span>
                ?
              </Label>
              <div className="flex items-center gap-3">
                <Input
                  id="captcha"
                  inputMode="numeric"
                  pattern="[0-9]*"
                  value={captchaInput}
                  onChange={(e) =>
                    setCaptchaInput(e.target.value.replace(/[^0-9]/g, ""))
                  }
                  placeholder="Answer"
                  className="max-w-[140px]"
                  required
                />
                <button
                  type="button"
                  onClick={refreshCaptcha}
                  className="text-sm font-semibold text-slate-500 hover:text-indigo-700"
                >
                  ↻ New question
                </button>
              </div>
            </div>

            {error && (
              <p className="mt-4 rounded-xl bg-rose-50 px-4 py-2 text-sm font-medium text-rose-600">
                {error}
              </p>
            )}

            <Button
              type="submit"
              size="lg"
              disabled={loading}
              className="mt-6 w-full"
            >
              {loading ? "Sending…" : "Submit feedback"}
            </Button>
            <p className="mt-3 text-center text-xs text-slate-400">
              We use your message only to improve TopicLeap and respond if needed.
            </p>
          </form>
        )}
      </div>
    </main>
  );
}
