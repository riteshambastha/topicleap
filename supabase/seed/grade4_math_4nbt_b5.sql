-- =====================================================================
-- SEED: Grade 4 Math — standard 4.NBT.B.5
-- "Multiply a multi-digit number by a one-digit number."
-- One subject, one topic, one step-by-step lesson, one 5-question worksheet.
-- Run this in the Supabase SQL Editor AFTER 0001_init.sql.
-- Idempotent: safe to re-run (uses upserts on slug / sort_order).
-- =====================================================================

-- 1) Subject -------------------------------------------------------------
insert into public.subjects (slug, name, sort_order)
values ('math', 'Math', 0)
on conflict (slug) do update set name = excluded.name;

-- 2) Topic ---------------------------------------------------------------
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id,
       'multiply-multi-digit-by-one-digit',
       'Multiplying Big Numbers by One Digit',
       'Use place value and partial products to multiply a multi-digit number by a single digit.',
       4,
       '4.NBT.B.5',
       0
from public.subjects s
where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update
  set name = excluded.name, description = excluded.description,
      standard_code = excluded.standard_code;

-- 3) Lesson (steps as ordered JSONB) ------------------------------------
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id,
       'Multiply Step by Step',
       4,
       $json$
[
  {
    "type": "explain",
    "title": "What does it mean to multiply?",
    "body": "Multiplying is fast adding. 3 × 24 means \"three groups of 24.\" Instead of adding 24 + 24 + 24, we can break 24 into its place values: 20 and 4. Then we multiply each part and add them back together."
  },
  {
    "type": "worked_example",
    "title": "Break it into place values: 3 × 24",
    "body": "Split 24 into 20 + 4.\n• 3 × 20 = 60\n• 3 × 4 = 12\nNow add the partial products: 60 + 12 = 72.\nSo 3 × 24 = 72."
  },
  {
    "type": "worked_example",
    "title": "Bigger numbers: 4 × 213",
    "body": "Split 213 into 200 + 10 + 3.\n• 4 × 200 = 800\n• 4 × 10 = 40\n• 4 × 3 = 12\nAdd them up: 800 + 40 + 12 = 852.\nSo 4 × 213 = 852."
  },
  {
    "type": "explain",
    "title": "When a digit \"carries\"",
    "body": "Sometimes a partial product is 10 or more, like 6 × 7 = 42. The 2 stays in the ones place and the 4 \"carries\" to the tens. Working place value by place value keeps it organized so nothing gets lost."
  },
  {
    "type": "check",
    "title": "Your turn (quick check)",
    "body": "Try this one in your head using place values before you move on to the worksheet.",
    "prompt": "What is 2 × 31?",
    "choices": [
      { "id": "a", "label": "62" },
      { "id": "b", "label": "52" },
      { "id": "c", "label": "33" },
      { "id": "d", "label": "61" }
    ],
    "answer": "a",
    "explanation": "2 × 30 = 60 and 2 × 1 = 2, so 60 + 2 = 62."
  }
]
$json$::jsonb,
       0
from public.topics t
where t.slug = 'multiply-multi-digit-by-one-digit' and t.grade_level = 4;

-- 4) Worksheet ----------------------------------------------------------
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Multiply by One Digit — Practice', 4, 0
from public.topics t
where t.slug = 'multiply-multi-digit-by-one-digit' and t.grade_level = 4;

-- 5) Questions (5 total: mix of MCQ + fill-in) --------------------------
with w as (
  select wk.id
  from public.worksheets wk
  join public.topics t on t.id = wk.topic_id
  where t.slug = 'multiply-multi-digit-by-one-digit'
    and t.grade_level = 4
    and wk.title = 'Multiply by One Digit — Practice'
  limit 1
)
insert into public.questions
  (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, q.question_type, q.prompt, q.choices, q.correct_answer, q.points, q.sort_order
from w,
(values
  ('mcq',     'What is 3 × 24?',
     '[{"id":"a","label":"72"},{"id":"b","label":"64"},{"id":"c","label":"96"},{"id":"d","label":"68"}]'::jsonb,
     'a', 10, 0),
  ('fill_in', 'Type the answer: 5 × 32 = ?',
     null::jsonb, '160', 10, 1),
  ('mcq',     'What is 6 × 47?',
     '[{"id":"a","label":"242"},{"id":"b","label":"282"},{"id":"c","label":"288"},{"id":"d","label":"252"}]'::jsonb,
     'b', 10, 2),
  ('fill_in', 'Type the answer: 4 × 213 = ?',
     null::jsonb, '852', 10, 3),
  ('mcq',     'What is 7 × 308?',
     '[{"id":"a","label":"2106"},{"id":"b","label":"2516"},{"id":"c","label":"2156"},{"id":"d","label":"2096"}]'::jsonb,
     'c', 10, 4)
) as q(question_type, prompt, choices, correct_answer, points, sort_order);
