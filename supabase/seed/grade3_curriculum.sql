-- =====================================================================
-- TopicLeap - Grade 3 full curriculum seed (generated)
-- 4 subjects x 10 topics, each with a lesson + worksheets of 5 questions.
-- Idempotent & non-destructive: re-running never duplicates and never
-- touches a topic that already has content.
-- Run AFTER 0001_init.sql, in the Supabase SQL Editor.
-- =====================================================================

insert into public.subjects (slug, name, sort_order) values ($tl$math$tl$, $tl$Math$tl$, 0)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ($tl$science$tl$, $tl$Science$tl$, 1)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ($tl$reading$tl$, $tl$Reading Comprehension$tl$, 2)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ($tl$writing$tl$, $tl$Writing$tl$, 3)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

-- ---- [math] Place Value to Thousands (3.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$place-value-to-thousands$tl$, $tl$Place Value to Thousands$tl$, $tl$Each digit's value depends on its place: ones, tens, hundreds, thousands. The same digit is worth more the farther left it sits.$tl$, 3, $tl$3.NBT.A.2$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Place Value to Thousands$tl$, 3, $tl$[{"type": "explain", "title": "About: Place Value to Thousands", "body": "Each digit's value depends on its place: ones, tens, hundreds, thousands. The same digit is worth more the farther left it sits."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the value of the digit 4 in 4845? (Write just the number, e.g. 300)  The answer is 40."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 4845? (Write just the number, e.g. 300)$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 6716? (Write just the number, e.g. 300)$tl$, null, $tl$6000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 7279? (Write just the number, e.g. 300)$tl$, null, $tl$9$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 6002? (Write just the number, e.g. 300)$tl$, null, $tl$6000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 4725? (Write just the number, e.g. 300)$tl$, null, $tl$4000$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 2 in 9729? (Write just the number, e.g. 300)$tl$, null, $tl$20$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 4239? (Write just the number, e.g. 300)$tl$, null, $tl$4000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 1534? (Write just the number, e.g. 300)$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 4316? (Write just the number, e.g. 300)$tl$, null, $tl$4000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 1024? (Write just the number, e.g. 300)$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 869? (Write just the number, e.g. 300)$tl$, null, $tl$60$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 2809? (Write just the number, e.g. 300)$tl$, null, $tl$9$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 4794? (Write just the number, e.g. 300)$tl$, null, $tl$700$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 1960? (Write just the number, e.g. 300)$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 3645? (Write just the number, e.g. 300)$tl$, null, $tl$40$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 3 in 6733? (Write just the number, e.g. 300)$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 2 in 2176? (Write just the number, e.g. 300)$tl$, null, $tl$2000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 2 in 6025? (Write just the number, e.g. 300)$tl$, null, $tl$20$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 4394? (Write just the number, e.g. 300)$tl$, null, $tl$90$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 3268? (Write just the number, e.g. 300)$tl$, null, $tl$60$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-thousands$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Rounding to 10 and 100 (3.NBT.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rounding-to-10-and-100$tl$, $tl$Rounding to 10 and 100$tl$, $tl$To round, look at the digit to the right of the place you're rounding to. 5 or more rounds up; less than 5 rounds down.$tl$, 3, $tl$3.NBT.A.1$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Rounding to 10 and 100$tl$, 3, $tl$[{"type": "explain", "title": "About: Rounding to 10 and 100", "body": "To round, look at the digit to the right of the place you're rounding to. 5 or more rounds up; less than 5 rounds down."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Round 93 to the nearest ten.  The answer is 90."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 93 to the nearest ten.$tl$, null, $tl$90$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 223 to the nearest hundred.$tl$, null, $tl$200$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 70 to the nearest ten.$tl$, null, $tl$70$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 514 to the nearest hundred.$tl$, null, $tl$500$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 68 to the nearest ten.$tl$, null, $tl$70$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 947 to the nearest hundred.$tl$, null, $tl$900$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 42 to the nearest ten.$tl$, null, $tl$40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 861 to the nearest hundred.$tl$, null, $tl$900$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 72 to the nearest ten.$tl$, null, $tl$70$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 684 to the nearest hundred.$tl$, null, $tl$700$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 23 to the nearest ten.$tl$, null, $tl$20$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 381 to the nearest hundred.$tl$, null, $tl$400$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 33 to the nearest ten.$tl$, null, $tl$30$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 716 to the nearest hundred.$tl$, null, $tl$700$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 46 to the nearest ten.$tl$, null, $tl$50$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 373 to the nearest hundred.$tl$, null, $tl$400$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 94 to the nearest ten.$tl$, null, $tl$90$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 530 to the nearest hundred.$tl$, null, $tl$500$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 32 to the nearest ten.$tl$, null, $tl$30$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Round 594 to the nearest hundred.$tl$, null, $tl$600$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-to-10-and-100$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Add & Subtract within 1000 (3.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$add-and-subtract-within-1000$tl$, $tl$Add & Subtract within 1000$tl$, $tl$Line up numbers by place value and add or subtract one column at a time, regrouping when a column is 10 or more.$tl$, 3, $tl$3.NBT.A.2$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Add & Subtract within 1000$tl$, 3, $tl$[{"type": "explain", "title": "About: Add & Subtract within 1000", "body": "Line up numbers by place value and add or subtract one column at a time, regrouping when a column is 10 or more."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 349 + 69 = ?  The answer is 418."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 349 + 69 = ?$tl$, null, $tl$418$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 161 - 57 = ?$tl$, null, $tl$104$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 617 + 47 = ?$tl$, null, $tl$664$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 772 - 36 = ?$tl$, null, $tl$736$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 720 + 680 = ?$tl$, null, $tl$1400$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 752 - 347 = ?$tl$, null, $tl$405$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 505 + 197 = ?$tl$, null, $tl$702$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 383 - 58 = ?$tl$, null, $tl$325$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 499 + 290 = ?$tl$, null, $tl$789$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 457 - 295 = ?$tl$, null, $tl$162$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 636 + 497 = ?$tl$, null, $tl$1133$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 762 - 453 = ?$tl$, null, $tl$309$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 400 + 56 = ?$tl$, null, $tl$456$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 261 - 208 = ?$tl$, null, $tl$53$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 463 + 188 = ?$tl$, null, $tl$651$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 899 - 112 = ?$tl$, null, $tl$787$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 844 + 385 = ?$tl$, null, $tl$1229$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 122 - 87 = ?$tl$, null, $tl$35$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Add: 610 + 493 = ?$tl$, null, $tl$1103$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Subtract: 744 - 476 = ?$tl$, null, $tl$268$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-and-subtract-within-1000$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Multiplication Facts (3.OA.C.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiplication-facts$tl$, $tl$Multiplication Facts$tl$, $tl$Multiplication is fast adding of equal groups. Knowing your facts to 10 x 10 by heart makes bigger math much easier.$tl$, 3, $tl$3.OA.C.7$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiplication Facts$tl$, 3, $tl$[{"type": "explain", "title": "About: Multiplication Facts", "body": "Multiplication is fast adding of equal groups. Knowing your facts to 10 x 10 by heart makes bigger math much easier."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Multiply: 10 x 8 = ?  The answer is 80."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 10 x 8 = ?$tl$, null, $tl$80$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 10 x 3 = ?$tl$, null, $tl$30$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 4 x 2 = ?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 3 x 9 = ?$tl$, null, $tl$27$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 5 x 2 = ?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 2 x 8 = ?$tl$, null, $tl$16$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 9 x 4 = ?$tl$, null, $tl$36$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 4 x 7 = ?$tl$, null, $tl$28$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 9 x 9 = ?$tl$, null, $tl$81$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 10 x 2 = ?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 9 x 5 = ?$tl$, null, $tl$45$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 2 x 7 = ?$tl$, null, $tl$14$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 10 x 10 = ?$tl$, null, $tl$100$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 5 x 7 = ?$tl$, null, $tl$35$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 10 x 9 = ?$tl$, null, $tl$90$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 9 x 8 = ?$tl$, null, $tl$72$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 7 x 9 = ?$tl$, null, $tl$63$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 5 x 5 = ?$tl$, null, $tl$25$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 8 x 4 = ?$tl$, null, $tl$32$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Multiply: 5 x 4 = ?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiplication-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Division Facts (3.OA.C.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$division-facts$tl$, $tl$Division Facts$tl$, $tl$Division splits a number into equal groups. It is the opposite of multiplication: if 3 x 4 = 12, then 12 / 4 = 3.$tl$, 3, $tl$3.OA.C.7$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Division Facts$tl$, 3, $tl$[{"type": "explain", "title": "About: Division Facts", "body": "Division splits a number into equal groups. It is the opposite of multiplication: if 3 x 4 = 12, then 12 / 4 = 3."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Divide: 45 / 5 = ?  The answer is 9."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 45 / 5 = ?$tl$, null, $tl$9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 81 / 9 = ?$tl$, null, $tl$9$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 36 / 6 = ?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 36 / 4 = ?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 20 / 10 = ?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 70 / 10 = ?$tl$, null, $tl$7$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 56 / 7 = ?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 72 / 9 = ?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 18 / 3 = ?$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 18 / 6 = ?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 6 / 3 = ?$tl$, null, $tl$2$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 32 / 4 = ?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 21 / 7 = ?$tl$, null, $tl$3$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 42 / 7 = ?$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 60 / 6 = ?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 90 / 10 = ?$tl$, null, $tl$9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 90 / 9 = ?$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 35 / 5 = ?$tl$, null, $tl$7$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 63 / 7 = ?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Divide: 63 / 9 = ?$tl$, null, $tl$7$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-facts$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Equal Groups (3.OA.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$equal-groups$tl$, $tl$Equal Groups$tl$, $tl$When you have several equal groups, multiply the number of groups by how many are in each group to find the total.$tl$, 3, $tl$3.OA.A.1$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Equal Groups$tl$, 3, $tl$[{"type": "explain", "title": "About: Equal Groups", "body": "When you have several equal groups, multiply the number of groups by how many are in each group to find the total."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: There are 5 groups with 9 in each group. How many in all?  The answer is 45."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 5 groups with 9 in each group. How many in all?$tl$, null, $tl$45$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$81 things are shared equally into 9 groups. How many in each group?$tl$, null, $tl$9$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 3 groups with 4 in each group. How many in all?$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$12 things are shared equally into 6 groups. How many in each group?$tl$, null, $tl$2$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 7 groups with 8 in each group. How many in all?$tl$, null, $tl$56$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$28 things are shared equally into 7 groups. How many in each group?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 2 groups with 6 in each group. How many in all?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$18 things are shared equally into 3 groups. How many in each group?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 6 groups with 3 in each group. How many in all?$tl$, null, $tl$18$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$18 things are shared equally into 9 groups. How many in each group?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 2 groups with 8 in each group. How many in all?$tl$, null, $tl$16$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$15 things are shared equally into 3 groups. How many in each group?$tl$, null, $tl$5$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 3 groups with 5 in each group. How many in all?$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$14 things are shared equally into 7 groups. How many in each group?$tl$, null, $tl$2$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 5 groups with 4 in each group. How many in all?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$15 things are shared equally into 5 groups. How many in each group?$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 8 groups with 4 in each group. How many in all?$tl$, null, $tl$32$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$24 things are shared equally into 4 groups. How many in each group?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$There are 7 groups with 7 in each group. How many in all?$tl$, null, $tl$49$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$18 things are shared equally into 3 groups. How many in each group?$tl$, null, $tl$6$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equal-groups$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Understanding Fractions (3.NF.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$unit-fractions$tl$, $tl$Understanding Fractions$tl$, $tl$A fraction names equal parts of a whole. The bottom number tells how many equal parts there are; 1/4 means 1 of 4 equal parts.$tl$, 3, $tl$3.NF.A.1$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Understanding Fractions$tl$, 3, $tl$[{"type": "explain", "title": "About: Understanding Fractions", "body": "A fraction names equal parts of a whole. The bottom number tells how many equal parts there are; 1/4 means 1 of 4 equal parts."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: The fraction 1/6 means 1 out of how many equal parts?  The answer is 6."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is bigger: 1/4 or 1/3?", "choices": [{"id": "a", "label": "1/4"}, {"id": "b", "label": "1/3"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "Neither"}], "answer": "b", "explanation": "The correct answer is \"1/3\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/6 means 1 out of how many equal parts?$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/4 or 1/3?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "1/3"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/6 means 1 out of how many equal parts?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/6 or 1/3?$tl$, $tl$[{"id": "a", "label": "1/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1/3"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/2 means 1 out of how many equal parts?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/8 or 1/4?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1/4"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/2 means 1 out of how many equal parts?$tl$, null, $tl$2$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/2 or 1/3?$tl$, $tl$[{"id": "a", "label": "1/2"}, {"id": "b", "label": "1/3"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/3 means 1 out of how many equal parts?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/8 or 1/2?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1/2"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/4 means 1 out of how many equal parts?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/8 or 1/2?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "1/2"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/4 means 1 out of how many equal parts?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/6 or 1/8?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "Neither"}, {"id": "d", "label": "1/6"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/8 means 1 out of how many equal parts?$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/2 or 1/8?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "Neither"}, {"id": "d", "label": "1/2"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/4 means 1 out of how many equal parts?$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/3 or 1/2?$tl$, $tl$[{"id": "a", "label": "1/3"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1/2"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The fraction 1/6 means 1 out of how many equal parts?$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is bigger: 1/8 or 1/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "1/8"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "Neither"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Comparing Fractions (3.NF.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$comparing-fractions$tl$, $tl$Comparing Fractions$tl$, $tl$When fractions have the same bottom number (denominator), the one with the bigger top number (numerator) is greater.$tl$, 3, $tl$3.NF.A.3$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Fractions$tl$, 3, $tl$[{"type": "explain", "title": "About: Comparing Fractions", "body": "When fractions have the same bottom number (denominator), the one with the bigger top number (numerator) is greater."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which fraction is greater: 1/3 or 2/3?  The correct answer is \"2/3\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is greater: 2/4 or 1/4?", "choices": [{"id": "a", "label": "2/4"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/4"}], "answer": "a", "explanation": "The correct answer is \"2/4\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/3 or 2/3?$tl$, $tl$[{"id": "a", "label": "2/3"}, {"id": "b", "label": "1/3"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/3"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/4 or 1/4?$tl$, $tl$[{"id": "a", "label": "2/4"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/8 or 7/8?$tl$, $tl$[{"id": "a", "label": "2/8"}, {"id": "b", "label": "7/8"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "9/8"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/3 or 1/3?$tl$, $tl$[{"id": "a", "label": "1/3"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "2/3"}, {"id": "d", "label": "3/3"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/8 or 6/8?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "6/8"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "7/8"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/5 or 3/5?$tl$, $tl$[{"id": "a", "label": "3/5"}, {"id": "b", "label": "1/5"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "4/5"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/4 or 1/4?$tl$, $tl$[{"id": "a", "label": "2/4"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/3 or 2/3?$tl$, $tl$[{"id": "a", "label": "1/3"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "3/3"}, {"id": "d", "label": "2/3"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/5 or 3/5?$tl$, $tl$[{"id": "a", "label": "3/5"}, {"id": "b", "label": "2/5"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/5"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 4/8 or 2/8?$tl$, $tl$[{"id": "a", "label": "2/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "6/8"}, {"id": "d", "label": "4/8"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/3 or 1/3?$tl$, $tl$[{"id": "a", "label": "1/3"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "2/3"}, {"id": "d", "label": "3/3"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 2/4 or 1/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "3/4"}, {"id": "d", "label": "2/4"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/4 or 3/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "3/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "4/4"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 7/8 or 1/8?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "7/8"}, {"id": "d", "label": "8/8"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/3 or 2/3?$tl$, $tl$[{"id": "a", "label": "1/3"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "2/3"}, {"id": "d", "label": "3/3"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 3/8 or 2/8?$tl$, $tl$[{"id": "a", "label": "3/8"}, {"id": "b", "label": "2/8"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/8"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/5 or 3/5?$tl$, $tl$[{"id": "a", "label": "1/5"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "3/5"}, {"id": "d", "label": "4/5"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 3/4 or 2/4?$tl$, $tl$[{"id": "a", "label": "2/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "5/4"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 3/5 or 4/5?$tl$, $tl$[{"id": "a", "label": "4/5"}, {"id": "b", "label": "3/5"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "7/5"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which fraction is greater: 1/6 or 2/6?$tl$, $tl$[{"id": "a", "label": "1/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "2/6"}, {"id": "d", "label": "3/6"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Area of Rectangles (3.MD.C.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$area-of-rectangles$tl$, $tl$Area of Rectangles$tl$, $tl$Area is the space inside a shape, measured in square units. For a rectangle, multiply length by width.$tl$, 3, $tl$3.MD.C.7$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Area of Rectangles$tl$, 3, $tl$[{"type": "explain", "title": "About: Area of Rectangles", "body": "Area is the space inside a shape, measured in square units. For a rectangle, multiply length by width."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A rectangle is 3 units long and 9 units wide. What is its area in square units?  The answer is 27."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 9 units wide. What is its area in square units?$tl$, null, $tl$27$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 12 units long and 9 units wide. What is its area in square units?$tl$, null, $tl$108$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 11 units long and 3 units wide. What is its area in square units?$tl$, null, $tl$33$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 2 units long and 2 units wide. What is its area in square units?$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 9 units long and 9 units wide. What is its area in square units?$tl$, null, $tl$81$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 5 units long and 9 units wide. What is its area in square units?$tl$, null, $tl$45$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 4 units wide. What is its area in square units?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 5 units wide. What is its area in square units?$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 5 units long and 2 units wide. What is its area in square units?$tl$, null, $tl$10$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 2 units long and 10 units wide. What is its area in square units?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 5 units long and 12 units wide. What is its area in square units?$tl$, null, $tl$60$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 9 units long and 10 units wide. What is its area in square units?$tl$, null, $tl$90$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 9 units long and 11 units wide. What is its area in square units?$tl$, null, $tl$99$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 6 units long and 5 units wide. What is its area in square units?$tl$, null, $tl$30$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 12 units long and 11 units wide. What is its area in square units?$tl$, null, $tl$132$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 7 units long and 8 units wide. What is its area in square units?$tl$, null, $tl$56$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 2 units long and 4 units wide. What is its area in square units?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 2 units long and 12 units wide. What is its area in square units?$tl$, null, $tl$24$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 7 units wide. What is its area in square units?$tl$, null, $tl$21$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 10 units long and 2 units wide. What is its area in square units?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$area-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Perimeter of Rectangles (3.MD.D.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$perimeter-of-rectangles$tl$, $tl$Perimeter of Rectangles$tl$, $tl$Perimeter is the distance all the way around a shape. Add up the lengths of all the sides.$tl$, 3, $tl$3.MD.D.8$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Perimeter of Rectangles$tl$, 3, $tl$[{"type": "explain", "title": "About: Perimeter of Rectangles", "body": "Perimeter is the distance all the way around a shape. Add up the lengths of all the sides."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A rectangle is 13 units long and 15 units wide. What is its perimeter (add up all 4 sides)?  The answer is 56."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 13 units long and 15 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$56$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 8 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$22$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 12 units long and 6 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$36$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 5 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$16$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 10 units long and 10 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$40$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 9 units long and 11 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 8 units long and 13 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$42$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 11 units long and 15 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$52$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 15 units long and 14 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$58$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 7 units long and 2 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$18$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 2 units long and 3 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 15 units long and 11 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$52$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 4 units long and 10 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$28$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 7 units long and 13 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$40$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 4 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$14$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 3 units long and 2 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 14 units long and 6 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 12 units long and 8 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$40$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 10 units long and 11 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$42$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A rectangle is 15 units long and 9 units wide. What is its perimeter (add up all 4 sides)?$tl$, null, $tl$48$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$perimeter-of-rectangles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Forces & Motion (3-PS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$forces-and-motion$tl$, $tl$Forces & Motion$tl$, $tl$A force is a push or a pull. Forces can make things start, stop, speed up, slow down, or change direction.$tl$, 3, $tl$3-PS2-1$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Forces & Motion$tl$, 3, $tl$[{"type": "explain", "title": "About: Forces & Motion", "body": "A force is a push or a pull. Forces can make things start, stop, speed up, slow down, or change direction."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A push or a pull is called a:  The correct answer is \"force\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "To make a still ball start rolling, you must:", "choices": [{"id": "a", "label": "push or pull it"}, {"id": "b", "label": "look at it"}, {"id": "c", "label": "name it"}, {"id": "d", "label": "wait"}], "answer": "a", "explanation": "The correct answer is \"push or pull it\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A push or a pull is called a:$tl$, $tl$[{"id": "a", "label": "force"}, {"id": "b", "label": "color"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "shadow"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$To make a still ball start rolling, you must:$tl$, $tl$[{"id": "a", "label": "push or pull it"}, {"id": "b", "label": "look at it"}, {"id": "c", "label": "name it"}, {"id": "d", "label": "wait"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Kicking a soccer ball is an example of a:$tl$, $tl$[{"id": "a", "label": "pull"}, {"id": "b", "label": "push"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "freeze"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Opening a drawer toward you is an example of a:$tl$, $tl$[{"id": "a", "label": "push"}, {"id": "b", "label": "pull"}, {"id": "c", "label": "spin"}, {"id": "d", "label": "drop"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The bigger the force on an object, usually the:$tl$, $tl$[{"id": "a", "label": "less it moves"}, {"id": "b", "label": "colder it gets"}, {"id": "c", "label": "quieter it gets"}, {"id": "d", "label": "more its motion changes"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which makes a wagon speed up more?$tl$, $tl$[{"id": "a", "label": "a gentle tap"}, {"id": "b", "label": "no push"}, {"id": "c", "label": "a whisper"}, {"id": "d", "label": "a hard push"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Friction is a force that:$tl$, $tl$[{"id": "a", "label": "speeds things up forever"}, {"id": "b", "label": "makes light"}, {"id": "c", "label": "slows things down"}, {"id": "d", "label": "makes sound only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A ball rolling on grass stops sooner than on smooth floor because of more:$tl$, $tl$[{"id": "a", "label": "gravity to space"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "friction"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Gravity is a force that pulls objects:$tl$, $tl$[{"id": "a", "label": "up to the sky"}, {"id": "b", "label": "down toward Earth"}, {"id": "c", "label": "sideways always"}, {"id": "d", "label": "apart"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When you drop a ball, it falls because of:$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "magnets"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$To change the direction of a moving cart, you can:$tl$, $tl$[{"id": "a", "label": "close your eyes"}, {"id": "b", "label": "say stop"}, {"id": "c", "label": "push it from the side"}, {"id": "d", "label": "add a sticker"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which needs a bigger push to move?$tl$, $tl$[{"id": "a", "label": "an empty box"}, {"id": "b", "label": "a heavy box"}, {"id": "c", "label": "a feather"}, {"id": "d", "label": "a balloon"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A force can change an object's:$tl$, $tl$[{"id": "a", "label": "speed and direction"}, {"id": "b", "label": "name"}, {"id": "c", "label": "color only"}, {"id": "d", "label": "smell"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Pulling a sled up a hill is harder because gravity pulls it:$tl$, $tl$[{"id": "a", "label": "uphill"}, {"id": "b", "label": "sideways"}, {"id": "c", "label": "downhill"}, {"id": "d", "label": "up"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Pressing the brakes on a bike uses friction to:$tl$, $tl$[{"id": "a", "label": "speed it up"}, {"id": "b", "label": "slow it down"}, {"id": "c", "label": "make it fly"}, {"id": "d", "label": "change its color"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which surface has the LEAST friction?$tl$, $tl$[{"id": "a", "label": "rough sandpaper"}, {"id": "b", "label": "smooth ice"}, {"id": "c", "label": "a gravel road"}, {"id": "d", "label": "carpet"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A push or a pull is called a ____. (one word)$tl$, null, $tl$force$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If no force acts on a still object, it will:$tl$, $tl$[{"id": "a", "label": "start moving on its own"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "stay still"}, {"id": "d", "label": "grow"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Throwing a ball harder makes it go:$tl$, $tl$[{"id": "a", "label": "slower"}, {"id": "b", "label": "faster and farther"}, {"id": "c", "label": "backward"}, {"id": "d", "label": "nowhere"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two people pulling a rope are each using a:$tl$, $tl$[{"id": "a", "label": "push only"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "light"}, {"id": "d", "label": "pull (force)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Balanced & Unbalanced Forces (3-PS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$balanced-and-unbalanced-forces$tl$, $tl$Balanced & Unbalanced Forces$tl$, $tl$Balanced forces are equal and opposite, so motion stays the same. Unbalanced forces change how something moves.$tl$, 3, $tl$3-PS2-1$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Balanced & Unbalanced Forces$tl$, 3, $tl$[{"type": "explain", "title": "About: Balanced & Unbalanced Forces", "body": "Balanced forces are equal and opposite, so motion stays the same. Unbalanced forces change how something moves."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: When two forces are equal and opposite, they are:  The correct answer is \"balanced\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "In a tug-of-war where nobody moves, the forces are:", "choices": [{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "zero people"}, {"id": "c", "label": "balanced"}, {"id": "d", "label": "huge"}], "answer": "c", "explanation": "The correct answer is \"balanced\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When two forces are equal and opposite, they are:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "unbalanced"}, {"id": "c", "label": "gone"}, {"id": "d", "label": "magnetic"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$In a tug-of-war where nobody moves, the forces are:$tl$, $tl$[{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "zero people"}, {"id": "c", "label": "balanced"}, {"id": "d", "label": "huge"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Balanced forces on a still object make it:$tl$, $tl$[{"id": "a", "label": "speed up"}, {"id": "b", "label": "fall apart"}, {"id": "c", "label": "glow"}, {"id": "d", "label": "stay still"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Unbalanced forces cause an object's motion to:$tl$, $tl$[{"id": "a", "label": "stay exactly the same"}, {"id": "b", "label": "change"}, {"id": "c", "label": "disappear"}, {"id": "d", "label": "freeze"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A book resting on a table has forces that are:$tl$, $tl$[{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "balanced"}, {"id": "c", "label": "spinning"}, {"id": "d", "label": "missing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If one team in tug-of-war pulls harder, the forces become:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "equal"}, {"id": "c", "label": "silent"}, {"id": "d", "label": "unbalanced"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When forces are unbalanced, the object moves toward the:$tl$, $tl$[{"id": "a", "label": "stronger force"}, {"id": "b", "label": "weaker force"}, {"id": "c", "label": "ceiling always"}, {"id": "d", "label": "past"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A parked car with the brake on stays still because forces are:$tl$, $tl$[{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "invisible"}, {"id": "c", "label": "magnetic"}, {"id": "d", "label": "balanced"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Pushing a swing harder on one side makes the forces:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "unbalanced"}, {"id": "c", "label": "gone"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Balanced forces add up to a total push of:$tl$, $tl$[{"id": "a", "label": "one hundred"}, {"id": "b", "label": "a lot"}, {"id": "c", "label": "zero"}, {"id": "d", "label": "infinity"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A floating boat that stays in place has forces that are:$tl$, $tl$[{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "upward only"}, {"id": "c", "label": "spinning"}, {"id": "d", "label": "balanced"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$To start a still object moving, you need forces that are:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "equal"}, {"id": "c", "label": "zero"}, {"id": "d", "label": "unbalanced"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which shows balanced forces?$tl$, $tl$[{"id": "a", "label": "a car speeding up"}, {"id": "b", "label": "a rope not moving in tug-of-war"}, {"id": "c", "label": "a falling apple"}, {"id": "d", "label": "a kicked ball"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which shows unbalanced forces?$tl$, $tl$[{"id": "a", "label": "a book sitting still"}, {"id": "b", "label": "a parked bike"}, {"id": "c", "label": "a sled sliding downhill"}, {"id": "d", "label": "a resting cat"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When you stop pushing a rolling cart, friction is an:$tl$, $tl$[{"id": "a", "label": "balanced force"}, {"id": "b", "label": "unbalanced force that slows it"}, {"id": "c", "label": "light"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Forces that are equal and opposite are called ____. (one word)$tl$, null, $tl$balanced$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If forces on an object are balanced, its speed:$tl$, $tl$[{"id": "a", "label": "always increases"}, {"id": "b", "label": "does not change"}, {"id": "c", "label": "always decreases"}, {"id": "d", "label": "doubles"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$An arrow flying forward then slowing shows forces that became:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "zero"}, {"id": "c", "label": "magnetic"}, {"id": "d", "label": "unbalanced (air pushes back)"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two equal teams in tug-of-war keep the flag:$tl$, $tl$[{"id": "a", "label": "in the middle"}, {"id": "b", "label": "moving fast"}, {"id": "c", "label": "off the ground"}, {"id": "d", "label": "spinning"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A magnet pulling a paperclip until they stick shows an:$tl$, $tl$[{"id": "a", "label": "unbalanced force"}, {"id": "b", "label": "balanced force"}, {"id": "c", "label": "no force"}, {"id": "d", "label": "sound force"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$balanced-and-unbalanced-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Patterns of Motion (3-PS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$patterns-of-motion$tl$, $tl$Patterns of Motion$tl$, $tl$Many motions repeat in patterns, like a swing or a clock. When motion has a pattern, we can predict what comes next.$tl$, 3, $tl$3-PS2-2$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Patterns of Motion$tl$, 3, $tl$[{"type": "explain", "title": "About: Patterns of Motion", "body": "Many motions repeat in patterns, like a swing or a clock. When motion has a pattern, we can predict what comes next."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A swing going back and forth shows a motion that is:  The correct answer is \"repeating (a pattern)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Because motion follows patterns, we can:", "choices": [{"id": "a", "label": "never guess"}, {"id": "b", "label": "stop time"}, {"id": "c", "label": "make new matter"}, {"id": "d", "label": "predict where it goes next"}], "answer": "d", "explanation": "The correct answer is \"predict where it goes next\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A swing going back and forth shows a motion that is:$tl$, $tl$[{"id": "a", "label": "random"}, {"id": "b", "label": "stopped"}, {"id": "c", "label": "repeating (a pattern)"}, {"id": "d", "label": "one-time"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Because motion follows patterns, we can:$tl$, $tl$[{"id": "a", "label": "never guess"}, {"id": "b", "label": "stop time"}, {"id": "c", "label": "make new matter"}, {"id": "d", "label": "predict where it goes next"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A bouncing ball usually bounces:$tl$, $tl$[{"id": "a", "label": "higher forever"}, {"id": "b", "label": "sideways only"}, {"id": "c", "label": "a little lower each time"}, {"id": "d", "label": "not at all"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The hands of a clock move in a pattern that:$tl$, $tl$[{"id": "a", "label": "repeats every hour"}, {"id": "b", "label": "never repeats"}, {"id": "c", "label": "is random"}, {"id": "d", "label": "stops at noon"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A merry-go-round spins in a motion that is:$tl$, $tl$[{"id": "a", "label": "straight only"}, {"id": "b", "label": "zig-zag"}, {"id": "c", "label": "backward only"}, {"id": "d", "label": "round and round (circular)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A pendulum swings in a pattern, so its next swing is:$tl$, $tl$[{"id": "a", "label": "impossible to know"}, {"id": "b", "label": "always different"}, {"id": "c", "label": "invisible"}, {"id": "d", "label": "easy to predict"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Day and night happen in a repeating:$tl$, $tl$[{"id": "a", "label": "pattern"}, {"id": "b", "label": "accident"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "force"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A jump rope spinning makes a motion that is:$tl$, $tl$[{"id": "a", "label": "one-time"}, {"id": "b", "label": "random"}, {"id": "c", "label": "still"}, {"id": "d", "label": "repeating"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If a toy car goes around a loop track the same way each time, the motion is:$tl$, $tl$[{"id": "a", "label": "unpredictable"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "predictable"}, {"id": "d", "label": "new each time"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A heartbeat is a motion pattern that:$tl$, $tl$[{"id": "a", "label": "happens once"}, {"id": "b", "label": "is random"}, {"id": "c", "label": "never changes speed ever"}, {"id": "d", "label": "repeats steadily"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Waves at the beach roll in a pattern that is:$tl$, $tl$[{"id": "a", "label": "repeating"}, {"id": "b", "label": "one-time"}, {"id": "c", "label": "random"}, {"id": "d", "label": "backward only"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Knowing a pattern of motion helps you:$tl$, $tl$[{"id": "a", "label": "catch a bouncing ball"}, {"id": "b", "label": "change its color"}, {"id": "c", "label": "make it vanish"}, {"id": "d", "label": "stop gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A seesaw goes up and down in a motion that is:$tl$, $tl$[{"id": "a", "label": "random"}, {"id": "b", "label": "still"}, {"id": "c", "label": "repeating"}, {"id": "d", "label": "one-way"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The Moon's phases follow a:$tl$, $tl$[{"id": "a", "label": "repeating pattern"}, {"id": "b", "label": "random order"}, {"id": "c", "label": "straight line"}, {"id": "d", "label": "single event"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A spinning top slows and then:$tl$, $tl$[{"id": "a", "label": "falls over (pattern ends)"}, {"id": "b", "label": "spins forever"}, {"id": "c", "label": "flies away"}, {"id": "d", "label": "grows"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Motion that repeats over and over is called a ____. (one word)$tl$, null, $tl$pattern$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which motion is easiest to predict?$tl$, $tl$[{"id": "a", "label": "a leaf in a gusty wind"}, {"id": "b", "label": "a bouncing surprise toy"}, {"id": "c", "label": "a popping balloon"}, {"id": "d", "label": "a swing that swings the same each time"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A train on a track moves in a path that is:$tl$, $tl$[{"id": "a", "label": "totally random"}, {"id": "b", "label": "invisible"}, {"id": "c", "label": "fixed and predictable"}, {"id": "d", "label": "backward only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A ball rolled the same way down the same ramp will:$tl$, $tl$[{"id": "a", "label": "go a wildly different way"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "float"}, {"id": "d", "label": "go about the same distance"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Patterns in motion repeat, which makes them:$tl$, $tl$[{"id": "a", "label": "impossible"}, {"id": "b", "label": "magic"}, {"id": "c", "label": "predictable"}, {"id": "d", "label": "silent"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-of-motion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Magnets & Forces (3-PS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$magnets-and-forces$tl$, $tl$Magnets & Forces$tl$, $tl$Magnets pull on iron and can push or pull other magnets without touching. Opposite poles attract; like poles repel.$tl$, 3, $tl$3-PS2-3$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Magnets & Forces$tl$, 3, $tl$[{"type": "explain", "title": "About: Magnets & Forces", "body": "Magnets pull on iron and can push or pull other magnets without touching. Opposite poles attract; like poles repel."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A magnet can pull objects made of:  The correct answer is \"iron\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Magnets can push or pull without:", "choices": [{"id": "a", "label": "any poles"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "Earth"}, {"id": "d", "label": "touching"}], "answer": "d", "explanation": "The correct answer is \"touching\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A magnet can pull objects made of:$tl$, $tl$[{"id": "a", "label": "iron"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "wood"}, {"id": "d", "label": "glass"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Magnets can push or pull without:$tl$, $tl$[{"id": "a", "label": "any poles"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "Earth"}, {"id": "d", "label": "touching"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two north poles brought together will:$tl$, $tl$[{"id": "a", "label": "pull together"}, {"id": "b", "label": "melt"}, {"id": "c", "label": "push apart (repel)"}, {"id": "d", "label": "glow"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A north pole and a south pole will:$tl$, $tl$[{"id": "a", "label": "repel"}, {"id": "b", "label": "pull together (attract)"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "spin"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which object would a magnet attract?$tl$, $tl$[{"id": "a", "label": "a rubber band"}, {"id": "b", "label": "a paper cup"}, {"id": "c", "label": "a wooden block"}, {"id": "d", "label": "a steel paperclip"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A magnet's force is strongest at its:$tl$, $tl$[{"id": "a", "label": "middle"}, {"id": "b", "label": "color"}, {"id": "c", "label": "weight"}, {"id": "d", "label": "poles"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Magnetism is a force that works:$tl$, $tl$[{"id": "a", "label": "across a small distance"}, {"id": "b", "label": "only by touching with glue"}, {"id": "c", "label": "only underwater"}, {"id": "d", "label": "only at night"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which would NOT stick to a magnet?$tl$, $tl$[{"id": "a", "label": "an iron nail"}, {"id": "b", "label": "a steel pin"}, {"id": "c", "label": "a plastic spoon"}, {"id": "d", "label": "a metal washer"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A compass needle is a small:$tl$, $tl$[{"id": "a", "label": "battery"}, {"id": "b", "label": "light"}, {"id": "c", "label": "clock"}, {"id": "d", "label": "magnet"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two magnets that snap together were showing:$tl$, $tl$[{"id": "a", "label": "repulsion"}, {"id": "b", "label": "friction only"}, {"id": "c", "label": "attraction"}, {"id": "d", "label": "gravity only"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If two magnets push apart, their facing poles are:$tl$, $tl$[{"id": "a", "label": "opposite"}, {"id": "b", "label": "missing"}, {"id": "c", "label": "melted"}, {"id": "d", "label": "the same"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Earth itself acts like a giant:$tl$, $tl$[{"id": "a", "label": "battery"}, {"id": "b", "label": "mirror"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "fossil"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$You can make a paperclip move with a magnet held:$tl$, $tl$[{"id": "a", "label": "a mile away"}, {"id": "b", "label": "near it (not touching)"}, {"id": "c", "label": "underwater only"}, {"id": "d", "label": "in the dark only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Magnets are useful for:$tl$, $tl$[{"id": "a", "label": "making sound"}, {"id": "b", "label": "holding notes on a fridge"}, {"id": "c", "label": "growing plants"}, {"id": "d", "label": "cooling soup"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which pair would attract?$tl$, $tl$[{"id": "a", "label": "north and north"}, {"id": "b", "label": "north pole and south pole"}, {"id": "c", "label": "south and south"}, {"id": "d", "label": "two plastics"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$When opposite poles pull together, we say they ____. (one word)$tl$, null, $tl$attract$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A stronger magnet can pick up:$tl$, $tl$[{"id": "a", "label": "more paperclips"}, {"id": "b", "label": "fewer paperclips"}, {"id": "c", "label": "no metal"}, {"id": "d", "label": "only plastic"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Magnetic force can pass through a thin sheet of:$tl$, $tl$[{"id": "a", "label": "thick steel easily"}, {"id": "b", "label": "lead"}, {"id": "c", "label": "paper"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Sorting metal cans with a giant magnet works because cans have:$tl$, $tl$[{"id": "a", "label": "iron/steel"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "wood"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Like poles (both south) will:$tl$, $tl$[{"id": "a", "label": "repel"}, {"id": "b", "label": "attract"}, {"id": "c", "label": "stick"}, {"id": "d", "label": "melt"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$magnets-and-forces$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Life Cycles (3-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$life-cycles$tl$, $tl$Life Cycles$tl$, $tl$Living things are born, grow, reproduce, and die. Different plants and animals go through different life-cycle stages.$tl$, 3, $tl$3-LS1-1$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Life Cycles$tl$, 3, $tl$[{"type": "explain", "title": "About: Life Cycles", "body": "Living things are born, grow, reproduce, and die. Different plants and animals go through different life-cycle stages."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: The stages a living thing goes through is called its:  The correct answer is \"life cycle\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A butterfly starts its life as an:", "choices": [{"id": "a", "label": "egg"}, {"id": "b", "label": "adult"}, {"id": "c", "label": "cocoon first"}, {"id": "d", "label": "old butterfly"}], "answer": "a", "explanation": "The correct answer is \"egg\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The stages a living thing goes through is called its:$tl$, $tl$[{"id": "a", "label": "habitat"}, {"id": "b", "label": "force"}, {"id": "c", "label": "weather"}, {"id": "d", "label": "life cycle"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A butterfly starts its life as an:$tl$, $tl$[{"id": "a", "label": "egg"}, {"id": "b", "label": "adult"}, {"id": "c", "label": "cocoon first"}, {"id": "d", "label": "old butterfly"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$After hatching, a butterfly is a:$tl$, $tl$[{"id": "a", "label": "frog"}, {"id": "b", "label": "bird"}, {"id": "c", "label": "caterpillar (larva)"}, {"id": "d", "label": "seed"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A caterpillar forms a chrysalis and becomes a:$tl$, $tl$[{"id": "a", "label": "butterfly"}, {"id": "b", "label": "beetle"}, {"id": "c", "label": "fish"}, {"id": "d", "label": "flower"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A frog begins life as an egg, then becomes a:$tl$, $tl$[{"id": "a", "label": "tadpole"}, {"id": "b", "label": "caterpillar"}, {"id": "c", "label": "chick"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A plant's life cycle often starts with a:$tl$, $tl$[{"id": "a", "label": "flower first"}, {"id": "b", "label": "seed"}, {"id": "c", "label": "fruit first"}, {"id": "d", "label": "leaf first"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Most living things' life cycles end with:$tl$, $tl$[{"id": "a", "label": "birth"}, {"id": "b", "label": "death"}, {"id": "c", "label": "an egg"}, {"id": "d", "label": "a seed"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A chicken's life cycle begins with an:$tl$, $tl$[{"id": "a", "label": "adult hen only"}, {"id": "b", "label": "chick that never grows"}, {"id": "c", "label": "egg"}, {"id": "d", "label": "feather"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is the correct order for a butterfly?$tl$, $tl$[{"id": "a", "label": "butterfly, egg, chick"}, {"id": "b", "label": "seed, sprout, tree"}, {"id": "c", "label": "egg, caterpillar, chrysalis, butterfly"}, {"id": "d", "label": "tadpole, frog"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Seeds grow into seedlings, then into:$tl$, $tl$[{"id": "a", "label": "animals"}, {"id": "b", "label": "adult plants"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "clouds"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A tadpole grows legs and loses its tail to become a:$tl$, $tl$[{"id": "a", "label": "fish"}, {"id": "b", "label": "frog"}, {"id": "c", "label": "snake"}, {"id": "d", "label": "bird"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$All life cycles include being born, growing, and:$tl$, $tl$[{"id": "a", "label": "reproducing"}, {"id": "b", "label": "flying"}, {"id": "c", "label": "melting"}, {"id": "d", "label": "shrinking only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A young dog is called a:$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "calf"}, {"id": "c", "label": "chick"}, {"id": "d", "label": "fawn"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Reproduction means living things:$tl$, $tl$[{"id": "a", "label": "change color"}, {"id": "b", "label": "make more of their own kind"}, {"id": "c", "label": "get colder"}, {"id": "d", "label": "stop eating"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which animal hatches from an egg?$tl$, $tl$[{"id": "a", "label": "a dog"}, {"id": "b", "label": "a chicken"}, {"id": "c", "label": "a cat"}, {"id": "d", "label": "a horse"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The stages of growth and change in a living thing make up its life ____. (one word)$tl$, null, $tl$cycle$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A flower can become a fruit that holds:$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "water only"}, {"id": "c", "label": "air"}, {"id": "d", "label": "seeds"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A baby cow is called a:$tl$, $tl$[{"id": "a", "label": "calf"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "kitten"}, {"id": "d", "label": "cub"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Plants and animals both grow and then:$tl$, $tl$[{"id": "a", "label": "turn to stone"}, {"id": "b", "label": "make new offspring"}, {"id": "c", "label": "stop the cycle forever after birth"}, {"id": "d", "label": "become weather"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The chrysalis stage is when a caterpillar:$tl$, $tl$[{"id": "a", "label": "lays eggs"}, {"id": "b", "label": "changes into a butterfly"}, {"id": "c", "label": "eats the most"}, {"id": "d", "label": "flies"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$life-cycles$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Traits & Inheritance (3-LS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$traits-and-inheritance$tl$, $tl$Traits & Inheritance$tl$, $tl$Offspring inherit traits from their parents, which is why young plants and animals resemble the ones they came from.$tl$, 3, $tl$3-LS3-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Traits & Inheritance$tl$, 3, $tl$[{"type": "explain", "title": "About: Traits & Inheritance", "body": "Offspring inherit traits from their parents, which is why young plants and animals resemble the ones they came from."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A feature passed from parents to offspring is a:  The correct answer is \"trait\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Puppies often look like their:", "choices": [{"id": "a", "label": "parents"}, {"id": "b", "label": "food"}, {"id": "c", "label": "owners' cars"}, {"id": "d", "label": "toys"}], "answer": "a", "explanation": "The correct answer is \"parents\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A feature passed from parents to offspring is a:$tl$, $tl$[{"id": "a", "label": "force"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "trait"}, {"id": "d", "label": "season"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Puppies often look like their:$tl$, $tl$[{"id": "a", "label": "parents"}, {"id": "b", "label": "food"}, {"id": "c", "label": "owners' cars"}, {"id": "d", "label": "toys"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Eye color in people is mostly a:$tl$, $tl$[{"id": "a", "label": "inherited trait"}, {"id": "b", "label": "choice"}, {"id": "c", "label": "weather event"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Offspring inherit traits from:$tl$, $tl$[{"id": "a", "label": "their parents"}, {"id": "b", "label": "the weather"}, {"id": "c", "label": "their friends"}, {"id": "d", "label": "the soil"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A tall plant often has seeds that grow into plants that are:$tl$, $tl$[{"id": "a", "label": "always short"}, {"id": "b", "label": "tall too"}, {"id": "c", "label": "made of metal"}, {"id": "d", "label": "blue"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an inherited trait of a dog?$tl$, $tl$[{"id": "a", "label": "a leash it wears"}, {"id": "b", "label": "fur color"}, {"id": "c", "label": "its name"}, {"id": "d", "label": "its collar"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Baby animals usually resemble but are not exactly like their:$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "parents"}, {"id": "c", "label": "houses"}, {"id": "d", "label": "food"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The flower color of a plant is passed down from the:$tl$, $tl$[{"id": "a", "label": "gardener"}, {"id": "b", "label": "pot"}, {"id": "c", "label": "sun only"}, {"id": "d", "label": "parent plant"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Inherited means a trait is:$tl$, $tl$[{"id": "a", "label": "passed from parent to offspring"}, {"id": "b", "label": "learned at school"}, {"id": "c", "label": "bought in a store"}, {"id": "d", "label": "made by weather"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Kittens in one litter may have different:$tl$, $tl$[{"id": "a", "label": "fur patterns"}, {"id": "b", "label": "numbers of parents"}, {"id": "c", "label": "planets"}, {"id": "d", "label": "alphabets"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A trait you are born with is:$tl$, $tl$[{"id": "a", "label": "learned"}, {"id": "b", "label": "painted on"}, {"id": "c", "label": "inherited"}, {"id": "d", "label": "temporary always"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is most likely inherited?$tl$, $tl$[{"id": "a", "label": "a sticker on a tree"}, {"id": "b", "label": "a fence around it"}, {"id": "c", "label": "the shape of a leaf"}, {"id": "d", "label": "a sign"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Tall parents are more likely to have children who are:$tl$, $tl$[{"id": "a", "label": "tall"}, {"id": "b", "label": "always short"}, {"id": "c", "label": "made of plastic"}, {"id": "d", "label": "green"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Offspring are similar to their parents but also show:$tl$, $tl$[{"id": "a", "label": "small differences"}, {"id": "b", "label": "no differences ever"}, {"id": "c", "label": "opposite traits only"}, {"id": "d", "label": "no traits"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A calf inherits its coat color from its:$tl$, $tl$[{"id": "a", "label": "parents"}, {"id": "b", "label": "barn"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "feed"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A feature passed from parents to their young is called a ____. (one word)$tl$, null, $tl$trait$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which of these is an inherited plant trait?$tl$, $tl$[{"id": "a", "label": "the label on the pot"}, {"id": "b", "label": "petal color"}, {"id": "c", "label": "the water can"}, {"id": "d", "label": "the shelf"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Baby birds usually have feathers like their:$tl$, $tl$[{"id": "a", "label": "parents"}, {"id": "b", "label": "nest"}, {"id": "c", "label": "tree"}, {"id": "d", "label": "sky"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Inherited traits help us see that offspring:$tl$, $tl$[{"id": "a", "label": "have no parents"}, {"id": "b", "label": "belong to the same kind as their parents"}, {"id": "c", "label": "are rocks"}, {"id": "d", "label": "never grow"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is NOT an inherited trait?$tl$, $tl$[{"id": "a", "label": "natural hair color"}, {"id": "b", "label": "a haircut"}, {"id": "c", "label": "eye color"}, {"id": "d", "label": "ear shape"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$traits-and-inheritance$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Variation of Traits (3-LS3-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$variation-of-traits$tl$, $tl$Variation of Traits$tl$, $tl$Individuals of the same kind are not all identical. Some differences are inherited and some are shaped by the environment.$tl$, 3, $tl$3-LS3-2$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Variation of Traits$tl$, 3, $tl$[{"type": "explain", "title": "About: Variation of Traits", "body": "Individuals of the same kind are not all identical. Some differences are inherited and some are shaped by the environment."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Differences in traits among the same kind of animal are called:  The correct answer is \"variation\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Some dogs of the same breed have slightly different:", "choices": [{"id": "a", "label": "numbers of legs always 6"}, {"id": "b", "label": "planets"}, {"id": "c", "label": "alphabets"}, {"id": "d", "label": "sizes"}], "answer": "d", "explanation": "The correct answer is \"sizes\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Differences in traits among the same kind of animal are called:$tl$, $tl$[{"id": "a", "label": "weather"}, {"id": "b", "label": "force"}, {"id": "c", "label": "habitat"}, {"id": "d", "label": "variation"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Some dogs of the same breed have slightly different:$tl$, $tl$[{"id": "a", "label": "numbers of legs always 6"}, {"id": "b", "label": "planets"}, {"id": "c", "label": "alphabets"}, {"id": "d", "label": "sizes"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Variation means individuals of one kind are:$tl$, $tl$[{"id": "a", "label": "not all exactly alike"}, {"id": "b", "label": "all identical"}, {"id": "c", "label": "not living"}, {"id": "d", "label": "made of metal"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Some traits are influenced by the environment, like a plant getting:$tl$, $tl$[{"id": "a", "label": "more sunlight and growing taller"}, {"id": "b", "label": "a new name"}, {"id": "c", "label": "a fence"}, {"id": "d", "label": "a sticker"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two sunflower seeds from the same plant may grow to be:$tl$, $tl$[{"id": "a", "label": "the same exact height always"}, {"id": "b", "label": "animals"}, {"id": "c", "label": "different heights"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A trait that can change with food and care is:$tl$, $tl$[{"id": "a", "label": "its species"}, {"id": "b", "label": "its number of eyes"}, {"id": "c", "label": "an animal's weight"}, {"id": "d", "label": "its skeleton count"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Children in one family may have different:$tl$, $tl$[{"id": "a", "label": "sets of parents"}, {"id": "b", "label": "planets"}, {"id": "c", "label": "hair colors"}, {"id": "d", "label": "languages at birth"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Variation in a group can help some individuals:$tl$, $tl$[{"id": "a", "label": "fly to space"}, {"id": "b", "label": "survive better in their environment"}, {"id": "c", "label": "stop aging"}, {"id": "d", "label": "turn to stone"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A plant grown in the dark may be:$tl$, $tl$[{"id": "a", "label": "greener and stronger"}, {"id": "b", "label": "paler and weaker"}, {"id": "c", "label": "made of plastic"}, {"id": "d", "label": "a different species"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which difference is caused mostly by the environment?$tl$, $tl$[{"id": "a", "label": "a sun-tanned vs. pale leaf"}, {"id": "b", "label": "eye color"}, {"id": "c", "label": "number of petals at birth"}, {"id": "d", "label": "seed type"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Even identical-looking puppies can differ in:$tl$, $tl$[{"id": "a", "label": "number of parents"}, {"id": "b", "label": "behavior"}, {"id": "c", "label": "planet"}, {"id": "d", "label": "alphabet"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Variation is important because it makes a group:$tl$, $tl$[{"id": "a", "label": "all the same"}, {"id": "b", "label": "unable to grow"}, {"id": "c", "label": "more able to handle change"}, {"id": "d", "label": "invisible"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Two tomato plants given different water may produce:$tl$, $tl$[{"id": "a", "label": "the same exact fruit"}, {"id": "b", "label": "different amounts of fruit"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "no plants ever"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a trait that varies among house cats?$tl$, $tl$[{"id": "a", "label": "fur length"}, {"id": "b", "label": "having whiskers at all"}, {"id": "c", "label": "being a mammal"}, {"id": "d", "label": "having a heart"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Differences between individuals are:$tl$, $tl$[{"id": "a", "label": "always a sickness"}, {"id": "b", "label": "impossible"}, {"id": "c", "label": "man-made only"}, {"id": "d", "label": "normal and natural"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Differences in traits among the same kind of living thing are called ____. (one word)$tl$, null, $tl$variation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A puppy that gets more exercise may grow:$tl$, $tl$[{"id": "a", "label": "stronger muscles"}, {"id": "b", "label": "a new species"}, {"id": "c", "label": "extra eyes"}, {"id": "d", "label": "wings"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Some flower plants are tall and some short; this is:$tl$, $tl$[{"id": "a", "label": "weather"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "friction"}, {"id": "d", "label": "variation"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Environment can affect traits such as:$tl$, $tl$[{"id": "a", "label": "its kind/species"}, {"id": "b", "label": "its number of seed types"}, {"id": "c", "label": "its DNA letters at birth"}, {"id": "d", "label": "a plant's size"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which best shows variation?$tl$, $tl$[{"id": "a", "label": "students in a class are different heights"}, {"id": "b", "label": "all clocks show 3:00"}, {"id": "c", "label": "all squares have 4 sides"}, {"id": "d", "label": "ice is frozen water"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$variation-of-traits$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Adaptations & Survival (3-LS4-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adaptations-and-survival$tl$, $tl$Adaptations & Survival$tl$, $tl$An adaptation is a body part or behavior that helps a living thing survive in its environment.$tl$, 3, $tl$3-LS4-3$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adaptations & Survival$tl$, 3, $tl$[{"type": "explain", "title": "About: Adaptations & Survival", "body": "An adaptation is a body part or behavior that helps a living thing survive in its environment."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A body part or behavior that helps an animal survive is an:  The correct answer is \"adaptation\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A polar bear's thick fur is an adaptation for:", "choices": [{"id": "a", "label": "swimming in lava"}, {"id": "b", "label": "staying warm in the cold"}, {"id": "c", "label": "flying"}, {"id": "d", "label": "digging gold"}], "answer": "b", "explanation": "The correct answer is \"staying warm in the cold\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A body part or behavior that helps an animal survive is an:$tl$, $tl$[{"id": "a", "label": "accident"}, {"id": "b", "label": "adaptation"}, {"id": "c", "label": "weather"}, {"id": "d", "label": "force"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A polar bear's thick fur is an adaptation for:$tl$, $tl$[{"id": "a", "label": "swimming in lava"}, {"id": "b", "label": "staying warm in the cold"}, {"id": "c", "label": "flying"}, {"id": "d", "label": "digging gold"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A cactus stores water in its thick stem to survive in the:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "arctic"}, {"id": "d", "label": "forest floor"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Camouflage helps an animal:$tl$, $tl$[{"id": "a", "label": "glow at night"}, {"id": "b", "label": "fly higher"}, {"id": "c", "label": "swim faster only"}, {"id": "d", "label": "hide from predators"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A duck's webbed feet are an adaptation for:$tl$, $tl$[{"id": "a", "label": "climbing trees"}, {"id": "b", "label": "swimming"}, {"id": "c", "label": "digging"}, {"id": "d", "label": "flying high"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Sharp claws help a hawk to:$tl$, $tl$[{"id": "a", "label": "catch prey"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "see color"}, {"id": "d", "label": "sing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A giraffe's long neck helps it:$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "dig tunnels"}, {"id": "c", "label": "reach high leaves"}, {"id": "d", "label": "hide underground"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Animals that are well-suited to their habitat are more likely to:$tl$, $tl$[{"id": "a", "label": "disappear"}, {"id": "b", "label": "survive"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "stop eating"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A fish's gills are an adaptation for:$tl$, $tl$[{"id": "a", "label": "breathing on land"}, {"id": "b", "label": "flying"}, {"id": "c", "label": "breathing underwater"}, {"id": "d", "label": "digging"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Thick fur and fat help animals survive in a:$tl$, $tl$[{"id": "a", "label": "hot desert"}, {"id": "b", "label": "cold climate"}, {"id": "c", "label": "volcano"}, {"id": "d", "label": "city street"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A chameleon changing color is an adaptation for:$tl$, $tl$[{"id": "a", "label": "cooking"}, {"id": "b", "label": "flying"}, {"id": "c", "label": "reading"}, {"id": "d", "label": "camouflage"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Plants in shady forests often have wide leaves to:$tl$, $tl$[{"id": "a", "label": "scare animals"}, {"id": "b", "label": "stay cold"}, {"id": "c", "label": "catch more sunlight"}, {"id": "d", "label": "make sound"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$An owl's night vision is an adaptation for:$tl$, $tl$[{"id": "a", "label": "swimming"}, {"id": "b", "label": "hunting in the dark"}, {"id": "c", "label": "digging"}, {"id": "d", "label": "flying to space"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If a habitat changes, animals that cannot adapt may:$tl$, $tl$[{"id": "a", "label": "instantly grow wings"}, {"id": "b", "label": "turn to stone"}, {"id": "c", "label": "become plants"}, {"id": "d", "label": "struggle to survive"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A turtle's hard shell is an adaptation for:$tl$, $tl$[{"id": "a", "label": "swimming fast only"}, {"id": "b", "label": "flying"}, {"id": "c", "label": "protection"}, {"id": "d", "label": "seeing color"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A body part or behavior that helps an animal survive is an ____. (one word)$tl$, null, $tl$adaptation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Webbed feet, gills, and fins all help animals live:$tl$, $tl$[{"id": "a", "label": "in the desert"}, {"id": "b", "label": "in space"}, {"id": "c", "label": "in or near water"}, {"id": "d", "label": "underground only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A desert fox's big ears help it:$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "stay cool"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "dig gold"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Spines on a porcupine are an adaptation for:$tl$, $tl$[{"id": "a", "label": "defense"}, {"id": "b", "label": "flying"}, {"id": "c", "label": "swimming"}, {"id": "d", "label": "singing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Birds that eat seeds often have beaks that are:$tl$, $tl$[{"id": "a", "label": "strong for cracking"}, {"id": "b", "label": "long and thin only"}, {"id": "c", "label": "flat like a duck's only"}, {"id": "d", "label": "made of metal"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$adaptations-and-survival$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Habitats & Change (3-LS4-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$habitats-and-environment-change$tl$, $tl$Habitats & Change$tl$, $tl$A habitat gives living things food, water, and shelter. When habitats change, living things must move, adapt, or struggle.$tl$, 3, $tl$3-LS4-4$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Habitats & Change$tl$, 3, $tl$[{"type": "explain", "title": "About: Habitats & Change", "body": "A habitat gives living things food, water, and shelter. When habitats change, living things must move, adapt, or struggle."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: The place where a plant or animal naturally lives is its:  The correct answer is \"habitat\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A habitat provides an animal with food, water, and:", "choices": [{"id": "a", "label": "shelter"}, {"id": "b", "label": "homework"}, {"id": "c", "label": "money"}, {"id": "d", "label": "toys"}], "answer": "a", "explanation": "The correct answer is \"shelter\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The place where a plant or animal naturally lives is its:$tl$, $tl$[{"id": "a", "label": "habitat"}, {"id": "b", "label": "adaptation"}, {"id": "c", "label": "trait"}, {"id": "d", "label": "force"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A habitat provides an animal with food, water, and:$tl$, $tl$[{"id": "a", "label": "shelter"}, {"id": "b", "label": "homework"}, {"id": "c", "label": "money"}, {"id": "d", "label": "toys"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If a pond dries up, the fish living there will:$tl$, $tl$[{"id": "a", "label": "lose their habitat"}, {"id": "b", "label": "grow wings"}, {"id": "c", "label": "become birds"}, {"id": "d", "label": "be fine forever"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Cutting down a forest can cause animals to:$tl$, $tl$[{"id": "a", "label": "gain new planets"}, {"id": "b", "label": "lose their homes"}, {"id": "c", "label": "stop needing food"}, {"id": "d", "label": "turn to stone"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which animal best fits a desert habitat?$tl$, $tl$[{"id": "a", "label": "a polar bear"}, {"id": "b", "label": "a whale"}, {"id": "c", "label": "a penguin"}, {"id": "d", "label": "a lizard"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When the environment changes, some animals:$tl$, $tl$[{"id": "a", "label": "instantly adapt perfectly"}, {"id": "b", "label": "disappear by magic"}, {"id": "c", "label": "grow gills always"}, {"id": "d", "label": "move to a new area"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A habitat with lots of trees and shade is a:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "tundra"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Pollution in a river can harm the:$tl$, $tl$[{"id": "a", "label": "weather of space"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "alphabet"}, {"id": "d", "label": "fish and plants living there"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which change is helpful to a habitat?$tl$, $tl$[{"id": "a", "label": "dumping trash"}, {"id": "b", "label": "draining a pond"}, {"id": "c", "label": "burning a forest"}, {"id": "d", "label": "planting new trees"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Animals depend on plants in their habitat for:$tl$, $tl$[{"id": "a", "label": "homework"}, {"id": "b", "label": "cars"}, {"id": "c", "label": "money"}, {"id": "d", "label": "food and oxygen"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A polar bear is best suited to a habitat that is:$tl$, $tl$[{"id": "a", "label": "hot and sandy"}, {"id": "b", "label": "a rainforest"}, {"id": "c", "label": "a city park"}, {"id": "d", "label": "cold and icy"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$If a habitat can no longer meet an animal's needs, the animal may:$tl$, $tl$[{"id": "a", "label": "grow a new species instantly"}, {"id": "b", "label": "move, adapt, or die"}, {"id": "c", "label": "become a rock"}, {"id": "d", "label": "make weather"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Building a road through a forest can:$tl$, $tl$[{"id": "a", "label": "help all animals fly"}, {"id": "b", "label": "cool the Sun"}, {"id": "c", "label": "create fossils fast"}, {"id": "d", "label": "split up animal habitats"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Wetlands are habitats with lots of:$tl$, $tl$[{"id": "a", "label": "sand and no water"}, {"id": "b", "label": "ice only"}, {"id": "c", "label": "lava"}, {"id": "d", "label": "water and plants"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A change like a flood can:$tl$, $tl$[{"id": "a", "label": "make animals immortal"}, {"id": "b", "label": "force animals to find new homes"}, {"id": "c", "label": "stop time"}, {"id": "d", "label": "turn water to metal"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The natural home of a plant or animal is its ____. (one word)$tl$, null, $tl$habitat$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which best helps protect habitats?$tl$, $tl$[{"id": "a", "label": "littering"}, {"id": "b", "label": "keeping rivers clean"}, {"id": "c", "label": "cutting all trees"}, {"id": "d", "label": "draining lakes"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A fish is best suited to a habitat that is:$tl$, $tl$[{"id": "a", "label": "watery"}, {"id": "b", "label": "dry desert"}, {"id": "c", "label": "icy mountain top"}, {"id": "d", "label": "inside a cave with no water"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$When food becomes scarce in a habitat, animals may:$tl$, $tl$[{"id": "a", "label": "stop being hungry"}, {"id": "b", "label": "grow wheavier"}, {"id": "c", "label": "turn into plants"}, {"id": "d", "label": "migrate to find more"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which living thing fits an ocean habitat?$tl$, $tl$[{"id": "a", "label": "a camel"}, {"id": "b", "label": "a dolphin"}, {"id": "c", "label": "a cactus"}, {"id": "d", "label": "a polar bear"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-environment-change$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Weather & Climate (3-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$weather-and-climate$tl$, $tl$Weather & Climate$tl$, $tl$Weather is the day-to-day state of the air. Climate is the usual weather of a place measured over many years.$tl$, 3, $tl$3-ESS2-1$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Weather & Climate$tl$, 3, $tl$[{"type": "explain", "title": "About: Weather & Climate", "body": "Weather is the day-to-day state of the air. Climate is the usual weather of a place measured over many years."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: The day-to-day state of the air (sunny, rainy, windy) is:  The correct answer is \"weather\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "The usual weather of a place over many years is its:", "choices": [{"id": "a", "label": "weather today"}, {"id": "b", "label": "force"}, {"id": "c", "label": "climate"}, {"id": "d", "label": "adaptation"}], "answer": "c", "explanation": "The correct answer is \"climate\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The day-to-day state of the air (sunny, rainy, windy) is:$tl$, $tl$[{"id": "a", "label": "climate"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "weather"}, {"id": "d", "label": "a habitat"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The usual weather of a place over many years is its:$tl$, $tl$[{"id": "a", "label": "weather today"}, {"id": "b", "label": "force"}, {"id": "c", "label": "climate"}, {"id": "d", "label": "adaptation"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A tool that measures temperature is a:$tl$, $tl$[{"id": "a", "label": "thermometer"}, {"id": "b", "label": "ruler"}, {"id": "c", "label": "scale"}, {"id": "d", "label": "clock"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Rain, snow, and hail are all kinds of:$tl$, $tl$[{"id": "a", "label": "precipitation"}, {"id": "b", "label": "climate"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "sunshine"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A place that is hot and dry most of the year has a:$tl$, $tl$[{"id": "a", "label": "polar climate"}, {"id": "b", "label": "rainy climate"}, {"id": "c", "label": "ocean of ice"}, {"id": "d", "label": "desert climate"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Scientists who study and predict weather are:$tl$, $tl$[{"id": "a", "label": "dentists"}, {"id": "b", "label": "pilots"}, {"id": "c", "label": "chefs"}, {"id": "d", "label": "meteorologists"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A tool that shows wind direction is a:$tl$, $tl$[{"id": "a", "label": "thermometer"}, {"id": "b", "label": "ruler"}, {"id": "c", "label": "wind vane"}, {"id": "d", "label": "scale"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which describes climate, not today's weather?$tl$, $tl$[{"id": "a", "label": "summers here are usually hot"}, {"id": "b", "label": "it is raining right now"}, {"id": "c", "label": "the wind is gusty today"}, {"id": "d", "label": "it snowed this morning"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Very cold, icy regions near the poles have a:$tl$, $tl$[{"id": "a", "label": "desert climate"}, {"id": "b", "label": "tropical climate"}, {"id": "c", "label": "polar climate"}, {"id": "d", "label": "city climate"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Weather can change:$tl$, $tl$[{"id": "a", "label": "from day to day"}, {"id": "b", "label": "only once a year"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A rain gauge measures the amount of:$tl$, $tl$[{"id": "a", "label": "wind"}, {"id": "b", "label": "temperature"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "rainfall"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Knowing the climate helps people decide:$tl$, $tl$[{"id": "a", "label": "the alphabet"}, {"id": "b", "label": "what clothes to pack for a season"}, {"id": "c", "label": "their height"}, {"id": "d", "label": "their name"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A hot, wet climate with lots of rain supports a:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "tundra"}, {"id": "c", "label": "rainforest"}, {"id": "d", "label": "glacier"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an example of weather?$tl$, $tl$[{"id": "a", "label": "the region is usually dry"}, {"id": "b", "label": "winters are cold here"}, {"id": "c", "label": "a thunderstorm this afternoon"}, {"id": "d", "label": "summers are warm here"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Climate is described using patterns over a:$tl$, $tl$[{"id": "a", "label": "long time (years)"}, {"id": "b", "label": "single hour"}, {"id": "c", "label": "single minute"}, {"id": "d", "label": "single second"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The day-to-day condition of the air is called ____. (one word)$tl$, null, $tl$weather$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$People in a snowy climate often build homes with:$tl$, $tl$[{"id": "a", "label": "no walls"}, {"id": "b", "label": "steep roofs so snow slides off"}, {"id": "c", "label": "sand floors"}, {"id": "d", "label": "ice furniture only"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which tool helps predict if a storm is coming?$tl$, $tl$[{"id": "a", "label": "a dictionary"}, {"id": "b", "label": "a calculator"}, {"id": "c", "label": "weather instruments and maps"}, {"id": "d", "label": "a paintbrush"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A region near the equator usually has a climate that is:$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "freezing"}, {"id": "c", "label": "snowy all year"}, {"id": "d", "label": "without any sun"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Both weather and climate are about the:$tl$, $tl$[{"id": "a", "label": "ocean floor rocks"}, {"id": "b", "label": "inside of volcanoes"}, {"id": "c", "label": "air and sky conditions"}, {"id": "d", "label": "colors of cars"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Finding the Main Idea (RI.3.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$main-idea$tl$, $tl$Finding the Main Idea$tl$, $tl$The main idea is what a passage is mostly about. Ask yourself the one big thing the author wants you to know.$tl$, 3, $tl$RI.3.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Finding the Main Idea$tl$, 3, $tl$[{"type": "explain", "title": "About: Finding the Main Idea", "body": "The main idea is what a passage is mostly about. Ask yourself the one big thing the author wants you to know."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Sam's dog Biscuit can do tricks. He can sit, roll over, and shake hands.\" What is the main idea?  The correct answer is \"Biscuit can do tricks.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Rain helps the Earth. It fills rivers, waters plants, and gives animals water to drink.\" The main idea is that rain:", "choices": [{"id": "a", "label": "helps living things"}, {"id": "b", "label": "is cold"}, {"id": "c", "label": "falls at night"}, {"id": "d", "label": "is loud"}], "answer": "a", "explanation": "The correct answer is \"helps living things\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Sam's dog Biscuit can do tricks. He can sit, roll over, and shake hands." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Sam has a cat."}, {"id": "b", "label": "Biscuit is brown."}, {"id": "c", "label": "Sam likes pizza."}, {"id": "d", "label": "Biscuit can do tricks."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Rain helps the Earth. It fills rivers, waters plants, and gives animals water to drink." The main idea is that rain:$tl$, $tl$[{"id": "a", "label": "helps living things"}, {"id": "b", "label": "is cold"}, {"id": "c", "label": "falls at night"}, {"id": "d", "label": "is loud"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Maria cleaned her room. She made her bed, picked up toys, and put away books." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Maria has many toys."}, {"id": "b", "label": "Maria likes books."}, {"id": "c", "label": "Maria is tired."}, {"id": "d", "label": "Maria cleaned her room."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Bees are busy. They fly to flowers, gather nectar, and make honey." The passage is mostly about:$tl$, $tl$[{"id": "a", "label": "the color of flowers"}, {"id": "b", "label": "how to bake"}, {"id": "c", "label": "rainy days"}, {"id": "d", "label": "what bees do"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Our class went to the farm. We saw cows, fed goats, and picked apples." The main idea is that the class:$tl$, $tl$[{"id": "a", "label": "ate lunch"}, {"id": "b", "label": "stayed home"}, {"id": "c", "label": "visited a farm"}, {"id": "d", "label": "read a book"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Winter is fun. You can build snowmen, go sledding, and drink hot cocoa." The main idea is that winter:$tl$, $tl$[{"id": "a", "label": "is short"}, {"id": "b", "label": "is warm"}, {"id": "c", "label": "has no snow"}, {"id": "d", "label": "is fun"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Tom loves the library. He reads books, uses computers, and joins story time." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Tom is hungry."}, {"id": "b", "label": "The library is far."}, {"id": "c", "label": "Tom enjoys many things at the library."}, {"id": "d", "label": "Tom has a bike."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Plants need care. They need water, sunlight, and good soil to grow." The main idea is that plants:$tl$, $tl$[{"id": "a", "label": "are green"}, {"id": "b", "label": "are tall"}, {"id": "c", "label": "need care to grow"}, {"id": "d", "label": "smell nice"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The fire truck is helpful. It carries water, ladders, and brave firefighters." The passage is mostly about:$tl$, $tl$[{"id": "a", "label": "the color red"}, {"id": "b", "label": "loud sirens only"}, {"id": "c", "label": "a cat in a tree"}, {"id": "d", "label": "how the fire truck helps"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Ducks are great swimmers. Their webbed feet push the water and their feathers keep them dry." The main idea is that ducks:$tl$, $tl$[{"id": "a", "label": "are yellow"}, {"id": "b", "label": "quack loudly"}, {"id": "c", "label": "are good at swimming"}, {"id": "d", "label": "eat bread"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Mom planted a garden. She grew tomatoes, beans, and carrots." The main idea is that Mom:$tl$, $tl$[{"id": "a", "label": "planted a vegetable garden"}, {"id": "b", "label": "bought a car"}, {"id": "c", "label": "cooked dinner"}, {"id": "d", "label": "went to work"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Recess is the best. We run, play games, and laugh with friends." The main idea is that recess:$tl$, $tl$[{"id": "a", "label": "is short"}, {"id": "b", "label": "is quiet"}, {"id": "c", "label": "is fun with friends"}, {"id": "d", "label": "is indoors"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The ocean is full of life. Fish swim, crabs crawl, and whales dive deep." The passage is mostly about:$tl$, $tl$[{"id": "a", "label": "sand on the beach"}, {"id": "b", "label": "animals in the ocean"}, {"id": "c", "label": "a sailboat"}, {"id": "d", "label": "the weather"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Birds build nests. They gather twigs, grass, and leaves to make a cozy home." The main idea is that birds:$tl$, $tl$[{"id": "a", "label": "fly south"}, {"id": "b", "label": "sing songs"}, {"id": "c", "label": "eat worms"}, {"id": "d", "label": "build nests for a home"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Exercise keeps you healthy. It makes your body strong and your heart happy." The main idea is that exercise:$tl$, $tl$[{"id": "a", "label": "is boring"}, {"id": "b", "label": "keeps you healthy"}, {"id": "c", "label": "needs a ball"}, {"id": "d", "label": "is at night"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "Brushing your teeth keeps them clean and healthy." In one word, the passage is mostly about keeping teeth ____. $tl$, null, $tl$clean$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The park has lots to do. You can swing, slide, and climb." The main idea is that the park:$tl$, $tl$[{"id": "a", "label": "is empty"}, {"id": "b", "label": "is closed"}, {"id": "c", "label": "is small"}, {"id": "d", "label": "has fun things to do"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Grandpa tells great stories about pirates, dragons, and faraway lands." The passage is mostly about:$tl$, $tl$[{"id": "a", "label": "Grandpa's stories"}, {"id": "b", "label": "a real pirate"}, {"id": "c", "label": "a pet dragon"}, {"id": "d", "label": "a long trip"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Apples are tasty and good for you. They are sweet, crunchy, and full of vitamins." The main idea is that apples:$tl$, $tl$[{"id": "a", "label": "are red only"}, {"id": "b", "label": "grow fast"}, {"id": "c", "label": "are tasty and healthy"}, {"id": "d", "label": "are heavy"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The bakery smells wonderful. There is fresh bread, warm cookies, and sweet cake." The passage is mostly about:$tl$, $tl$[{"id": "a", "label": "good things at the bakery"}, {"id": "b", "label": "a long line"}, {"id": "c", "label": "the cash register"}, {"id": "d", "label": "a closed door"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Key Details (RI.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$key-details$tl$, $tl$Key Details$tl$, $tl$Key details are the facts in a text that answer who, what, where, when, why, and how.$tl$, 3, $tl$RI.3.1$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Key Details$tl$, 3, $tl$[{"type": "explain", "title": "About: Key Details", "body": "Key details are the facts in a text that answer who, what, where, when, why, and how."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Lily has a red kite. She flies it in the park on windy days.\" Where does Lily fly her kite?  The correct answer is \"in the park\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The picnic had sandwiches, juice, and grapes.\" Which food was at the picnic?", "choices": [{"id": "a", "label": "pizza"}, {"id": "b", "label": "soup"}, {"id": "c", "label": "grapes"}, {"id": "d", "label": "cake"}], "answer": "c", "explanation": "The correct answer is \"grapes\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Lily has a red kite. She flies it in the park on windy days." Where does Lily fly her kite?$tl$, $tl$[{"id": "a", "label": "at school"}, {"id": "b", "label": "in the park"}, {"id": "c", "label": "in her room"}, {"id": "d", "label": "at the store"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The picnic had sandwiches, juice, and grapes." Which food was at the picnic?$tl$, $tl$[{"id": "a", "label": "pizza"}, {"id": "b", "label": "soup"}, {"id": "c", "label": "grapes"}, {"id": "d", "label": "cake"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Max woke up early to walk his dog before school." When did Max walk his dog?$tl$, $tl$[{"id": "a", "label": "before school"}, {"id": "b", "label": "after dinner"}, {"id": "c", "label": "at midnight"}, {"id": "d", "label": "at lunch"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The turtle moved slowly across the warm sand." How did the turtle move?$tl$, $tl$[{"id": "a", "label": "slowly"}, {"id": "b", "label": "quickly"}, {"id": "c", "label": "backward"}, {"id": "d", "label": "by flying"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Ana painted a picture of a blue whale." What did Ana paint?$tl$, $tl$[{"id": "a", "label": "a red car"}, {"id": "b", "label": "a blue whale"}, {"id": "c", "label": "a green tree"}, {"id": "d", "label": "a yellow sun"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It rained all morning, so we played games inside." Why did they play inside?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "it was night"}, {"id": "c", "label": "school was closed"}, {"id": "d", "label": "because it rained"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The store opens at nine and closes at five." When does the store open?$tl$, $tl$[{"id": "a", "label": "at nine"}, {"id": "b", "label": "at five"}, {"id": "c", "label": "at noon"}, {"id": "d", "label": "at night"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Ben gave his sister three stickers." How many stickers did Ben give?$tl$, $tl$[{"id": "a", "label": "one"}, {"id": "b", "label": "five"}, {"id": "c", "label": "ten"}, {"id": "d", "label": "three"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The cat hid under the bed during the storm." Where did the cat hide?$tl$, $tl$[{"id": "a", "label": "in a tree"}, {"id": "b", "label": "on the roof"}, {"id": "c", "label": "under the bed"}, {"id": "d", "label": "in the car"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Grandma made soup with carrots, onions, and beans." Which is in the soup?$tl$, $tl$[{"id": "a", "label": "carrots"}, {"id": "b", "label": "apples"}, {"id": "c", "label": "candy"}, {"id": "d", "label": "ice"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "They hiked up the tall mountain to see the view." Why did they hike up?$tl$, $tl$[{"id": "a", "label": "to see the view"}, {"id": "b", "label": "to swim"}, {"id": "c", "label": "to sleep"}, {"id": "d", "label": "to shop"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The bus was late because of heavy traffic." Why was the bus late?$tl$, $tl$[{"id": "a", "label": "it was new"}, {"id": "b", "label": "it was empty"}, {"id": "c", "label": "it was raining candy"}, {"id": "d", "label": "heavy traffic"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Jada planted sunflower seeds in May." What did Jada plant?$tl$, $tl$[{"id": "a", "label": "beans"}, {"id": "b", "label": "sunflower seeds"}, {"id": "c", "label": "trees"}, {"id": "d", "label": "grass"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The puppy chewed the slipper while we were out." What did the puppy chew?$tl$, $tl$[{"id": "a", "label": "the sofa"}, {"id": "b", "label": "the slipper"}, {"id": "c", "label": "a bone"}, {"id": "d", "label": "the door"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "We saw fireworks on the Fourth of July." When did they see fireworks?$tl$, $tl$[{"id": "a", "label": "on New Year"}, {"id": "b", "label": "on the Fourth of July"}, {"id": "c", "label": "at school"}, {"id": "d", "label": "on Monday"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "Sara's favorite color is purple." What is Sara's favorite color? (one word)$tl$, null, $tl$purple$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The library is next to the bakery on Main Street." Where is the library?$tl$, $tl$[{"id": "a", "label": "on the hill"}, {"id": "b", "label": "by the lake"}, {"id": "c", "label": "next to the bakery"}, {"id": "d", "label": "in the park"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Leo read for thirty minutes before bed." How long did Leo read?$tl$, $tl$[{"id": "a", "label": "thirty minutes"}, {"id": "b", "label": "all day"}, {"id": "c", "label": "one hour"}, {"id": "d", "label": "one minute"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The robins built their nest in the oak tree." Where did the robins build their nest?$tl$, $tl$[{"id": "a", "label": "on the ground"}, {"id": "b", "label": "in a barn"}, {"id": "c", "label": "in the oak tree"}, {"id": "d", "label": "under a rock"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Dad fixed the bike with a wrench and some oil." What did Dad use to fix the bike?$tl$, $tl$[{"id": "a", "label": "a spoon"}, {"id": "b", "label": "glue"}, {"id": "c", "label": "tape only"}, {"id": "d", "label": "a wrench and oil"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Sequence of Events (RL.3.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$story-sequence$tl$, $tl$Sequence of Events$tl$, $tl$Sequence is the order things happen. Words like first, next, then, and last help you keep track.$tl$, 3, $tl$RL.3.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sequence of Events$tl$, 3, $tl$[{"type": "explain", "title": "About: Sequence of Events", "body": "Sequence is the order things happen. Words like first, next, then, and last help you keep track."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"First Mia got dressed. Next she ate breakfast. Then she went to school.\" What did Mia do FIRST?  The correct answer is \"got dressed\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Jack planted a seed, watered it, and watched it grow.\" What did Jack do LAST?", "choices": [{"id": "a", "label": "planted a seed"}, {"id": "b", "label": "watched it grow"}, {"id": "c", "label": "watered it"}, {"id": "d", "label": "picked a flower"}], "answer": "b", "explanation": "The correct answer is \"watched it grow\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "First Mia got dressed. Next she ate breakfast. Then she went to school." What did Mia do FIRST?$tl$, $tl$[{"id": "a", "label": "ate breakfast"}, {"id": "b", "label": "went to school"}, {"id": "c", "label": "got dressed"}, {"id": "d", "label": "came home"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Jack planted a seed, watered it, and watched it grow." What did Jack do LAST?$tl$, $tl$[{"id": "a", "label": "planted a seed"}, {"id": "b", "label": "watched it grow"}, {"id": "c", "label": "watered it"}, {"id": "d", "label": "picked a flower"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "We packed a bag, drove to the beach, and built a sandcastle." What happened SECOND?$tl$, $tl$[{"id": "a", "label": "packed a bag"}, {"id": "b", "label": "drove to the beach"}, {"id": "c", "label": "built a sandcastle"}, {"id": "d", "label": "swam"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The bell rang, the kids lined up, and they walked inside." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the bell rang"}, {"id": "b", "label": "kids walked inside"}, {"id": "c", "label": "kids lined up"}, {"id": "d", "label": "class started"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Dad mixed the batter, poured it in a pan, and baked a cake." What did Dad do right after mixing?$tl$, $tl$[{"id": "a", "label": "baked the cake"}, {"id": "b", "label": "ate the cake"}, {"id": "c", "label": "poured it in a pan"}, {"id": "d", "label": "washed dishes"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She tied her shoes, grabbed her ball, and ran outside." What did she do LAST?$tl$, $tl$[{"id": "a", "label": "tied her shoes"}, {"id": "b", "label": "grabbed her ball"}, {"id": "c", "label": "ran outside"}, {"id": "d", "label": "sat down"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The sun set, the stars came out, and we fell asleep." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the sun set"}, {"id": "b", "label": "we fell asleep"}, {"id": "c", "label": "the stars came out"}, {"id": "d", "label": "the sun rose"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He read the recipe, gathered the food, and started cooking." What did he do BEFORE cooking?$tl$, $tl$[{"id": "a", "label": "ate dessert"}, {"id": "b", "label": "washed up"}, {"id": "c", "label": "set the table"}, {"id": "d", "label": "gathered the food"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "We bought tickets, found our seats, and watched the show." What came SECOND?$tl$, $tl$[{"id": "a", "label": "bought tickets"}, {"id": "b", "label": "found our seats"}, {"id": "c", "label": "watched the show"}, {"id": "d", "label": "went home"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The seed sprouted, grew leaves, and then bloomed." What happened LAST?$tl$, $tl$[{"id": "a", "label": "it sprouted"}, {"id": "b", "label": "it grew leaves"}, {"id": "c", "label": "it was picked"}, {"id": "d", "label": "it bloomed"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Tom woke up, brushed his teeth, then made his bed." What did Tom do FIRST?$tl$, $tl$[{"id": "a", "label": "made his bed"}, {"id": "b", "label": "brushed his teeth"}, {"id": "c", "label": "woke up"}, {"id": "d", "label": "went out"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "They climbed the hill, ate lunch, and rolled down." What did they do right after climbing?$tl$, $tl$[{"id": "a", "label": "rolled down"}, {"id": "b", "label": "slept"}, {"id": "c", "label": "ate lunch"}, {"id": "d", "label": "drove home"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "First fill the tub, next add bubbles, then hop in." What is the LAST step?$tl$, $tl$[{"id": "a", "label": "fill the tub"}, {"id": "b", "label": "hop in"}, {"id": "c", "label": "add bubbles"}, {"id": "d", "label": "drain it"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The dog barked, the cat ran, and the bird flew off." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the bird flew"}, {"id": "b", "label": "the cat ran"}, {"id": "c", "label": "the dog barked"}, {"id": "d", "label": "the sun set"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "We washed the car, dried it, and then waxed it." What came right after washing?$tl$, $tl$[{"id": "a", "label": "drying it"}, {"id": "b", "label": "waxing it"}, {"id": "c", "label": "driving it"}, {"id": "d", "label": "parking it"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "First you put on socks, then your shoes." What do you put on first? (one word)$tl$, null, $tl$socks$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She wrote the letter, sealed the envelope, and mailed it." What did she do LAST?$tl$, $tl$[{"id": "a", "label": "wrote the letter"}, {"id": "b", "label": "sealed the envelope"}, {"id": "c", "label": "read it"}, {"id": "d", "label": "mailed it"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The light turned green, the cars moved, and we crossed." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "we crossed"}, {"id": "b", "label": "the cars stopped"}, {"id": "c", "label": "the light turned green"}, {"id": "d", "label": "it got dark"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He picked apples, washed them, and made a pie." What did he do BEFORE making the pie?$tl$, $tl$[{"id": "a", "label": "ate the pie"}, {"id": "b", "label": "washed the apples"}, {"id": "c", "label": "sold apples"}, {"id": "d", "label": "planted a tree"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "They set up the tent, lit a fire, and roasted marshmallows." What came SECOND?$tl$, $tl$[{"id": "a", "label": "set up the tent"}, {"id": "b", "label": "roasted marshmallows"}, {"id": "c", "label": "slept"}, {"id": "d", "label": "lit a fire"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-sequence$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Cause & Effect (RI.3.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$cause-and-effect$tl$, $tl$Cause & Effect$tl$, $tl$A cause is why something happens; the effect is what happens. Words like because and so connect them.$tl$, 3, $tl$RI.3.3$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Cause & Effect$tl$, 3, $tl$[{"type": "explain", "title": "About: Cause & Effect", "body": "A cause is why something happens; the effect is what happens. Words like because and so connect them."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"It started to rain, so we ran inside.\" Why did they run inside?  The correct answer is \"because it rained\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Ed forgot his umbrella, so he got wet.\" What was the effect?", "choices": [{"id": "a", "label": "he got wet"}, {"id": "b", "label": "he stayed dry"}, {"id": "c", "label": "he ran fast"}, {"id": "d", "label": "he was warm"}], "answer": "a", "explanation": "The correct answer is \"he got wet\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It started to rain, so we ran inside." Why did they run inside?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "they were tired"}, {"id": "c", "label": "it was lunch"}, {"id": "d", "label": "because it rained"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Ed forgot his umbrella, so he got wet." What was the effect?$tl$, $tl$[{"id": "a", "label": "he got wet"}, {"id": "b", "label": "he stayed dry"}, {"id": "c", "label": "he ran fast"}, {"id": "d", "label": "he was warm"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The plant got sunlight and water, so it grew." Why did the plant grow?$tl$, $tl$[{"id": "a", "label": "it was dark"}, {"id": "b", "label": "it was cold"}, {"id": "c", "label": "it got sunlight and water"}, {"id": "d", "label": "nobody touched it"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She practiced every day, so she got better at piano." What caused her to improve?$tl$, $tl$[{"id": "a", "label": "she practiced every day"}, {"id": "b", "label": "she quit"}, {"id": "c", "label": "she slept"}, {"id": "d", "label": "it was easy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The ice cream melted because it was hot outside." Why did it melt?$tl$, $tl$[{"id": "a", "label": "it was frozen"}, {"id": "b", "label": "it was night"}, {"id": "c", "label": "it was tiny"}, {"id": "d", "label": "it was hot outside"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He dropped the cup, so it broke." What was the effect of dropping the cup?$tl$, $tl$[{"id": "a", "label": "it floated"}, {"id": "b", "label": "it grew"}, {"id": "c", "label": "nothing happened"}, {"id": "d", "label": "it broke"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The dog was hungry, so it barked at its bowl." Why did the dog bark?$tl$, $tl$[{"id": "a", "label": "it was full"}, {"id": "b", "label": "it was sleepy"}, {"id": "c", "label": "it was hungry"}, {"id": "d", "label": "it was cold"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Because the road was icy, the bus went slowly." Why did the bus go slowly?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "the road was icy"}, {"id": "c", "label": "it was new"}, {"id": "d", "label": "it was empty"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "We watered the seeds, so they sprouted." What was the effect?$tl$, $tl$[{"id": "a", "label": "the seeds dried up"}, {"id": "b", "label": "nothing grew"}, {"id": "c", "label": "it snowed"}, {"id": "d", "label": "the seeds sprouted"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The wind blew hard, so the kite flew high." What made the kite fly high?$tl$, $tl$[{"id": "a", "label": "the heavy kite"}, {"id": "b", "label": "the rain"}, {"id": "c", "label": "the strong wind"}, {"id": "d", "label": "the dark"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Mia studied for the test, so she did well." Why did Mia do well?$tl$, $tl$[{"id": "a", "label": "she studied"}, {"id": "b", "label": "she was late"}, {"id": "c", "label": "she slept in"}, {"id": "d", "label": "she guessed"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The power went out, so we lit candles." What was the cause?$tl$, $tl$[{"id": "a", "label": "we lit candles"}, {"id": "b", "label": "it was morning"}, {"id": "c", "label": "the lights were on"}, {"id": "d", "label": "the power went out"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He left the gate open, so the dog ran out." What was the effect?$tl$, $tl$[{"id": "a", "label": "the dog slept"}, {"id": "b", "label": "the dog ran out"}, {"id": "c", "label": "the gate closed"}, {"id": "d", "label": "the dog ate"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Because it was cold, she wore a coat." Why did she wear a coat?$tl$, $tl$[{"id": "a", "label": "it was hot"}, {"id": "b", "label": "it was sunny"}, {"id": "c", "label": "it was cold"}, {"id": "d", "label": "it was loud"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The baby was sleepy, so she cried." Why did the baby cry?$tl$, $tl$[{"id": "a", "label": "she was happy"}, {"id": "b", "label": "she ate"}, {"id": "c", "label": "she ran"}, {"id": "d", "label": "she was sleepy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "He didn't water the plant, so it ____." Fill the effect word (it dried up and...). (one word)$tl$, null, $tl$wilted$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The team practiced hard, so they won." What caused the win?$tl$, $tl$[{"id": "a", "label": "the rain"}, {"id": "b", "label": "the bus"}, {"id": "c", "label": "the snacks"}, {"id": "d", "label": "practicing hard"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It snowed all night, so school was closed." Why was school closed?$tl$, $tl$[{"id": "a", "label": "it snowed all night"}, {"id": "b", "label": "it was summer"}, {"id": "c", "label": "it was sunny"}, {"id": "d", "label": "it was Friday"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The volcano erupted, so people moved away." What was the effect?$tl$, $tl$[{"id": "a", "label": "people moved closer"}, {"id": "b", "label": "people moved away"}, {"id": "c", "label": "it was quiet"}, {"id": "d", "label": "nothing changed"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She turned off the light, so the room got dark." What made the room dark?$tl$, $tl$[{"id": "a", "label": "the sun"}, {"id": "b", "label": "the lamp on"}, {"id": "c", "label": "turning off the light"}, {"id": "d", "label": "the window"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Vocabulary in Context (RI.3.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$context-clues$tl$, $tl$Vocabulary in Context$tl$, $tl$Use the words around an unknown word as clues to figure out what it means.$tl$, 3, $tl$RI.3.4$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Vocabulary in Context$tl$, 3, $tl$[{"type": "explain", "title": "About: Vocabulary in Context", "body": "Use the words around an unknown word as clues to figure out what it means."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The tiny ant was so small I could barely see it.\" What does \"tiny\" mean?  The correct answer is \"very small\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"She was joyful and smiled all day.\" What does \"joyful\" mean?", "choices": [{"id": "a", "label": "very sad"}, {"id": "b", "label": "very tired"}, {"id": "c", "label": "very happy"}, {"id": "d", "label": "very angry"}], "answer": "c", "explanation": "The correct answer is \"very happy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The tiny ant was so small I could barely see it." What does "tiny" mean?$tl$, $tl$[{"id": "a", "label": "very small"}, {"id": "b", "label": "very big"}, {"id": "c", "label": "very loud"}, {"id": "d", "label": "very fast"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She was joyful and smiled all day." What does "joyful" mean?$tl$, $tl$[{"id": "a", "label": "very sad"}, {"id": "b", "label": "very tired"}, {"id": "c", "label": "very happy"}, {"id": "d", "label": "very angry"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The soup was hot, so he let it cool down." What does "hot" mean here?$tl$, $tl$[{"id": "a", "label": "very cold"}, {"id": "b", "label": "very warm"}, {"id": "c", "label": "very sweet"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The path was narrow, so only one person could pass." What does "narrow" mean?$tl$, $tl$[{"id": "a", "label": "very tall"}, {"id": "b", "label": "not wide"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He was exhausted after running and fell asleep fast." What does "exhausted" mean?$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "hungry"}, {"id": "c", "label": "cold"}, {"id": "d", "label": "very tired"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The huge elephant was the biggest animal there." What does "huge" mean?$tl$, $tl$[{"id": "a", "label": "very small"}, {"id": "b", "label": "very quiet"}, {"id": "c", "label": "very fast"}, {"id": "d", "label": "very big"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The room was silent; nobody made a sound." What does "silent" mean?$tl$, $tl$[{"id": "a", "label": "very loud"}, {"id": "b", "label": "very quiet"}, {"id": "c", "label": "very bright"}, {"id": "d", "label": "very cold"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She is generous and shares her snacks." What does "generous" mean?$tl$, $tl$[{"id": "a", "label": "willing to share"}, {"id": "b", "label": "selfish"}, {"id": "c", "label": "mean"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The shy puppy hid behind the chair." What does "shy" mean?$tl$, $tl$[{"id": "a", "label": "loud"}, {"id": "b", "label": "timid or fearful"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "huge"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It was freezing, so we wore thick coats." What does "freezing" mean?$tl$, $tl$[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "very wet"}, {"id": "d", "label": "very dry"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The bag was heavy and hard to lift." What does "heavy" mean?$tl$, $tl$[{"id": "a", "label": "weighs little"}, {"id": "b", "label": "weighs a lot"}, {"id": "c", "label": "is empty"}, {"id": "d", "label": "is small"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The old, ancient house was over 100 years old." What does "ancient" mean?$tl$, $tl$[{"id": "a", "label": "brand new"}, {"id": "b", "label": "colorful"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "very old"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She spoke in a faint whisper we could barely hear." What does "faint" mean here?$tl$, $tl$[{"id": "a", "label": "very loud"}, {"id": "b", "label": "weak or soft"}, {"id": "c", "label": "sweet"}, {"id": "d", "label": "bright"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The cup was empty, so he filled it with water." What does "empty" mean?$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "nothing inside"}, {"id": "c", "label": "heavy"}, {"id": "d", "label": "broken"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The clever fox found a smart way out." What does "clever" mean?$tl$, $tl$[{"id": "a", "label": "silly"}, {"id": "b", "label": "smart"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "tired"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "The room was bright because the sun shone in." What does "bright" mean? Full of ____. (one word)$tl$, null, $tl$light$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He was furious and stomped his feet." What does "furious" mean?$tl$, $tl$[{"id": "a", "label": "very angry"}, {"id": "b", "label": "very happy"}, {"id": "c", "label": "very calm"}, {"id": "d", "label": "very sleepy"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The fragile glass broke when it fell." What does "fragile" mean?$tl$, $tl$[{"id": "a", "label": "very strong"}, {"id": "b", "label": "easily broken"}, {"id": "c", "label": "very heavy"}, {"id": "d", "label": "very old"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She was thrilled to win the prize." What does "thrilled" mean?$tl$, $tl$[{"id": "a", "label": "very bored"}, {"id": "b", "label": "very upset"}, {"id": "c", "label": "very tired"}, {"id": "d", "label": "very excited"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The damp towel was still a little wet." What does "damp" mean?$tl$, $tl$[{"id": "a", "label": "bone dry"}, {"id": "b", "label": "slightly wet"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "on fire"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Making Predictions (RL.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$making-predictions$tl$, $tl$Making Predictions$tl$, $tl$A prediction is a smart guess about what will happen next, based on clues in the text.$tl$, 3, $tl$RL.3.1$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Making Predictions$tl$, 3, $tl$[{"type": "explain", "title": "About: Making Predictions", "body": "A prediction is a smart guess about what will happen next, based on clues in the text."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Dark clouds gathered and the wind grew strong.\" What will probably happen next?  The correct answer is \"It will rain.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Tom put on his swimsuit and grabbed a towel.\" What will Tom probably do?", "choices": [{"id": "a", "label": "go swimming"}, {"id": "b", "label": "go to sleep"}, {"id": "c", "label": "do homework"}, {"id": "d", "label": "shovel snow"}], "answer": "a", "explanation": "The correct answer is \"go swimming\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Dark clouds gathered and the wind grew strong." What will probably happen next?$tl$, $tl$[{"id": "a", "label": "The sun will shine."}, {"id": "b", "label": "It will snow candy."}, {"id": "c", "label": "It will rain."}, {"id": "d", "label": "Nothing changes."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Tom put on his swimsuit and grabbed a towel." What will Tom probably do?$tl$, $tl$[{"id": "a", "label": "go swimming"}, {"id": "b", "label": "go to sleep"}, {"id": "c", "label": "do homework"}, {"id": "d", "label": "shovel snow"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The cake is in the oven and the timer is almost done." What will happen soon?$tl$, $tl$[{"id": "a", "label": "The cake will freeze."}, {"id": "b", "label": "The oven will fly."}, {"id": "c", "label": "The cake will be ready."}, {"id": "d", "label": "It will rain inside."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Mia yawned and rubbed her eyes at bedtime." What will Mia probably do?$tl$, $tl$[{"id": "a", "label": "fall asleep"}, {"id": "b", "label": "run a race"}, {"id": "c", "label": "eat lunch"}, {"id": "d", "label": "go to school"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He filled the watering can and walked to the garden." What will he probably do?$tl$, $tl$[{"id": "a", "label": "wash the car"}, {"id": "b", "label": "cook dinner"}, {"id": "c", "label": "water the plants"}, {"id": "d", "label": "fly a kite"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The team is winning with one minute left." What will probably happen?$tl$, $tl$[{"id": "a", "label": "The game starts over."}, {"id": "b", "label": "The team will likely win."}, {"id": "c", "label": "Everyone goes home first."}, {"id": "d", "label": "They lose for sure."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She packed a lunch, a map, and hiking boots." What will she probably do?$tl$, $tl$[{"id": "a", "label": "go to bed"}, {"id": "b", "label": "go swimming"}, {"id": "c", "label": "stay inside"}, {"id": "d", "label": "go on a hike"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The ice cream is melting in the hot sun." What will happen if she waits?$tl$, $tl$[{"id": "a", "label": "It will melt more."}, {"id": "b", "label": "It will freeze."}, {"id": "c", "label": "It will grow."}, {"id": "d", "label": "It will glow."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He studied all week for Friday's spelling test." What will probably happen?$tl$, $tl$[{"id": "a", "label": "He will likely do well."}, {"id": "b", "label": "He will fail on purpose."}, {"id": "c", "label": "The test is canceled."}, {"id": "d", "label": "He forgets everything for sure."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The puppy is staring at its empty bowl and whining." What does the puppy probably want?$tl$, $tl$[{"id": "a", "label": "a bath"}, {"id": "b", "label": "food"}, {"id": "c", "label": "a walk to school"}, {"id": "d", "label": "a nap only"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Clouds cleared and the sun came out after the storm." What might appear?$tl$, $tl$[{"id": "a", "label": "a rainbow"}, {"id": "b", "label": "snow"}, {"id": "c", "label": "fireworks"}, {"id": "d", "label": "a moon at noon"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "She blew up balloons and hung a 'Happy Birthday' sign." What will probably happen?$tl$, $tl$[{"id": "a", "label": "a school test"}, {"id": "b", "label": "a nap"}, {"id": "c", "label": "a car wash"}, {"id": "d", "label": "a birthday party"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The leaves turned orange and the air got cooler." What season is probably coming?$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "fall, then winter"}, {"id": "c", "label": "a hot day"}, {"id": "d", "label": "spring planting"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He tied his cleats and grabbed the soccer ball." What will he probably do?$tl$, $tl$[{"id": "a", "label": "play soccer"}, {"id": "b", "label": "go fishing"}, {"id": "c", "label": "read a book"}, {"id": "d", "label": "bake bread"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The baby bird flapped its wings at the edge of the nest." What might it do?$tl$, $tl$[{"id": "a", "label": "try to fly"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "dig"}, {"id": "d", "label": "sleep all winter"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "She opened her umbrella as the first drops fell." It is starting to ____. (one word)$tl$, null, $tl$rain$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The library closes in five minutes and lights are dimming." What will people do?$tl$, $tl$[{"id": "a", "label": "leave the library"}, {"id": "b", "label": "start a movie"}, {"id": "c", "label": "go to sleep there"}, {"id": "d", "label": "build a fort"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "He mixed flour, eggs, and sugar in a bowl." What is he probably making?$tl$, $tl$[{"id": "a", "label": "something to bake"}, {"id": "b", "label": "a sandcastle"}, {"id": "c", "label": "a paper plane"}, {"id": "d", "label": "a snowman"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The dog grabbed its leash and ran to the door." What does the dog want?$tl$, $tl$[{"id": "a", "label": "to sleep"}, {"id": "b", "label": "to go for a walk"}, {"id": "c", "label": "to eat a rock"}, {"id": "d", "label": "to fly"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Snow piled up and the school sign said 'Closed.'" What will the kids probably do?$tl$, $tl$[{"id": "a", "label": "stay home and play in snow"}, {"id": "b", "label": "go to class"}, {"id": "c", "label": "go swimming outside"}, {"id": "d", "label": "mow the lawn"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-predictions$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Characters & Setting (RL.3.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$character-and-setting$tl$, $tl$Characters & Setting$tl$, $tl$Characters are who a story is about. The setting is where and when the story happens.$tl$, 3, $tl$RL.3.3$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Characters & Setting$tl$, 3, $tl$[{"type": "explain", "title": "About: Characters & Setting", "body": "Characters are who a story is about. The setting is where and when the story happens."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"In the busy city, Ravi waited for the train.\" Where does this happen (setting)?  The correct answer is \"in the city\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Kind Mrs. Lee helped the lost kitten find its way home.\" Who is the character?", "choices": [{"id": "a", "label": "Mrs. Lee"}, {"id": "b", "label": "the train"}, {"id": "c", "label": "the city"}, {"id": "d", "label": "the rain"}], "answer": "a", "explanation": "The correct answer is \"Mrs. Lee\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "In the busy city, Ravi waited for the train." Where does this happen (setting)?$tl$, $tl$[{"id": "a", "label": "on a farm"}, {"id": "b", "label": "in space"}, {"id": "c", "label": "under the sea"}, {"id": "d", "label": "in the city"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Kind Mrs. Lee helped the lost kitten find its way home." Who is the character?$tl$, $tl$[{"id": "a", "label": "Mrs. Lee"}, {"id": "b", "label": "the train"}, {"id": "c", "label": "the city"}, {"id": "d", "label": "the rain"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It was a snowy night in the quiet village." What is the setting?$tl$, $tl$[{"id": "a", "label": "a snowy village at night"}, {"id": "b", "label": "a sunny beach"}, {"id": "c", "label": "a busy mall"}, {"id": "d", "label": "a hot desert"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Brave Captain Mara sailed her ship through the storm." Who is the main character?$tl$, $tl$[{"id": "a", "label": "the storm"}, {"id": "b", "label": "the ship's flag"}, {"id": "c", "label": "the ocean"}, {"id": "d", "label": "Captain Mara"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "At the farm, the rooster crowed at sunrise." Where does the story take place?$tl$, $tl$[{"id": "a", "label": "in a city"}, {"id": "b", "label": "on the Moon"}, {"id": "c", "label": "in a cave"}, {"id": "d", "label": "on a farm"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Curious Leo loved to ask questions about everything." What word describes Leo?$tl$, $tl$[{"id": "a", "label": "lazy"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "mean"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The campers told stories by the fire deep in the forest." What is the setting?$tl$, $tl$[{"id": "a", "label": "a school"}, {"id": "b", "label": "a store"}, {"id": "c", "label": "a forest at night"}, {"id": "d", "label": "a pool"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Shy Nina hid behind her mom when the clown waved." How does Nina feel?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "excited"}, {"id": "d", "label": "shy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "On the spaceship, Zoe floated past the control panel." Where is Zoe?$tl$, $tl$[{"id": "a", "label": "in a barn"}, {"id": "b", "label": "at a beach"}, {"id": "c", "label": "in a kitchen"}, {"id": "d", "label": "on a spaceship"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Grumpy Mr. Frost frowned at the noisy birds." What word describes Mr. Frost?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "calm"}, {"id": "c", "label": "silly"}, {"id": "d", "label": "grumpy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The market was crowded and full of bright fruit stands." What is the setting?$tl$, $tl$[{"id": "a", "label": "an empty field"}, {"id": "b", "label": "a busy market"}, {"id": "c", "label": "a dark cave"}, {"id": "d", "label": "a quiet library"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Helpful Sam carried the heavy bags for his neighbor." What word describes Sam?$tl$, $tl$[{"id": "a", "label": "helpful"}, {"id": "b", "label": "selfish"}, {"id": "c", "label": "rude"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Deep under the sea, a little fish explored a coral reef." Where is the fish?$tl$, $tl$[{"id": "a", "label": "in the sky"}, {"id": "b", "label": "on a mountain"}, {"id": "c", "label": "under the sea"}, {"id": "d", "label": "in a city"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Excited Priya jumped up and down when she won." How does Priya feel?$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "bored"}, {"id": "c", "label": "sad"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "It was a rainy afternoon inside the cozy cabin." What is the setting?$tl$, $tl$[{"id": "a", "label": "a sunny park"}, {"id": "b", "label": "a cabin on a rainy day"}, {"id": "c", "label": "a school bus"}, {"id": "d", "label": "a spaceship"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Read: "Gentle Grandma hugged the crying child." One word that describes Grandma is ____. $tl$, null, $tl$gentle$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "At the zoo, the children watched the monkeys swing." Where are the children?$tl$, $tl$[{"id": "a", "label": "at the zoo"}, {"id": "b", "label": "at home"}, {"id": "c", "label": "in a boat"}, {"id": "d", "label": "in space"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Clever Fox tricked the slow Bear in the old tale." Who are the characters?$tl$, $tl$[{"id": "a", "label": "the tree and rock"}, {"id": "b", "label": "the sun and moon"}, {"id": "c", "label": "Fox and Bear"}, {"id": "d", "label": "the road"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The story began on a hot summer day at the beach." What is the setting?$tl$, $tl$[{"id": "a", "label": "a beach in summer"}, {"id": "b", "label": "a snowy mountain"}, {"id": "c", "label": "a dark cave"}, {"id": "d", "label": "a classroom"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Honest Tia returned the wallet she found." What word describes Tia?$tl$, $tl$[{"id": "a", "label": "dishonest"}, {"id": "b", "label": "mean"}, {"id": "c", "label": "honest"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-and-setting$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Fact vs. Opinion (RI.3.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$fact-and-opinion$tl$, $tl$Fact vs. Opinion$tl$, $tl$A fact can be proven true. An opinion tells what someone feels and can't be proven. Words like best signal opinions.$tl$, 3, $tl$RI.3.8$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Fact vs. Opinion$tl$, 3, $tl$[{"type": "explain", "title": "About: Fact vs. Opinion", "body": "A fact can be proven true. An opinion tells what someone feels and can't be proven. Words like best signal opinions."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which is a FACT?  The correct answer is \"A dog has four legs.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which is an OPINION?", "choices": [{"id": "a", "label": "Summer is the best season."}, {"id": "b", "label": "Summer is warm."}, {"id": "c", "label": "A week has 7 days."}, {"id": "d", "label": "Ice is frozen water."}], "answer": "a", "explanation": "The correct answer is \"Summer is the best season.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Dogs are the best pets."}, {"id": "b", "label": "Cats are cuter."}, {"id": "c", "label": "A dog has four legs."}, {"id": "d", "label": "Walks are boring."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Summer is the best season."}, {"id": "b", "label": "Summer is warm."}, {"id": "c", "label": "A week has 7 days."}, {"id": "d", "label": "Ice is frozen water."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Sunsets are pretty."}, {"id": "b", "label": "Mornings are the worst."}, {"id": "c", "label": "Yellow is happy."}, {"id": "d", "label": "The sun gives us light."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Pizza has cheese."}, {"id": "b", "label": "Pizza tastes amazing."}, {"id": "c", "label": "A triangle has 3 sides."}, {"id": "d", "label": "Birds lay eggs."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$"Our school has 200 students." This is a:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "question"}, {"id": "d", "label": "story"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$"Reading is more fun than TV." This is an:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "rule"}, {"id": "c", "label": "opinion"}, {"id": "d", "label": "number"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which can be checked to see if it is true?$tl$, $tl$[{"id": "a", "label": "Mondays are terrible."}, {"id": "b", "label": "This book is the best."}, {"id": "c", "label": "The store opens at 9."}, {"id": "d", "label": "Green is calming."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word often signals an opinion?$tl$, $tl$[{"id": "a", "label": "measures"}, {"id": "b", "label": "best"}, {"id": "c", "label": "equals"}, {"id": "d", "label": "contains"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Bees are scary."}, {"id": "b", "label": "Bees make honey."}, {"id": "c", "label": "Honey is the tastiest."}, {"id": "d", "label": "Bugs are gross."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Recess should be longer."}, {"id": "b", "label": "Recess is after lunch."}, {"id": "c", "label": "A year has 12 months."}, {"id": "d", "label": "Water is wet."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Fish are boring."}, {"id": "b", "label": "Sharks are mean."}, {"id": "c", "label": "Fish live in water."}, {"id": "d", "label": "The ocean is scary."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Ten is an even number."}, {"id": "b", "label": "A square has 4 sides."}, {"id": "c", "label": "Plants need light."}, {"id": "d", "label": "Math is too hard."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$"The cat is black." This is a:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "question"}, {"id": "d", "label": "joke"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$"Black cats are the prettiest." This is an:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "number"}, {"id": "d", "label": "rule"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT you could check?$tl$, $tl$[{"id": "a", "label": "Libraries are boring."}, {"id": "b", "label": "The library is on Oak Street."}, {"id": "c", "label": "Reading is the best."}, {"id": "d", "label": "Quiet places are dull."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$A statement that tells what someone feels and can't be proven is an ____. (one word)$tl$, null, $tl$opinion$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Apples taste the best."}, {"id": "b", "label": "Red apples are prettiest."}, {"id": "c", "label": "An apple is a fruit."}, {"id": "d", "label": "Fruit is boring."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Snow is cold."}, {"id": "b", "label": "Snow is frozen water."}, {"id": "c", "label": "Snow is white."}, {"id": "d", "label": "Snow days are the best."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which signals an opinion?$tl$, $tl$[{"id": "a", "label": "favorite"}, {"id": "b", "label": "arrived"}, {"id": "c", "label": "measured"}, {"id": "d", "label": "counted"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Spiders are creepy."}, {"id": "b", "label": "Spiders have eight legs."}, {"id": "c", "label": "Spiders are the worst."}, {"id": "d", "label": "Webs are ugly."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Compare & Contrast (RL.3.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-and-contrast$tl$, $tl$Compare & Contrast$tl$, $tl$Comparing shows how things are alike; contrasting shows how they differ. 'Both' signals alike; 'but' and 'unlike' signal different.$tl$, 3, $tl$RL.3.9$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Compare & Contrast$tl$, 3, $tl$[{"type": "explain", "title": "About: Compare & Contrast", "body": "Comparing shows how things are alike; contrasting shows how they differ. 'Both' signals alike; 'but' and 'unlike' signal different."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"A cat and a dog are both pets, but a cat purrs and a dog barks.\" How are they ALIKE?  The correct answer is \"both are pets\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Apples are crunchy, but bananas are soft.\" This shows a:", "choices": [{"id": "a", "label": "similarity"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "cause"}], "answer": "c", "explanation": "The correct answer is \"difference\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "A cat and a dog are both pets, but a cat purrs and a dog barks." How are they ALIKE?$tl$, $tl$[{"id": "a", "label": "both purr"}, {"id": "b", "label": "both bark"}, {"id": "c", "label": "both are pets"}, {"id": "d", "label": "both fly"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Apples are crunchy, but bananas are soft." This shows a:$tl$, $tl$[{"id": "a", "label": "similarity"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "cause"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Both a bike and a car have wheels." The word that signals they are alike is:$tl$, $tl$[{"id": "a", "label": "but"}, {"id": "b", "label": "unlike"}, {"id": "c", "label": "while"}, {"id": "d", "label": "both"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Summer is hot, but winter is cold." This compares the seasons by:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "size"}, {"id": "c", "label": "temperature"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Unlike a fish, a frog can live on land." The word "unlike" signals a:$tl$, $tl$[{"id": "a", "label": "similarity"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "cause"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "A pencil and a crayon are both used to draw, but a pencil can be erased." How are they DIFFERENT?$tl$, $tl$[{"id": "a", "label": "both draw"}, {"id": "b", "label": "both are tools"}, {"id": "c", "label": "both are long"}, {"id": "d", "label": "a pencil can be erased"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Both birds and bats can fly." A similarity is that both:$tl$, $tl$[{"id": "a", "label": "have fur"}, {"id": "b", "label": "have feathers"}, {"id": "c", "label": "can fly"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "The city is loud, while the farm is quiet." This contrasts the places by:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "spelling"}, {"id": "c", "label": "noise level"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word signals things are ALIKE?$tl$, $tl$[{"id": "a", "label": "however"}, {"id": "b", "label": "unlike"}, {"id": "c", "label": "also"}, {"id": "d", "label": "but"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Dogs and wolves look alike, but dogs are tame and wolves are wild." How are they DIFFERENT?$tl$, $tl$[{"id": "a", "label": "both have tails"}, {"id": "b", "label": "both are animals"}, {"id": "c", "label": "both have fur"}, {"id": "d", "label": "one is tame, one is wild"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Both a spoon and a fork are used to eat." They are alike because both:$tl$, $tl$[{"id": "a", "label": "help us eat"}, {"id": "b", "label": "are sharp knives"}, {"id": "c", "label": "are cups"}, {"id": "d", "label": "are plates"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "A rose is red, but a leaf is green." This compares them by:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "size"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "smell"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word signals a difference?$tl$, $tl$[{"id": "a", "label": "also"}, {"id": "b", "label": "but"}, {"id": "c", "label": "both"}, {"id": "d", "label": "too"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Tigers and house cats are both cats, but tigers are much bigger." How are they DIFFERENT?$tl$, $tl$[{"id": "a", "label": "both have whiskers"}, {"id": "b", "label": "both are cats"}, {"id": "c", "label": "both have tails"}, {"id": "d", "label": "size"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Like a car, a bus carries people." The word "like" signals a:$tl$, $tl$[{"id": "a", "label": "difference"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause"}, {"id": "d", "label": "similarity"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$The word "both" usually shows two things are ____ (alike or different?). $tl$, null, $tl$alike$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Winter has snow, but spring has flowers." This contrasts the seasons by:$tl$, $tl$[{"id": "a", "label": "their letters"}, {"id": "b", "label": "what appears in them"}, {"id": "c", "label": "their price"}, {"id": "d", "label": "their sound"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "Both books are about dogs, but one is funny and one is sad." The difference is:$tl$, $tl$[{"id": "a", "label": "the topic (dogs)"}, {"id": "b", "label": "how they feel (funny vs sad)"}, {"id": "c", "label": "the author's age"}, {"id": "d", "label": "the cover only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Read: "A duck and a chicken are both birds." They are alike because both:$tl$, $tl$[{"id": "a", "label": "can swim deep"}, {"id": "b", "label": "have fur"}, {"id": "c", "label": "are birds"}, {"id": "d", "label": "have four legs"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence shows a similarity?$tl$, $tl$[{"id": "a", "label": "A lion roars, but a mouse squeaks."}, {"id": "b", "label": "Unlike day, night is dark."}, {"id": "c", "label": "Both apples and pears grow on trees."}, {"id": "d", "label": "Cats meow, but dogs bark."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Synonyms & Antonyms (L.3.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$synonyms-and-antonyms$tl$, $tl$Synonyms & Antonyms$tl$, $tl$Synonyms are words that mean almost the same thing. Antonyms mean the opposite.$tl$, 3, $tl$L.3.5$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Synonyms & Antonyms$tl$, 3, $tl$[{"type": "explain", "title": "About: Synonyms & Antonyms", "body": "Synonyms are words that mean almost the same thing. Antonyms mean the opposite."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word means almost the same as \"happy\"?  The correct answer is \"glad\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is the OPPOSITE of \"big\"?", "choices": [{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "giant"}, {"id": "d", "label": "small"}], "answer": "d", "explanation": "The correct answer is \"small\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word means almost the same as "happy"?$tl$, $tl$[{"id": "a", "label": "glad"}, {"id": "b", "label": "sad"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "tired"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is the OPPOSITE of "big"?$tl$, $tl$[{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "giant"}, {"id": "d", "label": "small"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "fast" is:$tl$, $tl$[{"id": "a", "label": "quick"}, {"id": "b", "label": "slow"}, {"id": "c", "label": "late"}, {"id": "d", "label": "still"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "hot" is:$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "cold"}, {"id": "c", "label": "boiling"}, {"id": "d", "label": "sunny"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "happy" is:$tl$, $tl$[{"id": "a", "label": "grumpy"}, {"id": "b", "label": "upset"}, {"id": "c", "label": "mad"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "up" is:$tl$, $tl$[{"id": "a", "label": "high"}, {"id": "b", "label": "above"}, {"id": "c", "label": "top"}, {"id": "d", "label": "down"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which means almost the same as "big"?$tl$, $tl$[{"id": "a", "label": "large"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "small"}, {"id": "d", "label": "short"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "open" is:$tl$, $tl$[{"id": "a", "label": "closed"}, {"id": "b", "label": "wide"}, {"id": "c", "label": "ajar"}, {"id": "d", "label": "unlocked"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "smart" is:$tl$, $tl$[{"id": "a", "label": "clever"}, {"id": "b", "label": "silly"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "day" is:$tl$, $tl$[{"id": "a", "label": "night"}, {"id": "b", "label": "noon"}, {"id": "c", "label": "morning"}, {"id": "d", "label": "sunrise"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "quiet" is:$tl$, $tl$[{"id": "a", "label": "loud"}, {"id": "b", "label": "noisy"}, {"id": "c", "label": "booming"}, {"id": "d", "label": "silent"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "start" is:$tl$, $tl$[{"id": "a", "label": "begin"}, {"id": "b", "label": "go"}, {"id": "c", "label": "open"}, {"id": "d", "label": "stop"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "little" is:$tl$, $tl$[{"id": "a", "label": "huge"}, {"id": "b", "label": "small"}, {"id": "c", "label": "tall"}, {"id": "d", "label": "wide"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "happy" is:$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "glad"}, {"id": "c", "label": "joyful"}, {"id": "d", "label": "merry"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "angry" is:$tl$, $tl$[{"id": "a", "label": "calm"}, {"id": "b", "label": "mad"}, {"id": "c", "label": "happy"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write a one-word OPPOSITE (antonym) of "cold". $tl$, null, $tl$hot$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which means almost the same as "pretty"?$tl$, $tl$[{"id": "a", "label": "ugly"}, {"id": "b", "label": "beautiful"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "dull"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "full" is:$tl$, $tl$[{"id": "a", "label": "packed"}, {"id": "b", "label": "empty"}, {"id": "c", "label": "stuffed"}, {"id": "d", "label": "loaded"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$A synonym for "jump" is:$tl$, $tl$[{"id": "a", "label": "sit"}, {"id": "b", "label": "crawl"}, {"id": "c", "label": "leap"}, {"id": "d", "label": "stand"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$The opposite of "wet" is:$tl$, $tl$[{"id": "a", "label": "soggy"}, {"id": "b", "label": "damp"}, {"id": "c", "label": "moist"}, {"id": "d", "label": "dry"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea. Common nouns are general; proper nouns name a specific one.$tl$, 3, $tl$L.3.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 3, $tl$[{"type": "explain", "title": "About: Nouns", "body": "A noun names a person, place, thing, or idea. Common nouns are general; proper nouns name a specific one."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a noun (a person, place, or thing)?  The correct answer is \"teacher\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "swim"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "doctor"}], "answer": "d", "explanation": "The correct answer is \"doctor\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "build"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "march"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "village"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action. Action verbs tell what the subject does, like run, jump, or think.$tl$, 3, $tl$L.3.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 3, $tl$[{"type": "explain", "title": "About: Action Verbs", "body": "A verb shows action. Action verbs tell what the subject does, like run, jump, or think."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an action verb (something you can do)?  The correct answer is \"gallop\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "gentle"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "bounce"}], "answer": "d", "explanation": "The correct answer is \"bounce\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "march"}, {"id": "c", "label": "island"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "window"}, {"id": "c", "label": "village"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "library"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "village"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun, telling what kind, how many, or which one.$tl$, 3, $tl$L.3.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 3, $tl$[{"type": "explain", "title": "About: Adjectives", "body": "An adjective describes a noun, telling what kind, how many, or which one."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an adjective (it describes a noun)?  The correct answer is \"narrow\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "frozen"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "march"}, {"id": "d", "label": "river"}], "answer": "a", "explanation": "The correct answer is \"frozen\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "march"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "island"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "library"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "village"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "library"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "village"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "island"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "build"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "march"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun, like he, she, it, we, or they.$tl$, 3, $tl$L.3.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 3, $tl$[{"type": "explain", "title": "About: Pronouns", "body": "A pronoun takes the place of a noun, like he, she, it, we, or they."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a pronoun (it takes the place of a noun)?  The correct answer is \"him\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "scribble"}, {"id": "b", "label": "village"}, {"id": "c", "label": "them"}, {"id": "d", "label": "library"}], "answer": "c", "explanation": "The correct answer is \"them\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "him"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "build"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "village"}, {"id": "c", "label": "them"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "you"}, {"id": "b", "label": "window"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "they"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "we"}, {"id": "c", "label": "library"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "she"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "library"}, {"id": "d", "label": "it"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "us"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "her"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "him"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "window"}, {"id": "c", "label": "library"}, {"id": "d", "label": "them"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "you"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "village"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "we"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "she"}, {"id": "c", "label": "window"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "it"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "us"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "island"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "her"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must match the subject. A singular subject usually takes a verb ending in -s.$tl$, 3, $tl$L.3.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 3, $tl$[{"type": "explain", "title": "About: Subject-Verb Agreement", "body": "The verb must match the subject. A singular subject usually takes a verb ending in -s."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Choose the correct verb: \"The puppy ____ every day.\"  The correct answer is \"wags\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The kettle ____ every day.\"", "choices": [{"id": "a", "label": "whistle"}, {"id": "b", "label": "whistlesed"}, {"id": "c", "label": "whistles"}, {"id": "d", "label": "whistlesing"}], "answer": "c", "explanation": "The correct answer is \"whistles\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wag"}, {"id": "b", "label": "wagsed"}, {"id": "c", "label": "wagsing"}, {"id": "d", "label": "wags"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistle"}, {"id": "b", "label": "whistlesed"}, {"id": "c", "label": "whistles"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithersing"}, {"id": "d", "label": "slithers"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runs"}, {"id": "c", "label": "runsed"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "growsed"}, {"id": "c", "label": "growsing"}, {"id": "d", "label": "grows"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "plays"}, {"id": "b", "label": "play"}, {"id": "c", "label": "playsed"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "crie"}, {"id": "b", "label": "cries"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "performs"}, {"id": "b", "label": "perform"}, {"id": "c", "label": "performsed"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roars"}, {"id": "c", "label": "roarsed"}, {"id": "d", "label": "roarsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plant"}, {"id": "b", "label": "plantsed"}, {"id": "c", "label": "plantsing"}, {"id": "d", "label": "plants"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flows"}, {"id": "b", "label": "flow"}, {"id": "c", "label": "flowsed"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooks"}, {"id": "d", "label": "cooksing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sing"}, {"id": "b", "label": "sings"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barks"}, {"id": "c", "label": "barksed"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hop"}, {"id": "b", "label": "hopsed"}, {"id": "c", "label": "hopsing"}, {"id": "d", "label": "hops"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "reads"}, {"id": "c", "label": "readsed"}, {"id": "d", "label": "readsing"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "write"}, {"id": "b", "label": "writesed"}, {"id": "c", "label": "writesing"}, {"id": "d", "label": "writes"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticksed"}, {"id": "c", "label": "ticksing"}, {"id": "d", "label": "ticks"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paints"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "paintsed"}, {"id": "d", "label": "paintsing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs tell about something that already happened. Many add -ed; some are irregular.$tl$, 3, $tl$L.3.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 3, $tl$[{"type": "explain", "title": "About: Past-Tense Verbs", "body": "Past-tense verbs tell about something that already happened. Many add -ed; some are irregular."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the past tense of the verb \"speak\"?  The answer is spoke."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "ride"?$tl$, null, $tl$rode$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "know"?$tl$, null, $tl$knew$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "bring"?$tl$, null, $tl$brought$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "drink"?$tl$, null, $tl$drank$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.3.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals mean more than one. Add -s or -es, or change y to -ies after a consonant.$tl$, 3, $tl$L.3.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 3, $tl$[{"type": "explain", "title": "About: Plural Nouns", "body": "Plurals mean more than one. Add -s or -es, or change y to -ies after a consonant."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Write the plural of \"cherry\".  The answer is cherries."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "loaf".$tl$, null, $tl$loaves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.3.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization-proper-nouns$tl$, $tl$Capitalization$tl$, $tl$Capitalize the first word of a sentence, the word I, and proper nouns like names, places, days, and months.$tl$, 3, $tl$L.3.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 3, $tl$[{"type": "explain", "title": "About: Capitalization", "body": "Capitalize the first word of a sentence, the word I, and proper nouns like names, places, days, and months."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word or phrase is a proper noun that must be capitalized?  The correct answer is \"December\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "October"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "river"}, {"id": "d", "label": "friend"}], "answer": "a", "explanation": "The correct answer is \"October\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "day"}, {"id": "c", "label": "river"}, {"id": "d", "label": "December"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "October"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "river"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "Sarah"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "Mount Everest"}, {"id": "c", "label": "city"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Tokyo"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "river"}, {"id": "d", "label": "Nile River"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Tuesday"}, {"id": "b", "label": "river"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "month"}, {"id": "c", "label": "New York"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Friday"}, {"id": "c", "label": "day"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "river"}, {"id": "c", "label": "India"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "city"}, {"id": "c", "label": "London"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "Africa"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Saturn"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "July"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "city"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "Amazon River"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Canada"}, {"id": "b", "label": "month"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Maria"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "Monday"}, {"id": "c", "label": "country"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "river"}, {"id": "c", "label": "Australia"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "month"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Pacific Ocean"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.3.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End a telling sentence with a period, a question with a question mark, and an excited sentence with an exclamation point.$tl$, 3, $tl$L.3.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 3, $tl$[{"type": "explain", "title": "About: End Punctuation", "body": "End a telling sentence with a period, a question with a question mark, and an excited sentence with an exclamation point."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which end mark best completes the sentence?  \"Run for your life___\"  The correct answer is \"!\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"The cake is delicious___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "The correct answer is \".\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.3.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$When you list three or more things, separate them with commas and put 'and' before the last item.$tl$, 3, $tl$L.3.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 3, $tl$[{"type": "explain", "title": "About: Commas in a Series", "body": "When you list three or more things, separate them with commas and put 'and' before the last item."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence uses commas correctly in a list?  The correct answer is \"I like spring, summer, and fall.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens, and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}], "answer": "b", "explanation": "The correct answer is \"I like pencils, pens, and markers.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 3, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring summer and fall."}, {"id": "b", "label": "I like spring, summer and fall"}, {"id": "c", "label": "I like, spring summer fall."}, {"id": "d", "label": "I like spring, summer, and fall."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens, and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers and bears"}, {"id": "c", "label": "I like lions, tigers, and bears."}, {"id": "d", "label": "I like, lions tigers bears."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis and golf"}, {"id": "c", "label": "I like, soccer tennis golf."}, {"id": "d", "label": "I like soccer, tennis, and golf."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes and buses"}, {"id": "c", "label": "I like trains, planes, and buses."}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 3, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums, and guitar."}, {"id": "c", "label": "I like piano, drums and guitar"}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump, and swim."}, {"id": "c", "label": "I like run, jump and swim"}, {"id": "d", "label": "I like, run jump swim."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham cheese and lettuce."}, {"id": "b", "label": "I like ham, cheese and lettuce"}, {"id": "c", "label": "I like ham, cheese, and lettuce."}, {"id": "d", "label": "I like, ham cheese lettuce."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver, and bronze."}, {"id": "c", "label": "I like gold, silver and bronze"}, {"id": "d", "label": "I like, gold silver bronze."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like, cats dogs fish."}, {"id": "d", "label": "I like cats, dogs, and fish."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 3, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like Mom, Dad, and Grandma."}, {"id": "d", "label": "I like, Mom Dad Grandma."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like, red green blue."}, {"id": "d", "label": "I like red, green, and blue."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow, and hail."}, {"id": "c", "label": "I like rain, snow and hail"}, {"id": "d", "label": "I like, rain snow hail."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples grapes and plums."}, {"id": "b", "label": "I like apples, grapes, and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 3, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares, and triangles."}, {"id": "c", "label": "I like circles, squares and triangles"}, {"id": "d", "label": "I like, circles squares triangles."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north south and east."}, {"id": "b", "label": "I like north, south and east"}, {"id": "c", "label": "I like north, south, and east."}, {"id": "d", "label": "I like, north south east."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs, and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens and rulers"}, {"id": "c", "label": "I like books, pens, and rulers."}, {"id": "d", "label": "I like, books pens rulers."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 3, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples, oranges, and pears."}, {"id": "b", "label": "I like apples oranges and pears."}, {"id": "c", "label": "I like apples, oranges and pears"}, {"id": "d", "label": "I like, apples oranges pears."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 3 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

