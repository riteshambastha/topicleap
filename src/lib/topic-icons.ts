/**
 * Relevant illustration (emoji) per topic, with a per-subject fallback so
 * any future topic still gets a sensible icon. Keyed by topic slug.
 */
const TOPIC_ICONS: Record<string, string> = {
  // ----- Math -----
  "multiply-multi-digit-by-one-digit": "✖️",
  "place-value-to-hundred-thousands": "🔢",
  "rounding-large-numbers": "🎯",
  "multi-digit-addition-and-subtraction": "➕",
  "multiply-by-one-digit": "✖️",
  "multiply-two-digit-numbers": "🧮",
  "division-with-remainders": "➗",
  "factors-and-multiples": "🧩",
  "equivalent-fractions": "🍕",
  "comparing-fractions": "⚖️",
  "adding-fractions-like-denominators": "🍰",
  // ----- Science -----
  energy: "⚡",
  "waves-light-sound": "🔊",
  "plant-structures": "🌱",
  "animal-structures-senses": "🐾",
  "earths-features": "🌍",
  "weathering-erosion": "🪨",
  "fossils-rock-layers": "🦕",
  "natural-resources": "♻️",
  "electricity-magnetism": "🧲",
  "water-cycle-weather": "🌧️",
  // ----- Reading -----
  "main-idea": "💡",
  "supporting-details": "🔍",
  sequence: "➡️",
  "cause-and-effect": "🔗",
  "context-clues": "🕵️",
  "making-inferences": "🤔",
  "authors-purpose": "✒️",
  "compare-and-contrast": "🪞",
  "fact-and-opinion": "🧐",
  "synonyms-and-antonyms": "🔤",
  // ----- Writing -----
  nouns: "🏷️",
  "action-verbs": "🏃",
  adjectives: "🎨",
  pronouns: "👤",
  "subject-verb-agreement": "🤝",
  "past-tense-verbs": "⏪",
  "plural-nouns": "👥",
  "capitalization-proper-nouns": "🔠",
  "end-punctuation": "❗",
  "commas-in-a-series": "🗒️",
};

const SUBJECT_FALLBACK: Record<string, string> = {
  math: "🔢",
  science: "🔬",
  reading: "📖",
  writing: "✏️",
};

export function topicIcon(slug: string, subjectSlug?: string): string {
  return TOPIC_ICONS[slug] ?? SUBJECT_FALLBACK[subjectSlug ?? ""] ?? "📚";
}

/** Subject-themed gradient classes for the icon tile background. */
export const SUBJECT_GRADIENT: Record<string, string> = {
  math: "from-indigo-500 to-violet-500",
  science: "from-emerald-500 to-teal-500",
  reading: "from-sky-500 to-blue-500",
  writing: "from-amber-500 to-orange-500",
};

export function subjectGradient(subjectSlug?: string): string {
  return SUBJECT_GRADIENT[subjectSlug ?? ""] ?? "from-slate-500 to-slate-600";
}
