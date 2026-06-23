-- =====================================================================
-- TopicLeap - Grade 5 full curriculum seed (generated)
-- Lessons + worksheets of 5 questions each.
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

-- ---- [math] Multi-Digit Multiplication (5.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multi-digit-multiplication$tl$, $tl$Multi-Digit Multiplication$tl$, $tl$Multiply larger numbers by breaking them into place values. Worksheets get harder as the numbers grow.$tl$, 5, $tl$5.NBT.B.5$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multi-Digit Multiplication$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Multi-Digit Multiplication", "body": "Multiply larger numbers by breaking them into place values. Worksheets get harder as the numbers grow."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Multiply: 19 x 5 = ?\n\nThe answer is \"95\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Multiply: 30 x 6 = ?\n\nThe answer is \"180\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Multiply: 12 x 4 = ?\n\nThe answer is \"48\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Multiply: 836 x 9 = ?\n\nThe answer is 7524."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Multiply: 587 x 3 = ?\n\nThe answer is 1761."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Multiply: 357 x 5 = ?\n\nThe answer is 1785."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Multi-Digit Multiplication! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 36 x 5 = ?$tl$, null, $tl$180$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 95 x 6 = ?$tl$, null, $tl$570$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 53 x 2 = ?$tl$, null, $tl$106$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 13 x 7 = ?$tl$, null, $tl$91$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 56 x 2 = ?$tl$, null, $tl$112$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 582 x 8 = ?$tl$, null, $tl$4656$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 997 x 7 = ?$tl$, null, $tl$6979$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 502 x 5 = ?$tl$, null, $tl$2510$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 539 x 2 = ?$tl$, null, $tl$1078$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 867 x 2 = ?$tl$, null, $tl$1734$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 14 x 89 = ?$tl$, null, $tl$1246$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 74 x 27 = ?$tl$, null, $tl$1998$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 89 x 95 = ?$tl$, null, $tl$8455$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 35 x 71 = ?$tl$, null, $tl$2485$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 38 x 11 = ?$tl$, null, $tl$418$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 690 x 46 = ?$tl$, null, $tl$31740$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 105 x 57 = ?$tl$, null, $tl$5985$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 914 x 48 = ?$tl$, null, $tl$43872$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 257 x 55 = ?$tl$, null, $tl$14135$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Multiply: 803 x 15 = ?$tl$, null, $tl$12045$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multi-digit-multiplication$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Long Division (5.NBT.B.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$long-division$tl$, $tl$Long Division$tl$, $tl$Divide larger numbers into equal groups. Each worksheet uses bigger numbers than the last.$tl$, 5, $tl$5.NBT.B.6$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Long Division$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Long Division", "body": "Divide larger numbers into equal groups. Each worksheet uses bigger numbers than the last."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Divide: 18 / 2 = ?\n\nThe answer is \"9\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Divide: 24 / 3 = ?\n\nThe answer is \"8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Divide: 12 / 3 = ?\n\nThe answer is \"4\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Divide: 75 / 5 = ?\n\nThe answer is 15."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Divide: 48 / 2 = ?\n\nThe answer is 24."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Divide: 42 / 3 = ?\n\nThe answer is 14."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Long Division! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 27 / 3 = ?$tl$, null, $tl$9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 49 / 7 = ?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 48 / 6 = ?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 12 / 4 = ?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 27 / 9 = ?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 72 / 2 = ?$tl$, null, $tl$36$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 70 / 2 = ?$tl$, null, $tl$35$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 64 / 4 = ?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 258 / 6 = ?$tl$, null, $tl$43$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 282 / 6 = ?$tl$, null, $tl$47$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 225 / 15 = ?$tl$, null, $tl$15$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 399 / 19 = ?$tl$, null, $tl$21$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 210 / 15 = ?$tl$, null, $tl$14$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 112 / 14 = ?$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 714 / 21 = ?$tl$, null, $tl$34$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 364 / 14 = ?$tl$, null, $tl$26$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 2320 / 29 = ?$tl$, null, $tl$80$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 588 / 14 = ?$tl$, null, $tl$42$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 920 / 23 = ?$tl$, null, $tl$40$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Divide: 1479 / 17 = ?$tl$, null, $tl$87$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$long-division$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Decimal Place Value (5.NBT.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$decimal-place-value$tl$, $tl$Decimal Place Value$tl$, $tl$Each digit after the decimal point has a smaller place value: tenths, hundredths, thousandths.$tl$, 5, $tl$5.NBT.A.3$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Decimal Place Value$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Decimal Place Value", "body": "Each digit after the decimal point has a smaller place value: tenths, hundredths, thousandths."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the value of the digit 2 in 8.2?\n\nThe answer is \"0.2\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the value of the digit 3 in 3.4?\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the value of the digit 2 in 2.8?\n\nThe answer is \"2\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "What is the value of the digit 8 in 1.8?", "choices": [{"id": "a", "label": "80"}, {"id": "b", "label": "0.8"}, {"id": "c", "label": "8"}, {"id": "d", "label": "0.08"}], "answer": "b", "explanation": "Yes! The answer is \"0.8\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "What is the value of the digit 4 in 3.4?", "choices": [{"id": "a", "label": "0.04"}, {"id": "b", "label": "40"}, {"id": "c", "label": "4"}, {"id": "d", "label": "0.4"}], "answer": "d", "explanation": "Yes! The answer is \"0.4\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "What is the value of the digit 1 in 1.14?", "choices": [{"id": "a", "label": "0.1"}, {"id": "b", "label": "10"}, {"id": "c", "label": "1"}, {"id": "d", "label": "2"}], "answer": "c", "explanation": "Yes! The answer is \"1\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Decimal Place Value! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 6 in 6.7?$tl$, $tl$[{"id": "a", "label": "60"}, {"id": "b", "label": "1"}, {"id": "c", "label": "6"}, {"id": "d", "label": "0.6"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 8.8?$tl$, $tl$[{"id": "a", "label": "0.08"}, {"id": "b", "label": "8"}, {"id": "c", "label": "0.8"}, {"id": "d", "label": "80"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 7 in 4.7?$tl$, $tl$[{"id": "a", "label": "70"}, {"id": "b", "label": "7"}, {"id": "c", "label": "0.07"}, {"id": "d", "label": "0.7"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 1 in 1.6?$tl$, $tl$[{"id": "a", "label": "0.1"}, {"id": "b", "label": "10"}, {"id": "c", "label": "2"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 4 in 4.5?$tl$, $tl$[{"id": "a", "label": "40"}, {"id": "b", "label": "0.4"}, {"id": "c", "label": "4"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 2 in 6.62?$tl$, $tl$[{"id": "a", "label": "20"}, {"id": "b", "label": "0.02"}, {"id": "c", "label": "0.002"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 5 in 5.45?$tl$, $tl$[{"id": "a", "label": "50"}, {"id": "b", "label": "5"}, {"id": "c", "label": "0.5"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 6 in 4.63?$tl$, $tl$[{"id": "a", "label": "0.06"}, {"id": "b", "label": "6"}, {"id": "c", "label": "60"}, {"id": "d", "label": "0.6"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 4 in 4.07?$tl$, $tl$[{"id": "a", "label": "0.4"}, {"id": "b", "label": "1"}, {"id": "c", "label": "4"}, {"id": "d", "label": "40"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 9 in 3.94?$tl$, $tl$[{"id": "a", "label": "90"}, {"id": "b", "label": "0.9"}, {"id": "c", "label": "9"}, {"id": "d", "label": "0.09"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 81.02?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "800"}, {"id": "c", "label": "80"}, {"id": "d", "label": "8"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 7 in 91.74?$tl$, $tl$[{"id": "a", "label": "70"}, {"id": "b", "label": "0.7"}, {"id": "c", "label": "7"}, {"id": "d", "label": "0.07"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 21.68?$tl$, $tl$[{"id": "a", "label": "0.8"}, {"id": "b", "label": "8"}, {"id": "c", "label": "0.008"}, {"id": "d", "label": "0.08"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 5 in 57.93?$tl$, $tl$[{"id": "a", "label": "500"}, {"id": "b", "label": "1"}, {"id": "c", "label": "50"}, {"id": "d", "label": "5"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 11.98?$tl$, $tl$[{"id": "a", "label": "80"}, {"id": "b", "label": "8"}, {"id": "c", "label": "0.08"}, {"id": "d", "label": "0.8"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 9 in 969.057?$tl$, $tl$[{"id": "a", "label": "900"}, {"id": "b", "label": "90"}, {"id": "c", "label": "9"}, {"id": "d", "label": "9000"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 818.667?$tl$, $tl$[{"id": "a", "label": "80"}, {"id": "b", "label": "8"}, {"id": "c", "label": "800"}, {"id": "d", "label": "8000"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 8 in 647.862?$tl$, $tl$[{"id": "a", "label": "0.8"}, {"id": "b", "label": "80"}, {"id": "c", "label": "0.08"}, {"id": "d", "label": "8"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 9 in 529.228?$tl$, $tl$[{"id": "a", "label": "90"}, {"id": "b", "label": "1"}, {"id": "c", "label": "9"}, {"id": "d", "label": "0.9"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What is the value of the digit 4 in 406.820?$tl$, $tl$[{"id": "a", "label": "4"}, {"id": "b", "label": "4000"}, {"id": "c", "label": "400"}, {"id": "d", "label": "40"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-place-value$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Add & Subtract Decimals (5.NBT.B.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$add-subtract-decimals$tl$, $tl$Add & Subtract Decimals$tl$, $tl$Line up the decimal points, then add or subtract just like whole numbers.$tl$, 5, $tl$5.NBT.B.7$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Add & Subtract Decimals$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Add & Subtract Decimals", "body": "Line up the decimal points, then add or subtract just like whole numbers."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  0.1 + 1.2 = ?\n\nThe answer is \"1.3\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  2.5 + 0.3 = ?\n\nThe answer is \"2.8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  2 + 0.6 = ?\n\nThe answer is \"2.6\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "0.4 + 0.7 = ?", "choices": [{"id": "a", "label": "1.1"}, {"id": "b", "label": "1.2"}, {"id": "c", "label": "0.4"}, {"id": "d", "label": "1"}], "answer": "a", "explanation": "Yes! The answer is \"1.1\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "2.2 + 2.1 = ?", "choices": [{"id": "a", "label": "4.2"}, {"id": "b", "label": "4.4"}, {"id": "c", "label": "2.2"}, {"id": "d", "label": "4.3"}], "answer": "d", "explanation": "Yes! The answer is \"4.3\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "6.6 + 3.8 = ?", "choices": [{"id": "a", "label": "6.6"}, {"id": "b", "label": "10.3"}, {"id": "c", "label": "10.4"}, {"id": "d", "label": "10.5"}], "answer": "c", "explanation": "Yes! The answer is \"10.4\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Add & Subtract Decimals! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.9 + 2.2 = ?$tl$, $tl$[{"id": "a", "label": "3.1"}, {"id": "b", "label": "3.2"}, {"id": "c", "label": "3"}, {"id": "d", "label": "0.9"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1.7 + 0.3 = ?$tl$, $tl$[{"id": "a", "label": "1.9"}, {"id": "b", "label": "2.1"}, {"id": "c", "label": "2"}, {"id": "d", "label": "1.7"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1.3 + 1.5 = ?$tl$, $tl$[{"id": "a", "label": "2.8"}, {"id": "b", "label": "1.3"}, {"id": "c", "label": "2.7"}, {"id": "d", "label": "2.9"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.4 + 1.2 = ?$tl$, $tl$[{"id": "a", "label": "1.6"}, {"id": "b", "label": "1.5"}, {"id": "c", "label": "1.7"}, {"id": "d", "label": "0.4"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.2 + 1.3 = ?$tl$, $tl$[{"id": "a", "label": "0.2"}, {"id": "b", "label": "1.6"}, {"id": "c", "label": "1.4"}, {"id": "d", "label": "1.5"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$7 + 2.2 = ?$tl$, $tl$[{"id": "a", "label": "9.1"}, {"id": "b", "label": "9.2"}, {"id": "c", "label": "7"}, {"id": "d", "label": "9.3"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1.8 + 7.1 = ?$tl$, $tl$[{"id": "a", "label": "1.8"}, {"id": "b", "label": "9"}, {"id": "c", "label": "8.9"}, {"id": "d", "label": "8.8"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1.6 + 4.3 = ?$tl$, $tl$[{"id": "a", "label": "5.9"}, {"id": "b", "label": "5.8"}, {"id": "c", "label": "6"}, {"id": "d", "label": "1.6"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.8 + 6.8 = ?$tl$, $tl$[{"id": "a", "label": "7.6"}, {"id": "b", "label": "7.7"}, {"id": "c", "label": "0.8"}, {"id": "d", "label": "7.5"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2.1 + 3.3 = ?$tl$, $tl$[{"id": "a", "label": "5.5"}, {"id": "b", "label": "5.4"}, {"id": "c", "label": "2.1"}, {"id": "d", "label": "5.3"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$5.75 - 4.81 = ?$tl$, $tl$[{"id": "a", "label": "0.95"}, {"id": "b", "label": "0.94"}, {"id": "c", "label": "5.75"}, {"id": "d", "label": "0.84"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$6.04 + 0.32 = ?$tl$, $tl$[{"id": "a", "label": "6.37"}, {"id": "b", "label": "6.36"}, {"id": "c", "label": "6.04"}, {"id": "d", "label": "6.46"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2.16 + 0.78 = ?$tl$, $tl$[{"id": "a", "label": "2.16"}, {"id": "b", "label": "3.04"}, {"id": "c", "label": "2.94"}, {"id": "d", "label": "2.84"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.66 + 1.84 = ?$tl$, $tl$[{"id": "a", "label": "0.66"}, {"id": "b", "label": "2.51"}, {"id": "c", "label": "2.4"}, {"id": "d", "label": "2.5"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.02 + 6.46 = ?$tl$, $tl$[{"id": "a", "label": "6.49"}, {"id": "b", "label": "6.38"}, {"id": "c", "label": "6.58"}, {"id": "d", "label": "6.48"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$19.33 + 7.64 = ?$tl$, $tl$[{"id": "a", "label": "26.98"}, {"id": "b", "label": "26.87"}, {"id": "c", "label": "19.33"}, {"id": "d", "label": "26.97"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3.89 + 20.95 = ?$tl$, $tl$[{"id": "a", "label": "24.84"}, {"id": "b", "label": "24.74"}, {"id": "c", "label": "3.89"}, {"id": "d", "label": "24.94"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$16.28 - 10.84 = ?$tl$, $tl$[{"id": "a", "label": "16.28"}, {"id": "b", "label": "5.45"}, {"id": "c", "label": "5.34"}, {"id": "d", "label": "5.44"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$16.58 - 7.26 = ?$tl$, $tl$[{"id": "a", "label": "9.32"}, {"id": "b", "label": "9.33"}, {"id": "c", "label": "9.22"}, {"id": "d", "label": "9.42"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$27.13 - 25.03 = ?$tl$, $tl$[{"id": "a", "label": "2.2"}, {"id": "b", "label": "2.11"}, {"id": "c", "label": "27.13"}, {"id": "d", "label": "2.1"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Multiply Decimals (5.NBT.B.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiply-decimals$tl$, $tl$Multiply Decimals$tl$, $tl$Multiply the digits, then place the decimal point by counting decimal places.$tl$, 5, $tl$5.NBT.B.7$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiply Decimals$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Multiply Decimals", "body": "Multiply the digits, then place the decimal point by counting decimal places."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  0.4 x 0.8 = ?\n\nThe answer is \"0.32\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  0.3 x 0.3 = ?\n\nThe answer is \"0.09\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  0.3 x 0.3 = ?\n\nThe answer is \"0.09\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "0.4 x 0.9 = ?", "choices": [{"id": "a", "label": "0.36"}, {"id": "b", "label": "36"}, {"id": "c", "label": "3.6"}, {"id": "d", "label": "0.036"}], "answer": "a", "explanation": "Yes! The answer is \"0.36\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "0.1 x 0.7 = ?", "choices": [{"id": "a", "label": "0.007"}, {"id": "b", "label": "0.7"}, {"id": "c", "label": "0.07"}, {"id": "d", "label": "0.17"}], "answer": "c", "explanation": "Yes! The answer is \"0.07\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "0.5 x 0.04 = ?", "choices": [{"id": "a", "label": "0.12"}, {"id": "b", "label": "0.02"}, {"id": "c", "label": "2"}, {"id": "d", "label": "0.002"}], "answer": "b", "explanation": "Yes! The answer is \"0.02\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Multiply Decimals! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.9 x 0.7 = ?$tl$, $tl$[{"id": "a", "label": "0.063"}, {"id": "b", "label": "6.3"}, {"id": "c", "label": "0.63"}, {"id": "d", "label": "0.73"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.1 x 0.8 = ?$tl$, $tl$[{"id": "a", "label": "0.08"}, {"id": "b", "label": "0.8"}, {"id": "c", "label": "0.008"}, {"id": "d", "label": "0.18"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.7 x 0.1 = ?$tl$, $tl$[{"id": "a", "label": "0.07"}, {"id": "b", "label": "7"}, {"id": "c", "label": "0.007"}, {"id": "d", "label": "0.7"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.3 x 0.6 = ?$tl$, $tl$[{"id": "a", "label": "0.18"}, {"id": "b", "label": "18"}, {"id": "c", "label": "0.018"}, {"id": "d", "label": "1.8"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.6 x 0.8 = ?$tl$, $tl$[{"id": "a", "label": "0.58"}, {"id": "b", "label": "0.48"}, {"id": "c", "label": "4.8"}, {"id": "d", "label": "48"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.8 x 0.03 = ?$tl$, $tl$[{"id": "a", "label": "0.24"}, {"id": "b", "label": "0.024"}, {"id": "c", "label": "0.0024"}, {"id": "d", "label": "0.124"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.9 x 0.08 = ?$tl$, $tl$[{"id": "a", "label": "0.0072"}, {"id": "b", "label": "0.072"}, {"id": "c", "label": "0.172"}, {"id": "d", "label": "0.72"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.2 x 0.01 = ?$tl$, $tl$[{"id": "a", "label": "0.002"}, {"id": "b", "label": "0.2"}, {"id": "c", "label": "0.02"}, {"id": "d", "label": "0.0002"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.2 x 0.08 = ?$tl$, $tl$[{"id": "a", "label": "0.016"}, {"id": "b", "label": "0.0016"}, {"id": "c", "label": "0.16"}, {"id": "d", "label": "0.116"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.8 x 0.05 = ?$tl$, $tl$[{"id": "a", "label": "0.004"}, {"id": "b", "label": "0.04"}, {"id": "c", "label": "0.4"}, {"id": "d", "label": "4"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.04 x 0.9 = ?$tl$, $tl$[{"id": "a", "label": "0.0036"}, {"id": "b", "label": "0.036"}, {"id": "c", "label": "3.6"}, {"id": "d", "label": "0.136"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.07 x 0.6 = ?$tl$, $tl$[{"id": "a", "label": "0.142"}, {"id": "b", "label": "4.2"}, {"id": "c", "label": "0.042"}, {"id": "d", "label": "0.42"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.01 x 0.2 = ?$tl$, $tl$[{"id": "a", "label": "0.2"}, {"id": "b", "label": "0.0002"}, {"id": "c", "label": "0.002"}, {"id": "d", "label": "0.02"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.11 x 0.5 = ?$tl$, $tl$[{"id": "a", "label": "5.5"}, {"id": "b", "label": "0.0055"}, {"id": "c", "label": "0.055"}, {"id": "d", "label": "0.155"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.18 x 0.9 = ?$tl$, $tl$[{"id": "a", "label": "16.2"}, {"id": "b", "label": "0.0162"}, {"id": "c", "label": "0.162"}, {"id": "d", "label": "0.262"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.01 x 0.09 = ?$tl$, $tl$[{"id": "a", "label": "0.009"}, {"id": "b", "label": "0.00009"}, {"id": "c", "label": "0.1009"}, {"id": "d", "label": "0.0009"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.18 x 0.09 = ?$tl$, $tl$[{"id": "a", "label": "1.62"}, {"id": "b", "label": "0.1162"}, {"id": "c", "label": "0.162"}, {"id": "d", "label": "0.0162"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.05 x 0.04 = ?$tl$, $tl$[{"id": "a", "label": "0.02"}, {"id": "b", "label": "0.2"}, {"id": "c", "label": "0.102"}, {"id": "d", "label": "0.002"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.08 x 0.02 = ?$tl$, $tl$[{"id": "a", "label": "0.016"}, {"id": "b", "label": "0.1016"}, {"id": "c", "label": "0.0016"}, {"id": "d", "label": "0.00016"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$0.08 x 0.01 = ?$tl$, $tl$[{"id": "a", "label": "0.0008"}, {"id": "b", "label": "0.08"}, {"id": "c", "label": "0.1008"}, {"id": "d", "label": "0.00008"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-decimals$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Add & Subtract Fractions (5.NF.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$add-subtract-fractions$tl$, $tl$Add & Subtract Fractions$tl$, $tl$To add or subtract fractions with different denominators, first find a common denominator.$tl$, 5, $tl$5.NF.A.1$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Add & Subtract Fractions$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Add & Subtract Fractions", "body": "To add or subtract fractions with different denominators, first find a common denominator."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  2/3 + 1/2 = ?\n\nThe answer is \"7/6\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  3/4 + 2/3 = ?\n\nThe answer is \"17/12\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  1/2 + 3/4 = ?\n\nThe answer is \"5/4\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/3 + 1/2 = ?", "choices": [{"id": "a", "label": "5/6"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "1"}, {"id": "d", "label": "2/5"}], "answer": "a", "explanation": "Yes! The answer is \"5/6\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/2 + 1/4 = ?", "choices": [{"id": "a", "label": "1"}, {"id": "b", "label": "2/8"}, {"id": "c", "label": "3/4"}, {"id": "d", "label": "2/6"}], "answer": "c", "explanation": "Yes! The answer is \"3/4\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/4 + 1/3 = ?", "choices": [{"id": "a", "label": "2/7"}, {"id": "b", "label": "2/12"}, {"id": "c", "label": "7/12"}, {"id": "d", "label": "1"}], "answer": "c", "explanation": "Yes! The answer is \"7/12\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Add & Subtract Fractions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/4 + 1/2 = ?$tl$, $tl$[{"id": "a", "label": "3/8"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "2"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/4 + 2/3 = ?$tl$, $tl$[{"id": "a", "label": "5/7"}, {"id": "b", "label": "1"}, {"id": "c", "label": "17/12"}, {"id": "d", "label": "5/12"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 + 3/4 = ?$tl$, $tl$[{"id": "a", "label": "5/4"}, {"id": "b", "label": "4/8"}, {"id": "c", "label": "4/6"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 + 2/3 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "3/5"}, {"id": "d", "label": "7/6"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 + 1/4 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "2/12"}, {"id": "c", "label": "7/12"}, {"id": "d", "label": "2/7"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 + 2/4 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "3/8"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 + 1/4 = ?$tl$, $tl$[{"id": "a", "label": "3/4"}, {"id": "b", "label": "2/8"}, {"id": "c", "label": "1"}, {"id": "d", "label": "2/6"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 + 1/3 = ?$tl$, $tl$[{"id": "a", "label": "2/6"}, {"id": "b", "label": "1"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "2/5"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/3 + 1/2 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "7/6"}, {"id": "c", "label": "3/6"}, {"id": "d", "label": "3/5"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/4 + 1/3 = ?$tl$, $tl$[{"id": "a", "label": "13/12"}, {"id": "b", "label": "4/12"}, {"id": "c", "label": "4/7"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 + 3/6 = ?$tl$, $tl$[{"id": "a", "label": "5/6"}, {"id": "b", "label": "1"}, {"id": "c", "label": "4/18"}, {"id": "d", "label": "4/9"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/8 + 5/6 = ?$tl$, $tl$[{"id": "a", "label": "6/48"}, {"id": "b", "label": "23/24"}, {"id": "c", "label": "6/14"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$5/8 + 2/6 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "7/48"}, {"id": "c", "label": "7/14"}, {"id": "d", "label": "23/24"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/4 + 2/6 = ?$tl$, $tl$[{"id": "a", "label": "4/24"}, {"id": "b", "label": "1"}, {"id": "c", "label": "4/10"}, {"id": "d", "label": "5/6"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/4 - 1/6 = ?$tl$, $tl$[{"id": "a", "label": "4/10"}, {"id": "b", "label": "1"}, {"id": "c", "label": "4/24"}, {"id": "d", "label": "7/12"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/4 + 10/12 = ?$tl$, $tl$[{"id": "a", "label": "13/16"}, {"id": "b", "label": "1"}, {"id": "c", "label": "13/48"}, {"id": "d", "label": "19/12"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$7/12 - 1/3 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "8/15"}, {"id": "c", "label": "8/36"}, {"id": "d", "label": "1/4"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$4/8 + 3/4 = ?$tl$, $tl$[{"id": "a", "label": "7/32"}, {"id": "b", "label": "7/12"}, {"id": "c", "label": "5/4"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$8/12 - 5/10 = ?$tl$, $tl$[{"id": "a", "label": "1/6"}, {"id": "b", "label": "1"}, {"id": "c", "label": "13/120"}, {"id": "d", "label": "13/22"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$7/12 - 5/10 = ?$tl$, $tl$[{"id": "a", "label": "12/22"}, {"id": "b", "label": "1/12"}, {"id": "c", "label": "12/120"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Multiply Fractions (5.NF.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiply-fractions$tl$, $tl$Multiply Fractions$tl$, $tl$To multiply fractions, multiply the numerators and multiply the denominators.$tl$, 5, $tl$5.NF.B.4$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiply Fractions$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Multiply Fractions", "body": "To multiply fractions, multiply the numerators and multiply the denominators."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  1/2 x 1/2 = ?\n\nThe answer is \"1/4\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  3/4 x 2/4 = ?\n\nThe answer is \"3/8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  1/2 x 2/3 = ?\n\nThe answer is \"1/3\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "3/4 x 1/2 = ?", "choices": [{"id": "a", "label": "3/8"}, {"id": "b", "label": "4/8"}, {"id": "c", "label": "3/6"}, {"id": "d", "label": "1/2"}], "answer": "a", "explanation": "Yes! The answer is \"3/8\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/3 x 1/2 = ?", "choices": [{"id": "a", "label": "1/3"}, {"id": "b", "label": "1/5"}, {"id": "c", "label": "1/6"}, {"id": "d", "label": "2/6"}], "answer": "c", "explanation": "Yes! The answer is \"1/6\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/2 x 3/4 = ?", "choices": [{"id": "a", "label": "3/8"}, {"id": "b", "label": "3/6"}, {"id": "c", "label": "1/2"}, {"id": "d", "label": "4/8"}], "answer": "a", "explanation": "Yes! The answer is \"3/8\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Multiply Fractions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/2 x 2/4 = ?$tl$, $tl$[{"id": "a", "label": "2/6"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "1"}, {"id": "d", "label": "3/8"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 x 1/3 = ?$tl$, $tl$[{"id": "a", "label": "1/9"}, {"id": "b", "label": "1/6"}, {"id": "c", "label": "1"}, {"id": "d", "label": "2/9"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/4 x 1/2 = ?$tl$, $tl$[{"id": "a", "label": "1/4"}, {"id": "b", "label": "1/6"}, {"id": "c", "label": "2/8"}, {"id": "d", "label": "1/8"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/4 x 1/2 = ?$tl$, $tl$[{"id": "a", "label": "3/8"}, {"id": "b", "label": "2/6"}, {"id": "c", "label": "1/4"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 x 1/2 = ?$tl$, $tl$[{"id": "a", "label": "2/6"}, {"id": "b", "label": "1/5"}, {"id": "c", "label": "1/6"}, {"id": "d", "label": "1/3"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/4 x 1/3 = ?$tl$, $tl$[{"id": "a", "label": "3/12"}, {"id": "b", "label": "1/6"}, {"id": "c", "label": "1/4"}, {"id": "d", "label": "2/7"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/3 x 2/3 = ?$tl$, $tl$[{"id": "a", "label": "4/9"}, {"id": "b", "label": "5/9"}, {"id": "c", "label": "4/6"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/5 x 1/4 = ?$tl$, $tl$[{"id": "a", "label": "3/20"}, {"id": "b", "label": "1/5"}, {"id": "c", "label": "4/20"}, {"id": "d", "label": "3/9"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 x 3/4 = ?$tl$, $tl$[{"id": "a", "label": "3/7"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "1/3"}, {"id": "d", "label": "4/12"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/5 x 3/4 = ?$tl$, $tl$[{"id": "a", "label": "4/20"}, {"id": "b", "label": "3/9"}, {"id": "c", "label": "1/5"}, {"id": "d", "label": "3/20"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$3/5 x 4/5 = ?$tl$, $tl$[{"id": "a", "label": "7/25"}, {"id": "b", "label": "12/25"}, {"id": "c", "label": "13/25"}, {"id": "d", "label": "12/10"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/4 x 2/4 = ?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "2/8"}, {"id": "c", "label": "3/16"}, {"id": "d", "label": "1"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/3 x 4/5 = ?$tl$, $tl$[{"id": "a", "label": "4/15"}, {"id": "b", "label": "5/15"}, {"id": "c", "label": "1/3"}, {"id": "d", "label": "4/8"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/6 x 2/4 = ?$tl$, $tl$[{"id": "a", "label": "1/8"}, {"id": "b", "label": "1/12"}, {"id": "c", "label": "2/10"}, {"id": "d", "label": "3/24"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/5 x 4/6 = ?$tl$, $tl$[{"id": "a", "label": "5/30"}, {"id": "b", "label": "4/11"}, {"id": "c", "label": "2/15"}, {"id": "d", "label": "1/6"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$1/8 x 4/8 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "4/16"}, {"id": "c", "label": "5/64"}, {"id": "d", "label": "1/16"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$5/8 x 3/4 = ?$tl$, $tl$[{"id": "a", "label": "8/32"}, {"id": "b", "label": "15/32"}, {"id": "c", "label": "15/12"}, {"id": "d", "label": "1/2"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$2/6 x 7/8 = ?$tl$, $tl$[{"id": "a", "label": "5/16"}, {"id": "b", "label": "9/48"}, {"id": "c", "label": "14/14"}, {"id": "d", "label": "7/24"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$7/8 x 5/6 = ?$tl$, $tl$[{"id": "a", "label": "3/4"}, {"id": "b", "label": "12/48"}, {"id": "c", "label": "35/48"}, {"id": "d", "label": "35/14"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$4/6 x 5/6 = ?$tl$, $tl$[{"id": "a", "label": "9/36"}, {"id": "b", "label": "5/9"}, {"id": "c", "label": "20/12"}, {"id": "d", "label": "7/12"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-fractions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Order of Operations (5.OA.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$order-of-operations$tl$, $tl$Order of Operations$tl$, $tl$Do parentheses first, then multiply and divide, then add and subtract (left to right).$tl$, 5, $tl$5.OA.A.1$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Order of Operations$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Order of Operations", "body": "Do parentheses first, then multiply and divide, then add and subtract (left to right)."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Solve using order of operations:  4 + 4 x 4 = ?\n\nThe answer is \"20\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Solve using order of operations:  8 + 9 x 5 = ?\n\nThe answer is \"53\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Solve using order of operations:  6 + 5 x 3 = ?\n\nThe answer is \"21\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Solve using order of operations:  (6 + 2) x 8 = ?\n\nThe answer is 64."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Solve using order of operations:  (8 + 5) x 6 = ?\n\nThe answer is 78."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Solve using order of operations:  (4 + 8) x 5 = ?\n\nThe answer is 60."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Order of Operations! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  8 + 2 x 6 = ?$tl$, null, $tl$20$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  7 + 2 x 5 = ?$tl$, null, $tl$17$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  8 + 7 x 6 = ?$tl$, null, $tl$50$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  3 + 4 x 3 = ?$tl$, null, $tl$15$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  6 + 9 x 6 = ?$tl$, null, $tl$60$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  (8 + 9) x 8 = ?$tl$, null, $tl$136$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  (9 + 3) x 9 = ?$tl$, null, $tl$108$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  (4 + 7) x 4 = ?$tl$, null, $tl$44$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  (9 + 3) x 7 = ?$tl$, null, $tl$84$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  (9 + 5) x 7 = ?$tl$, null, $tl$98$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  4 x 4 - 2 x 5 = ?$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  8 x 9 - 5 x 2 = ?$tl$, null, $tl$62$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  7 x 4 - 2 x 6 = ?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  8 x 3 - 3 x 2 = ?$tl$, null, $tl$18$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  6 x 8 - 2 x 5 = ?$tl$, null, $tl$38$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  9 + 6 x 9 - 1 = ?$tl$, null, $tl$62$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  7 + 4 x 5 - 3 = ?$tl$, null, $tl$24$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  6 + 3 x 3 - 3 = ?$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  4 + 9 x 9 - 1 = ?$tl$, null, $tl$84$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Solve using order of operations:  6 + 6 x 6 - 7 = ?$tl$, null, $tl$35$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Powers of Ten (5.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$powers-of-ten$tl$, $tl$Powers of Ten$tl$, $tl$Multiplying by 10, 100, or 1000 shifts the digits left; dividing shifts them right.$tl$, 5, $tl$5.NBT.A.2$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Powers of Ten$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Powers of Ten", "body": "Multiplying by 10, 100, or 1000 shifts the digits left; dividing shifts them right."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  96 x 10 = ?\n\nThe answer is \"960\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  2 x 10 = ?\n\nThe answer is \"20\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  5 x 10 = ?\n\nThe answer is \"50\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  76 x 100 = ?\n\nThe answer is 7600."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  53 x 100 = ?\n\nThe answer is 5300."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  52 x 100 = ?\n\nThe answer is 5200."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Powers of Ten! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$55 x 10 = ?$tl$, null, $tl$550$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$52 x 10 = ?$tl$, null, $tl$520$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$10 x 10 = ?$tl$, null, $tl$100$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$56 x 10 = ?$tl$, null, $tl$560$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$51 x 10 = ?$tl$, null, $tl$510$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$68 x 100 = ?$tl$, null, $tl$6800$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$85 x 100 = ?$tl$, null, $tl$8500$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$18 x 100 = ?$tl$, null, $tl$1800$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$82 x 100 = ?$tl$, null, $tl$8200$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$76 x 100 = ?$tl$, null, $tl$7600$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$33 x 1000 = ?$tl$, null, $tl$33000$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$82 x 1000 = ?$tl$, null, $tl$82000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$55 x 1000 = ?$tl$, null, $tl$55000$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$71 x 1000 = ?$tl$, null, $tl$71000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$91 x 1000 = ?$tl$, null, $tl$91000$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$240 / 10 = ?$tl$, null, $tl$24$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$1000 / 100 = ?$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$110 / 10 = ?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$790 / 10 = ?$tl$, null, $tl$79$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$7500 / 100 = ?$tl$, null, $tl$75$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$powers-of-ten$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Volume (5.MD.C.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$volume$tl$, $tl$Volume$tl$, $tl$The volume of a box is length x width x height, measured in cubic units.$tl$, 5, $tl$5.MD.C.5$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Volume$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Volume", "body": "The volume of a box is length x width x height, measured in cubic units."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A box is 4 units long, 2 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is \"24\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A box is 4 units long, 4 wide, and 2 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is \"32\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A box is 3 units long, 3 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is \"36\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A box is 6 units long, 5 wide, and 6 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is 180."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A box is 3 units long, 2 wide, and 6 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is 36."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A box is 3 units long, 2 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)\n\nThe answer is 18."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Volume! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 4 units long, 4 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$64$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 2 units long, 2 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 4 units long, 2 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$24$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 2 units long, 2 wide, and 2 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 3 units long, 3 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$27$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 3 units long, 4 wide, and 6 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$72$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 2 units long, 4 wide, and 5 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 5 units long, 2 wide, and 6 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$60$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 5 units long, 3 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 4 units long, 3 wide, and 5 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$60$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 3 units long, 5 wide, and 5 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$75$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 5 units long, 4 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$80$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 3 units long, 4 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$48$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 5 units long, 6 wide, and 3 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$90$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 5 units long, 8 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$160$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 9 units long, 12 wide, and 6 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$648$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 9 units long, 12 wide, and 10 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$1080$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 8 units long, 11 wide, and 4 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$352$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 9 units long, 4 wide, and 8 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$288$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A box is 9 units long, 11 wide, and 7 tall. What is its volume in cubic units?  (length x width x height)$tl$, null, $tl$693$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Matter & Its Properties (5-PS1-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$matter-and-properties$tl$, $tl$Matter & Its Properties$tl$, $tl$Matter is anything with mass and volume; we identify materials by their properties.$tl$, 5, $tl$5-PS1-3$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Matter & Its Properties$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Matter & Its Properties", "body": "Matter is anything with mass and volume; we identify materials by their properties."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Everything around us that has mass and takes up space is called:\n\nThe answer is \"matter\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The three common states of matter are solid, liquid, and:\n\nThe answer is \"gas\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which is a property you can measure about matter?\n\nThe answer is \"mass\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Even a gas like air is made of tiny particles too small to:", "choices": [{"id": "a", "label": "weigh ever"}, {"id": "b", "label": "exist"}, {"id": "c", "label": "move"}, {"id": "d", "label": "see"}], "answer": "d", "explanation": "Yes! The answer is \"see\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A balloon filled with air shows that gas has:", "choices": [{"id": "a", "label": "no mass at all"}, {"id": "b", "label": "mass and takes up space"}, {"id": "c", "label": "no volume"}, {"id": "d", "label": "color only"}], "answer": "b", "explanation": "Yes! The answer is \"mass and takes up space\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which tool measures the mass of an object?", "choices": [{"id": "a", "label": "a ruler"}, {"id": "b", "label": "a thermometer"}, {"id": "c", "label": "a balance"}, {"id": "d", "label": "a clock"}], "answer": "c", "explanation": "Yes! The answer is \"a balance\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Matter & Its Properties! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Everything around us that has mass and takes up space is called:$tl$, $tl$[{"id": "a", "label": "energy"}, {"id": "b", "label": "light"}, {"id": "c", "label": "matter"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The three common states of matter are solid, liquid, and:$tl$, $tl$[{"id": "a", "label": "metal"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is a property you can measure about matter?$tl$, $tl$[{"id": "a", "label": "happiness"}, {"id": "b", "label": "name"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Even a gas like air is made of tiny particles too small to:$tl$, $tl$[{"id": "a", "label": "weigh ever"}, {"id": "b", "label": "exist"}, {"id": "c", "label": "move"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A balloon filled with air shows that gas has:$tl$, $tl$[{"id": "a", "label": "no mass at all"}, {"id": "b", "label": "no volume"}, {"id": "c", "label": "color only"}, {"id": "d", "label": "mass and takes up space"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which tool measures the mass of an object?$tl$, $tl$[{"id": "a", "label": "a ruler"}, {"id": "b", "label": "a thermometer"}, {"id": "c", "label": "a balance"}, {"id": "d", "label": "a clock"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Matter is made of extremely small building blocks called:$tl$, $tl$[{"id": "a", "label": "pixels"}, {"id": "b", "label": "cells only"}, {"id": "c", "label": "waves"}, {"id": "d", "label": "particles (atoms/molecules)"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which property could help you identify a mystery material?$tl$, $tl$[{"id": "a", "label": "its hardness and how it reacts"}, {"id": "b", "label": "the day you found it"}, {"id": "c", "label": "its owner"}, {"id": "d", "label": "its price"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A substance that is shiny, bends, and conducts electricity is most likely a:$tl$, $tl$[{"id": "a", "label": "gas"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "liquid only"}, {"id": "d", "label": "plastic"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two materials can look the same but be told apart by testing their:$tl$, $tl$[{"id": "a", "label": "properties"}, {"id": "b", "label": "names"}, {"id": "c", "label": "ages"}, {"id": "d", "label": "colors only"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If you cool a gas enough, it can become a:$tl$, $tl$[{"id": "a", "label": "liquid"}, {"id": "b", "label": "solid metal instantly"}, {"id": "c", "label": "new element"}, {"id": "d", "label": "beam of light"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The amount of space matter takes up is its:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "volume"}, {"id": "c", "label": "weight"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Why does a rock sink but a cork floats in water?$tl$, $tl$[{"id": "a", "label": "the rock is alive"}, {"id": "b", "label": "they have different densities"}, {"id": "c", "label": "cork is metal"}, {"id": "d", "label": "water hates rocks"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is NOT a physical property of matter?$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "its favorite season"}, {"id": "c", "label": "texture"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Particles in a solid are packed tightly and:$tl$, $tl$[{"id": "a", "label": "move freely apart"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "are not there"}, {"id": "d", "label": "vibrate in place"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Anything that has mass and takes up space is ____. (one word)$tl$, null, $tl$matter$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Magnetism is a property that lets us identify materials that contain:$tl$, $tl$[{"id": "a", "label": "plastic"}, {"id": "b", "label": "glass"}, {"id": "c", "label": "iron"}, {"id": "d", "label": "wood"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Boiling point and melting point are properties that:$tl$, $tl$[{"id": "a", "label": "change its name"}, {"id": "b", "label": "make it heavier"}, {"id": "c", "label": "help identify a substance"}, {"id": "d", "label": "are random"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which best shows that air (a gas) has mass?$tl$, $tl$[{"id": "a", "label": "a basketball weighs more when pumped up"}, {"id": "b", "label": "air is invisible"}, {"id": "c", "label": "air is everywhere"}, {"id": "d", "label": "you can breathe it"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Density compares an object's mass to its:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "age"}, {"id": "c", "label": "volume"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-properties$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Mixtures & Solutions (5-PS1-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$mixtures-and-solutions$tl$, $tl$Mixtures & Solutions$tl$, $tl$Mixtures can be separated; when a solid dissolves evenly in a liquid it forms a solution.$tl$, 5, $tl$5-PS1-4$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Mixtures & Solutions$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Mixtures & Solutions", "body": "Mixtures can be separated; when a solid dissolves evenly in a liquid it forms a solution."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  When you stir sand into water, you make a:\n\nThe answer is \"mixture\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  When sugar dissolves completely in water, it forms a:\n\nThe answer is \"solution\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  In a solution, the dissolved substance seems to:\n\nThe answer is \"disappear (spread evenly)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which mixture can be separated by a strainer or filter?", "choices": [{"id": "a", "label": "salt fully dissolved in water"}, {"id": "b", "label": "sugar water"}, {"id": "c", "label": "sand and water"}, {"id": "d", "label": "air"}], "answer": "c", "explanation": "Yes! The answer is \"sand and water\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "How can you separate salt from salt water?", "choices": [{"id": "a", "label": "use a magnet"}, {"id": "b", "label": "use a strainer"}, {"id": "c", "label": "freeze it once"}, {"id": "d", "label": "let the water evaporate"}], "answer": "d", "explanation": "Yes! The answer is \"let the water evaporate\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A magnet can be used to separate iron filings from:", "choices": [{"id": "a", "label": "salt water"}, {"id": "b", "label": "sugar"}, {"id": "c", "label": "air"}, {"id": "d", "label": "sand"}], "answer": "d", "explanation": "Yes! The answer is \"sand\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Mixtures & Solutions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When you stir sand into water, you make a:$tl$, $tl$[{"id": "a", "label": "new element"}, {"id": "b", "label": "pure substance"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When sugar dissolves completely in water, it forms a:$tl$, $tl$[{"id": "a", "label": "solution"}, {"id": "b", "label": "solid"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "new metal"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$In a solution, the dissolved substance seems to:$tl$, $tl$[{"id": "a", "label": "float on top"}, {"id": "b", "label": "disappear (spread evenly)"}, {"id": "c", "label": "sink as chunks"}, {"id": "d", "label": "turn to gas"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which mixture can be separated by a strainer or filter?$tl$, $tl$[{"id": "a", "label": "sand and water"}, {"id": "b", "label": "salt fully dissolved in water"}, {"id": "c", "label": "sugar water"}, {"id": "d", "label": "air"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$How can you separate salt from salt water?$tl$, $tl$[{"id": "a", "label": "let the water evaporate"}, {"id": "b", "label": "use a magnet"}, {"id": "c", "label": "use a strainer"}, {"id": "d", "label": "freeze it once"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A magnet can be used to separate iron filings from:$tl$, $tl$[{"id": "a", "label": "salt water"}, {"id": "b", "label": "sugar"}, {"id": "c", "label": "sand"}, {"id": "d", "label": "air"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Mixing two things does NOT make a new substance - the parts:$tl$, $tl$[{"id": "a", "label": "vanish forever"}, {"id": "b", "label": "become an element"}, {"id": "c", "label": "explode"}, {"id": "d", "label": "keep their own properties"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which dissolves best in warm water?$tl$, $tl$[{"id": "a", "label": "a rock"}, {"id": "b", "label": "a coin"}, {"id": "c", "label": "sugar"}, {"id": "d", "label": "a marble"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Stirring and heating usually make a solid dissolve:$tl$, $tl$[{"id": "a", "label": "slower"}, {"id": "b", "label": "never"}, {"id": "c", "label": "faster"}, {"id": "d", "label": "into metal"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A salad is an example of a mixture because you can still:$tl$, $tl$[{"id": "a", "label": "not separate it"}, {"id": "b", "label": "turn it to gas"}, {"id": "c", "label": "make an element"}, {"id": "d", "label": "see and separate the parts"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To get clean water from muddy water, you could first:$tl$, $tl$[{"id": "a", "label": "add salt"}, {"id": "b", "label": "freeze and forget it"}, {"id": "c", "label": "use a magnet"}, {"id": "d", "label": "filter it"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The part that gets dissolved (like sugar) is called the:$tl$, $tl$[{"id": "a", "label": "solvent"}, {"id": "b", "label": "solute"}, {"id": "c", "label": "filter"}, {"id": "d", "label": "magnet"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The liquid that does the dissolving (like water) is the:$tl$, $tl$[{"id": "a", "label": "solvent"}, {"id": "b", "label": "solute"}, {"id": "c", "label": "mixture"}, {"id": "d", "label": "filter"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Iron filings, sand, and salt mixed together can be separated using a magnet, water, and:$tl$, $tl$[{"id": "a", "label": "a microwave only"}, {"id": "b", "label": "a magnet only"}, {"id": "c", "label": "evaporation"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is a solution?$tl$, $tl$[{"id": "a", "label": "salt water"}, {"id": "b", "label": "sand and pebbles"}, {"id": "c", "label": "oil and water"}, {"id": "d", "label": "a fruit salad"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$When sugar dissolves evenly in water, the result is a ____. (one word)$tl$, null, $tl$solution$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Oil and water poured together will:$tl$, $tl$[{"id": "a", "label": "separate into layers"}, {"id": "b", "label": "form a solution"}, {"id": "c", "label": "make a metal"}, {"id": "d", "label": "disappear"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Evaporating a solution leaves behind the:$tl$, $tl$[{"id": "a", "label": "water only"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "dissolved solid"}, {"id": "d", "label": "a gas"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Chromatography separates the colors in ink, showing ink is a:$tl$, $tl$[{"id": "a", "label": "mixture of colors"}, {"id": "b", "label": "single pure color"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "gas"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which property helps separate a mixture of iron and salt?$tl$, $tl$[{"id": "a", "label": "salt is magnetic"}, {"id": "b", "label": "both float"}, {"id": "c", "label": "iron is magnetic"}, {"id": "d", "label": "both are gases"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$mixtures-and-solutions$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Conservation of Matter (5-PS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$conservation-of-matter$tl$, $tl$Conservation of Matter$tl$, $tl$In ordinary changes, matter is never created or destroyed - total mass stays the same.$tl$, 5, $tl$5-PS1-2$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Conservation of Matter$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Conservation of Matter", "body": "In ordinary changes, matter is never created or destroyed - total mass stays the same."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  When you mix two things, the total mass:\n\nThe answer is \"stays the same\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  If 50 g of water freezes into ice, the ice weighs about:\n\nThe answer is \"50 g\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Matter is never created or destroyed in ordinary changes - it is:\n\nThe answer is \"conserved\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When sugar dissolves in water, the mass of the solution equals:", "choices": [{"id": "a", "label": "sugar + water"}, {"id": "b", "label": "just the water"}, {"id": "c", "label": "just the sugar"}, {"id": "d", "label": "zero"}], "answer": "a", "explanation": "Yes! The answer is \"sugar + water\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "If ice melts in a sealed cup, the water's mass is:", "choices": [{"id": "a", "label": "less"}, {"id": "b", "label": "more"}, {"id": "c", "label": "the same as the ice"}, {"id": "d", "label": "zero"}], "answer": "c", "explanation": "Yes! The answer is \"the same as the ice\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Burning a log seems to lose mass, but the gases released still count, so matter is:", "choices": [{"id": "a", "label": "conserved"}, {"id": "b", "label": "destroyed"}, {"id": "c", "label": "created"}, {"id": "d", "label": "gone"}], "answer": "a", "explanation": "Yes! The answer is \"conserved\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Conservation of Matter! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When you mix two things, the total mass:$tl$, $tl$[{"id": "a", "label": "disappears"}, {"id": "b", "label": "always doubles"}, {"id": "c", "label": "stays the same"}, {"id": "d", "label": "becomes zero"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If 50 g of water freezes into ice, the ice weighs about:$tl$, $tl$[{"id": "a", "label": "0 g"}, {"id": "b", "label": "50 g"}, {"id": "c", "label": "100 g"}, {"id": "d", "label": "5 g"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Matter is never created or destroyed in ordinary changes - it is:$tl$, $tl$[{"id": "a", "label": "deleted"}, {"id": "b", "label": "invented"}, {"id": "c", "label": "ignored"}, {"id": "d", "label": "conserved"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When sugar dissolves in water, the mass of the solution equals:$tl$, $tl$[{"id": "a", "label": "sugar + water"}, {"id": "b", "label": "just the water"}, {"id": "c", "label": "just the sugar"}, {"id": "d", "label": "zero"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If ice melts in a sealed cup, the water's mass is:$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "the same as the ice"}, {"id": "c", "label": "more"}, {"id": "d", "label": "zero"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Burning a log seems to lose mass, but the gases released still count, so matter is:$tl$, $tl$[{"id": "a", "label": "conserved"}, {"id": "b", "label": "destroyed"}, {"id": "c", "label": "created"}, {"id": "d", "label": "gone"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Cutting paper into pieces changes its shape but not its total:$tl$, $tl$[{"id": "a", "label": "color forever"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "existence"}, {"id": "d", "label": "element"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$100 g of clay molded into a new shape now has a mass of:$tl$, $tl$[{"id": "a", "label": "0 g"}, {"id": "b", "label": "100 g"}, {"id": "c", "label": "200 g"}, {"id": "d", "label": "10 g"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$In a closed container, a chemical change keeps the total mass:$tl$, $tl$[{"id": "a", "label": "lower"}, {"id": "b", "label": "higher"}, {"id": "c", "label": "unchanged"}, {"id": "d", "label": "at zero"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If you combine 20 g and 30 g of liquids that mix, the result is:$tl$, $tl$[{"id": "a", "label": "50 g"}, {"id": "b", "label": "10 g"}, {"id": "c", "label": "60 g"}, {"id": "d", "label": "0 g"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When water evaporates from an open dish, the water:$tl$, $tl$[{"id": "a", "label": "was destroyed"}, {"id": "b", "label": "turned to nothing"}, {"id": "c", "label": "became a gas (still exists)"}, {"id": "d", "label": "became a solid"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A sealed bag of fizzing tablets and water keeps the same mass because the gas:$tl$, $tl$[{"id": "a", "label": "stays trapped inside"}, {"id": "b", "label": "escapes and is gone"}, {"id": "c", "label": "is created"}, {"id": "d", "label": "weighs nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Conservation of matter means atoms are:$tl$, $tl$[{"id": "a", "label": "destroyed"}, {"id": "b", "label": "rearranged, not lost"}, {"id": "c", "label": "created from nothing"}, {"id": "d", "label": "made of light"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If a plant grows bigger, most of its new mass comes from:$tl$, $tl$[{"id": "a", "label": "the soil disappearing"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "air and water"}, {"id": "d", "label": "magic"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Rust forms on iron; the rusty iron actually weighs:$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "zero"}, {"id": "d", "label": "a bit more (it combined with oxygen)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$In ordinary changes, the total amount of matter is ____ (stays the same). (one word)$tl$, null, $tl$conserved$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Mixing baking soda and vinegar in an open cup seems to lose mass because:$tl$, $tl$[{"id": "a", "label": "matter is destroyed"}, {"id": "b", "label": "mass is fake"}, {"id": "c", "label": "a gas escapes into the air"}, {"id": "d", "label": "the cup eats it"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If you weigh reactants before and products after in a sealed jar, they are:$tl$, $tl$[{"id": "a", "label": "equal"}, {"id": "b", "label": "very different"}, {"id": "c", "label": "always less after"}, {"id": "d", "label": "always more after"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A melted then re-frozen ice cube has:$tl$, $tl$[{"id": "a", "label": "less mass"}, {"id": "b", "label": "more mass"}, {"id": "c", "label": "no mass"}, {"id": "d", "label": "the same mass as before"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The idea that matter can't just vanish is the law of:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "motion"}, {"id": "c", "label": "conservation of matter"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$conservation-of-matter$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Food Webs & Energy (5-LS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$food-webs-and-energy$tl$, $tl$Food Webs & Energy$tl$, $tl$Energy flows from the Sun to producers to consumers; decomposers recycle nutrients.$tl$, 5, $tl$5-LS2-1$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Food Webs & Energy$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Food Webs & Energy", "body": "Energy flows from the Sun to producers to consumers; decomposers recycle nutrients."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Almost all the energy in an ecosystem starts with the:\n\nThe answer is \"Sun\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Plants are called producers because they:\n\nThe answer is \"make their own food\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An animal that eats plants is a:\n\nThe answer is \"herbivore\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An animal that eats other animals is a:", "choices": [{"id": "a", "label": "herbivore"}, {"id": "b", "label": "carnivore"}, {"id": "c", "label": "producer"}, {"id": "d", "label": "plant"}], "answer": "b", "explanation": "Yes! The answer is \"carnivore\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In a food chain, an arrow points in the direction that:", "choices": [{"id": "a", "label": "animals walk"}, {"id": "b", "label": "the wind blows"}, {"id": "c", "label": "energy flows"}, {"id": "d", "label": "water falls"}], "answer": "c", "explanation": "Yes! The answer is \"energy flows\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Decomposers like fungi and bacteria break down dead things and return nutrients to the:", "choices": [{"id": "a", "label": "sky"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "ocean only"}], "answer": "b", "explanation": "Yes! The answer is \"soil\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Food Webs & Energy! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Almost all the energy in an ecosystem starts with the:$tl$, $tl$[{"id": "a", "label": "soil"}, {"id": "b", "label": "wind"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants are called producers because they:$tl$, $tl$[{"id": "a", "label": "make their own food"}, {"id": "b", "label": "eat animals"}, {"id": "c", "label": "eat other plants"}, {"id": "d", "label": "make soil"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An animal that eats plants is a:$tl$, $tl$[{"id": "a", "label": "carnivore"}, {"id": "b", "label": "producer"}, {"id": "c", "label": "herbivore"}, {"id": "d", "label": "decomposer"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An animal that eats other animals is a:$tl$, $tl$[{"id": "a", "label": "herbivore"}, {"id": "b", "label": "producer"}, {"id": "c", "label": "plant"}, {"id": "d", "label": "carnivore"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$In a food chain, an arrow points in the direction that:$tl$, $tl$[{"id": "a", "label": "animals walk"}, {"id": "b", "label": "the wind blows"}, {"id": "c", "label": "water falls"}, {"id": "d", "label": "energy flows"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Decomposers like fungi and bacteria break down dead things and return nutrients to the:$tl$, $tl$[{"id": "a", "label": "sky"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "ocean only"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A food web shows that most animals eat:$tl$, $tl$[{"id": "a", "label": "only one food"}, {"id": "b", "label": "no food"}, {"id": "c", "label": "more than one kind of food"}, {"id": "d", "label": "only sunlight"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If the plants in an area die, the animals that eat them will:$tl$, $tl$[{"id": "a", "label": "get more food"}, {"id": "b", "label": "not be affected"}, {"id": "c", "label": "make their own food"}, {"id": "d", "label": "have less food"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Energy passes from the Sun to plants to animals through:$tl$, $tl$[{"id": "a", "label": "wind"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "food"}, {"id": "d", "label": "light only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An animal that eats both plants and animals is an:$tl$, $tl$[{"id": "a", "label": "herbivore"}, {"id": "b", "label": "carnivore"}, {"id": "c", "label": "omnivore"}, {"id": "d", "label": "producer"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$In the food chain grass -> rabbit -> fox, the rabbit is the:$tl$, $tl$[{"id": "a", "label": "producer"}, {"id": "b", "label": "top predator"}, {"id": "c", "label": "plant-eater (herbivore)"}, {"id": "d", "label": "decomposer"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Removing the top predator from a food web can cause prey to:$tl$, $tl$[{"id": "a", "label": "disappear"}, {"id": "b", "label": "increase a lot"}, {"id": "c", "label": "become plants"}, {"id": "d", "label": "stop eating"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Most of the energy is lost as heat at each step, so food chains usually have only a:$tl$, $tl$[{"id": "a", "label": "hundred links"}, {"id": "b", "label": "no links"}, {"id": "c", "label": "few links"}, {"id": "d", "label": "one animal only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which gets its energy WITHOUT eating other organisms?$tl$, $tl$[{"id": "a", "label": "a wolf"}, {"id": "b", "label": "a green plant"}, {"id": "c", "label": "a hawk"}, {"id": "d", "label": "a frog"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Mushrooms growing on a dead log are acting as:$tl$, $tl$[{"id": "a", "label": "producers"}, {"id": "b", "label": "predators"}, {"id": "c", "label": "decomposers"}, {"id": "d", "label": "herbivores"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$An organism that makes its own food, like a plant, is a ____. (one word)$tl$, null, $tl$producer$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If a pond loses its algae, the tiny animals that eat algae will:$tl$, $tl$[{"id": "a", "label": "thrive"}, {"id": "b", "label": "struggle to survive"}, {"id": "c", "label": "become algae"}, {"id": "d", "label": "make sunlight"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A food web is more realistic than a food chain because it shows:$tl$, $tl$[{"id": "a", "label": "only one path"}, {"id": "b", "label": "no animals"}, {"id": "c", "label": "many connected food paths"}, {"id": "d", "label": "only plants"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The original source of energy for a deep food web is still the:$tl$, $tl$[{"id": "a", "label": "biggest animal"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Scavengers like vultures help an ecosystem by eating:$tl$, $tl$[{"id": "a", "label": "living plants only"}, {"id": "b", "label": "dead animals"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "sunlight"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$food-webs-and-energy$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] How Plants Make Food (5-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plants-make-food$tl$, $tl$How Plants Make Food$tl$, $tl$Through photosynthesis, plants use sunlight, water, and air to make their own food.$tl$, 5, $tl$5-LS1-1$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: How Plants Make Food$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: How Plants Make Food", "body": "Through photosynthesis, plants use sunlight, water, and air to make their own food."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Plants make their own food using sunlight in a process called:\n\nThe answer is \"photosynthesis\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Most of the material a plant uses to grow comes from:\n\nThe answer is \"air and water\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Plants take in carbon dioxide from the air through tiny openings in their:\n\nThe answer is \"leaves\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "During photosynthesis, plants release which gas that we breathe?", "choices": [{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "helium"}, {"id": "c", "label": "smoke"}, {"id": "d", "label": "oxygen"}], "answer": "d", "explanation": "Yes! The answer is \"oxygen\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The green substance in leaves that captures sunlight is:", "choices": [{"id": "a", "label": "water"}, {"id": "b", "label": "chlorophyll"}, {"id": "c", "label": "sugar"}, {"id": "d", "label": "soil"}], "answer": "b", "explanation": "Yes! The answer is \"chlorophyll\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Plants store the energy they make as:", "choices": [{"id": "a", "label": "sunlight"}, {"id": "b", "label": "sugar (food)"}, {"id": "c", "label": "oxygen"}, {"id": "d", "label": "water"}], "answer": "b", "explanation": "Yes! The answer is \"sugar (food)\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about How Plants Make Food! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants make their own food using sunlight in a process called:$tl$, $tl$[{"id": "a", "label": "photosynthesis"}, {"id": "b", "label": "digestion"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "evaporation"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Most of the material a plant uses to grow comes from:$tl$, $tl$[{"id": "a", "label": "the soil disappearing"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "animals"}, {"id": "d", "label": "air and water"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants take in carbon dioxide from the air through tiny openings in their:$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "flowers"}, {"id": "c", "label": "seeds"}, {"id": "d", "label": "leaves"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$During photosynthesis, plants release which gas that we breathe?$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "helium"}, {"id": "c", "label": "oxygen"}, {"id": "d", "label": "smoke"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The green substance in leaves that captures sunlight is:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "chlorophyll"}, {"id": "c", "label": "sugar"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants store the energy they make as:$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "oxygen"}, {"id": "c", "label": "water"}, {"id": "d", "label": "sugar (food)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Roots mainly take in:$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "oxygen for food"}, {"id": "c", "label": "water and minerals"}, {"id": "d", "label": "carbon dioxide"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A plant kept in the dark cannot:$tl$, $tl$[{"id": "a", "label": "make food"}, {"id": "b", "label": "take in water"}, {"id": "c", "label": "have roots"}, {"id": "d", "label": "have leaves"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The gas plants take IN for photosynthesis is:$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "oxygen"}, {"id": "c", "label": "helium"}, {"id": "d", "label": "nitrogen only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Surprisingly, most of a tree's added mass comes from:$tl$, $tl$[{"id": "a", "label": "carbon dioxide in the air"}, {"id": "b", "label": "the soil it sits in"}, {"id": "c", "label": "the water alone"}, {"id": "d", "label": "sunlight as matter"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Photosynthesis happens mostly in the plant's:$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "bark"}, {"id": "c", "label": "leaves"}, {"id": "d", "label": "seeds"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Animals depend on plants because plants provide food and:$tl$, $tl$[{"id": "a", "label": "plastic"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "gasoline"}, {"id": "d", "label": "oxygen"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Sunlight, water, and carbon dioxide are the ingredients plants use to make:$tl$, $tl$[{"id": "a", "label": "soil and rocks"}, {"id": "b", "label": "sugar and oxygen"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "rain"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is NOT needed for photosynthesis?$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "darkness"}, {"id": "c", "label": "water"}, {"id": "d", "label": "carbon dioxide"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When you eat a plant, you are getting energy that originally came from the:$tl$, $tl$[{"id": "a", "label": "soil"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The process a plant uses to make food from sunlight is called ____. (one word)$tl$, null, $tl$photosynthesis$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Why are most leaves flat and broad?$tl$, $tl$[{"id": "a", "label": "to catch more sunlight"}, {"id": "b", "label": "to hold the plant down"}, {"id": "c", "label": "to store seeds"}, {"id": "d", "label": "to make noise"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants help reduce a greenhouse gas by taking in:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "helium"}, {"id": "c", "label": "water vapor only"}, {"id": "d", "label": "carbon dioxide"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The sugar a plant makes is used for energy and to:$tl$, $tl$[{"id": "a", "label": "build new plant parts"}, {"id": "b", "label": "make soil"}, {"id": "c", "label": "make rain"}, {"id": "d", "label": "make rocks"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If all green plants vanished, animals would lose their main source of:$tl$, $tl$[{"id": "a", "label": "water only"}, {"id": "b", "label": "food and oxygen"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-make-food$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Earth's Systems (5-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$earth-systems$tl$, $tl$Earth's Systems$tl$, $tl$Earth's atmosphere, hydrosphere, geosphere, and biosphere constantly interact.$tl$, 5, $tl$5-ESS2-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Earth's Systems$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Earth's Systems", "body": "Earth's atmosphere, hydrosphere, geosphere, and biosphere constantly interact."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The layer of air surrounding Earth is the:\n\nThe answer is \"atmosphere\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  All of Earth's water - oceans, rivers, ice - makes up the:\n\nThe answer is \"hydrosphere\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Earth's rocks, soil, and land form the:\n\nThe answer is \"geosphere\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "All living things on Earth make up the:", "choices": [{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "geosphere"}, {"id": "c", "label": "biosphere"}, {"id": "d", "label": "hydrosphere"}], "answer": "c", "explanation": "Yes! The answer is \"biosphere\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When rain (hydrosphere) helps a plant (biosphere) grow, two Earth systems are:", "choices": [{"id": "a", "label": "interacting"}, {"id": "b", "label": "disappearing"}, {"id": "c", "label": "stopping"}, {"id": "d", "label": "unrelated"}], "answer": "a", "explanation": "Yes! The answer is \"interacting\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Wind in the atmosphere shaping a sand dune shows the atmosphere affecting the:", "choices": [{"id": "a", "label": "biosphere only"}, {"id": "b", "label": "geosphere"}, {"id": "c", "label": "nothing"}, {"id": "d", "label": "Moon"}], "answer": "b", "explanation": "Yes! The answer is \"geosphere\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Earth's Systems! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The layer of air surrounding Earth is the:$tl$, $tl$[{"id": "a", "label": "geosphere"}, {"id": "b", "label": "hydrosphere"}, {"id": "c", "label": "atmosphere"}, {"id": "d", "label": "biosphere"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$All of Earth's water - oceans, rivers, ice - makes up the:$tl$, $tl$[{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "hydrosphere"}, {"id": "c", "label": "geosphere"}, {"id": "d", "label": "biosphere"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Earth's rocks, soil, and land form the:$tl$, $tl$[{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "hydrosphere"}, {"id": "c", "label": "biosphere"}, {"id": "d", "label": "geosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$All living things on Earth make up the:$tl$, $tl$[{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "geosphere"}, {"id": "c", "label": "biosphere"}, {"id": "d", "label": "hydrosphere"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When rain (hydrosphere) helps a plant (biosphere) grow, two Earth systems are:$tl$, $tl$[{"id": "a", "label": "disappearing"}, {"id": "b", "label": "interacting"}, {"id": "c", "label": "stopping"}, {"id": "d", "label": "unrelated"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Wind in the atmosphere shaping a sand dune shows the atmosphere affecting the:$tl$, $tl$[{"id": "a", "label": "biosphere only"}, {"id": "b", "label": "geosphere"}, {"id": "c", "label": "nothing"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Plants taking in water from the soil connects the biosphere to the:$tl$, $tl$[{"id": "a", "label": "atmosphere only"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "hydrosphere and geosphere"}, {"id": "d", "label": "Sun core"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A volcano sends gas into the air - the geosphere is affecting the:$tl$, $tl$[{"id": "a", "label": "nothing"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "hydrosphere only"}, {"id": "d", "label": "atmosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Earth's four systems are atmosphere, hydrosphere, geosphere, and:$tl$, $tl$[{"id": "a", "label": "stratosphere"}, {"id": "b", "label": "exosphere"}, {"id": "c", "label": "ionosphere"}, {"id": "d", "label": "biosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Animals breathing connects the biosphere to the:$tl$, $tl$[{"id": "a", "label": "geosphere only"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "atmosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Ocean water evaporating into clouds links the hydrosphere to the:$tl$, $tl$[{"id": "a", "label": "geosphere only"}, {"id": "b", "label": "atmosphere"}, {"id": "c", "label": "biosphere only"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Tree roots breaking apart rock shows the biosphere changing the:$tl$, $tl$[{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "hydrosphere"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "geosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which system would a fish swimming in a lake belong to (the living part)?$tl$, $tl$[{"id": "a", "label": "hydrosphere"}, {"id": "b", "label": "geosphere"}, {"id": "c", "label": "atmosphere"}, {"id": "d", "label": "biosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A landslide (geosphere) dumping soil into a river affects the:$tl$, $tl$[{"id": "a", "label": "atmosphere only"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "Moon"}, {"id": "d", "label": "hydrosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Earth's systems are connected, so a change in one often:$tl$, $tl$[{"id": "a", "label": "affects nothing"}, {"id": "b", "label": "stops Earth"}, {"id": "c", "label": "affects the others"}, {"id": "d", "label": "is impossible"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$All of Earth's living things together make up the ____. (one word)$tl$, null, $tl$biosphere$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Clouds, wind, and rain are events happening in the:$tl$, $tl$[{"id": "a", "label": "geosphere"}, {"id": "b", "label": "atmosphere"}, {"id": "c", "label": "biosphere"}, {"id": "d", "label": "core"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Soil forms when rock (geosphere) is broken down with help from water and:$tl$, $tl$[{"id": "a", "label": "living things"}, {"id": "b", "label": "sunlight only"}, {"id": "c", "label": "the Moon"}, {"id": "d", "label": "wind only"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A coral reef is part of the biosphere living within the:$tl$, $tl$[{"id": "a", "label": "atmosphere"}, {"id": "b", "label": "geosphere core"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "hydrosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Studying how Earth's systems interact helps us understand:$tl$, $tl$[{"id": "a", "label": "other galaxies only"}, {"id": "b", "label": "weather, land, and life changes"}, {"id": "c", "label": "the alphabet"}, {"id": "d", "label": "math facts"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$earth-systems$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Water on Earth (5-ESS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$water-on-earth$tl$, $tl$Water on Earth$tl$, $tl$Most of Earth's water is salty ocean; only a small fraction is usable fresh water.$tl$, 5, $tl$5-ESS2-2$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Water on Earth$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Water on Earth", "body": "Most of Earth's water is salty ocean; only a small fraction is usable fresh water."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  About what fraction of Earth's water is salty ocean water?\n\nThe answer is \"most of it\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Most of Earth's FRESH water is frozen in:\n\nThe answer is \"ice caps and glaciers\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which is fresh water people can drink (when clean)?\n\nThe answer is \"river and lake water\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Only a small amount of Earth's water is fresh water that is:", "choices": [{"id": "a", "label": "easy to use (liquid)"}, {"id": "b", "label": "salty"}, {"id": "c", "label": "frozen forever only"}, {"id": "d", "label": "in space"}], "answer": "a", "explanation": "Yes! The answer is \"easy to use (liquid)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Ocean water is not good for drinking because it is too:", "choices": [{"id": "a", "label": "cold"}, {"id": "b", "label": "clean"}, {"id": "c", "label": "salty"}, {"id": "d", "label": "fresh"}], "answer": "c", "explanation": "Yes! The answer is \"salty\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Underground water stored in soil and rock is called:", "choices": [{"id": "a", "label": "ocean water"}, {"id": "b", "label": "groundwater"}, {"id": "c", "label": "cloud water"}, {"id": "d", "label": "glacier ice"}], "answer": "b", "explanation": "Yes! The answer is \"groundwater\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Water on Earth! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$About what fraction of Earth's water is salty ocean water?$tl$, $tl$[{"id": "a", "label": "almost none"}, {"id": "b", "label": "exactly half is fresh"}, {"id": "c", "label": "most of it"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Most of Earth's FRESH water is frozen in:$tl$, $tl$[{"id": "a", "label": "oceans"}, {"id": "b", "label": "ice caps and glaciers"}, {"id": "c", "label": "clouds"}, {"id": "d", "label": "lakes only"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is fresh water people can drink (when clean)?$tl$, $tl$[{"id": "a", "label": "ocean water"}, {"id": "b", "label": "sea water"}, {"id": "c", "label": "salty bay water"}, {"id": "d", "label": "river and lake water"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Only a small amount of Earth's water is fresh water that is:$tl$, $tl$[{"id": "a", "label": "salty"}, {"id": "b", "label": "easy to use (liquid)"}, {"id": "c", "label": "frozen forever only"}, {"id": "d", "label": "in space"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Ocean water is not good for drinking because it is too:$tl$, $tl$[{"id": "a", "label": "cold"}, {"id": "b", "label": "clean"}, {"id": "c", "label": "fresh"}, {"id": "d", "label": "salty"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Underground water stored in soil and rock is called:$tl$, $tl$[{"id": "a", "label": "ocean water"}, {"id": "b", "label": "cloud water"}, {"id": "c", "label": "glacier ice"}, {"id": "d", "label": "groundwater"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Because fresh, usable water is limited, it is important to:$tl$, $tl$[{"id": "a", "label": "waste it"}, {"id": "b", "label": "conserve it"}, {"id": "c", "label": "pour it out"}, {"id": "d", "label": "ignore it"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which holds the largest amount of water on Earth?$tl$, $tl$[{"id": "a", "label": "rivers"}, {"id": "b", "label": "oceans"}, {"id": "c", "label": "lakes"}, {"id": "d", "label": "clouds"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Glaciers and ice caps are mostly found:$tl$, $tl$[{"id": "a", "label": "at the equator beaches"}, {"id": "b", "label": "in deserts"}, {"id": "c", "label": "in cities"}, {"id": "d", "label": "near the poles and high mountains"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Turning salty ocean water into drinkable water is called:$tl$, $tl$[{"id": "a", "label": "evaporation only"}, {"id": "b", "label": "desalination"}, {"id": "c", "label": "pollution"}, {"id": "d", "label": "freezing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A model shows oceans as 97% and fresh water as about:$tl$, $tl$[{"id": "a", "label": "50%"}, {"id": "b", "label": "3%"}, {"id": "c", "label": "80%"}, {"id": "d", "label": "0%"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which uses fresh water?$tl$, $tl$[{"id": "a", "label": "only swimming in the sea"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "only ships"}, {"id": "d", "label": "drinking and farming"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Why is protecting rivers and lakes important?$tl$, $tl$[{"id": "a", "label": "they are salty"}, {"id": "b", "label": "no one uses them"}, {"id": "c", "label": "they are key fresh-water sources"}, {"id": "d", "label": "they are in space"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Most liquid fresh water that people use comes from rivers, lakes, and:$tl$, $tl$[{"id": "a", "label": "the ocean"}, {"id": "b", "label": "groundwater"}, {"id": "c", "label": "glaciers melting only"}, {"id": "d", "label": "rain in the sea"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If a town pollutes its only river, the people may run short of:$tl$, $tl$[{"id": "a", "label": "salt"}, {"id": "b", "label": "ice"}, {"id": "c", "label": "air"}, {"id": "d", "label": "clean fresh water"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Water that is not salty and that we can drink is called ____ water. (one word)$tl$, null, $tl$fresh$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The water cycle keeps moving water between the oceans, air, and:$tl$, $tl$[{"id": "a", "label": "space"}, {"id": "b", "label": "the Sun"}, {"id": "c", "label": "the Moon"}, {"id": "d", "label": "land"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is the best way to save fresh water at home?$tl$, $tl$[{"id": "a", "label": "leave the hose running"}, {"id": "b", "label": "turn off the tap while brushing"}, {"id": "c", "label": "take very long showers"}, {"id": "d", "label": "pour water on the road"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Polar ice caps store fresh water as:$tl$, $tl$[{"id": "a", "label": "salty liquid"}, {"id": "b", "label": "solid ice"}, {"id": "c", "label": "steam"}, {"id": "d", "label": "sand"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Because so little water is usable fresh water, clean water is a precious:$tl$, $tl$[{"id": "a", "label": "toy"}, {"id": "b", "label": "color"}, {"id": "c", "label": "resource"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Protecting Earth's Resources (5-ESS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$protecting-resources$tl$, $tl$Protecting Earth's Resources$tl$, $tl$People can protect Earth by reducing, reusing, recycling, and using renewable energy.$tl$, 5, $tl$5-ESS3-1$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Protecting Earth's Resources$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Protecting Earth's Resources", "body": "People can protect Earth by reducing, reusing, recycling, and using renewable energy."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Using fewer resources and reusing items helps:\n\nThe answer is \"protect the environment\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The three R's that reduce waste are reduce, reuse, and:\n\nThe answer is \"recycle\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which is a renewable energy source?\n\nThe answer is \"sunlight\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Burning fossil fuels like coal and oil adds pollution and:", "choices": [{"id": "a", "label": "greenhouse gases"}, {"id": "b", "label": "clean air"}, {"id": "c", "label": "fresh water"}, {"id": "d", "label": "oxygen"}], "answer": "a", "explanation": "Yes! The answer is \"greenhouse gases\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Planting trees helps because trees clean the air and provide:", "choices": [{"id": "a", "label": "plastic"}, {"id": "b", "label": "gasoline"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "oxygen and habitat"}], "answer": "d", "explanation": "Yes! The answer is \"oxygen and habitat\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which action best conserves water?", "choices": [{"id": "a", "label": "letting taps run"}, {"id": "b", "label": "watering pavement"}, {"id": "c", "label": "ignoring leaks"}, {"id": "d", "label": "fixing leaky faucets"}], "answer": "d", "explanation": "Yes! The answer is \"fixing leaky faucets\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Protecting Earth's Resources! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Using fewer resources and reusing items helps:$tl$, $tl$[{"id": "a", "label": "waste more"}, {"id": "b", "label": "pollute more"}, {"id": "c", "label": "protect the environment"}, {"id": "d", "label": "use up oil faster"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The three R's that reduce waste are reduce, reuse, and:$tl$, $tl$[{"id": "a", "label": "remove"}, {"id": "b", "label": "recycle"}, {"id": "c", "label": "ruin"}, {"id": "d", "label": "rush"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is a renewable energy source?$tl$, $tl$[{"id": "a", "label": "coal"}, {"id": "b", "label": "oil"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "natural gas"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Burning fossil fuels like coal and oil adds pollution and:$tl$, $tl$[{"id": "a", "label": "greenhouse gases"}, {"id": "b", "label": "clean air"}, {"id": "c", "label": "fresh water"}, {"id": "d", "label": "oxygen"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Planting trees helps because trees clean the air and provide:$tl$, $tl$[{"id": "a", "label": "oxygen and habitat"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "gasoline"}, {"id": "d", "label": "metal"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which action best conserves water?$tl$, $tl$[{"id": "a", "label": "letting taps run"}, {"id": "b", "label": "watering pavement"}, {"id": "c", "label": "ignoring leaks"}, {"id": "d", "label": "fixing leaky faucets"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Recycling paper helps protect:$tl$, $tl$[{"id": "a", "label": "oceans of oil"}, {"id": "b", "label": "forests (trees)"}, {"id": "c", "label": "the Sun"}, {"id": "d", "label": "metal mines only"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Wind and solar power are better for the air than fossil fuels because they create:$tl$, $tl$[{"id": "a", "label": "more smog"}, {"id": "b", "label": "more oil"}, {"id": "c", "label": "little or no pollution"}, {"id": "d", "label": "more coal"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Throwing trash in rivers and oceans harms:$tl$, $tl$[{"id": "a", "label": "only rocks"}, {"id": "b", "label": "water animals and plants"}, {"id": "c", "label": "nothing"}, {"id": "d", "label": "the Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is a way individuals can reduce pollution?$tl$, $tl$[{"id": "a", "label": "burn more trash"}, {"id": "b", "label": "leave lights on"}, {"id": "c", "label": "waste paper"}, {"id": "d", "label": "ride a bike or walk"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Protecting habitats helps keep many kinds of living things, called:$tl$, $tl$[{"id": "a", "label": "biodiversity"}, {"id": "b", "label": "pollution"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "traffic"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A nonrenewable resource is one that:$tl$, $tl$[{"id": "a", "label": "can run out"}, {"id": "b", "label": "never runs out"}, {"id": "c", "label": "grows back fast"}, {"id": "d", "label": "is unlimited"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Composting food scraps helps by:$tl$, $tl$[{"id": "a", "label": "making more garbage"}, {"id": "b", "label": "polluting water"}, {"id": "c", "label": "wasting food"}, {"id": "d", "label": "returning nutrients to soil and cutting trash"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Turning off lights and devices you aren't using conserves:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "energy"}, {"id": "c", "label": "trees"}, {"id": "d", "label": "air"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which choice is most eco-friendly for shopping?$tl$, $tl$[{"id": "a", "label": "take many plastic bags"}, {"id": "b", "label": "double-bag everything"}, {"id": "c", "label": "bring a reusable bag"}, {"id": "d", "label": "litter the receipt"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$To reduce, reuse, and ____ are the three R's of cutting waste. (one word)$tl$, null, $tl$recycle$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Oil spills in the ocean are harmful because they:$tl$, $tl$[{"id": "a", "label": "help fish breathe"}, {"id": "b", "label": "clean the water"}, {"id": "c", "label": "poison and coat sea life"}, {"id": "d", "label": "make more fish"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Communities protect water by treating sewage and limiting:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "clean water"}, {"id": "c", "label": "fresh air"}, {"id": "d", "label": "sunlight"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is the most sustainable way to get electricity?$tl$, $tl$[{"id": "a", "label": "solar and wind"}, {"id": "b", "label": "burning more coal"}, {"id": "c", "label": "burning more oil"}, {"id": "d", "label": "burning trash only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Caring for Earth's resources helps make sure they last for:$tl$, $tl$[{"id": "a", "label": "nobody"}, {"id": "b", "label": "only today"}, {"id": "c", "label": "future generations"}, {"id": "d", "label": "robots only"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$protecting-resources$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Patterns in the Sky (5-ESS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$patterns-in-the-sky$tl$, $tl$Patterns in the Sky$tl$, $tl$Earth's rotation and orbit cause day/night, seasons, shadows, and the Moon's phases.$tl$, 5, $tl$5-ESS1-2$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Patterns in the Sky$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Patterns in the Sky", "body": "Earth's rotation and orbit cause day/night, seasons, shadows, and the Moon's phases."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The Sun appears to rise in the east and set in the:\n\nThe answer is \"west\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Day and night are caused by Earth:\n\nThe answer is \"rotating (spinning) once a day\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The seasons are caused by Earth's tilt as it:\n\nThe answer is \"orbits the Sun\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Stars appear to move across the night sky because Earth:", "choices": [{"id": "a", "label": "is exploding"}, {"id": "b", "label": "is shrinking"}, {"id": "c", "label": "makes the stars"}, {"id": "d", "label": "is rotating"}], "answer": "d", "explanation": "Yes! The answer is \"is rotating\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A shadow from a stick is longest when the Sun is:", "choices": [{"id": "a", "label": "directly overhead"}, {"id": "b", "label": "gone"}, {"id": "c", "label": "behind the Moon"}, {"id": "d", "label": "low in the sky"}], "answer": "d", "explanation": "Yes! The answer is \"low in the sky\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "At noon, when the Sun is highest, shadows are:", "choices": [{"id": "a", "label": "longest"}, {"id": "b", "label": "shortest"}, {"id": "c", "label": "gone forever"}, {"id": "d", "label": "pointing up"}], "answer": "b", "explanation": "Yes! The answer is \"shortest\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Patterns in the Sky! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The Sun appears to rise in the east and set in the:$tl$, $tl$[{"id": "a", "label": "north"}, {"id": "b", "label": "south"}, {"id": "c", "label": "ground"}, {"id": "d", "label": "west"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Day and night are caused by Earth:$tl$, $tl$[{"id": "a", "label": "orbiting the Sun once a year"}, {"id": "b", "label": "stopping"}, {"id": "c", "label": "rotating (spinning) once a day"}, {"id": "d", "label": "growing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The seasons are caused by Earth's tilt as it:$tl$, $tl$[{"id": "a", "label": "orbits the Sun"}, {"id": "b", "label": "spins once a day"}, {"id": "c", "label": "stops"}, {"id": "d", "label": "shrinks"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Stars appear to move across the night sky because Earth:$tl$, $tl$[{"id": "a", "label": "is exploding"}, {"id": "b", "label": "is rotating"}, {"id": "c", "label": "is shrinking"}, {"id": "d", "label": "makes the stars"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A shadow from a stick is longest when the Sun is:$tl$, $tl$[{"id": "a", "label": "low in the sky"}, {"id": "b", "label": "directly overhead"}, {"id": "c", "label": "gone"}, {"id": "d", "label": "behind the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$At noon, when the Sun is highest, shadows are:$tl$, $tl$[{"id": "a", "label": "longest"}, {"id": "b", "label": "gone forever"}, {"id": "c", "label": "shortest"}, {"id": "d", "label": "pointing up"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The changing shapes of the Moon over a month are called the Moon's:$tl$, $tl$[{"id": "a", "label": "phases"}, {"id": "b", "label": "seasons"}, {"id": "c", "label": "shadows"}, {"id": "d", "label": "stars"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$One full set of Moon phases takes about:$tl$, $tl$[{"id": "a", "label": "a day"}, {"id": "b", "label": "a month"}, {"id": "c", "label": "a year"}, {"id": "d", "label": "an hour"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Different stars are visible in different seasons because Earth:$tl$, $tl$[{"id": "a", "label": "orbits the Sun"}, {"id": "b", "label": "spins faster"}, {"id": "c", "label": "stops"}, {"id": "d", "label": "makes stars"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The Sun is actually a:$tl$, $tl$[{"id": "a", "label": "planet"}, {"id": "b", "label": "moon"}, {"id": "c", "label": "star"}, {"id": "d", "label": "comet"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Some stars look brighter than others mainly because of their size and:$tl$, $tl$[{"id": "a", "label": "color of light only"}, {"id": "b", "label": "distance from Earth"}, {"id": "c", "label": "temperature on Earth"}, {"id": "d", "label": "the day of the week"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A sundial tells time using the position of a:$tl$, $tl$[{"id": "a", "label": "star"}, {"id": "b", "label": "cloud"}, {"id": "c", "label": "raindrop"}, {"id": "d", "label": "shadow"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$We always see the same side of the Moon because of how it:$tl$, $tl$[{"id": "a", "label": "stops spinning"}, {"id": "b", "label": "explodes"}, {"id": "c", "label": "hides"}, {"id": "d", "label": "spins as it orbits Earth"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The pattern of day length changes with the seasons: summer days are:$tl$, $tl$[{"id": "a", "label": "shorter"}, {"id": "b", "label": "the same"}, {"id": "c", "label": "gone"}, {"id": "d", "label": "longer"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Because these sky events repeat in patterns, we can:$tl$, $tl$[{"id": "a", "label": "never know them"}, {"id": "b", "label": "stop them"}, {"id": "c", "label": "create them"}, {"id": "d", "label": "predict them"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The repeating changes in the Moon's appearance are called its ____. (one word)$tl$, null, $tl$phases$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The North Star appears to stay nearly still because it is near Earth's:$tl$, $tl$[{"id": "a", "label": "equator"}, {"id": "b", "label": "axis (line of spin)"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "core only"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Earth takes about 365 days to make one:$tl$, $tl$[{"id": "a", "label": "spin"}, {"id": "b", "label": "Moon phase"}, {"id": "c", "label": "orbit around the Sun"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A solar eclipse happens when the Moon passes between Earth and the:$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "stars"}, {"id": "d", "label": "North Star"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Constellations are patterns of:$tl$, $tl$[{"id": "a", "label": "stars"}, {"id": "b", "label": "clouds"}, {"id": "c", "label": "planets only"}, {"id": "d", "label": "comets"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$patterns-in-the-sky$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Gravity (5-PS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$gravity$tl$, $tl$Gravity$tl$, $tl$Gravity is a force that pulls objects toward Earth's center and holds planets in orbit.$tl$, 5, $tl$5-PS2-1$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Gravity$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Gravity", "body": "Gravity is a force that pulls objects toward Earth's center and holds planets in orbit."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The force that pulls objects toward Earth is:\n\nThe answer is \"gravity\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  When you drop a ball, gravity pulls it:\n\nThe answer is \"down toward Earth's center\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Gravity is what keeps the Moon in orbit around:\n\nThe answer is \"Earth\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Without gravity, objects on Earth would:", "choices": [{"id": "a", "label": "float away"}, {"id": "b", "label": "fall faster"}, {"id": "c", "label": "stay the same"}, {"id": "d", "label": "get heavier"}], "answer": "a", "explanation": "Yes! The answer is \"float away\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Weight is a measure of the pull of ____ on an object.", "choices": [{"id": "a", "label": "friction"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "light"}, {"id": "d", "label": "gravity"}], "answer": "d", "explanation": "Yes! The answer is \"gravity\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Earth's gravity points toward Earth's:", "choices": [{"id": "a", "label": "the sky"}, {"id": "b", "label": "the Moon"}, {"id": "c", "label": "center"}, {"id": "d", "label": "the Sun"}], "answer": "c", "explanation": "Yes! The answer is \"center\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Gravity! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The force that pulls objects toward Earth is:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "friction"}, {"id": "c", "label": "magnetism"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When you drop a ball, gravity pulls it:$tl$, $tl$[{"id": "a", "label": "up to the sky"}, {"id": "b", "label": "sideways"}, {"id": "c", "label": "down toward Earth's center"}, {"id": "d", "label": "apart"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Gravity is what keeps the Moon in orbit around:$tl$, $tl$[{"id": "a", "label": "the Sun only"}, {"id": "b", "label": "Mars"}, {"id": "c", "label": "Earth"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Without gravity, objects on Earth would:$tl$, $tl$[{"id": "a", "label": "float away"}, {"id": "b", "label": "fall faster"}, {"id": "c", "label": "stay the same"}, {"id": "d", "label": "get heavier"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Weight is a measure of the pull of ____ on an object.$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Earth's gravity points toward Earth's:$tl$, $tl$[{"id": "a", "label": "the sky"}, {"id": "b", "label": "the Moon"}, {"id": "c", "label": "center"}, {"id": "d", "label": "the Sun"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Astronauts seem to float in orbit because they are in:$tl$, $tl$[{"id": "a", "label": "a place with no gravity at all"}, {"id": "b", "label": "outer galaxies"}, {"id": "c", "label": "continuous free fall around Earth"}, {"id": "d", "label": "a magnet field"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which falls because of gravity?$tl$, $tl$[{"id": "a", "label": "a balloon rising in air"}, {"id": "b", "label": "smoke going up"}, {"id": "c", "label": "a dropped apple"}, {"id": "d", "label": "a floating bubble going up"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Gravity also holds the planets in orbit around the:$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "North Star"}, {"id": "d", "label": "Earth"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$On the Moon, gravity is weaker, so you would weigh:$tl$, $tl$[{"id": "a", "label": "more"}, {"id": "b", "label": "exactly the same"}, {"id": "c", "label": "nothing at all"}, {"id": "d", "label": "less than on Earth"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A ball thrown up comes back down because gravity:$tl$, $tl$[{"id": "a", "label": "pushes it away"}, {"id": "b", "label": "disappears"}, {"id": "c", "label": "turns to friction"}, {"id": "d", "label": "pulls it back toward Earth"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The direction we call 'down' is really the direction of Earth's:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "rotation"}, {"id": "c", "label": "magnetism"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Heavier and lighter objects dropped together (no air) hit the ground:$tl$, $tl$[{"id": "a", "label": "at the same time"}, {"id": "b", "label": "heavier first always"}, {"id": "c", "label": "lighter first"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Gravity gets weaker as objects get:$tl$, $tl$[{"id": "a", "label": "farther apart"}, {"id": "b", "label": "closer"}, {"id": "c", "label": "heavier"}, {"id": "d", "label": "colder"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$What keeps the oceans and atmosphere on Earth?$tl$, $tl$[{"id": "a", "label": "wind"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "the Moon only"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The force that pulls everything toward Earth is ____. (one word)$tl$, null, $tl$gravity$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A skydiver falls because the force of gravity is greater than the:$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "air resistance (at first)"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "magnetism"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$More massive objects, like planets, have:$tl$, $tl$[{"id": "a", "label": "no gravity"}, {"id": "b", "label": "weaker gravity than a pebble"}, {"id": "c", "label": "stronger gravity"}, {"id": "d", "label": "gravity made of light"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Why don't we fall off the 'bottom' of the round Earth?$tl$, $tl$[{"id": "a", "label": "we are glued"}, {"id": "b", "label": "there is no bottom person"}, {"id": "c", "label": "the air holds us"}, {"id": "d", "label": "gravity pulls us toward the center everywhere"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The Sun's strong gravity keeps Earth:$tl$, $tl$[{"id": "a", "label": "spinning only"}, {"id": "b", "label": "orbiting it"}, {"id": "c", "label": "cold"}, {"id": "d", "label": "still"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$gravity$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Main Idea & Details (RI.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$main-idea-and-details$tl$, $tl$Main Idea & Details$tl$, $tl$The main idea is a text's key point; supporting details explain and back it up.$tl$, 5, $tl$RI.5.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Main Idea & Details$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Main Idea & Details", "body": "The main idea is a text's key point; supporting details explain and back it up."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Read: \"Sea otters are vital to kelp forests. They eat sea urchins, which would otherwise destroy the kelp.\" The main idea is that sea otters:\n\nThe answer is \"help protect kelp forests\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"Volcanoes can be destructive, but volcanic ash also enriches soil and creates fertile farmland.\" The main idea is that volcanoes:\n\nThe answer is \"can be both harmful and helpful\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  In the otter passage, which is a supporting detail?\n\nThe answer is \"they eat sea urchins\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Recycling conserves resources by saving trees, reducing energy use, and cutting landfill waste.\" A supporting detail is that recycling:", "choices": [{"id": "a", "label": "reduces energy use"}, {"id": "b", "label": "is colorful"}, {"id": "c", "label": "is difficult"}, {"id": "d", "label": "is loud"}], "answer": "a", "explanation": "Yes! The answer is \"reduces energy use\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The main idea of a paragraph is usually:", "choices": [{"id": "a", "label": "its most important point"}, {"id": "b", "label": "the longest sentence"}, {"id": "c", "label": "the first word"}, {"id": "d", "label": "a random fact"}], "answer": "a", "explanation": "Yes! The answer is \"its most important point\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Honeybee numbers are falling due to pesticides, disease, and habitat loss, threatening the crops they pollinate.\" The main idea is that:", "choices": [{"id": "a", "label": "declining bees endanger our crops"}, {"id": "b", "label": "bees make honey"}, {"id": "c", "label": "bees sting"}, {"id": "d", "label": "flowers are pretty"}], "answer": "a", "explanation": "Yes! The answer is \"declining bees endanger our crops\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Main Idea & Details! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Sea otters are vital to kelp forests. They eat sea urchins, which would otherwise destroy the kelp." The main idea is that sea otters:$tl$, $tl$[{"id": "a", "label": "are cute"}, {"id": "b", "label": "sleep in water"}, {"id": "c", "label": "help protect kelp forests"}, {"id": "d", "label": "are large"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Volcanoes can be destructive, but volcanic ash also enriches soil and creates fertile farmland." The main idea is that volcanoes:$tl$, $tl$[{"id": "a", "label": "are always safe"}, {"id": "b", "label": "can be both harmful and helpful"}, {"id": "c", "label": "never erupt"}, {"id": "d", "label": "are tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$In the otter passage, which is a supporting detail?$tl$, $tl$[{"id": "a", "label": "the ocean is blue"}, {"id": "b", "label": "otters are mammals"}, {"id": "c", "label": "they eat sea urchins"}, {"id": "d", "label": "kelp is green"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Recycling conserves resources by saving trees, reducing energy use, and cutting landfill waste." A supporting detail is that recycling:$tl$, $tl$[{"id": "a", "label": "is colorful"}, {"id": "b", "label": "is difficult"}, {"id": "c", "label": "is loud"}, {"id": "d", "label": "reduces energy use"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The main idea of a paragraph is usually:$tl$, $tl$[{"id": "a", "label": "the longest sentence"}, {"id": "b", "label": "the first word"}, {"id": "c", "label": "its most important point"}, {"id": "d", "label": "a random fact"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Honeybee numbers are falling due to pesticides, disease, and habitat loss, threatening the crops they pollinate." The main idea is that:$tl$, $tl$[{"id": "a", "label": "declining bees endanger our crops"}, {"id": "b", "label": "bees make honey"}, {"id": "c", "label": "bees sting"}, {"id": "d", "label": "flowers are pretty"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Supporting details in a text are there to:$tl$, $tl$[{"id": "a", "label": "distract the reader"}, {"id": "b", "label": "end the story"}, {"id": "c", "label": "list the title"}, {"id": "d", "label": "explain or back up the main idea"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The Great Barrier Reef hosts thousands of species, but warming oceans are bleaching its coral." The main idea is that the reef:$tl$, $tl$[{"id": "a", "label": "is small"}, {"id": "b", "label": "has no animals"}, {"id": "c", "label": "is rich in life but under threat"}, {"id": "d", "label": "is on land"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence would best support the main idea 'exercise improves health'?$tl$, $tl$[{"id": "a", "label": "Gyms can be crowded."}, {"id": "b", "label": "Shoes come in many colors."}, {"id": "c", "label": "It strengthens the heart and muscles."}, {"id": "d", "label": "Mornings are early."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Migratory birds travel thousands of miles, using stars, the sun, and Earth's magnetic field to navigate." The main idea is that migratory birds:$tl$, $tl$[{"id": "a", "label": "are colorful"}, {"id": "b", "label": "navigate huge distances using natural cues"}, {"id": "c", "label": "build nests"}, {"id": "d", "label": "eat seeds"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A detail that does NOT support the main idea is called:$tl$, $tl$[{"id": "a", "label": "essential"}, {"id": "b", "label": "central"}, {"id": "c", "label": "irrelevant"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Ancient Egyptians built pyramids as tombs, using ramps, levers, and thousands of workers." A key detail is that they used:$tl$, $tl$[{"id": "a", "label": "ramps and levers"}, {"id": "b", "label": "cars"}, {"id": "c", "label": "electric cranes"}, {"id": "d", "label": "helicopters"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To find the main idea, ask yourself:$tl$, $tl$[{"id": "a", "label": "how long is it?"}, {"id": "b", "label": "who printed it?"}, {"id": "c", "label": "what is the last word?"}, {"id": "d", "label": "what is this mostly about?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Coral reefs protect coastlines, support fisheries, and may hold new medicines." The main idea is that coral reefs:$tl$, $tl$[{"id": "a", "label": "are only pretty"}, {"id": "b", "label": "are valuable in many ways"}, {"id": "c", "label": "are useless"}, {"id": "d", "label": "are dry"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two paragraphs about the same topic together support the text's:$tl$, $tl$[{"id": "a", "label": "central (main) idea"}, {"id": "b", "label": "page number"}, {"id": "c", "label": "author bio"}, {"id": "d", "label": "glossary"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The most important point a passage makes is its ____ idea. (one word)$tl$, null, $tl$main$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Rainforests produce much of Earth's oxygen, yet they are being cut down rapidly." The main idea is that rainforests:$tl$, $tl$[{"id": "a", "label": "are dry"}, {"id": "b", "label": "are important but threatened"}, {"id": "c", "label": "are useless"}, {"id": "d", "label": "never change"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A strong summary of a text focuses on the main idea and the:$tl$, $tl$[{"id": "a", "label": "smallest details"}, {"id": "b", "label": "most important details"}, {"id": "c", "label": "author's name"}, {"id": "d", "label": "page count"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Wolves reintroduced to Yellowstone reshaped the whole ecosystem, even changing rivers." The main idea is that wolves:$tl$, $tl$[{"id": "a", "label": "are scary"}, {"id": "b", "label": "had wide effects on the ecosystem"}, {"id": "c", "label": "are large"}, {"id": "d", "label": "howl loudly"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which best states a main idea?$tl$, $tl$[{"id": "a", "label": "Bees have six legs."}, {"id": "b", "label": "Some flowers are yellow."}, {"id": "c", "label": "Pollinators are essential to our food supply."}, {"id": "d", "label": "It was a sunny day."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea-and-details$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Theme (RL.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$theme$tl$, $tl$Theme$tl$, $tl$A theme is the lesson or message a story conveys, usually shown through what characters learn.$tl$, 5, $tl$RL.5.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Theme$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Theme", "body": "A theme is the lesson or message a story conveys, usually shown through what characters learn."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A theme is the:\n\nThe answer is \"lesson or message of a story\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"After failing many times, Mia finally built her robot by never giving up.\" A theme is:\n\nThe answer is \"perseverance pays off\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A story where a selfish king learns to share teaches a theme about:\n\nThe answer is \"generosity / kindness\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Theme is different from plot because theme is the:", "choices": [{"id": "a", "label": "sequence of events"}, {"id": "b", "label": "list of characters"}, {"id": "c", "label": "the setting only"}, {"id": "d", "label": "underlying message"}], "answer": "d", "explanation": "Yes! The answer is \"underlying message\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"The two rivals worked together to survive the storm and became friends.\" A theme is:", "choices": [{"id": "a", "label": "cooperation / friendship"}, {"id": "b", "label": "enemies forever"}, {"id": "c", "label": "storms are fun"}, {"id": "d", "label": "ignore others"}], "answer": "a", "explanation": "Yes! The answer is \"cooperation / friendship\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A common theme in many fables is:", "choices": [{"id": "a", "label": "honesty is important"}, {"id": "b", "label": "lying wins"}, {"id": "c", "label": "be cruel"}, {"id": "d", "label": "never learn"}], "answer": "a", "explanation": "Yes! The answer is \"honesty is important\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Theme! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A theme is the:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "main character's name"}, {"id": "c", "label": "lesson or message of a story"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "After failing many times, Mia finally built her robot by never giving up." A theme is:$tl$, $tl$[{"id": "a", "label": "robots are easy"}, {"id": "b", "label": "never try"}, {"id": "c", "label": "perseverance pays off"}, {"id": "d", "label": "give up early"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A story where a selfish king learns to share teaches a theme about:$tl$, $tl$[{"id": "a", "label": "greed is good"}, {"id": "b", "label": "generosity / kindness"}, {"id": "c", "label": "kings are tall"}, {"id": "d", "label": "castles are old"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Theme is different from plot because theme is the:$tl$, $tl$[{"id": "a", "label": "sequence of events"}, {"id": "b", "label": "underlying message"}, {"id": "c", "label": "list of characters"}, {"id": "d", "label": "the setting only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The two rivals worked together to survive the storm and became friends." A theme is:$tl$, $tl$[{"id": "a", "label": "enemies forever"}, {"id": "b", "label": "storms are fun"}, {"id": "c", "label": "ignore others"}, {"id": "d", "label": "cooperation / friendship"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A common theme in many fables is:$tl$, $tl$[{"id": "a", "label": "honesty is important"}, {"id": "b", "label": "lying wins"}, {"id": "c", "label": "be cruel"}, {"id": "d", "label": "never learn"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To find a theme, look at what the characters:$tl$, $tl$[{"id": "a", "label": "are named"}, {"id": "b", "label": "learn or how they change"}, {"id": "c", "label": "wear"}, {"id": "d", "label": "eat for lunch"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Even though everyone doubted her, Ana stayed true to herself and succeeded." The theme is about:$tl$, $tl$[{"id": "a", "label": "following the crowd"}, {"id": "b", "label": "believing in yourself"}, {"id": "c", "label": "quitting"}, {"id": "d", "label": "cheating"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A theme is usually stated:$tl$, $tl$[{"id": "a", "label": "in the title only"}, {"id": "b", "label": "in the page number"}, {"id": "c", "label": "indirectly, through the story"}, {"id": "d", "label": "never at all"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The boy shared his last bread with a stranger, who later saved his life." A theme is:$tl$, $tl$[{"id": "a", "label": "keep everything"}, {"id": "b", "label": "strangers are bad"}, {"id": "c", "label": "kindness comes back to you"}, {"id": "d", "label": "never share"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is a theme, not a topic?$tl$, $tl$[{"id": "a", "label": "dragons"}, {"id": "b", "label": "a forest"}, {"id": "c", "label": "a knight"}, {"id": "d", "label": "Courage can overcome fear."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two different stories can share the same theme, such as:$tl$, $tl$[{"id": "a", "label": "the same exact words"}, {"id": "b", "label": "the same author always"}, {"id": "c", "label": "love conquers hardship"}, {"id": "d", "label": "the same page count"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Despite losing the race, Sam was proud he had done his best." The theme is:$tl$, $tl$[{"id": "a", "label": "effort matters more than winning"}, {"id": "b", "label": "winning is everything"}, {"id": "c", "label": "never race"}, {"id": "d", "label": "cheat to win"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A theme often applies:$tl$, $tl$[{"id": "a", "label": "only to that one page"}, {"id": "b", "label": "to real life beyond the story"}, {"id": "c", "label": "to the title font"}, {"id": "d", "label": "to nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The villagers ignored warnings and lost their crops to the flood." A theme is:$tl$, $tl$[{"id": "a", "label": "ignore advice"}, {"id": "b", "label": "heeding warnings / responsibility"}, {"id": "c", "label": "floods are fun"}, {"id": "d", "label": "crops are boring"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The message or lesson of a story is its ____. (one word)$tl$, null, $tl$theme$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "She forgave her friend's mistake, and their bond grew stronger." The theme is about:$tl$, $tl$[{"id": "a", "label": "revenge"}, {"id": "b", "label": "greed"}, {"id": "c", "label": "forgiveness"}, {"id": "d", "label": "fear"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which question helps you find a theme?$tl$, $tl$[{"id": "a", "label": "What did the character learn?"}, {"id": "b", "label": "How many pages?"}, {"id": "c", "label": "What is the cover color?"}, {"id": "d", "label": "Who published it?"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A story showing that working hard leads to success has a theme of:$tl$, $tl$[{"id": "a", "label": "luck only"}, {"id": "b", "label": "laziness"}, {"id": "c", "label": "hard work / determination"}, {"id": "d", "label": "giving up"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The proud lion needed the tiny mouse's help, learning everyone matters." The theme is:$tl$, $tl$[{"id": "a", "label": "even the small can help"}, {"id": "b", "label": "the strong need no one"}, {"id": "c", "label": "mice are pests"}, {"id": "d", "label": "be proud always"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Summarizing (RI.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$summarizing$tl$, $tl$Summarizing$tl$, $tl$A summary retells the main idea and key details briefly, in your own words.$tl$, 5, $tl$RI.5.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Summarizing$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Summarizing", "body": "A summary retells the main idea and key details briefly, in your own words."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A good summary includes the main idea and the:\n\nThe answer is \"most important details\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A summary should be:\n\nThe answer is \"shorter than the original\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  When summarizing, you should leave out:\n\nThe answer is \"unimportant details\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A summary should be written in:", "choices": [{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "a secret code"}, {"id": "c", "label": "your own words"}, {"id": "d", "label": "no words"}], "answer": "c", "explanation": "Yes! The answer is \"your own words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The first step to summarizing is to:", "choices": [{"id": "a", "label": "identify the main idea"}, {"id": "b", "label": "copy the whole text"}, {"id": "c", "label": "read only the title"}, {"id": "d", "label": "skip to the end"}], "answer": "a", "explanation": "Yes! The answer is \"identify the main idea\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A summary of a story should keep events in:", "choices": [{"id": "a", "label": "random order"}, {"id": "b", "label": "reverse only"}, {"id": "c", "label": "no order"}, {"id": "d", "label": "the correct order"}], "answer": "d", "explanation": "Yes! The answer is \"the correct order\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Summarizing! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A good summary includes the main idea and the:$tl$, $tl$[{"id": "a", "label": "most important details"}, {"id": "b", "label": "every tiny detail"}, {"id": "c", "label": "your opinion"}, {"id": "d", "label": "a new ending"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary should be:$tl$, $tl$[{"id": "a", "label": "longer than the original"}, {"id": "b", "label": "exactly the same"}, {"id": "c", "label": "shorter than the original"}, {"id": "d", "label": "just the title"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When summarizing, you should leave out:$tl$, $tl$[{"id": "a", "label": "the main idea"}, {"id": "b", "label": "all the events"}, {"id": "c", "label": "unimportant details"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary should be written in:$tl$, $tl$[{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "a secret code"}, {"id": "c", "label": "no words"}, {"id": "d", "label": "your own words"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The first step to summarizing is to:$tl$, $tl$[{"id": "a", "label": "copy the whole text"}, {"id": "b", "label": "read only the title"}, {"id": "c", "label": "identify the main idea"}, {"id": "d", "label": "skip to the end"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary of a story should keep events in:$tl$, $tl$[{"id": "a", "label": "random order"}, {"id": "b", "label": "the correct order"}, {"id": "c", "label": "reverse only"}, {"id": "d", "label": "no order"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Adding your own opinion to a summary makes it:$tl$, $tl$[{"id": "a", "label": "no longer a true summary"}, {"id": "b", "label": "better always"}, {"id": "c", "label": "longer correctly"}, {"id": "d", "label": "more accurate"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "A long article explains how bees pollinate, make honey, and live in colonies." A good summary mentions:$tl$, $tl$[{"id": "a", "label": "pollination, honey, and colonies"}, {"id": "b", "label": "the font size"}, {"id": "c", "label": "the author's pet"}, {"id": "d", "label": "one random sentence"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Summarizing helps you:$tl$, $tl$[{"id": "a", "label": "forget the text"}, {"id": "b", "label": "make it longer"}, {"id": "c", "label": "understand and remember a text"}, {"id": "d", "label": "change the facts"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary of a how-to article should capture the:$tl$, $tl$[{"id": "a", "label": "every word"}, {"id": "b", "label": "none of the steps"}, {"id": "c", "label": "key steps"}, {"id": "d", "label": "only the title"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is the best summary of 'The hungry fox tried many times to reach grapes, failed, and walked away calling them sour'?$tl$, $tl$[{"id": "a", "label": "A fox failed to get grapes and pretended he didn't want them."}, {"id": "b", "label": "A fox liked grapes."}, {"id": "c", "label": "Grapes are sour."}, {"id": "d", "label": "Foxes are orange."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A retelling that includes every detail is:$tl$, $tl$[{"id": "a", "label": "too long to be a summary"}, {"id": "b", "label": "a perfect summary"}, {"id": "c", "label": "required"}, {"id": "d", "label": "best"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When you summarize nonfiction, focus on:$tl$, $tl$[{"id": "a", "label": "made-up parts"}, {"id": "b", "label": "your feelings"}, {"id": "c", "label": "main idea and key facts"}, {"id": "d", "label": "the page number"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary and the original text should have the same:$tl$, $tl$[{"id": "a", "label": "length"}, {"id": "b", "label": "main idea"}, {"id": "c", "label": "exact wording"}, {"id": "d", "label": "number of pages"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To shorten a paragraph into a summary, you:$tl$, $tl$[{"id": "a", "label": "add more sentences"}, {"id": "b", "label": "repeat it twice"}, {"id": "c", "label": "combine ideas and drop minor details"}, {"id": "d", "label": "copy it"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A short retelling of a text's main points, in your own words, is a ____. (one word)$tl$, null, $tl$summary$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which detail would you leave OUT of a summary about a soccer game's result?$tl$, $tl$[{"id": "a", "label": "the final score"}, {"id": "b", "label": "who won"}, {"id": "c", "label": "the key goal"}, {"id": "d", "label": "the color of the referee's socks"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A summary should answer mainly:$tl$, $tl$[{"id": "a", "label": "how you felt only"}, {"id": "b", "label": "the publisher"}, {"id": "c", "label": "the price"}, {"id": "d", "label": "what happened and why it matters"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Good summarizers reread to make sure they captured the:$tl$, $tl$[{"id": "a", "label": "least important ideas"}, {"id": "b", "label": "longest words"}, {"id": "c", "label": "most important ideas"}, {"id": "d", "label": "page numbers"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A one-sentence summary is sometimes called the:$tl$, $tl$[{"id": "a", "label": "glossary"}, {"id": "b", "label": "index"}, {"id": "c", "label": "title page"}, {"id": "d", "label": "gist or main idea"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Making Inferences (RL.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$making-inferences$tl$, $tl$Making Inferences$tl$, $tl$An inference is a conclusion drawn from text clues plus what you already know.$tl$, 5, $tl$RL.5.1$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Making Inferences$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Making Inferences", "body": "An inference is a conclusion drawn from text clues plus what you already know."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An inference is a conclusion based on:\n\nThe answer is \"clues plus what you know\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"Maria grabbed her umbrella and rain boots before leaving.\" You can infer:\n\nThe answer is \"it is raining or about to\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"Jake's stomach growled as he stared at the clock near noon.\" Infer that Jake is:\n\nThe answer is \"hungry\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"The streets were empty and every shop was dark.\" You can infer it is:", "choices": [{"id": "a", "label": "a busy afternoon"}, {"id": "b", "label": "a parade"}, {"id": "c", "label": "lunchtime"}, {"id": "d", "label": "very early or very late"}], "answer": "d", "explanation": "Yes! The answer is \"very early or very late\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An author who doesn't state everything expects the reader to:", "choices": [{"id": "a", "label": "infer meaning from clues"}, {"id": "b", "label": "skip the text"}, {"id": "c", "label": "memorize it"}, {"id": "d", "label": "ignore details"}], "answer": "a", "explanation": "Yes! The answer is \"infer meaning from clues\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Tia hugged the trophy and beamed at the cheering crowd.\" Infer that Tia:", "choices": [{"id": "a", "label": "lost and is sad"}, {"id": "b", "label": "is bored"}, {"id": "c", "label": "won and is proud"}, {"id": "d", "label": "is afraid"}], "answer": "c", "explanation": "Yes! The answer is \"won and is proud\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Making Inferences! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An inference is a conclusion based on:$tl$, $tl$[{"id": "a", "label": "a wild guess"}, {"id": "b", "label": "clues plus what you know"}, {"id": "c", "label": "the title only"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Maria grabbed her umbrella and rain boots before leaving." You can infer:$tl$, $tl$[{"id": "a", "label": "it is sunny"}, {"id": "b", "label": "she is swimming"}, {"id": "c", "label": "it is night"}, {"id": "d", "label": "it is raining or about to"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Jake's stomach growled as he stared at the clock near noon." Infer that Jake is:$tl$, $tl$[{"id": "a", "label": "sleepy"}, {"id": "b", "label": "hungry"}, {"id": "c", "label": "cold"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The streets were empty and every shop was dark." You can infer it is:$tl$, $tl$[{"id": "a", "label": "very early or very late"}, {"id": "b", "label": "a busy afternoon"}, {"id": "c", "label": "a parade"}, {"id": "d", "label": "lunchtime"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An author who doesn't state everything expects the reader to:$tl$, $tl$[{"id": "a", "label": "skip the text"}, {"id": "b", "label": "memorize it"}, {"id": "c", "label": "infer meaning from clues"}, {"id": "d", "label": "ignore details"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Tia hugged the trophy and beamed at the cheering crowd." Infer that Tia:$tl$, $tl$[{"id": "a", "label": "lost and is sad"}, {"id": "b", "label": "is bored"}, {"id": "c", "label": "is afraid"}, {"id": "d", "label": "won and is proud"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He checked his rearview mirror, signaled, and merged." Infer that he is:$tl$, $tl$[{"id": "a", "label": "driving a car"}, {"id": "b", "label": "riding a bike"}, {"id": "c", "label": "walking"}, {"id": "d", "label": "swimming"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The classroom was silent; every desk was empty and the lights were off." Infer that:$tl$, $tl$[{"id": "a", "label": "class is full"}, {"id": "b", "label": "no one is there right now"}, {"id": "c", "label": "there is a party"}, {"id": "d", "label": "it is the middle of class"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To make a strong inference, your conclusion should be:$tl$, $tl$[{"id": "a", "label": "supported by text clues"}, {"id": "b", "label": "unrelated to the text"}, {"id": "c", "label": "random"}, {"id": "d", "label": "about the cover"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Sweat dripped as the team gulped water during the break." Infer that:$tl$, $tl$[{"id": "a", "label": "it is snowing"}, {"id": "b", "label": "they are asleep"}, {"id": "c", "label": "they are reading"}, {"id": "d", "label": "it is hot and they've been active"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Grandma set an extra plate and watched the clock by the window." Infer that:$tl$, $tl$[{"id": "a", "label": "she is leaving forever"}, {"id": "b", "label": "she broke a plate"}, {"id": "c", "label": "she is at school"}, {"id": "d", "label": "she is expecting a guest"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Inferences are sometimes called:$tl$, $tl$[{"id": "a", "label": "copying the lines"}, {"id": "b", "label": "reading between the lines"}, {"id": "c", "label": "skipping lines"}, {"id": "d", "label": "counting lines"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The dog hid under the bed and trembled at each thunderclap." Infer that the dog is:$tl$, $tl$[{"id": "a", "label": "hungry"}, {"id": "b", "label": "playful"}, {"id": "c", "label": "scared of the storm"}, {"id": "d", "label": "sleepy and calm"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Her eyes were red and she clutched a crumpled tissue." Infer that she has been:$tl$, $tl$[{"id": "a", "label": "laughing"}, {"id": "b", "label": "running"}, {"id": "c", "label": "crying"}, {"id": "d", "label": "sleeping"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A good inference can change if you find:$tl$, $tl$[{"id": "a", "label": "a longer book"}, {"id": "b", "label": "the page number"}, {"id": "c", "label": "new clues in the text"}, {"id": "d", "label": "the author's age"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A smart conclusion based on clues and prior knowledge is an ____. (one word)$tl$, null, $tl$inference$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Snow piled up and the school sign read 'Closed.'" Infer the kids will:$tl$, $tl$[{"id": "a", "label": "stay home"}, {"id": "b", "label": "go to class"}, {"id": "c", "label": "go swimming outside"}, {"id": "d", "label": "mow the lawn"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He tiptoed and whispered as he passed the nursery." Infer that:$tl$, $tl$[{"id": "a", "label": "a party is on"}, {"id": "b", "label": "a baby is sleeping"}, {"id": "c", "label": "he is shouting"}, {"id": "d", "label": "it is noon recess"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An inference differs from a fact stated in the text because it is:$tl$, $tl$[{"id": "a", "label": "printed in bold"}, {"id": "b", "label": "the title"}, {"id": "c", "label": "not directly written"}, {"id": "d", "label": "a heading"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The candles were lit and a wrapped box sat by a 'Happy Birthday' banner." Infer:$tl$, $tl$[{"id": "a", "label": "it's a school day"}, {"id": "b", "label": "it's someone's birthday"}, {"id": "c", "label": "someone is leaving"}, {"id": "d", "label": "it's breakfast"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$making-inferences$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Character Analysis (RL.5.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$character-analysis$tl$, $tl$Character Analysis$tl$, $tl$Understand characters through their words, actions, thoughts, and how they change.$tl$, 5, $tl$RL.5.3$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Character Analysis$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Character Analysis", "body": "Understand characters through their words, actions, thoughts, and how they change."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  To understand a character, pay attention to their words, thoughts, and:\n\nThe answer is \"actions\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"Lia gave her lunch to the new student and offered to show him around.\" Lia is:\n\nThe answer is \"kind and welcoming\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A character who changes and grows during a story is called:\n\nThe answer is \"dynamic\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"No matter how many times he failed, Sam tried again.\" Sam is:", "choices": [{"id": "a", "label": "lazy"}, {"id": "b", "label": "determined"}, {"id": "c", "label": "fearful"}, {"id": "d", "label": "careless"}], "answer": "b", "explanation": "Yes! The answer is \"determined\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A character's motivation is the:", "choices": [{"id": "a", "label": "their height"}, {"id": "b", "label": "their clothes"}, {"id": "c", "label": "reason they act"}, {"id": "d", "label": "their name"}], "answer": "c", "explanation": "Yes! The answer is \"reason they act\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"She lied to avoid blame, then felt guilty all night.\" This shows the character has a:", "choices": [{"id": "a", "label": "conscience (sense of right and wrong)"}, {"id": "b", "label": "fear of dogs"}, {"id": "c", "label": "love of math"}, {"id": "d", "label": "new bike"}], "answer": "a", "explanation": "Yes! The answer is \"conscience (sense of right and wrong)\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Character Analysis! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To understand a character, pay attention to their words, thoughts, and:$tl$, $tl$[{"id": "a", "label": "the page number"}, {"id": "b", "label": "the font"}, {"id": "c", "label": "the cover"}, {"id": "d", "label": "actions"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Lia gave her lunch to the new student and offered to show him around." Lia is:$tl$, $tl$[{"id": "a", "label": "selfish"}, {"id": "b", "label": "rude"}, {"id": "c", "label": "lazy"}, {"id": "d", "label": "kind and welcoming"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A character who changes and grows during a story is called:$tl$, $tl$[{"id": "a", "label": "flat / static"}, {"id": "b", "label": "dynamic"}, {"id": "c", "label": "invisible"}, {"id": "d", "label": "minor only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "No matter how many times he failed, Sam tried again." Sam is:$tl$, $tl$[{"id": "a", "label": "lazy"}, {"id": "b", "label": "fearful"}, {"id": "c", "label": "determined"}, {"id": "d", "label": "careless"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A character's motivation is the:$tl$, $tl$[{"id": "a", "label": "their height"}, {"id": "b", "label": "their clothes"}, {"id": "c", "label": "their name"}, {"id": "d", "label": "reason they act"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "She lied to avoid blame, then felt guilty all night." This shows the character has a:$tl$, $tl$[{"id": "a", "label": "fear of dogs"}, {"id": "b", "label": "conscience (sense of right and wrong)"}, {"id": "c", "label": "love of math"}, {"id": "d", "label": "new bike"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Marcus shared credit with his teammates after the win." Marcus is:$tl$, $tl$[{"id": "a", "label": "boastful"}, {"id": "b", "label": "cruel"}, {"id": "c", "label": "humble / generous"}, {"id": "d", "label": "jealous"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The main character a story centers on is the:$tl$, $tl$[{"id": "a", "label": "antagonist"}, {"id": "b", "label": "narrator only"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "protagonist"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A character who opposes the main character is the:$tl$, $tl$[{"id": "a", "label": "protagonist"}, {"id": "b", "label": "author"}, {"id": "c", "label": "reader"}, {"id": "d", "label": "antagonist"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Even when scared, Nina stepped forward to help." Nina is:$tl$, $tl$[{"id": "a", "label": "cowardly"}, {"id": "b", "label": "cruel"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$We learn about characters through what they do and what others:$tl$, $tl$[{"id": "a", "label": "eat"}, {"id": "b", "label": "say about them"}, {"id": "c", "label": "wear randomly"}, {"id": "d", "label": "weigh"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He snapped at everyone and refused to listen." The character seems:$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "patient"}, {"id": "c", "label": "irritable / closed-minded"}, {"id": "d", "label": "generous"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A character trait is a:$tl$, $tl$[{"id": "a", "label": "place they visit"}, {"id": "b", "label": "day of the week"}, {"id": "c", "label": "quality that describes who they are"}, {"id": "d", "label": "page number"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "She saved part of her allowance every week for a year." The character is:$tl$, $tl$[{"id": "a", "label": "impulsive"}, {"id": "b", "label": "wasteful"}, {"id": "c", "label": "patient and disciplined"}, {"id": "d", "label": "careless"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When a character faces a hard choice, it reveals their:$tl$, $tl$[{"id": "a", "label": "shoe size"}, {"id": "b", "label": "favorite color"}, {"id": "c", "label": "address"}, {"id": "d", "label": "values"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$The main character in a story is called the ____. (one word)$tl$, null, $tl$protagonist$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He apologized and worked to fix his mistake." This shows he is:$tl$, $tl$[{"id": "a", "label": "responsible"}, {"id": "b", "label": "careless"}, {"id": "c", "label": "proud"}, {"id": "d", "label": "cruel"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A 'flat' or 'static' character is one who:$tl$, $tl$[{"id": "a", "label": "does not change much"}, {"id": "b", "label": "changes a lot"}, {"id": "c", "label": "is the villain always"}, {"id": "d", "label": "narrates"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Despite the teasing, Ravi kept helping others." Ravi shows:$tl$, $tl$[{"id": "a", "label": "weakness"}, {"id": "b", "label": "resilience and kindness"}, {"id": "c", "label": "cruelty"}, {"id": "d", "label": "greed"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Comparing how a character acts at the start and end shows how they:$tl$, $tl$[{"id": "a", "label": "were printed"}, {"id": "b", "label": "changed (or didn't)"}, {"id": "c", "label": "were named"}, {"id": "d", "label": "were drawn"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-analysis$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Point of View (RL.5.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$point-of-view$tl$, $tl$Point of View$tl$, $tl$Point of view is the perspective a story is told from - first or third person.$tl$, 5, $tl$RL.5.6$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Point of View$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Point of View", "body": "Point of view is the perspective a story is told from - first or third person."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A story told using 'I' and 'me' is written in:\n\nThe answer is \"first person\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A story told using 'he', 'she', and 'they' is in:\n\nThe answer is \"third person\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The narrator is the:\n\nThe answer is \"one telling the story\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"I couldn't believe my eyes as I opened the door.\" This is:", "choices": [{"id": "a", "label": "first person"}, {"id": "b", "label": "third person"}, {"id": "c", "label": "second person"}, {"id": "d", "label": "no narrator"}], "answer": "a", "explanation": "Yes! The answer is \"first person\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"She wondered what was behind the door as he waited.\" This is:", "choices": [{"id": "a", "label": "first person"}, {"id": "b", "label": "second person"}, {"id": "c", "label": "third person"}, {"id": "d", "label": "fourth person"}], "answer": "c", "explanation": "Yes! The answer is \"third person\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Point of view is the:", "choices": [{"id": "a", "label": "page count"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "title"}, {"id": "d", "label": "perspective the story is told from"}], "answer": "d", "explanation": "Yes! The answer is \"perspective the story is told from\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Point of View! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A story told using 'I' and 'me' is written in:$tl$, $tl$[{"id": "a", "label": "second person"}, {"id": "b", "label": "first person"}, {"id": "c", "label": "third person"}, {"id": "d", "label": "no person"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A story told using 'he', 'she', and 'they' is in:$tl$, $tl$[{"id": "a", "label": "third person"}, {"id": "b", "label": "first person"}, {"id": "c", "label": "second person"}, {"id": "d", "label": "my person"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The narrator is the:$tl$, $tl$[{"id": "a", "label": "main villain"}, {"id": "b", "label": "reader"}, {"id": "c", "label": "one telling the story"}, {"id": "d", "label": "author's pet"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "I couldn't believe my eyes as I opened the door." This is:$tl$, $tl$[{"id": "a", "label": "third person"}, {"id": "b", "label": "first person"}, {"id": "c", "label": "second person"}, {"id": "d", "label": "no narrator"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "She wondered what was behind the door as he waited." This is:$tl$, $tl$[{"id": "a", "label": "third person"}, {"id": "b", "label": "first person"}, {"id": "c", "label": "second person"}, {"id": "d", "label": "fourth person"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Point of view is the:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "perspective the story is told from"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A first-person narrator can tell you their own:$tl$, $tl$[{"id": "a", "label": "everyone's secret thoughts"}, {"id": "b", "label": "the future for sure"}, {"id": "c", "label": "the page number"}, {"id": "d", "label": "thoughts and feelings"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A third-person narrator who knows all characters' thoughts is:$tl$, $tl$[{"id": "a", "label": "limited only"}, {"id": "b", "label": "first person"}, {"id": "c", "label": "omniscient"}, {"id": "d", "label": "silent"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "You walk into the room and feel the chill." This unusual style is:$tl$, $tl$[{"id": "a", "label": "first person"}, {"id": "b", "label": "second person"}, {"id": "c", "label": "third person"}, {"id": "d", "label": "no person"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two characters may describe the same event differently because they have different:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "points of view"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "titles"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If a narrator only knows one character's thoughts, it is third person:$tl$, $tl$[{"id": "a", "label": "omniscient"}, {"id": "b", "label": "first"}, {"id": "c", "label": "limited"}, {"id": "d", "label": "second"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Understanding point of view helps you see whose:$tl$, $tl$[{"id": "a", "label": "shoes you wear"}, {"id": "b", "label": "lunch you eat"}, {"id": "c", "label": "eyes you're seeing the story through"}, {"id": "d", "label": "desk you use"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "My heart raced as I crossed the finish line." The narrator is:$tl$, $tl$[{"id": "a", "label": "outside the story only"}, {"id": "b", "label": "the reader"}, {"id": "c", "label": "the author's friend"}, {"id": "d", "label": "a character in the story"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An author chooses point of view to control what the reader:$tl$, $tl$[{"id": "a", "label": "eats"}, {"id": "b", "label": "wears"}, {"id": "c", "label": "knows and feels"}, {"id": "d", "label": "weighs"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which pronoun signals first person?$tl$, $tl$[{"id": "a", "label": "he"}, {"id": "b", "label": "I"}, {"id": "c", "label": "she"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A story told from the 'I' perspective is in ____ person. (one word)$tl$, null, $tl$first$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A biased narrator might:$tl$, $tl$[{"id": "a", "label": "show every side fairly"}, {"id": "b", "label": "have no opinions"}, {"id": "c", "label": "only show one side"}, {"id": "d", "label": "not exist"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "They argued for hours," he thought, "but I knew the truth." The shift to 'I' marks a change in:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "font"}, {"id": "d", "label": "point of view / speaker"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Reading the same event from two characters teaches us that perspective:$tl$, $tl$[{"id": "a", "label": "is unimportant"}, {"id": "b", "label": "shapes the story"}, {"id": "c", "label": "never changes"}, {"id": "d", "label": "is the title"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A third-person omniscient narrator can reveal:$tl$, $tl$[{"id": "a", "label": "only one thought"}, {"id": "b", "label": "no thoughts"}, {"id": "c", "label": "only dialogue"}, {"id": "d", "label": "all characters' inner thoughts"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$point-of-view$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Vocabulary in Context (RI.5.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$context-clues$tl$, $tl$Vocabulary in Context$tl$, $tl$Use surrounding words to figure out the meaning of unfamiliar vocabulary.$tl$, 5, $tl$RI.5.4$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Vocabulary in Context$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Vocabulary in Context", "body": "Use surrounding words to figure out the meaning of unfamiliar vocabulary."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Read: \"The arid desert had not seen rain in months.\" \"Arid\" means:\n\nThe answer is \"very dry\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"His ravenous appetite made him eat three plates.\" \"Ravenous\" means:\n\nThe answer is \"very hungry\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"The fragile glass shattered at the lightest touch.\" \"Fragile\" means:\n\nThe answer is \"easily broken\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"She was elated to win first prize.\" \"Elated\" means:", "choices": [{"id": "a", "label": "very happy"}, {"id": "b", "label": "very sad"}, {"id": "c", "label": "very bored"}, {"id": "d", "label": "very tired"}], "answer": "a", "explanation": "Yes! The answer is \"very happy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"The vast ocean stretched beyond the horizon.\" \"Vast\" means:", "choices": [{"id": "a", "label": "huge"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "shallow"}, {"id": "d", "label": "loud"}], "answer": "a", "explanation": "Yes! The answer is \"huge\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"He spoke in an audible whisper we could just hear.\" \"Audible\" means:", "choices": [{"id": "a", "label": "silent"}, {"id": "b", "label": "bright"}, {"id": "c", "label": "sweet"}, {"id": "d", "label": "able to be heard"}], "answer": "d", "explanation": "Yes! The answer is \"able to be heard\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Vocabulary in Context! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The arid desert had not seen rain in months." "Arid" means:$tl$, $tl$[{"id": "a", "label": "very wet"}, {"id": "b", "label": "very dry"}, {"id": "c", "label": "very cold"}, {"id": "d", "label": "very loud"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "His ravenous appetite made him eat three plates." "Ravenous" means:$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "picky"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "very hungry"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The fragile glass shattered at the lightest touch." "Fragile" means:$tl$, $tl$[{"id": "a", "label": "very strong"}, {"id": "b", "label": "heavy"}, {"id": "c", "label": "easily broken"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "She was elated to win first prize." "Elated" means:$tl$, $tl$[{"id": "a", "label": "very sad"}, {"id": "b", "label": "very bored"}, {"id": "c", "label": "very tired"}, {"id": "d", "label": "very happy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The vast ocean stretched beyond the horizon." "Vast" means:$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "shallow"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He spoke in an audible whisper we could just hear." "Audible" means:$tl$, $tl$[{"id": "a", "label": "silent"}, {"id": "b", "label": "bright"}, {"id": "c", "label": "sweet"}, {"id": "d", "label": "able to be heard"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The novice player made beginner mistakes." "Novice" means:$tl$, $tl$[{"id": "a", "label": "an expert"}, {"id": "b", "label": "a coach"}, {"id": "c", "label": "a fan"}, {"id": "d", "label": "a beginner"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Their abundant harvest filled every basket." "Abundant" means:$tl$, $tl$[{"id": "a", "label": "scarce"}, {"id": "b", "label": "plentiful"}, {"id": "c", "label": "empty"}, {"id": "d", "label": "dry"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The reclusive author rarely left her home." "Reclusive" means:$tl$, $tl$[{"id": "a", "label": "very social"}, {"id": "b", "label": "keeping to oneself"}, {"id": "c", "label": "very loud"}, {"id": "d", "label": "very fast"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He was reluctant and hesitated before agreeing." "Reluctant" means:$tl$, $tl$[{"id": "a", "label": "eager"}, {"id": "b", "label": "unwilling at first"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The diligent student studied every night." "Diligent" means:$tl$, $tl$[{"id": "a", "label": "lazy"}, {"id": "b", "label": "hardworking"}, {"id": "c", "label": "careless"}, {"id": "d", "label": "absent"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "A feeble light barely lit the room." "Feeble" means:$tl$, $tl$[{"id": "a", "label": "bright"}, {"id": "b", "label": "loud"}, {"id": "c", "label": "weak"}, {"id": "d", "label": "warm"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The monotonous hum never changed." "Monotonous" means:$tl$, $tl$[{"id": "a", "label": "boringly unchanging"}, {"id": "b", "label": "exciting"}, {"id": "c", "label": "colorful"}, {"id": "d", "label": "loud and varied"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "They sought refuge from the storm in a cave." "Refuge" means:$tl$, $tl$[{"id": "a", "label": "danger"}, {"id": "b", "label": "a meal"}, {"id": "c", "label": "a map"}, {"id": "d", "label": "shelter / safety"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Her optimistic outlook kept the team hopeful." "Optimistic" means:$tl$, $tl$[{"id": "a", "label": "gloomy"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "hopeful and positive"}, {"id": "d", "label": "fearful"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Read: "The room was vacant; not a soul was inside." "Vacant" means ____. (one word, starts with e)$tl$, null, $tl$empty$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The scorching pavement burned our feet." "Scorching" means:$tl$, $tl$[{"id": "a", "label": "very hot"}, {"id": "b", "label": "freezing"}, {"id": "c", "label": "damp"}, {"id": "d", "label": "smooth"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "He gave a brief, two-minute speech." "Brief" means:$tl$, $tl$[{"id": "a", "label": "short"}, {"id": "b", "label": "long"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "boring"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "The ancient, weathered map was centuries old." "Weathered" means:$tl$, $tl$[{"id": "a", "label": "brand new"}, {"id": "b", "label": "worn by time/weather"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read: "Their generous donation funded the whole library." "Generous" means:$tl$, $tl$[{"id": "a", "label": "stingy"}, {"id": "b", "label": "giving freely"}, {"id": "c", "label": "small"}, {"id": "d", "label": "late"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Text Structure (RI.5.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$text-structure$tl$, $tl$Text Structure$tl$, $tl$Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution.$tl$, 5, $tl$RI.5.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Text Structure$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Text Structure", "body": "Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A text that lists steps in order uses a ____ structure.\n\nThe answer is \"sequence (chronological)\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A text that explains why something happens and the results uses:\n\nThe answer is \"cause and effect\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text that tells how two things are alike and different uses:\n\nThe answer is \"compare and contrast\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text that presents an issue and then ways to fix it uses:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "problem and solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}], "answer": "b", "explanation": "Yes! The answer is \"problem and solution\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Words like first, next, then, and finally signal a ____ structure.", "choices": [{"id": "a", "label": "compare"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}], "answer": "b", "explanation": "Yes! The answer is \"sequence\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Words like because, since, and as a result signal:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause and effect"}, {"id": "c", "label": "compare"}, {"id": "d", "label": "description"}], "answer": "b", "explanation": "Yes! The answer is \"cause and effect\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Text Structure! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A text that lists steps in order uses a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare-contrast"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "sequence (chronological)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A text that explains why something happens and the results uses:$tl$, $tl$[{"id": "a", "label": "cause and effect"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A text that tells how two things are alike and different uses:$tl$, $tl$[{"id": "a", "label": "compare and contrast"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A text that presents an issue and then ways to fix it uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "problem and solution"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Words like first, next, then, and finally signal a ____ structure.$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Words like because, since, and as a result signal:$tl$, $tl$[{"id": "a", "label": "cause and effect"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "compare"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Words like however, both, and unlike signal:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare and contrast"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A recipe is most likely organized as:$tl$, $tl$[{"id": "a", "label": "compare-contrast"}, {"id": "b", "label": "problem-solution"}, {"id": "c", "label": "sequence of steps"}, {"id": "d", "label": "description only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$An article on 'why the lake is shrinking and how to save it' uses:$tl$, $tl$[{"id": "a", "label": "sequence only"}, {"id": "b", "label": "problem and solution"}, {"id": "c", "label": "compare only"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Knowing a text's structure helps you:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "pick a font"}, {"id": "c", "label": "ignore details"}, {"id": "d", "label": "find and organize information"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A passage describing what a rainforest looks, sounds, and smells like uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A text comparing cats and dogs side by side uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A timeline of historical events follows a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "problem-solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "chronological / sequence"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$'The drought caused crops to fail, leading to food shortages' shows:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Signal words help readers identify a text's:$tl$, $tl$[{"id": "a", "label": "structure"}, {"id": "b", "label": "title"}, {"id": "c", "label": "author"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A how-to text that lists steps in order uses a ____ structure. (one word)$tl$, null, $tl$sequence$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Headings and subheadings can hint at a text's:$tl$, $tl$[{"id": "a", "label": "organization (structure)"}, {"id": "b", "label": "page color"}, {"id": "c", "label": "binding"}, {"id": "d", "label": "cost"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$'Plastic pollution harms oceans; recycling and reuse can help' is structured as:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "problem and solution"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Comparing the causes of two wars side by side blends two structures:$tl$, $tl$[{"id": "a", "label": "sequence only"}, {"id": "b", "label": "description only"}, {"id": "c", "label": "cause-effect and compare-contrast"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Identifying structure first makes a hard text:$tl$, $tl$[{"id": "a", "label": "easier to understand"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "impossible"}, {"id": "d", "label": "shorter to print"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Comparing Texts (RI.5.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-and-contrast$tl$, $tl$Comparing Texts$tl$, $tl$Comparing texts on the same topic reveals how they are alike and different.$tl$, 5, $tl$RI.5.9$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Texts$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Comparing Texts", "body": "Comparing texts on the same topic reveals how they are alike and different."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  To compare two texts means to find how they are:\n\nThe answer is \"alike\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  To contrast two texts means to find how they are:\n\nThe answer is \"different\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Two articles on sharks, one scary and one scientific, differ mainly in their:\n\nThe answer is \"tone / purpose\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read accounts of the same storm by a sailor and a scientist; they likely differ in:", "choices": [{"id": "a", "label": "the date it happened"}, {"id": "b", "label": "whether it was a storm"}, {"id": "c", "label": "point of view and detail"}, {"id": "d", "label": "the planet"}], "answer": "c", "explanation": "Yes! The answer is \"point of view and detail\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A Venn diagram is a tool used to:", "choices": [{"id": "a", "label": "tell time"}, {"id": "b", "label": "measure mass"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "spell words"}], "answer": "c", "explanation": "Yes! The answer is \"compare and contrast\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Two recipes for bread are alike because both:", "choices": [{"id": "a", "label": "give steps to make bread"}, {"id": "b", "label": "are mystery novels"}, {"id": "c", "label": "are about cars"}, {"id": "d", "label": "are poems"}], "answer": "a", "explanation": "Yes! The answer is \"give steps to make bread\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Comparing Texts! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To compare two texts means to find how they are:$tl$, $tl$[{"id": "a", "label": "alike"}, {"id": "b", "label": "different only"}, {"id": "c", "label": "printed"}, {"id": "d", "label": "priced"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$To contrast two texts means to find how they are:$tl$, $tl$[{"id": "a", "label": "alike only"}, {"id": "b", "label": "bound"}, {"id": "c", "label": "different"}, {"id": "d", "label": "sold"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two articles on sharks, one scary and one scientific, differ mainly in their:$tl$, $tl$[{"id": "a", "label": "topic"}, {"id": "b", "label": "tone / purpose"}, {"id": "c", "label": "page size"}, {"id": "d", "label": "font color"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Read accounts of the same storm by a sailor and a scientist; they likely differ in:$tl$, $tl$[{"id": "a", "label": "the date it happened"}, {"id": "b", "label": "whether it was a storm"}, {"id": "c", "label": "point of view and detail"}, {"id": "d", "label": "the planet"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A Venn diagram is a tool used to:$tl$, $tl$[{"id": "a", "label": "tell time"}, {"id": "b", "label": "measure mass"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "spell words"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two recipes for bread are alike because both:$tl$, $tl$[{"id": "a", "label": "are mystery novels"}, {"id": "b", "label": "are about cars"}, {"id": "c", "label": "are poems"}, {"id": "d", "label": "give steps to make bread"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A poem and a news report on the same event differ in:$tl$, $tl$[{"id": "a", "label": "the event itself"}, {"id": "b", "label": "the year"}, {"id": "c", "label": "style and structure"}, {"id": "d", "label": "the alphabet"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Comparing two characters' choices can reveal a story's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "theme"}, {"id": "c", "label": "font"}, {"id": "d", "label": "cover"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$The word 'whereas' is used to show a:$tl$, $tl$[{"id": "a", "label": "similarity"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause"}, {"id": "d", "label": "contrast (difference)"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two texts that reach different conclusions about a topic show:$tl$, $tl$[{"id": "a", "label": "differing viewpoints"}, {"id": "b", "label": "the same view"}, {"id": "c", "label": "no view"}, {"id": "d", "label": "a glossary"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$When comparing, an overlap in a Venn diagram shows what is:$tl$, $tl$[{"id": "a", "label": "shared by both"}, {"id": "b", "label": "unique to one"}, {"id": "c", "label": "not in either"}, {"id": "d", "label": "the title"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A primary source (eyewitness) and a textbook on the same event differ because one is:$tl$, $tl$[{"id": "a", "label": "firsthand, the other secondhand"}, {"id": "b", "label": "fiction always"}, {"id": "c", "label": "longer always"}, {"id": "d", "label": "colored"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Both a chart and a paragraph can present the same data, differing in:$tl$, $tl$[{"id": "a", "label": "facts"}, {"id": "b", "label": "truth"}, {"id": "c", "label": "format"}, {"id": "d", "label": "topic"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Reading multiple texts on one topic helps you:$tl$, $tl$[{"id": "a", "label": "get confused only"}, {"id": "b", "label": "learn less"}, {"id": "c", "label": "get a fuller understanding"}, {"id": "d", "label": "ignore facts"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$If two authors agree on facts but feel differently, they differ in:$tl$, $tl$[{"id": "a", "label": "opinion / perspective"}, {"id": "b", "label": "the facts"}, {"id": "c", "label": "the date"}, {"id": "d", "label": "the spelling"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Finding how two things are different is to ____ them. (one word)$tl$, null, $tl$contrast$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A fairy tale and a fable are alike because both:$tl$, $tl$[{"id": "a", "label": "teach lessons through stories"}, {"id": "b", "label": "are nonfiction reports"}, {"id": "c", "label": "have no characters"}, {"id": "d", "label": "are recipes"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Comparing a book and its movie often shows the movie:$tl$, $tl$[{"id": "a", "label": "adds nothing"}, {"id": "b", "label": "is identical"}, {"id": "c", "label": "has no characters"}, {"id": "d", "label": "leaves out some details"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Two maps of the same city differ if they show:$tl$, $tl$[{"id": "a", "label": "different features (roads vs. parks)"}, {"id": "b", "label": "different cities"}, {"id": "c", "label": "the future"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Synthesizing two texts means:$tl$, $tl$[{"id": "a", "label": "copying one"}, {"id": "b", "label": "ignoring both"}, {"id": "c", "label": "reading neither"}, {"id": "d", "label": "combining their information"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-and-contrast$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Figurative Language (L.5.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$figurative-language$tl$, $tl$Figurative Language$tl$, $tl$Similes, metaphors, personification, idioms, and hyperbole create vivid meaning.$tl$, 5, $tl$L.5.5$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Figurative Language$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Figurative Language", "body": "Similes, metaphors, personification, idioms, and hyperbole create vivid meaning."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  \"Her smile was as bright as the sun\" is a:\n\nThe answer is \"simile\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  \"Time is a thief\" is a:\n\nThe answer is \"metaphor\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A simile compares two things using:\n\nThe answer is \"like or as\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A metaphor compares two things by saying one:", "choices": [{"id": "a", "label": "is like the other"}, {"id": "b", "label": "is the other"}, {"id": "c", "label": "is near the other"}, {"id": "d", "label": "is bigger"}], "answer": "b", "explanation": "Yes! The answer is \"is the other\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "\"The wind whispered through the trees\" gives the wind human qualities, which is:", "choices": [{"id": "a", "label": "a simile"}, {"id": "b", "label": "a fact"}, {"id": "c", "label": "personification"}, {"id": "d", "label": "a hyperbole"}], "answer": "c", "explanation": "Yes! The answer is \"personification\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "\"I've told you a million times!\" is an exaggeration, called:", "choices": [{"id": "a", "label": "a simile"}, {"id": "b", "label": "a metaphor"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "onomatopoeia"}], "answer": "c", "explanation": "Yes! The answer is \"hyperbole\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Figurative Language! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"Her smile was as bright as the sun" is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "fact"}, {"id": "d", "label": "question"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"Time is a thief" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "fact"}, {"id": "d", "label": "rhyme"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A simile compares two things using:$tl$, $tl$[{"id": "a", "label": "because"}, {"id": "b", "label": "like or as"}, {"id": "c", "label": "and"}, {"id": "d", "label": "the"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$A metaphor compares two things by saying one:$tl$, $tl$[{"id": "a", "label": "is like the other"}, {"id": "b", "label": "is near the other"}, {"id": "c", "label": "is the other"}, {"id": "d", "label": "is bigger"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"The wind whispered through the trees" gives the wind human qualities, which is:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "a fact"}, {"id": "c", "label": "personification"}, {"id": "d", "label": "a hyperbole"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"I've told you a million times!" is an exaggeration, called:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "a metaphor"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"Buzz," "pop," and "sizzle" are examples of:$tl$, $tl$[{"id": "a", "label": "onomatopoeia (sound words)"}, {"id": "b", "label": "similes"}, {"id": "c", "label": "metaphors"}, {"id": "d", "label": "idioms"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"It's raining cats and dogs" is an:$tl$, $tl$[{"id": "a", "label": "a fact"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "onomatopoeia"}, {"id": "d", "label": "idiom"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"The classroom was a zoo" is a metaphor meaning the room was:$tl$, $tl$[{"id": "a", "label": "full of animals"}, {"id": "b", "label": "very quiet"}, {"id": "c", "label": "wild and noisy"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"As busy as a bee" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Personification gives ____ qualities to nonhuman things.$tl$, $tl$[{"id": "a", "label": "human"}, {"id": "b", "label": "animal"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"The stars danced in the sky" is an example of:$tl$, $tl$[{"id": "a", "label": "personification"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which phrase is a metaphor?$tl$, $tl$[{"id": "a", "label": "Her room was like a mess."}, {"id": "b", "label": "Her room was a disaster zone."}, {"id": "c", "label": "Her room was messy."}, {"id": "d", "label": "Her room was clean."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"He's as tall as a giraffe" uses 'as,' so it is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Figurative language is used to:$tl$, $tl$[{"id": "a", "label": "create vivid images and meaning"}, {"id": "b", "label": "state plain facts only"}, {"id": "c", "label": "confuse readers"}, {"id": "d", "label": "fill space"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$A comparison using 'like' or 'as' is called a ____. (one word)$tl$, null, $tl$simile$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"My backpack weighs a ton" is an example of:$tl$, $tl$[{"id": "a", "label": "hyperbole"}, {"id": "b", "label": "a fact"}, {"id": "c", "label": "a simile"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"Break a leg" before a show is an idiom that really means:$tl$, $tl$[{"id": "a", "label": "get hurt"}, {"id": "b", "label": "run fast"}, {"id": "c", "label": "sit down"}, {"id": "d", "label": "good luck"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$"The thunder grumbled" gives thunder a human action, so it's:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "personification"}, {"id": "c", "label": "an idiom"}, {"id": "d", "label": "a fact"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which is NOT figurative language?$tl$, $tl$[{"id": "a", "label": "The fog crept in on cat feet."}, {"id": "b", "label": "She is a shining star."}, {"id": "c", "label": "The dog barked loudly."}, {"id": "d", "label": "Quiet as a mouse."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea.$tl$, 5, $tl$L.5.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Nouns", "body": "A noun names a person, place, thing, or idea."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"river\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"teacher\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"library\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "slippery"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "tiny"}], "answer": "b", "explanation": "Yes! The answer is \"pencil\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "explore"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "garden"}], "answer": "d", "explanation": "Yes! The answer is \"garden\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "whisper"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "engine"}], "answer": "d", "explanation": "Yes! The answer is \"engine\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "march"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "window"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "build"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "village"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "build"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "window"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action or a state of being.$tl$, 5, $tl$L.5.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Action Verbs", "body": "A verb shows action or a state of being."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an action verb (something you can do)?\n\nThe answer is \"swim\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an action verb (something you can do)?\n\nThe answer is \"paint\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an action verb (something you can do)?\n\nThe answer is \"discover\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "curious"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "stormy"}], "answer": "b", "explanation": "Yes! The answer is \"scribble\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "kitchen"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "window"}, {"id": "d", "label": "march"}], "answer": "d", "explanation": "Yes! The answer is \"march\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "cheerful"}, {"id": "b", "label": "window"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "narrow"}], "answer": "c", "explanation": "Yes! The answer is \"gallop\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Action Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "library"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "build"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "island"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "island"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "march"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun - what kind, how many, or which one.$tl$, 5, $tl$L.5.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Adjectives", "body": "An adjective describes a noun - what kind, how many, or which one."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"slippery\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"frozen\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"shiny\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "wander"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "discover"}], "answer": "b", "explanation": "Yes! The answer is \"cheerful\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "golden"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "gallop"}], "answer": "a", "explanation": "Yes! The answer is \"golden\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "brave"}, {"id": "b", "label": "build"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "pencil"}], "answer": "a", "explanation": "Yes! The answer is \"brave\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Adjectives! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "river"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "island"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "build"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "village"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "island"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "island"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "library"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun.$tl$, 5, $tl$L.5.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Pronouns", "body": "A pronoun takes the place of a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"her\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"you\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"she\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "wander"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "we"}], "answer": "d", "explanation": "Yes! The answer is \"we\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "march"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "it"}, {"id": "d", "label": "discover"}], "answer": "c", "explanation": "Yes! The answer is \"it\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "shout"}, {"id": "b", "label": "library"}, {"id": "c", "label": "I"}, {"id": "d", "label": "bounce"}], "answer": "c", "explanation": "Yes! The answer is \"I\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Pronouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "us"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "it"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "her"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "river"}, {"id": "d", "label": "you"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "they"}, {"id": "c", "label": "river"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "we"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "library"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "march"}, {"id": "d", "label": "she"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "him"}, {"id": "c", "label": "island"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "window"}, {"id": "c", "label": "island"}, {"id": "d", "label": "us"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "it"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "her"}, {"id": "b", "label": "island"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "you"}, {"id": "c", "label": "library"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "they"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "river"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "we"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "them"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "she"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "him"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must agree with its subject in number.$tl$, 5, $tl$L.5.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Subject-Verb Agreement", "body": "The verb must agree with its subject in number."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Choose the correct verb: \"The boy ____ every day.\"\n\nThe answer is \"plays\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Choose the correct verb: \"The snake ____ every day.\"\n\nThe answer is \"slithers\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Choose the correct verb: \"The clock ____ every day.\"\n\nThe answer is \"ticks\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The chef ____ every day.\"", "choices": [{"id": "a", "label": "cook"}, {"id": "b", "label": "cooks"}, {"id": "c", "label": "cooksed"}, {"id": "d", "label": "cooksing"}], "answer": "b", "explanation": "Yes! The answer is \"cooks\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The cat ____ every day.\"", "choices": [{"id": "a", "label": "sleep"}, {"id": "b", "label": "sleepsed"}, {"id": "c", "label": "sleeps"}, {"id": "d", "label": "sleepsing"}], "answer": "c", "explanation": "Yes! The answer is \"sleeps\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The student ____ every day.\"", "choices": [{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "reads"}, {"id": "d", "label": "readsing"}], "answer": "c", "explanation": "Yes! The answer is \"reads\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Subject-Verb Agreement! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "grows"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooksing"}, {"id": "d", "label": "cooks"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barks"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "perform"}, {"id": "b", "label": "performsed"}, {"id": "c", "label": "performs"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticks"}, {"id": "c", "label": "ticksed"}, {"id": "d", "label": "ticksing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "play"}, {"id": "b", "label": "playsed"}, {"id": "c", "label": "plays"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "write"}, {"id": "b", "label": "writesed"}, {"id": "c", "label": "writesing"}, {"id": "d", "label": "writes"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "reads"}, {"id": "d", "label": "readsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hop"}, {"id": "b", "label": "hopsed"}, {"id": "c", "label": "hops"}, {"id": "d", "label": "hopsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "paints"}, {"id": "c", "label": "paintsed"}, {"id": "d", "label": "paintsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "crie"}, {"id": "b", "label": "criesed"}, {"id": "c", "label": "criesing"}, {"id": "d", "label": "cries"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithers"}, {"id": "d", "label": "slithersing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flows"}, {"id": "c", "label": "flowsed"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plant"}, {"id": "b", "label": "plantsed"}, {"id": "c", "label": "plants"}, {"id": "d", "label": "plantsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roars"}, {"id": "c", "label": "roarsed"}, {"id": "d", "label": "roarsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistles"}, {"id": "b", "label": "whistle"}, {"id": "c", "label": "whistlesed"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleep"}, {"id": "b", "label": "sleepsed"}, {"id": "c", "label": "sleepsing"}, {"id": "d", "label": "sleeps"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wags"}, {"id": "b", "label": "wag"}, {"id": "c", "label": "wagsed"}, {"id": "d", "label": "wagsing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sing"}, {"id": "b", "label": "singsed"}, {"id": "c", "label": "sings"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs describe actions that already happened.$tl$, 5, $tl$L.5.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Past-Tense Verbs", "body": "Past-tense verbs describe actions that already happened."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the past tense of the verb \"teach\"?\n\nThe answer is \"taught\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the past tense of the verb \"make\"?\n\nThe answer is \"made\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the past tense of the verb \"go\"?\n\nThe answer is \"went\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the past tense of the verb \"give\"?\n\nThe answer is gave."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the past tense of the verb \"eat\"?\n\nThe answer is ate."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the past tense of the verb \"buy\"?\n\nThe answer is bought."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Past-Tense Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "know"?$tl$, null, $tl$knew$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$What is the past tense of the verb "take"?$tl$, null, $tl$took$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.5.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals show more than one, using -s, -es, or special spellings.$tl$, 5, $tl$L.5.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Plural Nouns", "body": "Plurals show more than one, using -s, -es, or special spellings."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Write the plural of \"cherry\".\n\nThe answer is \"cherries\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Write the plural of \"penny\".\n\nThe answer is \"pennies\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Write the plural of \"shelf\".\n\nThe answer is \"shelves\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Write the plural of \"half\".\n\nThe answer is halves."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Write the plural of \"knife\".\n\nThe answer is knives."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Write the plural of \"box\".\n\nThe answer is boxes."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plural Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "city".$tl$, null, $tl$cities$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "fairy".$tl$, null, $tl$fairies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capitalization$tl$, $tl$Capitalize sentence beginnings, the word I, and proper nouns.$tl$, 5, $tl$L.5.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Capitalization", "body": "Capitalize sentence beginnings, the word I, and proper nouns."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Nile River\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Australia\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Africa\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "mountain"}, {"id": "b", "label": "city"}, {"id": "c", "label": "month"}, {"id": "d", "label": "India"}], "answer": "d", "explanation": "Yes! The answer is \"India\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "London"}, {"id": "b", "label": "country"}, {"id": "c", "label": "day"}, {"id": "d", "label": "city"}], "answer": "a", "explanation": "Yes! The answer is \"London\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "Maria"}, {"id": "b", "label": "month"}, {"id": "c", "label": "city"}, {"id": "d", "label": "ocean"}], "answer": "a", "explanation": "Yes! The answer is \"Maria\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Capitalization! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "city"}, {"id": "c", "label": "day"}, {"id": "d", "label": "New York"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "month"}, {"id": "c", "label": "city"}, {"id": "d", "label": "Saturn"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "river"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Tokyo"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "city"}, {"id": "d", "label": "July"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Friday"}, {"id": "b", "label": "city"}, {"id": "c", "label": "month"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "Australia"}, {"id": "c", "label": "country"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "London"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Canada"}, {"id": "b", "label": "river"}, {"id": "c", "label": "day"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "river"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Maria"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "month"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "October"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "month"}, {"id": "d", "label": "Africa"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "day"}, {"id": "c", "label": "river"}, {"id": "d", "label": "Tuesday"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Sarah"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "Mount Everest"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Monday"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "December"}, {"id": "c", "label": "day"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "Pacific Ocean"}, {"id": "c", "label": "city"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "city"}, {"id": "c", "label": "country"}, {"id": "d", "label": "India"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "month"}, {"id": "c", "label": "city"}, {"id": "d", "label": "Amazon River"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "river"}, {"id": "c", "label": "Nile River"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End sentences with a period, question mark, or exclamation point.$tl$, 5, $tl$L.5.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: End Punctuation", "body": "End sentences with a period, question mark, or exclamation point."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which end mark best completes the sentence?  \"Can you help me___\"\n\nThe answer is \"?\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which end mark best completes the sentence?  \"Where are we going___\"\n\nThe answer is \"?\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which end mark best completes the sentence?  \"The sky is blue___\"\n\nThe answer is \".\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"She likes apples___\"", "choices": [{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}], "answer": "c", "explanation": "Yes! The answer is \".\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"That is amazing___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}], "answer": "d", "explanation": "Yes! The answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"Run for your life___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}], "answer": "d", "explanation": "Yes! The answer is \"!\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about End Punctuation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.5.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$Use commas to separate three or more items in a list.$tl$, 5, $tl$L.5.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 5, $tl$[{"type": "explain", "title": "Let's learn: Commas in a Series", "body": "Use commas to separate three or more items in a list."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like ham, cheese, and lettuce.\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like walk, skip, and hop.\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like trains, planes, and buses.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like apples grapes and plums."}, {"id": "b", "label": "I like apples, grapes and plums"}, {"id": "c", "label": "I like apples, grapes, and plums."}, {"id": "d", "label": "I like, apples grapes plums."}], "answer": "c", "explanation": "Yes! The answer is \"I like apples, grapes, and plums.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like pencils, pens, and markers."}, {"id": "d", "label": "I like, pencils pens markers."}], "answer": "c", "explanation": "Yes! The answer is \"I like pencils, pens, and markers.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like north, south, and east."}, {"id": "b", "label": "I like north south and east."}, {"id": "c", "label": "I like north, south and east"}, {"id": "d", "label": "I like, north south east."}], "answer": "a", "explanation": "Yes! The answer is \"I like north, south, and east.\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Commas in a Series! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 5, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring summer and fall."}, {"id": "b", "label": "I like spring, summer and fall"}, {"id": "c", "label": "I like, spring summer fall."}, {"id": "d", "label": "I like spring, summer, and fall."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham cheese and lettuce."}, {"id": "b", "label": "I like ham, cheese and lettuce"}, {"id": "c", "label": "I like, ham cheese lettuce."}, {"id": "d", "label": "I like ham, cheese, and lettuce."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver and bronze"}, {"id": "c", "label": "I like, gold silver bronze."}, {"id": "d", "label": "I like gold, silver, and bronze."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk, eggs, and bread."}, {"id": "b", "label": "I like milk eggs and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers, and bears."}, {"id": "c", "label": "I like lions, tigers and bears"}, {"id": "d", "label": "I like, lions tigers bears."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 5, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares and triangles"}, {"id": "c", "label": "I like, circles squares triangles."}, {"id": "d", "label": "I like circles, squares, and triangles."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples, oranges, and pears."}, {"id": "b", "label": "I like apples oranges and pears."}, {"id": "c", "label": "I like apples, oranges and pears"}, {"id": "d", "label": "I like, apples oranges pears."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump and swim"}, {"id": "c", "label": "I like, run jump swim."}, {"id": "d", "label": "I like run, jump, and swim."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples, grapes, and plums."}, {"id": "b", "label": "I like apples grapes and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens and rulers"}, {"id": "c", "label": "I like books, pens, and rulers."}, {"id": "d", "label": "I like, books pens rulers."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 5, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red, green, and blue."}, {"id": "b", "label": "I like red green and blue."}, {"id": "c", "label": "I like red, green and blue"}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums and guitar"}, {"id": "c", "label": "I like piano, drums, and guitar."}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north, south, and east."}, {"id": "b", "label": "I like north south and east."}, {"id": "c", "label": "I like north, south and east"}, {"id": "d", "label": "I like, north south east."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow, and hail."}, {"id": "c", "label": "I like rain, snow and hail"}, {"id": "d", "label": "I like, rain snow hail."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 5, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs, and fish."}, {"id": "c", "label": "I like cats, dogs and fish"}, {"id": "d", "label": "I like, cats dogs fish."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes, and buses."}, {"id": "c", "label": "I like trains, planes and buses"}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis and golf"}, {"id": "c", "label": "I like, soccer tennis golf."}, {"id": "d", "label": "I like soccer, tennis, and golf."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 5, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad, and Grandma."}, {"id": "c", "label": "I like Mom, Dad and Grandma"}, {"id": "d", "label": "I like, Mom Dad Grandma."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 5 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

