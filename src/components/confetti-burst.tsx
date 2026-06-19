"use client";

import { useEffect, useState } from "react";

const COLORS = ["#6366f1", "#ec4899", "#f59e0b", "#10b981", "#38bdf8", "#a855f7"];

interface Piece {
  id: number;
  tx: number;
  ty: number;
  rot: number;
  color: string;
  size: number;
  delay: number;
  round: boolean;
}

/**
 * Fires a gentle confetti burst whenever `trigger` changes to a new
 * truthy value. Pure CSS animation, auto-cleans, reduced-motion safe.
 */
export function ConfettiBurst({
  trigger,
  originY = "35%",
  count = 28,
}: {
  trigger: number;
  originY?: string;
  count?: number;
}) {
  const [pieces, setPieces] = useState<Piece[]>([]);

  useEffect(() => {
    if (!trigger) return;
    if (
      typeof window !== "undefined" &&
      window.matchMedia?.("(prefers-reduced-motion: reduce)").matches
    ) {
      return;
    }
    const n = count;
    const arr: Piece[] = Array.from({ length: n }, (_, i) => ({
      id: trigger * 1000 + i,
      tx: (Math.random() * 2 - 1) * 240,
      ty: -60 - Math.random() * 120 + Math.random() * 320, // burst up, drift down
      rot: (Math.random() * 2 - 1) * 540,
      color: COLORS[i % COLORS.length],
      size: 6 + Math.random() * 9,
      delay: Math.random() * 70,
      round: Math.random() > 0.5,
    }));
    setPieces(arr);
    const t = setTimeout(() => setPieces([]), 1300);
    return () => clearTimeout(t);
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [trigger]);

  if (pieces.length === 0) return null;

  return (
    <div
      aria-hidden
      className="pointer-events-none fixed inset-0 z-50 overflow-hidden"
    >
      {pieces.map((p) => (
        <span
          key={p.id}
          className="tl-confetti-piece absolute"
          style={{
            left: "50%",
            top: originY,
            width: p.size,
            height: p.size,
            backgroundColor: p.color,
            borderRadius: p.round ? "9999px" : "2px",
            animationDelay: `${p.delay}ms`,
            // CSS custom props consumed by the keyframes
            ["--tx" as string]: `${p.tx}px`,
            ["--ty" as string]: `${p.ty}px`,
            ["--rot" as string]: `${p.rot}deg`,
          } as React.CSSProperties}
        />
      ))}
    </div>
  );
}
