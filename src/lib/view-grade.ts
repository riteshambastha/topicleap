import { cookies } from "next/headers";

export const VIEW_GRADE_COOKIE = "tl-view-grade";

/**
 * Which grade the kid is currently browsing. Defaults to their home grade,
 * but they can temporarily "explore" another grade (stored in a cookie).
 */
export async function getViewGrade(homeGrade: number): Promise<number> {
  const store = await cookies();
  const raw = store.get(VIEW_GRADE_COOKIE)?.value;
  const n = raw ? Number(raw) : NaN;
  if (Number.isInteger(n) && n >= 1 && n <= 12) return n;
  return homeGrade;
}
