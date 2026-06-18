/**
 * Auto-grading for MCQ + fill-in questions (the only types in M1).
 *  - mcq:     compare the chosen choice id to correct_answer
 *  - fill_in: compare normalized strings (trim, lowercase, collapse spaces,
 *             strip a leading "=" and commas in numbers like "1,000")
 */
export function normalize(value: string): string {
  return value
    .trim()
    .toLowerCase()
    .replace(/^=/, "")
    .replace(/,/g, "")
    .replace(/\s+/g, " ")
    .trim();
}

export function isAnswerCorrect(
  questionType: "mcq" | "fill_in",
  correctAnswer: string,
  response: string | null | undefined,
): boolean {
  if (response == null) return false;
  if (questionType === "mcq") {
    return response.trim() === correctAnswer.trim();
  }
  return normalize(response) === normalize(correctAnswer);
}
