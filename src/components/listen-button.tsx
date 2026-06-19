"use client";

import { useEffect, useState } from "react";

/**
 * Reads text aloud using the browser's built-in speech synthesis.
 * No network or API key needed; degrades gracefully if unsupported.
 */
export function ListenButton({
  text,
  className = "",
}: {
  text: string;
  className?: string;
}) {
  const [supported, setSupported] = useState(true);
  const [speaking, setSpeaking] = useState(false);

  useEffect(() => {
    setSupported(typeof window !== "undefined" && "speechSynthesis" in window);
  }, []);

  function toggle(e: React.MouseEvent) {
    e.preventDefault();
    e.stopPropagation();
    const synth = window.speechSynthesis;
    if (!synth) return;
    if (synth.speaking) {
      synth.cancel();
      setSpeaking(false);
      return;
    }
    const u = new SpeechSynthesisUtterance(text);
    u.rate = 0.95;
    u.pitch = 1.05;
    u.onend = () => setSpeaking(false);
    u.onerror = () => setSpeaking(false);
    setSpeaking(true);
    synth.speak(u);
  }

  if (!supported) return null;

  return (
    <button
      type="button"
      onClick={toggle}
      aria-label="Listen to this question"
      title="Listen"
      className={`inline-flex h-9 items-center gap-1.5 rounded-full border border-indigo-200 bg-indigo-50 px-3 text-sm font-semibold text-indigo-700 transition hover:bg-indigo-100 ${className}`}
    >
      <span className={speaking ? "animate-pulse" : ""}>🔊</span>
      {speaking ? "Stop" : "Listen"}
    </button>
  );
}
