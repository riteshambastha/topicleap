-- =====================================================================
-- TopicLeap - Grade 4 full curriculum seed (generated)
-- 4 subjects x 10 topics, each with a lesson + 10-question worksheet.
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

-- ---- [math] Place Value to Hundred Thousands (4.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$place-value-to-hundred-thousands$tl$, $tl$Place Value to Hundred Thousands$tl$, $tl$Each digit in a number has a value based on its place: ones, tens, hundreds, thousands, and beyond. The same digit is worth more the farther left it sits.$tl$, 4, $tl$4.NBT.A.2$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Place Value to Hundred Thousands$tl$, 4, $tl$[{"type": "explain", "title": "About: Place Value to Hundred Thousands", "body": "Each digit in a number has a value based on its place: ones, tens, hundreds, thousands, and beyond. The same digit is worth more the farther left it sits."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the value of the digit 7 in 452,871? (Write just the number, e.g. 4000)  The answer is 70."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Place Value to Hundred Thousands - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 452,871? (Write just the number, e.g. 4000)$tl$, null, $tl$70$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 441,153? (Write just the number, e.g. 4000)$tl$, null, $tl$400000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 5 in 25,535? (Write just the number, e.g. 4000)$tl$, null, $tl$5$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 3 in 818,153? (Write just the number, e.g. 4000)$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 723,488? (Write just the number, e.g. 4000)$tl$, null, $tl$700000$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 537,436? (Write just the number, e.g. 4000)$tl$, null, $tl$400$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 663,549? (Write just the number, e.g. 4000)$tl$, null, $tl$60000$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 979,779? (Write just the number, e.g. 4000)$tl$, null, $tl$70000$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 752,425? (Write just the number, e.g. 4000)$tl$, null, $tl$400$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the value of the digit 3 in 803,604? (Write just the number, e.g. 4000)$tl$, null, $tl$3000$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-hundred-thousands$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Rounding Large Numbers (4.NBT.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rounding-large-numbers$tl$, $tl$Rounding Large Numbers$tl$, $tl$To round, look at the digit just to the right of the place you're rounding to. If it's 5 or more, round up; if it's less than 5, round down.$tl$, 4, $tl$4.NBT.A.3$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Rounding Large Numbers$tl$, 4, $tl$[{"type": "explain", "title": "About: Rounding Large Numbers", "body": "To round, look at the digit just to the right of the place you're rounding to. If it's 5 or more, round up; if it's less than 5, round down."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Round 7,009 to the nearest hundred.  The answer is 7000."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Rounding Large Numbers - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 7,009 to the nearest hundred.$tl$, null, $tl$7000$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 60,051 to the nearest thousand.$tl$, null, $tl$60000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 1,606 to the nearest hundred.$tl$, null, $tl$1600$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 3,507 to the nearest hundred.$tl$, null, $tl$3500$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 8,070 to the nearest hundred.$tl$, null, $tl$8100$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 624 to the nearest ten.$tl$, null, $tl$620$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 125 to the nearest ten.$tl$, null, $tl$130$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 1,344 to the nearest ten.$tl$, null, $tl$1340$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 80,192 to the nearest thousand.$tl$, null, $tl$80000$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Round 89,808 to the nearest thousand.$tl$, null, $tl$90000$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rounding-large-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multi-Digit Addition & Subtraction (4.NBT.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multi-digit-addition-and-subtraction$tl$, $tl$Multi-Digit Addition & Subtraction$tl$, $tl$Line up numbers by place value, then add or subtract one column at a time, regrouping (carrying or borrowing) when needed.$tl$, 4, $tl$4.NBT.B.4$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multi-Digit Addition & Subtraction$tl$, 4, $tl$[{"type": "explain", "title": "About: Multi-Digit Addition & Subtraction", "body": "Line up numbers by place value, then add or subtract one column at a time, regrouping (carrying or borrowing) when needed."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 78,174 + 24,446 = ?  The answer is 102620."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Multi-Digit Addition & Subtraction - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add: 78,174 + 24,446 = ?$tl$, null, $tl$102620$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 63,649 - 27,725 = ?$tl$, null, $tl$35924$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add: 87,292 + 9,294 = ?$tl$, null, $tl$96586$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 87,628 - 1,565 = ?$tl$, null, $tl$86063$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add: 74,660 + 46,435 = ?$tl$, null, $tl$121095$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 63,068 - 16,953 = ?$tl$, null, $tl$46115$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add: 76,163 + 72,670 = ?$tl$, null, $tl$148833$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 9,121 - 7,833 = ?$tl$, null, $tl$1288$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add: 10,671 + 7,430 = ?$tl$, null, $tl$18101$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 75,432 - 45,634 = ?$tl$, null, $tl$29798$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-addition-and-subtraction$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multiply by a One-Digit Number (4.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiply-by-one-digit$tl$, $tl$Multiply by a One-Digit Number$tl$, $tl$Break the big number into place values, multiply each part by the one-digit number, then add the partial products together.$tl$, 4, $tl$4.NBT.B.5$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiply by a One-Digit Number$tl$, 4, $tl$[{"type": "explain", "title": "About: Multiply by a One-Digit Number", "body": "Break the big number into place values, multiply each part by the one-digit number, then add the partial products together."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Multiply: 6 x 226 = ?  The answer is 1356."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Multiply by a One-Digit Number - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 6 x 226 = ?$tl$, null, $tl$1356$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 3 x 726 = ?$tl$, null, $tl$2178$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 6 x 341 = ?$tl$, null, $tl$2046$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 9 x 886 = ?$tl$, null, $tl$7974$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 3 x 612 = ?$tl$, null, $tl$1836$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 9 x 917 = ?$tl$, null, $tl$8253$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 9 x 950 = ?$tl$, null, $tl$8550$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 2 x 206 = ?$tl$, null, $tl$412$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 8 x 690 = ?$tl$, null, $tl$5520$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 9 x 981 = ?$tl$, null, $tl$8829$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-by-one-digit$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multiply Two Two-Digit Numbers (4.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiply-two-digit-numbers$tl$, $tl$Multiply Two Two-Digit Numbers$tl$, $tl$Split each number into tens and ones and multiply every part by every part (the area model), then add up all the partial products.$tl$, 4, $tl$4.NBT.B.5$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiply Two Two-Digit Numbers$tl$, 4, $tl$[{"type": "explain", "title": "About: Multiply Two Two-Digit Numbers", "body": "Split each number into tens and ones and multiply every part by every part (the area model), then add up all the partial products."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Multiply: 44 x 89 = ?  The answer is 3916."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Multiply Two Two-Digit Numbers - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 44 x 89 = ?$tl$, null, $tl$3916$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 43 x 67 = ?$tl$, null, $tl$2881$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 50 x 19 = ?$tl$, null, $tl$950$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 73 x 51 = ?$tl$, null, $tl$3723$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 88 x 96 = ?$tl$, null, $tl$8448$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 54 x 47 = ?$tl$, null, $tl$2538$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 98 x 57 = ?$tl$, null, $tl$5586$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 36 x 86 = ?$tl$, null, $tl$3096$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 35 x 72 = ?$tl$, null, $tl$2520$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Multiply: 32 x 49 = ?$tl$, null, $tl$1568$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-two-digit-numbers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Division with Remainders (4.NBT.B.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$division-with-remainders$tl$, $tl$Division with Remainders$tl$, $tl$Divide to find how many equal groups you can make (the quotient). Whatever is left over and can't make a full group is the remainder.$tl$, 4, $tl$4.NBT.B.6$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Division with Remainders$tl$, 4, $tl$[{"type": "explain", "title": "About: Division with Remainders", "body": "Divide to find how many equal groups you can make (the quotient). Whatever is left over and can't make a full group is the remainder."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the quotient (whole-number part) of 205 / 9?  The answer is 22."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Division with Remainders - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the quotient (whole-number part) of 205 / 9?$tl$, null, $tl$22$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the remainder of 246 / 7?$tl$, null, $tl$1$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the quotient (whole-number part) of 101 / 3?$tl$, null, $tl$33$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the remainder of 156 / 7?$tl$, null, $tl$2$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the quotient (whole-number part) of 113 / 5?$tl$, null, $tl$22$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the remainder of 199 / 7?$tl$, null, $tl$3$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the quotient (whole-number part) of 641 / 8?$tl$, null, $tl$80$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the remainder of 65 / 4?$tl$, null, $tl$1$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the quotient (whole-number part) of 572 / 9?$tl$, null, $tl$63$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the remainder of 409 / 9?$tl$, null, $tl$4$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$division-with-remainders$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Factors & Multiples (4.OA.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$factors-and-multiples$tl$, $tl$Factors & Multiples$tl$, $tl$A factor divides a number evenly with no remainder. A multiple is what you get when you skip-count by a number.$tl$, 4, $tl$4.OA.B.4$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Factors & Multiples$tl$, 4, $tl$[{"type": "explain", "title": "About: Factors & Multiples", "body": "A factor divides a number evenly with no remainder. A multiple is what you get when you skip-count by a number."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which number is a factor of 36?  The correct answer is \"3\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which number is a multiple of 4?", "choices": [{"id": "a", "label": "33"}, {"id": "b", "label": "33"}, {"id": "c", "label": "32"}, {"id": "d", "label": "30"}], "answer": "c", "explanation": "The correct answer is \"32\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Factors & Multiples - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a factor of 36?$tl$, $tl$[{"id": "a", "label": "14"}, {"id": "b", "label": "3"}, {"id": "c", "label": "8"}, {"id": "d", "label": "28"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a multiple of 4?$tl$, $tl$[{"id": "a", "label": "33"}, {"id": "b", "label": "33"}, {"id": "c", "label": "32"}, {"id": "d", "label": "30"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a factor of 20?$tl$, $tl$[{"id": "a", "label": "18"}, {"id": "b", "label": "7"}, {"id": "c", "label": "13"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a multiple of 8?$tl$, $tl$[{"id": "a", "label": "58"}, {"id": "b", "label": "58"}, {"id": "c", "label": "54"}, {"id": "d", "label": "56"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a factor of 20?$tl$, $tl$[{"id": "a", "label": "9"}, {"id": "b", "label": "12"}, {"id": "c", "label": "5"}, {"id": "d", "label": "11"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a multiple of 4?$tl$, $tl$[{"id": "a", "label": "28"}, {"id": "b", "label": "26"}, {"id": "c", "label": "30"}, {"id": "d", "label": "29"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a factor of 24?$tl$, $tl$[{"id": "a", "label": "18"}, {"id": "b", "label": "19"}, {"id": "c", "label": "15"}, {"id": "d", "label": "3"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a multiple of 3?$tl$, $tl$[{"id": "a", "label": "22"}, {"id": "b", "label": "24"}, {"id": "c", "label": "22"}, {"id": "d", "label": "23"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a factor of 12?$tl$, $tl$[{"id": "a", "label": "4"}, {"id": "b", "label": "7"}, {"id": "c", "label": "11"}, {"id": "d", "label": "8"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which number is a multiple of 8?$tl$, $tl$[{"id": "a", "label": "57"}, {"id": "b", "label": "56"}, {"id": "c", "label": "54"}, {"id": "d", "label": "55"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$factors-and-multiples$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Equivalent Fractions (4.NF.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$equivalent-fractions$tl$, $tl$Equivalent Fractions$tl$, $tl$Two fractions are equivalent if they show the same amount. Multiply (or divide) the top and bottom by the same number to find one.$tl$, 4, $tl$4.NF.A.1$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Equivalent Fractions$tl$, 4, $tl$[{"type": "explain", "title": "About: Equivalent Fractions", "body": "Two fractions are equivalent if they show the same amount. Multiply (or divide) the top and bottom by the same number to find one."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which fraction is equivalent to 1/3?  The correct answer is \"2/6\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is equivalent to 1/3?", "choices": [{"id": "a", "label": "5/12"}, {"id": "b", "label": "4/12"}, {"id": "c", "label": "4/13"}, {"id": "d", "label": "2/4"}], "answer": "b", "explanation": "The correct answer is \"4/12\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Equivalent Fractions - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/3?$tl$, $tl$[{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/7"}, {"id": "c", "label": "2/6"}, {"id": "d", "label": "2/4"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/3?$tl$, $tl$[{"id": "a", "label": "5/12"}, {"id": "b", "label": "4/12"}, {"id": "c", "label": "4/13"}, {"id": "d", "label": "2/4"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/5?$tl$, $tl$[{"id": "a", "label": "3/10"}, {"id": "b", "label": "2/11"}, {"id": "c", "label": "2/10"}, {"id": "d", "label": "2/6"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 2/5?$tl$, $tl$[{"id": "a", "label": "9/20"}, {"id": "b", "label": "8/21"}, {"id": "c", "label": "3/6"}, {"id": "d", "label": "8/20"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/2?$tl$, $tl$[{"id": "a", "label": "5/8"}, {"id": "b", "label": "4/8"}, {"id": "c", "label": "4/9"}, {"id": "d", "label": "2/3"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/5?$tl$, $tl$[{"id": "a", "label": "3/15"}, {"id": "b", "label": "4/15"}, {"id": "c", "label": "3/16"}, {"id": "d", "label": "2/6"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/3?$tl$, $tl$[{"id": "a", "label": "4/9"}, {"id": "b", "label": "3/10"}, {"id": "c", "label": "3/9"}, {"id": "d", "label": "2/4"}]$tl$::jsonb, $tl$c$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/2?$tl$, $tl$[{"id": "a", "label": "3/4"}, {"id": "b", "label": "2/4"}, {"id": "c", "label": "2/5"}, {"id": "d", "label": "2/3"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 1/4?$tl$, $tl$[{"id": "a", "label": "3/8"}, {"id": "b", "label": "2/9"}, {"id": "c", "label": "2/8"}, {"id": "d", "label": "2/5"}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is equivalent to 3/4?$tl$, $tl$[{"id": "a", "label": "6/8"}, {"id": "b", "label": "7/8"}, {"id": "c", "label": "6/9"}, {"id": "d", "label": "4/5"}]$tl$::jsonb, $tl$a$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$equivalent-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Comparing Fractions (4.NF.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$comparing-fractions$tl$, $tl$Comparing Fractions$tl$, $tl$When two fractions have the same denominator, the one with the bigger numerator (top number) is greater.$tl$, 4, $tl$4.NF.A.2$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Fractions$tl$, 4, $tl$[{"type": "explain", "title": "About: Comparing Fractions", "body": "When two fractions have the same denominator, the one with the bigger numerator (top number) is greater."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which fraction is greater: 1/6 or 5/6?  The correct answer is \"5/6\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is greater: 2/6 or 3/6?", "choices": [{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}], "answer": "a", "explanation": "The correct answer is \"3/6\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Comparing Fractions - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 1/6 or 5/6?$tl$, $tl$[{"id": "a", "label": "1/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "6/6"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 2/6 or 3/6?$tl$, $tl$[{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 1/5 or 4/5?$tl$, $tl$[{"id": "a", "label": "1/5"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "4/5"}, {"id": "d", "label": "5/5"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 9/10 or 4/10?$tl$, $tl$[{"id": "a", "label": "9/10"}, {"id": "b", "label": "4/10"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "13/10"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 2/4 or 1/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "3/4"}, {"id": "d", "label": "2/4"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 4/6 or 2/6?$tl$, $tl$[{"id": "a", "label": "2/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "6/6"}, {"id": "d", "label": "4/6"}]$tl$::jsonb, $tl$d$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 1/4 or 3/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "4/4"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 3/6 or 5/6?$tl$, $tl$[{"id": "a", "label": "3/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "8/6"}]$tl$::jsonb, $tl$c$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 2/6 or 3/6?$tl$, $tl$[{"id": "a", "label": "2/6"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which fraction is greater: 1/4 or 2/4?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "2/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-fractions$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Adding & Subtracting Fractions (4.NF.B.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adding-fractions-like-denominators$tl$, $tl$Adding & Subtracting Fractions$tl$, $tl$When denominators are the same, just add or subtract the numerators and keep the denominator the same.$tl$, 4, $tl$4.NF.B.3$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adding & Subtracting Fractions$tl$, 4, $tl$[{"type": "explain", "title": "About: Adding & Subtracting Fractions", "body": "When denominators are the same, just add or subtract the numerators and keep the denominator the same."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add the fractions: 1/5 + 3/5 = ?  (Write as a fraction like 5/5)  The answer is 4/5."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Adding & Subtracting Fractions - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add the fractions: 1/5 + 3/5 = ?  (Write as a fraction like 5/5)$tl$, null, $tl$4/5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 6/8 - 5/8 = ?  (Write as a fraction like 2/8)$tl$, null, $tl$1/8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add the fractions: 1/6 + 1/6 = ?  (Write as a fraction like 5/6)$tl$, null, $tl$2/6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 5/12 - 2/12 = ?  (Write as a fraction like 2/12)$tl$, null, $tl$3/12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add the fractions: 3/10 + 5/10 = ?  (Write as a fraction like 5/10)$tl$, null, $tl$8/10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 4/5 - 1/5 = ?  (Write as a fraction like 2/5)$tl$, null, $tl$3/5$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add the fractions: 6/12 + 5/12 = ?  (Write as a fraction like 5/12)$tl$, null, $tl$11/12$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 8/10 - 6/10 = ?  (Write as a fraction like 2/10)$tl$, null, $tl$2/10$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Add the fractions: 10/12 + 1/12 = ?  (Write as a fraction like 5/12)$tl$, null, $tl$11/12$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Subtract: 9/12 - 3/12 = ?  (Write as a fraction like 2/12)$tl$, null, $tl$6/12$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-fractions-like-denominators$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Energy & Motion (4-PS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$energy$tl$, $tl$Energy & Motion$tl$, $tl$Energy is the ability to do work or cause change. Moving things have kinetic energy; stored-up energy (like a stretched spring) is potential energy.$tl$, 4, $tl$4-PS3-1$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Energy & Motion$tl$, 4, $tl$[{"type": "explain", "title": "About: Energy & Motion", "body": "Energy is the ability to do work or cause change. Moving things have kinetic energy; stored-up energy (like a stretched spring) is potential energy."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Energy that is moving, like a rolling ball, is called what?  The correct answer is \"kinetic energy\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A stretched rubber band ready to snap back is an example of what?", "choices": [{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "heat energy only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "stored (potential) energy"}], "answer": "d", "explanation": "The correct answer is \"stored (potential) energy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Energy & Motion - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Energy that is moving, like a rolling ball, is called what?$tl$, $tl$[{"id": "a", "label": "stored energy"}, {"id": "b", "label": "light only"}, {"id": "c", "label": "kinetic energy"}, {"id": "d", "label": "no energy"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A stretched rubber band ready to snap back is an example of what?$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "heat energy only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "stored (potential) energy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$When you rub your hands together quickly, the energy you feel is mostly:$tl$, $tl$[{"id": "a", "label": "light energy"}, {"id": "b", "label": "sound energy"}, {"id": "c", "label": "chemical energy"}, {"id": "d", "label": "heat (thermal) energy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A faster-moving object has MORE of which kind of energy?$tl$, $tl$[{"id": "a", "label": "less energy"}, {"id": "b", "label": "stored energy"}, {"id": "c", "label": "no energy"}, {"id": "d", "label": "kinetic energy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which of these gives off light and heat energy?$tl$, $tl$[{"id": "a", "label": "a rock"}, {"id": "b", "label": "the Sun"}, {"id": "c", "label": "a glass of water"}, {"id": "d", "label": "a wooden chair"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Plants store energy from sunlight in the form of:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "food (sugar)"}, {"id": "d", "label": "air"}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A battery stores which kind of energy?$tl$, $tl$[{"id": "a", "label": "sound energy"}, {"id": "b", "label": "chemical energy"}, {"id": "c", "label": "light energy"}, {"id": "d", "label": "wind energy"}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Energy from the movement of an object is called ____ energy. (one word)$tl$, null, $tl$kinetic$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$When a moving car hits a wall, its energy is transferred mostly into:$tl$, $tl$[{"id": "a", "label": "sound and heat"}, {"id": "b", "label": "new matter"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which activity uses electrical energy?$tl$, $tl$[{"id": "a", "label": "dropping a ball"}, {"id": "b", "label": "stretching a spring"}, {"id": "c", "label": "turning on a lamp"}, {"id": "d", "label": "throwing a rock"}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Waves: Light & Sound (4-PS4-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$waves-light-sound$tl$, $tl$Waves: Light & Sound$tl$, $tl$Sound is made by vibrations that travel as waves. We see things when light bounces off them and reaches our eyes.$tl$, 4, $tl$4-PS4-1$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Waves: Light & Sound$tl$, 4, $tl$[{"type": "explain", "title": "About: Waves: Light & Sound", "body": "Sound is made by vibrations that travel as waves. We see things when light bounces off them and reaches our eyes."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Sound is made when objects do what?  The correct answer is \"vibrate\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "We see most objects because light does what off of them?", "choices": [{"id": "a", "label": "disappears"}, {"id": "b", "label": "reflects (bounces)"}, {"id": "c", "label": "freezes"}, {"id": "d", "label": "melts"}], "answer": "b", "explanation": "The correct answer is \"reflects (bounces)\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Waves: Light & Sound - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Sound is made when objects do what?$tl$, $tl$[{"id": "a", "label": "freeze"}, {"id": "b", "label": "vibrate"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "glow"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$We see most objects because light does what off of them?$tl$, $tl$[{"id": "a", "label": "disappears"}, {"id": "b", "label": "reflects (bounces)"}, {"id": "c", "label": "freezes"}, {"id": "d", "label": "melts"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Sound travels as a kind of:$tl$, $tl$[{"id": "a", "label": "wave"}, {"id": "b", "label": "rock"}, {"id": "c", "label": "liquid"}, {"id": "d", "label": "gas only"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A louder sound is made by a vibration with a bigger:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "weight"}, {"id": "c", "label": "amplitude"}, {"id": "d", "label": "smell"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which travels faster?$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "light"}, {"id": "c", "label": "they never move"}, {"id": "d", "label": "neither moves"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$You cannot see in a completely dark room because there is no:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "air"}, {"id": "c", "label": "water"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$d$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A high-pitched sound comes from vibrations that are:$tl$, $tl$[{"id": "a", "label": "slow"}, {"id": "b", "label": "fast"}, {"id": "c", "label": "stopped"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Sound is made when an object ____ back and forth. (one word)$tl$, null, $tl$vibrates$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Patterns of light and sound can be used to:$tl$, $tl$[{"id": "a", "label": "send information (like a signal)"}, {"id": "b", "label": "create matter"}, {"id": "c", "label": "stop time"}, {"id": "d", "label": "make gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An echo happens when sound waves do what off a wall?$tl$, $tl$[{"id": "a", "label": "disappear"}, {"id": "b", "label": "speed up forever"}, {"id": "c", "label": "bounce back"}, {"id": "d", "label": "turn into light"}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves-light-sound$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Plant Structures & Functions (4-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plant-structures$tl$, $tl$Plant Structures & Functions$tl$, $tl$Plants have parts with special jobs: roots take in water, leaves make food from sunlight, stems carry water, and flowers make seeds.$tl$, 4, $tl$4-LS1-1$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plant Structures & Functions$tl$, 4, $tl$[{"type": "explain", "title": "About: Plant Structures & Functions", "body": "Plants have parts with special jobs: roots take in water, leaves make food from sunlight, stems carry water, and flowers make seeds."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which plant part takes in water from the soil?  The correct answer is \"roots\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which plant part makes food using sunlight?", "choices": [{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}], "answer": "b", "explanation": "The correct answer is \"leaves\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Plant Structures & Functions - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which plant part takes in water from the soil?$tl$, $tl$[{"id": "a", "label": "flower"}, {"id": "b", "label": "roots"}, {"id": "c", "label": "leaf"}, {"id": "d", "label": "fruit"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which plant part makes food using sunlight?$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which part of a plant usually makes seeds?$tl$, $tl$[{"id": "a", "label": "flower"}, {"id": "b", "label": "root"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "leaf"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$What carries water from the roots up to the leaves?$tl$, $tl$[{"id": "a", "label": "the petals"}, {"id": "b", "label": "the seeds"}, {"id": "c", "label": "the stem"}, {"id": "d", "label": "the fruit"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$The process plants use to make food from sunlight is called:$tl$, $tl$[{"id": "a", "label": "digestion"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "evaporation"}, {"id": "d", "label": "photosynthesis"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Why are brightly colored flowers helpful to a plant?$tl$, $tl$[{"id": "a", "label": "they attract pollinators like bees"}, {"id": "b", "label": "they scare away the Sun"}, {"id": "c", "label": "they make the plant cold"}, {"id": "d", "label": "they stop water"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Seeds help a plant to:$tl$, $tl$[{"id": "a", "label": "take in sunlight"}, {"id": "b", "label": "hold the plant down"}, {"id": "c", "label": "make flowers fall"}, {"id": "d", "label": "make new plants (reproduce)"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$The plant part that anchors it and absorbs water is the ____. (one word)$tl$, null, $tl$roots$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A fruit usually protects the plant's:$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}]$tl$::jsonb, $tl$d$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which do plants need to make their own food?$tl$, $tl$[{"id": "a", "label": "only soil"}, {"id": "b", "label": "sunlight, water, and air"}, {"id": "c", "label": "only darkness"}, {"id": "d", "label": "only rocks"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-structures$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Animal Structures & Senses (4-LS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$animal-structures-senses$tl$, $tl$Animal Structures & Senses$tl$, $tl$Animals have body parts and senses that help them survive - to find food, sense danger, move, and stay warm.$tl$, 4, $tl$4-LS1-2$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Animal Structures & Senses$tl$, 4, $tl$[{"type": "explain", "title": "About: Animal Structures & Senses", "body": "Animals have body parts and senses that help them survive \u2014 to find food, sense danger, move, and stay warm."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which body part do most animals use to sense light?  The correct answer is \"eyes\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "An animal uses its ears mainly to:", "choices": [{"id": "a", "label": "hear sounds"}, {"id": "b", "label": "taste food"}, {"id": "c", "label": "see color"}, {"id": "d", "label": "smell"}], "answer": "a", "explanation": "The correct answer is \"hear sounds\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Animal Structures & Senses - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which body part do most animals use to sense light?$tl$, $tl$[{"id": "a", "label": "eyes"}, {"id": "b", "label": "fins"}, {"id": "c", "label": "fur"}, {"id": "d", "label": "claws"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An animal uses its ears mainly to:$tl$, $tl$[{"id": "a", "label": "hear sounds"}, {"id": "b", "label": "taste food"}, {"id": "c", "label": "see color"}, {"id": "d", "label": "smell"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Sharp claws and teeth most help an animal to:$tl$, $tl$[{"id": "a", "label": "fly higher"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "catch and eat food"}, {"id": "d", "label": "see at night"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Thick fur or feathers most help an animal to:$tl$, $tl$[{"id": "a", "label": "run faster only"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "see better"}, {"id": "d", "label": "smell food"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which structure helps a fish move through water?$tl$, $tl$[{"id": "a", "label": "lungs"}, {"id": "b", "label": "fins"}, {"id": "c", "label": "wings"}, {"id": "d", "label": "hooves"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Animals use information from their senses to help them:$tl$, $tl$[{"id": "a", "label": "grow taller only"}, {"id": "b", "label": "change color of the sky"}, {"id": "c", "label": "stop breathing"}, {"id": "d", "label": "survive (find food, avoid danger)"}]$tl$::jsonb, $tl$d$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A bird's wings are mainly used for:$tl$, $tl$[{"id": "a", "label": "flying"}, {"id": "b", "label": "digging"}, {"id": "c", "label": "swimming deep"}, {"id": "d", "label": "hearing"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$The sense organ an animal uses to detect smells is its ____. (one word)$tl$, null, $tl$nose$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Camouflage helps an animal by letting it:$tl$, $tl$[{"id": "a", "label": "glow in the dark"}, {"id": "b", "label": "blend in and hide"}, {"id": "c", "label": "grow wings"}, {"id": "d", "label": "breathe water"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Long legs most help an animal to:$tl$, $tl$[{"id": "a", "label": "see color"}, {"id": "b", "label": "run or move quickly"}, {"id": "c", "label": "hear better"}, {"id": "d", "label": "taste food"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-structures-senses$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Earth's Features & Maps (4-ESS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$earths-features$tl$, $tl$Earth's Features & Maps$tl$, $tl$Earth has oceans, mountains, rivers, valleys, and deserts. Maps use symbols and a key to show where these features are.$tl$, 4, $tl$4-ESS2-2$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Earth's Features & Maps$tl$, 4, $tl$[{"type": "explain", "title": "About: Earth's Features & Maps", "body": "Earth has oceans, mountains, rivers, valleys, and deserts. Maps use symbols and a key to show where these features are."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A very large area of salt water on Earth is called an:  The correct answer is \"ocean\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A tall landform that rises high above the land around it is a:", "choices": [{"id": "a", "label": "mountain"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "river"}], "answer": "a", "explanation": "The correct answer is \"mountain\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Earth's Features & Maps - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A very large area of salt water on Earth is called an:$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "desert"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A tall landform that rises high above the land around it is a:$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Most of Earth's surface is covered by:$tl$, $tl$[{"id": "a", "label": "sand"}, {"id": "b", "label": "ice"}, {"id": "c", "label": "forests"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A map uses symbols and a key to show:$tl$, $tl$[{"id": "a", "label": "the future"}, {"id": "b", "label": "sounds"}, {"id": "c", "label": "smells"}, {"id": "d", "label": "places and features"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A low area of land between mountains is called a:$tl$, $tl$[{"id": "a", "label": "peak"}, {"id": "b", "label": "plateau"}, {"id": "c", "label": "valley"}, {"id": "d", "label": "cliff"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Fresh water that flows across land toward the sea is a:$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "dune"}, {"id": "c", "label": "crater"}, {"id": "d", "label": "glacier"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is the largest? $tl$, $tl$[{"id": "a", "label": "an ocean"}, {"id": "b", "label": "a pond"}, {"id": "c", "label": "a stream"}, {"id": "d", "label": "a puddle"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$A dry region that gets very little rain is called a ____. (one word)$tl$, null, $tl$desert$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Mountains are often found in long lines called:$tl$, $tl$[{"id": "a", "label": "lakes"}, {"id": "b", "label": "ranges"}, {"id": "c", "label": "bays"}, {"id": "d", "label": "islands"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A piece of land surrounded by water on all sides is an:$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "island"}, {"id": "d", "label": "desert"}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earths-features$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Weathering & Erosion (4-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$weathering-erosion$tl$, $tl$Weathering & Erosion$tl$, $tl$Weathering breaks rock into smaller pieces. Erosion is when wind or water carries those pieces away, slowly changing the land.$tl$, 4, $tl$4-ESS2-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Weathering & Erosion$tl$, 4, $tl$[{"type": "explain", "title": "About: Weathering & Erosion", "body": "Weathering breaks rock into smaller pieces. Erosion is when wind or water carries those pieces away, slowly changing the land."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Wind and water slowly breaking rock into smaller pieces is called:  The correct answer is \"weathering\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Moving water carrying away soil and sand is called:", "choices": [{"id": "a", "label": "erosion"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "reflection"}, {"id": "d", "label": "vibration"}], "answer": "a", "explanation": "The correct answer is \"erosion\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Weathering & Erosion - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Wind and water slowly breaking rock into smaller pieces is called:$tl$, $tl$[{"id": "a", "label": "melting"}, {"id": "b", "label": "freezing"}, {"id": "c", "label": "growing"}, {"id": "d", "label": "weathering"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Moving water carrying away soil and sand is called:$tl$, $tl$[{"id": "a", "label": "erosion"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "reflection"}, {"id": "d", "label": "vibration"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which can wear down a mountain over a very long time?$tl$, $tl$[{"id": "a", "label": "a single rainy day"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "wind and water"}, {"id": "d", "label": "moonlight"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Plant roots can break rocks apart as they:$tl$, $tl$[{"id": "a", "label": "shrink"}, {"id": "b", "label": "freeze the Sun"}, {"id": "c", "label": "grow"}, {"id": "d", "label": "reflect light"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$When a river drops the sand and soil it was carrying, this is called:$tl$, $tl$[{"id": "a", "label": "weathering"}, {"id": "b", "label": "deposition"}, {"id": "c", "label": "vibration"}, {"id": "d", "label": "photosynthesis"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which change happens very slowly, over many years?$tl$, $tl$[{"id": "a", "label": "a glass breaking"}, {"id": "b", "label": "a canyon being carved by a river"}, {"id": "c", "label": "a light turning on"}, {"id": "d", "label": "a door closing"}]$tl$::jsonb, $tl$b$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Ocean waves hitting a cliff cause the cliff to:$tl$, $tl$[{"id": "a", "label": "grow taller"}, {"id": "b", "label": "get colder"}, {"id": "c", "label": "wear away (erode)"}, {"id": "d", "label": "turn to metal"}]$tl$::jsonb, $tl$c$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$The breaking down of rock into smaller pieces is called ____. (one word)$tl$, null, $tl$weathering$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which helps SLOW down soil erosion on a hill?$tl$, $tl$[{"id": "a", "label": "removing all plants"}, {"id": "b", "label": "pouring more water"}, {"id": "c", "label": "adding loose sand"}, {"id": "d", "label": "planting grass and trees"}]$tl$::jsonb, $tl$d$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Sand at a beach was once mostly:$tl$, $tl$[{"id": "a", "label": "made by animals"}, {"id": "b", "label": "fallen from the sky"}, {"id": "c", "label": "larger rocks broken down over time"}, {"id": "d", "label": "grown from seeds"}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weathering-erosion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Fossils & Rock Layers (4-ESS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$fossils-rock-layers$tl$, $tl$Fossils & Rock Layers$tl$, $tl$Fossils are preserved traces of ancient living things, usually found in sedimentary rock. Lower rock layers are usually older.$tl$, 4, $tl$4-ESS1-1$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Fossils & Rock Layers$tl$, 4, $tl$[{"type": "explain", "title": "About: Fossils & Rock Layers", "body": "Fossils are preserved traces of ancient living things, usually found in sedimentary rock. Lower rock layers are usually older."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A fossil is the preserved remains or trace of a:  The correct answer is \"living thing from long ago\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Fossils are most often found in which kind of rock?", "choices": [{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "metal"}], "answer": "a", "explanation": "The correct answer is \"sedimentary rock\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Fossils & Rock Layers - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A fossil is the preserved remains or trace of a:$tl$, $tl$[{"id": "a", "label": "modern plastic toy"}, {"id": "b", "label": "fresh leaf"}, {"id": "c", "label": "living thing from long ago"}, {"id": "d", "label": "rain cloud"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Fossils are most often found in which kind of rock?$tl$, $tl$[{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "metal"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$In undisturbed rock layers, the OLDEST layer is usually:$tl$, $tl$[{"id": "a", "label": "at the top"}, {"id": "b", "label": "at the bottom"}, {"id": "c", "label": "in the middle"}, {"id": "d", "label": "floating above"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Fossils can tell us about:$tl$, $tl$[{"id": "a", "label": "tomorrow's weather"}, {"id": "b", "label": "living things and environments of the past"}, {"id": "c", "label": "the price of food"}, {"id": "d", "label": "what someone is thinking"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A dinosaur footprint turned to stone is an example of a:$tl$, $tl$[{"id": "a", "label": "trace fossil"}, {"id": "b", "label": "mineral crystal"}, {"id": "c", "label": "raindrop"}, {"id": "d", "label": "modern shoe"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Rock layers form over time as ____ piles up and hardens.$tl$, $tl$[{"id": "a", "label": "sediment"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "wind only"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$If a fossil of a fish is found in a desert, it suggests the area was once:$tl$, $tl$[{"id": "a", "label": "on the Moon"}, {"id": "b", "label": "always a desert"}, {"id": "c", "label": "made of metal"}, {"id": "d", "label": "underwater"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$The preserved remains of an ancient living thing is called a ____. (one word)$tl$, null, $tl$fossil$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Scientists who study fossils are called:$tl$, $tl$[{"id": "a", "label": "astronauts"}, {"id": "b", "label": "paleontologists"}, {"id": "c", "label": "chefs"}, {"id": "d", "label": "pilots"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Newer rock layers are usually found:$tl$, $tl$[{"id": "a", "label": "below older layers"}, {"id": "b", "label": "inside the Sun"}, {"id": "c", "label": "under the ocean only"}, {"id": "d", "label": "on top of older layers"}]$tl$::jsonb, $tl$d$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fossils-rock-layers$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Natural Resources & Conservation (4-ESS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$natural-resources$tl$, $tl$Natural Resources & Conservation$tl$, $tl$Natural resources come from Earth. Some are renewable (sunlight, wind) and some are not (coal, oil). Conserving them protects the planet.$tl$, 4, $tl$4-ESS3-1$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Natural Resources & Conservation$tl$, 4, $tl$[{"type": "explain", "title": "About: Natural Resources & Conservation", "body": "Natural resources come from Earth. Some are renewable (sunlight, wind) and some are not (coal, oil). Conserving them protects the planet."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which is a natural resource that comes from the Earth?  The correct answer is \"water\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which energy resource is renewable (it won't run out)?", "choices": [{"id": "a", "label": "sunlight"}, {"id": "b", "label": "coal"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}], "answer": "a", "explanation": "The correct answer is \"sunlight\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Natural Resources & Conservation - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is a natural resource that comes from the Earth?$tl$, $tl$[{"id": "a", "label": "a plastic toy"}, {"id": "b", "label": "a video game"}, {"id": "c", "label": "water"}, {"id": "d", "label": "a brick wall"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which energy resource is renewable (it won't run out)?$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "coal"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Coal and oil are called fossil fuels and are:$tl$, $tl$[{"id": "a", "label": "renewable"}, {"id": "b", "label": "made by factories"}, {"id": "c", "label": "unlimited"}, {"id": "d", "label": "nonrenewable"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Recycling helps us:$tl$, $tl$[{"id": "a", "label": "use up more oil"}, {"id": "b", "label": "use fewer new resources"}, {"id": "c", "label": "make more trash"}, {"id": "d", "label": "waste water"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is a way to conserve water?$tl$, $tl$[{"id": "a", "label": "leave the hose running"}, {"id": "b", "label": "take very long showers"}, {"id": "c", "label": "pour water on the road"}, {"id": "d", "label": "turn off the tap while brushing teeth"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Wind can be used to make electricity using a:$tl$, $tl$[{"id": "a", "label": "coal mine"}, {"id": "b", "label": "wind turbine"}, {"id": "c", "label": "oil well"}, {"id": "d", "label": "candle"}]$tl$::jsonb, $tl$b$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Trees are an important resource because they give us wood and:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "gasoline"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$A resource that can be replaced naturally, like sunlight or wind, is called ____. (one word)$tl$, null, $tl$renewable$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A natural event that can be dangerous to people, like a flood, is a natural:$tl$, $tl$[{"id": "a", "label": "hazard"}, {"id": "b", "label": "resource"}, {"id": "c", "label": "recycle"}, {"id": "d", "label": "fuel"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which choice reduces pollution?$tl$, $tl$[{"id": "a", "label": "burning more trash"}, {"id": "b", "label": "riding a bike instead of driving"}, {"id": "c", "label": "leaving lights on all day"}, {"id": "d", "label": "wasting paper"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-resources$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Electricity & Magnetism (4-PS3-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$electricity-magnetism$tl$, $tl$Electricity & Magnetism$tl$, $tl$Electricity flows through conductors like metal in a complete circuit. Magnets attract iron and have poles that attract or repel.$tl$, 4, $tl$4-PS3-2$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Electricity & Magnetism$tl$, 4, $tl$[{"type": "explain", "title": "About: Electricity & Magnetism", "body": "Electricity flows through conductors like metal in a complete circuit. Magnets attract iron and have poles that attract or repel."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Electricity flows easily through which material?  The correct answer is \"metal wire\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A material that does NOT let electricity flow easily is called an:", "choices": [{"id": "a", "label": "conductor"}, {"id": "b", "label": "insulator"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "battery"}], "answer": "b", "explanation": "The correct answer is \"insulator\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Electricity & Magnetism - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Electricity flows easily through which material?$tl$, $tl$[{"id": "a", "label": "rubber"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "metal wire"}, {"id": "d", "label": "wood"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A material that does NOT let electricity flow easily is called an:$tl$, $tl$[{"id": "a", "label": "conductor"}, {"id": "b", "label": "insulator"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "battery"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A magnet attracts objects made of:$tl$, $tl$[{"id": "a", "label": "plastic"}, {"id": "b", "label": "iron"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "paper"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Two magnets pushing apart are showing that like poles:$tl$, $tl$[{"id": "a", "label": "repel"}, {"id": "b", "label": "attract"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "disappear"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A complete path that lets electricity flow is called a:$tl$, $tl$[{"id": "a", "label": "magnet"}, {"id": "b", "label": "fossil"}, {"id": "c", "label": "wave"}, {"id": "d", "label": "circuit"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is a conductor of electricity?$tl$, $tl$[{"id": "a", "label": "copper"}, {"id": "b", "label": "wood"}, {"id": "c", "label": "rubber"}, {"id": "d", "label": "cloth"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$The opposite poles of two magnets will:$tl$, $tl$[{"id": "a", "label": "repel"}, {"id": "b", "label": "do nothing ever"}, {"id": "c", "label": "catch fire"}, {"id": "d", "label": "attract (pull together)"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$A complete loop that electricity travels around is called a ____. (one word)$tl$, null, $tl$circuit$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$If a bulb in a simple circuit won't light, a likely problem is:$tl$, $tl$[{"id": "a", "label": "too many magnets"}, {"id": "b", "label": "not enough sunlight"}, {"id": "c", "label": "a break in the circuit"}, {"id": "d", "label": "the room is quiet"}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A magnet's pull is strongest at its:$tl$, $tl$[{"id": "a", "label": "poles (ends)"}, {"id": "b", "label": "middle"}, {"id": "c", "label": "color"}, {"id": "d", "label": "weight"}]$tl$::jsonb, $tl$a$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$electricity-magnetism$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] The Water Cycle & Weather (4-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$water-cycle-weather$tl$, $tl$The Water Cycle & Weather$tl$, $tl$The Sun drives the water cycle: water evaporates, condenses into clouds, and falls as precipitation. Weather is the day-to-day state of the air.$tl$, 4, $tl$4-ESS2-1$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: The Water Cycle & Weather$tl$, 4, $tl$[{"type": "explain", "title": "About: The Water Cycle & Weather", "body": "The Sun drives the water cycle: water evaporates, condenses into clouds, and falls as precipitation. Weather is the day-to-day state of the air."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: When the Sun heats water and it turns into vapor, this is:  The correct answer is \"evaporation\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Water vapor cooling and forming clouds is called:", "choices": [{"id": "a", "label": "evaporation"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "condensation"}], "answer": "d", "explanation": "The correct answer is \"condensation\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$The Water Cycle & Weather - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$When the Sun heats water and it turns into vapor, this is:$tl$, $tl$[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "condensation"}, {"id": "c", "label": "precipitation"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Water vapor cooling and forming clouds is called:$tl$, $tl$[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "condensation"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Rain, snow, and hail are all forms of:$tl$, $tl$[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "reflection"}, {"id": "c", "label": "vibration"}, {"id": "d", "label": "precipitation"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Clouds are made of tiny drops of:$tl$, $tl$[{"id": "a", "label": "smoke"}, {"id": "b", "label": "dust only"}, {"id": "c", "label": "water"}, {"id": "d", "label": "sand"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$The day-to-day condition of the air (sunny, rainy) is called:$tl$, $tl$[{"id": "a", "label": "climate forever"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Most of the water that evaporates into the sky comes from the:$tl$, $tl$[{"id": "a", "label": "deserts"}, {"id": "b", "label": "oceans"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "fires"}]$tl$::jsonb, $tl$b$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which tool measures temperature?$tl$, $tl$[{"id": "a", "label": "thermometer"}, {"id": "b", "label": "ruler"}, {"id": "c", "label": "scale"}, {"id": "d", "label": "clock"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Water turning from a liquid into a gas is called ____. (one word)$tl$, null, $tl$evaporation$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$The water cycle is powered mainly by energy from the:$tl$, $tl$[{"id": "a", "label": "Moon"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "wind alone"}, {"id": "d", "label": "rivers"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Snow is most likely to fall when the air is:$tl$, $tl$[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "very dry only"}, {"id": "d", "label": "windy only"}]$tl$::jsonb, $tl$b$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-cycle-weather$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Finding the Main Idea (RI.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$main-idea$tl$, $tl$Finding the Main Idea$tl$, $tl$The main idea is what a passage is mostly about. Ask yourself: what is the one big point the author wants me to understand?$tl$, 4, $tl$RI.4.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Finding the Main Idea$tl$, 4, $tl$[{"type": "explain", "title": "About: Finding the Main Idea", "body": "The main idea is what a passage is mostly about. Ask yourself: what is the one big point the author wants me to understand?"}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Bees are very important. They move pollen from flower to flower, which helps plants make seeds and fruit. Without bees, many foods would be hard to grow.\" What is the main idea?  The correct answer is \"Bees are important because they help plants grow.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Maria practiced piano every day after school. At first the songs were hard, but slowly she got better. By spring, she could play her favorite song perfectly.\" What is the main idea?", "choices": [{"id": "a", "label": "Maria does not like music."}, {"id": "b", "label": "Spring is a season."}, {"id": "c", "label": "Piano songs are easy."}, {"id": "d", "label": "Practice helped Maria improve at piano."}], "answer": "d", "explanation": "The correct answer is \"Practice helped Maria improve at piano.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Finding the Main Idea - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Bees are very important. They move pollen from flower to flower, which helps plants make seeds and fruit. Without bees, many foods would be hard to grow." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Bees are important because they help plants grow."}, {"id": "b", "label": "Bees can sting people."}, {"id": "c", "label": "Flowers are colorful."}, {"id": "d", "label": "Fruit tastes sweet."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Maria practiced piano every day after school. At first the songs were hard, but slowly she got better. By spring, she could play her favorite song perfectly." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Maria does not like music."}, {"id": "b", "label": "Spring is a season."}, {"id": "c", "label": "Piano songs are easy."}, {"id": "d", "label": "Practice helped Maria improve at piano."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Penguins live where it is very cold. Their thick feathers and a layer of fat keep them warm. They huddle together to share heat." The passage is mostly about how penguins:$tl$, $tl$[{"id": "a", "label": "catch fish"}, {"id": "b", "label": "swim fast"}, {"id": "c", "label": "build nests"}, {"id": "d", "label": "stay warm in cold places"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Recycling helps the Earth. It saves trees, uses less energy, and keeps trash out of landfills." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Recycling is good for the Earth."}, {"id": "b", "label": "Trees are tall."}, {"id": "c", "label": "Trash smells bad."}, {"id": "d", "label": "Landfills are far away."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The school garden grew many vegetables. Students planted seeds, watered them, and pulled weeds. In the fall, they picked tomatoes and carrots." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Carrots are orange."}, {"id": "b", "label": "School starts early."}, {"id": "c", "label": "Weeds are tall."}, {"id": "d", "label": "Students grew vegetables in the school garden."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Sea turtles travel thousands of miles in the ocean. They return to the same beach where they were born to lay their eggs." The main idea is that sea turtles:$tl$, $tl$[{"id": "a", "label": "travel far and return to their home beach"}, {"id": "b", "label": "eat jellyfish"}, {"id": "c", "label": "are very old"}, {"id": "d", "label": "swim slowly"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Firefighters have a tough job. They put out fires, rescue people, and teach safety. They must be brave and strong." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Fire is hot."}, {"id": "b", "label": "Trucks are red."}, {"id": "c", "label": "Water puts out fire."}, {"id": "d", "label": "Firefighters do an important and difficult job."}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Thomas built a model volcano for science class. He mixed baking soda and vinegar, and it bubbled over like real lava." The passage is mainly about:$tl$, $tl$[{"id": "a", "label": "how to cook dinner"}, {"id": "b", "label": "a real volcano erupting"}, {"id": "c", "label": "a trip to the beach"}, {"id": "d", "label": "a science project Thomas made"}]$tl$::jsonb, $tl$d$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Libraries are wonderful places. You can borrow books, use computers, and join reading clubs, all for free." What is the main idea?$tl$, $tl$[{"id": "a", "label": "Books are heavy."}, {"id": "b", "label": "Libraries offer many free things to do."}, {"id": "c", "label": "Computers are new."}, {"id": "d", "label": "Reading is hard."}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "Brushing your teeth keeps them healthy. It removes food, fights cavities, and keeps your breath fresh." In one word, the passage is mostly about keeping your teeth ____. $tl$, null, $tl$healthy$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Supporting Details (RI.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$supporting-details$tl$, $tl$Supporting Details$tl$, $tl$Supporting details are the facts and examples that tell more about the main idea. They answer who, what, where, when, why, and how.$tl$, 4, $tl$RI.4.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Supporting Details$tl$, 4, $tl$[{"type": "explain", "title": "About: Supporting Details", "body": "Supporting details are the facts and examples that tell more about the main idea. They answer who, what, where, when, why, and how."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Dogs make great pets. They are loyal, they can be trained, and they love to play.\" Which is a detail that supports the main idea?  The correct answer is \"They can be trained.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Our trip to the zoo was fun. We saw lions, fed the goats, and watched the monkeys swing.\" Which detail tells something they did at the zoo?", "choices": [{"id": "a", "label": "The bus was yellow."}, {"id": "b", "label": "It rained yesterday."}, {"id": "c", "label": "Lunch was at noon."}, {"id": "d", "label": "We fed the goats."}], "answer": "d", "explanation": "The correct answer is \"We fed the goats.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Supporting Details - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Dogs make great pets. They are loyal, they can be trained, and they love to play." Which is a detail that supports the main idea?$tl$, $tl$[{"id": "a", "label": "Cats are quiet."}, {"id": "b", "label": "Fish swim in water."}, {"id": "c", "label": "They can be trained."}, {"id": "d", "label": "Birds can fly."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Our trip to the zoo was fun. We saw lions, fed the goats, and watched the monkeys swing." Which detail tells something they did at the zoo?$tl$, $tl$[{"id": "a", "label": "The bus was yellow."}, {"id": "b", "label": "It rained yesterday."}, {"id": "c", "label": "Lunch was at noon."}, {"id": "d", "label": "We fed the goats."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Winter can be dangerous. Roads get icy, the cold can hurt your skin, and storms can knock out power." Which detail supports that winter is dangerous?$tl$, $tl$[{"id": "a", "label": "Summer is warm."}, {"id": "b", "label": "Leaves are green."}, {"id": "c", "label": "Birds sing."}, {"id": "d", "label": "Roads get icy."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Plants need care to grow. They need water, sunlight, and good soil." Which is a supporting detail?$tl$, $tl$[{"id": "a", "label": "Rocks are hard."}, {"id": "b", "label": "The sky is blue."}, {"id": "c", "label": "They need sunlight."}, {"id": "d", "label": "Dogs bark."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The festival had lots to enjoy. There was music, tasty food, and games for kids." Which detail supports that there was a lot to enjoy?$tl$, $tl$[{"id": "a", "label": "It was Tuesday."}, {"id": "b", "label": "There were games for kids."}, {"id": "c", "label": "The town is small."}, {"id": "d", "label": "Cars were parked."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Exercise keeps you healthy. It makes your heart strong, builds muscles, and lifts your mood." A supporting detail is that exercise:$tl$, $tl$[{"id": "a", "label": "takes time"}, {"id": "b", "label": "is on TV"}, {"id": "c", "label": "makes your heart strong"}, {"id": "d", "label": "needs shoes"}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The old house looked spooky. The windows were broken, the door creaked, and vines covered the walls." Which detail shows the house looked spooky?$tl$, $tl$[{"id": "a", "label": "It was for sale."}, {"id": "b", "label": "The door creaked."}, {"id": "c", "label": "The yard was big."}, {"id": "d", "label": "The roof was flat."}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Reading is a great hobby. It teaches new words, takes you on adventures, and helps you relax." A supporting detail is that reading:$tl$, $tl$[{"id": "a", "label": "teaches new words"}, {"id": "b", "label": "costs money"}, {"id": "c", "label": "is loud"}, {"id": "d", "label": "needs a TV"}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Our teacher is kind. She helps us when we are stuck, listens to our ideas, and smiles a lot." Which detail supports that she is kind?$tl$, $tl$[{"id": "a", "label": "She drives a car."}, {"id": "b", "label": "She listens to our ideas."}, {"id": "c", "label": "School is big."}, {"id": "d", "label": "Math is hard."}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "The beach trip was busy. We built sandcastles, swam in the waves, and collected shells." Name one thing they did at the beach. (one word, e.g. swam)$tl$, null, $tl$swam$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$supporting-details$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Sequence of Events (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sequence$tl$, $tl$Sequence of Events$tl$, $tl$Sequence is the order things happen. Signal words like first, next, then, and last help you keep track of the order.$tl$, 4, $tl$RI.4.3$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sequence of Events$tl$, 4, $tl$[{"type": "explain", "title": "About: Sequence of Events", "body": "Sequence is the order things happen. Signal words like first, next, then, and last help you keep track of the order."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"First Sam woke up. Next he ate breakfast. Then he walked to school.\" What did Sam do FIRST?  The correct answer is \"He woke up.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"To make a sandwich, first get the bread. Then add the filling. Last, cut it in half.\" What do you do LAST?", "choices": [{"id": "a", "label": "Cut it in half."}, {"id": "b", "label": "Get the bread."}, {"id": "c", "label": "Add the filling."}, {"id": "d", "label": "Eat the crust."}], "answer": "a", "explanation": "The correct answer is \"Cut it in half.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Sequence of Events - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "First Sam woke up. Next he ate breakfast. Then he walked to school." What did Sam do FIRST?$tl$, $tl$[{"id": "a", "label": "He ate breakfast."}, {"id": "b", "label": "He walked to school."}, {"id": "c", "label": "He went to bed."}, {"id": "d", "label": "He woke up."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "To make a sandwich, first get the bread. Then add the filling. Last, cut it in half." What do you do LAST?$tl$, $tl$[{"id": "a", "label": "Cut it in half."}, {"id": "b", "label": "Get the bread."}, {"id": "c", "label": "Add the filling."}, {"id": "d", "label": "Eat the crust."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The seed sprouted. Then it grew leaves. Finally it bloomed into a flower." What happened SECOND?$tl$, $tl$[{"id": "a", "label": "It bloomed."}, {"id": "b", "label": "The seed sprouted."}, {"id": "c", "label": "It was picked."}, {"id": "d", "label": "It grew leaves."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Mia drew a picture, then colored it, and finally hung it on the wall." What did Mia do right AFTER drawing?$tl$, $tl$[{"id": "a", "label": "She colored it."}, {"id": "b", "label": "She hung it up."}, {"id": "c", "label": "She erased it."}, {"id": "d", "label": "She slept."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "First the clouds gathered. Next it began to rain. Then a rainbow appeared." What came BEFORE the rain?$tl$, $tl$[{"id": "a", "label": "The clouds gathered."}, {"id": "b", "label": "The rainbow."}, {"id": "c", "label": "The sun set."}, {"id": "d", "label": "The snow fell."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Leo packed his bag, ate lunch, and then left for the trip." What did Leo do BEFORE leaving?$tl$, $tl$[{"id": "a", "label": "He came home."}, {"id": "b", "label": "He unpacked."}, {"id": "c", "label": "He ate lunch."}, {"id": "d", "label": "He slept."}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "She mixed the batter, poured it in a pan, and baked the cake." What is the LAST step?$tl$, $tl$[{"id": "a", "label": "Mix the batter."}, {"id": "b", "label": "Bake the cake."}, {"id": "c", "label": "Pour the batter."}, {"id": "d", "label": "Buy flour."}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The alarm rang. Then Dad got up. After that, he made coffee." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "The alarm rang."}, {"id": "b", "label": "Dad made coffee."}, {"id": "c", "label": "Dad got up."}, {"id": "d", "label": "Dad left."}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "We bought tickets, found our seats, and watched the movie." What did we do right BEFORE watching the movie?$tl$, $tl$[{"id": "a", "label": "We bought popcorn."}, {"id": "b", "label": "We found our seats."}, {"id": "c", "label": "We went home."}, {"id": "d", "label": "We slept."}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "First you plant the seed, next you water it, then it grows." What do you do right after planting the seed? (one word)$tl$, null, $tl$water$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Cause & Effect (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$cause-and-effect$tl$, $tl$Cause & Effect$tl$, $tl$A cause is why something happens; the effect is what happens. Words like because and so often connect them.$tl$, 4, $tl$RI.4.3$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Cause & Effect$tl$, 4, $tl$[{"type": "explain", "title": "About: Cause & Effect", "body": "A cause is why something happens; the effect is what happens. Words like because and so often connect them."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Because it rained all day, the soccer game was canceled.\" What was the CAUSE?  The correct answer is \"It rained all day.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Tom forgot to water his plant, so it wilted.\" What was the EFFECT?", "choices": [{"id": "a", "label": "Tom watered it."}, {"id": "b", "label": "The plant grew."}, {"id": "c", "label": "Tom forgot."}, {"id": "d", "label": "The plant wilted."}], "answer": "d", "explanation": "The correct answer is \"The plant wilted.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Cause & Effect - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Because it rained all day, the soccer game was canceled." What was the CAUSE?$tl$, $tl$[{"id": "a", "label": "The game was canceled."}, {"id": "b", "label": "The team won."}, {"id": "c", "label": "It rained all day."}, {"id": "d", "label": "The sun came out."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Tom forgot to water his plant, so it wilted." What was the EFFECT?$tl$, $tl$[{"id": "a", "label": "Tom watered it."}, {"id": "b", "label": "The plant grew."}, {"id": "c", "label": "Tom forgot."}, {"id": "d", "label": "The plant wilted."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The ice melted because the day was very hot." Why did the ice melt?$tl$, $tl$[{"id": "a", "label": "The ice was blue."}, {"id": "b", "label": "It was winter."}, {"id": "c", "label": "The freezer broke for no reason."}, {"id": "d", "label": "The day was very hot."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "She studied hard, so she passed the test." What caused her to pass?$tl$, $tl$[{"id": "a", "label": "The test was easy."}, {"id": "b", "label": "She was late."}, {"id": "c", "label": "She slept in class."}, {"id": "d", "label": "She studied hard."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The dog barked loudly, so the baby woke up." What was the effect of the barking?$tl$, $tl$[{"id": "a", "label": "The dog slept."}, {"id": "b", "label": "The baby ate."}, {"id": "c", "label": "The dog ran."}, {"id": "d", "label": "The baby woke up."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Because the road was icy, the cars drove slowly." Why did the cars drive slowly?$tl$, $tl$[{"id": "a", "label": "The cars were red."}, {"id": "b", "label": "It was sunny."}, {"id": "c", "label": "The road was icy."}, {"id": "d", "label": "The road was new."}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "He left the milk out, so it spoiled." What was the cause of the milk spoiling?$tl$, $tl$[{"id": "a", "label": "The milk was cold."}, {"id": "b", "label": "The fridge was full."}, {"id": "c", "label": "He left the milk out."}, {"id": "d", "label": "He drank it."}]$tl$::jsonb, $tl$c$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The wind blew hard, so the kite flew high." What made the kite fly high?$tl$, $tl$[{"id": "a", "label": "The wind blew hard."}, {"id": "b", "label": "The kite was heavy."}, {"id": "c", "label": "It rained."}, {"id": "d", "label": "The string broke."}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Because the library was closed, we went to the park instead." What was the effect of the library being closed?$tl$, $tl$[{"id": "a", "label": "The library opened."}, {"id": "b", "label": "They went to the park."}, {"id": "c", "label": "They read books."}, {"id": "d", "label": "They stayed home all day."}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "The fire alarm rang, so everyone left the building." What was the cause that made everyone leave? Answer with the two words: the fire ____. $tl$, null, $tl$alarm$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Vocabulary in Context (RI.4.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$context-clues$tl$, $tl$Vocabulary in Context$tl$, $tl$When you meet a new word, use the other words around it - the context - as clues to figure out what it means.$tl$, 4, $tl$RI.4.4$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Vocabulary in Context$tl$, 4, $tl$[{"type": "explain", "title": "About: Vocabulary in Context", "body": "When you meet a new word, use the other words around it \u2014 the context \u2014 as clues to figure out what it means."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The path was so narrow that only one person could pass at a time.\" What does \"narrow\" mean?  The correct answer is \"not wide\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The soup was scalding, so she waited for it to cool.\" What does \"scalding\" mean?", "choices": [{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}], "answer": "a", "explanation": "The correct answer is \"very hot\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Vocabulary in Context - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The path was so narrow that only one person could pass at a time." What does "narrow" mean?$tl$, $tl$[{"id": "a", "label": "not wide"}, {"id": "b", "label": "very tall"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The soup was scalding, so she waited for it to cool." What does "scalding" mean?$tl$, $tl$[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "He was exhausted after the long run and fell asleep right away." What does "exhausted" mean?$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "hungry"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "very tired"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The ancient ruins were thousands of years old." What does "ancient" mean?$tl$, $tl$[{"id": "a", "label": "brand new"}, {"id": "b", "label": "colorful"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "very old"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The puppy was timid and hid behind the couch when strangers came." What does "timid" mean?$tl$, $tl$[{"id": "a", "label": "loud"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "shy or fearful"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "She spoke in a faint whisper that was hard to hear." What does "faint" mean here?$tl$, $tl$[{"id": "a", "label": "weak or soft"}, {"id": "b", "label": "very loud"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "sweet"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The enormous elephant was the biggest animal at the zoo." What does "enormous" mean?$tl$, $tl$[{"id": "a", "label": "very small"}, {"id": "b", "label": "very fast"}, {"id": "c", "label": "very quiet"}, {"id": "d", "label": "very large"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "After the drought, the dry land had no water for months." What does "drought" mean?$tl$, $tl$[{"id": "a", "label": "a long time with no rain"}, {"id": "b", "label": "a big flood"}, {"id": "c", "label": "a snowstorm"}, {"id": "d", "label": "a forest"}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "He was generous and shared his lunch with everyone." What does "generous" mean?$tl$, $tl$[{"id": "a", "label": "selfish"}, {"id": "b", "label": "willing to give and share"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "mean"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "The room was vacant; nobody was inside." What does "vacant" mean? (one word, starts with e)$tl$, null, $tl$empty$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Making Inferences (RI.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$making-inferences$tl$, $tl$Making Inferences$tl$, $tl$An inference is a smart guess based on clues in the text plus what you already know. The text hints, and you figure out the rest.$tl$, 4, $tl$RI.4.1$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Making Inferences$tl$, 4, $tl$[{"type": "explain", "title": "About: Making Inferences", "body": "An inference is a smart guess based on clues in the text plus what you already know. The text hints, and you figure out the rest."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Maya grabbed her umbrella and rain boots before heading out.\" What can you infer?  The correct answer is \"It is probably raining or going to rain.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Jake's stomach growled and he kept looking at the clock near lunchtime.\" What can you infer?", "choices": [{"id": "a", "label": "Jake is sleepy."}, {"id": "b", "label": "Jake is hungry."}, {"id": "c", "label": "Jake is cold."}, {"id": "d", "label": "Jake is angry."}], "answer": "b", "explanation": "The correct answer is \"Jake is hungry.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Making Inferences - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Maya grabbed her umbrella and rain boots before heading out." What can you infer?$tl$, $tl$[{"id": "a", "label": "It is sunny."}, {"id": "b", "label": "It is probably raining or going to rain."}, {"id": "c", "label": "She is going swimming."}, {"id": "d", "label": "It is nighttime."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Jake's stomach growled and he kept looking at the clock near lunchtime." What can you infer?$tl$, $tl$[{"id": "a", "label": "Jake is sleepy."}, {"id": "b", "label": "Jake is hungry."}, {"id": "c", "label": "Jake is cold."}, {"id": "d", "label": "Jake is angry."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The streets were empty and all the shops had their lights off." What can you infer?$tl$, $tl$[{"id": "a", "label": "It is a busy afternoon."}, {"id": "b", "label": "There is a parade."}, {"id": "c", "label": "It is very early or very late."}, {"id": "d", "label": "It is lunchtime."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Tia smiled wide and hugged the trophy to her chest." What can you infer?$tl$, $tl$[{"id": "a", "label": "Tia is sad."}, {"id": "b", "label": "Tia is happy that she won."}, {"id": "c", "label": "Tia is bored."}, {"id": "d", "label": "Tia is afraid."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The leaves were turning red and orange, and kids wore jackets to school." What season is it?$tl$, $tl$[{"id": "a", "label": "Fall (autumn)"}, {"id": "b", "label": "Summer"}, {"id": "c", "label": "A hot day"}, {"id": "d", "label": "Spring planting"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Ben tiptoed and whispered as he passed the baby's room." What can you infer?$tl$, $tl$[{"id": "a", "label": "The baby is playing."}, {"id": "b", "label": "Ben is loud."}, {"id": "c", "label": "The baby is sleeping."}, {"id": "d", "label": "It is a party."}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The dog wagged its tail and ran to the door when it heard the car." What can you infer?$tl$, $tl$[{"id": "a", "label": "The dog is excited someone is home."}, {"id": "b", "label": "The dog is scared."}, {"id": "c", "label": "The dog is asleep."}, {"id": "d", "label": "The dog is sick."}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Sweat dripped down as the team gulped water during a break." What can you infer?$tl$, $tl$[{"id": "a", "label": "It is hot and they have been active."}, {"id": "b", "label": "It is snowing."}, {"id": "c", "label": "They are sleeping."}, {"id": "d", "label": "They are reading."}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Grandma set out an extra plate and watched the clock by the window." What can you infer?$tl$, $tl$[{"id": "a", "label": "She is leaving forever."}, {"id": "b", "label": "She is expecting a guest."}, {"id": "c", "label": "She broke a plate."}, {"id": "d", "label": "She is at school."}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Read: "He put on a coat, hat, and gloves before going outside." Based on the clues, the weather is most likely ____. (one word)$tl$, null, $tl$cold$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Author's Purpose (RI.4.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$authors-purpose$tl$, $tl$Author's Purpose$tl$, $tl$Authors write to persuade, inform, instruct, or entertain. Ask why the author wrote this to find the purpose.$tl$, 4, $tl$RI.4.8$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Author's Purpose$tl$, 4, $tl$[{"type": "explain", "title": "About: Author's Purpose", "body": "Authors write to persuade, inform, instruct, or entertain. Ask why the author wrote this to find the purpose."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: An author writes \"10 Steps to Build a Birdhouse.\" The author's purpose is mainly to:  The correct answer is \"instruct (teach how to do something)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A funny story about a talking dog is written mainly to:", "choices": [{"id": "a", "label": "entertain"}, {"id": "b", "label": "instruct"}, {"id": "c", "label": "sell a product"}, {"id": "d", "label": "report news"}], "answer": "a", "explanation": "The correct answer is \"entertain\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Author's Purpose - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An author writes "10 Steps to Build a Birdhouse." The author's purpose is mainly to:$tl$, $tl$[{"id": "a", "label": "entertain with a story"}, {"id": "b", "label": "persuade you to vote"}, {"id": "c", "label": "tell a joke"}, {"id": "d", "label": "instruct (teach how to do something)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A funny story about a talking dog is written mainly to:$tl$, $tl$[{"id": "a", "label": "entertain"}, {"id": "b", "label": "instruct"}, {"id": "c", "label": "sell a product"}, {"id": "d", "label": "report news"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An article titled "Why Our Town Needs a New Park" is written mainly to:$tl$, $tl$[{"id": "a", "label": "entertain"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "give a recipe"}, {"id": "d", "label": "tell a fairy tale"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A page in a science book explaining how rain forms is written mainly to:$tl$, $tl$[{"id": "a", "label": "scare the reader"}, {"id": "b", "label": "sell toys"}, {"id": "c", "label": "make you laugh"}, {"id": "d", "label": "inform"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A poster that says "Eat more vegetables for a healthy body!" is meant to:$tl$, $tl$[{"id": "a", "label": "report sports scores"}, {"id": "b", "label": "tell a mystery"}, {"id": "c", "label": "persuade"}, {"id": "d", "label": "teach math"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A cookbook recipe is written mainly to:$tl$, $tl$[{"id": "a", "label": "instruct"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "persuade"}, {"id": "d", "label": "tell news"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A made-up adventure about pirates searching for treasure is written to:$tl$, $tl$[{"id": "a", "label": "entertain"}, {"id": "b", "label": "inform"}, {"id": "c", "label": "instruct"}, {"id": "d", "label": "persuade"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A weather report telling tomorrow's temperatures is meant to:$tl$, $tl$[{"id": "a", "label": "entertain"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "inform"}, {"id": "d", "label": "tell a story"}]$tl$::jsonb, $tl$c$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An ad that says "Buy our shoes - they're the best!" is written to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "inform only"}, {"id": "c", "label": "teach a lesson"}, {"id": "d", "label": "tell a joke"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$If an author writes mainly to teach you facts, their purpose is to ____. (one word, starts with i)$tl$, null, $tl$inform$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-purpose$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Compare & Contrast (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-and-contrast$tl$, $tl$Compare & Contrast$tl$, $tl$Comparing tells how things are alike; contrasting tells how they are different. Words like both signal alike; but and unlike signal different.$tl$, 4, $tl$RI.4.3$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Compare & Contrast$tl$, 4, $tl$[{"type": "explain", "title": "About: Compare & Contrast", "body": "Comparing tells how things are alike; contrasting tells how they are different. Words like both signal alike; but and unlike signal different."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Cats and dogs are both popular pets, but cats are usually quieter and dogs like to play fetch.\" One way they are the SAME is:  The correct answer is \"both are popular pets\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"A bicycle has two wheels, while a car has four.\" This sentence shows a:", "choices": [{"id": "a", "label": "similarity"}, {"id": "b", "label": "cause"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "sequence"}], "answer": "c", "explanation": "The correct answer is \"difference\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Compare & Contrast - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Cats and dogs are both popular pets, but cats are usually quieter and dogs like to play fetch." One way they are the SAME is:$tl$, $tl$[{"id": "a", "label": "both are popular pets"}, {"id": "b", "label": "both play fetch"}, {"id": "c", "label": "both are quiet"}, {"id": "d", "label": "both bark"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "A bicycle has two wheels, while a car has four." This sentence shows a:$tl$, $tl$[{"id": "a", "label": "similarity"}, {"id": "b", "label": "cause"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "sequence"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Both apples and oranges are fruits that grow on trees." The word that signals they are alike is:$tl$, $tl$[{"id": "a", "label": "both"}, {"id": "b", "label": "but"}, {"id": "c", "label": "while"}, {"id": "d", "label": "unlike"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Summer is hot, but winter is cold." This compares the two seasons by their:$tl$, $tl$[{"id": "a", "label": "temperature"}, {"id": "b", "label": "color"}, {"id": "c", "label": "size"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Unlike a frog, a fish cannot live out of water." The word "unlike" signals a:$tl$, $tl$[{"id": "a", "label": "difference"}, {"id": "b", "label": "similarity"}, {"id": "c", "label": "sequence"}, {"id": "d", "label": "cause"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "A pencil and a pen are both used for writing, but a pencil can be erased." How are they DIFFERENT?$tl$, $tl$[{"id": "a", "label": "a pencil can be erased"}, {"id": "b", "label": "both write"}, {"id": "c", "label": "both are tools"}, {"id": "d", "label": "both are long"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "Birds and bats can both fly, but birds have feathers and bats have fur." A similarity is that both:$tl$, $tl$[{"id": "a", "label": "can fly"}, {"id": "b", "label": "have feathers"}, {"id": "c", "label": "have fur"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Read: "The city is busy and loud, while the countryside is calm and quiet." This contrasts the two places by their:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "noise level"}, {"id": "c", "label": "spelling"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word best signals a contrast (difference)?$tl$, $tl$[{"id": "a", "label": "also"}, {"id": "b", "label": "both"}, {"id": "c", "label": "similarly"}, {"id": "d", "label": "however"}]$tl$::jsonb, $tl$d$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$The word "both" usually signals that two things are ____ (alike or different?). $tl$, null, $tl$alike$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Fact vs. Opinion (RI.4.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$fact-and-opinion$tl$, $tl$Fact vs. Opinion$tl$, $tl$A fact can be proven true. An opinion tells what someone feels or believes and can't be proven. Words like best or favorite often signal opinions.$tl$, 4, $tl$RI.4.8$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Fact vs. Opinion$tl$, 4, $tl$[{"type": "explain", "title": "About: Fact vs. Opinion", "body": "A fact can be proven true. An opinion tells what someone feels or believes and can't be proven. Words like best or favorite often signal opinions."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence is a FACT?  The correct answer is \"Water freezes at 0 degrees Celsius.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence is an OPINION?", "choices": [{"id": "a", "label": "Recess is the most fun part of the day."}, {"id": "b", "label": "A week has seven days."}, {"id": "c", "label": "The Sun is a star."}, {"id": "d", "label": "Spiders have eight legs."}], "answer": "a", "explanation": "The correct answer is \"Recess is the most fun part of the day.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Fact vs. Opinion - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence is a FACT?$tl$, $tl$[{"id": "a", "label": "Water freezes at 0 degrees Celsius."}, {"id": "b", "label": "Winter is the best season."}, {"id": "c", "label": "Pizza tastes amazing."}, {"id": "d", "label": "Blue is the prettiest color."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence is an OPINION?$tl$, $tl$[{"id": "a", "label": "Recess is the most fun part of the day."}, {"id": "b", "label": "A week has seven days."}, {"id": "c", "label": "The Sun is a star."}, {"id": "d", "label": "Spiders have eight legs."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Math is boring."}, {"id": "b", "label": "Dogs are better than cats."}, {"id": "c", "label": "A triangle has three sides."}, {"id": "d", "label": "Summer is too hot."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Chocolate ice cream is the best flavor."}, {"id": "b", "label": "Ice melts when heated."}, {"id": "c", "label": "There are 12 months in a year."}, {"id": "d", "label": "Plants need sunlight."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$"Our school has 400 students." This statement is a:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "question"}, {"id": "d", "label": "story"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$"Reading is more fun than watching TV." This statement is an:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "math problem"}, {"id": "c", "label": "opinion"}, {"id": "d", "label": "rule"}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which can be checked to see if it is true (a fact)?$tl$, $tl$[{"id": "a", "label": "Mondays are terrible."}, {"id": "b", "label": "The library opens at 9 a.m."}, {"id": "c", "label": "This book is the best ever."}, {"id": "d", "label": "Green is a happy color."}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word often signals an opinion?$tl$, $tl$[{"id": "a", "label": "measured"}, {"id": "b", "label": "best"}, {"id": "c", "label": "equals"}, {"id": "d", "label": "contains"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Elephants are cute."}, {"id": "b", "label": "Zoos are boring."}, {"id": "c", "label": "Elephants are the largest land animals."}, {"id": "d", "label": "Lions are scary."}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$A statement that tells what someone feels or believes, and can't be proven true, is called an ____. (one word)$tl$, null, $tl$opinion$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Synonyms & Antonyms (L.4.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$synonyms-and-antonyms$tl$, $tl$Synonyms & Antonyms$tl$, $tl$Synonyms are words that mean almost the same thing. Antonyms are words that mean the opposite.$tl$, 4, $tl$L.4.5$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Synonyms & Antonyms$tl$, 4, $tl$[{"type": "explain", "title": "About: Synonyms & Antonyms", "body": "Synonyms are words that mean almost the same thing. Antonyms are words that mean the opposite."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a SYNONYM (same meaning) for \"happy\"?  The correct answer is \"glad\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an ANTONYM (opposite) of \"big\"?", "choices": [{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "small"}, {"id": "d", "label": "giant"}], "answer": "c", "explanation": "The correct answer is \"small\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Synonyms & Antonyms - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a SYNONYM (same meaning) for "happy"?$tl$, $tl$[{"id": "a", "label": "glad"}, {"id": "b", "label": "sad"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "tired"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an ANTONYM (opposite) of "big"?$tl$, $tl$[{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "small"}, {"id": "d", "label": "giant"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word means almost the same as "fast"?$tl$, $tl$[{"id": "a", "label": "slow"}, {"id": "b", "label": "quick"}, {"id": "c", "label": "late"}, {"id": "d", "label": "still"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is the opposite of "hot"?$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "cold"}, {"id": "c", "label": "boiling"}, {"id": "d", "label": "sunny"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A synonym for "begin" is:$tl$, $tl$[{"id": "a", "label": "stop"}, {"id": "b", "label": "end"}, {"id": "c", "label": "finish"}, {"id": "d", "label": "start"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$An antonym for "empty" is:$tl$, $tl$[{"id": "a", "label": "bare"}, {"id": "b", "label": "hollow"}, {"id": "c", "label": "vacant"}, {"id": "d", "label": "full"}]$tl$::jsonb, $tl$d$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word means the same as "smart"?$tl$, $tl$[{"id": "a", "label": "silly"}, {"id": "b", "label": "clever"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$The opposite of "day" is:$tl$, $tl$[{"id": "a", "label": "night"}, {"id": "b", "label": "noon"}, {"id": "c", "label": "morning"}, {"id": "d", "label": "sunrise"}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$A synonym for "tired" is:$tl$, $tl$[{"id": "a", "label": "sleepy"}, {"id": "b", "label": "awake"}, {"id": "c", "label": "alert"}, {"id": "d", "label": "lively"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write a one-word ANTONYM (opposite) of "up". $tl$, null, $tl$down$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Nouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea. Common nouns are general (city); proper nouns name a specific one (Paris).$tl$, 4, $tl$L.4.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 4, $tl$[{"type": "explain", "title": "About: Nouns", "body": "A noun names a person, place, thing, or idea. Common nouns are general (city); proper nouns name a specific one (Paris)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a noun (a person, place, or thing)?  The correct answer is \"river\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "narrow"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "pencil"}], "answer": "d", "explanation": "The correct answer is \"pencil\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Nouns - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "farmer"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "window"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$c$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "march"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$d$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Action Verbs (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action or a state of being. Action verbs tell what the subject does, like run, jump, or think.$tl$, 4, $tl$L.4.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 4, $tl$[{"type": "explain", "title": "About: Action Verbs", "body": "A verb shows action or a state of being. Action verbs tell what the subject does, like run, jump, or think."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an action verb (something you can do)?  The correct answer is \"build\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "river"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "explore"}], "answer": "d", "explanation": "The correct answer is \"explore\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Action Verbs - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "build"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "library"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$b$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "march"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$c$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "river"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "island"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$d$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Adjectives (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun - telling what kind, how many, or which one, like shiny, three, or that.$tl$, 4, $tl$L.4.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 4, $tl$[{"type": "explain", "title": "About: Adjectives", "body": "An adjective describes a noun \u2014 telling what kind, how many, or which one, like shiny, three, or that."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an adjective (it describes a noun)?  The correct answer is \"slippery\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "ancient"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "paint"}], "answer": "a", "explanation": "The correct answer is \"ancient\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Adjectives - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "build"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "build"}, {"id": "c", "label": "island"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "march"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "march"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$c$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$a$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$d$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Pronouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun so we don't repeat it, like he, she, it, we, or they.$tl$, 4, $tl$L.4.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 4, $tl$[{"type": "explain", "title": "About: Pronouns", "body": "A pronoun takes the place of a noun so we don't repeat it, like he, she, it, we, or they."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a pronoun (it takes the place of a noun)?  The correct answer is \"I\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "wander"}], "answer": "c", "explanation": "The correct answer is \"her\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Pronouns - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "us"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "we"}, {"id": "b", "label": "library"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "you"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "it"}, {"id": "b", "label": "march"}, {"id": "c", "label": "build"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "him"}, {"id": "c", "label": "library"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "she"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$b$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Subject-Verb Agreement (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must match the subject. A singular subject usually takes a verb ending in -s (The dog runs); a plural subject does not (The dogs run).$tl$, 4, $tl$L.4.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 4, $tl$[{"type": "explain", "title": "About: Subject-Verb Agreement", "body": "The verb must match the subject. A singular subject usually takes a verb ending in -s (The dog runs); a plural subject does not (The dogs run)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Choose the correct verb: \"The bird ____ every day.\"  The correct answer is \"sings\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The teacher ____ every day.\"", "choices": [{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}], "answer": "a", "explanation": "The correct answer is \"writes\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Subject-Verb Agreement - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sings"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flowsed"}, {"id": "c", "label": "flows"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticks"}, {"id": "c", "label": "ticksed"}, {"id": "d", "label": "ticksing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "play"}, {"id": "b", "label": "playsed"}, {"id": "c", "label": "playsing"}, {"id": "d", "label": "plays"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barksing"}, {"id": "d", "label": "barks"}]$tl$::jsonb, $tl$d$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "grows"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$b$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "cries"}, {"id": "b", "label": "crie"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$a$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Past-Tense Verbs (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs tell about something that already happened. Many add -ed, but some are irregular (go becomes went).$tl$, 4, $tl$L.4.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 4, $tl$[{"type": "explain", "title": "About: Past-Tense Verbs", "body": "Past-tense verbs tell about something that already happened. Many add -ed, but some are irregular (go becomes went)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the past tense of the verb \"make\"?  The answer is made."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Past-Tense Verbs - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "ride"?$tl$, null, $tl$rode$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Plural Nouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals mean more than one. Add -s or -es, change y to -ies after a consonant, and change some f endings to -ves.$tl$, 4, $tl$L.4.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 4, $tl$[{"type": "explain", "title": "About: Plural Nouns", "body": "Plurals mean more than one. Add -s or -es, change y to -ies after a consonant, and change some f endings to -ves."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Write the plural of \"story\".  The answer is stories."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Plural Nouns - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "wolf".$tl$, null, $tl$wolves$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "city".$tl$, null, $tl$cities$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Capitalization (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization-proper-nouns$tl$, $tl$Capitalization$tl$, $tl$Capitalize the first word of a sentence, the word I, and proper nouns like names of people, places, days, and months.$tl$, 4, $tl$L.4.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 4, $tl$[{"type": "explain", "title": "About: Capitalization", "body": "Capitalize the first word of a sentence, the word I, and proper nouns like names of people, places, days, and months."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word or phrase is a proper noun that must be capitalized?  The correct answer is \"Africa\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "country"}, {"id": "b", "label": "India"}, {"id": "c", "label": "day"}, {"id": "d", "label": "ocean"}], "answer": "b", "explanation": "The correct answer is \"India\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Capitalization - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Africa"}, {"id": "b", "label": "river"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "India"}, {"id": "c", "label": "day"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "day"}, {"id": "c", "label": "country"}, {"id": "d", "label": "London"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Pacific Ocean"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "city"}, {"id": "d", "label": "New York"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Monday"}, {"id": "b", "label": "country"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Amazon River"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "country"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "city"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "December"}]$tl$::jsonb, $tl$d$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Tuesday"}]$tl$::jsonb, $tl$d$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "Mount Everest"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization-proper-nouns$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] End Punctuation (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End a telling sentence with a period, a question with a question mark, and an excited or strong sentence with an exclamation point.$tl$, 4, $tl$L.4.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 4, $tl$[{"type": "explain", "title": "About: End Punctuation", "body": "End a telling sentence with a period, a question with a question mark, and an excited or strong sentence with an exclamation point."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which end mark best completes the sentence?  \"What time is it___\"  The correct answer is \"?\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"That is amazing___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}], "answer": "d", "explanation": "The correct answer is \"!\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$End Punctuation - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Commas in a Series (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$When you list three or more things, separate them with commas and put 'and' before the last item: apples, oranges, and pears.$tl$, 4, $tl$L.4.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 4, $tl$[{"type": "explain", "title": "About: Commas in a Series", "body": "When you list three or more things, separate them with commas and put 'and' before the last item: apples, oranges, and pears."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence uses commas correctly in a list?  The correct answer is \"I like milk, eggs, and bread.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}], "answer": "d", "explanation": "The correct answer is \"I like pencils, pens, and markers.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Commas in a Series - Practice$tl$, 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs and bread"}, {"id": "c", "label": "I like milk, eggs, and bread."}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like, Mom Dad Grandma."}, {"id": "d", "label": "I like Mom, Dad, and Grandma."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like, apples oranges pears."}, {"id": "d", "label": "I like apples, oranges, and pears."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring, summer, and fall."}, {"id": "b", "label": "I like spring summer and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like cats, dogs, and fish."}, {"id": "d", "label": "I like, cats dogs fish."}]$tl$::jsonb, $tl$c$tl$, 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump and swim"}, {"id": "c", "label": "I like, run jump swim."}, {"id": "d", "label": "I like run, jump, and swim."}]$tl$::jsonb, $tl$d$tl$, 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like, red green blue."}, {"id": "d", "label": "I like red, green, and blue."}]$tl$::jsonb, $tl$d$tl$, 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes and buses"}, {"id": "c", "label": "I like, trains planes buses."}, {"id": "d", "label": "I like trains, planes, and buses."}]$tl$::jsonb, $tl$d$tl$, 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis and golf"}, {"id": "c", "label": "I like soccer, tennis, and golf."}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$c$tl$, 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

