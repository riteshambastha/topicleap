-- =====================================================================
-- TopicLeap - Grade 4 full curriculum seed (generated)
-- 4 subjects x 10 topics, each with a lesson + 10-question worksheet.
-- Idempotent & non-destructive: re-running never duplicates and never
-- touches a topic that already has content.
-- Run AFTER 0001_init.sql, in the Supabase SQL Editor.
-- =====================================================================

insert into public.subjects (slug, name, sort_order) values ('math', 'Math', 0)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ('science', 'Science', 1)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ('reading', 'Reading Comprehension', 2)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

insert into public.subjects (slug, name, sort_order) values ('writing', 'Writing', 3)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

-- ---- [math] Place Value to Hundred Thousands (4.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'place-value-to-hundred-thousands', 'Place Value to Hundred Thousands', 'Each digit in a number has a value based on its place: ones, tens, hundreds, thousands, and beyond. The same digit is worth more the farther left it sits.', 4, '4.NBT.A.2', 1
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Place Value to Hundred Thousands', 4, '[{"type": "explain", "title": "About: Place Value to Hundred Thousands", "body": "Each digit in a number has a value based on its place: ones, tens, hundreds, thousands, and beyond. The same digit is worth more the farther left it sits."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the value of the digit 7 in 452,871? (Write just the number, e.g. 4000)\n\nThe answer is 70."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Place Value to Hundred Thousands - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 7 in 452,871? (Write just the number, e.g. 4000)', null, '70', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 4 in 441,153? (Write just the number, e.g. 4000)', null, '400000', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 5 in 25,535? (Write just the number, e.g. 4000)', null, '5', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 3 in 818,153? (Write just the number, e.g. 4000)', null, '3', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 7 in 723,488? (Write just the number, e.g. 4000)', null, '700000', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 4 in 537,436? (Write just the number, e.g. 4000)', null, '400', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 6 in 663,549? (Write just the number, e.g. 4000)', null, '60000', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 7 in 979,779? (Write just the number, e.g. 4000)', null, '70000', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 4 in 752,425? (Write just the number, e.g. 4000)', null, '400', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the value of the digit 3 in 803,604? (Write just the number, e.g. 4000)', null, '3000', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'place-value-to-hundred-thousands' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Rounding Large Numbers (4.NBT.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'rounding-large-numbers', 'Rounding Large Numbers', 'To round, look at the digit just to the right of the place you''re rounding to. If it''s 5 or more, round up; if it''s less than 5, round down.', 4, '4.NBT.A.3', 2
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Rounding Large Numbers', 4, '[{"type": "explain", "title": "About: Rounding Large Numbers", "body": "To round, look at the digit just to the right of the place you''re rounding to. If it''s 5 or more, round up; if it''s less than 5, round down."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Round 7,009 to the nearest hundred.\n\nThe answer is 7000."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Rounding Large Numbers - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 7,009 to the nearest hundred.', null, '7000', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 60,051 to the nearest thousand.', null, '60000', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 1,606 to the nearest hundred.', null, '1600', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 3,507 to the nearest hundred.', null, '3500', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 8,070 to the nearest hundred.', null, '8100', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 624 to the nearest ten.', null, '620', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 125 to the nearest ten.', null, '130', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 1,344 to the nearest ten.', null, '1340', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 80,192 to the nearest thousand.', null, '80000', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Round 89,808 to the nearest thousand.', null, '90000', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'rounding-large-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multi-Digit Addition & Subtraction (4.NBT.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'multi-digit-addition-and-subtraction', 'Multi-Digit Addition & Subtraction', 'Line up numbers by place value, then add or subtract one column at a time, regrouping (carrying or borrowing) when needed.', 4, '4.NBT.B.4', 3
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Multi-Digit Addition & Subtraction', 4, '[{"type": "explain", "title": "About: Multi-Digit Addition & Subtraction", "body": "Line up numbers by place value, then add or subtract one column at a time, regrouping (carrying or borrowing) when needed."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 78,174 + 24,446 = ?\n\nThe answer is 102620."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Multi-Digit Addition & Subtraction - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add: 78,174 + 24,446 = ?', null, '102620', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 63,649 - 27,725 = ?', null, '35924', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add: 87,292 + 9,294 = ?', null, '96586', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 87,628 - 1,565 = ?', null, '86063', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add: 74,660 + 46,435 = ?', null, '121095', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 63,068 - 16,953 = ?', null, '46115', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add: 76,163 + 72,670 = ?', null, '148833', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 9,121 - 7,833 = ?', null, '1288', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add: 10,671 + 7,430 = ?', null, '18101', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 75,432 - 45,634 = ?', null, '29798', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multi-digit-addition-and-subtraction' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multiply by a One-Digit Number (4.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'multiply-by-one-digit', 'Multiply by a One-Digit Number', 'Break the big number into place values, multiply each part by the one-digit number, then add the partial products together.', 4, '4.NBT.B.5', 4
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Multiply by a One-Digit Number', 4, '[{"type": "explain", "title": "About: Multiply by a One-Digit Number", "body": "Break the big number into place values, multiply each part by the one-digit number, then add the partial products together."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Multiply: 6 \u00d7 226 = ?\n\nThe answer is 1356."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Multiply by a One-Digit Number - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 6 x 226 = ?', null, '1356', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 3 x 726 = ?', null, '2178', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 6 x 341 = ?', null, '2046', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 9 x 886 = ?', null, '7974', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 3 x 612 = ?', null, '1836', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 9 x 917 = ?', null, '8253', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 9 x 950 = ?', null, '8550', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 2 x 206 = ?', null, '412', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 8 x 690 = ?', null, '5520', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 9 x 981 = ?', null, '8829', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-by-one-digit' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Multiply Two Two-Digit Numbers (4.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'multiply-two-digit-numbers', 'Multiply Two Two-Digit Numbers', 'Split each number into tens and ones and multiply every part by every part (the area model), then add up all the partial products.', 4, '4.NBT.B.5', 5
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Multiply Two Two-Digit Numbers', 4, '[{"type": "explain", "title": "About: Multiply Two Two-Digit Numbers", "body": "Split each number into tens and ones and multiply every part by every part (the area model), then add up all the partial products."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Multiply: 44 \u00d7 89 = ?\n\nThe answer is 3916."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Multiply Two Two-Digit Numbers - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 44 x 89 = ?', null, '3916', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 43 x 67 = ?', null, '2881', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 50 x 19 = ?', null, '950', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 73 x 51 = ?', null, '3723', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 88 x 96 = ?', null, '8448', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 54 x 47 = ?', null, '2538', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 98 x 57 = ?', null, '5586', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 36 x 86 = ?', null, '3096', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 35 x 72 = ?', null, '2520', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Multiply: 32 x 49 = ?', null, '1568', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'multiply-two-digit-numbers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Division with Remainders (4.NBT.B.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'division-with-remainders', 'Division with Remainders', 'Divide to find how many equal groups you can make (the quotient). Whatever is left over and can''t make a full group is the remainder.', 4, '4.NBT.B.6', 6
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Division with Remainders', 4, '[{"type": "explain", "title": "About: Division with Remainders", "body": "Divide to find how many equal groups you can make (the quotient). Whatever is left over and can''t make a full group is the remainder."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the quotient (whole-number part) of 205 \u00f7 9?\n\nThe answer is 22."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Division with Remainders - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the quotient (whole-number part) of 205 / 9?', null, '22', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the remainder of 246 / 7?', null, '1', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the quotient (whole-number part) of 101 / 3?', null, '33', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the remainder of 156 / 7?', null, '2', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the quotient (whole-number part) of 113 / 5?', null, '22', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the remainder of 199 / 7?', null, '3', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the quotient (whole-number part) of 641 / 8?', null, '80', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the remainder of 65 / 4?', null, '1', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the quotient (whole-number part) of 572 / 9?', null, '63', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the remainder of 409 / 9?', null, '4', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'division-with-remainders' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Factors & Multiples (4.OA.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'factors-and-multiples', 'Factors & Multiples', 'A factor divides a number evenly with no remainder. A multiple is what you get when you skip-count by a number.', 4, '4.OA.B.4', 7
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Factors & Multiples', 4, '[{"type": "explain", "title": "About: Factors & Multiples", "body": "A factor divides a number evenly with no remainder. A multiple is what you get when you skip-count by a number."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which number is a factor of 36?\n\nThe correct answer is \"3\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which number is a multiple of 4?", "choices": [{"id": "a", "label": "33"}, {"id": "b", "label": "33"}, {"id": "c", "label": "32"}, {"id": "d", "label": "30"}], "answer": "c", "explanation": "The correct answer is \"32\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Factors & Multiples - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a factor of 36?', '[{"id": "a", "label": "14"}, {"id": "b", "label": "3"}, {"id": "c", "label": "8"}, {"id": "d", "label": "28"}]'::jsonb, 'b', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a multiple of 4?', '[{"id": "a", "label": "33"}, {"id": "b", "label": "33"}, {"id": "c", "label": "32"}, {"id": "d", "label": "30"}]'::jsonb, 'c', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a factor of 20?', '[{"id": "a", "label": "18"}, {"id": "b", "label": "7"}, {"id": "c", "label": "13"}, {"id": "d", "label": "10"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a multiple of 8?', '[{"id": "a", "label": "58"}, {"id": "b", "label": "58"}, {"id": "c", "label": "54"}, {"id": "d", "label": "56"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a factor of 20?', '[{"id": "a", "label": "9"}, {"id": "b", "label": "12"}, {"id": "c", "label": "5"}, {"id": "d", "label": "11"}]'::jsonb, 'c', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a multiple of 4?', '[{"id": "a", "label": "28"}, {"id": "b", "label": "26"}, {"id": "c", "label": "30"}, {"id": "d", "label": "29"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a factor of 24?', '[{"id": "a", "label": "18"}, {"id": "b", "label": "19"}, {"id": "c", "label": "15"}, {"id": "d", "label": "3"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a multiple of 3?', '[{"id": "a", "label": "22"}, {"id": "b", "label": "24"}, {"id": "c", "label": "22"}, {"id": "d", "label": "23"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a factor of 12?', '[{"id": "a", "label": "4"}, {"id": "b", "label": "7"}, {"id": "c", "label": "11"}, {"id": "d", "label": "8"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which number is a multiple of 8?', '[{"id": "a", "label": "57"}, {"id": "b", "label": "56"}, {"id": "c", "label": "54"}, {"id": "d", "label": "55"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'factors-and-multiples' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Equivalent Fractions (4.NF.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'equivalent-fractions', 'Equivalent Fractions', 'Two fractions are equivalent if they show the same amount. Multiply (or divide) the top and bottom by the same number to find one.', 4, '4.NF.A.1', 8
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Equivalent Fractions', 4, '[{"type": "explain", "title": "About: Equivalent Fractions", "body": "Two fractions are equivalent if they show the same amount. Multiply (or divide) the top and bottom by the same number to find one."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which fraction is equivalent to 1/3?\n\nThe correct answer is \"2/6\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is equivalent to 1/3?", "choices": [{"id": "a", "label": "5/12"}, {"id": "b", "label": "4/12"}, {"id": "c", "label": "4/13"}, {"id": "d", "label": "2/4"}], "answer": "b", "explanation": "The correct answer is \"4/12\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Equivalent Fractions - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/3?', '[{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/7"}, {"id": "c", "label": "2/6"}, {"id": "d", "label": "2/4"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/3?', '[{"id": "a", "label": "5/12"}, {"id": "b", "label": "4/12"}, {"id": "c", "label": "4/13"}, {"id": "d", "label": "2/4"}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/5?', '[{"id": "a", "label": "3/10"}, {"id": "b", "label": "2/11"}, {"id": "c", "label": "2/10"}, {"id": "d", "label": "2/6"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 2/5?', '[{"id": "a", "label": "9/20"}, {"id": "b", "label": "8/21"}, {"id": "c", "label": "3/6"}, {"id": "d", "label": "8/20"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/2?', '[{"id": "a", "label": "5/8"}, {"id": "b", "label": "4/8"}, {"id": "c", "label": "4/9"}, {"id": "d", "label": "2/3"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/5?', '[{"id": "a", "label": "3/15"}, {"id": "b", "label": "4/15"}, {"id": "c", "label": "3/16"}, {"id": "d", "label": "2/6"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/3?', '[{"id": "a", "label": "4/9"}, {"id": "b", "label": "3/10"}, {"id": "c", "label": "3/9"}, {"id": "d", "label": "2/4"}]'::jsonb, 'c', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/2?', '[{"id": "a", "label": "3/4"}, {"id": "b", "label": "2/4"}, {"id": "c", "label": "2/5"}, {"id": "d", "label": "2/3"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 1/4?', '[{"id": "a", "label": "3/8"}, {"id": "b", "label": "2/9"}, {"id": "c", "label": "2/8"}, {"id": "d", "label": "2/5"}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is equivalent to 3/4?', '[{"id": "a", "label": "6/8"}, {"id": "b", "label": "7/8"}, {"id": "c", "label": "6/9"}, {"id": "d", "label": "4/5"}]'::jsonb, 'a', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'equivalent-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Comparing Fractions (4.NF.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'comparing-fractions', 'Comparing Fractions', 'When two fractions have the same denominator, the one with the bigger numerator (top number) is greater.', 4, '4.NF.A.2', 9
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Comparing Fractions', 4, '[{"type": "explain", "title": "About: Comparing Fractions", "body": "When two fractions have the same denominator, the one with the bigger numerator (top number) is greater."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which fraction is greater: 1/6 or 5/6?\n\nThe correct answer is \"5/6\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which fraction is greater: 2/6 or 3/6?", "choices": [{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}], "answer": "a", "explanation": "The correct answer is \"3/6\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Comparing Fractions - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 1/6 or 5/6?', '[{"id": "a", "label": "1/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "6/6"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 2/6 or 3/6?', '[{"id": "a", "label": "3/6"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 1/5 or 4/5?', '[{"id": "a", "label": "1/5"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "4/5"}, {"id": "d", "label": "5/5"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 9/10 or 4/10?', '[{"id": "a", "label": "9/10"}, {"id": "b", "label": "4/10"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "13/10"}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 2/4 or 1/4?', '[{"id": "a", "label": "1/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "3/4"}, {"id": "d", "label": "2/4"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 4/6 or 2/6?', '[{"id": "a", "label": "2/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "6/6"}, {"id": "d", "label": "4/6"}]'::jsonb, 'd', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 1/4 or 3/4?', '[{"id": "a", "label": "1/4"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "4/4"}, {"id": "d", "label": "3/4"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 3/6 or 5/6?', '[{"id": "a", "label": "3/6"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "8/6"}]'::jsonb, 'c', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 2/6 or 3/6?', '[{"id": "a", "label": "2/6"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "5/6"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which fraction is greater: 1/4 or 2/4?', '[{"id": "a", "label": "1/4"}, {"id": "b", "label": "2/4"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "3/4"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'comparing-fractions' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [math] Adding & Subtracting Fractions (4.NF.B.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'adding-fractions-like-denominators', 'Adding & Subtracting Fractions', 'When denominators are the same, just add or subtract the numerators and keep the denominator the same.', 4, '4.NF.B.3', 10
from public.subjects s where s.slug = 'math'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Adding & Subtracting Fractions', 4, '[{"type": "explain", "title": "About: Adding & Subtracting Fractions", "body": "When denominators are the same, just add or subtract the numerators and keep the denominator the same."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add the fractions: 1/5 + 3/5 = ?  (Write as a fraction like 5/5)\n\nThe answer is 4/5."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Adding & Subtracting Fractions - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add the fractions: 1/5 + 3/5 = ?  (Write as a fraction like 5/5)', null, '4/5', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 6/8 - 5/8 = ?  (Write as a fraction like 2/8)', null, '1/8', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add the fractions: 1/6 + 1/6 = ?  (Write as a fraction like 5/6)', null, '2/6', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 5/12 - 2/12 = ?  (Write as a fraction like 2/12)', null, '3/12', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add the fractions: 3/10 + 5/10 = ?  (Write as a fraction like 5/10)', null, '8/10', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 4/5 - 1/5 = ?  (Write as a fraction like 2/5)', null, '3/5', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add the fractions: 6/12 + 5/12 = ?  (Write as a fraction like 5/12)', null, '11/12', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 8/10 - 6/10 = ?  (Write as a fraction like 2/10)', null, '2/10', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Add the fractions: 10/12 + 1/12 = ?  (Write as a fraction like 5/12)', null, '11/12', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Subtract: 9/12 - 3/12 = ?  (Write as a fraction like 2/12)', null, '6/12', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'math' and t.slug = 'adding-fractions-like-denominators' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Energy & Motion (4-PS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'energy', 'Energy & Motion', 'Energy is the ability to do work or cause change. Moving things have kinetic energy; stored-up energy (like a stretched spring) is potential energy.', 4, '4-PS3-1', 1
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Energy & Motion', 4, '[{"type": "explain", "title": "About: Energy & Motion", "body": "Energy is the ability to do work or cause change. Moving things have kinetic energy; stored-up energy (like a stretched spring) is potential energy."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Energy that is moving, like a rolling ball, is called what?\n\nThe correct answer is \"kinetic energy\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A stretched rubber band ready to snap back is an example of what?", "choices": [{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "heat energy only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "stored (potential) energy"}], "answer": "d", "explanation": "The correct answer is \"stored (potential) energy\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Energy & Motion - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Energy that is moving, like a rolling ball, is called what?', '[{"id": "a", "label": "stored energy"}, {"id": "b", "label": "light only"}, {"id": "c", "label": "kinetic energy"}, {"id": "d", "label": "no energy"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A stretched rubber band ready to snap back is an example of what?', '[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "heat energy only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "stored (potential) energy"}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'When you rub your hands together quickly, the energy you feel is mostly:', '[{"id": "a", "label": "light energy"}, {"id": "b", "label": "sound energy"}, {"id": "c", "label": "chemical energy"}, {"id": "d", "label": "heat (thermal) energy"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A faster-moving object has MORE of which kind of energy?', '[{"id": "a", "label": "less energy"}, {"id": "b", "label": "stored energy"}, {"id": "c", "label": "no energy"}, {"id": "d", "label": "kinetic energy"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which of these gives off light and heat energy?', '[{"id": "a", "label": "a rock"}, {"id": "b", "label": "the Sun"}, {"id": "c", "label": "a glass of water"}, {"id": "d", "label": "a wooden chair"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Plants store energy from sunlight in the form of:', '[{"id": "a", "label": "water"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "food (sugar)"}, {"id": "d", "label": "air"}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A battery stores which kind of energy?', '[{"id": "a", "label": "sound energy"}, {"id": "b", "label": "chemical energy"}, {"id": "c", "label": "light energy"}, {"id": "d", "label": "wind energy"}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Energy from the movement of an object is called ____ energy. (one word)', null, 'kinetic', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'When a moving car hits a wall, its energy is transferred mostly into:', '[{"id": "a", "label": "sound and heat"}, {"id": "b", "label": "new matter"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "gravity"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which activity uses electrical energy?', '[{"id": "a", "label": "dropping a ball"}, {"id": "b", "label": "stretching a spring"}, {"id": "c", "label": "turning on a lamp"}, {"id": "d", "label": "throwing a rock"}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'energy' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Waves: Light & Sound (4-PS4-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'waves-light-sound', 'Waves: Light & Sound', 'Sound is made by vibrations that travel as waves. We see things when light bounces off them and reaches our eyes.', 4, '4-PS4-1', 2
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Waves: Light & Sound', 4, '[{"type": "explain", "title": "About: Waves: Light & Sound", "body": "Sound is made by vibrations that travel as waves. We see things when light bounces off them and reaches our eyes."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Sound is made when objects do what?\n\nThe correct answer is \"vibrate\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "We see most objects because light does what off of them?", "choices": [{"id": "a", "label": "disappears"}, {"id": "b", "label": "reflects (bounces)"}, {"id": "c", "label": "freezes"}, {"id": "d", "label": "melts"}], "answer": "b", "explanation": "The correct answer is \"reflects (bounces)\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Waves: Light & Sound - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Sound is made when objects do what?', '[{"id": "a", "label": "freeze"}, {"id": "b", "label": "vibrate"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "glow"}]'::jsonb, 'b', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'We see most objects because light does what off of them?', '[{"id": "a", "label": "disappears"}, {"id": "b", "label": "reflects (bounces)"}, {"id": "c", "label": "freezes"}, {"id": "d", "label": "melts"}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Sound travels as a kind of:', '[{"id": "a", "label": "wave"}, {"id": "b", "label": "rock"}, {"id": "c", "label": "liquid"}, {"id": "d", "label": "gas only"}]'::jsonb, 'a', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A louder sound is made by a vibration with a bigger:', '[{"id": "a", "label": "color"}, {"id": "b", "label": "weight"}, {"id": "c", "label": "amplitude"}, {"id": "d", "label": "smell"}]'::jsonb, 'c', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which travels faster?', '[{"id": "a", "label": "sound"}, {"id": "b", "label": "light"}, {"id": "c", "label": "they never move"}, {"id": "d", "label": "neither moves"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'You cannot see in a completely dark room because there is no:', '[{"id": "a", "label": "sound"}, {"id": "b", "label": "air"}, {"id": "c", "label": "water"}, {"id": "d", "label": "light"}]'::jsonb, 'd', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A high-pitched sound comes from vibrations that are:', '[{"id": "a", "label": "slow"}, {"id": "b", "label": "fast"}, {"id": "c", "label": "stopped"}, {"id": "d", "label": "heavy"}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Sound is made when an object ____ back and forth. (one word)', null, 'vibrates', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Patterns of light and sound can be used to:', '[{"id": "a", "label": "send information (like a signal)"}, {"id": "b", "label": "create matter"}, {"id": "c", "label": "stop time"}, {"id": "d", "label": "make gravity"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An echo happens when sound waves do what off a wall?', '[{"id": "a", "label": "disappear"}, {"id": "b", "label": "speed up forever"}, {"id": "c", "label": "bounce back"}, {"id": "d", "label": "turn into light"}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'waves-light-sound' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Plant Structures & Functions (4-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'plant-structures', 'Plant Structures & Functions', 'Plants have parts with special jobs: roots take in water, leaves make food from sunlight, stems carry water, and flowers make seeds.', 4, '4-LS1-1', 3
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Plant Structures & Functions', 4, '[{"type": "explain", "title": "About: Plant Structures & Functions", "body": "Plants have parts with special jobs: roots take in water, leaves make food from sunlight, stems carry water, and flowers make seeds."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which plant part takes in water from the soil?\n\nThe correct answer is \"roots\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which plant part makes food using sunlight?", "choices": [{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}], "answer": "b", "explanation": "The correct answer is \"leaves\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Plant Structures & Functions - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which plant part takes in water from the soil?', '[{"id": "a", "label": "flower"}, {"id": "b", "label": "roots"}, {"id": "c", "label": "leaf"}, {"id": "d", "label": "fruit"}]'::jsonb, 'b', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which plant part makes food using sunlight?', '[{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which part of a plant usually makes seeds?', '[{"id": "a", "label": "flower"}, {"id": "b", "label": "root"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "leaf"}]'::jsonb, 'a', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'What carries water from the roots up to the leaves?', '[{"id": "a", "label": "the petals"}, {"id": "b", "label": "the seeds"}, {"id": "c", "label": "the stem"}, {"id": "d", "label": "the fruit"}]'::jsonb, 'c', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'The process plants use to make food from sunlight is called:', '[{"id": "a", "label": "digestion"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "evaporation"}, {"id": "d", "label": "photosynthesis"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Why are brightly colored flowers helpful to a plant?', '[{"id": "a", "label": "they attract pollinators like bees"}, {"id": "b", "label": "they scare away the Sun"}, {"id": "c", "label": "they make the plant cold"}, {"id": "d", "label": "they stop water"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Seeds help a plant to:', '[{"id": "a", "label": "take in sunlight"}, {"id": "b", "label": "hold the plant down"}, {"id": "c", "label": "make flowers fall"}, {"id": "d", "label": "make new plants (reproduce)"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'The plant part that anchors it and absorbs water is the ____. (one word)', null, 'roots', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A fruit usually protects the plant''s:', '[{"id": "a", "label": "roots"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "stem"}, {"id": "d", "label": "seeds"}]'::jsonb, 'd', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which do plants need to make their own food?', '[{"id": "a", "label": "only soil"}, {"id": "b", "label": "sunlight, water, and air"}, {"id": "c", "label": "only darkness"}, {"id": "d", "label": "only rocks"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'plant-structures' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Animal Structures & Senses (4-LS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'animal-structures-senses', 'Animal Structures & Senses', 'Animals have body parts and senses that help them survive - to find food, sense danger, move, and stay warm.', 4, '4-LS1-2', 4
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Animal Structures & Senses', 4, '[{"type": "explain", "title": "About: Animal Structures & Senses", "body": "Animals have body parts and senses that help them survive \u2014 to find food, sense danger, move, and stay warm."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which body part do most animals use to sense light?\n\nThe correct answer is \"eyes\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "An animal uses its ears mainly to:", "choices": [{"id": "a", "label": "hear sounds"}, {"id": "b", "label": "taste food"}, {"id": "c", "label": "see color"}, {"id": "d", "label": "smell"}], "answer": "a", "explanation": "The correct answer is \"hear sounds\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Animal Structures & Senses - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which body part do most animals use to sense light?', '[{"id": "a", "label": "eyes"}, {"id": "b", "label": "fins"}, {"id": "c", "label": "fur"}, {"id": "d", "label": "claws"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An animal uses its ears mainly to:', '[{"id": "a", "label": "hear sounds"}, {"id": "b", "label": "taste food"}, {"id": "c", "label": "see color"}, {"id": "d", "label": "smell"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Sharp claws and teeth most help an animal to:', '[{"id": "a", "label": "fly higher"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "catch and eat food"}, {"id": "d", "label": "see at night"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Thick fur or feathers most help an animal to:', '[{"id": "a", "label": "run faster only"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "see better"}, {"id": "d", "label": "smell food"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which structure helps a fish move through water?', '[{"id": "a", "label": "lungs"}, {"id": "b", "label": "fins"}, {"id": "c", "label": "wings"}, {"id": "d", "label": "hooves"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Animals use information from their senses to help them:', '[{"id": "a", "label": "grow taller only"}, {"id": "b", "label": "change color of the sky"}, {"id": "c", "label": "stop breathing"}, {"id": "d", "label": "survive (find food, avoid danger)"}]'::jsonb, 'd', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A bird''s wings are mainly used for:', '[{"id": "a", "label": "flying"}, {"id": "b", "label": "digging"}, {"id": "c", "label": "swimming deep"}, {"id": "d", "label": "hearing"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'The sense organ an animal uses to detect smells is its ____. (one word)', null, 'nose', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Camouflage helps an animal by letting it:', '[{"id": "a", "label": "glow in the dark"}, {"id": "b", "label": "blend in and hide"}, {"id": "c", "label": "grow wings"}, {"id": "d", "label": "breathe water"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Long legs most help an animal to:', '[{"id": "a", "label": "see color"}, {"id": "b", "label": "run or move quickly"}, {"id": "c", "label": "hear better"}, {"id": "d", "label": "taste food"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'animal-structures-senses' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Earth's Features & Maps (4-ESS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'earths-features', 'Earth''s Features & Maps', 'Earth has oceans, mountains, rivers, valleys, and deserts. Maps use symbols and a key to show where these features are.', 4, '4-ESS2-2', 5
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Earth''s Features & Maps', 4, '[{"type": "explain", "title": "About: Earth''s Features & Maps", "body": "Earth has oceans, mountains, rivers, valleys, and deserts. Maps use symbols and a key to show where these features are."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A very large area of salt water on Earth is called an:\n\nThe correct answer is \"ocean\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A tall landform that rises high above the land around it is a:", "choices": [{"id": "a", "label": "mountain"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "river"}], "answer": "a", "explanation": "The correct answer is \"mountain\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Earth''s Features & Maps - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A very large area of salt water on Earth is called an:', '[{"id": "a", "label": "mountain"}, {"id": "b", "label": "desert"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "ocean"}]'::jsonb, 'd', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A tall landform that rises high above the land around it is a:', '[{"id": "a", "label": "mountain"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "river"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Most of Earth''s surface is covered by:', '[{"id": "a", "label": "sand"}, {"id": "b", "label": "ice"}, {"id": "c", "label": "forests"}, {"id": "d", "label": "water"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A map uses symbols and a key to show:', '[{"id": "a", "label": "the future"}, {"id": "b", "label": "sounds"}, {"id": "c", "label": "smells"}, {"id": "d", "label": "places and features"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A low area of land between mountains is called a:', '[{"id": "a", "label": "peak"}, {"id": "b", "label": "plateau"}, {"id": "c", "label": "valley"}, {"id": "d", "label": "cliff"}]'::jsonb, 'c', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Fresh water that flows across land toward the sea is a:', '[{"id": "a", "label": "river"}, {"id": "b", "label": "dune"}, {"id": "c", "label": "crater"}, {"id": "d", "label": "glacier"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is the largest? ', '[{"id": "a", "label": "an ocean"}, {"id": "b", "label": "a pond"}, {"id": "c", "label": "a stream"}, {"id": "d", "label": "a puddle"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'A dry region that gets very little rain is called a ____. (one word)', null, 'desert', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Mountains are often found in long lines called:', '[{"id": "a", "label": "lakes"}, {"id": "b", "label": "ranges"}, {"id": "c", "label": "bays"}, {"id": "d", "label": "islands"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A piece of land surrounded by water on all sides is an:', '[{"id": "a", "label": "ocean"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "island"}, {"id": "d", "label": "desert"}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'earths-features' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Weathering & Erosion (4-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'weathering-erosion', 'Weathering & Erosion', 'Weathering breaks rock into smaller pieces. Erosion is when wind or water carries those pieces away, slowly changing the land.', 4, '4-ESS2-1', 6
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Weathering & Erosion', 4, '[{"type": "explain", "title": "About: Weathering & Erosion", "body": "Weathering breaks rock into smaller pieces. Erosion is when wind or water carries those pieces away, slowly changing the land."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Wind and water slowly breaking rock into smaller pieces is called:\n\nThe correct answer is \"weathering\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Moving water carrying away soil and sand is called:", "choices": [{"id": "a", "label": "erosion"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "reflection"}, {"id": "d", "label": "vibration"}], "answer": "a", "explanation": "The correct answer is \"erosion\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Weathering & Erosion - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Wind and water slowly breaking rock into smaller pieces is called:', '[{"id": "a", "label": "melting"}, {"id": "b", "label": "freezing"}, {"id": "c", "label": "growing"}, {"id": "d", "label": "weathering"}]'::jsonb, 'd', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Moving water carrying away soil and sand is called:', '[{"id": "a", "label": "erosion"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "reflection"}, {"id": "d", "label": "vibration"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which can wear down a mountain over a very long time?', '[{"id": "a", "label": "a single rainy day"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "wind and water"}, {"id": "d", "label": "moonlight"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Plant roots can break rocks apart as they:', '[{"id": "a", "label": "shrink"}, {"id": "b", "label": "freeze the Sun"}, {"id": "c", "label": "grow"}, {"id": "d", "label": "reflect light"}]'::jsonb, 'c', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'When a river drops the sand and soil it was carrying, this is called:', '[{"id": "a", "label": "weathering"}, {"id": "b", "label": "deposition"}, {"id": "c", "label": "vibration"}, {"id": "d", "label": "photosynthesis"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which change happens very slowly, over many years?', '[{"id": "a", "label": "a glass breaking"}, {"id": "b", "label": "a canyon being carved by a river"}, {"id": "c", "label": "a light turning on"}, {"id": "d", "label": "a door closing"}]'::jsonb, 'b', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Ocean waves hitting a cliff cause the cliff to:', '[{"id": "a", "label": "grow taller"}, {"id": "b", "label": "get colder"}, {"id": "c", "label": "wear away (erode)"}, {"id": "d", "label": "turn to metal"}]'::jsonb, 'c', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'The breaking down of rock into smaller pieces is called ____. (one word)', null, 'weathering', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which helps SLOW down soil erosion on a hill?', '[{"id": "a", "label": "removing all plants"}, {"id": "b", "label": "pouring more water"}, {"id": "c", "label": "adding loose sand"}, {"id": "d", "label": "planting grass and trees"}]'::jsonb, 'd', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Sand at a beach was once mostly:', '[{"id": "a", "label": "made by animals"}, {"id": "b", "label": "fallen from the sky"}, {"id": "c", "label": "larger rocks broken down over time"}, {"id": "d", "label": "grown from seeds"}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'weathering-erosion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Fossils & Rock Layers (4-ESS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'fossils-rock-layers', 'Fossils & Rock Layers', 'Fossils are preserved traces of ancient living things, usually found in sedimentary rock. Lower rock layers are usually older.', 4, '4-ESS1-1', 7
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Fossils & Rock Layers', 4, '[{"type": "explain", "title": "About: Fossils & Rock Layers", "body": "Fossils are preserved traces of ancient living things, usually found in sedimentary rock. Lower rock layers are usually older."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A fossil is the preserved remains or trace of a:\n\nThe correct answer is \"living thing from long ago\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Fossils are most often found in which kind of rock?", "choices": [{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "metal"}], "answer": "a", "explanation": "The correct answer is \"sedimentary rock\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Fossils & Rock Layers - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A fossil is the preserved remains or trace of a:', '[{"id": "a", "label": "modern plastic toy"}, {"id": "b", "label": "fresh leaf"}, {"id": "c", "label": "living thing from long ago"}, {"id": "d", "label": "rain cloud"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Fossils are most often found in which kind of rock?', '[{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "metal"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'In undisturbed rock layers, the OLDEST layer is usually:', '[{"id": "a", "label": "at the top"}, {"id": "b", "label": "at the bottom"}, {"id": "c", "label": "in the middle"}, {"id": "d", "label": "floating above"}]'::jsonb, 'b', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Fossils can tell us about:', '[{"id": "a", "label": "tomorrow''s weather"}, {"id": "b", "label": "living things and environments of the past"}, {"id": "c", "label": "the price of food"}, {"id": "d", "label": "what someone is thinking"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A dinosaur footprint turned to stone is an example of a:', '[{"id": "a", "label": "trace fossil"}, {"id": "b", "label": "mineral crystal"}, {"id": "c", "label": "raindrop"}, {"id": "d", "label": "modern shoe"}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Rock layers form over time as ____ piles up and hardens.', '[{"id": "a", "label": "sediment"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "wind only"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'If a fossil of a fish is found in a desert, it suggests the area was once:', '[{"id": "a", "label": "on the Moon"}, {"id": "b", "label": "always a desert"}, {"id": "c", "label": "made of metal"}, {"id": "d", "label": "underwater"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'The preserved remains of an ancient living thing is called a ____. (one word)', null, 'fossil', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Scientists who study fossils are called:', '[{"id": "a", "label": "astronauts"}, {"id": "b", "label": "paleontologists"}, {"id": "c", "label": "chefs"}, {"id": "d", "label": "pilots"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Newer rock layers are usually found:', '[{"id": "a", "label": "below older layers"}, {"id": "b", "label": "inside the Sun"}, {"id": "c", "label": "under the ocean only"}, {"id": "d", "label": "on top of older layers"}]'::jsonb, 'd', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'fossils-rock-layers' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Natural Resources & Conservation (4-ESS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'natural-resources', 'Natural Resources & Conservation', 'Natural resources come from Earth. Some are renewable (sunlight, wind) and some are not (coal, oil). Conserving them protects the planet.', 4, '4-ESS3-1', 8
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Natural Resources & Conservation', 4, '[{"type": "explain", "title": "About: Natural Resources & Conservation", "body": "Natural resources come from Earth. Some are renewable (sunlight, wind) and some are not (coal, oil). Conserving them protects the planet."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which is a natural resource that comes from the Earth?\n\nThe correct answer is \"water\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which energy resource is renewable (it won''t run out)?", "choices": [{"id": "a", "label": "sunlight"}, {"id": "b", "label": "coal"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}], "answer": "a", "explanation": "The correct answer is \"sunlight\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Natural Resources & Conservation - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is a natural resource that comes from the Earth?', '[{"id": "a", "label": "a plastic toy"}, {"id": "b", "label": "a video game"}, {"id": "c", "label": "water"}, {"id": "d", "label": "a brick wall"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which energy resource is renewable (it won''t run out)?', '[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "coal"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Coal and oil are called fossil fuels and are:', '[{"id": "a", "label": "renewable"}, {"id": "b", "label": "made by factories"}, {"id": "c", "label": "unlimited"}, {"id": "d", "label": "nonrenewable"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Recycling helps us:', '[{"id": "a", "label": "use up more oil"}, {"id": "b", "label": "use fewer new resources"}, {"id": "c", "label": "make more trash"}, {"id": "d", "label": "waste water"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is a way to conserve water?', '[{"id": "a", "label": "leave the hose running"}, {"id": "b", "label": "take very long showers"}, {"id": "c", "label": "pour water on the road"}, {"id": "d", "label": "turn off the tap while brushing teeth"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Wind can be used to make electricity using a:', '[{"id": "a", "label": "coal mine"}, {"id": "b", "label": "wind turbine"}, {"id": "c", "label": "oil well"}, {"id": "d", "label": "candle"}]'::jsonb, 'b', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Trees are an important resource because they give us wood and:', '[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "gasoline"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'A resource that can be replaced naturally, like sunlight or wind, is called ____. (one word)', null, 'renewable', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A natural event that can be dangerous to people, like a flood, is a natural:', '[{"id": "a", "label": "hazard"}, {"id": "b", "label": "resource"}, {"id": "c", "label": "recycle"}, {"id": "d", "label": "fuel"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which choice reduces pollution?', '[{"id": "a", "label": "burning more trash"}, {"id": "b", "label": "riding a bike instead of driving"}, {"id": "c", "label": "leaving lights on all day"}, {"id": "d", "label": "wasting paper"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'natural-resources' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] Electricity & Magnetism (4-PS3-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'electricity-magnetism', 'Electricity & Magnetism', 'Electricity flows through conductors like metal in a complete circuit. Magnets attract iron and have poles that attract or repel.', 4, '4-PS3-2', 9
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Electricity & Magnetism', 4, '[{"type": "explain", "title": "About: Electricity & Magnetism", "body": "Electricity flows through conductors like metal in a complete circuit. Magnets attract iron and have poles that attract or repel."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Electricity flows easily through which material?\n\nThe correct answer is \"metal wire\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A material that does NOT let electricity flow easily is called an:", "choices": [{"id": "a", "label": "conductor"}, {"id": "b", "label": "insulator"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "battery"}], "answer": "b", "explanation": "The correct answer is \"insulator\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Electricity & Magnetism - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Electricity flows easily through which material?', '[{"id": "a", "label": "rubber"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "metal wire"}, {"id": "d", "label": "wood"}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A material that does NOT let electricity flow easily is called an:', '[{"id": "a", "label": "conductor"}, {"id": "b", "label": "insulator"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "battery"}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A magnet attracts objects made of:', '[{"id": "a", "label": "plastic"}, {"id": "b", "label": "iron"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "paper"}]'::jsonb, 'b', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Two magnets pushing apart are showing that like poles:', '[{"id": "a", "label": "repel"}, {"id": "b", "label": "attract"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "disappear"}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A complete path that lets electricity flow is called a:', '[{"id": "a", "label": "magnet"}, {"id": "b", "label": "fossil"}, {"id": "c", "label": "wave"}, {"id": "d", "label": "circuit"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is a conductor of electricity?', '[{"id": "a", "label": "copper"}, {"id": "b", "label": "wood"}, {"id": "c", "label": "rubber"}, {"id": "d", "label": "cloth"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'The opposite poles of two magnets will:', '[{"id": "a", "label": "repel"}, {"id": "b", "label": "do nothing ever"}, {"id": "c", "label": "catch fire"}, {"id": "d", "label": "attract (pull together)"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'A complete loop that electricity travels around is called a ____. (one word)', null, 'circuit', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'If a bulb in a simple circuit won''t light, a likely problem is:', '[{"id": "a", "label": "too many magnets"}, {"id": "b", "label": "not enough sunlight"}, {"id": "c", "label": "a break in the circuit"}, {"id": "d", "label": "the room is quiet"}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A magnet''s pull is strongest at its:', '[{"id": "a", "label": "poles (ends)"}, {"id": "b", "label": "middle"}, {"id": "c", "label": "color"}, {"id": "d", "label": "weight"}]'::jsonb, 'a', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'electricity-magnetism' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [science] The Water Cycle & Weather (4-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'water-cycle-weather', 'The Water Cycle & Weather', 'The Sun drives the water cycle: water evaporates, condenses into clouds, and falls as precipitation. Weather is the day-to-day state of the air.', 4, '4-ESS2-1', 10
from public.subjects s where s.slug = 'science'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: The Water Cycle & Weather', 4, '[{"type": "explain", "title": "About: The Water Cycle & Weather", "body": "The Sun drives the water cycle: water evaporates, condenses into clouds, and falls as precipitation. Weather is the day-to-day state of the air."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: When the Sun heats water and it turns into vapor, this is:\n\nThe correct answer is \"evaporation\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Water vapor cooling and forming clouds is called:", "choices": [{"id": "a", "label": "evaporation"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "condensation"}], "answer": "d", "explanation": "The correct answer is \"condensation\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'The Water Cycle & Weather - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'When the Sun heats water and it turns into vapor, this is:', '[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "condensation"}, {"id": "c", "label": "precipitation"}, {"id": "d", "label": "erosion"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Water vapor cooling and forming clouds is called:', '[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "condensation"}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Rain, snow, and hail are all forms of:', '[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "reflection"}, {"id": "c", "label": "vibration"}, {"id": "d", "label": "precipitation"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Clouds are made of tiny drops of:', '[{"id": "a", "label": "smoke"}, {"id": "b", "label": "dust only"}, {"id": "c", "label": "water"}, {"id": "d", "label": "sand"}]'::jsonb, 'c', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'The day-to-day condition of the air (sunny, rainy) is called:', '[{"id": "a", "label": "climate forever"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "erosion"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Most of the water that evaporates into the sky comes from the:', '[{"id": "a", "label": "deserts"}, {"id": "b", "label": "oceans"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "fires"}]'::jsonb, 'b', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which tool measures temperature?', '[{"id": "a", "label": "thermometer"}, {"id": "b", "label": "ruler"}, {"id": "c", "label": "scale"}, {"id": "d", "label": "clock"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Water turning from a liquid into a gas is called ____. (one word)', null, 'evaporation', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'The water cycle is powered mainly by energy from the:', '[{"id": "a", "label": "Moon"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "wind alone"}, {"id": "d", "label": "rivers"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Snow is most likely to fall when the air is:', '[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "very dry only"}, {"id": "d", "label": "windy only"}]'::jsonb, 'b', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'science' and t.slug = 'water-cycle-weather' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Finding the Main Idea (RI.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'main-idea', 'Finding the Main Idea', 'The main idea is what a passage is mostly about. Ask yourself: what is the one big point the author wants me to understand?', 4, 'RI.4.2', 1
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Finding the Main Idea', 4, '[{"type": "explain", "title": "About: Finding the Main Idea", "body": "The main idea is what a passage is mostly about. Ask yourself: what is the one big point the author wants me to understand?"}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Bees are very important. They move pollen from flower to flower, which helps plants make seeds and fruit. Without bees, many foods would be hard to grow.\" What is the main idea?\n\nThe correct answer is \"Bees are important because they help plants grow.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Maria practiced piano every day after school. At first the songs were hard, but slowly she got better. By spring, she could play her favorite song perfectly.\" What is the main idea?", "choices": [{"id": "a", "label": "Maria does not like music."}, {"id": "b", "label": "Spring is a season."}, {"id": "c", "label": "Piano songs are easy."}, {"id": "d", "label": "Practice helped Maria improve at piano."}], "answer": "d", "explanation": "The correct answer is \"Practice helped Maria improve at piano.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Finding the Main Idea - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Bees are very important. They move pollen from flower to flower, which helps plants make seeds and fruit. Without bees, many foods would be hard to grow." What is the main idea?', '[{"id": "a", "label": "Bees are important because they help plants grow."}, {"id": "b", "label": "Bees can sting people."}, {"id": "c", "label": "Flowers are colorful."}, {"id": "d", "label": "Fruit tastes sweet."}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Maria practiced piano every day after school. At first the songs were hard, but slowly she got better. By spring, she could play her favorite song perfectly." What is the main idea?', '[{"id": "a", "label": "Maria does not like music."}, {"id": "b", "label": "Spring is a season."}, {"id": "c", "label": "Piano songs are easy."}, {"id": "d", "label": "Practice helped Maria improve at piano."}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Penguins live where it is very cold. Their thick feathers and a layer of fat keep them warm. They huddle together to share heat." The passage is mostly about how penguins:', '[{"id": "a", "label": "catch fish"}, {"id": "b", "label": "swim fast"}, {"id": "c", "label": "build nests"}, {"id": "d", "label": "stay warm in cold places"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Recycling helps the Earth. It saves trees, uses less energy, and keeps trash out of landfills." What is the main idea?', '[{"id": "a", "label": "Recycling is good for the Earth."}, {"id": "b", "label": "Trees are tall."}, {"id": "c", "label": "Trash smells bad."}, {"id": "d", "label": "Landfills are far away."}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The school garden grew many vegetables. Students planted seeds, watered them, and pulled weeds. In the fall, they picked tomatoes and carrots." What is the main idea?', '[{"id": "a", "label": "Carrots are orange."}, {"id": "b", "label": "School starts early."}, {"id": "c", "label": "Weeds are tall."}, {"id": "d", "label": "Students grew vegetables in the school garden."}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Sea turtles travel thousands of miles in the ocean. They return to the same beach where they were born to lay their eggs." The main idea is that sea turtles:', '[{"id": "a", "label": "travel far and return to their home beach"}, {"id": "b", "label": "eat jellyfish"}, {"id": "c", "label": "are very old"}, {"id": "d", "label": "swim slowly"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Firefighters have a tough job. They put out fires, rescue people, and teach safety. They must be brave and strong." What is the main idea?', '[{"id": "a", "label": "Fire is hot."}, {"id": "b", "label": "Trucks are red."}, {"id": "c", "label": "Water puts out fire."}, {"id": "d", "label": "Firefighters do an important and difficult job."}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Thomas built a model volcano for science class. He mixed baking soda and vinegar, and it bubbled over like real lava." The passage is mainly about:', '[{"id": "a", "label": "how to cook dinner"}, {"id": "b", "label": "a real volcano erupting"}, {"id": "c", "label": "a trip to the beach"}, {"id": "d", "label": "a science project Thomas made"}]'::jsonb, 'd', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Libraries are wonderful places. You can borrow books, use computers, and join reading clubs, all for free." What is the main idea?', '[{"id": "a", "label": "Books are heavy."}, {"id": "b", "label": "Libraries offer many free things to do."}, {"id": "c", "label": "Computers are new."}, {"id": "d", "label": "Reading is hard."}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "Brushing your teeth keeps them healthy. It removes food, fights cavities, and keeps your breath fresh." In one word, the passage is mostly about keeping your teeth ____. ', null, 'healthy', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'main-idea' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Supporting Details (RI.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'supporting-details', 'Supporting Details', 'Supporting details are the facts and examples that tell more about the main idea. They answer who, what, where, when, why, and how.', 4, 'RI.4.2', 2
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Supporting Details', 4, '[{"type": "explain", "title": "About: Supporting Details", "body": "Supporting details are the facts and examples that tell more about the main idea. They answer who, what, where, when, why, and how."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Dogs make great pets. They are loyal, they can be trained, and they love to play.\" Which is a detail that supports the main idea?\n\nThe correct answer is \"They can be trained.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Our trip to the zoo was fun. We saw lions, fed the goats, and watched the monkeys swing.\" Which detail tells something they did at the zoo?", "choices": [{"id": "a", "label": "The bus was yellow."}, {"id": "b", "label": "It rained yesterday."}, {"id": "c", "label": "Lunch was at noon."}, {"id": "d", "label": "We fed the goats."}], "answer": "d", "explanation": "The correct answer is \"We fed the goats.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Supporting Details - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Dogs make great pets. They are loyal, they can be trained, and they love to play." Which is a detail that supports the main idea?', '[{"id": "a", "label": "Cats are quiet."}, {"id": "b", "label": "Fish swim in water."}, {"id": "c", "label": "They can be trained."}, {"id": "d", "label": "Birds can fly."}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Our trip to the zoo was fun. We saw lions, fed the goats, and watched the monkeys swing." Which detail tells something they did at the zoo?', '[{"id": "a", "label": "The bus was yellow."}, {"id": "b", "label": "It rained yesterday."}, {"id": "c", "label": "Lunch was at noon."}, {"id": "d", "label": "We fed the goats."}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Winter can be dangerous. Roads get icy, the cold can hurt your skin, and storms can knock out power." Which detail supports that winter is dangerous?', '[{"id": "a", "label": "Summer is warm."}, {"id": "b", "label": "Leaves are green."}, {"id": "c", "label": "Birds sing."}, {"id": "d", "label": "Roads get icy."}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Plants need care to grow. They need water, sunlight, and good soil." Which is a supporting detail?', '[{"id": "a", "label": "Rocks are hard."}, {"id": "b", "label": "The sky is blue."}, {"id": "c", "label": "They need sunlight."}, {"id": "d", "label": "Dogs bark."}]'::jsonb, 'c', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The festival had lots to enjoy. There was music, tasty food, and games for kids." Which detail supports that there was a lot to enjoy?', '[{"id": "a", "label": "It was Tuesday."}, {"id": "b", "label": "There were games for kids."}, {"id": "c", "label": "The town is small."}, {"id": "d", "label": "Cars were parked."}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Exercise keeps you healthy. It makes your heart strong, builds muscles, and lifts your mood." A supporting detail is that exercise:', '[{"id": "a", "label": "takes time"}, {"id": "b", "label": "is on TV"}, {"id": "c", "label": "makes your heart strong"}, {"id": "d", "label": "needs shoes"}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The old house looked spooky. The windows were broken, the door creaked, and vines covered the walls." Which detail shows the house looked spooky?', '[{"id": "a", "label": "It was for sale."}, {"id": "b", "label": "The door creaked."}, {"id": "c", "label": "The yard was big."}, {"id": "d", "label": "The roof was flat."}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Reading is a great hobby. It teaches new words, takes you on adventures, and helps you relax." A supporting detail is that reading:', '[{"id": "a", "label": "teaches new words"}, {"id": "b", "label": "costs money"}, {"id": "c", "label": "is loud"}, {"id": "d", "label": "needs a TV"}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Our teacher is kind. She helps us when we are stuck, listens to our ideas, and smiles a lot." Which detail supports that she is kind?', '[{"id": "a", "label": "She drives a car."}, {"id": "b", "label": "She listens to our ideas."}, {"id": "c", "label": "School is big."}, {"id": "d", "label": "Math is hard."}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "The beach trip was busy. We built sandcastles, swam in the waves, and collected shells." Name one thing they did at the beach. (one word, e.g. swam)', null, 'swam', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'supporting-details' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Sequence of Events (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'sequence', 'Sequence of Events', 'Sequence is the order things happen. Signal words like first, next, then, and last help you keep track of the order.', 4, 'RI.4.3', 3
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Sequence of Events', 4, '[{"type": "explain", "title": "About: Sequence of Events", "body": "Sequence is the order things happen. Signal words like first, next, then, and last help you keep track of the order."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"First Sam woke up. Next he ate breakfast. Then he walked to school.\" What did Sam do FIRST?\n\nThe correct answer is \"He woke up.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"To make a sandwich, first get the bread. Then add the filling. Last, cut it in half.\" What do you do LAST?", "choices": [{"id": "a", "label": "Cut it in half."}, {"id": "b", "label": "Get the bread."}, {"id": "c", "label": "Add the filling."}, {"id": "d", "label": "Eat the crust."}], "answer": "a", "explanation": "The correct answer is \"Cut it in half.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Sequence of Events - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "First Sam woke up. Next he ate breakfast. Then he walked to school." What did Sam do FIRST?', '[{"id": "a", "label": "He ate breakfast."}, {"id": "b", "label": "He walked to school."}, {"id": "c", "label": "He went to bed."}, {"id": "d", "label": "He woke up."}]'::jsonb, 'd', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "To make a sandwich, first get the bread. Then add the filling. Last, cut it in half." What do you do LAST?', '[{"id": "a", "label": "Cut it in half."}, {"id": "b", "label": "Get the bread."}, {"id": "c", "label": "Add the filling."}, {"id": "d", "label": "Eat the crust."}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The seed sprouted. Then it grew leaves. Finally it bloomed into a flower." What happened SECOND?', '[{"id": "a", "label": "It bloomed."}, {"id": "b", "label": "The seed sprouted."}, {"id": "c", "label": "It was picked."}, {"id": "d", "label": "It grew leaves."}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Mia drew a picture, then colored it, and finally hung it on the wall." What did Mia do right AFTER drawing?', '[{"id": "a", "label": "She colored it."}, {"id": "b", "label": "She hung it up."}, {"id": "c", "label": "She erased it."}, {"id": "d", "label": "She slept."}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "First the clouds gathered. Next it began to rain. Then a rainbow appeared." What came BEFORE the rain?', '[{"id": "a", "label": "The clouds gathered."}, {"id": "b", "label": "The rainbow."}, {"id": "c", "label": "The sun set."}, {"id": "d", "label": "The snow fell."}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Leo packed his bag, ate lunch, and then left for the trip." What did Leo do BEFORE leaving?', '[{"id": "a", "label": "He came home."}, {"id": "b", "label": "He unpacked."}, {"id": "c", "label": "He ate lunch."}, {"id": "d", "label": "He slept."}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "She mixed the batter, poured it in a pan, and baked the cake." What is the LAST step?', '[{"id": "a", "label": "Mix the batter."}, {"id": "b", "label": "Bake the cake."}, {"id": "c", "label": "Pour the batter."}, {"id": "d", "label": "Buy flour."}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The alarm rang. Then Dad got up. After that, he made coffee." What happened FIRST?', '[{"id": "a", "label": "The alarm rang."}, {"id": "b", "label": "Dad made coffee."}, {"id": "c", "label": "Dad got up."}, {"id": "d", "label": "Dad left."}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "We bought tickets, found our seats, and watched the movie." What did we do right BEFORE watching the movie?', '[{"id": "a", "label": "We bought popcorn."}, {"id": "b", "label": "We found our seats."}, {"id": "c", "label": "We went home."}, {"id": "d", "label": "We slept."}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "First you plant the seed, next you water it, then it grows." What do you do right after planting the seed? (one word)', null, 'water', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'sequence' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Cause & Effect (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'cause-and-effect', 'Cause & Effect', 'A cause is why something happens; the effect is what happens. Words like because and so often connect them.', 4, 'RI.4.3', 4
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Cause & Effect', 4, '[{"type": "explain", "title": "About: Cause & Effect", "body": "A cause is why something happens; the effect is what happens. Words like because and so often connect them."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Because it rained all day, the soccer game was canceled.\" What was the CAUSE?\n\nThe correct answer is \"It rained all day.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Tom forgot to water his plant, so it wilted.\" What was the EFFECT?", "choices": [{"id": "a", "label": "Tom watered it."}, {"id": "b", "label": "The plant grew."}, {"id": "c", "label": "Tom forgot."}, {"id": "d", "label": "The plant wilted."}], "answer": "d", "explanation": "The correct answer is \"The plant wilted.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Cause & Effect - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Because it rained all day, the soccer game was canceled." What was the CAUSE?', '[{"id": "a", "label": "The game was canceled."}, {"id": "b", "label": "The team won."}, {"id": "c", "label": "It rained all day."}, {"id": "d", "label": "The sun came out."}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Tom forgot to water his plant, so it wilted." What was the EFFECT?', '[{"id": "a", "label": "Tom watered it."}, {"id": "b", "label": "The plant grew."}, {"id": "c", "label": "Tom forgot."}, {"id": "d", "label": "The plant wilted."}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The ice melted because the day was very hot." Why did the ice melt?', '[{"id": "a", "label": "The ice was blue."}, {"id": "b", "label": "It was winter."}, {"id": "c", "label": "The freezer broke for no reason."}, {"id": "d", "label": "The day was very hot."}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "She studied hard, so she passed the test." What caused her to pass?', '[{"id": "a", "label": "The test was easy."}, {"id": "b", "label": "She was late."}, {"id": "c", "label": "She slept in class."}, {"id": "d", "label": "She studied hard."}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The dog barked loudly, so the baby woke up." What was the effect of the barking?', '[{"id": "a", "label": "The dog slept."}, {"id": "b", "label": "The baby ate."}, {"id": "c", "label": "The dog ran."}, {"id": "d", "label": "The baby woke up."}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Because the road was icy, the cars drove slowly." Why did the cars drive slowly?', '[{"id": "a", "label": "The cars were red."}, {"id": "b", "label": "It was sunny."}, {"id": "c", "label": "The road was icy."}, {"id": "d", "label": "The road was new."}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "He left the milk out, so it spoiled." What was the cause of the milk spoiling?', '[{"id": "a", "label": "The milk was cold."}, {"id": "b", "label": "The fridge was full."}, {"id": "c", "label": "He left the milk out."}, {"id": "d", "label": "He drank it."}]'::jsonb, 'c', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The wind blew hard, so the kite flew high." What made the kite fly high?', '[{"id": "a", "label": "The wind blew hard."}, {"id": "b", "label": "The kite was heavy."}, {"id": "c", "label": "It rained."}, {"id": "d", "label": "The string broke."}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Because the library was closed, we went to the park instead." What was the effect of the library being closed?', '[{"id": "a", "label": "The library opened."}, {"id": "b", "label": "They went to the park."}, {"id": "c", "label": "They read books."}, {"id": "d", "label": "They stayed home all day."}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "The fire alarm rang, so everyone left the building." What was the cause that made everyone leave? Answer with the two words: the fire ____. ', null, 'alarm', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'cause-and-effect' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Vocabulary in Context (RI.4.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'context-clues', 'Vocabulary in Context', 'When you meet a new word, use the other words around it - the context - as clues to figure out what it means.', 4, 'RI.4.4', 5
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Vocabulary in Context', 4, '[{"type": "explain", "title": "About: Vocabulary in Context", "body": "When you meet a new word, use the other words around it \u2014 the context \u2014 as clues to figure out what it means."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The path was so narrow that only one person could pass at a time.\" What does \"narrow\" mean?\n\nThe correct answer is \"not wide\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The soup was scalding, so she waited for it to cool.\" What does \"scalding\" mean?", "choices": [{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}], "answer": "a", "explanation": "The correct answer is \"very hot\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Vocabulary in Context - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The path was so narrow that only one person could pass at a time." What does "narrow" mean?', '[{"id": "a", "label": "not wide"}, {"id": "b", "label": "very tall"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "heavy"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The soup was scalding, so she waited for it to cool." What does "scalding" mean?', '[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "He was exhausted after the long run and fell asleep right away." What does "exhausted" mean?', '[{"id": "a", "label": "excited"}, {"id": "b", "label": "hungry"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "very tired"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The ancient ruins were thousands of years old." What does "ancient" mean?', '[{"id": "a", "label": "brand new"}, {"id": "b", "label": "colorful"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "very old"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The puppy was timid and hid behind the couch when strangers came." What does "timid" mean?', '[{"id": "a", "label": "loud"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "shy or fearful"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "She spoke in a faint whisper that was hard to hear." What does "faint" mean here?', '[{"id": "a", "label": "weak or soft"}, {"id": "b", "label": "very loud"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "sweet"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The enormous elephant was the biggest animal at the zoo." What does "enormous" mean?', '[{"id": "a", "label": "very small"}, {"id": "b", "label": "very fast"}, {"id": "c", "label": "very quiet"}, {"id": "d", "label": "very large"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "After the drought, the dry land had no water for months." What does "drought" mean?', '[{"id": "a", "label": "a long time with no rain"}, {"id": "b", "label": "a big flood"}, {"id": "c", "label": "a snowstorm"}, {"id": "d", "label": "a forest"}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "He was generous and shared his lunch with everyone." What does "generous" mean?', '[{"id": "a", "label": "selfish"}, {"id": "b", "label": "willing to give and share"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "mean"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "The room was vacant; nobody was inside." What does "vacant" mean? (one word, starts with e)', null, 'empty', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'context-clues' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Making Inferences (RI.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'making-inferences', 'Making Inferences', 'An inference is a smart guess based on clues in the text plus what you already know. The text hints, and you figure out the rest.', 4, 'RI.4.1', 6
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Making Inferences', 4, '[{"type": "explain", "title": "About: Making Inferences", "body": "An inference is a smart guess based on clues in the text plus what you already know. The text hints, and you figure out the rest."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Maya grabbed her umbrella and rain boots before heading out.\" What can you infer?\n\nThe correct answer is \"It is probably raining or going to rain.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Jake''s stomach growled and he kept looking at the clock near lunchtime.\" What can you infer?", "choices": [{"id": "a", "label": "Jake is sleepy."}, {"id": "b", "label": "Jake is hungry."}, {"id": "c", "label": "Jake is cold."}, {"id": "d", "label": "Jake is angry."}], "answer": "b", "explanation": "The correct answer is \"Jake is hungry.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Making Inferences - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Maya grabbed her umbrella and rain boots before heading out." What can you infer?', '[{"id": "a", "label": "It is sunny."}, {"id": "b", "label": "It is probably raining or going to rain."}, {"id": "c", "label": "She is going swimming."}, {"id": "d", "label": "It is nighttime."}]'::jsonb, 'b', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Jake''s stomach growled and he kept looking at the clock near lunchtime." What can you infer?', '[{"id": "a", "label": "Jake is sleepy."}, {"id": "b", "label": "Jake is hungry."}, {"id": "c", "label": "Jake is cold."}, {"id": "d", "label": "Jake is angry."}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The streets were empty and all the shops had their lights off." What can you infer?', '[{"id": "a", "label": "It is a busy afternoon."}, {"id": "b", "label": "There is a parade."}, {"id": "c", "label": "It is very early or very late."}, {"id": "d", "label": "It is lunchtime."}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Tia smiled wide and hugged the trophy to her chest." What can you infer?', '[{"id": "a", "label": "Tia is sad."}, {"id": "b", "label": "Tia is happy that she won."}, {"id": "c", "label": "Tia is bored."}, {"id": "d", "label": "Tia is afraid."}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The leaves were turning red and orange, and kids wore jackets to school." What season is it?', '[{"id": "a", "label": "Fall (autumn)"}, {"id": "b", "label": "Summer"}, {"id": "c", "label": "A hot day"}, {"id": "d", "label": "Spring planting"}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Ben tiptoed and whispered as he passed the baby''s room." What can you infer?', '[{"id": "a", "label": "The baby is playing."}, {"id": "b", "label": "Ben is loud."}, {"id": "c", "label": "The baby is sleeping."}, {"id": "d", "label": "It is a party."}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The dog wagged its tail and ran to the door when it heard the car." What can you infer?', '[{"id": "a", "label": "The dog is excited someone is home."}, {"id": "b", "label": "The dog is scared."}, {"id": "c", "label": "The dog is asleep."}, {"id": "d", "label": "The dog is sick."}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Sweat dripped down as the team gulped water during a break." What can you infer?', '[{"id": "a", "label": "It is hot and they have been active."}, {"id": "b", "label": "It is snowing."}, {"id": "c", "label": "They are sleeping."}, {"id": "d", "label": "They are reading."}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Grandma set out an extra plate and watched the clock by the window." What can you infer?', '[{"id": "a", "label": "She is leaving forever."}, {"id": "b", "label": "She is expecting a guest."}, {"id": "c", "label": "She broke a plate."}, {"id": "d", "label": "She is at school."}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Read: "He put on a coat, hat, and gloves before going outside." Based on the clues, the weather is most likely ____. (one word)', null, 'cold', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'making-inferences' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Author's Purpose (RI.4.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'authors-purpose', 'Author''s Purpose', 'Authors write to persuade, inform, instruct, or entertain. Ask why the author wrote this to find the purpose.', 4, 'RI.4.8', 7
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Author''s Purpose', 4, '[{"type": "explain", "title": "About: Author''s Purpose", "body": "Authors write to persuade, inform, instruct, or entertain. Ask why the author wrote this to find the purpose."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: An author writes \"10 Steps to Build a Birdhouse.\" The author''s purpose is mainly to:\n\nThe correct answer is \"instruct (teach how to do something)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A funny story about a talking dog is written mainly to:", "choices": [{"id": "a", "label": "entertain"}, {"id": "b", "label": "instruct"}, {"id": "c", "label": "sell a product"}, {"id": "d", "label": "report news"}], "answer": "a", "explanation": "The correct answer is \"entertain\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Author''s Purpose - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An author writes "10 Steps to Build a Birdhouse." The author''s purpose is mainly to:', '[{"id": "a", "label": "entertain with a story"}, {"id": "b", "label": "persuade you to vote"}, {"id": "c", "label": "tell a joke"}, {"id": "d", "label": "instruct (teach how to do something)"}]'::jsonb, 'd', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A funny story about a talking dog is written mainly to:', '[{"id": "a", "label": "entertain"}, {"id": "b", "label": "instruct"}, {"id": "c", "label": "sell a product"}, {"id": "d", "label": "report news"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An article titled "Why Our Town Needs a New Park" is written mainly to:', '[{"id": "a", "label": "entertain"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "give a recipe"}, {"id": "d", "label": "tell a fairy tale"}]'::jsonb, 'b', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A page in a science book explaining how rain forms is written mainly to:', '[{"id": "a", "label": "scare the reader"}, {"id": "b", "label": "sell toys"}, {"id": "c", "label": "make you laugh"}, {"id": "d", "label": "inform"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A poster that says "Eat more vegetables for a healthy body!" is meant to:', '[{"id": "a", "label": "report sports scores"}, {"id": "b", "label": "tell a mystery"}, {"id": "c", "label": "persuade"}, {"id": "d", "label": "teach math"}]'::jsonb, 'c', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A cookbook recipe is written mainly to:', '[{"id": "a", "label": "instruct"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "persuade"}, {"id": "d", "label": "tell news"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A made-up adventure about pirates searching for treasure is written to:', '[{"id": "a", "label": "entertain"}, {"id": "b", "label": "inform"}, {"id": "c", "label": "instruct"}, {"id": "d", "label": "persuade"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A weather report telling tomorrow''s temperatures is meant to:', '[{"id": "a", "label": "entertain"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "inform"}, {"id": "d", "label": "tell a story"}]'::jsonb, 'c', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An ad that says "Buy our shoes - they''re the best!" is written to:', '[{"id": "a", "label": "persuade"}, {"id": "b", "label": "inform only"}, {"id": "c", "label": "teach a lesson"}, {"id": "d", "label": "tell a joke"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'If an author writes mainly to teach you facts, their purpose is to ____. (one word, starts with i)', null, 'inform', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'authors-purpose' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Compare & Contrast (RI.4.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'compare-and-contrast', 'Compare & Contrast', 'Comparing tells how things are alike; contrasting tells how they are different. Words like both signal alike; but and unlike signal different.', 4, 'RI.4.3', 8
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Compare & Contrast', 4, '[{"type": "explain", "title": "About: Compare & Contrast", "body": "Comparing tells how things are alike; contrasting tells how they are different. Words like both signal alike; but and unlike signal different."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Cats and dogs are both popular pets, but cats are usually quieter and dogs like to play fetch.\" One way they are the SAME is:\n\nThe correct answer is \"both are popular pets\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"A bicycle has two wheels, while a car has four.\" This sentence shows a:", "choices": [{"id": "a", "label": "similarity"}, {"id": "b", "label": "cause"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "sequence"}], "answer": "c", "explanation": "The correct answer is \"difference\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Compare & Contrast - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Cats and dogs are both popular pets, but cats are usually quieter and dogs like to play fetch." One way they are the SAME is:', '[{"id": "a", "label": "both are popular pets"}, {"id": "b", "label": "both play fetch"}, {"id": "c", "label": "both are quiet"}, {"id": "d", "label": "both bark"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "A bicycle has two wheels, while a car has four." This sentence shows a:', '[{"id": "a", "label": "similarity"}, {"id": "b", "label": "cause"}, {"id": "c", "label": "difference"}, {"id": "d", "label": "sequence"}]'::jsonb, 'c', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Both apples and oranges are fruits that grow on trees." The word that signals they are alike is:', '[{"id": "a", "label": "both"}, {"id": "b", "label": "but"}, {"id": "c", "label": "while"}, {"id": "d", "label": "unlike"}]'::jsonb, 'a', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Summer is hot, but winter is cold." This compares the two seasons by their:', '[{"id": "a", "label": "temperature"}, {"id": "b", "label": "color"}, {"id": "c", "label": "size"}, {"id": "d", "label": "name"}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Unlike a frog, a fish cannot live out of water." The word "unlike" signals a:', '[{"id": "a", "label": "difference"}, {"id": "b", "label": "similarity"}, {"id": "c", "label": "sequence"}, {"id": "d", "label": "cause"}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "A pencil and a pen are both used for writing, but a pencil can be erased." How are they DIFFERENT?', '[{"id": "a", "label": "a pencil can be erased"}, {"id": "b", "label": "both write"}, {"id": "c", "label": "both are tools"}, {"id": "d", "label": "both are long"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "Birds and bats can both fly, but birds have feathers and bats have fur." A similarity is that both:', '[{"id": "a", "label": "can fly"}, {"id": "b", "label": "have feathers"}, {"id": "c", "label": "have fur"}, {"id": "d", "label": "swim"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Read: "The city is busy and loud, while the countryside is calm and quiet." This contrasts the two places by their:', '[{"id": "a", "label": "color"}, {"id": "b", "label": "noise level"}, {"id": "c", "label": "spelling"}, {"id": "d", "label": "price"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word best signals a contrast (difference)?', '[{"id": "a", "label": "also"}, {"id": "b", "label": "both"}, {"id": "c", "label": "similarly"}, {"id": "d", "label": "however"}]'::jsonb, 'd', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'The word "both" usually signals that two things are ____ (alike or different?). ', null, 'alike', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'compare-and-contrast' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Fact vs. Opinion (RI.4.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'fact-and-opinion', 'Fact vs. Opinion', 'A fact can be proven true. An opinion tells what someone feels or believes and can''t be proven. Words like best or favorite often signal opinions.', 4, 'RI.4.8', 9
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Fact vs. Opinion', 4, '[{"type": "explain", "title": "About: Fact vs. Opinion", "body": "A fact can be proven true. An opinion tells what someone feels or believes and can''t be proven. Words like best or favorite often signal opinions."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence is a FACT?\n\nThe correct answer is \"Water freezes at 0 degrees Celsius.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence is an OPINION?", "choices": [{"id": "a", "label": "Recess is the most fun part of the day."}, {"id": "b", "label": "A week has seven days."}, {"id": "c", "label": "The Sun is a star."}, {"id": "d", "label": "Spiders have eight legs."}], "answer": "a", "explanation": "The correct answer is \"Recess is the most fun part of the day.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Fact vs. Opinion - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence is a FACT?', '[{"id": "a", "label": "Water freezes at 0 degrees Celsius."}, {"id": "b", "label": "Winter is the best season."}, {"id": "c", "label": "Pizza tastes amazing."}, {"id": "d", "label": "Blue is the prettiest color."}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence is an OPINION?', '[{"id": "a", "label": "Recess is the most fun part of the day."}, {"id": "b", "label": "A week has seven days."}, {"id": "c", "label": "The Sun is a star."}, {"id": "d", "label": "Spiders have eight legs."}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is a FACT?', '[{"id": "a", "label": "Math is boring."}, {"id": "b", "label": "Dogs are better than cats."}, {"id": "c", "label": "A triangle has three sides."}, {"id": "d", "label": "Summer is too hot."}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is an OPINION?', '[{"id": "a", "label": "Chocolate ice cream is the best flavor."}, {"id": "b", "label": "Ice melts when heated."}, {"id": "c", "label": "There are 12 months in a year."}, {"id": "d", "label": "Plants need sunlight."}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', '"Our school has 400 students." This statement is a:', '[{"id": "a", "label": "opinion"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "question"}, {"id": "d", "label": "story"}]'::jsonb, 'b', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', '"Reading is more fun than watching TV." This statement is an:', '[{"id": "a", "label": "fact"}, {"id": "b", "label": "math problem"}, {"id": "c", "label": "opinion"}, {"id": "d", "label": "rule"}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which can be checked to see if it is true (a fact)?', '[{"id": "a", "label": "Mondays are terrible."}, {"id": "b", "label": "The library opens at 9 a.m."}, {"id": "c", "label": "This book is the best ever."}, {"id": "d", "label": "Green is a happy color."}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word often signals an opinion?', '[{"id": "a", "label": "measured"}, {"id": "b", "label": "best"}, {"id": "c", "label": "equals"}, {"id": "d", "label": "contains"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which is a FACT?', '[{"id": "a", "label": "Elephants are cute."}, {"id": "b", "label": "Zoos are boring."}, {"id": "c", "label": "Elephants are the largest land animals."}, {"id": "d", "label": "Lions are scary."}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'A statement that tells what someone feels or believes, and can''t be proven true, is called an ____. (one word)', null, 'opinion', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'fact-and-opinion' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [reading] Synonyms & Antonyms (L.4.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'synonyms-and-antonyms', 'Synonyms & Antonyms', 'Synonyms are words that mean almost the same thing. Antonyms are words that mean the opposite.', 4, 'L.4.5', 10
from public.subjects s where s.slug = 'reading'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Synonyms & Antonyms', 4, '[{"type": "explain", "title": "About: Synonyms & Antonyms", "body": "Synonyms are words that mean almost the same thing. Antonyms are words that mean the opposite."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a SYNONYM (same meaning) for \"happy\"?\n\nThe correct answer is \"glad\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an ANTONYM (opposite) of \"big\"?", "choices": [{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "small"}, {"id": "d", "label": "giant"}], "answer": "c", "explanation": "The correct answer is \"small\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Synonyms & Antonyms - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a SYNONYM (same meaning) for "happy"?', '[{"id": "a", "label": "glad"}, {"id": "b", "label": "sad"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "tired"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an ANTONYM (opposite) of "big"?', '[{"id": "a", "label": "large"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "small"}, {"id": "d", "label": "giant"}]'::jsonb, 'c', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word means almost the same as "fast"?', '[{"id": "a", "label": "slow"}, {"id": "b", "label": "quick"}, {"id": "c", "label": "late"}, {"id": "d", "label": "still"}]'::jsonb, 'b', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is the opposite of "hot"?', '[{"id": "a", "label": "warm"}, {"id": "b", "label": "cold"}, {"id": "c", "label": "boiling"}, {"id": "d", "label": "sunny"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A synonym for "begin" is:', '[{"id": "a", "label": "stop"}, {"id": "b", "label": "end"}, {"id": "c", "label": "finish"}, {"id": "d", "label": "start"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'An antonym for "empty" is:', '[{"id": "a", "label": "bare"}, {"id": "b", "label": "hollow"}, {"id": "c", "label": "vacant"}, {"id": "d", "label": "full"}]'::jsonb, 'd', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word means the same as "smart"?', '[{"id": "a", "label": "silly"}, {"id": "b", "label": "clever"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "lazy"}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'The opposite of "day" is:', '[{"id": "a", "label": "night"}, {"id": "b", "label": "noon"}, {"id": "c", "label": "morning"}, {"id": "d", "label": "sunrise"}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'A synonym for "tired" is:', '[{"id": "a", "label": "sleepy"}, {"id": "b", "label": "awake"}, {"id": "c", "label": "alert"}, {"id": "d", "label": "lively"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write a one-word ANTONYM (opposite) of "up". ', null, 'down', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'reading' and t.slug = 'synonyms-and-antonyms' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Nouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'nouns', 'Nouns', 'A noun names a person, place, thing, or idea. Common nouns are general (city); proper nouns name a specific one (Paris).', 4, 'L.4.1', 1
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Nouns', 4, '[{"type": "explain", "title": "About: Nouns", "body": "A noun names a person, place, thing, or idea. Common nouns are general (city); proper nouns name a specific one (Paris)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a noun (a person, place, or thing)?\n\nThe correct answer is \"river\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "narrow"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "pencil"}], "answer": "d", "explanation": "The correct answer is \"pencil\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Nouns - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "river"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "stormy"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "narrow"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "pencil"}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "farmer"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "bounce"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "slippery"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "ancient"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "sister"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "stretch"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "window"}, {"id": "d", "label": "gentle"}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "paint"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "enormous"}]'::jsonb, 'c', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "puppy"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "jump"}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "whisper"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "discover"}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a noun (a person, place, or thing)?', '[{"id": "a", "label": "curious"}, {"id": "b", "label": "march"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "village"}]'::jsonb, 'd', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Action Verbs (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'action-verbs', 'Action Verbs', 'A verb shows action or a state of being. Action verbs tell what the subject does, like run, jump, or think.', 4, 'L.4.1', 2
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Action Verbs', 4, '[{"type": "explain", "title": "About: Action Verbs", "body": "A verb shows action or a state of being. Action verbs tell what the subject does, like run, jump, or think."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an action verb (something you can do)?\n\nThe correct answer is \"build\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "river"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "explore"}], "answer": "d", "explanation": "The correct answer is \"explore\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Action Verbs - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "tiny"}, {"id": "b", "label": "build"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "doctor"}]'::jsonb, 'b', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "river"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "explore"}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "window"}, {"id": "b", "label": "library"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "cheerful"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "narrow"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "kitchen"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "ancient"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "shout"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "bounce"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "river"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "enormous"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "teacher"}]'::jsonb, 'b', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "blanket"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "march"}, {"id": "d", "label": "teacher"}]'::jsonb, 'c', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "stormy"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "river"}, {"id": "d", "label": "window"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an action verb (something you can do)?', '[{"id": "a", "label": "village"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "island"}, {"id": "d", "label": "jump"}]'::jsonb, 'd', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'action-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Adjectives (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'adjectives', 'Adjectives', 'An adjective describes a noun - telling what kind, how many, or which one, like shiny, three, or that.', 4, 'L.4.1', 3
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Adjectives', 4, '[{"type": "explain", "title": "About: Adjectives", "body": "An adjective describes a noun \u2014 telling what kind, how many, or which one, like shiny, three, or that."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an adjective (it describes a noun)?\n\nThe correct answer is \"slippery\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "ancient"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "paint"}], "answer": "a", "explanation": "The correct answer is \"ancient\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Adjectives - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "slippery"}, {"id": "b", "label": "build"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "garden"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "ancient"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "paint"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "island"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "stretch"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "discover"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "stormy"}, {"id": "b", "label": "build"}, {"id": "c", "label": "island"}, {"id": "d", "label": "explore"}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "frozen"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "march"}, {"id": "d", "label": "build"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "sister"}, {"id": "b", "label": "march"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "blanket"}]'::jsonb, 'c', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "tiny"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "paint"}]'::jsonb, 'a', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "gentle"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "bounce"}]'::jsonb, 'a', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is an adjective (it describes a noun)?', '[{"id": "a", "label": "island"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "brave"}]'::jsonb, 'd', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'adjectives' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Pronouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'pronouns', 'Pronouns', 'A pronoun takes the place of a noun so we don''t repeat it, like he, she, it, we, or they.', 4, 'L.4.1', 4
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Pronouns', 4, '[{"type": "explain", "title": "About: Pronouns", "body": "A pronoun takes the place of a noun so we don''t repeat it, like he, she, it, we, or they."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a pronoun (it takes the place of a noun)?\n\nThe correct answer is \"I\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "wander"}], "answer": "c", "explanation": "The correct answer is \"her\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Pronouns - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "window"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "I"}]'::jsonb, 'd', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "build"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "wander"}]'::jsonb, 'c', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "engine"}, {"id": "b", "label": "us"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "scribble"}]'::jsonb, 'b', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "we"}, {"id": "b", "label": "library"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "forest"}]'::jsonb, 'a', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "you"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "explore"}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "them"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "kitchen"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "it"}, {"id": "b", "label": "march"}, {"id": "c", "label": "build"}, {"id": "d", "label": "river"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "island"}, {"id": "b", "label": "him"}, {"id": "c", "label": "library"}, {"id": "d", "label": "swim"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "sister"}, {"id": "b", "label": "she"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "village"}]'::jsonb, 'b', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word is a pronoun (it takes the place of a noun)?', '[{"id": "a", "label": "march"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "they"}]'::jsonb, 'd', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'pronouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Subject-Verb Agreement (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'subject-verb-agreement', 'Subject-Verb Agreement', 'The verb must match the subject. A singular subject usually takes a verb ending in -s (The dog runs); a plural subject does not (The dogs run).', 4, 'L.4.1', 5
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Subject-Verb Agreement', 4, '[{"type": "explain", "title": "About: Subject-Verb Agreement", "body": "The verb must match the subject. A singular subject usually takes a verb ending in -s (The dog runs); a plural subject does not (The dogs run)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Choose the correct verb: \"The bird ____ every day.\"\n\nThe correct answer is \"sings\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The teacher ____ every day.\"", "choices": [{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}], "answer": "a", "explanation": "The correct answer is \"writes\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Subject-Verb Agreement - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The bird ____ every day."', '[{"id": "a", "label": "sings"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The teacher ____ every day."', '[{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}]'::jsonb, 'a', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The river ____ every day."', '[{"id": "a", "label": "flow"}, {"id": "b", "label": "flowsed"}, {"id": "c", "label": "flows"}, {"id": "d", "label": "flowsing"}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The clock ____ every day."', '[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticks"}, {"id": "c", "label": "ticksed"}, {"id": "d", "label": "ticksing"}]'::jsonb, 'b', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The boy ____ every day."', '[{"id": "a", "label": "play"}, {"id": "b", "label": "playsed"}, {"id": "c", "label": "playsing"}, {"id": "d", "label": "plays"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The dog ____ every day."', '[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barksing"}, {"id": "d", "label": "barks"}]'::jsonb, 'd', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The cat ____ every day."', '[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The flower ____ every day."', '[{"id": "a", "label": "grow"}, {"id": "b", "label": "grows"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]'::jsonb, 'b', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The girl ____ every day."', '[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Choose the correct verb: "The baby ____ every day."', '[{"id": "a", "label": "cries"}, {"id": "b", "label": "crie"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]'::jsonb, 'a', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'subject-verb-agreement' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Past-Tense Verbs (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'past-tense-verbs', 'Past-Tense Verbs', 'Past-tense verbs tell about something that already happened. Many add -ed, but some are irregular (go becomes went).', 4, 'L.4.1', 6
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Past-Tense Verbs', 4, '[{"type": "explain", "title": "About: Past-Tense Verbs", "body": "Past-tense verbs tell about something that already happened. Many add -ed, but some are irregular (go becomes went)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the past tense of the verb \"make\"?\n\nThe answer is made."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Past-Tense Verbs - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "make"?', null, 'made', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "ride"?', null, 'rode', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "begin"?', null, 'began', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "give"?', null, 'gave', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "draw"?', null, 'drew', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "go"?', null, 'went', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "write"?', null, 'wrote', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "run"?', null, 'ran', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "see"?', null, 'saw', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'What is the past tense of the verb "fly"?', null, 'flew', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'past-tense-verbs' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Plural Nouns (L.4.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'plural-nouns', 'Plural Nouns', 'Plurals mean more than one. Add -s or -es, change y to -ies after a consonant, and change some f endings to -ves.', 4, 'L.4.1', 7
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Plural Nouns', 4, '[{"type": "explain", "title": "About: Plural Nouns", "body": "Plurals mean more than one. Add -s or -es, change y to -ies after a consonant, and change some f endings to -ves."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Write the plural of \"story\".\n\nThe answer is stories."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Plural Nouns - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "story".', null, 'stories', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "shelf".', null, 'shelves', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "brush".', null, 'brushes', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "leaf".', null, 'leaves', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "bus".', null, 'buses', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "berry".', null, 'berries', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "wolf".', null, 'wolves', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "city".', null, 'cities', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "baby".', null, 'babies', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'fill_in', 'Write the plural of "knife".', null, 'knives', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'plural-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Capitalization (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'capitalization-proper-nouns', 'Capitalization', 'Capitalize the first word of a sentence, the word I, and proper nouns like names of people, places, days, and months.', 4, 'L.4.2', 8
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Capitalization', 4, '[{"type": "explain", "title": "About: Capitalization", "body": "Capitalize the first word of a sentence, the word I, and proper nouns like names of people, places, days, and months."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word or phrase is a proper noun that must be capitalized?\n\nThe correct answer is \"Africa\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "country"}, {"id": "b", "label": "India"}, {"id": "c", "label": "day"}, {"id": "d", "label": "ocean"}], "answer": "b", "explanation": "The correct answer is \"India\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Capitalization - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "Africa"}, {"id": "b", "label": "river"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]'::jsonb, 'a', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "country"}, {"id": "b", "label": "India"}, {"id": "c", "label": "day"}, {"id": "d", "label": "ocean"}]'::jsonb, 'b', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "mountain"}, {"id": "b", "label": "day"}, {"id": "c", "label": "country"}, {"id": "d", "label": "London"}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "day"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Pacific Ocean"}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "river"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "city"}, {"id": "d", "label": "New York"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "Monday"}, {"id": "b", "label": "country"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "Amazon River"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "country"}, {"id": "d", "label": "river"}]'::jsonb, 'a', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "mountain"}, {"id": "b", "label": "city"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "December"}]'::jsonb, 'd', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "city"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Tuesday"}]'::jsonb, 'd', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which word or phrase is a proper noun that must be capitalized?', '[{"id": "a", "label": "country"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "Mount Everest"}, {"id": "d", "label": "month"}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'capitalization-proper-nouns' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] End Punctuation (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'end-punctuation', 'End Punctuation', 'End a telling sentence with a period, a question with a question mark, and an excited or strong sentence with an exclamation point.', 4, 'L.4.2', 9
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: End Punctuation', 4, '[{"type": "explain", "title": "About: End Punctuation", "body": "End a telling sentence with a period, a question with a question mark, and an excited or strong sentence with an exclamation point."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which end mark best completes the sentence?  \"What time is it___\"\n\nThe correct answer is \"?\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"That is amazing___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}], "answer": "d", "explanation": "The correct answer is \"!\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'End Punctuation - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "What time is it___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "That is amazing___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "Where are we going___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]'::jsonb, 'c', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "I love to read___"', '[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "Are you ready___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]'::jsonb, 'd', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "We had lunch___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]'::jsonb, 'a', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "How does it work___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "Stop right now___"', '[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]'::jsonb, 'd', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "The sky is blue___"', '[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]'::jsonb, 'c', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which end mark best completes the sentence?  "Watch out___"', '[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]'::jsonb, 'a', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'end-punctuation' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

-- ---- [writing] Commas in a Series (L.4.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, 'commas-in-a-series', 'Commas in a Series', 'When you list three or more things, separate them with commas and put ''and'' before the last item: apples, oranges, and pears.', 4, 'L.4.2', 10
from public.subjects s where s.slug = 'writing'
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, 'Learn: Commas in a Series', 4, '[{"type": "explain", "title": "About: Commas in a Series", "body": "When you list three or more things, separate them with commas and put ''and'' before the last item: apples, oranges, and pears."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence uses commas correctly in a list?\n\nThe correct answer is \"I like milk, eggs, and bread.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}], "answer": "d", "explanation": "The correct answer is \"I like pencils, pens, and markers.\"."}]'::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, 'Commas in a Series - Practice', 4, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.worksheets w where w.topic_id = t.id);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs and bread"}, {"id": "c", "label": "I like milk, eggs, and bread."}, {"id": "d", "label": "I like, milk eggs bread."}]'::jsonb, 'c', 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}]'::jsonb, 'd', 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like, Mom Dad Grandma."}, {"id": "d", "label": "I like Mom, Dad, and Grandma."}]'::jsonb, 'd', 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like, apples oranges pears."}, {"id": "d", "label": "I like apples, oranges, and pears."}]'::jsonb, 'd', 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like spring, summer, and fall."}, {"id": "b", "label": "I like spring summer and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]'::jsonb, 'a', 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like cats, dogs, and fish."}, {"id": "d", "label": "I like, cats dogs fish."}]'::jsonb, 'c', 10, 5
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 5);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump and swim"}, {"id": "c", "label": "I like, run jump swim."}, {"id": "d", "label": "I like run, jump, and swim."}]'::jsonb, 'd', 10, 6
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 6);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like, red green blue."}, {"id": "d", "label": "I like red, green, and blue."}]'::jsonb, 'd', 10, 7
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 7);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes and buses"}, {"id": "c", "label": "I like, trains planes buses."}, {"id": "d", "label": "I like trains, planes, and buses."}]'::jsonb, 'd', 10, 8
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 8);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 4, 'mcq', 'Which sentence uses commas correctly in a list?', '[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis and golf"}, {"id": "c", "label": "I like soccer, tennis, and golf."}, {"id": "d", "label": "I like, soccer tennis golf."}]'::jsonb, 'c', 10, 9
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = 'writing' and t.slug = 'commas-in-a-series' and t.grade_level = 4
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 9);

