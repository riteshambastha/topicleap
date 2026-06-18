export type LessonStepType = "explain" | "worked_example" | "check";

export interface LessonStep {
  type: LessonStepType;
  title: string;
  body: string;
  // Optional inline gut-check (only on "check" steps). Not scored.
  prompt?: string;
  choices?: { id: string; label: string }[];
  answer?: string;
  explanation?: string;
}

export interface Lesson {
  id: string;
  topic_id: string;
  title: string;
  grade_level: number;
  steps: LessonStep[];
}

export interface Subject {
  id: string;
  slug: string;
  name: string;
}

export interface Topic {
  id: string;
  subject_id: string;
  slug: string;
  name: string;
  description: string | null;
  grade_level: number;
  standard_code: string | null;
}

export interface Worksheet {
  id: string;
  topic_id: string;
  title: string;
  grade_level: number;
}

/** Question shape SAFE to send to the browser (no correct_answer). */
export interface PublicQuestion {
  id: string;
  question_type: "mcq" | "fill_in";
  prompt: string;
  choices: { id: string; label: string }[] | null;
  points: number;
  sort_order: number;
}

export interface GradedQuestionResult {
  questionId: string;
  isCorrect: boolean;
  pointsAwarded: number;
  correctAnswer: string;
  yourResponse: string;
}

export interface GradeResponse {
  attemptId: string;
  correctCount: number;
  totalQuestions: number;
  pointsEarned: number;
  maxPoints: number;
  results: GradedQuestionResult[];
}
