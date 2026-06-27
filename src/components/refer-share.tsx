"use client";

import { useEffect, useState } from "react";
import { Button } from "@/components/ui/button";

/** Interactive share controls for the parent referral page. */
export function ReferShare({ code, bonus }: { code: string; bonus: number }) {
  const [origin, setOrigin] = useState("");
  const [copied, setCopied] = useState<"link" | "code" | null>(null);
  const [canNativeShare, setCanNativeShare] = useState(false);

  useEffect(() => {
    setOrigin(window.location.origin);
    setCanNativeShare(typeof navigator !== "undefined" && !!navigator.share);
  }, []);

  const link = origin ? `${origin}/signup?ref=${code}` : "";
  const message = `Join me on TopicLeap — free K–8 learning my kids love. Sign up with my link and we'll each earn ${bonus} bonus points! ${link}`;

  async function copy(value: string, which: "link" | "code") {
    try {
      await navigator.clipboard.writeText(value);
      setCopied(which);
      setTimeout(() => setCopied(null), 1800);
    } catch {
      /* clipboard blocked — user can select manually */
    }
  }

  async function nativeShare() {
    try {
      await navigator.share({ title: "TopicLeap", text: message, url: link });
    } catch {
      /* user cancelled */
    }
  }

  const wa = `https://wa.me/?text=${encodeURIComponent(message)}`;
  const mail = `mailto:?subject=${encodeURIComponent(
    "Come learn with us on TopicLeap",
  )}&body=${encodeURIComponent(message)}`;
  const sms = `sms:?&body=${encodeURIComponent(message)}`;

  return (
    <div className="space-y-5">
      {/* Shareable link */}
      <div>
        <p className="mb-1.5 text-sm font-semibold text-slate-600">
          Your invite link
        </p>
        <div className="flex flex-col gap-2 sm:flex-row">
          <input
            readOnly
            value={link}
            onFocus={(e) => e.currentTarget.select()}
            className="flex h-11 w-full rounded-xl border border-slate-300 bg-slate-50 px-4 text-sm text-slate-700 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-indigo-400"
          />
          <Button
            type="button"
            onClick={() => copy(link, "link")}
            className="shrink-0"
          >
            {copied === "link" ? "Copied! ✓" : "Copy link"}
          </Button>
        </div>
      </div>

      {/* Code */}
      <div>
        <p className="mb-1.5 text-sm font-semibold text-slate-600">
          Or share your code
        </p>
        <button
          type="button"
          onClick={() => copy(code, "code")}
          className="inline-flex items-center gap-2 rounded-xl border-2 border-dashed border-indigo-300 bg-indigo-50 px-5 py-2.5 font-display text-2xl font-extrabold tracking-[0.2em] text-indigo-700 transition hover:bg-indigo-100"
          aria-label="Copy referral code"
        >
          {code}
          <span className="text-xs font-semibold tracking-normal text-indigo-400">
            {copied === "code" ? "copied!" : "tap to copy"}
          </span>
        </button>
      </div>

      {/* Quick share targets */}
      <div className="flex flex-wrap gap-2">
        {canNativeShare && (
          <Button type="button" variant="success" onClick={nativeShare}>
            📲 Share…
          </Button>
        )}
        <a href={wa} target="_blank" rel="noopener noreferrer">
          <Button type="button" variant="outline">
            💬 WhatsApp
          </Button>
        </a>
        <a href={sms}>
          <Button type="button" variant="outline">
            ✉️ Text
          </Button>
        </a>
        <a href={mail}>
          <Button type="button" variant="outline">
            📧 Email
          </Button>
        </a>
      </div>
    </div>
  );
}
