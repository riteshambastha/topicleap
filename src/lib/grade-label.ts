/** Display helpers for grade levels (Kindergarten is grade 0). */
export function gradeLabel(n: number): string {
  return n === 0 ? "Kindergarten" : `Grade ${n}`;
}

/** Short form for compact chips/pills. */
export function gradeShort(n: number): string {
  return n === 0 ? "K" : String(n);
}
