"use client";

// Lightweight Web Audio chimes — no audio files. Respects a user toggle
// stored in localStorage. All sounds are triggered by user actions
// (clicks / submits), so browser autoplay rules are satisfied.

const KEY = "tl-sound";
let ctx: AudioContext | null = null;

function getCtx(): AudioContext | null {
  if (typeof window === "undefined") return null;
  const AC =
    window.AudioContext ||
    (window as unknown as { webkitAudioContext?: typeof AudioContext })
      .webkitAudioContext;
  if (!AC) return null;
  if (!ctx) ctx = new AC();
  return ctx;
}

export function isSoundOn(): boolean {
  if (typeof window === "undefined") return false;
  return localStorage.getItem(KEY) !== "off";
}

export function setSoundOn(on: boolean): void {
  if (typeof window === "undefined") return;
  localStorage.setItem(KEY, on ? "on" : "off");
}

function tone(
  c: AudioContext,
  freq: number,
  startOffset: number,
  duration: number,
  volume = 0.07,
): void {
  const osc = c.createOscillator();
  const gain = c.createGain();
  osc.type = "sine";
  osc.frequency.value = freq;
  osc.connect(gain);
  gain.connect(c.destination);
  const t = c.currentTime + startOffset;
  gain.gain.setValueAtTime(0.0001, t);
  gain.gain.linearRampToValueAtTime(volume, t + 0.02);
  gain.gain.exponentialRampToValueAtTime(0.0001, t + duration);
  osc.start(t);
  osc.stop(t + duration + 0.03);
}

/** Quick two-note "ding" for a single correct answer. */
export function playCorrect(): void {
  if (!isSoundOn()) return;
  const c = getCtx();
  if (!c) return;
  if (c.state === "suspended") void c.resume();
  tone(c, 660, 0, 0.16);
  tone(c, 880, 0.08, 0.2);
}

/** Celebratory arpeggio; longer/higher for better scores (level 1-4). */
export function playCelebrate(level = 1): void {
  if (!isSoundOn()) return;
  const c = getCtx();
  if (!c) return;
  if (c.state === "suspended") void c.resume();
  const notes = [523.25, 659.25, 783.99, 1046.5]; // C5 E5 G5 C6
  const n = level >= 3 ? 4 : level >= 2 ? 3 : 2;
  for (let i = 0; i < n; i++) tone(c, notes[i], i * 0.1, 0.26);
  if (level >= 4) tone(c, 1318.51, n * 0.1, 0.32); // E6 flourish
}
