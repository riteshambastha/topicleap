"use client";

import { useEffect, useState } from "react";
import { isSoundOn, setSoundOn, playCorrect } from "@/lib/sound";

/** Floating sound on/off control, available on every kid page. */
export function SoundToggle() {
  const [on, setOn] = useState(true);
  const [ready, setReady] = useState(false);

  useEffect(() => {
    setOn(isSoundOn());
    setReady(true);
  }, []);

  function toggle() {
    const next = !on;
    setOn(next);
    setSoundOn(next);
    if (next) playCorrect(); // little preview when turning on
  }

  if (!ready) return null;

  return (
    <button
      type="button"
      onClick={toggle}
      aria-label={on ? "Turn sounds off" : "Turn sounds on"}
      title={on ? "Sounds on" : "Sounds off"}
      className="fixed bottom-4 right-4 z-40 flex h-12 w-12 items-center justify-center rounded-full border border-white/70 bg-white/80 text-xl shadow-lg backdrop-blur transition hover:scale-105"
    >
      {on ? "🔊" : "🔈"}
    </button>
  );
}
