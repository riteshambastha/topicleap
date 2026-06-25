-- =====================================================================
-- TopicLeap - Grade 7 full curriculum seed (generated)
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

-- ---- [math] Proportions (7.RP.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$proportions$tl$, $tl$Proportions$tl$, $tl$A proportion sets two ratios equal. Cross-multiply to solve for the unknown.$tl$, 7, $tl$7.RP.A.2$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Proportions$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Proportions", "body": "A proportion sets two ratios equal. Cross-multiply to solve for the unknown."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Solve the proportion:  3/6 = 15/x .  x = ?\n\nThe answer is \"30\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Solve the proportion:  4/5 = 24/x .  x = ?\n\nThe answer is \"30\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Solve the proportion:  5/6 = 15/x .  x = ?\n\nThe answer is \"18\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Solve the proportion:  2/9 = 8/x .  x = ?\n\nThe answer is 36."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Solve the proportion:  5/8 = 20/x .  x = ?\n\nThe answer is 32."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Solve the proportion:  2/5 = 12/x .  x = ?\n\nThe answer is 30."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Proportions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  2/2 = 4/x .  x = ?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  5/6 = 20/x .  x = ?$tl$, null, $tl$24$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  6/3 = 18/x .  x = ?$tl$, null, $tl$9$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  6/4 = 18/x .  x = ?$tl$, null, $tl$12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  2/4 = 10/x .  x = ?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  7/8 = 35/x .  x = ?$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  7/8 = 21/x .  x = ?$tl$, null, $tl$24$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  6/6 = 18/x .  x = ?$tl$, null, $tl$18$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  4/7 = 12/x .  x = ?$tl$, null, $tl$21$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  8/5 = 40/x .  x = ?$tl$, null, $tl$25$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  3/11 = 24/x .  x = ?$tl$, null, $tl$88$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  5/5 = 10/x .  x = ?$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  7/4 = 35/x .  x = ?$tl$, null, $tl$20$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  10/10 = 20/x .  x = ?$tl$, null, $tl$20$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  4/2 = 40/x .  x = ?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  15/8 = 45/x .  x = ?$tl$, null, $tl$24$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  11/7 = 55/x .  x = ?$tl$, null, $tl$35$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  13/13 = 117/x .  x = ?$tl$, null, $tl$117$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  4/5 = 28/x .  x = ?$tl$, null, $tl$35$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve the proportion:  8/5 = 48/x .  x = ?$tl$, null, $tl$30$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$proportions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Unit Rates (7.RP.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$unit-rates$tl$, $tl$Unit Rates$tl$, $tl$A unit rate gives the amount per single unit, like miles per hour or cost per item.$tl$, 7, $tl$7.RP.A.1$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Unit Rates$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Unit Rates", "body": "A unit rate gives the amount per single unit, like miles per hour or cost per item."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A car goes 14 miles in 2 hours. What is the speed in miles per hour?\n\nThe answer is \"7\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A car goes 30 miles in 5 hours. What is the speed in miles per hour?\n\nThe answer is \"6\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A car goes 48 miles in 4 hours. What is the speed in miles per hour?\n\nThe answer is \"12\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A car goes 125 miles in 5 hours. What is the speed in miles per hour?\n\nThe answer is 25."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A car goes 85 miles in 5 hours. What is the speed in miles per hour?\n\nThe answer is 17."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A car goes 140 miles in 5 hours. What is the speed in miles per hour?\n\nThe answer is 28."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Unit Rates! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 30 miles in 6 hours. What is the speed in miles per hour?$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 50 miles in 5 hours. What is the speed in miles per hour?$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 24 miles in 2 hours. What is the speed in miles per hour?$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 21 miles in 3 hours. What is the speed in miles per hour?$tl$, null, $tl$7$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 40 miles in 4 hours. What is the speed in miles per hour?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 126 miles in 7 hours. What is the speed in miles per hour?$tl$, null, $tl$18$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 60 miles in 6 hours. What is the speed in miles per hour?$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 87 miles in 3 hours. What is the speed in miles per hour?$tl$, null, $tl$29$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 84 miles in 7 hours. What is the speed in miles per hour?$tl$, null, $tl$12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A car goes 80 miles in 5 hours. What is the speed in miles per hour?$tl$, null, $tl$16$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$4 notebooks cost $8. What is the cost per notebook, in dollars?$tl$, null, $tl$2$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 notebooks cost $21. What is the cost per notebook, in dollars?$tl$, null, $tl$3$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$8 notebooks cost $48. What is the cost per notebook, in dollars?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$6 notebooks cost $24. What is the cost per notebook, in dollars?$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$5 notebooks cost $45. What is the cost per notebook, in dollars?$tl$, null, $tl$9$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$11 notebooks cost $198. What is the cost per notebook, in dollars?$tl$, null, $tl$18$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 notebooks cost $105. What is the cost per notebook, in dollars?$tl$, null, $tl$15$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$12 notebooks cost $192. What is the cost per notebook, in dollars?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$3 notebooks cost $39. What is the cost per notebook, in dollars?$tl$, null, $tl$13$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$6 notebooks cost $48. What is the cost per notebook, in dollars?$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Percent Problems (7.RP.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$percent-problems$tl$, $tl$Percent Problems$tl$, $tl$Use percents to solve real problems: percent of a number, discounts, tips, and increases.$tl$, 7, $tl$7.RP.A.3$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Percent Problems$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Percent Problems", "body": "Use percents to solve real problems: percent of a number, discounts, tips, and increases."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is 50% of 200?\n\nThe answer is \"100\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is 25% of 200?\n\nThe answer is \"50\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is 10% of 100?\n\nThe answer is \"10\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A $400 item is 10% off. How many dollars do you save?\n\nThe answer is 40."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A $200 item is 40% off. How many dollars do you save?\n\nThe answer is 80."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A $400 item is 20% off. How many dollars do you save?\n\nThe answer is 80."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Percent Problems! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is 25% of 200?$tl$, null, $tl$50$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is 10% of 300?$tl$, null, $tl$30$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is 10% of 200?$tl$, null, $tl$20$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is 50% of 200?$tl$, null, $tl$100$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is 25% of 100?$tl$, null, $tl$25$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $400 item is 40% off. How many dollars do you save?$tl$, null, $tl$160$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $200 item is 20% off. How many dollars do you save?$tl$, null, $tl$40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $600 item is 20% off. How many dollars do you save?$tl$, null, $tl$120$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $600 item is 40% off. How many dollars do you save?$tl$, null, $tl$240$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $200 item is 10% off. How many dollars do you save?$tl$, null, $tl$20$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $400 bill has a 15% tip added. How many dollars is the tip?$tl$, null, $tl$60$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $1200 bill has a 80% tip added. How many dollars is the tip?$tl$, null, $tl$960$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $1200 bill has a 5% tip added. How many dollars is the tip?$tl$, null, $tl$60$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $400 bill has a 80% tip added. How many dollars is the tip?$tl$, null, $tl$320$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A $800 bill has a 15% tip added. How many dollars is the tip?$tl$, null, $tl$120$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A price of $500 increases by 12%. What is the new price in dollars?$tl$, null, $tl$560$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A price of $1000 increases by 90%. What is the new price in dollars?$tl$, null, $tl$1900$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A price of $1000 increases by 45%. What is the new price in dollars?$tl$, null, $tl$1450$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A price of $1000 increases by 12%. What is the new price in dollars?$tl$, null, $tl$1120$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A price of $1500 increases by 45%. What is the new price in dollars?$tl$, null, $tl$2175$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent-problems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Adding & Subtracting Integers (7.NS.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$add-subtract-integers$tl$, $tl$Adding & Subtracting Integers$tl$, $tl$Add and subtract positive and negative numbers using a number line or rules of signs.$tl$, 7, $tl$7.NS.A.1$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adding & Subtracting Integers$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Adding & Subtracting Integers", "body": "Add and subtract positive and negative numbers using a number line or rules of signs."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  1 - 7 = ?\n\nThe answer is \"-6\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  -9 - 9 = ?\n\nThe answer is \"-18\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  -1 - 10 = ?\n\nThe answer is \"-11\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  -2 - 8 = ?\n\nThe answer is -10."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  -20 - 2 = ?\n\nThe answer is -22."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  -16 + 5 = ?\n\nThe answer is -11."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Adding & Subtracting Integers! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-6 - 2 = ?$tl$, null, $tl$-8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-11 + 10 = ?$tl$, null, $tl$-1$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-12 + 1 = ?$tl$, null, $tl$-11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-3 + 7 = ?$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-4 + 1 = ?$tl$, null, $tl$-3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-15 + 2 = ?$tl$, null, $tl$-13$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-6 + 5 = ?$tl$, null, $tl$-1$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$20 - 10 = ?$tl$, null, $tl$10$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-14 + 14 = ?$tl$, null, $tl$0$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$6 - 15 = ?$tl$, null, $tl$-9$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-24 + 18 = ?$tl$, null, $tl$-6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-45 - 30 = ?$tl$, null, $tl$-75$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-30 + 49 = ?$tl$, null, $tl$19$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-17 - 4 = ?$tl$, null, $tl$-21$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-4 + 10 = ?$tl$, null, $tl$6$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$87 - 97 = ?$tl$, null, $tl$-10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-4 + 60 = ?$tl$, null, $tl$56$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-60 - 30 = ?$tl$, null, $tl$-90$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-82 - 93 = ?$tl$, null, $tl$-175$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-58 - 70 = ?$tl$, null, $tl$-128$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Multiplying & Dividing Integers (7.NS.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$multiply-divide-integers$tl$, $tl$Multiplying & Dividing Integers$tl$, $tl$A negative times a positive is negative; a negative times a negative is positive.$tl$, 7, $tl$7.NS.A.2$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Multiplying & Dividing Integers$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Multiplying & Dividing Integers", "body": "A negative times a positive is negative; a negative times a negative is positive."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  -9 x -7 = ?\n\nThe answer is \"63\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  40 / -8 = ?\n\nThe answer is \"-5\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  -5 x -4 = ?\n\nThe answer is \"20\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  -5 x -10 = ?\n\nThe answer is 50."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  -3 x -10 = ?\n\nThe answer is 30."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  -10 x 11 = ?\n\nThe answer is -110."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Multiplying & Dividing Integers! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-2 x -4 = ?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-4 x -7 = ?$tl$, null, $tl$28$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-8 x 2 = ?$tl$, null, $tl$-16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$18 / -6 = ?$tl$, null, $tl$-3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$16 / -4 = ?$tl$, null, $tl$-4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-6 x -4 = ?$tl$, null, $tl$24$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-3 x 5 = ?$tl$, null, $tl$-15$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$63 / -9 = ?$tl$, null, $tl$-7$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-12 x -6 = ?$tl$, null, $tl$72$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-7 x 9 = ?$tl$, null, $tl$-63$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-10 x -4 = ?$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$72 / -9 = ?$tl$, null, $tl$-8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-7 x 3 = ?$tl$, null, $tl$-21$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$35 / -5 = ?$tl$, null, $tl$-7$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-4 x -4 = ?$tl$, null, $tl$16$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-14 x 15 = ?$tl$, null, $tl$-210$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$39 / -3 = ?$tl$, null, $tl$-13$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-14 x 9 = ?$tl$, null, $tl$-126$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-6 x -3 = ?$tl$, null, $tl$18$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-6 x 9 = ?$tl$, null, $tl$-54$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$multiply-divide-integers$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Order of Operations with Integers (7.NS.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$order-of-operations$tl$, $tl$Order of Operations with Integers$tl$, $tl$Follow order of operations carefully, watching the signs of negative numbers.$tl$, 7, $tl$7.NS.A.3$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Order of Operations with Integers$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Order of Operations with Integers", "body": "Follow order of operations carefully, watching the signs of negative numbers."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  5 + 9 x (-9) = ?\n\nThe answer is \"-76\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  7 + 6 x (-5) = ?\n\nThe answer is \"-23\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  2 + 7 x (-7) = ?\n\nThe answer is \"-47\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  (-4) x 9 + 7 = ?\n\nThe answer is -29."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  (-6) x 8 + 3 = ?\n\nThe answer is -45."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  (-6) x 3 + 9 = ?\n\nThe answer is -9."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Order of Operations with Integers! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$2 + 7 x (-3) = ?$tl$, null, $tl$-19$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$3 + 2 x (-8) = ?$tl$, null, $tl$-13$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$6 + 9 x (-9) = ?$tl$, null, $tl$-75$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 + 8 x (-4) = ?$tl$, null, $tl$-25$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$9 + 9 x (-5) = ?$tl$, null, $tl$-36$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$(-7) x 6 + 4 = ?$tl$, null, $tl$-38$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$(-5) x 8 + 3 = ?$tl$, null, $tl$-37$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$(-6) x 3 + 3 = ?$tl$, null, $tl$-15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$(-3) x 3 + 9 = ?$tl$, null, $tl$0$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$(-8) x 9 + 8 = ?$tl$, null, $tl$-64$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-2 + 5 x 9 - 4 = ?$tl$, null, $tl$39$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-7 + 8 x 5 - 2 = ?$tl$, null, $tl$31$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-7 + 4 x 2 - 2 = ?$tl$, null, $tl$-1$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-2 + 2 x 9 - 8 = ?$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$-2 + 6 x 5 - 9 = ?$tl$, null, $tl$19$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 x (-8) - 8 x 4 = ?$tl$, null, $tl$-88$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 x (-7) - 5 x 9 = ?$tl$, null, $tl$-94$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$12 x (-6) - 2 x 5 = ?$tl$, null, $tl$-82$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$9 x (-9) - 5 x 8 = ?$tl$, null, $tl$-121$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$7 x (-9) - 3 x 6 = ?$tl$, null, $tl$-81$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$order-of-operations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Two-Step Equations (7.EE.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$two-step-equations$tl$, $tl$Two-Step Equations$tl$, $tl$Undo addition or subtraction first, then multiplication or division, to solve for x.$tl$, 7, $tl$7.EE.B.4$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Two-Step Equations$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Two-Step Equations", "body": "Undo addition or subtraction first, then multiplication or division, to solve for x."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Solve for x:  4x + 6 = 18\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Solve for x:  5x + 7 = 47\n\nThe answer is \"8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Solve for x:  2x + 8 = 20\n\nThe answer is \"6\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Solve for x:  8x - 6 = 74\n\nThe answer is 10."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Solve for x:  2x - 13 = 7\n\nThe answer is 10."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Solve for x:  6x - 3 = 45\n\nThe answer is 8."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Two-Step Equations! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  5x + 9 = 34$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  4x + 1 = 29$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  3x + 1 = 28$tl$, null, $tl$9$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  3x + 1 = 13$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  3x + 5 = 26$tl$, null, $tl$7$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  8x - 7 = 33$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  6x - 6 = 24$tl$, null, $tl$5$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  8x - 5 = 59$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  6x - 13 = 35$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  2x - 12 = -8$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  9x + 14 = 104$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  4x + 20 = 48$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  4x + 12 = 72$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  9x + 10 = 55$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  9x + 8 = 80$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  4x - 14 = 42$tl$, null, $tl$14$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  9x - 14 = 4$tl$, null, $tl$2$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  12x - 5 = 175$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  3x - 2 = 46$tl$, null, $tl$16$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Solve for x:  7x - 7 = 112$tl$, null, $tl$17$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$two-step-equations$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Combining Like Terms (7.EE.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$combining-like-terms$tl$, $tl$Combining Like Terms$tl$, $tl$Add the coefficients of like terms to simplify an expression.$tl$, 7, $tl$7.EE.A.1$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Combining Like Terms$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Combining Like Terms", "body": "Add the coefficients of like terms to simplify an expression."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Simplify:  3x + 2 + 2x\n\nThe answer is \"5x + 2\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Simplify:  3x + 4 + 6x\n\nThe answer is \"9x + 4\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Simplify:  4x + 4 + 6x\n\nThe answer is \"10x + 4\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Simplify:  4x + 1 + 4x", "choices": [{"id": "a", "label": "9x"}, {"id": "b", "label": "16x + 1"}, {"id": "c", "label": "8x + 1"}, {"id": "d", "label": "8x + 2"}], "answer": "c", "explanation": "Yes! The answer is \"8x + 1\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Simplify:  4x + 5 + 4x", "choices": [{"id": "a", "label": "13x"}, {"id": "b", "label": "16x + 5"}, {"id": "c", "label": "8x + 5"}, {"id": "d", "label": "8x + 6"}], "answer": "c", "explanation": "Yes! The answer is \"8x + 5\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Simplify:  7x + 2 + 4x", "choices": [{"id": "a", "label": "11x + 3"}, {"id": "b", "label": "13x"}, {"id": "c", "label": "28x + 2"}, {"id": "d", "label": "11x + 2"}], "answer": "d", "explanation": "Yes! The answer is \"11x + 2\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Combining Like Terms! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  2x + 6 + 3x$tl$, $tl$[{"id": "a", "label": "6x + 6"}, {"id": "b", "label": "11x"}, {"id": "c", "label": "5x + 6"}, {"id": "d", "label": "5x + 7"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  5x + 5 + 4x$tl$, $tl$[{"id": "a", "label": "9x + 5"}, {"id": "b", "label": "20x + 5"}, {"id": "c", "label": "9x + 6"}, {"id": "d", "label": "14x"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  6x + 2 + 5x$tl$, $tl$[{"id": "a", "label": "30x + 2"}, {"id": "b", "label": "13x"}, {"id": "c", "label": "11x + 3"}, {"id": "d", "label": "11x + 2"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  4x + 3 + 5x$tl$, $tl$[{"id": "a", "label": "9x + 3"}, {"id": "b", "label": "12x"}, {"id": "c", "label": "9x + 4"}, {"id": "d", "label": "20x + 3"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  2x + 5 + 2x$tl$, $tl$[{"id": "a", "label": "4x + 5"}, {"id": "b", "label": "4x + 6"}, {"id": "c", "label": "1"}, {"id": "d", "label": "9x"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  3x + 2 + 2x$tl$, $tl$[{"id": "a", "label": "5x + 2"}, {"id": "b", "label": "5x + 3"}, {"id": "c", "label": "6x + 2"}, {"id": "d", "label": "7x"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  5x + 6 + 4x$tl$, $tl$[{"id": "a", "label": "15x"}, {"id": "b", "label": "20x + 6"}, {"id": "c", "label": "9x + 7"}, {"id": "d", "label": "9x + 6"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  7x + 7 + 8x$tl$, $tl$[{"id": "a", "label": "15x + 7"}, {"id": "b", "label": "15x + 8"}, {"id": "c", "label": "22x"}, {"id": "d", "label": "56x + 7"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  5x + 5 + 2x$tl$, $tl$[{"id": "a", "label": "7x + 5"}, {"id": "b", "label": "7x + 6"}, {"id": "c", "label": "12x"}, {"id": "d", "label": "10x + 5"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  7x + 4 + 2x$tl$, $tl$[{"id": "a", "label": "14x + 4"}, {"id": "b", "label": "13x"}, {"id": "c", "label": "9x + 5"}, {"id": "d", "label": "9x + 4"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  4x + 5 + 8x$tl$, $tl$[{"id": "a", "label": "12x + 6"}, {"id": "b", "label": "32x + 5"}, {"id": "c", "label": "12x + 5"}, {"id": "d", "label": "17x"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  2x + 5 + 4x$tl$, $tl$[{"id": "a", "label": "8x + 5"}, {"id": "b", "label": "6x + 5"}, {"id": "c", "label": "11x"}, {"id": "d", "label": "6x + 6"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  2x + 1 + 10x$tl$, $tl$[{"id": "a", "label": "20x + 1"}, {"id": "b", "label": "13x"}, {"id": "c", "label": "12x + 1"}, {"id": "d", "label": "12x + 2"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  8x + 9 + 6x$tl$, $tl$[{"id": "a", "label": "23x"}, {"id": "b", "label": "14x + 9"}, {"id": "c", "label": "48x + 9"}, {"id": "d", "label": "14x + 10"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  4x + 6 + 9x$tl$, $tl$[{"id": "a", "label": "13x + 7"}, {"id": "b", "label": "36x + 6"}, {"id": "c", "label": "19x"}, {"id": "d", "label": "13x + 6"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  7x + 10 + 6x$tl$, $tl$[{"id": "a", "label": "23x"}, {"id": "b", "label": "13x + 10"}, {"id": "c", "label": "13x + 11"}, {"id": "d", "label": "42x + 10"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  10x + 17 + 6x$tl$, $tl$[{"id": "a", "label": "16x + 17"}, {"id": "b", "label": "16x + 18"}, {"id": "c", "label": "60x + 17"}, {"id": "d", "label": "33x"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  3x + 19 + 12x$tl$, $tl$[{"id": "a", "label": "15x + 20"}, {"id": "b", "label": "34x"}, {"id": "c", "label": "36x + 19"}, {"id": "d", "label": "15x + 19"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  5x + 10 + 6x$tl$, $tl$[{"id": "a", "label": "11x + 11"}, {"id": "b", "label": "21x"}, {"id": "c", "label": "30x + 10"}, {"id": "d", "label": "11x + 10"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Simplify:  8x + 18 + 8x$tl$, $tl$[{"id": "a", "label": "16x + 18"}, {"id": "b", "label": "64x + 18"}, {"id": "c", "label": "34x"}, {"id": "d", "label": "16x + 19"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$combining-like-terms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Area & Circumference of Circles (7.G.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$circles$tl$, $tl$Area & Circumference of Circles$tl$, $tl$Area = pi x r x r; circumference = 2 x pi x r. Use 3.14 as an estimate for pi.$tl$, 7, $tl$7.G.B.4$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Area & Circumference of Circles$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Area & Circumference of Circles", "body": "Area = pi x r x r; circumference = 2 x pi x r. Use 3.14 as an estimate for pi."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Find the AREA of a circle with radius 4. Use 3.14 for pi. (area = pi x r x r)\n\nThe answer is \"50.24\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Find the AREA of a circle with radius 5. Use 3.14 for pi. (area = pi x r x r)\n\nThe answer is \"78.5\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Find the AREA of a circle with radius 4. Use 3.14 for pi. (area = pi x r x r)\n\nThe answer is \"50.24\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the AREA of a circle with radius 2. Use 3.14 for pi. (area = pi x r x r)", "choices": [{"id": "a", "label": "25.12"}, {"id": "b", "label": "6.28"}, {"id": "c", "label": "4"}, {"id": "d", "label": "12.56"}], "answer": "d", "explanation": "Yes! The answer is \"12.56\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the AREA of a circle with radius 5. Use 3.14 for pi. (area = pi x r x r)", "choices": [{"id": "a", "label": "78.5"}, {"id": "b", "label": "25"}, {"id": "c", "label": "15.7"}, {"id": "d", "label": "157"}], "answer": "a", "explanation": "Yes! The answer is \"78.5\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the CIRCUMFERENCE of a circle with radius 7. Use 3.14 for pi. (C = 2 x pi x r)", "choices": [{"id": "a", "label": "14"}, {"id": "b", "label": "153.86"}, {"id": "c", "label": "43.96"}, {"id": "d", "label": "21.98"}], "answer": "c", "explanation": "Yes! The answer is \"43.96\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Area & Circumference of Circles! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 4. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "12.56"}, {"id": "b", "label": "50.24"}, {"id": "c", "label": "16"}, {"id": "d", "label": "25.12"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 2. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "12.56"}, {"id": "b", "label": "6.28"}, {"id": "c", "label": "25.12"}, {"id": "d", "label": "4"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 5. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "31.4"}, {"id": "b", "label": "25"}, {"id": "c", "label": "78.5"}, {"id": "d", "label": "15.7"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 3. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "18.84"}, {"id": "b", "label": "9"}, {"id": "c", "label": "9.42"}, {"id": "d", "label": "28.26"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 4. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "16"}, {"id": "b", "label": "100.48"}, {"id": "c", "label": "25.12"}, {"id": "d", "label": "50.24"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 9. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "254.34"}, {"id": "b", "label": "28.26"}, {"id": "c", "label": "113.04"}, {"id": "d", "label": "56.52"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 7. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "14"}, {"id": "b", "label": "43.96"}, {"id": "c", "label": "87.92"}, {"id": "d", "label": "21.98"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 8. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "25.12"}, {"id": "b", "label": "50.24"}, {"id": "c", "label": "16"}, {"id": "d", "label": "100.48"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 8. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "50.24"}, {"id": "b", "label": "100.48"}, {"id": "c", "label": "200.96"}, {"id": "d", "label": "25.12"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 9. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "113.04"}, {"id": "b", "label": "56.52"}, {"id": "c", "label": "28.26"}, {"id": "d", "label": "18"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 7. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "153.86"}, {"id": "b", "label": "21.98"}, {"id": "c", "label": "307.72"}, {"id": "d", "label": "49"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 8. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "25.12"}, {"id": "b", "label": "200.96"}, {"id": "c", "label": "50.24"}, {"id": "d", "label": "64"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 8. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "401.92"}, {"id": "b", "label": "64"}, {"id": "c", "label": "200.96"}, {"id": "d", "label": "25.12"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 14. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "43.96"}, {"id": "b", "label": "615.44"}, {"id": "c", "label": "87.92"}, {"id": "d", "label": "1230.88"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the AREA of a circle with radius 13. Use 3.14 for pi. (area = pi x r x r)$tl$, $tl$[{"id": "a", "label": "40.82"}, {"id": "b", "label": "169"}, {"id": "c", "label": "81.64"}, {"id": "d", "label": "530.66"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 9. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "56.52"}, {"id": "b", "label": "18"}, {"id": "c", "label": "254.34"}, {"id": "d", "label": "113.04"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 18. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "226.08"}, {"id": "b", "label": "56.52"}, {"id": "c", "label": "113.04"}, {"id": "d", "label": "1017.36"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 20. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "40"}, {"id": "b", "label": "62.8"}, {"id": "c", "label": "125.6"}, {"id": "d", "label": "251.2"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 14. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "87.92"}, {"id": "b", "label": "615.44"}, {"id": "c", "label": "43.96"}, {"id": "d", "label": "175.84"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Find the CIRCUMFERENCE of a circle with radius 19. Use 3.14 for pi. (C = 2 x pi x r)$tl$, $tl$[{"id": "a", "label": "1133.54"}, {"id": "b", "label": "59.66"}, {"id": "c", "label": "119.32"}, {"id": "d", "label": "38"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$circles$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Volume of Prisms (7.G.B.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$volume-of-prisms$tl$, $tl$Volume of Prisms$tl$, $tl$Volume of a prism is the area of its base times its length (or height).$tl$, 7, $tl$7.G.B.6$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Volume of Prisms$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Volume of Prisms", "body": "Volume of a prism is the area of its base times its length (or height)."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A rectangular prism is 2 by 3 by 5 units. What is its volume in cubic units?\n\nThe answer is \"30\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A rectangular prism is 4 by 3 by 4 units. What is its volume in cubic units?\n\nThe answer is \"48\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A rectangular prism is 4 by 5 by 5 units. What is its volume in cubic units?\n\nThe answer is \"100\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A rectangular prism is 6 by 2 by 7 units. What is its volume in cubic units?\n\nThe answer is 84."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A rectangular prism is 4 by 2 by 4 units. What is its volume in cubic units?\n\nThe answer is 32."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A rectangular prism is 8 by 3 by 4 units. What is its volume in cubic units?\n\nThe answer is 96."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Volume of Prisms! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 3 by 5 by 2 units. What is its volume in cubic units?$tl$, null, $tl$30$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 2 by 4 by 5 units. What is its volume in cubic units?$tl$, null, $tl$40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 5 by 4 by 3 units. What is its volume in cubic units?$tl$, null, $tl$60$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 4 by 3 by 4 units. What is its volume in cubic units?$tl$, null, $tl$48$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 2 by 4 by 2 units. What is its volume in cubic units?$tl$, null, $tl$16$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 9 by 4 by 7 units. What is its volume in cubic units?$tl$, null, $tl$252$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 2 by 5 by 6 units. What is its volume in cubic units?$tl$, null, $tl$60$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 2 by 3 by 3 units. What is its volume in cubic units?$tl$, null, $tl$18$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 5 by 6 by 7 units. What is its volume in cubic units?$tl$, null, $tl$210$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A rectangular prism is 3 by 3 by 6 units. What is its volume in cubic units?$tl$, null, $tl$54$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 4 and height 3, and a length of 8. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$48$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 12 and height 7, and a length of 7. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$294$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 10 and height 4, and a length of 4. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$80$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 10 and height 3, and a length of 5. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$75$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 12 and height 3, and a length of 7. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$126$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 4 and height 5, and a length of 15. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$150$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 10 and height 3, and a length of 4. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$60$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 4 and height 6, and a length of 15. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$180$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 4 and height 3, and a length of 13. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$78$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A triangular prism has a triangle base of 6 and height 3, and a length of 3. Volume = (1/2 x base x height) x length = ?$tl$, null, $tl$27$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-of-prisms$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Photosynthesis & Respiration (MS-LS1-6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$photosynthesis-respiration$tl$, $tl$Photosynthesis & Respiration$tl$, $tl$Plants make food in photosynthesis; cells release that energy in respiration.$tl$, 7, $tl$MS-LS1-6$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Photosynthesis & Respiration$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Photosynthesis & Respiration", "body": "Plants make food in photosynthesis; cells release that energy in respiration."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  In photosynthesis, plants use sunlight, water, and carbon dioxide to make:\n\nThe answer is \"glucose (sugar) and oxygen\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which gas do plants take IN during photosynthesis?\n\nThe answer is \"carbon dioxide\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which gas do plants RELEASE during photosynthesis?\n\nThe answer is \"oxygen\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Cellular respiration releases energy from food using:", "choices": [{"id": "a", "label": "sunlight"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "nitrogen"}, {"id": "d", "label": "oxygen"}], "answer": "d", "explanation": "Yes! The answer is \"oxygen\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Respiration produces carbon dioxide, water, and:", "choices": [{"id": "a", "label": "sugar"}, {"id": "b", "label": "energy (ATP)"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "sunlight"}], "answer": "b", "explanation": "Yes! The answer is \"energy (ATP)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Photosynthesis happens in plant cell parts called:", "choices": [{"id": "a", "label": "mitochondria"}, {"id": "b", "label": "nuclei"}, {"id": "c", "label": "chloroplasts"}, {"id": "d", "label": "ribosomes"}], "answer": "c", "explanation": "Yes! The answer is \"chloroplasts\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Photosynthesis & Respiration! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In photosynthesis, plants use sunlight, water, and carbon dioxide to make:$tl$, $tl$[{"id": "a", "label": "soil and rocks"}, {"id": "b", "label": "glucose (sugar) and oxygen"}, {"id": "c", "label": "only water"}, {"id": "d", "label": "carbon only"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which gas do plants take IN during photosynthesis?$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "nitrogen"}, {"id": "c", "label": "helium"}, {"id": "d", "label": "carbon dioxide"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which gas do plants RELEASE during photosynthesis?$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "hydrogen"}, {"id": "c", "label": "methane"}, {"id": "d", "label": "oxygen"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Cellular respiration releases energy from food using:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "nitrogen"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Respiration produces carbon dioxide, water, and:$tl$, $tl$[{"id": "a", "label": "sugar"}, {"id": "b", "label": "energy (ATP)"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "sunlight"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Photosynthesis happens in plant cell parts called:$tl$, $tl$[{"id": "a", "label": "mitochondria"}, {"id": "b", "label": "nuclei"}, {"id": "c", "label": "chloroplasts"}, {"id": "d", "label": "ribosomes"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Cellular respiration happens mainly in the:$tl$, $tl$[{"id": "a", "label": "chloroplasts"}, {"id": "b", "label": "cell wall"}, {"id": "c", "label": "mitochondria"}, {"id": "d", "label": "nucleus"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Photosynthesis and respiration are nearly:$tl$, $tl$[{"id": "a", "label": "the same process"}, {"id": "b", "label": "opposite processes"}, {"id": "c", "label": "unrelated"}, {"id": "d", "label": "both only in animals"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Where does the energy for photosynthesis originally come from?$tl$, $tl$[{"id": "a", "label": "the soil"}, {"id": "b", "label": "the Sun"}, {"id": "c", "label": "the air"}, {"id": "d", "label": "the Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Animals get the energy stored by plants by:$tl$, $tl$[{"id": "a", "label": "photosynthesizing"}, {"id": "b", "label": "absorbing sunlight"}, {"id": "c", "label": "eating them (and respiring)"}, {"id": "d", "label": "drinking only"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The green pigment that captures light energy is:$tl$, $tl$[{"id": "a", "label": "chlorophyll"}, {"id": "b", "label": "glucose"}, {"id": "c", "label": "oxygen"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Both plants and animals carry out:$tl$, $tl$[{"id": "a", "label": "only photosynthesis"}, {"id": "b", "label": "cellular respiration"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "only digestion"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$During the day, plants do photosynthesis and also:$tl$, $tl$[{"id": "a", "label": "respiration"}, {"id": "b", "label": "only sleep"}, {"id": "c", "label": "only freeze"}, {"id": "d", "label": "stop all activity"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The products of photosynthesis become the reactants of:$tl$, $tl$[{"id": "a", "label": "digestion only"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "respiration"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If a plant gets no light, it cannot:$tl$, $tl$[{"id": "a", "label": "make food (glucose)"}, {"id": "b", "label": "take in water"}, {"id": "c", "label": "have roots"}, {"id": "d", "label": "respire ever"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The process plants use to make food from sunlight is ____. (one word)$tl$, null, $tl$photosynthesis$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy released by respiration is stored briefly in a molecule called:$tl$, $tl$[{"id": "a", "label": "DNA"}, {"id": "b", "label": "H2O"}, {"id": "c", "label": "ATP"}, {"id": "d", "label": "CO2"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Carbon cycles between plants and animals through photosynthesis and:$tl$, $tl$[{"id": "a", "label": "respiration"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "evaporation"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Most of a plant's mass comes from carbon dioxide and:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "soil minerals only"}, {"id": "c", "label": "sunlight as matter"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which equation best summarizes photosynthesis?$tl$, $tl$[{"id": "a", "label": "glucose -> rocks"}, {"id": "b", "label": "CO2 + water + light -> glucose + oxygen"}, {"id": "c", "label": "oxygen -> CO2 only"}, {"id": "d", "label": "water -> light"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$photosynthesis-respiration$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Matter & Energy in Ecosystems (MS-LS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$matter-and-energy-in-ecosystems$tl$, $tl$Matter & Energy in Ecosystems$tl$, $tl$Energy flows one way and is lost as heat; matter is recycled through ecosystems.$tl$, 7, $tl$MS-LS2-3$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Matter & Energy in Ecosystems$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Matter & Energy in Ecosystems", "body": "Energy flows one way and is lost as heat; matter is recycled through ecosystems."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Energy enters most ecosystems as:\n\nThe answer is \"sunlight\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Matter such as carbon and water is:\n\nThe answer is \"recycled through the ecosystem\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Energy moves through an ecosystem and is mostly lost as:\n\nThe answer is \"heat\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Decomposers return nutrients (matter) to the:", "choices": [{"id": "a", "label": "Sun"}, {"id": "b", "label": "atmosphere only"}, {"id": "c", "label": "ocean only"}, {"id": "d", "label": "soil"}], "answer": "d", "explanation": "Yes! The answer is \"soil\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An energy pyramid shows that available energy decreases as you go:", "choices": [{"id": "a", "label": "down the levels"}, {"id": "b", "label": "into the Sun"}, {"id": "c", "label": "up the levels"}, {"id": "d", "label": "sideways"}], "answer": "c", "explanation": "Yes! The answer is \"up the levels\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "About how much energy passes to the next trophic level?", "choices": [{"id": "a", "label": "roughly 10%"}, {"id": "b", "label": "100%"}, {"id": "c", "label": "90%"}, {"id": "d", "label": "0%"}], "answer": "a", "explanation": "Yes! The answer is \"roughly 10%\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Matter & Energy in Ecosystems! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy enters most ecosystems as:$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "rock"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Matter such as carbon and water is:$tl$, $tl$[{"id": "a", "label": "created daily"}, {"id": "b", "label": "recycled through the ecosystem"}, {"id": "c", "label": "destroyed"}, {"id": "d", "label": "only in plants"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy moves through an ecosystem and is mostly lost as:$tl$, $tl$[{"id": "a", "label": "matter"}, {"id": "b", "label": "light"}, {"id": "c", "label": "heat"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Decomposers return nutrients (matter) to the:$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "atmosphere only"}, {"id": "d", "label": "ocean only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An energy pyramid shows that available energy decreases as you go:$tl$, $tl$[{"id": "a", "label": "down the levels"}, {"id": "b", "label": "into the Sun"}, {"id": "c", "label": "up the levels"}, {"id": "d", "label": "sideways"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$About how much energy passes to the next trophic level?$tl$, $tl$[{"id": "a", "label": "100%"}, {"id": "b", "label": "90%"}, {"id": "c", "label": "roughly 10%"}, {"id": "d", "label": "0%"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Producers capture energy and store it as:$tl$, $tl$[{"id": "a", "label": "chemical energy in food"}, {"id": "b", "label": "heat"}, {"id": "c", "label": "light"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Unlike energy, matter in an ecosystem is:$tl$, $tl$[{"id": "a", "label": "used up forever"}, {"id": "b", "label": "conserved and cycled"}, {"id": "c", "label": "made from nothing"}, {"id": "d", "label": "turned to light"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The carbon cycle moves carbon between organisms, the air, and the:$tl$, $tl$[{"id": "a", "label": "ground/oceans"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "stars"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Burning fossil fuels adds carbon dioxide to the:$tl$, $tl$[{"id": "a", "label": "soil only"}, {"id": "b", "label": "oceans only"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "atmosphere"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If decomposers vanished, nutrients would:$tl$, $tl$[{"id": "a", "label": "increase in soil"}, {"id": "b", "label": "stay locked in dead matter"}, {"id": "c", "label": "turn to energy"}, {"id": "d", "label": "disappear"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A food web models the flow of energy and the transfer of:$tl$, $tl$[{"id": "a", "label": "money"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "matter (nutrients)"}, {"id": "d", "label": "light only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Because energy is lost at each step, ecosystems need a constant input of:$tl$, $tl$[{"id": "a", "label": "decomposers"}, {"id": "b", "label": "predators"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Water cycles through ecosystems by evaporation, condensation, and:$tl$, $tl$[{"id": "a", "label": "precipitation"}, {"id": "b", "label": "respiration only"}, {"id": "c", "label": "combustion"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The total amount of matter in a closed ecosystem stays:$tl$, $tl$[{"id": "a", "label": "always rising"}, {"id": "b", "label": "always zero"}, {"id": "c", "label": "random"}, {"id": "d", "label": "about the same"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Energy that enters ecosystems comes mainly from the ____. (one word)$tl$, null, $tl$Sun$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Nitrogen-fixing bacteria help cycle ____ into a usable form for plants.$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "carbon only"}, {"id": "c", "label": "nitrogen"}, {"id": "d", "label": "gold"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A drop in the producer population would most likely cause consumers to:$tl$, $tl$[{"id": "a", "label": "increase"}, {"id": "b", "label": "decline"}, {"id": "c", "label": "make food"}, {"id": "d", "label": "become producers"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy flows in ____ direction(s) through a food chain.$tl$, $tl$[{"id": "a", "label": "two"}, {"id": "b", "label": "one"}, {"id": "c", "label": "no"}, {"id": "d", "label": "random"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Matter and energy are both essential, but only ____ is recycled.$tl$, $tl$[{"id": "a", "label": "energy"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "heat"}, {"id": "d", "label": "matter"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$matter-and-energy-in-ecosystems$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Natural Selection (MS-LS4-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$natural-selection$tl$, $tl$Natural Selection$tl$, $tl$Helpful inherited traits become more common over generations as organisms survive.$tl$, 7, $tl$MS-LS4-4$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Natural Selection$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Natural Selection", "body": "Helpful inherited traits become more common over generations as organisms survive."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Traits that help an organism survive and reproduce are:\n\nThe answer is \"favored by natural selection\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Differences among individuals of a species are called:\n\nThe answer is \"variation\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Organisms with helpful traits are more likely to:\n\nThe answer is \"survive and have offspring\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Over many generations, helpful traits become:", "choices": [{"id": "a", "label": "less common"}, {"id": "b", "label": "more common"}, {"id": "c", "label": "random"}, {"id": "d", "label": "extinct"}], "answer": "b", "explanation": "Yes! The answer is \"more common\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A heritable trait that improves survival is an:", "choices": [{"id": "a", "label": "accident"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "fossil"}, {"id": "d", "label": "adaptation"}], "answer": "d", "explanation": "Yes! The answer is \"adaptation\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Natural selection acts on traits that are:", "choices": [{"id": "a", "label": "learned in life"}, {"id": "b", "label": "inherited"}, {"id": "c", "label": "painted on"}, {"id": "d", "label": "temporary"}], "answer": "b", "explanation": "Yes! The answer is \"inherited\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Natural Selection! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Traits that help an organism survive and reproduce are:$tl$, $tl$[{"id": "a", "label": "always lost"}, {"id": "b", "label": "harmful"}, {"id": "c", "label": "random only"}, {"id": "d", "label": "favored by natural selection"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Differences among individuals of a species are called:$tl$, $tl$[{"id": "a", "label": "extinction"}, {"id": "b", "label": "mutation only"}, {"id": "c", "label": "variation"}, {"id": "d", "label": "adaptation"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Organisms with helpful traits are more likely to:$tl$, $tl$[{"id": "a", "label": "survive and have offspring"}, {"id": "b", "label": "die first"}, {"id": "c", "label": "never reproduce"}, {"id": "d", "label": "become plants"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Over many generations, helpful traits become:$tl$, $tl$[{"id": "a", "label": "less common"}, {"id": "b", "label": "more common"}, {"id": "c", "label": "random"}, {"id": "d", "label": "extinct"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A heritable trait that improves survival is an:$tl$, $tl$[{"id": "a", "label": "adaptation"}, {"id": "b", "label": "accident"}, {"id": "c", "label": "habitat"}, {"id": "d", "label": "fossil"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Natural selection acts on traits that are:$tl$, $tl$[{"id": "a", "label": "inherited"}, {"id": "b", "label": "learned in life"}, {"id": "c", "label": "painted on"}, {"id": "d", "label": "temporary"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The source of new variation in a population is:$tl$, $tl$[{"id": "a", "label": "studying"}, {"id": "b", "label": "exercise"}, {"id": "c", "label": "mutation"}, {"id": "d", "label": "weather"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Camouflage is an adaptation that helps prey:$tl$, $tl$[{"id": "a", "label": "fly"}, {"id": "b", "label": "photosynthesize"}, {"id": "c", "label": "avoid predators"}, {"id": "d", "label": "swim faster only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If the environment changes, organisms best suited to it will:$tl$, $tl$[{"id": "a", "label": "all die equally"}, {"id": "b", "label": "be more likely to survive"}, {"id": "c", "label": "become extinct first"}, {"id": "d", "label": "stop reproducing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The scientist who proposed natural selection was:$tl$, $tl$[{"id": "a", "label": "Isaac Newton"}, {"id": "b", "label": "Albert Einstein"}, {"id": "c", "label": "Charles Darwin"}, {"id": "d", "label": "Marie Curie"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Fossils provide evidence that species have:$tl$, $tl$[{"id": "a", "label": "always stayed the same"}, {"id": "b", "label": "never existed"}, {"id": "c", "label": "changed over time"}, {"id": "d", "label": "appeared yesterday"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A population of fast-running prey likely evolved that way because slow ones:$tl$, $tl$[{"id": "a", "label": "ran faster"}, {"id": "b", "label": "were caught more often"}, {"id": "c", "label": "stopped eating"}, {"id": "d", "label": "grew wings"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Selective breeding by humans is similar to natural selection but the selecting is done by:$tl$, $tl$[{"id": "a", "label": "the weather"}, {"id": "b", "label": "predators"}, {"id": "c", "label": "people"}, {"id": "d", "label": "the Sun"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Antibiotic-resistant bacteria are an example of:$tl$, $tl$[{"id": "a", "label": "natural selection in action"}, {"id": "b", "label": "learning"}, {"id": "c", "label": "photosynthesis"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which is NOT required for natural selection?$tl$, $tl$[{"id": "a", "label": "every individual being identical"}, {"id": "b", "label": "variation"}, {"id": "c", "label": "heredity"}, {"id": "d", "label": "differences in survival"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A heritable feature that helps an organism survive is an ____. (one word)$tl$, null, $tl$adaptation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Over a long time, accumulated changes can lead to new:$tl$, $tl$[{"id": "a", "label": "planets"}, {"id": "b", "label": "minerals"}, {"id": "c", "label": "seasons"}, {"id": "d", "label": "species"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Beak shapes of finches differ because different shapes help eat different:$tl$, $tl$[{"id": "a", "label": "weather"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "colors"}, {"id": "d", "label": "foods"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Traits that do NOT help survival tend to become:$tl$, $tl$[{"id": "a", "label": "less common over time"}, {"id": "b", "label": "more common"}, {"id": "c", "label": "mandatory"}, {"id": "d", "label": "instant"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Natural selection explains how populations:$tl$, $tl$[{"id": "a", "label": "create themselves"}, {"id": "b", "label": "adapt to their environment"}, {"id": "c", "label": "never change"}, {"id": "d", "label": "ignore the environment"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Heredity & Genes (MS-LS3-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$heredity-and-genes$tl$, $tl$Heredity & Genes$tl$, $tl$Genes made of DNA carry traits from parents to offspring; alleles can be dominant or recessive.$tl$, 7, $tl$MS-LS3-2$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Heredity & Genes$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Heredity & Genes", "body": "Genes made of DNA carry traits from parents to offspring; alleles can be dominant or recessive."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The molecule that carries genetic information is:\n\nThe answer is \"DNA\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A segment of DNA that codes for a trait is a:\n\nThe answer is \"gene\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Offspring inherit genes from:\n\nThe answer is \"both parents\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Different versions of a gene are called:", "choices": [{"id": "a", "label": "cells"}, {"id": "b", "label": "proteins"}, {"id": "c", "label": "organs"}, {"id": "d", "label": "alleles"}], "answer": "d", "explanation": "Yes! The answer is \"alleles\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A trait that is expressed when at least one allele is present is:", "choices": [{"id": "a", "label": "recessive"}, {"id": "b", "label": "dominant"}, {"id": "c", "label": "blended"}, {"id": "d", "label": "extinct"}], "answer": "b", "explanation": "Yes! The answer is \"dominant\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A trait shown only when both alleles match is:", "choices": [{"id": "a", "label": "dominant"}, {"id": "b", "label": "mutated"}, {"id": "c", "label": "recessive"}, {"id": "d", "label": "learned"}], "answer": "c", "explanation": "Yes! The answer is \"recessive\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Heredity & Genes! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The molecule that carries genetic information is:$tl$, $tl$[{"id": "a", "label": "DNA"}, {"id": "b", "label": "RNA only"}, {"id": "c", "label": "ATP"}, {"id": "d", "label": "glucose"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A segment of DNA that codes for a trait is a:$tl$, $tl$[{"id": "a", "label": "cell"}, {"id": "b", "label": "organ"}, {"id": "c", "label": "ribosome"}, {"id": "d", "label": "gene"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Offspring inherit genes from:$tl$, $tl$[{"id": "a", "label": "only the mother"}, {"id": "b", "label": "both parents"}, {"id": "c", "label": "the environment"}, {"id": "d", "label": "no one"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Different versions of a gene are called:$tl$, $tl$[{"id": "a", "label": "cells"}, {"id": "b", "label": "alleles"}, {"id": "c", "label": "proteins"}, {"id": "d", "label": "organs"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A trait that is expressed when at least one allele is present is:$tl$, $tl$[{"id": "a", "label": "recessive"}, {"id": "b", "label": "dominant"}, {"id": "c", "label": "blended"}, {"id": "d", "label": "extinct"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A trait shown only when both alleles match is:$tl$, $tl$[{"id": "a", "label": "dominant"}, {"id": "b", "label": "mutated"}, {"id": "c", "label": "recessive"}, {"id": "d", "label": "learned"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An organism's genetic makeup is its:$tl$, $tl$[{"id": "a", "label": "phenotype"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "genotype"}, {"id": "d", "label": "niche"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An organism's observable traits make up its:$tl$, $tl$[{"id": "a", "label": "genotype"}, {"id": "b", "label": "allele"}, {"id": "c", "label": "gene"}, {"id": "d", "label": "phenotype"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A Punnett square is used to predict:$tl$, $tl$[{"id": "a", "label": "the weather"}, {"id": "b", "label": "population size"}, {"id": "c", "label": "offspring trait probabilities"}, {"id": "d", "label": "extinction"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Humans have two copies of each gene because they get one from:$tl$, $tl$[{"id": "a", "label": "each parent"}, {"id": "b", "label": "the soil"}, {"id": "c", "label": "only the father"}, {"id": "d", "label": "the environment"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A change in a DNA sequence is a:$tl$, $tl$[{"id": "a", "label": "mutation"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "cell wall"}, {"id": "d", "label": "fossil"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Sexual reproduction increases genetic:$tl$, $tl$[{"id": "a", "label": "sameness"}, {"id": "b", "label": "variation"}, {"id": "c", "label": "extinction"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Traits like eye color are determined mostly by:$tl$, $tl$[{"id": "a", "label": "genes"}, {"id": "b", "label": "practice"}, {"id": "c", "label": "diet alone"}, {"id": "d", "label": "weather"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If both parents are carriers of a recessive allele, offspring:$tl$, $tl$[{"id": "a", "label": "never show it"}, {"id": "b", "label": "may show the recessive trait"}, {"id": "c", "label": "are identical"}, {"id": "d", "label": "have no genes"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Chromosomes are made of tightly coiled:$tl$, $tl$[{"id": "a", "label": "DNA"}, {"id": "b", "label": "sugar"}, {"id": "c", "label": "water"}, {"id": "d", "label": "minerals"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A segment of DNA that codes for a trait is called a ____. (one word)$tl$, null, $tl$gene$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The passing of traits from parents to offspring is:$tl$, $tl$[{"id": "a", "label": "erosion"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "heredity"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Identical twins have the same:$tl$, $tl$[{"id": "a", "label": "fingerprints exactly"}, {"id": "b", "label": "DNA"}, {"id": "c", "label": "thoughts"}, {"id": "d", "label": "memories"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A dominant allele is often shown with a:$tl$, $tl$[{"id": "a", "label": "lowercase letter"}, {"id": "b", "label": "capital letter"}, {"id": "c", "label": "number"}, {"id": "d", "label": "symbol only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Genetic variation is important because it helps a species:$tl$, $tl$[{"id": "a", "label": "stay identical"}, {"id": "b", "label": "adapt and survive"}, {"id": "c", "label": "go extinct"}, {"id": "d", "label": "stop reproducing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Chemical Reactions (MS-PS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$chemical-reactions$tl$, $tl$Chemical Reactions$tl$, $tl$Reactions rearrange atoms to form new substances while conserving mass.$tl$, 7, $tl$MS-PS1-2$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Chemical Reactions$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Chemical Reactions", "body": "Reactions rearrange atoms to form new substances while conserving mass."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  In a chemical reaction, the starting substances are the:\n\nThe answer is \"reactants\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The new substances formed are the:\n\nThe answer is \"products\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A chemical reaction forms substances with:\n\nThe answer is \"new properties\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In any reaction, the total mass of reactants equals the total mass of:", "choices": [{"id": "a", "label": "nothing"}, {"id": "b", "label": "products"}, {"id": "c", "label": "the catalyst"}, {"id": "d", "label": "the gas only"}], "answer": "b", "explanation": "Yes! The answer is \"products\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "This equality of mass is the law of:", "choices": [{"id": "a", "label": "gravity"}, {"id": "b", "label": "conservation of mass"}, {"id": "c", "label": "motion"}, {"id": "d", "label": "reflection"}], "answer": "b", "explanation": "Yes! The answer is \"conservation of mass\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signs of a chemical change include a color change, gas, light, or:", "choices": [{"id": "a", "label": "a new shape only"}, {"id": "b", "label": "temperature change"}, {"id": "c", "label": "melting only"}, {"id": "d", "label": "dissolving only"}], "answer": "b", "explanation": "Yes! The answer is \"temperature change\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Chemical Reactions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In a chemical reaction, the starting substances are the:$tl$, $tl$[{"id": "a", "label": "products"}, {"id": "b", "label": "mixtures"}, {"id": "c", "label": "elements only"}, {"id": "d", "label": "reactants"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The new substances formed are the:$tl$, $tl$[{"id": "a", "label": "products"}, {"id": "b", "label": "reactants"}, {"id": "c", "label": "catalysts"}, {"id": "d", "label": "atoms only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A chemical reaction forms substances with:$tl$, $tl$[{"id": "a", "label": "new properties"}, {"id": "b", "label": "the same exact properties"}, {"id": "c", "label": "no atoms"}, {"id": "d", "label": "no mass"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In any reaction, the total mass of reactants equals the total mass of:$tl$, $tl$[{"id": "a", "label": "nothing"}, {"id": "b", "label": "the catalyst"}, {"id": "c", "label": "products"}, {"id": "d", "label": "the gas only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$This equality of mass is the law of:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "conservation of mass"}, {"id": "c", "label": "motion"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Signs of a chemical change include a color change, gas, light, or:$tl$, $tl$[{"id": "a", "label": "a new shape only"}, {"id": "b", "label": "temperature change"}, {"id": "c", "label": "melting only"}, {"id": "d", "label": "dissolving only"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Rusting iron is a:$tl$, $tl$[{"id": "a", "label": "chemical change"}, {"id": "b", "label": "physical change"}, {"id": "c", "label": "phase change"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A substance that speeds up a reaction without being used up is a:$tl$, $tl$[{"id": "a", "label": "catalyst"}, {"id": "b", "label": "reactant"}, {"id": "c", "label": "product"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Atoms are rearranged in a reaction, but they are never:$tl$, $tl$[{"id": "a", "label": "counted"}, {"id": "b", "label": "named"}, {"id": "c", "label": "created or destroyed"}, {"id": "d", "label": "colored"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Burning (combustion) usually combines a fuel with:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "nitrogen"}, {"id": "c", "label": "helium"}, {"id": "d", "label": "gold"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A balanced chemical equation has equal numbers of each atom on:$tl$, $tl$[{"id": "a", "label": "both sides"}, {"id": "b", "label": "the left only"}, {"id": "c", "label": "the right only"}, {"id": "d", "label": "neither side"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Mixing baking soda and vinegar produces a gas, a sign of a:$tl$, $tl$[{"id": "a", "label": "chemical reaction"}, {"id": "b", "label": "physical change"}, {"id": "c", "label": "phase change"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which is a physical change, not chemical?$tl$, $tl$[{"id": "a", "label": "wood burning"}, {"id": "b", "label": "iron rusting"}, {"id": "c", "label": "baking a cake"}, {"id": "d", "label": "ice melting"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy is often absorbed or released in a:$tl$, $tl$[{"id": "a", "label": "pure mixture"}, {"id": "b", "label": "simple sorting"}, {"id": "c", "label": "physical move"}, {"id": "d", "label": "chemical reaction"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A reaction that releases heat is:$tl$, $tl$[{"id": "a", "label": "endothermic"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "neutral always"}, {"id": "d", "label": "exothermic"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$In a chemical reaction, the substances you start with are the ____. (one word)$tl$, null, $tl$reactants$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A reaction that absorbs heat (feels cold) is:$tl$, $tl$[{"id": "a", "label": "exothermic"}, {"id": "b", "label": "physical"}, {"id": "c", "label": "endothermic"}, {"id": "d", "label": "instant"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Subscripts in a formula like H2O tell the number of:$tl$, $tl$[{"id": "a", "label": "molecules only"}, {"id": "b", "label": "atoms of each element"}, {"id": "c", "label": "reactions"}, {"id": "d", "label": "grams"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Photosynthesis and respiration are both examples of:$tl$, $tl$[{"id": "a", "label": "physical changes"}, {"id": "b", "label": "mixtures"}, {"id": "c", "label": "phase changes"}, {"id": "d", "label": "chemical reactions"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If 10 g reacts with 5 g in a sealed container, the products weigh:$tl$, $tl$[{"id": "a", "label": "5 g"}, {"id": "b", "label": "0 g"}, {"id": "c", "label": "150 g"}, {"id": "d", "label": "15 g"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Atoms & the Periodic Table (MS-PS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$atoms-and-periodic-table$tl$, $tl$Atoms & the Periodic Table$tl$, $tl$Atoms are made of protons, neutrons, and electrons; the periodic table organizes the elements.$tl$, 7, $tl$MS-PS1-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Atoms & the Periodic Table$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Atoms & the Periodic Table", "body": "Atoms are made of protons, neutrons, and electrons; the periodic table organizes the elements."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The smallest unit of an element is an:\n\nThe answer is \"atom\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The center of an atom is the:\n\nThe answer is \"nucleus\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Positively charged particles in the nucleus are:\n\nThe answer is \"protons\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Particles in the nucleus with no charge are:", "choices": [{"id": "a", "label": "protons"}, {"id": "b", "label": "neutrons"}, {"id": "c", "label": "electrons"}, {"id": "d", "label": "photons"}], "answer": "b", "explanation": "Yes! The answer is \"neutrons\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Negatively charged particles outside the nucleus are:", "choices": [{"id": "a", "label": "electrons"}, {"id": "b", "label": "protons"}, {"id": "c", "label": "neutrons"}, {"id": "d", "label": "atoms"}], "answer": "a", "explanation": "Yes! The answer is \"electrons\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The number of protons in an atom is its:", "choices": [{"id": "a", "label": "mass number"}, {"id": "b", "label": "atomic number"}, {"id": "c", "label": "charge"}, {"id": "d", "label": "weight"}], "answer": "b", "explanation": "Yes! The answer is \"atomic number\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Atoms & the Periodic Table! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The smallest unit of an element is an:$tl$, $tl$[{"id": "a", "label": "molecule"}, {"id": "b", "label": "compound"}, {"id": "c", "label": "mixture"}, {"id": "d", "label": "atom"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The center of an atom is the:$tl$, $tl$[{"id": "a", "label": "electron cloud"}, {"id": "b", "label": "shell"}, {"id": "c", "label": "orbit only"}, {"id": "d", "label": "nucleus"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Positively charged particles in the nucleus are:$tl$, $tl$[{"id": "a", "label": "electrons"}, {"id": "b", "label": "neutrons"}, {"id": "c", "label": "protons"}, {"id": "d", "label": "ions"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Particles in the nucleus with no charge are:$tl$, $tl$[{"id": "a", "label": "protons"}, {"id": "b", "label": "electrons"}, {"id": "c", "label": "photons"}, {"id": "d", "label": "neutrons"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Negatively charged particles outside the nucleus are:$tl$, $tl$[{"id": "a", "label": "protons"}, {"id": "b", "label": "electrons"}, {"id": "c", "label": "neutrons"}, {"id": "d", "label": "atoms"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The number of protons in an atom is its:$tl$, $tl$[{"id": "a", "label": "mass number"}, {"id": "b", "label": "atomic number"}, {"id": "c", "label": "charge"}, {"id": "d", "label": "weight"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The periodic table arranges elements by:$tl$, $tl$[{"id": "a", "label": "atomic number"}, {"id": "b", "label": "color"}, {"id": "c", "label": "price"}, {"id": "d", "label": "alphabet"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Vertical columns in the periodic table are called:$tl$, $tl$[{"id": "a", "label": "groups"}, {"id": "b", "label": "periods"}, {"id": "c", "label": "rows only"}, {"id": "d", "label": "cells"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Horizontal rows in the periodic table are called:$tl$, $tl$[{"id": "a", "label": "groups"}, {"id": "b", "label": "columns"}, {"id": "c", "label": "families"}, {"id": "d", "label": "periods"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Elements in the same group often have similar:$tl$, $tl$[{"id": "a", "label": "colors"}, {"id": "b", "label": "prices"}, {"id": "c", "label": "masses exactly"}, {"id": "d", "label": "chemical properties"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Most elements on the left and center of the table are:$tl$, $tl$[{"id": "a", "label": "nonmetals"}, {"id": "b", "label": "metals"}, {"id": "c", "label": "gases only"}, {"id": "d", "label": "liquids only"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A neutral atom has equal numbers of protons and:$tl$, $tl$[{"id": "a", "label": "neutrons"}, {"id": "b", "label": "molecules"}, {"id": "c", "label": "ions"}, {"id": "d", "label": "electrons"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An atom that gains or loses electrons becomes an:$tl$, $tl$[{"id": "a", "label": "isotope"}, {"id": "b", "label": "ion"}, {"id": "c", "label": "element"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Atoms of the same element with different numbers of neutrons are:$tl$, $tl$[{"id": "a", "label": "isotopes"}, {"id": "b", "label": "ions"}, {"id": "c", "label": "molecules"}, {"id": "d", "label": "compounds"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two or more elements chemically combined form a:$tl$, $tl$[{"id": "a", "label": "compound"}, {"id": "b", "label": "mixture"}, {"id": "c", "label": "isotope"}, {"id": "d", "label": "ion"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The positively charged particle in an atom's nucleus is the ____. (one word)$tl$, null, $tl$proton$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The mass number of an atom is the number of protons plus:$tl$, $tl$[{"id": "a", "label": "neutrons"}, {"id": "b", "label": "electrons"}, {"id": "c", "label": "ions"}, {"id": "d", "label": "molecules"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Noble gases (far right) are known for being:$tl$, $tl$[{"id": "a", "label": "highly explosive"}, {"id": "b", "label": "always metals"}, {"id": "c", "label": "very unreactive"}, {"id": "d", "label": "liquids"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An element is a substance made of only one kind of:$tl$, $tl$[{"id": "a", "label": "molecule"}, {"id": "b", "label": "atom"}, {"id": "c", "label": "mixture"}, {"id": "d", "label": "compound"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Most of an atom's volume is taken up by the:$tl$, $tl$[{"id": "a", "label": "nucleus"}, {"id": "b", "label": "protons"}, {"id": "c", "label": "neutrons"}, {"id": "d", "label": "electron cloud (mostly empty space)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Newton's Laws of Motion (MS-PS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$newtons-laws$tl$, $tl$Newton's Laws of Motion$tl$, $tl$Newton's three laws describe inertia, force = mass x acceleration, and action-reaction.$tl$, 7, $tl$MS-PS2-2$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Newton's Laws of Motion$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Newton's Laws of Motion", "body": "Newton's three laws describe inertia, force = mass x acceleration, and action-reaction."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An object stays at rest or in motion unless acted on by a force. This is:\n\nThe answer is \"Newton's first law (inertia)\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The resistance of an object to a change in motion is:\n\nThe answer is \"inertia\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Force equals mass times acceleration is:\n\nThe answer is \"Newton's second law\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "For every action there is an equal and opposite reaction is:", "choices": [{"id": "a", "label": "the first law"}, {"id": "b", "label": "the second law"}, {"id": "c", "label": "Newton's third law"}, {"id": "d", "label": "inertia"}], "answer": "c", "explanation": "Yes! The answer is \"Newton's third law\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "If mass stays the same and force increases, acceleration:", "choices": [{"id": "a", "label": "decreases"}, {"id": "b", "label": "increases"}, {"id": "c", "label": "stays zero"}, {"id": "d", "label": "reverses time"}], "answer": "b", "explanation": "Yes! The answer is \"increases\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A heavier object needs ____ force to reach the same acceleration as a lighter one.", "choices": [{"id": "a", "label": "less"}, {"id": "b", "label": "no"}, {"id": "c", "label": "negative"}, {"id": "d", "label": "more"}], "answer": "d", "explanation": "Yes! The answer is \"more\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Newton's Laws of Motion! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An object stays at rest or in motion unless acted on by a force. This is:$tl$, $tl$[{"id": "a", "label": "Newton's first law (inertia)"}, {"id": "b", "label": "the second law"}, {"id": "c", "label": "the third law"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The resistance of an object to a change in motion is:$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "acceleration"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "inertia"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Force equals mass times acceleration is:$tl$, $tl$[{"id": "a", "label": "the first law"}, {"id": "b", "label": "the third law"}, {"id": "c", "label": "Newton's second law"}, {"id": "d", "label": "conservation"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$For every action there is an equal and opposite reaction is:$tl$, $tl$[{"id": "a", "label": "the first law"}, {"id": "b", "label": "the second law"}, {"id": "c", "label": "Newton's third law"}, {"id": "d", "label": "inertia"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If mass stays the same and force increases, acceleration:$tl$, $tl$[{"id": "a", "label": "decreases"}, {"id": "b", "label": "increases"}, {"id": "c", "label": "stays zero"}, {"id": "d", "label": "reverses time"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A heavier object needs ____ force to reach the same acceleration as a lighter one.$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "no"}, {"id": "c", "label": "negative"}, {"id": "d", "label": "more"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A rocket pushes gas down and is pushed up - an example of the:$tl$, $tl$[{"id": "a", "label": "first law"}, {"id": "b", "label": "second law"}, {"id": "c", "label": "law of gravity"}, {"id": "d", "label": "third law"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A seatbelt protects you in a crash because of your body's:$tl$, $tl$[{"id": "a", "label": "acceleration"}, {"id": "b", "label": "mass only"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "inertia"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Unbalanced forces cause an object to:$tl$, $tl$[{"id": "a", "label": "stay still always"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "accelerate (change motion)"}, {"id": "d", "label": "reverse time"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In F = ma, if force is 20 N and mass is 4 kg, acceleration is:$tl$, $tl$[{"id": "a", "label": "80 m/s^2"}, {"id": "b", "label": "16 m/s^2"}, {"id": "c", "label": "5 m/s^2"}, {"id": "d", "label": "24 m/s^2"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Friction is a force that:$tl$, $tl$[{"id": "a", "label": "always speeds things up"}, {"id": "b", "label": "opposes motion"}, {"id": "c", "label": "creates mass"}, {"id": "d", "label": "is gravity"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When you push a wall, the wall pushes back on you with:$tl$, $tl$[{"id": "a", "label": "equal and opposite force"}, {"id": "b", "label": "no force"}, {"id": "c", "label": "double force"}, {"id": "d", "label": "half force"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An object moving at constant velocity has a net force of:$tl$, $tl$[{"id": "a", "label": "zero"}, {"id": "b", "label": "increasing"}, {"id": "c", "label": "huge"}, {"id": "d", "label": "negative"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Acceleration is a change in:$tl$, $tl$[{"id": "a", "label": "velocity over time"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "color"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The same force on a lighter cart vs a heavier cart gives the lighter cart:$tl$, $tl$[{"id": "a", "label": "greater acceleration"}, {"id": "b", "label": "less acceleration"}, {"id": "c", "label": "no motion"}, {"id": "d", "label": "more mass"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Force = mass x ____ (Newton's second law). (one word)$tl$, null, $tl$acceleration$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Inertia depends on an object's:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "speed only"}, {"id": "c", "label": "temperature"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Swimmers push water backward to move forward - this shows the:$tl$, $tl$[{"id": "a", "label": "first law"}, {"id": "b", "label": "third law"}, {"id": "c", "label": "second law"}, {"id": "d", "label": "law of gravity"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If no net force acts on a moving object, it will:$tl$, $tl$[{"id": "a", "label": "keep moving at constant velocity"}, {"id": "b", "label": "stop instantly"}, {"id": "c", "label": "speed up"}, {"id": "d", "label": "reverse"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The unit of force is the:$tl$, $tl$[{"id": "a", "label": "gram"}, {"id": "b", "label": "meter"}, {"id": "c", "label": "newton (N)"}, {"id": "d", "label": "second"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$newtons-laws$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Energy & Heat (MS-PS3-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$energy-and-heat$tl$, $tl$Energy & Heat$tl$, $tl$Energy changes form and is conserved; heat moves by conduction, convection, and radiation.$tl$, 7, $tl$MS-PS3-3$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Energy & Heat$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Energy & Heat", "body": "Energy changes form and is conserved; heat moves by conduction, convection, and radiation."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Heat naturally flows from ____ objects to colder ones.\n\nThe answer is \"hotter\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Thermal energy is related to the motion of an object's:\n\nThe answer is \"particles\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Heat transfer through direct contact is:\n\nThe answer is \"conduction\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Heat transfer by moving fluids (liquids/gases) is:", "choices": [{"id": "a", "label": "conduction"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "reflection"}], "answer": "c", "explanation": "Yes! The answer is \"convection\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Heat transfer by waves through space is:", "choices": [{"id": "a", "label": "conduction"}, {"id": "b", "label": "convection"}, {"id": "c", "label": "friction"}, {"id": "d", "label": "radiation"}], "answer": "d", "explanation": "Yes! The answer is \"radiation\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A material that slows heat transfer is an:", "choices": [{"id": "a", "label": "conductor"}, {"id": "b", "label": "catalyst"}, {"id": "c", "label": "insulator"}, {"id": "d", "label": "ion"}], "answer": "c", "explanation": "Yes! The answer is \"insulator\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Energy & Heat! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Heat naturally flows from ____ objects to colder ones.$tl$, $tl$[{"id": "a", "label": "colder"}, {"id": "b", "label": "hotter"}, {"id": "c", "label": "the same"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Thermal energy is related to the motion of an object's:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "price"}, {"id": "c", "label": "shape"}, {"id": "d", "label": "particles"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Heat transfer through direct contact is:$tl$, $tl$[{"id": "a", "label": "convection"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "insulation"}, {"id": "d", "label": "conduction"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Heat transfer by moving fluids (liquids/gases) is:$tl$, $tl$[{"id": "a", "label": "conduction"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Heat transfer by waves through space is:$tl$, $tl$[{"id": "a", "label": "conduction"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "friction"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A material that slows heat transfer is an:$tl$, $tl$[{"id": "a", "label": "conductor"}, {"id": "b", "label": "catalyst"}, {"id": "c", "label": "insulator"}, {"id": "d", "label": "ion"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Metals are usually good ____ of heat.$tl$, $tl$[{"id": "a", "label": "conductors"}, {"id": "b", "label": "insulators"}, {"id": "c", "label": "gases"}, {"id": "d", "label": "mixtures"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Temperature measures the average ____ energy of particles.$tl$, $tl$[{"id": "a", "label": "kinetic"}, {"id": "b", "label": "potential only"}, {"id": "c", "label": "chemical"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Adding heat to a substance generally makes its particles move:$tl$, $tl$[{"id": "a", "label": "slower"}, {"id": "b", "label": "not at all"}, {"id": "c", "label": "backward"}, {"id": "d", "label": "faster"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Energy is conserved, meaning it can change form but is never:$tl$, $tl$[{"id": "a", "label": "transferred"}, {"id": "b", "label": "created or destroyed"}, {"id": "c", "label": "stored"}, {"id": "d", "label": "moved"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A pot of water heating with rising and sinking currents shows:$tl$, $tl$[{"id": "a", "label": "radiation only"}, {"id": "b", "label": "conduction only"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "insulation"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Feeling the Sun's warmth on your skin is an example of:$tl$, $tl$[{"id": "a", "label": "conduction"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "friction"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Potential energy is energy that is:$tl$, $tl$[{"id": "a", "label": "stored"}, {"id": "b", "label": "moving"}, {"id": "c", "label": "lost"}, {"id": "d", "label": "heat only"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Kinetic energy is energy of:$tl$, $tl$[{"id": "a", "label": "position"}, {"id": "b", "label": "color"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "motion"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A thermos keeps drinks hot or cold by reducing:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "heat transfer"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Heat transfer through direct contact between objects is ____. (one word)$tl$, null, $tl$conduction$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When two objects of different temperatures touch, heat flows until they:$tl$, $tl$[{"id": "a", "label": "explode"}, {"id": "b", "label": "freeze"}, {"id": "c", "label": "reach the same temperature"}, {"id": "d", "label": "gain mass"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A roller coaster car has the most potential energy at the:$tl$, $tl$[{"id": "a", "label": "top of the hill"}, {"id": "b", "label": "bottom"}, {"id": "c", "label": "middle going fast"}, {"id": "d", "label": "start of the brakes"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Rubbing hands together turns motion into:$tl$, $tl$[{"id": "a", "label": "light"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "heat (thermal energy)"}, {"id": "d", "label": "sound only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The total energy in a closed system:$tl$, $tl$[{"id": "a", "label": "stays the same"}, {"id": "b", "label": "always increases"}, {"id": "c", "label": "always decreases"}, {"id": "d", "label": "becomes zero"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-and-heat$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Waves (MS-PS4-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$waves$tl$, $tl$Waves$tl$, $tl$Waves carry energy; amplitude, wavelength, and frequency describe them.$tl$, 7, $tl$MS-PS4-1$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Waves$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Waves", "body": "Waves carry energy; amplitude, wavelength, and frequency describe them."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A wave transfers ____ from one place to another.\n\nThe answer is \"energy\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The height of a wave from rest to crest is its:\n\nThe answer is \"amplitude\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The distance between two crests is the:\n\nThe answer is \"wavelength\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The number of waves passing a point per second is the:", "choices": [{"id": "a", "label": "frequency"}, {"id": "b", "label": "amplitude"}, {"id": "c", "label": "wavelength"}, {"id": "d", "label": "speed"}], "answer": "a", "explanation": "Yes! The answer is \"frequency\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Sound waves need a ____ to travel.", "choices": [{"id": "a", "label": "medium (like air)"}, {"id": "b", "label": "vacuum"}, {"id": "c", "label": "shadow"}, {"id": "d", "label": "magnet"}], "answer": "a", "explanation": "Yes! The answer is \"medium (like air)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Light waves can travel through:", "choices": [{"id": "a", "label": "only water"}, {"id": "b", "label": "only metal"}, {"id": "c", "label": "empty space (a vacuum)"}, {"id": "d", "label": "only air"}], "answer": "c", "explanation": "Yes! The answer is \"empty space (a vacuum)\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Waves! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A wave transfers ____ from one place to another.$tl$, $tl$[{"id": "a", "label": "matter permanently"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "energy"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The height of a wave from rest to crest is its:$tl$, $tl$[{"id": "a", "label": "wavelength"}, {"id": "b", "label": "amplitude"}, {"id": "c", "label": "frequency"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The distance between two crests is the:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "frequency"}, {"id": "c", "label": "wavelength"}, {"id": "d", "label": "period"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The number of waves passing a point per second is the:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "wavelength"}, {"id": "c", "label": "speed"}, {"id": "d", "label": "frequency"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Sound waves need a ____ to travel.$tl$, $tl$[{"id": "a", "label": "medium (like air)"}, {"id": "b", "label": "vacuum"}, {"id": "c", "label": "shadow"}, {"id": "d", "label": "magnet"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Light waves can travel through:$tl$, $tl$[{"id": "a", "label": "only water"}, {"id": "b", "label": "only metal"}, {"id": "c", "label": "empty space (a vacuum)"}, {"id": "d", "label": "only air"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Higher frequency sound has a higher:$tl$, $tl$[{"id": "a", "label": "volume only"}, {"id": "b", "label": "pitch"}, {"id": "c", "label": "speed only"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Larger amplitude usually means a ____ sound.$tl$, $tl$[{"id": "a", "label": "quieter"}, {"id": "b", "label": "higher-pitch"}, {"id": "c", "label": "faster"}, {"id": "d", "label": "louder"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In a transverse wave, particles move ____ to the wave's direction.$tl$, $tl$[{"id": "a", "label": "parallel"}, {"id": "b", "label": "in circles only"}, {"id": "c", "label": "perpendicular (up and down)"}, {"id": "d", "label": "not at all"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$In a longitudinal wave, particles move ____ to the wave's direction.$tl$, $tl$[{"id": "a", "label": "perpendicular"}, {"id": "b", "label": "parallel (back and forth)"}, {"id": "c", "label": "in circles"}, {"id": "d", "label": "not at all"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When a wave bounces off a surface, it is:$tl$, $tl$[{"id": "a", "label": "reflected"}, {"id": "b", "label": "refracted"}, {"id": "c", "label": "absorbed"}, {"id": "d", "label": "created"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When a wave bends passing into a new material, it is:$tl$, $tl$[{"id": "a", "label": "reflected"}, {"id": "b", "label": "absorbed"}, {"id": "c", "label": "amplified"}, {"id": "d", "label": "refracted"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An echo is caused by sound being:$tl$, $tl$[{"id": "a", "label": "refracted"}, {"id": "b", "label": "created"}, {"id": "c", "label": "reflected"}, {"id": "d", "label": "absorbed fully"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Light travels ____ than sound.$tl$, $tl$[{"id": "a", "label": "slower"}, {"id": "b", "label": "at the same speed"}, {"id": "c", "label": "backward"}, {"id": "d", "label": "much faster"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Visible light is part of the ____ spectrum.$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "seismic"}, {"id": "c", "label": "water"}, {"id": "d", "label": "electromagnetic"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The distance between two crests of a wave is its ____. (one word)$tl$, null, $tl$wavelength$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$We can use patterns in waves to:$tl$, $tl$[{"id": "a", "label": "create matter"}, {"id": "b", "label": "stop time"}, {"id": "c", "label": "send and store information"}, {"id": "d", "label": "make gravity"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Ocean waves and a slinky pushed back and forth are both:$tl$, $tl$[{"id": "a", "label": "matter being created"}, {"id": "b", "label": "light only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "ways energy travels as waves"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Radio, microwaves, and X-rays are all types of:$tl$, $tl$[{"id": "a", "label": "sound waves"}, {"id": "b", "label": "water waves"}, {"id": "c", "label": "electromagnetic waves"}, {"id": "d", "label": "seismic waves"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If frequency goes up while speed stays the same, wavelength goes:$tl$, $tl$[{"id": "a", "label": "down"}, {"id": "b", "label": "up"}, {"id": "c", "label": "to zero"}, {"id": "d", "label": "negative"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Human Impact on Earth (MS-ESS3-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$human-impact$tl$, $tl$Human Impact on Earth$tl$, $tl$Human activities affect Earth's systems; conservation and clean energy reduce harm.$tl$, 7, $tl$MS-ESS3-3$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Human Impact on Earth$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Human Impact on Earth", "body": "Human activities affect Earth's systems; conservation and clean energy reduce harm."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Burning fossil fuels increases carbon dioxide, contributing to:\n\nThe answer is \"climate change\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Cutting down forests for land is called:\n\nThe answer is \"deforestation\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A way to reduce waste is to reduce, reuse, and:\n\nThe answer is \"recycle\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Renewable resources include solar, wind, and:", "choices": [{"id": "a", "label": "coal"}, {"id": "b", "label": "oil"}, {"id": "c", "label": "natural gas"}, {"id": "d", "label": "hydropower"}], "answer": "d", "explanation": "Yes! The answer is \"hydropower\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Pollution that runs off into rivers and oceans harms:", "choices": [{"id": "a", "label": "only the air"}, {"id": "b", "label": "aquatic life"}, {"id": "c", "label": "only rocks"}, {"id": "d", "label": "nothing"}], "answer": "b", "explanation": "Yes! The answer is \"aquatic life\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Protecting many species and ecosystems preserves:", "choices": [{"id": "a", "label": "pollution"}, {"id": "b", "label": "traffic"}, {"id": "c", "label": "biodiversity"}, {"id": "d", "label": "erosion"}], "answer": "c", "explanation": "Yes! The answer is \"biodiversity\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Human Impact on Earth! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Burning fossil fuels increases carbon dioxide, contributing to:$tl$, $tl$[{"id": "a", "label": "climate change"}, {"id": "b", "label": "cooler oceans"}, {"id": "c", "label": "more forests"}, {"id": "d", "label": "cleaner air"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Cutting down forests for land is called:$tl$, $tl$[{"id": "a", "label": "reforestation"}, {"id": "b", "label": "deforestation"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "recycling"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A way to reduce waste is to reduce, reuse, and:$tl$, $tl$[{"id": "a", "label": "recycle"}, {"id": "b", "label": "remove"}, {"id": "c", "label": "ruin"}, {"id": "d", "label": "rush"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Renewable resources include solar, wind, and:$tl$, $tl$[{"id": "a", "label": "coal"}, {"id": "b", "label": "oil"}, {"id": "c", "label": "natural gas"}, {"id": "d", "label": "hydropower"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Pollution that runs off into rivers and oceans harms:$tl$, $tl$[{"id": "a", "label": "only the air"}, {"id": "b", "label": "aquatic life"}, {"id": "c", "label": "only rocks"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Protecting many species and ecosystems preserves:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "biodiversity"}, {"id": "c", "label": "traffic"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Overfishing can cause fish populations to:$tl$, $tl$[{"id": "a", "label": "increase"}, {"id": "b", "label": "become plants"}, {"id": "c", "label": "make oxygen"}, {"id": "d", "label": "collapse / decline"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The greenhouse effect traps heat using gases like:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "carbon dioxide and methane"}, {"id": "c", "label": "nitrogen only"}, {"id": "d", "label": "helium"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Switching to electric vehicles and renewables helps reduce:$tl$, $tl$[{"id": "a", "label": "clean water"}, {"id": "b", "label": "forests"}, {"id": "c", "label": "greenhouse gas emissions"}, {"id": "d", "label": "oxygen"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Habitat destruction is a leading cause of species:$tl$, $tl$[{"id": "a", "label": "creation"}, {"id": "b", "label": "extinction"}, {"id": "c", "label": "migration only"}, {"id": "d", "label": "photosynthesis"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Plastic in the ocean is harmful because it:$tl$, $tl$[{"id": "a", "label": "feeds fish"}, {"id": "b", "label": "cleans water"}, {"id": "c", "label": "makes oxygen"}, {"id": "d", "label": "does not break down quickly and harms wildlife"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Conserving water and energy at home helps protect:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "natural resources"}, {"id": "c", "label": "landfills' growth"}, {"id": "d", "label": "traffic"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Planting trees can help by absorbing:$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "oxygen"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "metal"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Nonrenewable resources like oil and coal:$tl$, $tl$[{"id": "a", "label": "can run out"}, {"id": "b", "label": "never run out"}, {"id": "c", "label": "grow back fast"}, {"id": "d", "label": "are unlimited"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Acid rain is caused mainly by pollution from:$tl$, $tl$[{"id": "a", "label": "planting trees"}, {"id": "b", "label": "recycling"}, {"id": "c", "label": "solar panels"}, {"id": "d", "label": "burning fossil fuels"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Using resources in a way that does not run them out is called being ____. (one word)$tl$, null, $tl$sustainable$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Restoring a damaged ecosystem is called:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "deforestation"}, {"id": "c", "label": "restoration / reforestation"}, {"id": "d", "label": "extinction"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which human action most helps reduce air pollution?$tl$, $tl$[{"id": "a", "label": "idling cars"}, {"id": "b", "label": "using public transit or biking"}, {"id": "c", "label": "burning trash"}, {"id": "d", "label": "clearing forests"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Monitoring data over time helps scientists:$tl$, $tl$[{"id": "a", "label": "ignore problems"}, {"id": "b", "label": "stop the seasons"}, {"id": "c", "label": "track human impact and plan solutions"}, {"id": "d", "label": "create matter"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Conservation means using resources:$tl$, $tl$[{"id": "a", "label": "as fast as possible"}, {"id": "b", "label": "never at all"}, {"id": "c", "label": "only once"}, {"id": "d", "label": "wisely so they last"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Central Idea & Analysis (RI.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$central-idea$tl$, $tl$Central Idea & Analysis$tl$, $tl$Determine a central idea and analyze how details develop it over the text.$tl$, 7, $tl$RI.7.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Central Idea & Analysis$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Central Idea & Analysis", "body": "Determine a central idea and analyze how details develop it over the text."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The central idea of a text is the:\n\nThe answer is \"most important overall point\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Supporting details function to:\n\nThe answer is \"develop and explain the central idea\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text may develop its central idea over:\n\nThe answer is \"the whole passage\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Renewable energy is growing because it is cleaner, increasingly cheaper, and more reliable than before.\" The central idea is that renewable energy is:", "choices": [{"id": "a", "label": "expensive"}, {"id": "b", "label": "becoming more practical and appealing"}, {"id": "c", "label": "useless"}, {"id": "d", "label": "disappearing"}], "answer": "b", "explanation": "Yes! The answer is \"becoming more practical and appealing\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To determine a central idea, a strong reader looks for the point that:", "choices": [{"id": "a", "label": "the details all support"}, {"id": "b", "label": "appears only once"}, {"id": "c", "label": "is in the title"}, {"id": "d", "label": "is the shortest"}], "answer": "a", "explanation": "Yes! The answer is \"the details all support\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An objective summary of a central idea avoids the reader's:", "choices": [{"id": "a", "label": "main point"}, {"id": "b", "label": "key details"}, {"id": "c", "label": "personal opinions"}, {"id": "d", "label": "topic"}], "answer": "c", "explanation": "Yes! The answer is \"personal opinions\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Central Idea & Analysis! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The central idea of a text is the:$tl$, $tl$[{"id": "a", "label": "most important overall point"}, {"id": "b", "label": "first sentence"}, {"id": "c", "label": "longest word"}, {"id": "d", "label": "author's name"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Supporting details function to:$tl$, $tl$[{"id": "a", "label": "change the topic"}, {"id": "b", "label": "develop and explain the central idea"}, {"id": "c", "label": "end the text"}, {"id": "d", "label": "list sources"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text may develop its central idea over:$tl$, $tl$[{"id": "a", "label": "a single word"}, {"id": "b", "label": "the title only"}, {"id": "c", "label": "the whole passage"}, {"id": "d", "label": "the page number"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Renewable energy is growing because it is cleaner, increasingly cheaper, and more reliable than before." The central idea is that renewable energy is:$tl$, $tl$[{"id": "a", "label": "becoming more practical and appealing"}, {"id": "b", "label": "expensive"}, {"id": "c", "label": "useless"}, {"id": "d", "label": "disappearing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$To determine a central idea, a strong reader looks for the point that:$tl$, $tl$[{"id": "a", "label": "appears only once"}, {"id": "b", "label": "is in the title"}, {"id": "c", "label": "is the shortest"}, {"id": "d", "label": "the details all support"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An objective summary of a central idea avoids the reader's:$tl$, $tl$[{"id": "a", "label": "main point"}, {"id": "b", "label": "key details"}, {"id": "c", "label": "personal opinions"}, {"id": "d", "label": "topic"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two paragraphs explaining different benefits of sleep together build the:$tl$, $tl$[{"id": "a", "label": "plot"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "central idea"}, {"id": "d", "label": "rhyme scheme"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Although social media connects people, it can also spread misinformation quickly." The central idea is that social media:$tl$, $tl$[{"id": "a", "label": "is only good"}, {"id": "b", "label": "is only bad"}, {"id": "c", "label": "has both benefits and drawbacks"}, {"id": "d", "label": "is unimportant"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A detail that does not relate to the main point is:$tl$, $tl$[{"id": "a", "label": "essential"}, {"id": "b", "label": "central"}, {"id": "c", "label": "irrelevant"}, {"id": "d", "label": "the thesis"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The central idea of an argument is usually the author's main:$tl$, $tl$[{"id": "a", "label": "claim"}, {"id": "b", "label": "counterexample"}, {"id": "c", "label": "footnote"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Coral reefs support fisheries, protect coasts, and may yield medicines, but warming seas threaten them." The central idea is that reefs are:$tl$, $tl$[{"id": "a", "label": "valuable yet endangered"}, {"id": "b", "label": "worthless"}, {"id": "c", "label": "new"}, {"id": "d", "label": "dry"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Headings and topic sentences often signal the:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "central idea of a section"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A well-developed central idea is supported by:$tl$, $tl$[{"id": "a", "label": "one word"}, {"id": "b", "label": "evidence and examples"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "the cover"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Identifying the central idea helps a reader grasp the text's:$tl$, $tl$[{"id": "a", "label": "word count"}, {"id": "b", "label": "binding"}, {"id": "c", "label": "font"}, {"id": "d", "label": "overall purpose"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If you removed the supporting details, the central idea would be:$tl$, $tl$[{"id": "a", "label": "clearer always"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "harder to prove or understand fully"}, {"id": "d", "label": "unchanged in proof"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The most important overall point of a text is its ____ idea. (one word)$tl$, null, $tl$central$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A central idea differs from a theme because central idea is common in:$tl$, $tl$[{"id": "a", "label": "informational texts"}, {"id": "b", "label": "only poems"}, {"id": "c", "label": "only the title"}, {"id": "d", "label": "only fiction"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Volunteers restored the wetland, replanting native grasses and removing trash." The central idea is that volunteers:$tl$, $tl$[{"id": "a", "label": "worked to restore the ecosystem"}, {"id": "b", "label": "went on vacation"}, {"id": "c", "label": "caused harm"}, {"id": "d", "label": "ignored it"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Determining how a central idea is conveyed means tracing it through the text's:$tl$, $tl$[{"id": "a", "label": "details and structure"}, {"id": "b", "label": "fonts"}, {"id": "c", "label": "page numbers"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which best states a central idea?$tl$, $tl$[{"id": "a", "label": "Bees have wings."}, {"id": "b", "label": "Pollinators are essential to global food production."}, {"id": "c", "label": "It was warm out."}, {"id": "d", "label": "Flowers can be yellow."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Theme Development (RL.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$theme-development$tl$, $tl$Theme Development$tl$, $tl$Trace how a theme develops through the plot and characters' choices.$tl$, 7, $tl$RL.7.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Theme Development$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Theme Development", "body": "Trace how a theme develops through the plot and characters' choices."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A theme is a story's:\n\nThe answer is \"central message about life\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Authors develop theme through plot events and:\n\nThe answer is \"character choices\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Theme differs from topic because theme is a:\n\nThe answer is \"complete idea or insight\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Though warned, the crew ignored the storm signs and lost their ship.\" A theme is:", "choices": [{"id": "a", "label": "ignoring wisdom has consequences"}, {"id": "b", "label": "storms are fun"}, {"id": "c", "label": "ships are old"}, {"id": "d", "label": "sailing is easy"}], "answer": "a", "explanation": "Yes! The answer is \"ignoring wisdom has consequences\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A recurring symbol in a story often reinforces the:", "choices": [{"id": "a", "label": "index"}, {"id": "b", "label": "glossary"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "page count"}], "answer": "c", "explanation": "Yes! The answer is \"theme\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To trace theme development, note how it appears:", "choices": [{"id": "a", "label": "only at the start"}, {"id": "b", "label": "across the whole text"}, {"id": "c", "label": "in the title only"}, {"id": "d", "label": "never"}], "answer": "b", "explanation": "Yes! The answer is \"across the whole text\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Theme Development! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A theme is a story's:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "narrator"}, {"id": "c", "label": "central message about life"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Authors develop theme through plot events and:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "character choices"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Theme differs from topic because theme is a:$tl$, $tl$[{"id": "a", "label": "complete idea or insight"}, {"id": "b", "label": "single noun"}, {"id": "c", "label": "place"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Though warned, the crew ignored the storm signs and lost their ship." A theme is:$tl$, $tl$[{"id": "a", "label": "ignoring wisdom has consequences"}, {"id": "b", "label": "storms are fun"}, {"id": "c", "label": "ships are old"}, {"id": "d", "label": "sailing is easy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A recurring symbol in a story often reinforces the:$tl$, $tl$[{"id": "a", "label": "index"}, {"id": "b", "label": "glossary"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "page count"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$To trace theme development, note how it appears:$tl$, $tl$[{"id": "a", "label": "only at the start"}, {"id": "b", "label": "across the whole text"}, {"id": "c", "label": "in the title only"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "After betraying a friend, the boy spent years rebuilding that trust." A theme is:$tl$, $tl$[{"id": "a", "label": "betrayal pays off"}, {"id": "b", "label": "friends are useless"}, {"id": "c", "label": "time stops"}, {"id": "d", "label": "trust, once broken, is hard to restore"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A theme is best stated as a:$tl$, $tl$[{"id": "a", "label": "single word"}, {"id": "b", "label": "question"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "sentence about life or human nature"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two stories can share a theme such as:$tl$, $tl$[{"id": "a", "label": "the same plot"}, {"id": "b", "label": "perseverance overcomes hardship"}, {"id": "c", "label": "the same author"}, {"id": "d", "label": "the same length"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$As a story progresses, a theme usually becomes:$tl$, $tl$[{"id": "a", "label": "less important"}, {"id": "b", "label": "random"}, {"id": "c", "label": "clearer through events"}, {"id": "d", "label": "the title"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "She chose honesty though lying was easier, and respected herself." The theme concerns:$tl$, $tl$[{"id": "a", "label": "winning at all costs"}, {"id": "b", "label": "fear"}, {"id": "c", "label": "integrity"}, {"id": "d", "label": "luck"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A character who changes often reveals the story's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "cover"}, {"id": "d", "label": "theme"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A theme applies:$tl$, $tl$[{"id": "a", "label": "only to one chapter"}, {"id": "b", "label": "beyond the single story to life"}, {"id": "c", "label": "to the cover"}, {"id": "d", "label": "to nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "The rivals discovered they achieved more together than apart." The theme is:$tl$, $tl$[{"id": "a", "label": "cooperation / unity"}, {"id": "b", "label": "rivalry is best"}, {"id": "c", "label": "work alone"}, {"id": "d", "label": "quit early"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which is a theme, not a topic?$tl$, $tl$[{"id": "a", "label": "a king"}, {"id": "b", "label": "a castle"}, {"id": "c", "label": "war"}, {"id": "d", "label": "Power can corrupt even good people."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The deeper message or lesson of a story is its ____. (one word)$tl$, null, $tl$theme$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Conflicts in a story often help develop its:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "setting only"}, {"id": "c", "label": "font"}, {"id": "d", "label": "theme"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Despite repeated failures, the inventor refused to quit and finally succeeded." The theme is:$tl$, $tl$[{"id": "a", "label": "luck"}, {"id": "b", "label": "laziness"}, {"id": "c", "label": "fear"}, {"id": "d", "label": "perseverance"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A strong theme statement is a:$tl$, $tl$[{"id": "a", "label": "plot summary"}, {"id": "b", "label": "the title"}, {"id": "c", "label": "general truth shown by the story"}, {"id": "d", "label": "a character's name"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Tracking how characters respond to events helps you identify:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "the publisher"}, {"id": "d", "label": "the font"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Objective Summary (RI.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$summarizing$tl$, $tl$Objective Summary$tl$, $tl$Summarize a text's central idea and key points objectively, without opinion.$tl$, 7, $tl$RI.7.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Objective Summary$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Objective Summary", "body": "Summarize a text's central idea and key points objectively, without opinion."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An objective summary should remain:\n\nThe answer is \"neutral and factual\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A summary is ____ than the original.\n\nThe answer is \"shorter\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A good summary captures the central idea and the:\n\nThe answer is \"most important details\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Summaries should be written in:", "choices": [{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "code"}, {"id": "c", "label": "your own words"}, {"id": "d", "label": "emojis"}], "answer": "c", "explanation": "Yes! The answer is \"your own words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "What should be LEFT OUT of an objective summary?", "choices": [{"id": "a", "label": "the main idea"}, {"id": "b", "label": "key points"}, {"id": "c", "label": "your personal reaction"}, {"id": "d", "label": "the topic"}], "answer": "c", "explanation": "Yes! The answer is \"your personal reaction\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Narrative summaries keep events in:", "choices": [{"id": "a", "label": "logical order"}, {"id": "b", "label": "random order"}, {"id": "c", "label": "reverse only"}, {"id": "d", "label": "no order"}], "answer": "a", "explanation": "Yes! The answer is \"logical order\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Objective Summary! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An objective summary should remain:$tl$, $tl$[{"id": "a", "label": "opinionated"}, {"id": "b", "label": "neutral and factual"}, {"id": "c", "label": "exaggerated"}, {"id": "d", "label": "fictional"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A summary is ____ than the original.$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "shorter"}, {"id": "c", "label": "equal"}, {"id": "d", "label": "just the title"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A good summary captures the central idea and the:$tl$, $tl$[{"id": "a", "label": "all minor details"}, {"id": "b", "label": "author's opinion of you"}, {"id": "c", "label": "most important details"}, {"id": "d", "label": "page color"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Summaries should be written in:$tl$, $tl$[{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "code"}, {"id": "c", "label": "your own words"}, {"id": "d", "label": "emojis"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$What should be LEFT OUT of an objective summary?$tl$, $tl$[{"id": "a", "label": "the main idea"}, {"id": "b", "label": "key points"}, {"id": "c", "label": "the topic"}, {"id": "d", "label": "your personal reaction"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Narrative summaries keep events in:$tl$, $tl$[{"id": "a", "label": "logical order"}, {"id": "b", "label": "random order"}, {"id": "c", "label": "reverse only"}, {"id": "d", "label": "no order"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Summarizing an argument means including the author's:$tl$, $tl$[{"id": "a", "label": "favorite color"}, {"id": "b", "label": "claim and key reasons"}, {"id": "c", "label": "birthday"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An effective one-sentence summary states the text's:$tl$, $tl$[{"id": "a", "label": "smallest detail"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "author bio"}, {"id": "d", "label": "central idea"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Inserting 'I disagree' into a summary makes it:$tl$, $tl$[{"id": "a", "label": "stronger"}, {"id": "b", "label": "required"}, {"id": "c", "label": "no longer objective"}, {"id": "d", "label": "shorter"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$To condense a passage, you should:$tl$, $tl$[{"id": "a", "label": "combine ideas and cut minor details"}, {"id": "b", "label": "repeat sentences"}, {"id": "c", "label": "add examples"}, {"id": "d", "label": "copy it"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which is the best summary of a story where a stranded hiker uses wits to survive and is rescued?$tl$, $tl$[{"id": "a", "label": "Hiking is fun."}, {"id": "b", "label": "The hiker was tall."}, {"id": "c", "label": "A stranded hiker survived by thinking clearly until rescue arrived."}, {"id": "d", "label": "Mountains are tall."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A summary and the original should share the same:$tl$, $tl$[{"id": "a", "label": "central idea"}, {"id": "b", "label": "wording"}, {"id": "c", "label": "length"}, {"id": "d", "label": "page count"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Quoting every detail makes a summary:$tl$, $tl$[{"id": "a", "label": "objective"}, {"id": "b", "label": "perfect"}, {"id": "c", "label": "too long and not concise"}, {"id": "d", "label": "short"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Before summarizing, a careful reader:$tl$, $tl$[{"id": "a", "label": "picks a font"}, {"id": "b", "label": "counts pages"}, {"id": "c", "label": "skips the text"}, {"id": "d", "label": "identifies the main points"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A summary of a news report focuses on:$tl$, $tl$[{"id": "a", "label": "the reporter's looks"}, {"id": "b", "label": "ads"}, {"id": "c", "label": "page color"}, {"id": "d", "label": "the key facts and events"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A brief, neutral retelling of a text's key points is a ____. (one word)$tl$, null, $tl$summary$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A paraphrase differs from a summary because it:$tl$, $tl$[{"id": "a", "label": "is much shorter"}, {"id": "b", "label": "adds opinion"}, {"id": "c", "label": "restates a part at similar length"}, {"id": "d", "label": "is the title"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Good summaries focus on ideas that are:$tl$, $tl$[{"id": "a", "label": "trivial"}, {"id": "b", "label": "longest"}, {"id": "c", "label": "colorful"}, {"id": "d", "label": "central, not trivial"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An objective summary answers mainly:$tl$, $tl$[{"id": "a", "label": "how you felt"}, {"id": "b", "label": "the price"}, {"id": "c", "label": "the publisher"}, {"id": "d", "label": "what happened and why it matters"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Rereading before summarizing helps ensure you captured the:$tl$, $tl$[{"id": "a", "label": "longest words"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "most important ideas"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Textual Evidence & Inference (RI.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$textual-evidence$tl$, $tl$Textual Evidence & Inference$tl$, $tl$Cite specific evidence to support both explicit answers and inferences.$tl$, 7, $tl$RI.7.1$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Textual Evidence & Inference$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Textual Evidence & Inference", "body": "Cite specific evidence to support both explicit answers and inferences."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Textual evidence is information taken ____ from the text.\n\nThe answer is \"directly\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  To support an inference, you must cite:\n\nThe answer is \"evidence from the text\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Strong evidence is both relevant and:\n\nThe answer is \"accurate (truly in the text)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Quotation marks indicate words that are the:", "choices": [{"id": "a", "label": "your words"}, {"id": "b", "label": "a summary"}, {"id": "c", "label": "author's exact words"}, {"id": "d", "label": "a title"}], "answer": "c", "explanation": "Yes! The answer is \"author's exact words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which best supports the claim 'the character felt anxious'?", "choices": [{"id": "a", "label": "The book is long."}, {"id": "b", "label": "It was Friday."}, {"id": "c", "label": "'Her hands trembled and her voice shook.'"}, {"id": "d", "label": "The cover is red."}], "answer": "c", "explanation": "Yes! The answer is \"'Her hands trembled and her voice shook.'\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When asked 'how do you know?', a strong reader:", "choices": [{"id": "a", "label": "guesses"}, {"id": "b", "label": "ignores the text"}, {"id": "c", "label": "points to text evidence"}, {"id": "d", "label": "changes topic"}], "answer": "c", "explanation": "Yes! The answer is \"points to text evidence\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Textual Evidence & Inference! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Textual evidence is information taken ____ from the text.$tl$, $tl$[{"id": "a", "label": "from memory"}, {"id": "b", "label": "from a friend"}, {"id": "c", "label": "directly"}, {"id": "d", "label": "from the cover"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$To support an inference, you must cite:$tl$, $tl$[{"id": "a", "label": "a guess"}, {"id": "b", "label": "the title only"}, {"id": "c", "label": "nothing"}, {"id": "d", "label": "evidence from the text"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Strong evidence is both relevant and:$tl$, $tl$[{"id": "a", "label": "invented"}, {"id": "b", "label": "off-topic"}, {"id": "c", "label": "accurate (truly in the text)"}, {"id": "d", "label": "about the author"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Quotation marks indicate words that are the:$tl$, $tl$[{"id": "a", "label": "author's exact words"}, {"id": "b", "label": "your words"}, {"id": "c", "label": "a summary"}, {"id": "d", "label": "a title"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which best supports the claim 'the character felt anxious'?$tl$, $tl$[{"id": "a", "label": "The book is long."}, {"id": "b", "label": "It was Friday."}, {"id": "c", "label": "'Her hands trembled and her voice shook.'"}, {"id": "d", "label": "The cover is red."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When asked 'how do you know?', a strong reader:$tl$, $tl$[{"id": "a", "label": "guesses"}, {"id": "b", "label": "ignores the text"}, {"id": "c", "label": "points to text evidence"}, {"id": "d", "label": "changes topic"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A claim without supporting evidence is:$tl$, $tl$[{"id": "a", "label": "weak / unsupported"}, {"id": "b", "label": "always true"}, {"id": "c", "label": "the central idea"}, {"id": "d", "label": "a quote"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Citing evidence makes an argument more:$tl$, $tl$[{"id": "a", "label": "convincing"}, {"id": "b", "label": "confusing"}, {"id": "c", "label": "shorter"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An explicit detail is one the text states:$tl$, $tl$[{"id": "a", "label": "only by hinting"}, {"id": "b", "label": "never"}, {"id": "c", "label": "directly"}, {"id": "d", "label": "in the title"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An inference is supported by combining text clues with:$tl$, $tl$[{"id": "a", "label": "prior knowledge"}, {"id": "b", "label": "random guesses"}, {"id": "c", "label": "the cover"}, {"id": "d", "label": "page numbers"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Paraphrased evidence must still be:$tl$, $tl$[{"id": "a", "label": "made up"}, {"id": "b", "label": "about you"}, {"id": "c", "label": "based on the text"}, {"id": "d", "label": "unrelated"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Multiple relevant quotes make a point:$tl$, $tl$[{"id": "a", "label": "weaker"}, {"id": "b", "label": "off-topic"}, {"id": "c", "label": "shorter only"}, {"id": "d", "label": "stronger"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$If the text contradicts your claim, you should:$tl$, $tl$[{"id": "a", "label": "keep it anyway"}, {"id": "b", "label": "blame the text"}, {"id": "c", "label": "stop reading"}, {"id": "d", "label": "revise the claim"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Best evidence that a setting is wartime:$tl$, $tl$[{"id": "a", "label": "War is bad."}, {"id": "b", "label": "The author is old."}, {"id": "c", "label": "'Sirens wailed as soldiers marched past ruined homes.'"}, {"id": "d", "label": "It has 300 pages."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Citing the paragraph or line helps a reader:$tl$, $tl$[{"id": "a", "label": "choose a font"}, {"id": "b", "label": "count words"}, {"id": "c", "label": "locate the evidence"}, {"id": "d", "label": "skip reading"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Information taken directly from a text to support a point is text ____. (one word)$tl$, null, $tl$evidence$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Drawing a conclusion the text strongly implies but doesn't state is an:$tl$, $tl$[{"id": "a", "label": "explicit fact"}, {"id": "b", "label": "opinion only"}, {"id": "c", "label": "inference"}, {"id": "d", "label": "a title"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Evidence should be chosen because it is:$tl$, $tl$[{"id": "a", "label": "the longest"}, {"id": "b", "label": "colorful"}, {"id": "c", "label": "random"}, {"id": "d", "label": "relevant to the claim"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A reader who supports ideas with evidence is reading:$tl$, $tl$[{"id": "a", "label": "carelessly"}, {"id": "b", "label": "not at all"}, {"id": "c", "label": "analytically"}, {"id": "d", "label": "only the cover"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Strong analysis combines a claim, evidence, and:$tl$, $tl$[{"id": "a", "label": "explanation of how it supports the claim"}, {"id": "b", "label": "a guess"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "the page count"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Author's Purpose & Perspective (RI.7.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$authors-perspective$tl$, $tl$Author's Purpose & Perspective$tl$, $tl$Analyze an author's purpose, perspective, and how word choice reveals it.$tl$, 7, $tl$RI.7.6$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Author's Purpose & Perspective$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Author's Purpose & Perspective", "body": "Analyze an author's purpose, perspective, and how word choice reveals it."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An author's purpose may be to inform, entertain, or:\n\nThe answer is \"persuade\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  An author's perspective is their:\n\nThe answer is \"attitude toward the topic\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An editorial mainly expresses the writer's:\n\nThe answer is \"opinion\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Loaded or emotional word choices reveal the author's:", "choices": [{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "binding"}, {"id": "d", "label": "bias / perspective"}], "answer": "d", "explanation": "Yes! The answer is \"bias / perspective\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text presenting only one side of an issue is likely:", "choices": [{"id": "a", "label": "objective"}, {"id": "b", "label": "biased"}, {"id": "c", "label": "fictional"}, {"id": "d", "label": "a poem"}], "answer": "b", "explanation": "Yes! The answer is \"biased\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To find an author's purpose, ask:", "choices": [{"id": "a", "label": "how long is it?"}, {"id": "b", "label": "why did they write this?"}, {"id": "c", "label": "who printed it?"}, {"id": "d", "label": "what font?"}], "answer": "b", "explanation": "Yes! The answer is \"why did they write this?\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Author's Purpose & Perspective! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author's purpose may be to inform, entertain, or:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "drive"}, {"id": "d", "label": "eat"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author's perspective is their:$tl$, $tl$[{"id": "a", "label": "attitude toward the topic"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "handwriting"}, {"id": "d", "label": "address"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An editorial mainly expresses the writer's:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "only facts"}, {"id": "c", "label": "a recipe"}, {"id": "d", "label": "a plot"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Loaded or emotional word choices reveal the author's:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "bias / perspective"}, {"id": "c", "label": "font"}, {"id": "d", "label": "binding"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text presenting only one side of an issue is likely:$tl$, $tl$[{"id": "a", "label": "biased"}, {"id": "b", "label": "objective"}, {"id": "c", "label": "fictional"}, {"id": "d", "label": "a poem"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$To find an author's purpose, ask:$tl$, $tl$[{"id": "a", "label": "how long is it?"}, {"id": "b", "label": "who printed it?"}, {"id": "c", "label": "what font?"}, {"id": "d", "label": "why did they write this?"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A persuasive author often uses reasons and:$tl$, $tl$[{"id": "a", "label": "random numbers"}, {"id": "b", "label": "no words"}, {"id": "c", "label": "emotional appeals"}, {"id": "d", "label": "page counts"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An informational article's main purpose is to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "inform"}, {"id": "d", "label": "sell"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Comparing two authors on one topic can reveal different:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "perspectives"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "titles"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "We MUST act now to save our river!" The purpose is to:$tl$, $tl$[{"id": "a", "label": "inform neutrally"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "entertain"}, {"id": "d", "label": "instruct"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Recognizing perspective helps a reader judge a text's:$tl$, $tl$[{"id": "a", "label": "weight"}, {"id": "b", "label": "reliability and intent"}, {"id": "c", "label": "color"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author who includes vivid, scary details likely wants to:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "change fonts"}, {"id": "c", "label": "create suspense or fear in readers"}, {"id": "d", "label": "sell paper"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A balanced text presents:$tl$, $tl$[{"id": "a", "label": "only one side"}, {"id": "b", "label": "no information"}, {"id": "c", "label": "just images"}, {"id": "d", "label": "more than one viewpoint"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Tone is the author's ____ toward the subject.$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "attitude"}, {"id": "c", "label": "font"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A satirical article uses humor mainly to:$tl$, $tl$[{"id": "a", "label": "report neutrally"}, {"id": "b", "label": "criticize or make a point"}, {"id": "c", "label": "teach math"}, {"id": "d", "label": "sell shoes"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The reason an author writes a text is the author's ____. (one word)$tl$, null, $tl$purpose$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Detecting bias often means comparing a text to:$tl$, $tl$[{"id": "a", "label": "other sources"}, {"id": "b", "label": "its page number"}, {"id": "c", "label": "its font"}, {"id": "d", "label": "its cover"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author's word choice and details together create:$tl$, $tl$[{"id": "a", "label": "tone and perspective"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "margins"}, {"id": "d", "label": "the index"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A 'how-to' guide's purpose is to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "instruct"}, {"id": "c", "label": "entertain only"}, {"id": "d", "label": "argue"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Considering purpose and perspective helps readers think:$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "critically"}, {"id": "c", "label": "not at all"}, {"id": "d", "label": "only about length"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Word Meaning & Connotation (L.7.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$word-connotation$tl$, $tl$Word Meaning & Connotation$tl$, $tl$Distinguish denotation from connotation and use clues, roots, and affixes for meaning.$tl$, 7, $tl$L.7.5$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Word Meaning & Connotation$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Word Meaning & Connotation", "body": "Distinguish denotation from connotation and use clues, roots, and affixes for meaning."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A word's denotation is its:\n\nThe answer is \"dictionary meaning\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A word's connotation is the:\n\nThe answer is \"feeling or association it carries\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  'Thrifty' and 'cheap' have similar denotations but different:\n\nThe answer is \"connotations\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word has a more POSITIVE connotation?", "choices": [{"id": "a", "label": "scrawny"}, {"id": "b", "label": "skinny"}, {"id": "c", "label": "bony"}, {"id": "d", "label": "slender"}], "answer": "d", "explanation": "Yes! The answer is \"slender\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word has a more NEGATIVE connotation?", "choices": [{"id": "a", "label": "determined"}, {"id": "b", "label": "persistent"}, {"id": "c", "label": "firm"}, {"id": "d", "label": "stubborn"}], "answer": "d", "explanation": "Yes! The answer is \"stubborn\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"The aroma of bread filled the kitchen.\" \"Aroma\" has a ____ connotation.", "choices": [{"id": "a", "label": "negative"}, {"id": "b", "label": "positive"}, {"id": "c", "label": "neutral only"}, {"id": "d", "label": "no"}], "answer": "b", "explanation": "Yes! The answer is \"positive\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Word Meaning & Connotation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A word's denotation is its:$tl$, $tl$[{"id": "a", "label": "dictionary meaning"}, {"id": "b", "label": "feeling it suggests"}, {"id": "c", "label": "rhyme"}, {"id": "d", "label": "origin"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A word's connotation is the:$tl$, $tl$[{"id": "a", "label": "dictionary meaning"}, {"id": "b", "label": "number of letters"}, {"id": "c", "label": "spelling"}, {"id": "d", "label": "feeling or association it carries"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$'Thrifty' and 'cheap' have similar denotations but different:$tl$, $tl$[{"id": "a", "label": "spellings only"}, {"id": "b", "label": "lengths"}, {"id": "c", "label": "prefixes"}, {"id": "d", "label": "connotations"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word has a more POSITIVE connotation?$tl$, $tl$[{"id": "a", "label": "scrawny"}, {"id": "b", "label": "slender"}, {"id": "c", "label": "skinny"}, {"id": "d", "label": "bony"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word has a more NEGATIVE connotation?$tl$, $tl$[{"id": "a", "label": "determined"}, {"id": "b", "label": "persistent"}, {"id": "c", "label": "stubborn"}, {"id": "d", "label": "firm"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "The aroma of bread filled the kitchen." "Aroma" has a ____ connotation.$tl$, $tl$[{"id": "a", "label": "negative"}, {"id": "b", "label": "neutral only"}, {"id": "c", "label": "no"}, {"id": "d", "label": "positive"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "A stench filled the alley." "Stench" has a ____ connotation.$tl$, $tl$[{"id": "a", "label": "positive"}, {"id": "b", "label": "neutral"}, {"id": "c", "label": "negative"}, {"id": "d", "label": "no"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Authors choose words with certain connotations to:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "fill space"}, {"id": "c", "label": "change fonts"}, {"id": "d", "label": "shape the reader's feelings"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The prefix 'mis-' in 'misjudge' means:$tl$, $tl$[{"id": "a", "label": "again"}, {"id": "b", "label": "before"}, {"id": "c", "label": "wrongly"}, {"id": "d", "label": "not"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The root 'spect' (as in inspect) relates to:$tl$, $tl$[{"id": "a", "label": "seeing / looking"}, {"id": "b", "label": "hearing"}, {"id": "c", "label": "water"}, {"id": "d", "label": "fire"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$'Childish' vs 'childlike': the more negative word is:$tl$, $tl$[{"id": "a", "label": "childlike"}, {"id": "b", "label": "childish"}, {"id": "c", "label": "both equal"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "The diplomat's tactful reply avoided offense." "Tactful" connotes being:$tl$, $tl$[{"id": "a", "label": "considerate"}, {"id": "b", "label": "rude"}, {"id": "c", "label": "careless"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Connotation helps explain why synonyms aren't always:$tl$, $tl$[{"id": "a", "label": "interchangeable"}, {"id": "b", "label": "spelled alike"}, {"id": "c", "label": "the same length"}, {"id": "d", "label": "nouns"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The suffix '-ous' (as in 'courageous') often means:$tl$, $tl$[{"id": "a", "label": "without"}, {"id": "b", "label": "before"}, {"id": "c", "label": "full of"}, {"id": "d", "label": "again"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "He was a curious child, always asking questions." "Curious" connotes:$tl$, $tl$[{"id": "a", "label": "annoying"}, {"id": "b", "label": "eager to learn (positive)"}, {"id": "c", "label": "lazy"}, {"id": "d", "label": "fearful"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The feelings or ideas associated with a word are its ____. (one word)$tl$, null, $tl$connotation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choosing 'pushy' instead of 'assertive' adds a ____ tone.$tl$, $tl$[{"id": "a", "label": "positive"}, {"id": "b", "label": "negative"}, {"id": "c", "label": "neutral"}, {"id": "d", "label": "no"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The root 'aud' (as in audible) relates to:$tl$, $tl$[{"id": "a", "label": "hearing"}, {"id": "b", "label": "seeing"}, {"id": "c", "label": "water"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Words with strong connotations are common in:$tl$, $tl$[{"id": "a", "label": "math problems"}, {"id": "b", "label": "phone books"}, {"id": "c", "label": "tax forms"}, {"id": "d", "label": "persuasive and poetic writing"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Her economical use of words made the essay tight." "Economical" here connotes being:$tl$, $tl$[{"id": "a", "label": "efficient (positive)"}, {"id": "b", "label": "wasteful"}, {"id": "c", "label": "boring"}, {"id": "d", "label": "rude"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Text Structure (RI.7.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$text-structure$tl$, $tl$Text Structure$tl$, $tl$Analyze how an author organizes a text and how the structure shapes ideas.$tl$, 7, $tl$RI.7.5$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Text Structure$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Text Structure", "body": "Analyze how an author organizes a text and how the structure shapes ideas."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A text organized by time order uses a ____ structure.\n\nThe answer is \"chronological / sequence\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A text explaining reasons and results uses:\n\nThe answer is \"cause and effect\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text showing similarities and differences uses:\n\nThe answer is \"compare and contrast\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text presenting an issue and remedies uses:", "choices": [{"id": "a", "label": "problem and solution"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}], "answer": "a", "explanation": "Yes! The answer is \"problem and solution\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'because, therefore, as a result' indicate:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}], "answer": "c", "explanation": "Yes! The answer is \"cause and effect\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'however, similarly, unlike' indicate:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}], "answer": "c", "explanation": "Yes! The answer is \"compare and contrast\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Text Structure! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text organized by time order uses a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare-contrast"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "chronological / sequence"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text explaining reasons and results uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "compare"}, {"id": "d", "label": "cause and effect"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text showing similarities and differences uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "compare and contrast"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A text presenting an issue and remedies uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "problem and solution"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Signal words 'because, therefore, as a result' indicate:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "description"}, {"id": "d", "label": "cause and effect"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Signal words 'however, similarly, unlike' indicate:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Signal words 'first, next, finally' indicate:$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "sequence"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Identifying structure helps a reader:$tl$, $tl$[{"id": "a", "label": "follow and connect ideas"}, {"id": "b", "label": "pick a font"}, {"id": "c", "label": "count pages"}, {"id": "d", "label": "ignore content"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An article on 'why bees are declining and how to help' uses:$tl$, $tl$[{"id": "a", "label": "problem and solution (with cause-effect)"}, {"id": "b", "label": "sequence only"}, {"id": "c", "label": "description only"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A passage detailing a place's sights, sounds, and smells uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A timeline of events matches a ____ structure.$tl$, $tl$[{"id": "a", "label": "chronological"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Headings and signal words are clues to a text's:$tl$, $tl$[{"id": "a", "label": "price"}, {"id": "b", "label": "author"}, {"id": "c", "label": "structure"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author may combine structures, such as comparing the causes of two events, blending:$tl$, $tl$[{"id": "a", "label": "only sequence"}, {"id": "b", "label": "only description"}, {"id": "c", "label": "none"}, {"id": "d", "label": "compare-contrast and cause-effect"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Recognizing problem-solution structure helps you locate the author's:$tl$, $tl$[{"id": "a", "label": "proposed solution"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "rhyme"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$'Deforestation reduced habitat, which lowered species numbers' shows:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$A text arranged strictly in time order uses a ____ structure. (one word)$tl$, null, $tl$chronological$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Knowing structure first makes a complex text:$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "impossible"}, {"id": "c", "label": "easier to analyze"}, {"id": "d", "label": "cheaper"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A pros-and-cons article most likely uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare and contrast"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Cause-effect structure answers the question:$tl$, $tl$[{"id": "a", "label": "why did this happen and what resulted?"}, {"id": "b", "label": "what comes first?"}, {"id": "c", "label": "how are they alike?"}, {"id": "d", "label": "what is the problem?"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Analyzing structure reveals how an author:$tl$, $tl$[{"id": "a", "label": "chooses a cover"}, {"id": "b", "label": "organizes and emphasizes ideas"}, {"id": "c", "label": "sets the price"}, {"id": "d", "label": "picks a font"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Figurative Language & Tone (L.7.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$figurative-tone$tl$, $tl$Figurative Language & Tone$tl$, $tl$Identify figurative language and analyze how word choice creates tone and mood.$tl$, 7, $tl$L.7.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Figurative Language & Tone$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Figurative Language & Tone", "body": "Identify figurative language and analyze how word choice creates tone and mood."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  \"The city never sleeps\" gives the city a human trait, so it is:\n\nThe answer is \"personification\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  \"As cold as ice\" is a:\n\nThe answer is \"simile\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  \"Her words were daggers\" is a:\n\nThe answer is \"metaphor\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "\"I've said this a thousand times\" is an exaggeration called:", "choices": [{"id": "a", "label": "hyperbole"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "idiom"}], "answer": "a", "explanation": "Yes! The answer is \"hyperbole\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "'Hit the books' meaning to study is an:", "choices": [{"id": "a", "label": "idiom"}, {"id": "b", "label": "literal action"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "fact"}], "answer": "a", "explanation": "Yes! The answer is \"idiom\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Tone is the author's ____ toward the subject.", "choices": [{"id": "a", "label": "attitude"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "font"}, {"id": "d", "label": "spelling"}], "answer": "a", "explanation": "Yes! The answer is \"attitude\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Figurative Language & Tone! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"The city never sleeps" gives the city a human trait, so it is:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "an idiom"}, {"id": "d", "label": "personification"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"As cold as ice" is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "hyperbole"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"Her words were daggers" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"I've said this a thousand times" is an exaggeration called:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "idiom"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$'Hit the books' meaning to study is an:$tl$, $tl$[{"id": "a", "label": "literal action"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Tone is the author's ____ toward the subject.$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "spelling"}, {"id": "d", "label": "attitude"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Word choice and details combine to create:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "tone and mood"}, {"id": "c", "label": "margins"}, {"id": "d", "label": "the index"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A passage with words like 'gloomy, silent, cold' creates a ____ mood.$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "funny"}, {"id": "c", "label": "excited"}, {"id": "d", "label": "somber / eerie"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A passage with 'sunny, laughing, bright' creates a ____ mood.$tl$, $tl$[{"id": "a", "label": "gloomy"}, {"id": "b", "label": "tense"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Words that imitate sounds, like 'buzz' or 'clang', are:$tl$, $tl$[{"id": "a", "label": "onomatopoeia"}, {"id": "b", "label": "similes"}, {"id": "c", "label": "metaphors"}, {"id": "d", "label": "idioms"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Symbolism is when an object stands for a larger:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "number"}, {"id": "c", "label": "font"}, {"id": "d", "label": "idea"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A sarcastic tone often means the writer says the opposite of what they:$tl$, $tl$[{"id": "a", "label": "truly mean"}, {"id": "b", "label": "spell"}, {"id": "c", "label": "print"}, {"id": "d", "label": "measure"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"Time is a thief" is a metaphor suggesting time:$tl$, $tl$[{"id": "a", "label": "is a person"}, {"id": "b", "label": "steals moments away"}, {"id": "c", "label": "is metal"}, {"id": "d", "label": "is fast only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author's nostalgic tone suggests a feeling of:$tl$, $tl$[{"id": "a", "label": "fond looking back"}, {"id": "b", "label": "anger"}, {"id": "c", "label": "fear"}, {"id": "d", "label": "boredom"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"The thunder grumbled" is an example of:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "personification"}, {"id": "d", "label": "an idiom"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$An author's attitude toward the subject is the ____. (one word)$tl$, null, $tl$tone$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Figurative language is used to:$tl$, $tl$[{"id": "a", "label": "create vivid images and meaning"}, {"id": "b", "label": "state plain facts only"}, {"id": "c", "label": "fill space"}, {"id": "d", "label": "confuse"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$"My backpack weighs a ton" is an example of:$tl$, $tl$[{"id": "a", "label": "a fact"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Mood is the feeling created in the:$tl$, $tl$[{"id": "a", "label": "author only"}, {"id": "b", "label": "reader"}, {"id": "c", "label": "printer"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which is NOT figurative language?$tl$, $tl$[{"id": "a", "label": "The class ended at noon."}, {"id": "b", "label": "She's a shining star."}, {"id": "c", "label": "Quiet as a mouse."}, {"id": "d", "label": "The wind whispered."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Comparing Authors & Accounts (RI.7.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-authors$tl$, $tl$Comparing Authors & Accounts$tl$, $tl$Compare how different authors present the same topic or event.$tl$, 7, $tl$RI.7.9$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Authors & Accounts$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Comparing Authors & Accounts", "body": "Compare how different authors present the same topic or event."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Comparing two texts on a topic reveals their different:\n\nThe answer is \"approaches and viewpoints\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A memoir and a news article on the same event differ most in:\n\nThe answer is \"perspective and tone\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Two authors may share facts yet reach different:\n\nThe answer is \"conclusions\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Reading multiple sources helps a reader:", "choices": [{"id": "a", "label": "learn less"}, {"id": "b", "label": "ignore facts"}, {"id": "c", "label": "form a fuller, balanced view"}, {"id": "d", "label": "memorize fonts"}], "answer": "c", "explanation": "Yes! The answer is \"form a fuller, balanced view\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A primary source is an account from:", "choices": [{"id": "a", "label": "someone who experienced the event"}, {"id": "b", "label": "a later textbook only"}, {"id": "c", "label": "fiction always"}, {"id": "d", "label": "an unrelated topic"}], "answer": "a", "explanation": "Yes! The answer is \"someone who experienced the event\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A secondary source typically:", "choices": [{"id": "a", "label": "is always firsthand"}, {"id": "b", "label": "analyzes events after the fact"}, {"id": "c", "label": "is fiction"}, {"id": "d", "label": "has no facts"}], "answer": "b", "explanation": "Yes! The answer is \"analyzes events after the fact\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Comparing Authors & Accounts! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Comparing two texts on a topic reveals their different:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "fonts"}, {"id": "c", "label": "prices"}, {"id": "d", "label": "approaches and viewpoints"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A memoir and a news article on the same event differ most in:$tl$, $tl$[{"id": "a", "label": "the date"}, {"id": "b", "label": "whether it happened"}, {"id": "c", "label": "perspective and tone"}, {"id": "d", "label": "the planet"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two authors may share facts yet reach different:$tl$, $tl$[{"id": "a", "label": "page counts"}, {"id": "b", "label": "titles"}, {"id": "c", "label": "conclusions"}, {"id": "d", "label": "fonts"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Reading multiple sources helps a reader:$tl$, $tl$[{"id": "a", "label": "learn less"}, {"id": "b", "label": "ignore facts"}, {"id": "c", "label": "memorize fonts"}, {"id": "d", "label": "form a fuller, balanced view"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A primary source is an account from:$tl$, $tl$[{"id": "a", "label": "a later textbook only"}, {"id": "b", "label": "fiction always"}, {"id": "c", "label": "someone who experienced the event"}, {"id": "d", "label": "an unrelated topic"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A secondary source typically:$tl$, $tl$[{"id": "a", "label": "is always firsthand"}, {"id": "b", "label": "is fiction"}, {"id": "c", "label": "has no facts"}, {"id": "d", "label": "analyzes events after the fact"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When two texts disagree, a careful reader:$tl$, $tl$[{"id": "a", "label": "weighs the evidence in each"}, {"id": "b", "label": "believes the longer one"}, {"id": "c", "label": "ignores both"}, {"id": "d", "label": "picks at random"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A documentary and an essay on whales are alike because both aim to:$tl$, $tl$[{"id": "a", "label": "entertain only"}, {"id": "b", "label": "be fiction"}, {"id": "c", "label": "avoid facts"}, {"id": "d", "label": "inform about whales"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Comparing a novel to its film often shows the film:$tl$, $tl$[{"id": "a", "label": "adds nothing"}, {"id": "b", "label": "is identical"}, {"id": "c", "label": "has no characters"}, {"id": "d", "label": "changes or cuts details"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two authors writing about courage may differ in their:$tl$, $tl$[{"id": "a", "label": "examples and emphasis"}, {"id": "b", "label": "the theme exactly"}, {"id": "c", "label": "the alphabet"}, {"id": "d", "label": "the length only"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Synthesizing sources means:$tl$, $tl$[{"id": "a", "label": "copying one"}, {"id": "b", "label": "ignoring all"}, {"id": "c", "label": "combining ideas across texts"}, {"id": "d", "label": "reading none"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$An author's bias is easier to spot when you:$tl$, $tl$[{"id": "a", "label": "compare with other accounts"}, {"id": "b", "label": "read only that text"}, {"id": "c", "label": "ignore evidence"}, {"id": "d", "label": "check the font"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Firsthand and secondhand accounts often differ in:$tl$, $tl$[{"id": "a", "label": "the event itself"}, {"id": "b", "label": "the year only"}, {"id": "c", "label": "detail and point of view"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A scientific report and an opinion blog differ mainly in:$tl$, $tl$[{"id": "a", "label": "the topic"}, {"id": "b", "label": "evidence and reliability"}, {"id": "c", "label": "the alphabet"}, {"id": "d", "label": "the length"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Comparing how two writers describe a city highlights each writer's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "style and word choice"}, {"id": "c", "label": "publisher"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Examining how two texts are alike and different is to ____ them. (one word, starts with c)$tl$, null, $tl$compare$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$When sources conflict, the reader should evaluate the:$tl$, $tl$[{"id": "a", "label": "page color"}, {"id": "b", "label": "font"}, {"id": "c", "label": "author's age"}, {"id": "d", "label": "credibility and evidence of each"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Two charts of the same data can differ in:$tl$, $tl$[{"id": "a", "label": "how they present it"}, {"id": "b", "label": "the facts"}, {"id": "c", "label": "the truth"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Considering multiple viewpoints before forming an opinion shows:$tl$, $tl$[{"id": "a", "label": "critical reading"}, {"id": "b", "label": "lazy reading"}, {"id": "c", "label": "guessing"}, {"id": "d", "label": "skimming only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Reading an eyewitness account and a historian's analysis of one event gives a reader:$tl$, $tl$[{"id": "a", "label": "less information"}, {"id": "b", "label": "only opinions"}, {"id": "c", "label": "a more complete understanding"}, {"id": "d", "label": "only fiction"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Plot & Character Development (RL.7.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plot-character-development$tl$, $tl$Plot & Character Development$tl$, $tl$Analyze how plot events and characters develop and interact over a story.$tl$, 7, $tl$RL.7.3$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plot & Character Development$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Plot & Character Development", "body": "Analyze how plot events and characters develop and interact over a story."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The sequence of events in a story is the:\n\nThe answer is \"plot\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The central problem characters face is the:\n\nThe answer is \"conflict\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A character who changes over the story is:\n\nThe answer is \"dynamic\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A character who stays the same is:", "choices": [{"id": "a", "label": "dynamic"}, {"id": "b", "label": "static"}, {"id": "c", "label": "the protagonist always"}, {"id": "d", "label": "the villain"}], "answer": "b", "explanation": "Yes! The answer is \"static\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The turning point of greatest tension is the:", "choices": [{"id": "a", "label": "exposition"}, {"id": "b", "label": "climax"}, {"id": "c", "label": "resolution"}, {"id": "d", "label": "setting"}], "answer": "b", "explanation": "Yes! The answer is \"climax\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Events that build tension before the climax are the:", "choices": [{"id": "a", "label": "resolution"}, {"id": "b", "label": "rising action"}, {"id": "c", "label": "exposition"}, {"id": "d", "label": "falling action"}], "answer": "b", "explanation": "Yes! The answer is \"rising action\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plot & Character Development! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The sequence of events in a story is the:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "plot"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The central problem characters face is the:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "genre"}, {"id": "c", "label": "title"}, {"id": "d", "label": "conflict"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A character who changes over the story is:$tl$, $tl$[{"id": "a", "label": "flat / static"}, {"id": "b", "label": "minor only"}, {"id": "c", "label": "dynamic"}, {"id": "d", "label": "the narrator"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A character who stays the same is:$tl$, $tl$[{"id": "a", "label": "dynamic"}, {"id": "b", "label": "the protagonist always"}, {"id": "c", "label": "static"}, {"id": "d", "label": "the villain"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The turning point of greatest tension is the:$tl$, $tl$[{"id": "a", "label": "exposition"}, {"id": "b", "label": "climax"}, {"id": "c", "label": "resolution"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Events that build tension before the climax are the:$tl$, $tl$[{"id": "a", "label": "resolution"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "falling action"}, {"id": "d", "label": "rising action"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The part where the conflict is resolved is the:$tl$, $tl$[{"id": "a", "label": "rising action"}, {"id": "b", "label": "climax"}, {"id": "c", "label": "resolution"}, {"id": "d", "label": "exposition"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A reason a character acts a certain way is their:$tl$, $tl$[{"id": "a", "label": "motivation"}, {"id": "b", "label": "height"}, {"id": "c", "label": "clothes"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A struggle within a character's own mind is:$tl$, $tl$[{"id": "a", "label": "external conflict"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "internal conflict"}, {"id": "d", "label": "plot only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A struggle against another person or nature is:$tl$, $tl$[{"id": "a", "label": "internal conflict"}, {"id": "b", "label": "external conflict"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Characters are revealed through their words, actions, and:$tl$, $tl$[{"id": "a", "label": "thoughts"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The way a character responds to conflict reveals their:$tl$, $tl$[{"id": "a", "label": "shoe size"}, {"id": "b", "label": "address"}, {"id": "c", "label": "favorite color"}, {"id": "d", "label": "traits and values"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Read: "Maya must choose loyalty to her team or her own dream." This is mainly:$tl$, $tl$[{"id": "a", "label": "internal conflict"}, {"id": "b", "label": "external conflict only"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Character development means a character:$tl$, $tl$[{"id": "a", "label": "grows or changes meaningfully"}, {"id": "b", "label": "stays exactly the same"}, {"id": "c", "label": "is described once"}, {"id": "d", "label": "is named"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$The plot usually moves forward because of the:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "conflict"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$The main problem or struggle that drives a story is the ____. (one word)$tl$, null, $tl$conflict$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Comparing a character at the start and end shows their:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "development (or lack of it)"}, {"id": "d", "label": "cover"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Subplots are:$tl$, $tl$[{"id": "a", "label": "the title"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "secondary storylines that support the main plot"}, {"id": "d", "label": "the cover"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$A flashback in a plot:$tl$, $tl$[{"id": "a", "label": "predicts the future"}, {"id": "b", "label": "shows an earlier event"}, {"id": "c", "label": "ends the story"}, {"id": "d", "label": "lists characters"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Understanding plot and character together helps a reader grasp the story's:$tl$, $tl$[{"id": "a", "label": "meaning and theme"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "font"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea.$tl$, 7, $tl$L.7.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Nouns", "body": "A noun names a person, place, thing, or idea."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"balloon\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"blanket\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"mountain\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "scribble"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "narrow"}], "answer": "b", "explanation": "Yes! The answer is \"garden\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "swim"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "island"}, {"id": "d", "label": "curious"}], "answer": "c", "explanation": "Yes! The answer is \"island\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "shiny"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "window"}, {"id": "d", "label": "stretch"}], "answer": "c", "explanation": "Yes! The answer is \"window\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "island"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "village"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "window"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "library"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action or a state of being.$tl$, 7, $tl$L.7.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Action Verbs", "body": "A verb shows action or a state of being."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an action verb (something you can do)?\n\nThe answer is \"march\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an action verb (something you can do)?\n\nThe answer is \"bounce\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an action verb (something you can do)?\n\nThe answer is \"shout\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "wander"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "mountain"}], "answer": "a", "explanation": "Yes! The answer is \"wander\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "cheerful"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "build"}], "answer": "d", "explanation": "Yes! The answer is \"build\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "discover"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "gentle"}], "answer": "a", "explanation": "Yes! The answer is \"discover\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Action Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "window"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "river"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "build"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "island"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun.$tl$, 7, $tl$L.7.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Adjectives", "body": "An adjective describes a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"slippery\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"gentle\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"fluffy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "scribble"}, {"id": "b", "label": "river"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "pencil"}], "answer": "c", "explanation": "Yes! The answer is \"enormous\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "teacher"}, {"id": "b", "label": "march"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "island"}], "answer": "c", "explanation": "Yes! The answer is \"ancient\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "gallop"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "island"}], "answer": "b", "explanation": "Yes! The answer is \"brave\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Adjectives! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "march"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "library"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "build"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "river"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "library"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "island"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "window"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "window"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun.$tl$, 7, $tl$L.7.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Pronouns", "body": "A pronoun takes the place of a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"them\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"you\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"they\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "jump"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "march"}, {"id": "d", "label": "it"}], "answer": "d", "explanation": "Yes! The answer is \"it\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "us"}, {"id": "d", "label": "gallop"}], "answer": "c", "explanation": "Yes! The answer is \"us\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "kitchen"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "I"}], "answer": "d", "explanation": "Yes! The answer is \"I\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Pronouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "you"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "him"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "she"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "island"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "them"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "us"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "I"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "build"}, {"id": "c", "label": "her"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "it"}, {"id": "c", "label": "library"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "we"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "you"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "library"}, {"id": "c", "label": "him"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "she"}, {"id": "c", "label": "library"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "them"}, {"id": "c", "label": "window"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "they"}, {"id": "b", "label": "river"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "us"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "window"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "her"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "it"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "we"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must agree with its subject in number.$tl$, 7, $tl$L.7.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Subject-Verb Agreement", "body": "The verb must agree with its subject in number."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Choose the correct verb: \"The singer ____ every day.\"\n\nThe answer is \"performs\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Choose the correct verb: \"The river ____ every day.\"\n\nThe answer is \"flows\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Choose the correct verb: \"The student ____ every day.\"\n\nThe answer is \"reads\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The puppy ____ every day.\"", "choices": [{"id": "a", "label": "wag"}, {"id": "b", "label": "wagsed"}, {"id": "c", "label": "wagsing"}, {"id": "d", "label": "wags"}], "answer": "d", "explanation": "Yes! The answer is \"wags\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The chef ____ every day.\"", "choices": [{"id": "a", "label": "cooks"}, {"id": "b", "label": "cook"}, {"id": "c", "label": "cooksed"}, {"id": "d", "label": "cooksing"}], "answer": "a", "explanation": "Yes! The answer is \"cooks\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The cat ____ every day.\"", "choices": [{"id": "a", "label": "sleep"}, {"id": "b", "label": "sleeps"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}], "answer": "b", "explanation": "Yes! The answer is \"sleeps\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Subject-Verb Agreement! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hops"}, {"id": "b", "label": "hop"}, {"id": "c", "label": "hopsed"}, {"id": "d", "label": "hopsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooks"}, {"id": "c", "label": "cooksed"}, {"id": "d", "label": "cooksing"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistles"}, {"id": "b", "label": "whistle"}, {"id": "c", "label": "whistlesed"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "grows"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "ticks"}, {"id": "b", "label": "tick"}, {"id": "c", "label": "ticksed"}, {"id": "d", "label": "ticksing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "reads"}, {"id": "d", "label": "readsing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slithers"}, {"id": "b", "label": "slither"}, {"id": "c", "label": "slithersed"}, {"id": "d", "label": "slithersing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wag"}, {"id": "b", "label": "wagsed"}, {"id": "c", "label": "wagsing"}, {"id": "d", "label": "wags"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "crie"}, {"id": "b", "label": "criesed"}, {"id": "c", "label": "criesing"}, {"id": "d", "label": "cries"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plant"}, {"id": "b", "label": "plantsed"}, {"id": "c", "label": "plantsing"}, {"id": "d", "label": "plants"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "perform"}, {"id": "b", "label": "performs"}, {"id": "c", "label": "performsed"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "play"}, {"id": "b", "label": "playsed"}, {"id": "c", "label": "plays"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roarsed"}, {"id": "c", "label": "roarsing"}, {"id": "d", "label": "roars"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sings"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barks"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "write"}, {"id": "b", "label": "writes"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flows"}, {"id": "c", "label": "flowsed"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runs"}, {"id": "c", "label": "runsed"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleep"}, {"id": "b", "label": "sleeps"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "paintsed"}, {"id": "c", "label": "paintsing"}, {"id": "d", "label": "paints"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs describe actions that already happened.$tl$, 7, $tl$L.7.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Past-Tense Verbs", "body": "Past-tense verbs describe actions that already happened."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the past tense of the verb \"drink\"?\n\nThe answer is \"drank\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the past tense of the verb \"go\"?\n\nThe answer is \"went\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the past tense of the verb \"write\"?\n\nThe answer is \"wrote\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the past tense of the verb \"sing\"?\n\nThe answer is sang."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the past tense of the verb \"draw\"?\n\nThe answer is drew."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the past tense of the verb \"see\"?\n\nThe answer is saw."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Past-Tense Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "know"?$tl$, null, $tl$knew$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "take"?$tl$, null, $tl$took$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$What is the past tense of the verb "bring"?$tl$, null, $tl$brought$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.7.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals show more than one.$tl$, 7, $tl$L.7.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Plural Nouns", "body": "Plurals show more than one."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Write the plural of \"bus\".\n\nThe answer is \"buses\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Write the plural of \"glass\".\n\nThe answer is \"glasses\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Write the plural of \"wolf\".\n\nThe answer is \"wolves\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Write the plural of \"cherry\".\n\nThe answer is cherries."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Write the plural of \"city\".\n\nThe answer is cities."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Write the plural of \"branch\".\n\nThe answer is branches."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plural Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "wolf".$tl$, null, $tl$wolves$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "city".$tl$, null, $tl$cities$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "fairy".$tl$, null, $tl$fairies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "loaf".$tl$, null, $tl$loaves$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capitalization$tl$, $tl$Capitalize sentence beginnings, I, and proper nouns.$tl$, 7, $tl$L.7.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Capitalization", "body": "Capitalize sentence beginnings, I, and proper nouns."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Amazon River\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Mount Everest\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Monday\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "Nile River"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "river"}, {"id": "d", "label": "day"}], "answer": "a", "explanation": "Yes! The answer is \"Nile River\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "river"}, {"id": "b", "label": "Saturn"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "day"}], "answer": "b", "explanation": "Yes! The answer is \"Saturn\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "friend"}, {"id": "b", "label": "month"}, {"id": "c", "label": "Australia"}, {"id": "d", "label": "city"}], "answer": "c", "explanation": "Yes! The answer is \"Australia\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Capitalization! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "London"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "Sarah"}, {"id": "c", "label": "month"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "month"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "New York"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "Maria"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "month"}, {"id": "c", "label": "country"}, {"id": "d", "label": "Friday"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "river"}, {"id": "c", "label": "country"}, {"id": "d", "label": "Tokyo"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "river"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "December"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "Tuesday"}, {"id": "c", "label": "country"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "Monday"}, {"id": "c", "label": "country"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Africa"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "July"}, {"id": "b", "label": "country"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "country"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Australia"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Saturn"}, {"id": "b", "label": "month"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "Mount Everest"}, {"id": "c", "label": "city"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "day"}, {"id": "c", "label": "river"}, {"id": "d", "label": "Canada"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "month"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "India"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "Nile River"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Pacific Ocean"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "country"}, {"id": "d", "label": "October"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "day"}, {"id": "c", "label": "Amazon River"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End sentences with a period, question mark, or exclamation point.$tl$, 7, $tl$L.7.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: End Punctuation", "body": "End sentences with a period, question mark, or exclamation point."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which end mark best completes the sentence?  \"Run for your life___\"\n\nThe answer is \"!\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which end mark best completes the sentence?  \"What a great show___\"\n\nThe answer is \"!\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which end mark best completes the sentence?  \"What time is it___\"\n\nThe answer is \"?\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"That is amazing___\"", "choices": [{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "Yes! The answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"We won the game___\"", "choices": [{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "Yes! The answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"Watch out___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "b", "explanation": "Yes! The answer is \"!\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about End Punctuation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.7.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$Use commas to separate three or more items in a list.$tl$, 7, $tl$L.7.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 7, $tl$[{"type": "explain", "title": "Let's learn: Commas in a Series", "body": "Use commas to separate three or more items in a list."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like gold, silver, and bronze.\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like piano, drums, and guitar.\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like run, jump, and swim.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like, red green blue."}, {"id": "d", "label": "I like red, green, and blue."}], "answer": "d", "explanation": "Yes! The answer is \"I like red, green, and blue.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like milk, eggs, and bread."}, {"id": "b", "label": "I like milk eggs and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}], "answer": "a", "explanation": "Yes! The answer is \"I like milk, eggs, and bread.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like apples, oranges, and pears."}, {"id": "d", "label": "I like, apples oranges pears."}], "answer": "c", "explanation": "Yes! The answer is \"I like apples, oranges, and pears.\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Commas in a Series! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 7, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums and guitar"}, {"id": "c", "label": "I like piano, drums, and guitar."}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer, tennis, and golf."}, {"id": "b", "label": "I like soccer tennis and golf."}, {"id": "c", "label": "I like soccer, tennis and golf"}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like, cats dogs fish."}, {"id": "d", "label": "I like cats, dogs, and fish."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles, squares, and triangles."}, {"id": "b", "label": "I like circles squares and triangles."}, {"id": "c", "label": "I like circles, squares and triangles"}, {"id": "d", "label": "I like, circles squares triangles."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 7, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs and bread"}, {"id": "c", "label": "I like, milk eggs bread."}, {"id": "d", "label": "I like milk, eggs, and bread."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow and hail"}, {"id": "c", "label": "I like, rain snow hail."}, {"id": "d", "label": "I like rain, snow, and hail."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red, green, and blue."}, {"id": "b", "label": "I like red green and blue."}, {"id": "c", "label": "I like red, green and blue"}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump and swim"}, {"id": "c", "label": "I like run, jump, and swim."}, {"id": "d", "label": "I like, run jump swim."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes, and buses."}, {"id": "c", "label": "I like trains, planes and buses"}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 7, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils, pens, and markers."}, {"id": "b", "label": "I like pencils pens and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books, pens, and rulers."}, {"id": "b", "label": "I like books pens and rulers."}, {"id": "c", "label": "I like books, pens and rulers"}, {"id": "d", "label": "I like, books pens rulers."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver and bronze"}, {"id": "c", "label": "I like, gold silver bronze."}, {"id": "d", "label": "I like gold, silver, and bronze."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples, grapes, and plums."}, {"id": "b", "label": "I like apples grapes and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring, summer, and fall."}, {"id": "b", "label": "I like spring summer and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 7, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north south and east."}, {"id": "b", "label": "I like north, south and east"}, {"id": "c", "label": "I like north, south, and east."}, {"id": "d", "label": "I like, north south east."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like apples, oranges, and pears."}, {"id": "d", "label": "I like, apples oranges pears."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like Mom, Dad, and Grandma."}, {"id": "d", "label": "I like, Mom Dad Grandma."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers and bears"}, {"id": "c", "label": "I like, lions tigers bears."}, {"id": "d", "label": "I like lions, tigers, and bears."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 7, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham cheese and lettuce."}, {"id": "b", "label": "I like ham, cheese and lettuce"}, {"id": "c", "label": "I like ham, cheese, and lettuce."}, {"id": "d", "label": "I like, ham cheese lettuce."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 7 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

