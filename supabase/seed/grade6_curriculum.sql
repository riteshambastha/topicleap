-- =====================================================================
-- TopicLeap - Grade 6 full curriculum seed (generated)
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

-- ---- [math] Ratios (6.RP.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$ratios$tl$, $tl$Ratios$tl$, $tl$A ratio compares two quantities. Worksheets use larger numbers as they go.$tl$, 6, $tl$6.RP.A.1$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Ratios$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Ratios", "body": "A ratio compares two quantities. Worksheets use larger numbers as they go."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  There are 7 cats and 8 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).\n\nThe answer is \"7:8\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  There are 2 red and 10 blue. Write the ratio of red to blue (use a colon, like 3:4).\n\nThe answer is \"2:10\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  There are 6 wins and 8 losses. Write the ratio of wins to losses (use a colon, like 3:4).\n\nThe answer is \"6:8\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  There are 10 boys and 4 girls. Write the ratio of boys to girls (use a colon, like 3:4).\n\nThe answer is 10:4."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  There are 11 wins and 17 losses. Write the ratio of wins to losses (use a colon, like 3:4).\n\nThe answer is 11:17."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  There are 15 apples and 15 oranges. Write the ratio of apples to oranges (use a colon, like 3:4).\n\nThe answer is 15:15."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Ratios! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 6 cats and 2 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$6:2$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 8 red and 8 blue. Write the ratio of red to blue (use a colon, like 3:4).$tl$, null, $tl$8:8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 4 cats and 6 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$4:6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 7 red and 7 blue. Write the ratio of red to blue (use a colon, like 3:4).$tl$, null, $tl$7:7$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 2 cats and 8 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$2:8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 11 apples and 14 oranges. Write the ratio of apples to oranges (use a colon, like 3:4).$tl$, null, $tl$11:14$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 18 boys and 6 girls. Write the ratio of boys to girls (use a colon, like 3:4).$tl$, null, $tl$18:6$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 10 cats and 5 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$10:5$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 6 wins and 19 losses. Write the ratio of wins to losses (use a colon, like 3:4).$tl$, null, $tl$6:19$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 16 red and 11 blue. Write the ratio of red to blue (use a colon, like 3:4).$tl$, null, $tl$16:11$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 9 red and 7 blue. Write the ratio of red to blue (use a colon, like 3:4).$tl$, null, $tl$9:7$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 14 apples and 40 oranges. Write the ratio of apples to oranges (use a colon, like 3:4).$tl$, null, $tl$14:40$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 39 apples and 19 oranges. Write the ratio of apples to oranges (use a colon, like 3:4).$tl$, null, $tl$39:19$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 19 apples and 27 oranges. Write the ratio of apples to oranges (use a colon, like 3:4).$tl$, null, $tl$19:27$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 16 boys and 32 girls. Write the ratio of boys to girls (use a colon, like 3:4).$tl$, null, $tl$16:32$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 98 boys and 44 girls. Write the ratio of boys to girls (use a colon, like 3:4).$tl$, null, $tl$98:44$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 22 wins and 20 losses. Write the ratio of wins to losses (use a colon, like 3:4).$tl$, null, $tl$22:20$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 68 cats and 41 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$68:41$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 46 red and 45 blue. Write the ratio of red to blue (use a colon, like 3:4).$tl$, null, $tl$46:45$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$There are 73 cats and 66 dogs. Write the ratio of cats to dogs (use a colon, like 3:4).$tl$, null, $tl$73:66$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$ratios$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Unit Rates (6.RP.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$unit-rates$tl$, $tl$Unit Rates$tl$, $tl$A unit rate tells how much of one quantity per one of another, like miles per hour.$tl$, 6, $tl$6.RP.A.2$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Unit Rates$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Unit Rates", "body": "A unit rate tells how much of one quantity per one of another, like miles per hour."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A car travels 24 miles in 3 hours at a steady speed. How many miles per hour is that?\n\nThe answer is \"8\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A car travels 4 miles in 2 hours at a steady speed. How many miles per hour is that?\n\nThe answer is \"2\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A car travels 27 miles in 3 hours at a steady speed. How many miles per hour is that?\n\nThe answer is \"9\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A car travels 76 miles in 4 hours at a steady speed. How many miles per hour is that?\n\nThe answer is 19."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A car travels 51 miles in 3 hours at a steady speed. How many miles per hour is that?\n\nThe answer is 17."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A car travels 48 miles in 4 hours at a steady speed. How many miles per hour is that?\n\nThe answer is 12."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Unit Rates! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 8 miles in 2 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 20 miles in 5 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 40 miles in 5 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 24 miles in 3 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 9 miles in 3 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 68 miles in 4 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$17$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 35 miles in 5 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 48 miles in 6 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 36 miles in 4 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 72 miles in 4 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$18$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 300 miles in 12 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$25$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 128 miles in 4 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$32$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 88 miles in 11 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 50 miles in 2 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$25$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 429 miles in 11 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$39$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 528 miles in 12 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$44$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 720 miles in 9 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$80$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 30 miles in 2 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 900 miles in 15 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A car travels 246 miles in 6 hours at a steady speed. How many miles per hour is that?$tl$, null, $tl$41$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$unit-rates$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Percents (6.RP.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$percent$tl$, $tl$Percents$tl$, $tl$A percent is a part out of 100. To find a percent of a number, multiply and divide by 100.$tl$, 6, $tl$6.RP.A.3$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Percents$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Percents", "body": "A percent is a part out of 100. To find a percent of a number, multiply and divide by 100."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is 10% of 100?\n\nThe answer is \"10\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is 25% of 300?\n\nThe answer is \"75\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is 10% of 300?\n\nThe answer is \"30\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is 50% of 600?\n\nThe answer is 300."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is 75% of 200?\n\nThe answer is 150."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is 20% of 400?\n\nThe answer is 80."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Percents! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 25% of 300?$tl$, null, $tl$75$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 10% of 200?$tl$, null, $tl$20$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 25% of 100?$tl$, null, $tl$25$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 50% of 100?$tl$, null, $tl$50$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 10% of 300?$tl$, null, $tl$30$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 75% of 200?$tl$, null, $tl$150$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 20% of 600?$tl$, null, $tl$120$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 75% of 600?$tl$, null, $tl$450$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 10% of 600?$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 75% of 400?$tl$, null, $tl$300$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 15% of 800?$tl$, null, $tl$120$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 30% of 400?$tl$, null, $tl$120$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 60% of 1200?$tl$, null, $tl$720$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 15% of 1200?$tl$, null, $tl$180$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 30% of 1200?$tl$, null, $tl$360$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 45% of 1000?$tl$, null, $tl$450$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 45% of 3000?$tl$, null, $tl$1350$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 12% of 3000?$tl$, null, $tl$360$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 90% of 2000?$tl$, null, $tl$1800$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 90% of 3000?$tl$, null, $tl$2700$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$percent$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Dividing Fractions (6.NS.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$divide-fractions$tl$, $tl$Dividing Fractions$tl$, $tl$To divide by a fraction, multiply by its reciprocal (flip the second fraction).$tl$, 6, $tl$6.NS.A.1$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Dividing Fractions$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Dividing Fractions", "body": "To divide by a fraction, multiply by its reciprocal (flip the second fraction)."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  2/3 / 1/3 = ?  (divide the fractions)\n\nThe answer is \"2\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  1/4 / 2/3 = ?  (divide the fractions)\n\nThe answer is \"3/8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  1/3 / 1/3 = ?  (divide the fractions)\n\nThe answer is \"1\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "2/4 / 1/2 = ?  (divide the fractions)", "choices": [{"id": "a", "label": "1/4"}, {"id": "b", "label": "2"}, {"id": "c", "label": "4/5"}, {"id": "d", "label": "1"}], "answer": "d", "explanation": "Yes! The answer is \"1\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/2 / 1/2 = ?  (divide the fractions)", "choices": [{"id": "a", "label": "2/3"}, {"id": "b", "label": "1"}, {"id": "c", "label": "3/3"}, {"id": "d", "label": "1/4"}], "answer": "b", "explanation": "Yes! The answer is \"1\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1/3 / 1/5 = ?  (divide the fractions)", "choices": [{"id": "a", "label": "5/3"}, {"id": "b", "label": "1/15"}, {"id": "c", "label": "6/4"}, {"id": "d", "label": "5/4"}], "answer": "a", "explanation": "Yes! The answer is \"5/3\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Dividing Fractions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/3 / 1/3 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/4"}, {"id": "b", "label": "3/4"}, {"id": "c", "label": "1"}, {"id": "d", "label": "1/9"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2/3 / 2/3 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/9"}, {"id": "b", "label": "5/5"}, {"id": "c", "label": "1"}, {"id": "d", "label": "6/5"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2/3 / 3/4 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "6/6"}, {"id": "b", "label": "8/9"}, {"id": "c", "label": "8/6"}, {"id": "d", "label": "1/2"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/2 / 1/2 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "3/3"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "1"}, {"id": "d", "label": "2/3"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/3 / 2/4 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/5"}, {"id": "b", "label": "2/3"}, {"id": "c", "label": "1/6"}, {"id": "d", "label": "5/5"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/2 / 3/4 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "5/5"}, {"id": "b", "label": "4/5"}, {"id": "c", "label": "3/8"}, {"id": "d", "label": "2/3"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3/5 / 1/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "15/6"}, {"id": "c", "label": "3/25"}, {"id": "d", "label": "8/6"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3/4 / 2/3 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "9/8"}, {"id": "b", "label": "9/6"}, {"id": "c", "label": "6/6"}, {"id": "d", "label": "1/2"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/3 / 1/2 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "2/4"}, {"id": "b", "label": "1/6"}, {"id": "c", "label": "2/3"}, {"id": "d", "label": "3/4"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$4/5 / 1/2 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "2/5"}, {"id": "b", "label": "6/6"}, {"id": "c", "label": "8/6"}, {"id": "d", "label": "8/5"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3/6 / 2/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "1/5"}, {"id": "b", "label": "15/8"}, {"id": "c", "label": "8/8"}, {"id": "d", "label": "5/4"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/3 / 1/4 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/4"}, {"id": "b", "label": "5/4"}, {"id": "c", "label": "1/12"}, {"id": "d", "label": "4/3"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2/6 / 4/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/15"}, {"id": "b", "label": "5/12"}, {"id": "c", "label": "10/10"}, {"id": "d", "label": "7/10"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/3 / 3/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "5/9"}, {"id": "b", "label": "1/5"}, {"id": "c", "label": "5/6"}, {"id": "d", "label": "6/6"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2/5 / 2/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "4/25"}, {"id": "b", "label": "1"}, {"id": "c", "label": "7/7"}, {"id": "d", "label": "10/7"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3/4 / 3/4 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "12/7"}, {"id": "c", "label": "7/7"}, {"id": "d", "label": "9/16"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3/8 / 3/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "9/40"}, {"id": "b", "label": "8/11"}, {"id": "c", "label": "5/8"}, {"id": "d", "label": "15/11"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/6 / 3/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "1/10"}, {"id": "b", "label": "6/9"}, {"id": "c", "label": "5/18"}, {"id": "d", "label": "5/9"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1/8 / 2/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "5/16"}, {"id": "b", "label": "6/10"}, {"id": "c", "label": "1/20"}, {"id": "d", "label": "5/10"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2/4 / 4/5 = ?  (divide the fractions)$tl$, $tl$[{"id": "a", "label": "2/5"}, {"id": "b", "label": "10/8"}, {"id": "c", "label": "7/8"}, {"id": "d", "label": "5/8"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$divide-fractions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Decimal Operations (6.NS.B.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$decimal-operations$tl$, $tl$Decimal Operations$tl$, $tl$Add, subtract, and multiply decimals carefully, keeping track of the decimal point.$tl$, 6, $tl$6.NS.B.3$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Decimal Operations$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Decimal Operations", "body": "Add, subtract, and multiply decimals carefully, keeping track of the decimal point."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  0.7 + 0.9 = ?\n\nThe answer is \"1.6\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  3.4 + 0.5 = ?\n\nThe answer is \"3.9\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  2 - 0.4 = ?\n\nThe answer is \"1.6\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "1.4 - 0.9 = ?", "choices": [{"id": "a", "label": "0.5"}, {"id": "b", "label": "5"}, {"id": "c", "label": "0.4"}, {"id": "d", "label": "0.6"}], "answer": "a", "explanation": "Yes! The answer is \"0.5\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "0.5 - 0.2 = ?", "choices": [{"id": "a", "label": "0.5"}, {"id": "b", "label": "0.3"}, {"id": "c", "label": "0.4"}, {"id": "d", "label": "0.2"}], "answer": "b", "explanation": "Yes! The answer is \"0.3\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "3.4 + 0.7 = ?", "choices": [{"id": "a", "label": "4"}, {"id": "b", "label": "4.2"}, {"id": "c", "label": "4.1"}, {"id": "d", "label": "41"}], "answer": "c", "explanation": "Yes! The answer is \"4.1\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Decimal Operations! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$4.8 - 0.7 = ?$tl$, $tl$[{"id": "a", "label": "4.8"}, {"id": "b", "label": "4.1"}, {"id": "c", "label": "41"}, {"id": "d", "label": "4"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3.3 - 0.8 = ?$tl$, $tl$[{"id": "a", "label": "2.5"}, {"id": "b", "label": "25"}, {"id": "c", "label": "2.4"}, {"id": "d", "label": "2.6"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2.8 - 0.9 = ?$tl$, $tl$[{"id": "a", "label": "1.8"}, {"id": "b", "label": "19"}, {"id": "c", "label": "2"}, {"id": "d", "label": "1.9"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2.4 - 0.2 = ?$tl$, $tl$[{"id": "a", "label": "2.3"}, {"id": "b", "label": "2.1"}, {"id": "c", "label": "2.2"}, {"id": "d", "label": "22"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.9 + 0.2 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "1.2"}, {"id": "c", "label": "1.1"}, {"id": "d", "label": "11"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$8.2 x 0.6 = ?$tl$, $tl$[{"id": "a", "label": "4.92"}, {"id": "b", "label": "8.2"}, {"id": "c", "label": "5.02"}, {"id": "d", "label": "4.82"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$7.2 + 0.9 = ?$tl$, $tl$[{"id": "a", "label": "7.2"}, {"id": "b", "label": "8"}, {"id": "c", "label": "8.1"}, {"id": "d", "label": "81"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$3.3 x 0.7 = ?$tl$, $tl$[{"id": "a", "label": "2.31"}, {"id": "b", "label": "23.1"}, {"id": "c", "label": "3.3"}, {"id": "d", "label": "2.41"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$6 x 0.3 = ?$tl$, $tl$[{"id": "a", "label": "1.8"}, {"id": "b", "label": "1.9"}, {"id": "c", "label": "18"}, {"id": "d", "label": "6"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$4.4 x 0.6 = ?$tl$, $tl$[{"id": "a", "label": "2.74"}, {"id": "b", "label": "2.64"}, {"id": "c", "label": "2.54"}, {"id": "d", "label": "26.4"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.81 - 0.4 = ?$tl$, $tl$[{"id": "a", "label": "4.1"}, {"id": "b", "label": "0.31"}, {"id": "c", "label": "0.41"}, {"id": "d", "label": "0.51"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.65 + 0.3 = ?$tl$, $tl$[{"id": "a", "label": "9.5"}, {"id": "b", "label": "1.05"}, {"id": "c", "label": "0.65"}, {"id": "d", "label": "0.95"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.71 + 0.08 = ?$tl$, $tl$[{"id": "a", "label": "0.71"}, {"id": "b", "label": "0.79"}, {"id": "c", "label": "0.89"}, {"id": "d", "label": "7.9"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.35 x 0.4 = ?$tl$, $tl$[{"id": "a", "label": "1.4"}, {"id": "b", "label": "0.04"}, {"id": "c", "label": "0.14"}, {"id": "d", "label": "0.24"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.9 - 0.48 = ?$tl$, $tl$[{"id": "a", "label": "0.42"}, {"id": "b", "label": "0.9"}, {"id": "c", "label": "0.32"}, {"id": "d", "label": "0.52"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.73 - 0.5 = ?$tl$, $tl$[{"id": "a", "label": "0.33"}, {"id": "b", "label": "2.3"}, {"id": "c", "label": "0.73"}, {"id": "d", "label": "0.23"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$1.45 x 0.5 = ?$tl$, $tl$[{"id": "a", "label": "0.725"}, {"id": "b", "label": "7.25"}, {"id": "c", "label": "1.45"}, {"id": "d", "label": "0.625"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2.74 - 0.05 = ?$tl$, $tl$[{"id": "a", "label": "2.59"}, {"id": "b", "label": "2.79"}, {"id": "c", "label": "2.74"}, {"id": "d", "label": "2.69"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$2.92 x 0.04 = ?$tl$, $tl$[{"id": "a", "label": "0.0168"}, {"id": "b", "label": "0.1168"}, {"id": "c", "label": "0.2168"}, {"id": "d", "label": "1.168"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$0.33 x 0.3 = ?$tl$, $tl$[{"id": "a", "label": "0.99"}, {"id": "b", "label": "0.099"}, {"id": "c", "label": "0.199"}, {"id": "d", "label": "-0.001"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$decimal-operations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] GCF & LCM (6.NS.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$gcf-lcm$tl$, $tl$GCF & LCM$tl$, $tl$The GCF is the biggest factor two numbers share; the LCM is the smallest multiple they share.$tl$, 6, $tl$6.NS.B.4$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: GCF & LCM$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: GCF & LCM", "body": "The GCF is the biggest factor two numbers share; the LCM is the smallest multiple they share."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the LCM (least common multiple) of 4 and 5?\n\nThe answer is \"20\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the LCM (least common multiple) of 10 and 11?\n\nThe answer is \"110\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the LCM (least common multiple) of 2 and 6?\n\nThe answer is \"6\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the GCF (greatest common factor) of 9 and 16?\n\nThe answer is 1."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the GCF (greatest common factor) of 10 and 20?\n\nThe answer is 10."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the LCM (least common multiple) of 4 and 13?\n\nThe answer is 52."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about GCF & LCM! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 8 and 3?$tl$, null, $tl$1$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 3 and 3?$tl$, null, $tl$3$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 9 and 5?$tl$, null, $tl$45$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 3 and 6?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 3 and 6?$tl$, null, $tl$6$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 12 and 13?$tl$, null, $tl$156$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 20 and 9?$tl$, null, $tl$180$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 20 and 8?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 13 and 20?$tl$, null, $tl$260$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 14 and 9?$tl$, null, $tl$126$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 7 and 23?$tl$, null, $tl$161$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 36 and 18?$tl$, null, $tl$18$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 22 and 37?$tl$, null, $tl$1$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 24 and 15?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 10 and 9?$tl$, null, $tl$90$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 9 and 69?$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 32 and 60?$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 55 and 44?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the LCM (least common multiple) of 65 and 8?$tl$, null, $tl$520$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the GCF (greatest common factor) of 61 and 17?$tl$, null, $tl$1$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$gcf-lcm$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Integers & Absolute Value (6.NS.C.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$integers$tl$, $tl$Integers & Absolute Value$tl$, $tl$Integers include negative numbers; absolute value is a number's distance from zero.$tl$, 6, $tl$6.NS.C.5$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Integers & Absolute Value$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Integers & Absolute Value", "body": "Integers include negative numbers; absolute value is a number's distance from zero."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the absolute value |-2| ?\n\nThe answer is \"2\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the absolute value |-8| ?\n\nThe answer is \"8\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the absolute value |-9| ?\n\nThe answer is \"9\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the absolute value |-5| ?\n\nThe answer is 5."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the absolute value |-14| ?\n\nThe answer is 14."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is 18 - 17 - 17 ?\n\nThe answer is -16."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Integers & Absolute Value! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -5 + 1 ?$tl$, null, $tl$-4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -2 + 1 ?$tl$, null, $tl$-1$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 3 - 5 - 5 ?$tl$, null, $tl$-7$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 4 - 7 - 7 ?$tl$, null, $tl$-10$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -5 + 7 ?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -11 + 2 ?$tl$, null, $tl$-9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the absolute value |-7| ?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 5 - 1 - 1 ?$tl$, null, $tl$3$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the absolute value |-2| ?$tl$, null, $tl$2$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -3 + 5 ?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 11 - 23 - 23 ?$tl$, null, $tl$-35$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the absolute value |-8| ?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the absolute value |-40| ?$tl$, null, $tl$40$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 14 - 10 - 10 ?$tl$, null, $tl$-6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -7 + 25 ?$tl$, null, $tl$18$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 77 - 25 - 25 ?$tl$, null, $tl$27$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -12 + 39 ?$tl$, null, $tl$27$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the absolute value |-63| ?$tl$, null, $tl$63$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 47 - 2 - 2 ?$tl$, null, $tl$43$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is -34 + 63 ?$tl$, null, $tl$29$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$integers$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Exponents (6.EE.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$exponents$tl$, $tl$Exponents$tl$, $tl$An exponent tells how many times to multiply a base by itself, like 2^3 = 8.$tl$, 6, $tl$6.EE.A.1$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Exponents$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Exponents", "body": "An exponent tells how many times to multiply a base by itself, like 2^3 = 8."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is 6^2 (that is 6 to the power 2)?\n\nThe answer is \"36\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is 7^2 (that is 7 to the power 2)?\n\nThe answer is \"49\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is 5^2 (that is 5 to the power 2)?\n\nThe answer is \"25\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is 12^2 (that is 12 to the power 2)?\n\nThe answer is 144."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is 9^2 (that is 9 to the power 2)?\n\nThe answer is 81."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is 11^2 (that is 11 to the power 2)?\n\nThe answer is 121."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Exponents! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 7^2 (that is 7 to the power 2)?$tl$, null, $tl$49$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 3^2 (that is 3 to the power 2)?$tl$, null, $tl$9$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 2^2 (that is 2 to the power 2)?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 4^2 (that is 4 to the power 2)?$tl$, null, $tl$16$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 6^2 (that is 6 to the power 2)?$tl$, null, $tl$36$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 10^2 (that is 10 to the power 2)?$tl$, null, $tl$100$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 8^2 (that is 8 to the power 2)?$tl$, null, $tl$64$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 12^2 (that is 12 to the power 2)?$tl$, null, $tl$144$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 9^2 (that is 9 to the power 2)?$tl$, null, $tl$81$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 11^2 (that is 11 to the power 2)?$tl$, null, $tl$121$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 5^3 (that is 5 to the power 3)?$tl$, null, $tl$125$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 2^3 (that is 2 to the power 3)?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 7^3 (that is 7 to the power 3)?$tl$, null, $tl$343$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 6^3 (that is 6 to the power 3)?$tl$, null, $tl$216$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 4^3 (that is 4 to the power 3)?$tl$, null, $tl$64$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 3^4 (that is 3 to the power 4)?$tl$, null, $tl$81$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 3^5 (that is 3 to the power 5)?$tl$, null, $tl$243$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 8^3 (that is 8 to the power 3)?$tl$, null, $tl$512$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 4^4 (that is 4 to the power 4)?$tl$, null, $tl$256$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is 2^5 (that is 2 to the power 5)?$tl$, null, $tl$32$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponents$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Evaluating Expressions (6.EE.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$evaluate-expressions$tl$, $tl$Evaluating Expressions$tl$, $tl$Substitute the given value for the variable, then follow the order of operations.$tl$, 6, $tl$6.EE.A.2$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Evaluating Expressions$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Evaluating Expressions", "body": "Substitute the given value for the variable, then follow the order of operations."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Evaluate 4x + 7 when x = 7.\n\nThe answer is \"35\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Evaluate 4x + 7 when x = 5.\n\nThe answer is \"27\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Evaluate 5x + 3 when x = 9.\n\nThe answer is \"48\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Evaluate 4x - 9 when x = 10.\n\nThe answer is 31."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Evaluate 7x - 3 when x = 10.\n\nThe answer is 67."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Evaluate 6x - 5 when x = 4.\n\nThe answer is 19."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Evaluating Expressions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x + 8 when x = 3.$tl$, null, $tl$17$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 6x + 9 when x = 7.$tl$, null, $tl$51$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x + 3 when x = 8.$tl$, null, $tl$27$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x + 4 when x = 5.$tl$, null, $tl$19$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 4x + 5 when x = 6.$tl$, null, $tl$29$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 4x - 1 when x = 6.$tl$, null, $tl$23$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 2x - 4 when x = 12.$tl$, null, $tl$20$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 8x - 4 when x = 12.$tl$, null, $tl$92$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 5x - 4 when x = 12.$tl$, null, $tl$56$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 4x - 3 when x = 4.$tl$, null, $tl$13$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x + 3y when x = 9 and y = 7.$tl$, null, $tl$48$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 5x + 3y when x = 7 and y = 7.$tl$, null, $tl$56$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 6x + 3y when x = 4 and y = 7.$tl$, null, $tl$45$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 4x + 4y when x = 7 and y = 4.$tl$, null, $tl$44$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 5x + 5y when x = 2 and y = 7.$tl$, null, $tl$45$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 4x^2 + 3 when x = 6.$tl$, null, $tl$147$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x^2 + 1 when x = 6.$tl$, null, $tl$109$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 2x^2 + 6 when x = 6.$tl$, null, $tl$78$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 3x^2 + 7 when x = 6.$tl$, null, $tl$115$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Evaluate 5x^2 + 3 when x = 3.$tl$, null, $tl$48$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$evaluate-expressions$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] One-Step Equations (6.EE.B.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$one-step-equations$tl$, $tl$One-Step Equations$tl$, $tl$Use the inverse operation to get the variable by itself and solve.$tl$, 6, $tl$6.EE.B.7$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: One-Step Equations$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: One-Step Equations", "body": "Use the inverse operation to get the variable by itself and solve."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Solve for x:  x + 4 = 17\n\nThe answer is \"13\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Solve for x:  x + 12 = 17\n\nThe answer is \"5\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Solve for x:  x + 7 = 17\n\nThe answer is \"10\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Solve for x:  x - 5 = 12\n\nThe answer is 17."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Solve for x:  x - 14 = -11\n\nThe answer is 3."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Solve for x:  x - 18 = 0\n\nThe answer is 18."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about One-Step Equations! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x + 3 = 16$tl$, null, $tl$13$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x + 8 = 13$tl$, null, $tl$5$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x + 5 = 14$tl$, null, $tl$9$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x + 5 = 9$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x + 3 = 9$tl$, null, $tl$6$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x - 18 = -12$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x - 10 = 8$tl$, null, $tl$18$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x - 19 = -11$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x - 9 = 0$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x - 20 = -1$tl$, null, $tl$19$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  6x = 42$tl$, null, $tl$7$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  8x = 80$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  4x = 48$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  7x = 56$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  8x = 48$tl$, null, $tl$6$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x / 6 = 6$tl$, null, $tl$36$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x / 6 = 9$tl$, null, $tl$54$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x / 3 = 4$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x / 4 = 7$tl$, null, $tl$28$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Solve for x:  x / 4 = 6$tl$, null, $tl$24$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$one-step-equations$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Cells (MS-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$cells$tl$, $tl$Cells$tl$, $tl$Cells are the basic building blocks of all living things; some have specialized parts.$tl$, 6, $tl$MS-LS1-1$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Cells$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Cells", "body": "Cells are the basic building blocks of all living things; some have specialized parts."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The basic building block of all living things is the:\n\nThe answer is \"cell\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Living things made of many cells are called:\n\nThe answer is \"multicellular\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A living thing made of only one cell is:\n\nThe answer is \"unicellular\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The part of the cell that controls its activities is the:", "choices": [{"id": "a", "label": "nucleus"}, {"id": "b", "label": "cell wall"}, {"id": "c", "label": "vacuole"}, {"id": "d", "label": "ribosome"}], "answer": "a", "explanation": "Yes! The answer is \"nucleus\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Plant cells have a stiff outer layer that animal cells lack, the:", "choices": [{"id": "a", "label": "nucleus"}, {"id": "b", "label": "cytoplasm"}, {"id": "c", "label": "membrane"}, {"id": "d", "label": "cell wall"}], "answer": "d", "explanation": "Yes! The answer is \"cell wall\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The thin layer that controls what enters and leaves a cell is the:", "choices": [{"id": "a", "label": "cell wall"}, {"id": "b", "label": "nucleus"}, {"id": "c", "label": "cell membrane"}, {"id": "d", "label": "vacuole"}], "answer": "c", "explanation": "Yes! The answer is \"cell membrane\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Cells! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The basic building block of all living things is the:$tl$, $tl$[{"id": "a", "label": "atom"}, {"id": "b", "label": "molecule"}, {"id": "c", "label": "organ"}, {"id": "d", "label": "cell"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Living things made of many cells are called:$tl$, $tl$[{"id": "a", "label": "unicellular"}, {"id": "b", "label": "multicellular"}, {"id": "c", "label": "nonliving"}, {"id": "d", "label": "atoms"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A living thing made of only one cell is:$tl$, $tl$[{"id": "a", "label": "multicellular"}, {"id": "b", "label": "an organ"}, {"id": "c", "label": "a tissue"}, {"id": "d", "label": "unicellular"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The part of the cell that controls its activities is the:$tl$, $tl$[{"id": "a", "label": "cell wall"}, {"id": "b", "label": "vacuole"}, {"id": "c", "label": "ribosome"}, {"id": "d", "label": "nucleus"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Plant cells have a stiff outer layer that animal cells lack, the:$tl$, $tl$[{"id": "a", "label": "nucleus"}, {"id": "b", "label": "cytoplasm"}, {"id": "c", "label": "membrane"}, {"id": "d", "label": "cell wall"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The thin layer that controls what enters and leaves a cell is the:$tl$, $tl$[{"id": "a", "label": "cell wall"}, {"id": "b", "label": "nucleus"}, {"id": "c", "label": "cell membrane"}, {"id": "d", "label": "vacuole"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Green organelles where plant cells make food are:$tl$, $tl$[{"id": "a", "label": "mitochondria"}, {"id": "b", "label": "chloroplasts"}, {"id": "c", "label": "nuclei"}, {"id": "d", "label": "vacuoles"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The 'powerhouses' that release energy from food are:$tl$, $tl$[{"id": "a", "label": "chloroplasts"}, {"id": "b", "label": "ribosomes"}, {"id": "c", "label": "mitochondria"}, {"id": "d", "label": "vacuoles"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A group of similar cells working together forms a:$tl$, $tl$[{"id": "a", "label": "organ"}, {"id": "b", "label": "organism"}, {"id": "c", "label": "molecule"}, {"id": "d", "label": "tissue"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Organs working together form an:$tl$, $tl$[{"id": "a", "label": "a single cell"}, {"id": "b", "label": "organ system"}, {"id": "c", "label": "a tissue only"}, {"id": "d", "label": "an atom"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which can you NOT see with your eyes alone, needing a microscope?$tl$, $tl$[{"id": "a", "label": "most cells"}, {"id": "b", "label": "a tree"}, {"id": "c", "label": "a dog"}, {"id": "d", "label": "a hand"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The jelly-like fluid filling a cell is the:$tl$, $tl$[{"id": "a", "label": "nucleus"}, {"id": "b", "label": "membrane"}, {"id": "c", "label": "wall"}, {"id": "d", "label": "cytoplasm"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Both plant and animal cells have a:$tl$, $tl$[{"id": "a", "label": "cell wall"}, {"id": "b", "label": "chloroplasts"}, {"id": "c", "label": "no parts"}, {"id": "d", "label": "nucleus and cell membrane"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Cells come from:$tl$, $tl$[{"id": "a", "label": "nonliving rocks"}, {"id": "b", "label": "thin air"}, {"id": "c", "label": "other living cells"}, {"id": "d", "label": "sunlight only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The correct order from smallest to largest is:$tl$, $tl$[{"id": "a", "label": "organ, cell, tissue"}, {"id": "b", "label": "tissue, cell, organ"}, {"id": "c", "label": "organ system, organ, cell"}, {"id": "d", "label": "cell, tissue, organ, organ system"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The basic unit of life is the ____. (one word)$tl$, null, $tl$cell$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A vacuole in a cell is used mainly to:$tl$, $tl$[{"id": "a", "label": "store water and materials"}, {"id": "b", "label": "release energy"}, {"id": "c", "label": "make the cell wall"}, {"id": "d", "label": "control the cell"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Plant cells differ from animal cells because plant cells have:$tl$, $tl$[{"id": "a", "label": "a nucleus"}, {"id": "b", "label": "a cell wall and chloroplasts"}, {"id": "c", "label": "cytoplasm"}, {"id": "d", "label": "a membrane"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Why are mitochondria important to a cell?$tl$, $tl$[{"id": "a", "label": "they store the nucleus"}, {"id": "b", "label": "they provide usable energy"}, {"id": "c", "label": "they make sunlight"}, {"id": "d", "label": "they are the cell wall"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The idea that all living things are made of cells is part of the:$tl$, $tl$[{"id": "a", "label": "cell theory"}, {"id": "b", "label": "rock cycle"}, {"id": "c", "label": "food web"}, {"id": "d", "label": "water cycle"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$cells$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Body Systems (MS-LS1-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$body-systems$tl$, $tl$Body Systems$tl$, $tl$The body's organ systems work together to keep an organism alive and healthy.$tl$, 6, $tl$MS-LS1-3$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Body Systems$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Body Systems", "body": "The body's organ systems work together to keep an organism alive and healthy."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The system that pumps blood through the body is the:\n\nThe answer is \"circulatory system\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The system that breaks down food into nutrients is the:\n\nThe answer is \"digestive system\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The system that takes in oxygen and removes carbon dioxide is the:\n\nThe answer is \"respiratory system\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Bones that support and protect the body make up the:", "choices": [{"id": "a", "label": "muscular system"}, {"id": "b", "label": "skeletal system"}, {"id": "c", "label": "nervous system"}, {"id": "d", "label": "digestive system"}], "answer": "b", "explanation": "Yes! The answer is \"skeletal system\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Muscles that let the body move are part of the:", "choices": [{"id": "a", "label": "skeletal system"}, {"id": "b", "label": "muscular system"}, {"id": "c", "label": "nervous system"}, {"id": "d", "label": "circulatory system"}], "answer": "b", "explanation": "Yes! The answer is \"muscular system\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The brain, spinal cord, and nerves form the:", "choices": [{"id": "a", "label": "circulatory system"}, {"id": "b", "label": "digestive system"}, {"id": "c", "label": "respiratory system"}, {"id": "d", "label": "nervous system"}], "answer": "d", "explanation": "Yes! The answer is \"nervous system\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Body Systems! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The system that pumps blood through the body is the:$tl$, $tl$[{"id": "a", "label": "digestive system"}, {"id": "b", "label": "nervous system"}, {"id": "c", "label": "skeletal system"}, {"id": "d", "label": "circulatory system"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The system that breaks down food into nutrients is the:$tl$, $tl$[{"id": "a", "label": "digestive system"}, {"id": "b", "label": "respiratory system"}, {"id": "c", "label": "skeletal system"}, {"id": "d", "label": "muscular system"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The system that takes in oxygen and removes carbon dioxide is the:$tl$, $tl$[{"id": "a", "label": "digestive system"}, {"id": "b", "label": "nervous system"}, {"id": "c", "label": "skeletal system"}, {"id": "d", "label": "respiratory system"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Bones that support and protect the body make up the:$tl$, $tl$[{"id": "a", "label": "muscular system"}, {"id": "b", "label": "skeletal system"}, {"id": "c", "label": "nervous system"}, {"id": "d", "label": "digestive system"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Muscles that let the body move are part of the:$tl$, $tl$[{"id": "a", "label": "skeletal system"}, {"id": "b", "label": "nervous system"}, {"id": "c", "label": "muscular system"}, {"id": "d", "label": "circulatory system"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The brain, spinal cord, and nerves form the:$tl$, $tl$[{"id": "a", "label": "nervous system"}, {"id": "b", "label": "circulatory system"}, {"id": "c", "label": "digestive system"}, {"id": "d", "label": "respiratory system"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The organ that pumps blood is the:$tl$, $tl$[{"id": "a", "label": "lungs"}, {"id": "b", "label": "stomach"}, {"id": "c", "label": "brain"}, {"id": "d", "label": "heart"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The main organs for breathing are the:$tl$, $tl$[{"id": "a", "label": "kidneys"}, {"id": "b", "label": "stomach"}, {"id": "c", "label": "heart"}, {"id": "d", "label": "lungs"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Blood carries oxygen and nutrients to the body's:$tl$, $tl$[{"id": "a", "label": "cells"}, {"id": "b", "label": "bones only"}, {"id": "c", "label": "brain only"}, {"id": "d", "label": "skin only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The system that controls and coordinates the body is the:$tl$, $tl$[{"id": "a", "label": "nervous system"}, {"id": "b", "label": "skeletal system"}, {"id": "c", "label": "muscular system"}, {"id": "d", "label": "digestive system"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The skeletal and muscular systems work together to allow:$tl$, $tl$[{"id": "a", "label": "movement"}, {"id": "b", "label": "digestion"}, {"id": "c", "label": "breathing only"}, {"id": "d", "label": "thinking only"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Where does most absorption of nutrients happen?$tl$, $tl$[{"id": "a", "label": "the lungs"}, {"id": "b", "label": "the small intestine"}, {"id": "c", "label": "the heart"}, {"id": "d", "label": "the brain"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The respiratory and circulatory systems work together to deliver:$tl$, $tl$[{"id": "a", "label": "bones to muscles"}, {"id": "b", "label": "food to the brain only"}, {"id": "c", "label": "light to the eyes"}, {"id": "d", "label": "oxygen to cells"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The organ that filters waste from the blood is the:$tl$, $tl$[{"id": "a", "label": "kidney"}, {"id": "b", "label": "lung"}, {"id": "c", "label": "heart"}, {"id": "d", "label": "stomach"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Body systems are made of organs, which are made of:$tl$, $tl$[{"id": "a", "label": "atoms only"}, {"id": "b", "label": "tissues and cells"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "minerals"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The body system that pumps blood is the ____ system. (one word)$tl$, null, $tl$circulatory$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When you exercise, your heart beats faster to:$tl$, $tl$[{"id": "a", "label": "digest food faster"}, {"id": "b", "label": "grow bones"}, {"id": "c", "label": "cool the brain only"}, {"id": "d", "label": "deliver more oxygen to muscles"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The nervous system sends signals using:$tl$, $tl$[{"id": "a", "label": "blood vessels only"}, {"id": "b", "label": "nerves"}, {"id": "c", "label": "bones"}, {"id": "d", "label": "muscles only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which two systems most directly work together when you run?$tl$, $tl$[{"id": "a", "label": "digestive and nervous"}, {"id": "b", "label": "none"}, {"id": "c", "label": "only the skin"}, {"id": "d", "label": "muscular and skeletal"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Organ systems work together to keep the body:$tl$, $tl$[{"id": "a", "label": "asleep"}, {"id": "b", "label": "cold"}, {"id": "c", "label": "still"}, {"id": "d", "label": "alive and balanced"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$body-systems$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Ecosystems & Energy (MS-LS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$ecosystems-and-energy$tl$, $tl$Ecosystems & Energy$tl$, $tl$Energy flows and matter cycles through producers, consumers, and decomposers.$tl$, 6, $tl$MS-LS2-3$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Ecosystems & Energy$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Ecosystems & Energy", "body": "Energy flows and matter cycles through producers, consumers, and decomposers."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Energy enters most ecosystems from the:\n\nThe answer is \"Sun\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Organisms that make their own food are:\n\nThe answer is \"producers\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Organisms that eat other organisms are:\n\nThe answer is \"consumers\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Organisms that break down dead matter are:", "choices": [{"id": "a", "label": "producers"}, {"id": "b", "label": "decomposers"}, {"id": "c", "label": "predators"}, {"id": "d", "label": "herbivores"}], "answer": "b", "explanation": "Yes! The answer is \"decomposers\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In a food chain, arrows show the flow of:", "choices": [{"id": "a", "label": "energy"}, {"id": "b", "label": "water"}, {"id": "c", "label": "air"}, {"id": "d", "label": "money"}], "answer": "a", "explanation": "Yes! The answer is \"energy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "At each step of a food chain, most energy is lost as:", "choices": [{"id": "a", "label": "matter"}, {"id": "b", "label": "light"}, {"id": "c", "label": "heat"}, {"id": "d", "label": "sound"}], "answer": "c", "explanation": "Yes! The answer is \"heat\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Ecosystems & Energy! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Energy enters most ecosystems from the:$tl$, $tl$[{"id": "a", "label": "soil"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Organisms that make their own food are:$tl$, $tl$[{"id": "a", "label": "consumers"}, {"id": "b", "label": "decomposers"}, {"id": "c", "label": "producers"}, {"id": "d", "label": "predators"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Organisms that eat other organisms are:$tl$, $tl$[{"id": "a", "label": "producers"}, {"id": "b", "label": "consumers"}, {"id": "c", "label": "minerals"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Organisms that break down dead matter are:$tl$, $tl$[{"id": "a", "label": "producers"}, {"id": "b", "label": "predators"}, {"id": "c", "label": "herbivores"}, {"id": "d", "label": "decomposers"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$In a food chain, arrows show the flow of:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "air"}, {"id": "c", "label": "money"}, {"id": "d", "label": "energy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$At each step of a food chain, most energy is lost as:$tl$, $tl$[{"id": "a", "label": "matter"}, {"id": "b", "label": "light"}, {"id": "c", "label": "heat"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Because energy is lost at each level, top predators are usually:$tl$, $tl$[{"id": "a", "label": "fewer in number"}, {"id": "b", "label": "more numerous"}, {"id": "c", "label": "plants"}, {"id": "d", "label": "decomposers"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A diagram showing many connected food chains is a:$tl$, $tl$[{"id": "a", "label": "water cycle"}, {"id": "b", "label": "rock cycle"}, {"id": "c", "label": "food web"}, {"id": "d", "label": "timeline"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The role an organism plays in its ecosystem is its:$tl$, $tl$[{"id": "a", "label": "niche"}, {"id": "b", "label": "habitat only"}, {"id": "c", "label": "name"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two species competing for the same limited resource shows:$tl$, $tl$[{"id": "a", "label": "cooperation only"}, {"id": "b", "label": "decomposition"}, {"id": "c", "label": "photosynthesis"}, {"id": "d", "label": "competition"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Removing a keystone species can cause an ecosystem to:$tl$, $tl$[{"id": "a", "label": "change dramatically"}, {"id": "b", "label": "stay exactly the same"}, {"id": "c", "label": "gain energy"}, {"id": "d", "label": "make sunlight"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Matter such as carbon and water is:$tl$, $tl$[{"id": "a", "label": "created each day"}, {"id": "b", "label": "destroyed"}, {"id": "c", "label": "only in plants"}, {"id": "d", "label": "cycled through ecosystems"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A relationship where both species benefit is:$tl$, $tl$[{"id": "a", "label": "mutualism"}, {"id": "b", "label": "competition"}, {"id": "c", "label": "predation"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If producers disappeared, consumers would:$tl$, $tl$[{"id": "a", "label": "thrive"}, {"id": "b", "label": "become producers"}, {"id": "c", "label": "lose their energy source"}, {"id": "d", "label": "make their own food"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An energy pyramid is widest at the:$tl$, $tl$[{"id": "a", "label": "bottom (producers)"}, {"id": "b", "label": "top (predators)"}, {"id": "c", "label": "middle"}, {"id": "d", "label": "it is even"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Organisms that make their own food are called ____. (one word)$tl$, null, $tl$producers$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Decomposers are important because they:$tl$, $tl$[{"id": "a", "label": "produce sunlight"}, {"id": "b", "label": "eat only producers"}, {"id": "c", "label": "recycle nutrients into the soil"}, {"id": "d", "label": "make rocks"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The amount of available energy decreases as you move:$tl$, $tl$[{"id": "a", "label": "down the food chain"}, {"id": "b", "label": "into producers"}, {"id": "c", "label": "up the food chain"}, {"id": "d", "label": "into the Sun"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A change in one part of an ecosystem usually:$tl$, $tl$[{"id": "a", "label": "affects nothing"}, {"id": "b", "label": "stops the Sun"}, {"id": "c", "label": "affects other parts"}, {"id": "d", "label": "creates matter"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which is the ultimate source of energy for a forest ecosystem?$tl$, $tl$[{"id": "a", "label": "the biggest tree"}, {"id": "b", "label": "decomposers"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$ecosystems-and-energy$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Weather & Climate (MS-ESS2-5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$weather-and-climate$tl$, $tl$Weather & Climate$tl$, $tl$Weather is short-term; climate is long-term. Both depend on the atmosphere and oceans.$tl$, 6, $tl$MS-ESS2-5$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Weather & Climate$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Weather & Climate", "body": "Weather is short-term; climate is long-term. Both depend on the atmosphere and oceans."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Weather is the condition of the atmosphere:\n\nThe answer is \"over a short time\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Climate is the typical weather of a place:\n\nThe answer is \"over many years\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Most weather happens in the lowest layer of the atmosphere, the:\n\nThe answer is \"troposphere\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Warm air tends to:", "choices": [{"id": "a", "label": "rise"}, {"id": "b", "label": "sink"}, {"id": "c", "label": "stay still"}, {"id": "d", "label": "freeze"}], "answer": "a", "explanation": "Yes! The answer is \"rise\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A large body of air with similar temperature and humidity is an:", "choices": [{"id": "a", "label": "ocean current"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "rock layer"}, {"id": "d", "label": "air mass"}], "answer": "d", "explanation": "Yes! The answer is \"air mass\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The boundary where two air masses meet is a:", "choices": [{"id": "a", "label": "coast"}, {"id": "b", "label": "front"}, {"id": "c", "label": "fault"}, {"id": "d", "label": "crater"}], "answer": "b", "explanation": "Yes! The answer is \"front\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Weather & Climate! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Weather is the condition of the atmosphere:$tl$, $tl$[{"id": "a", "label": "over a short time"}, {"id": "b", "label": "over many years"}, {"id": "c", "label": "in space"}, {"id": "d", "label": "underground"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Climate is the typical weather of a place:$tl$, $tl$[{"id": "a", "label": "right now"}, {"id": "b", "label": "for one hour"}, {"id": "c", "label": "on the Moon"}, {"id": "d", "label": "over many years"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Most weather happens in the lowest layer of the atmosphere, the:$tl$, $tl$[{"id": "a", "label": "stratosphere"}, {"id": "b", "label": "troposphere"}, {"id": "c", "label": "mesosphere"}, {"id": "d", "label": "exosphere"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Warm air tends to:$tl$, $tl$[{"id": "a", "label": "sink"}, {"id": "b", "label": "stay still"}, {"id": "c", "label": "freeze"}, {"id": "d", "label": "rise"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A large body of air with similar temperature and humidity is an:$tl$, $tl$[{"id": "a", "label": "ocean current"}, {"id": "b", "label": "air mass"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "rock layer"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The boundary where two air masses meet is a:$tl$, $tl$[{"id": "a", "label": "front"}, {"id": "b", "label": "coast"}, {"id": "c", "label": "fault"}, {"id": "d", "label": "crater"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Water vapor turning into liquid in clouds is:$tl$, $tl$[{"id": "a", "label": "condensation"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "precipitation"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Areas near the equator generally have a ____ climate.$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "polar"}, {"id": "c", "label": "freezing"}, {"id": "d", "label": "snowy"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Oceans affect climate because water:$tl$, $tl$[{"id": "a", "label": "has no effect"}, {"id": "b", "label": "is always frozen"}, {"id": "c", "label": "heats and cools slowly"}, {"id": "d", "label": "blocks the Sun"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$High humidity means the air contains a lot of:$tl$, $tl$[{"id": "a", "label": "water vapor"}, {"id": "b", "label": "oxygen only"}, {"id": "c", "label": "dust"}, {"id": "d", "label": "carbon"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which instrument measures air pressure?$tl$, $tl$[{"id": "a", "label": "thermometer"}, {"id": "b", "label": "anemometer"}, {"id": "c", "label": "rain gauge"}, {"id": "d", "label": "barometer"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Wind is mainly caused by differences in:$tl$, $tl$[{"id": "a", "label": "the time of day"}, {"id": "b", "label": "the Moon"}, {"id": "c", "label": "air pressure"}, {"id": "d", "label": "ocean color"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Mountains can affect climate by causing rain on one side and a ____ on the other.$tl$, $tl$[{"id": "a", "label": "second ocean"}, {"id": "b", "label": "dry 'rain shadow'"}, {"id": "c", "label": "volcano"}, {"id": "d", "label": "glacier always"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The greenhouse effect warms Earth by trapping:$tl$, $tl$[{"id": "a", "label": "sunlight as matter"}, {"id": "b", "label": "wind"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "heat with certain gases"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Long-term warming of Earth's average temperature is called:$tl$, $tl$[{"id": "a", "label": "a cold front"}, {"id": "b", "label": "a sea breeze"}, {"id": "c", "label": "a season"}, {"id": "d", "label": "climate change / global warming"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The day-to-day state of the atmosphere is called ____. (one word)$tl$, null, $tl$weather$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A meteorologist uses data and models to:$tl$, $tl$[{"id": "a", "label": "predict the weather"}, {"id": "b", "label": "change the climate"}, {"id": "c", "label": "stop storms"}, {"id": "d", "label": "make rain on demand"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which factor does NOT strongly affect a region's climate?$tl$, $tl$[{"id": "a", "label": "latitude"}, {"id": "b", "label": "elevation"}, {"id": "c", "label": "nearness to oceans"}, {"id": "d", "label": "the day of the week"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Latitude affects climate because it changes how much ____ a place receives.$tl$, $tl$[{"id": "a", "label": "direct sunlight"}, {"id": "b", "label": "wind only"}, {"id": "c", "label": "rain only"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Climate is described using long-term patterns of temperature and:$tl$, $tl$[{"id": "a", "label": "traffic"}, {"id": "b", "label": "population"}, {"id": "c", "label": "precipitation"}, {"id": "d", "label": "time zones"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-and-climate$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Plate Tectonics (MS-ESS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plate-tectonics$tl$, $tl$Plate Tectonics$tl$, $tl$Earth's plates move slowly, shaping continents and causing earthquakes and volcanoes.$tl$, 6, $tl$MS-ESS2-3$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plate Tectonics$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Plate Tectonics", "body": "Earth's plates move slowly, shaping continents and causing earthquakes and volcanoes."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Earth's outer shell is broken into large pieces called:\n\nThe answer is \"tectonic plates\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Tectonic plates float and move slowly on the:\n\nThe answer is \"mantle\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Where two plates pull apart, new crust can form. This is a:\n\nThe answer is \"divergent boundary\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Where two plates push together is a:", "choices": [{"id": "a", "label": "divergent boundary"}, {"id": "b", "label": "transform boundary"}, {"id": "c", "label": "valley"}, {"id": "d", "label": "convergent boundary"}], "answer": "d", "explanation": "Yes! The answer is \"convergent boundary\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Where two plates slide past each other is a:", "choices": [{"id": "a", "label": "divergent boundary"}, {"id": "b", "label": "transform boundary"}, {"id": "c", "label": "convergent boundary"}, {"id": "d", "label": "trench"}], "answer": "b", "explanation": "Yes! The answer is \"transform boundary\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Most earthquakes and volcanoes occur:", "choices": [{"id": "a", "label": "in the middle of plates only"}, {"id": "b", "label": "in the sky"}, {"id": "c", "label": "near plate boundaries"}, {"id": "d", "label": "underwater only"}], "answer": "c", "explanation": "Yes! The answer is \"near plate boundaries\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plate Tectonics! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Earth's outer shell is broken into large pieces called:$tl$, $tl$[{"id": "a", "label": "tectonic plates"}, {"id": "b", "label": "continents only"}, {"id": "c", "label": "oceans"}, {"id": "d", "label": "craters"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Tectonic plates float and move slowly on the:$tl$, $tl$[{"id": "a", "label": "mantle"}, {"id": "b", "label": "core"}, {"id": "c", "label": "crust top"}, {"id": "d", "label": "atmosphere"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Where two plates pull apart, new crust can form. This is a:$tl$, $tl$[{"id": "a", "label": "divergent boundary"}, {"id": "b", "label": "convergent boundary"}, {"id": "c", "label": "transform boundary"}, {"id": "d", "label": "plateau"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Where two plates push together is a:$tl$, $tl$[{"id": "a", "label": "divergent boundary"}, {"id": "b", "label": "transform boundary"}, {"id": "c", "label": "convergent boundary"}, {"id": "d", "label": "valley"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Where two plates slide past each other is a:$tl$, $tl$[{"id": "a", "label": "divergent boundary"}, {"id": "b", "label": "transform boundary"}, {"id": "c", "label": "convergent boundary"}, {"id": "d", "label": "trench"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Most earthquakes and volcanoes occur:$tl$, $tl$[{"id": "a", "label": "near plate boundaries"}, {"id": "b", "label": "in the middle of plates only"}, {"id": "c", "label": "in the sky"}, {"id": "d", "label": "underwater only"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Mountains can form when two plates:$tl$, $tl$[{"id": "a", "label": "pull apart fully"}, {"id": "b", "label": "stop existing"}, {"id": "c", "label": "collide and push up the crust"}, {"id": "d", "label": "melt instantly"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The idea that continents were once joined and have drifted is:$tl$, $tl$[{"id": "a", "label": "continental drift"}, {"id": "b", "label": "the rock cycle"}, {"id": "c", "label": "the water cycle"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Heat from Earth's interior drives slow movement called:$tl$, $tl$[{"id": "a", "label": "convection currents"}, {"id": "b", "label": "evaporation"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A sudden release of energy in the crust causes an:$tl$, $tl$[{"id": "a", "label": "earthquake"}, {"id": "b", "label": "eclipse"}, {"id": "c", "label": "aurora"}, {"id": "d", "label": "tide"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Melted rock beneath the surface is called:$tl$, $tl$[{"id": "a", "label": "magma"}, {"id": "b", "label": "lava only"}, {"id": "c", "label": "sediment"}, {"id": "d", "label": "fossil"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When magma reaches the surface it is called:$tl$, $tl$[{"id": "a", "label": "lava"}, {"id": "b", "label": "sediment"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "ash only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Deep ocean trenches often form where one plate:$tl$, $tl$[{"id": "a", "label": "rises into the air"}, {"id": "b", "label": "sinks beneath another (subduction)"}, {"id": "c", "label": "disappears"}, {"id": "d", "label": "stops moving forever"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Evidence for plate tectonics includes matching fossils on:$tl$, $tl$[{"id": "a", "label": "the Moon"}, {"id": "b", "label": "one mountain"}, {"id": "c", "label": "different continents"}, {"id": "d", "label": "the same beach only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Plates move at about the speed that your:$tl$, $tl$[{"id": "a", "label": "car drives"}, {"id": "b", "label": "heart beats"}, {"id": "c", "label": "eyes blink"}, {"id": "d", "label": "fingernails grow"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Earth's crust is broken into moving pieces called tectonic ____. (one word)$tl$, null, $tl$plates$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The Ring of Fire around the Pacific is known for many:$tl$, $tl$[{"id": "a", "label": "deserts"}, {"id": "b", "label": "volcanoes and earthquakes"}, {"id": "c", "label": "glaciers"}, {"id": "d", "label": "forests"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A fault is a:$tl$, $tl$[{"id": "a", "label": "crack in Earth's crust where movement happens"}, {"id": "b", "label": "type of cloud"}, {"id": "c", "label": "ocean current"}, {"id": "d", "label": "planet"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Sea-floor spreading creates new ocean crust at:$tl$, $tl$[{"id": "a", "label": "beaches"}, {"id": "b", "label": "mountain tops"}, {"id": "c", "label": "river deltas"}, {"id": "d", "label": "mid-ocean ridges"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The slow movement of plates over millions of years can:$tl$, $tl$[{"id": "a", "label": "reshape continents and oceans"}, {"id": "b", "label": "change the weather hourly"}, {"id": "c", "label": "stop gravity"}, {"id": "d", "label": "create stars"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] The Rock Cycle (MS-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rock-cycle$tl$, $tl$The Rock Cycle$tl$, $tl$Rocks change between igneous, sedimentary, and metamorphic forms over time.$tl$, 6, $tl$MS-ESS2-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: The Rock Cycle$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: The Rock Cycle", "body": "Rocks change between igneous, sedimentary, and metamorphic forms over time."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Rock formed from cooled magma or lava is:\n\nThe answer is \"igneous rock\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Rock formed from compacted layers of sediment is:\n\nThe answer is \"sedimentary rock\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Rock changed by heat and pressure is:\n\nThe answer is \"metamorphic rock\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Fossils are most commonly found in which rock type?", "choices": [{"id": "a", "label": "igneous"}, {"id": "b", "label": "metamorphic"}, {"id": "c", "label": "sedimentary"}, {"id": "d", "label": "molten"}], "answer": "c", "explanation": "Yes! The answer is \"sedimentary\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The breaking down of rock into smaller pieces is:", "choices": [{"id": "a", "label": "deposition"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "cementing"}, {"id": "d", "label": "weathering"}], "answer": "d", "explanation": "Yes! The answer is \"weathering\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Wind and water moving sediment from place to place is:", "choices": [{"id": "a", "label": "weathering"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "cooling"}], "answer": "c", "explanation": "Yes! The answer is \"erosion\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about The Rock Cycle! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rock formed from cooled magma or lava is:$tl$, $tl$[{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "igneous rock"}, {"id": "c", "label": "metamorphic rock"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rock formed from compacted layers of sediment is:$tl$, $tl$[{"id": "a", "label": "igneous rock"}, {"id": "b", "label": "sedimentary rock"}, {"id": "c", "label": "metamorphic rock"}, {"id": "d", "label": "magma"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rock changed by heat and pressure is:$tl$, $tl$[{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "igneous rock"}, {"id": "c", "label": "sand"}, {"id": "d", "label": "metamorphic rock"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Fossils are most commonly found in which rock type?$tl$, $tl$[{"id": "a", "label": "sedimentary"}, {"id": "b", "label": "igneous"}, {"id": "c", "label": "metamorphic"}, {"id": "d", "label": "molten"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The breaking down of rock into smaller pieces is:$tl$, $tl$[{"id": "a", "label": "deposition"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "cementing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Wind and water moving sediment from place to place is:$tl$, $tl$[{"id": "a", "label": "weathering"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "cooling"}, {"id": "d", "label": "erosion"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When sediment is dropped and settles, it is:$tl$, $tl$[{"id": "a", "label": "deposition"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "melting"}, {"id": "d", "label": "cooling"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The rock cycle shows that rocks can:$tl$, $tl$[{"id": "a", "label": "never change"}, {"id": "b", "label": "only get bigger"}, {"id": "c", "label": "change from one type to another over time"}, {"id": "d", "label": "turn into animals"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Heat and pressure deep underground can turn limestone into:$tl$, $tl$[{"id": "a", "label": "sand"}, {"id": "b", "label": "lava"}, {"id": "c", "label": "fossils"}, {"id": "d", "label": "marble (metamorphic)"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Magma that cools slowly underground forms igneous rock with:$tl$, $tl$[{"id": "a", "label": "no crystals ever"}, {"id": "b", "label": "fossils"}, {"id": "c", "label": "large crystals"}, {"id": "d", "label": "layers"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Lava that cools quickly on the surface forms igneous rock with:$tl$, $tl$[{"id": "a", "label": "huge crystals"}, {"id": "b", "label": "small crystals"}, {"id": "c", "label": "fossils"}, {"id": "d", "label": "layers of mud"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Layers (strata) are a clue that a rock is:$tl$, $tl$[{"id": "a", "label": "igneous"}, {"id": "b", "label": "sedimentary"}, {"id": "c", "label": "metamorphic"}, {"id": "d", "label": "molten"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which process can start the rock cycle by breaking rock apart?$tl$, $tl$[{"id": "a", "label": "deposition"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "weathering"}, {"id": "d", "label": "cooling"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If a rock melts, it becomes:$tl$, $tl$[{"id": "a", "label": "sediment"}, {"id": "b", "label": "magma"}, {"id": "c", "label": "a fossil"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Pressure squeezing sediment together to form rock is:$tl$, $tl$[{"id": "a", "label": "compaction"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "weathering"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Rock that forms from cooled magma or lava is called ____ rock. (one word)$tl$, null, $tl$igneous$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Sandstone and shale are examples of:$tl$, $tl$[{"id": "a", "label": "sedimentary rock"}, {"id": "b", "label": "igneous rock"}, {"id": "c", "label": "metamorphic rock"}, {"id": "d", "label": "minerals only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The rock cycle is powered by Earth's internal heat and energy from the:$tl$, $tl$[{"id": "a", "label": "Moon"}, {"id": "b", "label": "stars"}, {"id": "c", "label": "Sun"}, {"id": "d", "label": "ocean only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Minerals are the natural building blocks that make up:$tl$, $tl$[{"id": "a", "label": "clouds"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "living cells"}, {"id": "d", "label": "gases"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A rock can take which path in the cycle?$tl$, $tl$[{"id": "a", "label": "only stay igneous forever"}, {"id": "b", "label": "cell to tissue to organ"}, {"id": "c", "label": "igneous to sediment to sedimentary to metamorphic"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$rock-cycle$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] The Solar System (MS-ESS1-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$solar-system$tl$, $tl$The Solar System$tl$, $tl$Gravity holds planets, moons, asteroids, and comets in orbit around the Sun.$tl$, 6, $tl$MS-ESS1-3$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: The Solar System$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: The Solar System", "body": "Gravity holds planets, moons, asteroids, and comets in orbit around the Sun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The Sun is at the center of our solar system and is a:\n\nThe answer is \"star\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The planets move around the Sun in paths called:\n\nThe answer is \"orbits\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which force keeps the planets in orbit around the Sun?\n\nThe answer is \"gravity\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The four inner planets are small and made mostly of:", "choices": [{"id": "a", "label": "gas"}, {"id": "b", "label": "ice only"}, {"id": "c", "label": "light"}, {"id": "d", "label": "rock"}], "answer": "d", "explanation": "Yes! The answer is \"rock\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The four outer planets are large and made mostly of:", "choices": [{"id": "a", "label": "rock"}, {"id": "b", "label": "metal only"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "water"}], "answer": "c", "explanation": "Yes! The answer is \"gas\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Earth takes about one ____ to orbit the Sun.", "choices": [{"id": "a", "label": "day"}, {"id": "b", "label": "month"}, {"id": "c", "label": "hour"}, {"id": "d", "label": "year"}], "answer": "d", "explanation": "Yes! The answer is \"year\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about The Solar System! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The Sun is at the center of our solar system and is a:$tl$, $tl$[{"id": "a", "label": "planet"}, {"id": "b", "label": "moon"}, {"id": "c", "label": "comet"}, {"id": "d", "label": "star"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The planets move around the Sun in paths called:$tl$, $tl$[{"id": "a", "label": "craters"}, {"id": "b", "label": "orbits"}, {"id": "c", "label": "comets"}, {"id": "d", "label": "phases"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which force keeps the planets in orbit around the Sun?$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "magnetism"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The four inner planets are small and made mostly of:$tl$, $tl$[{"id": "a", "label": "gas"}, {"id": "b", "label": "ice only"}, {"id": "c", "label": "light"}, {"id": "d", "label": "rock"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The four outer planets are large and made mostly of:$tl$, $tl$[{"id": "a", "label": "gas"}, {"id": "b", "label": "rock"}, {"id": "c", "label": "metal only"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Earth takes about one ____ to orbit the Sun.$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "month"}, {"id": "c", "label": "year"}, {"id": "d", "label": "hour"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Earth's spin on its axis causes:$tl$, $tl$[{"id": "a", "label": "day and night"}, {"id": "b", "label": "the seasons alone"}, {"id": "c", "label": "tides only"}, {"id": "d", "label": "eclipses only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A natural object that orbits a planet is a:$tl$, $tl$[{"id": "a", "label": "star"}, {"id": "b", "label": "comet"}, {"id": "c", "label": "asteroid belt"}, {"id": "d", "label": "moon"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Small rocky bodies orbiting the Sun, mostly between Mars and Jupiter, are:$tl$, $tl$[{"id": "a", "label": "comets"}, {"id": "b", "label": "moons"}, {"id": "c", "label": "stars"}, {"id": "d", "label": "asteroids"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Icy bodies that grow a glowing tail near the Sun are:$tl$, $tl$[{"id": "a", "label": "comets"}, {"id": "b", "label": "asteroids"}, {"id": "c", "label": "planets"}, {"id": "d", "label": "moons"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The planet closest to the Sun is:$tl$, $tl$[{"id": "a", "label": "Mercury"}, {"id": "b", "label": "Earth"}, {"id": "c", "label": "Jupiter"}, {"id": "d", "label": "Neptune"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The largest planet in the solar system is:$tl$, $tl$[{"id": "a", "label": "Earth"}, {"id": "b", "label": "Mars"}, {"id": "c", "label": "Jupiter"}, {"id": "d", "label": "Mercury"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The Moon's phases are caused by its position relative to Earth and the:$tl$, $tl$[{"id": "a", "label": "other planets"}, {"id": "b", "label": "Sun"}, {"id": "c", "label": "stars"}, {"id": "d", "label": "comets"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A solar eclipse happens when the ____ passes between Earth and the Sun.$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Mars"}, {"id": "c", "label": "Moon"}, {"id": "d", "label": "Jupiter"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Seasons on Earth are caused by Earth's:$tl$, $tl$[{"id": "a", "label": "distance changing a lot"}, {"id": "b", "label": "tilt as it orbits the Sun"}, {"id": "c", "label": "spin speed"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The force that keeps planets orbiting the Sun is ____. (one word)$tl$, null, $tl$gravity$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which list is in order outward from the Sun?$tl$, $tl$[{"id": "a", "label": "Earth, Mercury, Mars, Venus"}, {"id": "b", "label": "Mars, Earth, Venus, Mercury"}, {"id": "c", "label": "Mercury, Venus, Earth, Mars"}, {"id": "d", "label": "Venus, Earth, Mercury, Mars"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Stars other than the Sun look tiny because they are:$tl$, $tl$[{"id": "a", "label": "extremely far away"}, {"id": "b", "label": "very small"}, {"id": "c", "label": "made of paper"}, {"id": "d", "label": "behind the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The Sun provides the solar system with:$tl$, $tl$[{"id": "a", "label": "oxygen"}, {"id": "b", "label": "gravity only"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "light and heat energy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A galaxy is a huge collection of stars, gas, dust, and:$tl$, $tl$[{"id": "a", "label": "oceans"}, {"id": "b", "label": "planetary systems"}, {"id": "c", "label": "continents"}, {"id": "d", "label": "weather"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Atoms & Matter (MS-PS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$atoms-and-matter$tl$, $tl$Atoms & Matter$tl$, $tl$Matter is made of atoms; substances can be elements, compounds, or mixtures.$tl$, 6, $tl$MS-PS1-1$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Atoms & Matter$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Atoms & Matter", "body": "Matter is made of atoms; substances can be elements, compounds, or mixtures."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The smallest unit of an element is an:\n\nThe answer is \"atom\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Two or more atoms joined together form a:\n\nThe answer is \"molecule\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A substance made of only one kind of atom is an:\n\nThe answer is \"element\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Water (H2O) is made of hydrogen and oxygen, so it is a:", "choices": [{"id": "a", "label": "element"}, {"id": "b", "label": "mixture"}, {"id": "c", "label": "compound"}, {"id": "d", "label": "atom"}], "answer": "c", "explanation": "Yes! The answer is \"compound\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In a solid, particles are packed closely and:", "choices": [{"id": "a", "label": "move freely and far apart"}, {"id": "b", "label": "vibrate in place"}, {"id": "c", "label": "disappear"}, {"id": "d", "label": "do not exist"}], "answer": "b", "explanation": "Yes! The answer is \"vibrate in place\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In a gas, particles:", "choices": [{"id": "a", "label": "are locked in place"}, {"id": "b", "label": "are a liquid"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "move quickly and spread far apart"}], "answer": "d", "explanation": "Yes! The answer is \"move quickly and spread far apart\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Atoms & Matter! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The smallest unit of an element is an:$tl$, $tl$[{"id": "a", "label": "molecule"}, {"id": "b", "label": "cell"}, {"id": "c", "label": "atom"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two or more atoms joined together form a:$tl$, $tl$[{"id": "a", "label": "molecule"}, {"id": "b", "label": "cell"}, {"id": "c", "label": "mixture"}, {"id": "d", "label": "rock"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A substance made of only one kind of atom is an:$tl$, $tl$[{"id": "a", "label": "mixture"}, {"id": "b", "label": "solution"}, {"id": "c", "label": "compound"}, {"id": "d", "label": "element"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Water (H2O) is made of hydrogen and oxygen, so it is a:$tl$, $tl$[{"id": "a", "label": "element"}, {"id": "b", "label": "mixture"}, {"id": "c", "label": "compound"}, {"id": "d", "label": "atom"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$In a solid, particles are packed closely and:$tl$, $tl$[{"id": "a", "label": "move freely and far apart"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "vibrate in place"}, {"id": "d", "label": "do not exist"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$In a gas, particles:$tl$, $tl$[{"id": "a", "label": "move quickly and spread far apart"}, {"id": "b", "label": "are locked in place"}, {"id": "c", "label": "are a liquid"}, {"id": "d", "label": "vanish"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Adding heat to a substance makes its particles move:$tl$, $tl$[{"id": "a", "label": "slower"}, {"id": "b", "label": "faster"}, {"id": "c", "label": "not at all"}, {"id": "d", "label": "backward in time"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When a solid melts into a liquid, this is a:$tl$, $tl$[{"id": "a", "label": "chemical change"}, {"id": "b", "label": "new element"}, {"id": "c", "label": "nuclear change"}, {"id": "d", "label": "physical change"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Burning wood, which makes new substances, is a:$tl$, $tl$[{"id": "a", "label": "physical change"}, {"id": "b", "label": "change of shape only"}, {"id": "c", "label": "phase change"}, {"id": "d", "label": "chemical change"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Tiny particles that make up atoms include protons, neutrons, and:$tl$, $tl$[{"id": "a", "label": "cells"}, {"id": "b", "label": "molecules"}, {"id": "c", "label": "electrons"}, {"id": "d", "label": "minerals"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The states of matter include solid, liquid, gas, and:$tl$, $tl$[{"id": "a", "label": "wood"}, {"id": "b", "label": "plasma"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "glass"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A mixture differs from a compound because a mixture's parts:$tl$, $tl$[{"id": "a", "label": "form a new substance"}, {"id": "b", "label": "become atoms"}, {"id": "c", "label": "cannot be separated"}, {"id": "d", "label": "keep their own properties"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Cooling a gas enough will cause it to:$tl$, $tl$[{"id": "a", "label": "become an element"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "condense into a liquid"}, {"id": "d", "label": "turn to plasma"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The amount of matter in an object is its:$tl$, $tl$[{"id": "a", "label": "volume"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "color"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$During a physical change, the substance's:$tl$, $tl$[{"id": "a", "label": "atoms are destroyed"}, {"id": "b", "label": "mass vanishes"}, {"id": "c", "label": "identity stays the same"}, {"id": "d", "label": "element changes"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The smallest unit of an element is an ____. (one word)$tl$, null, $tl$atom$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which is a sign of a chemical change?$tl$, $tl$[{"id": "a", "label": "ice melting"}, {"id": "b", "label": "water boiling"}, {"id": "c", "label": "tearing paper"}, {"id": "d", "label": "a new color, gas, or smell is produced"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Particles in a liquid:$tl$, $tl$[{"id": "a", "label": "slide past one another"}, {"id": "b", "label": "are fixed in place"}, {"id": "c", "label": "fly far apart like a gas"}, {"id": "d", "label": "do not move"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The periodic table organizes the known:$tl$, $tl$[{"id": "a", "label": "elements"}, {"id": "b", "label": "mixtures"}, {"id": "c", "label": "compounds only"}, {"id": "d", "label": "animals"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Matter is anything that has mass and takes up:$tl$, $tl$[{"id": "a", "label": "energy only"}, {"id": "b", "label": "light"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "space (volume)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-matter$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Energy & Its Transfer (MS-PS3-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$energy-transfer$tl$, $tl$Energy & Its Transfer$tl$, $tl$Energy can be stored or moving and is transferred by conduction, convection, and radiation.$tl$, 6, $tl$MS-PS3-3$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Energy & Its Transfer$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Energy & Its Transfer", "body": "Energy can be stored or moving and is transferred by conduction, convection, and radiation."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Energy that an object has because it is moving is:\n\nThe answer is \"kinetic energy\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Stored energy due to position, like a raised ball, is:\n\nThe answer is \"potential energy\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Energy cannot be created or destroyed, only:\n\nThe answer is \"transferred or transformed\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Heat moving through a metal spoon in soup is:", "choices": [{"id": "a", "label": "convection"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "conduction"}, {"id": "d", "label": "reflection"}], "answer": "c", "explanation": "Yes! The answer is \"conduction\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Heat carried by moving liquids or gases is:", "choices": [{"id": "a", "label": "conduction"}, {"id": "b", "label": "convection"}, {"id": "c", "label": "radiation"}, {"id": "d", "label": "insulation"}], "answer": "b", "explanation": "Yes! The answer is \"convection\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Heat from the Sun reaching Earth through space is:", "choices": [{"id": "a", "label": "conduction"}, {"id": "b", "label": "convection"}, {"id": "c", "label": "radiation"}, {"id": "d", "label": "friction"}], "answer": "c", "explanation": "Yes! The answer is \"radiation\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Energy & Its Transfer! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Energy that an object has because it is moving is:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "potential energy"}, {"id": "c", "label": "chemical only"}, {"id": "d", "label": "no energy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Stored energy due to position, like a raised ball, is:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "heat only"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "potential energy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Energy cannot be created or destroyed, only:$tl$, $tl$[{"id": "a", "label": "deleted"}, {"id": "b", "label": "transferred or transformed"}, {"id": "c", "label": "invented"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Heat moving through a metal spoon in soup is:$tl$, $tl$[{"id": "a", "label": "convection"}, {"id": "b", "label": "radiation"}, {"id": "c", "label": "conduction"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Heat carried by moving liquids or gases is:$tl$, $tl$[{"id": "a", "label": "convection"}, {"id": "b", "label": "conduction"}, {"id": "c", "label": "radiation"}, {"id": "d", "label": "insulation"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Heat from the Sun reaching Earth through space is:$tl$, $tl$[{"id": "a", "label": "conduction"}, {"id": "b", "label": "convection"}, {"id": "c", "label": "friction"}, {"id": "d", "label": "radiation"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A battery stores energy as:$tl$, $tl$[{"id": "a", "label": "sound energy"}, {"id": "b", "label": "chemical energy"}, {"id": "c", "label": "light energy"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A light bulb changes electrical energy into light and:$tl$, $tl$[{"id": "a", "label": "heat"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "matter"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When a moving car brakes, kinetic energy is mostly transformed into:$tl$, $tl$[{"id": "a", "label": "new matter"}, {"id": "b", "label": "light only"}, {"id": "c", "label": "sound only"}, {"id": "d", "label": "heat"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Energy from food is released in cells by the:$tl$, $tl$[{"id": "a", "label": "nucleus"}, {"id": "b", "label": "cell wall"}, {"id": "c", "label": "ribosome"}, {"id": "d", "label": "mitochondria"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A material that does NOT transfer heat well is an:$tl$, $tl$[{"id": "a", "label": "insulator"}, {"id": "b", "label": "conductor"}, {"id": "c", "label": "magnet"}, {"id": "d", "label": "battery"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Metals are usually good ____ of heat and electricity.$tl$, $tl$[{"id": "a", "label": "conductors"}, {"id": "b", "label": "insulators"}, {"id": "c", "label": "magnets only"}, {"id": "d", "label": "gases"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A roller coaster car at the top of a hill has the most:$tl$, $tl$[{"id": "a", "label": "potential energy"}, {"id": "b", "label": "kinetic energy"}, {"id": "c", "label": "sound energy"}, {"id": "d", "label": "light energy"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$As that car races downhill, potential energy changes into:$tl$, $tl$[{"id": "a", "label": "chemical energy"}, {"id": "b", "label": "sound only"}, {"id": "c", "label": "kinetic energy"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The total energy in a closed system stays:$tl$, $tl$[{"id": "a", "label": "always increasing"}, {"id": "b", "label": "the same (conserved)"}, {"id": "c", "label": "always zero"}, {"id": "d", "label": "random"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Energy of motion is called ____ energy. (one word)$tl$, null, $tl$kinetic$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Solar panels transform sunlight into:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "matter"}, {"id": "c", "label": "electrical energy"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A pot warming evenly on a stove as water circulates shows:$tl$, $tl$[{"id": "a", "label": "radiation only"}, {"id": "b", "label": "convection"}, {"id": "c", "label": "insulation"}, {"id": "d", "label": "reflection"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rubbing your hands together transforms motion into:$tl$, $tl$[{"id": "a", "label": "light"}, {"id": "b", "label": "sound only"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "heat (thermal energy)"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which best states the law of conservation of energy?$tl$, $tl$[{"id": "a", "label": "energy disappears"}, {"id": "b", "label": "energy is made from nothing"}, {"id": "c", "label": "energy changes form but the total stays the same"}, {"id": "d", "label": "energy is matter"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Forces & Motion (MS-PS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$forces-and-motion$tl$, $tl$Forces & Motion$tl$, $tl$Forces change motion; balanced forces keep it steady while unbalanced forces change it.$tl$, 6, $tl$MS-PS2-2$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Forces & Motion$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Forces & Motion", "body": "Forces change motion; balanced forces keep it steady while unbalanced forces change it."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A push or a pull is a:\n\nThe answer is \"force\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The tendency of an object to resist changes in motion is:\n\nThe answer is \"inertia\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An object at rest stays at rest unless acted on by an:\n\nThe answer is \"unbalanced force\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Forces that are equal and opposite are:", "choices": [{"id": "a", "label": "unbalanced"}, {"id": "b", "label": "balanced"}, {"id": "c", "label": "negative"}, {"id": "d", "label": "invisible"}], "answer": "b", "explanation": "Yes! The answer is \"balanced\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Unbalanced forces cause an object's motion to:", "choices": [{"id": "a", "label": "stay exactly the same"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "change"}, {"id": "d", "label": "reverse time"}], "answer": "c", "explanation": "Yes! The answer is \"change\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The force that opposes motion between surfaces is:", "choices": [{"id": "a", "label": "gravity"}, {"id": "b", "label": "magnetism"}, {"id": "c", "label": "inertia"}, {"id": "d", "label": "friction"}], "answer": "d", "explanation": "Yes! The answer is \"friction\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Forces & Motion! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A push or a pull is a:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "speed"}, {"id": "c", "label": "force"}, {"id": "d", "label": "distance"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The tendency of an object to resist changes in motion is:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "friction"}, {"id": "c", "label": "inertia"}, {"id": "d", "label": "energy"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An object at rest stays at rest unless acted on by an:$tl$, $tl$[{"id": "a", "label": "unbalanced force"}, {"id": "b", "label": "balanced force"}, {"id": "c", "label": "idea"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Forces that are equal and opposite are:$tl$, $tl$[{"id": "a", "label": "balanced"}, {"id": "b", "label": "unbalanced"}, {"id": "c", "label": "negative"}, {"id": "d", "label": "invisible"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Unbalanced forces cause an object's motion to:$tl$, $tl$[{"id": "a", "label": "stay exactly the same"}, {"id": "b", "label": "change"}, {"id": "c", "label": "disappear"}, {"id": "d", "label": "reverse time"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The force that opposes motion between surfaces is:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "magnetism"}, {"id": "c", "label": "inertia"}, {"id": "d", "label": "friction"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Speed is distance divided by:$tl$, $tl$[{"id": "a", "label": "time"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "force"}, {"id": "d", "label": "weight"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Velocity is speed in a particular:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "direction"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A change in velocity over time is:$tl$, $tl$[{"id": "a", "label": "acceleration"}, {"id": "b", "label": "inertia"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "friction"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The greater an object's mass, the greater the ____ needed to accelerate it.$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "force"}, {"id": "c", "label": "time of day"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$For every action there is an equal and opposite:$tl$, $tl$[{"id": "a", "label": "reaction"}, {"id": "b", "label": "color"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "distance"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Gravity is a force of attraction between objects with:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "color"}, {"id": "c", "label": "charge only"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If you push a heavy box and a light box with the same force, the light box:$tl$, $tl$[{"id": "a", "label": "accelerates less"}, {"id": "b", "label": "accelerates more"}, {"id": "c", "label": "does not move"}, {"id": "d", "label": "gets heavier"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A rocket launches upward by pushing gas down - an example of:$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "inertia only"}, {"id": "c", "label": "gravity only"}, {"id": "d", "label": "action-reaction"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rougher surfaces generally create ____ friction.$tl$, $tl$[{"id": "a", "label": "more"}, {"id": "b", "label": "less"}, {"id": "c", "label": "no"}, {"id": "d", "label": "negative"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A push or a pull is called a ____. (one word)$tl$, null, $tl$force$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A car speeding up, slowing down, or turning is all examples of:$tl$, $tl$[{"id": "a", "label": "constant speed"}, {"id": "b", "label": "rest"}, {"id": "c", "label": "acceleration"}, {"id": "d", "label": "inertia only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Seat belts help in a sudden stop because of the passenger's:$tl$, $tl$[{"id": "a", "label": "gravity"}, {"id": "b", "label": "inertia"}, {"id": "c", "label": "friction"}, {"id": "d", "label": "acceleration only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If forces on a moving object are balanced, it will:$tl$, $tl$[{"id": "a", "label": "speed up"}, {"id": "b", "label": "stop instantly"}, {"id": "c", "label": "reverse"}, {"id": "d", "label": "keep moving at constant velocity"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Net force is the:$tl$, $tl$[{"id": "a", "label": "overall force after combining all forces"}, {"id": "b", "label": "only the biggest force"}, {"id": "c", "label": "mass times color"}, {"id": "d", "label": "always zero"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Central Idea (RI.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$central-idea$tl$, $tl$Central Idea$tl$, $tl$The central idea is a text's most important overall point, developed by details.$tl$, 6, $tl$RI.6.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Central Idea$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Central Idea", "body": "The central idea is a text's most important overall point, developed by details."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The central idea of a text is its:\n\nThe answer is \"most important overall point\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Supporting details in a text serve to:\n\nThe answer is \"develop the central idea\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"Bees pollinate crops, support ecosystems, and produce honey, making them vital.\" The central idea is that bees are:\n\nThe answer is \"important to humans and nature\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To find the central idea, you should consider the text as a:", "choices": [{"id": "a", "label": "single word"}, {"id": "b", "label": "whole"}, {"id": "c", "label": "title only"}, {"id": "d", "label": "page number"}], "answer": "b", "explanation": "Yes! The answer is \"whole\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A central idea is usually:", "choices": [{"id": "a", "label": "supported by several details"}, {"id": "b", "label": "stated as a question"}, {"id": "c", "label": "a random fact"}, {"id": "d", "label": "the shortest sentence"}], "answer": "a", "explanation": "Yes! The answer is \"supported by several details\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Despite setbacks, the team kept testing until their rover finally worked.\" The central idea is about:", "choices": [{"id": "a", "label": "building cars"}, {"id": "b", "label": "spending money"}, {"id": "c", "label": "the color of the rover"}, {"id": "d", "label": "persistence leading to success"}], "answer": "d", "explanation": "Yes! The answer is \"persistence leading to success\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Central Idea! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The central idea of a text is its:$tl$, $tl$[{"id": "a", "label": "first sentence"}, {"id": "b", "label": "longest word"}, {"id": "c", "label": "most important overall point"}, {"id": "d", "label": "title font"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Supporting details in a text serve to:$tl$, $tl$[{"id": "a", "label": "change the topic"}, {"id": "b", "label": "end the text"}, {"id": "c", "label": "develop the central idea"}, {"id": "d", "label": "list the author"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Bees pollinate crops, support ecosystems, and produce honey, making them vital." The central idea is that bees are:$tl$, $tl$[{"id": "a", "label": "scary"}, {"id": "b", "label": "small"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "important to humans and nature"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To find the central idea, you should consider the text as a:$tl$, $tl$[{"id": "a", "label": "single word"}, {"id": "b", "label": "whole"}, {"id": "c", "label": "title only"}, {"id": "d", "label": "page number"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A central idea is usually:$tl$, $tl$[{"id": "a", "label": "stated as a question"}, {"id": "b", "label": "a random fact"}, {"id": "c", "label": "the shortest sentence"}, {"id": "d", "label": "supported by several details"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Despite setbacks, the team kept testing until their rover finally worked." The central idea is about:$tl$, $tl$[{"id": "a", "label": "building cars"}, {"id": "b", "label": "spending money"}, {"id": "c", "label": "the color of the rover"}, {"id": "d", "label": "persistence leading to success"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A long article's central idea is best captured in a:$tl$, $tl$[{"id": "a", "label": "copy of the whole text"}, {"id": "b", "label": "single quotation"}, {"id": "c", "label": "brief statement of its main point"}, {"id": "d", "label": "heading only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which would best support the central idea 'recycling benefits the planet'?$tl$, $tl$[{"id": "a", "label": "It conserves resources and reduces waste."}, {"id": "b", "label": "Bins can be heavy."}, {"id": "c", "label": "Trucks are loud."}, {"id": "d", "label": "It rained today."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A detail unrelated to the main point is:$tl$, $tl$[{"id": "a", "label": "the central idea"}, {"id": "b", "label": "the theme"}, {"id": "c", "label": "essential"}, {"id": "d", "label": "irrelevant to the central idea"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two paragraphs that each explain a benefit of exercise together build the:$tl$, $tl$[{"id": "a", "label": "plot"}, {"id": "b", "label": "central idea"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "rhyme"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The internet connects people, speeds up learning, and powers business, but raises privacy concerns." The central idea is that the internet is:$tl$, $tl$[{"id": "a", "label": "only harmful"}, {"id": "b", "label": "powerful but not without downsides"}, {"id": "c", "label": "only fun"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The central idea of an informational text answers:$tl$, $tl$[{"id": "a", "label": "who printed it?"}, {"id": "b", "label": "how many pages?"}, {"id": "c", "label": "what font?"}, {"id": "d", "label": "what is this mostly about?"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An objective summary of central idea leaves out the reader's:$tl$, $tl$[{"id": "a", "label": "the main point"}, {"id": "b", "label": "key details"}, {"id": "c", "label": "the topic"}, {"id": "d", "label": "personal opinions"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Coral reefs shelter species, protect coasts, and may yield medicines, yet they are dying." The central idea is that reefs are:$tl$, $tl$[{"id": "a", "label": "useless"}, {"id": "b", "label": "dry"}, {"id": "c", "label": "valuable and endangered"}, {"id": "d", "label": "new"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Headings and topic sentences often hint at a text's:$tl$, $tl$[{"id": "a", "label": "price"}, {"id": "b", "label": "author's age"}, {"id": "c", "label": "central idea"}, {"id": "d", "label": "binding"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The most important overall point of a text is its ____ idea. (one word)$tl$, null, $tl$central$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If you removed the supporting details, the central idea would be:$tl$, $tl$[{"id": "a", "label": "clearer always"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "unchanged in proof"}, {"id": "d", "label": "harder to fully understand or believe"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A well-developed central idea is backed by:$tl$, $tl$[{"id": "a", "label": "only the title"}, {"id": "b", "label": "evidence and examples"}, {"id": "c", "label": "one word"}, {"id": "d", "label": "the page count"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Volunteers cleaned the river, planted trees, and taught neighbors to recycle." The central idea is that the community:$tl$, $tl$[{"id": "a", "label": "went on vacation"}, {"id": "b", "label": "watched TV"}, {"id": "c", "label": "worked to improve the environment"}, {"id": "d", "label": "ignored the river"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Determining the central idea helps a reader:$tl$, $tl$[{"id": "a", "label": "count words"}, {"id": "b", "label": "pick a font"}, {"id": "c", "label": "understand the text's purpose"}, {"id": "d", "label": "skip reading"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Theme (RL.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$theme$tl$, $tl$Theme$tl$, $tl$A theme is a story's underlying message about life, shown through the characters.$tl$, 6, $tl$RL.6.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Theme$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Theme", "body": "A theme is a story's underlying message about life, shown through the characters."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A theme is a story's:\n\nThe answer is \"underlying message about life\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Theme differs from topic because theme is a:\n\nThe answer is \"complete idea or lesson\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"Though small and doubted, the girl's idea saved the village.\" A theme is:\n\nThe answer is \"everyone's contribution matters\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Authors usually reveal theme through:", "choices": [{"id": "a", "label": "the title page only"}, {"id": "b", "label": "characters' actions and changes"}, {"id": "c", "label": "the font"}, {"id": "d", "label": "the price"}], "answer": "b", "explanation": "Yes! The answer is \"characters' actions and changes\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A story where greed leads to ruin develops a theme about the:", "choices": [{"id": "a", "label": "joy of greed"}, {"id": "b", "label": "size of houses"}, {"id": "c", "label": "dangers of greed"}, {"id": "d", "label": "weather"}], "answer": "c", "explanation": "Yes! The answer is \"dangers of greed\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Two very different stories can share a theme such as:", "choices": [{"id": "a", "label": "the same exact plot"}, {"id": "b", "label": "the same author"}, {"id": "c", "label": "courage in the face of fear"}, {"id": "d", "label": "the same length"}], "answer": "c", "explanation": "Yes! The answer is \"courage in the face of fear\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Theme! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A theme is a story's:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "narrator's name"}, {"id": "c", "label": "underlying message about life"}, {"id": "d", "label": "page count"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Theme differs from topic because theme is a:$tl$, $tl$[{"id": "a", "label": "complete idea or lesson"}, {"id": "b", "label": "single word"}, {"id": "c", "label": "place"}, {"id": "d", "label": "character name"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Though small and doubted, the girl's idea saved the village." A theme is:$tl$, $tl$[{"id": "a", "label": "everyone's contribution matters"}, {"id": "b", "label": "small things are useless"}, {"id": "c", "label": "villages are old"}, {"id": "d", "label": "ideas are bad"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Authors usually reveal theme through:$tl$, $tl$[{"id": "a", "label": "the title page only"}, {"id": "b", "label": "the font"}, {"id": "c", "label": "characters' actions and changes"}, {"id": "d", "label": "the price"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A story where greed leads to ruin develops a theme about the:$tl$, $tl$[{"id": "a", "label": "joy of greed"}, {"id": "b", "label": "size of houses"}, {"id": "c", "label": "weather"}, {"id": "d", "label": "dangers of greed"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two very different stories can share a theme such as:$tl$, $tl$[{"id": "a", "label": "courage in the face of fear"}, {"id": "b", "label": "the same exact plot"}, {"id": "c", "label": "the same author"}, {"id": "d", "label": "the same length"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "After betraying his friend, he spent years earning back trust." A theme is:$tl$, $tl$[{"id": "a", "label": "betrayal is rewarded"}, {"id": "b", "label": "friends are useless"}, {"id": "c", "label": "trust is hard to rebuild"}, {"id": "d", "label": "time stops"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A theme is best stated as a:$tl$, $tl$[{"id": "a", "label": "single noun"}, {"id": "b", "label": "question mark"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "sentence about life or human nature"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To identify theme, ask what the character or reader:$tl$, $tl$[{"id": "a", "label": "wears"}, {"id": "b", "label": "eats"}, {"id": "c", "label": "learns"}, {"id": "d", "label": "weighs"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "She chose honesty even when lying was easier, and respected herself for it." The theme is about:$tl$, $tl$[{"id": "a", "label": "integrity / honesty"}, {"id": "b", "label": "winning at all costs"}, {"id": "c", "label": "fear"}, {"id": "d", "label": "luck"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A recurring idea that appears throughout a story points to its:$tl$, $tl$[{"id": "a", "label": "index"}, {"id": "b", "label": "glossary"}, {"id": "c", "label": "title"}, {"id": "d", "label": "theme"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The rivals learned that together they could do what neither could alone." The theme is:$tl$, $tl$[{"id": "a", "label": "cooperation / teamwork"}, {"id": "b", "label": "rivalry is best"}, {"id": "c", "label": "work alone"}, {"id": "d", "label": "quitting"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A symbol in a story often points toward the:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "theme"}, {"id": "c", "label": "author bio"}, {"id": "d", "label": "font size"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A theme is meant to apply:$tl$, $tl$[{"id": "a", "label": "only to one chapter"}, {"id": "b", "label": "to the cover"}, {"id": "c", "label": "to nothing"}, {"id": "d", "label": "beyond the single story, to real life"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Despite failing the first try, she kept practicing and improved." The theme is:$tl$, $tl$[{"id": "a", "label": "luck"}, {"id": "b", "label": "laziness"}, {"id": "c", "label": "fear"}, {"id": "d", "label": "perseverance"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The deeper message or lesson of a story is its ____. (one word)$tl$, null, $tl$theme$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which is a theme rather than a topic?$tl$, $tl$[{"id": "a", "label": "Freedom is worth sacrificing for."}, {"id": "b", "label": "war"}, {"id": "c", "label": "a soldier"}, {"id": "d", "label": "a country"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Conflicting characters often help reveal a story's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "setting only"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The proud king learned humility after losing everything." A theme is:$tl$, $tl$[{"id": "a", "label": "kings are tall"}, {"id": "b", "label": "castles crumble"}, {"id": "c", "label": "pride can lead to a fall"}, {"id": "d", "label": "gold is heavy"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A strong theme statement is:$tl$, $tl$[{"id": "a", "label": "the story's first line"}, {"id": "b", "label": "the title"}, {"id": "c", "label": "a general truth shown by the story"}, {"id": "d", "label": "a character's name"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Objective Summary (RI.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$summarizing$tl$, $tl$Objective Summary$tl$, $tl$An objective summary briefly restates the central idea and key details without opinion.$tl$, 6, $tl$RI.6.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Objective Summary$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Objective Summary", "body": "An objective summary briefly restates the central idea and key details without opinion."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An objective summary should:\n\nThe answer is \"stay neutral and factual\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A good summary is ____ than the original.\n\nThe answer is \"shorter\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A summary should capture the central idea and the:\n\nThe answer is \"most important details\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When summarizing, restate ideas in your:", "choices": [{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "own words"}, {"id": "c", "label": "a code"}, {"id": "d", "label": "emojis only"}], "answer": "b", "explanation": "Yes! The answer is \"own words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which should be LEFT OUT of an objective summary?", "choices": [{"id": "a", "label": "your personal feelings"}, {"id": "b", "label": "the main idea"}, {"id": "c", "label": "key supporting points"}, {"id": "d", "label": "the topic"}], "answer": "a", "explanation": "Yes! The answer is \"your personal feelings\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Events in a narrative summary should appear in:", "choices": [{"id": "a", "label": "random order"}, {"id": "b", "label": "reverse only"}, {"id": "c", "label": "logical order"}, {"id": "d", "label": "no order"}], "answer": "c", "explanation": "Yes! The answer is \"logical order\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Objective Summary! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An objective summary should:$tl$, $tl$[{"id": "a", "label": "include your opinion"}, {"id": "b", "label": "stay neutral and factual"}, {"id": "c", "label": "add a new ending"}, {"id": "d", "label": "exaggerate"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A good summary is ____ than the original.$tl$, $tl$[{"id": "a", "label": "shorter"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "exactly equal"}, {"id": "d", "label": "just the title"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A summary should capture the central idea and the:$tl$, $tl$[{"id": "a", "label": "every minor detail"}, {"id": "b", "label": "author's pet"}, {"id": "c", "label": "page color"}, {"id": "d", "label": "most important details"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When summarizing, restate ideas in your:$tl$, $tl$[{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "a code"}, {"id": "c", "label": "own words"}, {"id": "d", "label": "emojis only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which should be LEFT OUT of an objective summary?$tl$, $tl$[{"id": "a", "label": "the main idea"}, {"id": "b", "label": "key supporting points"}, {"id": "c", "label": "your personal feelings"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Events in a narrative summary should appear in:$tl$, $tl$[{"id": "a", "label": "random order"}, {"id": "b", "label": "reverse only"}, {"id": "c", "label": "logical order"}, {"id": "d", "label": "no order"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A summary of an argument should include the author's main:$tl$, $tl$[{"id": "a", "label": "favorite color"}, {"id": "b", "label": "claim and reasons"}, {"id": "c", "label": "birthday"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Summarizing a long text helps a reader:$tl$, $tl$[{"id": "a", "label": "forget it"}, {"id": "b", "label": "grasp and recall the key points"}, {"id": "c", "label": "make it longer"}, {"id": "d", "label": "change facts"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The best one-sentence summary states the text's:$tl$, $tl$[{"id": "a", "label": "smallest detail"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "author bio"}, {"id": "d", "label": "central idea"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Adding 'I think the author is wrong' makes a summary:$tl$, $tl$[{"id": "a", "label": "stronger always"}, {"id": "b", "label": "no longer objective"}, {"id": "c", "label": "required"}, {"id": "d", "label": "shorter"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To shorten a passage, you should:$tl$, $tl$[{"id": "a", "label": "repeat sentences"}, {"id": "b", "label": "add examples"}, {"id": "c", "label": "combine ideas and cut minor details"}, {"id": "d", "label": "copy it word for word"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An objective summary of a news report focuses on:$tl$, $tl$[{"id": "a", "label": "your reaction"}, {"id": "b", "label": "the reporter's looks"}, {"id": "c", "label": "ads"}, {"id": "d", "label": "the facts and main events"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A summary and the original should share the same:$tl$, $tl$[{"id": "a", "label": "central idea"}, {"id": "b", "label": "wording"}, {"id": "c", "label": "length"}, {"id": "d", "label": "number of pages"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which is the best summary of a story where a lost dog finds its way home after many trials?$tl$, $tl$[{"id": "a", "label": "A lost dog overcame obstacles to return home."}, {"id": "b", "label": "Dogs are loyal."}, {"id": "c", "label": "The dog was brown."}, {"id": "d", "label": "Homes are nice."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Rereading before summarizing helps you identify the:$tl$, $tl$[{"id": "a", "label": "longest words"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "most important ideas"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A brief, neutral retelling of a text's key points is a ____. (one word)$tl$, null, $tl$summary$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An effective summary answers mainly:$tl$, $tl$[{"id": "a", "label": "how you felt"}, {"id": "b", "label": "the price"}, {"id": "c", "label": "the publisher"}, {"id": "d", "label": "what happened and why it matters"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Including direct quotes for every detail makes a summary:$tl$, $tl$[{"id": "a", "label": "too long and not concise"}, {"id": "b", "label": "perfect"}, {"id": "c", "label": "objective"}, {"id": "d", "label": "short"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A paraphrase differs from a summary because a paraphrase:$tl$, $tl$[{"id": "a", "label": "restates a part in similar length"}, {"id": "b", "label": "is much shorter"}, {"id": "c", "label": "adds opinion"}, {"id": "d", "label": "is the title"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Good summarizers focus on ideas that are:$tl$, $tl$[{"id": "a", "label": "central, not trivial"}, {"id": "b", "label": "trivial"}, {"id": "c", "label": "longest"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Citing Text Evidence (RI.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$citing-evidence$tl$, $tl$Citing Text Evidence$tl$, $tl$Support your ideas and inferences with specific evidence taken from the text.$tl$, 6, $tl$RI.6.1$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Citing Text Evidence$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Citing Text Evidence", "body": "Support your ideas and inferences with specific evidence taken from the text."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Text evidence is information you take ____ from the text to support an answer.\n\nThe answer is \"directly\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  To support a claim about a text, you should cite:\n\nThe answer is \"specific details or quotes\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An inference must be supported by:\n\nThe answer is \"evidence in the text\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "'The text states...' is a phrase used to:", "choices": [{"id": "a", "label": "introduce evidence"}, {"id": "b", "label": "end an essay"}, {"id": "c", "label": "change topics"}, {"id": "d", "label": "give an opinion"}], "answer": "a", "explanation": "Yes! The answer is \"introduce evidence\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Strong evidence is:", "choices": [{"id": "a", "label": "relevant and from the text"}, {"id": "b", "label": "off-topic"}, {"id": "c", "label": "made up"}, {"id": "d", "label": "about the author's age"}], "answer": "a", "explanation": "Yes! The answer is \"relevant and from the text\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When asked 'how do you know?', a good reader:", "choices": [{"id": "a", "label": "guesses"}, {"id": "b", "label": "ignores the text"}, {"id": "c", "label": "talks about lunch"}, {"id": "d", "label": "points to text evidence"}], "answer": "d", "explanation": "Yes! The answer is \"points to text evidence\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Citing Text Evidence! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Text evidence is information you take ____ from the text to support an answer.$tl$, $tl$[{"id": "a", "label": "directly"}, {"id": "b", "label": "from memory only"}, {"id": "c", "label": "from a friend"}, {"id": "d", "label": "from the cover"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To support a claim about a text, you should cite:$tl$, $tl$[{"id": "a", "label": "your mood"}, {"id": "b", "label": "a different book"}, {"id": "c", "label": "the page color"}, {"id": "d", "label": "specific details or quotes"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An inference must be supported by:$tl$, $tl$[{"id": "a", "label": "evidence in the text"}, {"id": "b", "label": "a guess"}, {"id": "c", "label": "the title alone"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$'The text states...' is a phrase used to:$tl$, $tl$[{"id": "a", "label": "end an essay"}, {"id": "b", "label": "change topics"}, {"id": "c", "label": "introduce evidence"}, {"id": "d", "label": "give an opinion"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Strong evidence is:$tl$, $tl$[{"id": "a", "label": "off-topic"}, {"id": "b", "label": "relevant and from the text"}, {"id": "c", "label": "made up"}, {"id": "d", "label": "about the author's age"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When asked 'how do you know?', a good reader:$tl$, $tl$[{"id": "a", "label": "points to text evidence"}, {"id": "b", "label": "guesses"}, {"id": "c", "label": "ignores the text"}, {"id": "d", "label": "talks about lunch"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The author writes that 'sea levels rose two feet.'" Using that quote is an example of:$tl$, $tl$[{"id": "a", "label": "citing textual evidence"}, {"id": "b", "label": "personal opinion"}, {"id": "c", "label": "summarizing the title"}, {"id": "d", "label": "ignoring the text"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A claim without evidence is:$tl$, $tl$[{"id": "a", "label": "always correct"}, {"id": "b", "label": "weak / unsupported"}, {"id": "c", "label": "the central idea"}, {"id": "d", "label": "a quote"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Quotation marks around words copied from a text show they are the:$tl$, $tl$[{"id": "a", "label": "your words"}, {"id": "b", "label": "a summary"}, {"id": "c", "label": "a title"}, {"id": "d", "label": "author's exact words"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which best supports the claim 'the character was nervous'?$tl$, $tl$[{"id": "a", "label": "The book is long."}, {"id": "b", "label": "It was Tuesday."}, {"id": "c", "label": "The cover is blue."}, {"id": "d", "label": "'Her hands trembled as she spoke.'"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Citing evidence makes your answer more:$tl$, $tl$[{"id": "a", "label": "confusing"}, {"id": "b", "label": "shorter only"}, {"id": "c", "label": "colorful"}, {"id": "d", "label": "convincing"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To answer a text-based question, first:$tl$, $tl$[{"id": "a", "label": "find the relevant part of the text"}, {"id": "b", "label": "close the book"}, {"id": "c", "label": "guess"}, {"id": "d", "label": "read the cover"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Paraphrased evidence still needs to be:$tl$, $tl$[{"id": "a", "label": "made up"}, {"id": "b", "label": "based on the text"}, {"id": "c", "label": "about you"}, {"id": "d", "label": "unrelated"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A reader who supports ideas with text evidence is reading:$tl$, $tl$[{"id": "a", "label": "carelessly"}, {"id": "b", "label": "analytically / closely"}, {"id": "c", "label": "not at all"}, {"id": "d", "label": "only the title"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Explain how you know the setting is winter." Best evidence:$tl$, $tl$[{"id": "a", "label": "I like winter."}, {"id": "b", "label": "'Snow covered the silent streets.'"}, {"id": "c", "label": "The author is famous."}, {"id": "d", "label": "It has 200 pages."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Information taken directly from a text to support a point is text ____. (one word)$tl$, null, $tl$evidence$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Multiple pieces of evidence make an argument:$tl$, $tl$[{"id": "a", "label": "weaker"}, {"id": "b", "label": "off-topic"}, {"id": "c", "label": "stronger"}, {"id": "d", "label": "shorter only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If the text does not support your idea, you should:$tl$, $tl$[{"id": "a", "label": "keep it anyway"}, {"id": "b", "label": "revise your idea"}, {"id": "c", "label": "blame the text"}, {"id": "d", "label": "stop reading"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Citing the page or paragraph helps a reader:$tl$, $tl$[{"id": "a", "label": "locate the evidence"}, {"id": "b", "label": "pick a font"}, {"id": "c", "label": "count words"}, {"id": "d", "label": "skip the text"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Good evidence is both relevant and:$tl$, $tl$[{"id": "a", "label": "invented"}, {"id": "b", "label": "about the cover"}, {"id": "c", "label": "accurate (truly in the text)"}, {"id": "d", "label": "unrelated"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$citing-evidence$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Author's Purpose & View (RI.6.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$authors-point-of-view$tl$, $tl$Author's Purpose & View$tl$, $tl$Authors write to inform, persuade, or entertain, often revealing a point of view.$tl$, 6, $tl$RI.6.6$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Author's Purpose & View$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Author's Purpose & View", "body": "Authors write to inform, persuade, or entertain, often revealing a point of view."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An author's purpose for writing might be to inform, entertain, or:\n\nThe answer is \"persuade\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  An author's point of view is their:\n\nThe answer is \"attitude or stance on a topic\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text that argues you should recycle is mainly meant to:\n\nThe answer is \"persuade\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Word choices that show strong feelings can reveal the author's:", "choices": [{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "price"}, {"id": "d", "label": "point of view / bias"}], "answer": "d", "explanation": "Yes! The answer is \"point of view / bias\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An encyclopedia entry's purpose is usually to:", "choices": [{"id": "a", "label": "persuade"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "inform"}, {"id": "d", "label": "sell"}], "answer": "c", "explanation": "Yes! The answer is \"inform\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To find an author's purpose, ask:", "choices": [{"id": "a", "label": "how long is it?"}, {"id": "b", "label": "who printed it?"}, {"id": "c", "label": "what is the cover?"}, {"id": "d", "label": "why did they write this?"}], "answer": "d", "explanation": "Yes! The answer is \"why did they write this?\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Author's Purpose & View! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An author's purpose for writing might be to inform, entertain, or:$tl$, $tl$[{"id": "a", "label": "sleep"}, {"id": "b", "label": "eat"}, {"id": "c", "label": "drive"}, {"id": "d", "label": "persuade"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An author's point of view is their:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "handwriting"}, {"id": "c", "label": "address"}, {"id": "d", "label": "attitude or stance on a topic"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text that argues you should recycle is mainly meant to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "list facts only"}, {"id": "d", "label": "tell a joke"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Word choices that show strong feelings can reveal the author's:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "price"}, {"id": "d", "label": "point of view / bias"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An encyclopedia entry's purpose is usually to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "inform"}, {"id": "c", "label": "entertain"}, {"id": "d", "label": "sell"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$To find an author's purpose, ask:$tl$, $tl$[{"id": "a", "label": "why did they write this?"}, {"id": "b", "label": "how long is it?"}, {"id": "c", "label": "who printed it?"}, {"id": "d", "label": "what is the cover?"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An editorial in a newspaper mainly expresses the writer's:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "only facts"}, {"id": "c", "label": "a recipe"}, {"id": "d", "label": "a story plot"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$If an author only presents one side of an issue, the text may be:$tl$, $tl$[{"id": "a", "label": "objective"}, {"id": "b", "label": "biased"}, {"id": "c", "label": "fictional"}, {"id": "d", "label": "a poem"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A persuasive author often uses:$tl$, $tl$[{"id": "a", "label": "random numbers"}, {"id": "b", "label": "no words"}, {"id": "c", "label": "reasons and emotional appeals"}, {"id": "d", "label": "the title only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Our town MUST build a new park now!" The purpose is to:$tl$, $tl$[{"id": "a", "label": "inform neutrally"}, {"id": "b", "label": "entertain"}, {"id": "c", "label": "persuade"}, {"id": "d", "label": "instruct"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A humorous short story's main purpose is to:$tl$, $tl$[{"id": "a", "label": "entertain"}, {"id": "b", "label": "persuade"}, {"id": "c", "label": "inform"}, {"id": "d", "label": "sell a product"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Loaded words like 'shocking' or 'amazing' hint at the author's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "binding"}, {"id": "d", "label": "attitude"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Comparing two authors on the same topic can reveal different:$tl$, $tl$[{"id": "a", "label": "points of view"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "titles"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An author who wants to teach a process will likely:$tl$, $tl$[{"id": "a", "label": "tell a joke"}, {"id": "b", "label": "explain steps clearly"}, {"id": "c", "label": "argue loudly"}, {"id": "d", "label": "write a poem"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Recognizing point of view helps a reader judge a text's:$tl$, $tl$[{"id": "a", "label": "weight"}, {"id": "b", "label": "color"}, {"id": "c", "label": "reliability and intent"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The reason an author writes a text is the author's ____. (one word)$tl$, null, $tl$purpose$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A balanced text presents:$tl$, $tl$[{"id": "a", "label": "only one side"}, {"id": "b", "label": "more than one point of view"}, {"id": "c", "label": "no information"}, {"id": "d", "label": "just images"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An author's choice to include scary details may be intended to:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "change the font"}, {"id": "c", "label": "create a certain feeling in readers"}, {"id": "d", "label": "sell paper"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A 'how-to' guide's purpose is to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "entertain only"}, {"id": "c", "label": "instruct"}, {"id": "d", "label": "argue"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Identifying purpose and point of view helps readers think:$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "not at all"}, {"id": "c", "label": "critically"}, {"id": "d", "label": "only about length"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-point-of-view$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Word Meaning (RI.6.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$word-meaning$tl$, $tl$Word Meaning$tl$, $tl$Use context clues, prefixes, suffixes, and roots to determine word meanings.$tl$, 6, $tl$RI.6.4$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Word Meaning$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Word Meaning", "body": "Use context clues, prefixes, suffixes, and roots to determine word meanings."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Read: \"The benevolent leader gave generously to the poor.\" \"Benevolent\" means:\n\nThe answer is \"kind / generous\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Read: \"His incessant talking never stopped all day.\" \"Incessant\" means:\n\nThe answer is \"constant / nonstop\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"The drought made the once-fertile land barren.\" \"Barren\" means:\n\nThe answer is \"empty / unable to grow life\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The prefix 'un-' in 'unhappy' means:", "choices": [{"id": "a", "label": "not"}, {"id": "b", "label": "very"}, {"id": "c", "label": "again"}, {"id": "d", "label": "before"}], "answer": "a", "explanation": "Yes! The answer is \"not\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The root 'aqua' in 'aquarium' relates to:", "choices": [{"id": "a", "label": "fire"}, {"id": "b", "label": "air"}, {"id": "c", "label": "water"}, {"id": "d", "label": "earth"}], "answer": "c", "explanation": "Yes! The answer is \"water\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"She was reluctant and hesitated to agree.\" \"Reluctant\" means:", "choices": [{"id": "a", "label": "eager"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "unwilling"}, {"id": "d", "label": "tired"}], "answer": "c", "explanation": "Yes! The answer is \"unwilling\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Word Meaning! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The benevolent leader gave generously to the poor." "Benevolent" means:$tl$, $tl$[{"id": "a", "label": "kind / generous"}, {"id": "b", "label": "cruel"}, {"id": "c", "label": "lazy"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "His incessant talking never stopped all day." "Incessant" means:$tl$, $tl$[{"id": "a", "label": "quiet"}, {"id": "b", "label": "short"}, {"id": "c", "label": "constant / nonstop"}, {"id": "d", "label": "rare"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The drought made the once-fertile land barren." "Barren" means:$tl$, $tl$[{"id": "a", "label": "lush"}, {"id": "b", "label": "wet"}, {"id": "c", "label": "crowded"}, {"id": "d", "label": "empty / unable to grow life"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The prefix 'un-' in 'unhappy' means:$tl$, $tl$[{"id": "a", "label": "very"}, {"id": "b", "label": "again"}, {"id": "c", "label": "not"}, {"id": "d", "label": "before"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The root 'aqua' in 'aquarium' relates to:$tl$, $tl$[{"id": "a", "label": "fire"}, {"id": "b", "label": "water"}, {"id": "c", "label": "air"}, {"id": "d", "label": "earth"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "She was reluctant and hesitated to agree." "Reluctant" means:$tl$, $tl$[{"id": "a", "label": "eager"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "unwilling"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The suffix '-less' in 'fearless' means:$tl$, $tl$[{"id": "a", "label": "without"}, {"id": "b", "label": "full of"}, {"id": "c", "label": "again"}, {"id": "d", "label": "before"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The diplomat was tactful and never offended anyone." "Tactful" means:$tl$, $tl$[{"id": "a", "label": "rude"}, {"id": "b", "label": "clumsy"}, {"id": "c", "label": "sensitive in dealing with others"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The prefix 'pre-' in 'preview' means:$tl$, $tl$[{"id": "a", "label": "after"}, {"id": "b", "label": "before"}, {"id": "c", "label": "not"}, {"id": "d", "label": "again"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The vast, immense desert stretched for miles." "Immense" means:$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "huge"}, {"id": "c", "label": "wet"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A word's denotation is its:$tl$, $tl$[{"id": "a", "label": "dictionary meaning"}, {"id": "b", "label": "feeling it suggests"}, {"id": "c", "label": "rhyme"}, {"id": "d", "label": "spelling only"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A word's connotation is the:$tl$, $tl$[{"id": "a", "label": "dictionary meaning"}, {"id": "b", "label": "feeling or idea it suggests"}, {"id": "c", "label": "number of letters"}, {"id": "d", "label": "origin"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$'Cheap' and 'inexpensive' have similar denotations but different:$tl$, $tl$[{"id": "a", "label": "spellings only"}, {"id": "b", "label": "lengths"}, {"id": "c", "label": "prefixes"}, {"id": "d", "label": "connotations"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The root 'bio' in 'biology' means:$tl$, $tl$[{"id": "a", "label": "life"}, {"id": "b", "label": "earth"}, {"id": "c", "label": "water"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "His ambiguous answer could mean two things." "Ambiguous" means:$tl$, $tl$[{"id": "a", "label": "very clear"}, {"id": "b", "label": "unclear / having more than one meaning"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "short"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The prefix 're-' (as in 'redo') means to do something ____. (one word)$tl$, null, $tl$again$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "The meticulous artist checked every tiny detail." "Meticulous" means:$tl$, $tl$[{"id": "a", "label": "careless"}, {"id": "b", "label": "very careful"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Context clues are the:$tl$, $tl$[{"id": "a", "label": "dictionary only"}, {"id": "b", "label": "page numbers"}, {"id": "c", "label": "title"}, {"id": "d", "label": "surrounding words that hint at meaning"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The root 'tele' in 'telephone' means:$tl$, $tl$[{"id": "a", "label": "near"}, {"id": "b", "label": "far / distant"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "small"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "They reached a unanimous decision; everyone agreed." "Unanimous" means:$tl$, $tl$[{"id": "a", "label": "divided"}, {"id": "b", "label": "unsure"}, {"id": "c", "label": "in complete agreement"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-meaning$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Text Structure (RI.6.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$text-structure$tl$, $tl$Text Structure$tl$, $tl$Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution.$tl$, 6, $tl$RI.6.5$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Text Structure$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Text Structure", "body": "Authors organize texts as sequence, cause-effect, compare-contrast, or problem-solution."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A text organized by time order uses a ____ structure.\n\nThe answer is \"chronological / sequence\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A text explaining reasons and results uses:\n\nThe answer is \"cause and effect\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text showing similarities and differences uses:\n\nThe answer is \"compare and contrast\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text that names an issue and offers fixes uses:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "problem and solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}], "answer": "b", "explanation": "Yes! The answer is \"problem and solution\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'first, then, finally' point to a ____ structure.", "choices": [{"id": "a", "label": "compare"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "sequence"}], "answer": "d", "explanation": "Yes! The answer is \"sequence\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'because, therefore, as a result' point to:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "description"}, {"id": "d", "label": "cause and effect"}], "answer": "d", "explanation": "Yes! The answer is \"cause and effect\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Text Structure! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text organized by time order uses a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare-contrast"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "chronological / sequence"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text explaining reasons and results uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause and effect"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text showing similarities and differences uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text that names an issue and offers fixes uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "problem and solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Signal words 'first, then, finally' point to a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "sequence"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Signal words 'because, therefore, as a result' point to:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Signal words 'similarly, however, unlike' point to:$tl$, $tl$[{"id": "a", "label": "compare and contrast"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A biography told from birth to death follows a:$tl$, $tl$[{"id": "a", "label": "chronological structure"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An essay on 'pollution and how to reduce it' uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare only"}, {"id": "c", "label": "problem and solution"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Identifying structure helps a reader:$tl$, $tl$[{"id": "a", "label": "pick a font"}, {"id": "b", "label": "follow and organize the ideas"}, {"id": "c", "label": "count pages"}, {"id": "d", "label": "ignore content"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A passage describing a place's sights, sounds, and smells uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "description"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An article comparing two energy sources side by side uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$'Deforestation caused habitat loss, which led to fewer species' shows:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Headings, subheadings, and signal words are clues to a text's:$tl$, $tl$[{"id": "a", "label": "structure"}, {"id": "b", "label": "price"}, {"id": "c", "label": "author"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A recipe or set of directions is usually organized by:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A text arranged in time order uses a ____ (time-order) structure. (one word)$tl$, null, $tl$chronological$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A text may combine structures, like comparing the causes of two events, blending:$tl$, $tl$[{"id": "a", "label": "only description"}, {"id": "b", "label": "only sequence"}, {"id": "c", "label": "compare-contrast and cause-effect"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Recognizing problem-solution structure helps you find the author's proposed:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "rhyme"}, {"id": "c", "label": "title"}, {"id": "d", "label": "solution"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A timeline visual best matches a ____ text structure.$tl$, $tl$[{"id": "a", "label": "chronological / sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "description"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Knowing the structure first makes a complex text:$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "impossible"}, {"id": "c", "label": "cheaper"}, {"id": "d", "label": "easier to understand"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Figurative Language (L.6.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$figurative-language$tl$, $tl$Figurative Language$tl$, $tl$Similes, metaphors, personification, idioms, and hyperbole add meaning and imagery.$tl$, 6, $tl$L.6.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Figurative Language$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Figurative Language", "body": "Similes, metaphors, personification, idioms, and hyperbole add meaning and imagery."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  \"The world is a stage\" is a:\n\nThe answer is \"metaphor\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  \"As brave as a lion\" is a:\n\nThe answer is \"simile\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Giving human traits to nonhuman things is:\n\nThe answer is \"personification\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "\"I have a ton of homework\" is an exaggeration called:", "choices": [{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "idiom"}], "answer": "c", "explanation": "Yes! The answer is \"hyperbole\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An expression like 'spill the beans' whose meaning isn't literal is an:", "choices": [{"id": "a", "label": "idiom"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "onomatopoeia"}], "answer": "a", "explanation": "Yes! The answer is \"idiom\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Words like 'crash' and 'hiss' that imitate sounds are:", "choices": [{"id": "a", "label": "similes"}, {"id": "b", "label": "onomatopoeia"}, {"id": "c", "label": "metaphors"}, {"id": "d", "label": "idioms"}], "answer": "b", "explanation": "Yes! The answer is \"onomatopoeia\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Figurative Language! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"The world is a stage" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "fact"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "question"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"As brave as a lion" is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "hyperbole"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Giving human traits to nonhuman things is:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "onomatopoeia"}, {"id": "d", "label": "personification"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"I have a ton of homework" is an exaggeration called:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "idiom"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An expression like 'spill the beans' whose meaning isn't literal is an:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Words like 'crash' and 'hiss' that imitate sounds are:$tl$, $tl$[{"id": "a", "label": "similes"}, {"id": "b", "label": "onomatopoeia"}, {"id": "c", "label": "metaphors"}, {"id": "d", "label": "idioms"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"The wind howled through the night" uses:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "an idiom"}, {"id": "d", "label": "personification"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A simile compares two things using:$tl$, $tl$[{"id": "a", "label": "like or as"}, {"id": "b", "label": "is"}, {"id": "c", "label": "and"}, {"id": "d", "label": "the"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A metaphor states that one thing:$tl$, $tl$[{"id": "a", "label": "is another"}, {"id": "b", "label": "is like another"}, {"id": "c", "label": "is near another"}, {"id": "d", "label": "is bigger"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"Her words were music to my ears" is a:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "idiom"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"He runs like the wind" is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "onomatopoeia"}, {"id": "d", "label": "simile"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$'Break the ice' meaning to ease tension is an:$tl$, $tl$[{"id": "a", "label": "a literal action"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"The old floor groaned under our feet" gives the floor a human action, so it's:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "personification"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "an idiom"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"My backpack weighs a thousand pounds!" is:$tl$, $tl$[{"id": "a", "label": "a fact"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "onomatopoeia"}, {"id": "d", "label": "hyperbole"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Symbolism is when an object represents a larger:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "idea"}, {"id": "c", "label": "number"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$A comparison using 'like' or 'as' is a ____. (one word)$tl$, null, $tl$simile$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"Time is money" is an example of a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "onomatopoeia"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Authors use figurative language to:$tl$, $tl$[{"id": "a", "label": "state plain facts only"}, {"id": "b", "label": "create vivid images and deeper meaning"}, {"id": "c", "label": "fill space"}, {"id": "d", "label": "confuse readers"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$"The thunder grumbled in the distance" is:$tl$, $tl$[{"id": "a", "label": "personification"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "an idiom"}, {"id": "d", "label": "a fact"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which is NOT figurative language?$tl$, $tl$[{"id": "a", "label": "The bell rang at noon."}, {"id": "b", "label": "She's a night owl."}, {"id": "c", "label": "Quiet as a mouse."}, {"id": "d", "label": "The stars winked."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-language$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Comparing Texts (RI.6.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-texts$tl$, $tl$Comparing Texts$tl$, $tl$Comparing texts and genres on a topic reveals different viewpoints and approaches.$tl$, 6, $tl$RI.6.9$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Texts$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Comparing Texts", "body": "Comparing texts and genres on a topic reveals different viewpoints and approaches."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Comparing two texts on the same topic helps reveal their different:\n\nThe answer is \"approaches and viewpoints\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A memoir and a news article about the same event differ most in:\n\nThe answer is \"point of view and tone\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Two authors may present the same facts but reach different:\n\nThe answer is \"conclusions\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A poem and an essay on nature differ in their:", "choices": [{"id": "a", "label": "form and style"}, {"id": "b", "label": "subject"}, {"id": "c", "label": "truth"}, {"id": "d", "label": "alphabet"}], "answer": "a", "explanation": "Yes! The answer is \"form and style\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Reading multiple sources on a topic helps a reader:", "choices": [{"id": "a", "label": "build a fuller understanding"}, {"id": "b", "label": "get less information"}, {"id": "c", "label": "ignore facts"}, {"id": "d", "label": "memorize fonts"}], "answer": "a", "explanation": "Yes! The answer is \"build a fuller understanding\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A primary source is an account from:", "choices": [{"id": "a", "label": "a later textbook only"}, {"id": "b", "label": "fiction always"}, {"id": "c", "label": "someone who was there"}, {"id": "d", "label": "an unrelated topic"}], "answer": "c", "explanation": "Yes! The answer is \"someone who was there\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Comparing Texts! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Comparing two texts on the same topic helps reveal their different:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "fonts"}, {"id": "c", "label": "prices"}, {"id": "d", "label": "approaches and viewpoints"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A memoir and a news article about the same event differ most in:$tl$, $tl$[{"id": "a", "label": "the date"}, {"id": "b", "label": "whether it happened"}, {"id": "c", "label": "point of view and tone"}, {"id": "d", "label": "the planet"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two authors may present the same facts but reach different:$tl$, $tl$[{"id": "a", "label": "page counts"}, {"id": "b", "label": "titles"}, {"id": "c", "label": "conclusions"}, {"id": "d", "label": "fonts"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A poem and an essay on nature differ in their:$tl$, $tl$[{"id": "a", "label": "subject"}, {"id": "b", "label": "form and style"}, {"id": "c", "label": "truth"}, {"id": "d", "label": "alphabet"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Reading multiple sources on a topic helps a reader:$tl$, $tl$[{"id": "a", "label": "get less information"}, {"id": "b", "label": "ignore facts"}, {"id": "c", "label": "memorize fonts"}, {"id": "d", "label": "build a fuller understanding"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A primary source is an account from:$tl$, $tl$[{"id": "a", "label": "someone who was there"}, {"id": "b", "label": "a later textbook only"}, {"id": "c", "label": "fiction always"}, {"id": "d", "label": "an unrelated topic"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A secondary source:$tl$, $tl$[{"id": "a", "label": "is always an eyewitness"}, {"id": "b", "label": "is fiction"}, {"id": "c", "label": "analyzes or describes events after the fact"}, {"id": "d", "label": "has no facts"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When two texts disagree, a careful reader:$tl$, $tl$[{"id": "a", "label": "believes the longer one"}, {"id": "b", "label": "ignores both"}, {"id": "c", "label": "weighs the evidence in each"}, {"id": "d", "label": "picks randomly"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A documentary and a written report on whales are alike because both:$tl$, $tl$[{"id": "a", "label": "are poems"}, {"id": "b", "label": "are fiction"}, {"id": "c", "label": "aim to inform about whales"}, {"id": "d", "label": "have no facts"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Comparing a story to its film version often shows the film:$tl$, $tl$[{"id": "a", "label": "changes or cuts some details"}, {"id": "b", "label": "adds nothing"}, {"id": "c", "label": "is identical"}, {"id": "d", "label": "has no characters"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Different genres can explore the same theme, such as:$tl$, $tl$[{"id": "a", "label": "the same exact plot"}, {"id": "b", "label": "courage"}, {"id": "c", "label": "the same author"}, {"id": "d", "label": "the same length"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Synthesizing sources means:$tl$, $tl$[{"id": "a", "label": "copying one source"}, {"id": "b", "label": "ignoring all"}, {"id": "c", "label": "reading none"}, {"id": "d", "label": "combining ideas from several texts"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Two charts of the same data may differ in:$tl$, $tl$[{"id": "a", "label": "the facts"}, {"id": "b", "label": "how they present it"}, {"id": "c", "label": "the truth"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An author's bias can be spotted by comparing a text to:$tl$, $tl$[{"id": "a", "label": "other sources on the topic"}, {"id": "b", "label": "its page number"}, {"id": "c", "label": "its font"}, {"id": "d", "label": "its cover"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Reading firsthand and secondhand accounts of an event reveals differences in:$tl$, $tl$[{"id": "a", "label": "detail and perspective"}, {"id": "b", "label": "the event itself"}, {"id": "c", "label": "the year only"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Looking at how two texts are alike and different is to ____ them. (one word, starts with c)$tl$, null, $tl$compare$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A scientific article and an opinion blog on climate differ mainly in:$tl$, $tl$[{"id": "a", "label": "the topic"}, {"id": "b", "label": "the alphabet"}, {"id": "c", "label": "the length only"}, {"id": "d", "label": "evidence and reliability"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$When texts present conflicting information, the reader should check the:$tl$, $tl$[{"id": "a", "label": "sources and evidence"}, {"id": "b", "label": "page color"}, {"id": "c", "label": "font size"}, {"id": "d", "label": "author's age"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Comparing how two poets describe the sea highlights each poet's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "style and word choice"}, {"id": "c", "label": "publisher"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Gathering several viewpoints before forming an opinion is a sign of:$tl$, $tl$[{"id": "a", "label": "lazy reading"}, {"id": "b", "label": "skipping"}, {"id": "c", "label": "critical reading"}, {"id": "d", "label": "guessing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Plot & Conflict (RL.6.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plot-and-conflict$tl$, $tl$Plot & Conflict$tl$, $tl$Plot is the sequence of events; conflict is the central struggle that drives the story.$tl$, 6, $tl$RL.6.3$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plot & Conflict$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Plot & Conflict", "body": "Plot is the sequence of events; conflict is the central struggle that drives the story."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The series of events in a story is the:\n\nThe answer is \"plot\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The problem the characters face is the:\n\nThe answer is \"conflict\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A struggle between two characters is an example of:\n\nThe answer is \"character vs. character conflict\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A character battling a storm shows:", "choices": [{"id": "a", "label": "character vs. character"}, {"id": "b", "label": "character vs. nature"}, {"id": "c", "label": "character vs. self"}, {"id": "d", "label": "no conflict"}], "answer": "b", "explanation": "Yes! The answer is \"character vs. nature\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A character struggling with a tough decision shows:", "choices": [{"id": "a", "label": "character vs. nature"}, {"id": "b", "label": "character vs. character"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "character vs. self"}], "answer": "d", "explanation": "Yes! The answer is \"character vs. self\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The part of the plot that builds tension toward the climax is the:", "choices": [{"id": "a", "label": "resolution"}, {"id": "b", "label": "exposition only"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "rising action"}], "answer": "d", "explanation": "Yes! The answer is \"rising action\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plot & Conflict! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The series of events in a story is the:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "plot"}, {"id": "d", "label": "narrator"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The problem the characters face is the:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "title"}, {"id": "c", "label": "genre"}, {"id": "d", "label": "conflict"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A struggle between two characters is an example of:$tl$, $tl$[{"id": "a", "label": "character vs. self"}, {"id": "b", "label": "character vs. nature"}, {"id": "c", "label": "no conflict"}, {"id": "d", "label": "character vs. character conflict"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A character battling a storm shows:$tl$, $tl$[{"id": "a", "label": "character vs. nature"}, {"id": "b", "label": "character vs. character"}, {"id": "c", "label": "character vs. self"}, {"id": "d", "label": "no conflict"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A character struggling with a tough decision shows:$tl$, $tl$[{"id": "a", "label": "character vs. nature"}, {"id": "b", "label": "character vs. self"}, {"id": "c", "label": "character vs. character"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The part of the plot that builds tension toward the climax is the:$tl$, $tl$[{"id": "a", "label": "resolution"}, {"id": "b", "label": "exposition only"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "rising action"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The turning point of highest tension is the:$tl$, $tl$[{"id": "a", "label": "climax"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "resolution"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The part where the conflict is resolved is the:$tl$, $tl$[{"id": "a", "label": "rising action"}, {"id": "b", "label": "climax"}, {"id": "c", "label": "exposition"}, {"id": "d", "label": "resolution"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The beginning that introduces characters and setting is the:$tl$, $tl$[{"id": "a", "label": "climax"}, {"id": "b", "label": "resolution"}, {"id": "c", "label": "exposition"}, {"id": "d", "label": "conflict"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$After the climax, events that wind down are the:$tl$, $tl$[{"id": "a", "label": "falling action"}, {"id": "b", "label": "rising action"}, {"id": "c", "label": "exposition"}, {"id": "d", "label": "theme"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A conflict between a person and society's rules is:$tl$, $tl$[{"id": "a", "label": "character vs. nature"}, {"id": "b", "label": "character vs. self"}, {"id": "c", "label": "character vs. society"}, {"id": "d", "label": "no conflict"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The conflict usually drives the:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "plot forward"}, {"id": "c", "label": "font"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Without a conflict, most stories would have:$tl$, $tl$[{"id": "a", "label": "a better plot"}, {"id": "b", "label": "more pages"}, {"id": "c", "label": "a theme only"}, {"id": "d", "label": "little to no plot"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$An internal conflict happens:$tl$, $tl$[{"id": "a", "label": "between two armies"}, {"id": "b", "label": "inside a character's mind"}, {"id": "c", "label": "with the weather"}, {"id": "d", "label": "on the cover"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Read: "Maya must choose between her dream and helping her family." This is mainly:$tl$, $tl$[{"id": "a", "label": "character vs. nature"}, {"id": "b", "label": "character vs. character"}, {"id": "c", "label": "character vs. self"}, {"id": "d", "label": "no conflict"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$The main problem or struggle in a story is the ____. (one word)$tl$, null, $tl$conflict$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The correct order of plot parts is:$tl$, $tl$[{"id": "a", "label": "climax, exposition, resolution"}, {"id": "b", "label": "resolution, climax, exposition"}, {"id": "c", "label": "rising action, exposition, climax"}, {"id": "d", "label": "exposition, rising action, climax, falling action, resolution"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$A hero fighting a dragon is an example of:$tl$, $tl$[{"id": "a", "label": "character vs. character (or nature)"}, {"id": "b", "label": "character vs. self"}, {"id": "c", "label": "no conflict"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$The setting can create conflict when characters struggle against the:$tl$, $tl$[{"id": "a", "label": "environment"}, {"id": "b", "label": "title"}, {"id": "c", "label": "font"}, {"id": "d", "label": "author"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Identifying the conflict helps a reader understand the story's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "main tension and direction"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-and-conflict$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea.$tl$, 6, $tl$L.6.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Nouns", "body": "A noun names a person, place, thing, or idea."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"library\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"balloon\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"puppy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "brave"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "sister"}], "answer": "d", "explanation": "Yes! The answer is \"sister\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "gallop"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "fluffy"}], "answer": "c", "explanation": "Yes! The answer is \"garden\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "whisper"}, {"id": "b", "label": "window"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "bounce"}], "answer": "b", "explanation": "Yes! The answer is \"window\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "library"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "build"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "river"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "build"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "island"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "village"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action or a state of being.$tl$, 6, $tl$L.6.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Action Verbs", "body": "A verb shows action or a state of being."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an action verb (something you can do)?\n\nThe answer is \"paint\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an action verb (something you can do)?\n\nThe answer is \"scribble\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an action verb (something you can do)?\n\nThe answer is \"march\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "narrow"}], "answer": "a", "explanation": "Yes! The answer is \"build\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "pencil"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "discover"}], "answer": "d", "explanation": "Yes! The answer is \"discover\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "frozen"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "bounce"}], "answer": "d", "explanation": "Yes! The answer is \"bounce\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Action Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "island"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "library"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "river"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "library"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "shiny"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "window"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun.$tl$, 6, $tl$L.6.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Adjectives", "body": "An adjective describes a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"gentle\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"narrow\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"tiny\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "balloon"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "garden"}], "answer": "b", "explanation": "Yes! The answer is \"brave\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "explore"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "slippery"}], "answer": "d", "explanation": "Yes! The answer is \"slippery\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "ancient"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "gallop"}], "answer": "a", "explanation": "Yes! The answer is \"ancient\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Adjectives! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "river"}, {"id": "c", "label": "window"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "build"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "village"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "window"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "build"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun.$tl$, 6, $tl$L.6.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Pronouns", "body": "A pronoun takes the place of a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"I\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"we\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"us\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "gallop"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "you"}, {"id": "d", "label": "island"}], "answer": "c", "explanation": "Yes! The answer is \"you\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "her"}, {"id": "b", "label": "island"}, {"id": "c", "label": "build"}, {"id": "d", "label": "mountain"}], "answer": "a", "explanation": "Yes! The answer is \"her\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "they"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "village"}, {"id": "d", "label": "kitchen"}], "answer": "a", "explanation": "Yes! The answer is \"they\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Pronouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "it"}, {"id": "c", "label": "library"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "us"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "them"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "we"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "you"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "her"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "she"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "him"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "they"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "it"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "us"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "river"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "we"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "you"}, {"id": "c", "label": "library"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "I"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "her"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "she"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "him"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must agree with its subject in number.$tl$, 6, $tl$L.6.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Subject-Verb Agreement", "body": "The verb must agree with its subject in number."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Choose the correct verb: \"The bird ____ every day.\"\n\nThe answer is \"sings\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Choose the correct verb: \"The puppy ____ every day.\"\n\nThe answer is \"wags\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Choose the correct verb: \"The river ____ every day.\"\n\nThe answer is \"flows\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The chef ____ every day.\"", "choices": [{"id": "a", "label": "cook"}, {"id": "b", "label": "cooks"}, {"id": "c", "label": "cooksed"}, {"id": "d", "label": "cooksing"}], "answer": "b", "explanation": "Yes! The answer is \"cooks\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The farmer ____ every day.\"", "choices": [{"id": "a", "label": "plant"}, {"id": "b", "label": "plantsed"}, {"id": "c", "label": "plants"}, {"id": "d", "label": "plantsing"}], "answer": "c", "explanation": "Yes! The answer is \"plants\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The student ____ every day.\"", "choices": [{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "reads"}, {"id": "d", "label": "readsing"}], "answer": "c", "explanation": "Yes! The answer is \"reads\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Subject-Verb Agreement! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plants"}, {"id": "b", "label": "plant"}, {"id": "c", "label": "plantsed"}, {"id": "d", "label": "plantsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wags"}, {"id": "b", "label": "wag"}, {"id": "c", "label": "wagsed"}, {"id": "d", "label": "wagsing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticksed"}, {"id": "c", "label": "ticksing"}, {"id": "d", "label": "ticks"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "perform"}, {"id": "b", "label": "performsed"}, {"id": "c", "label": "performsing"}, {"id": "d", "label": "performs"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistles"}, {"id": "b", "label": "whistle"}, {"id": "c", "label": "whistlesed"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithersing"}, {"id": "d", "label": "slithers"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barksing"}, {"id": "d", "label": "barks"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "play"}, {"id": "b", "label": "plays"}, {"id": "c", "label": "playsed"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flows"}, {"id": "b", "label": "flow"}, {"id": "c", "label": "flowsed"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roarsed"}, {"id": "c", "label": "roars"}, {"id": "d", "label": "roarsing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "cries"}, {"id": "b", "label": "crie"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooksing"}, {"id": "d", "label": "cooks"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "write"}, {"id": "b", "label": "writesed"}, {"id": "c", "label": "writesing"}, {"id": "d", "label": "writes"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "reads"}, {"id": "c", "label": "readsed"}, {"id": "d", "label": "readsing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "paintsed"}, {"id": "c", "label": "paintsing"}, {"id": "d", "label": "paints"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grows"}, {"id": "b", "label": "grow"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hop"}, {"id": "b", "label": "hops"}, {"id": "c", "label": "hopsed"}, {"id": "d", "label": "hopsing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sings"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs describe actions that already happened.$tl$, 6, $tl$L.6.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Past-Tense Verbs", "body": "Past-tense verbs describe actions that already happened."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the past tense of the verb \"run\"?\n\nThe answer is \"ran\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the past tense of the verb \"fly\"?\n\nThe answer is \"flew\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the past tense of the verb \"sing\"?\n\nThe answer is \"sang\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the past tense of the verb \"buy\"?\n\nThe answer is bought."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the past tense of the verb \"teach\"?\n\nThe answer is taught."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the past tense of the verb \"go\"?\n\nThe answer is went."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Past-Tense Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "take"?$tl$, null, $tl$took$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "bring"?$tl$, null, $tl$brought$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "ride"?$tl$, null, $tl$rode$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "drink"?$tl$, null, $tl$drank$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.6.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals show more than one.$tl$, 6, $tl$L.6.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Plural Nouns", "body": "Plurals show more than one."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Write the plural of \"story\".\n\nThe answer is \"stories\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Write the plural of \"lady\".\n\nThe answer is \"ladies\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Write the plural of \"glass\".\n\nThe answer is \"glasses\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Write the plural of \"cherry\".\n\nThe answer is cherries."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Write the plural of \"loaf\".\n\nThe answer is loaves."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Write the plural of \"shelf\".\n\nThe answer is shelves."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plural Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "city".$tl$, null, $tl$cities$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "loaf".$tl$, null, $tl$loaves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capitalization$tl$, $tl$Capitalize sentence beginnings, I, and proper nouns.$tl$, 6, $tl$L.6.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Capitalization", "body": "Capitalize sentence beginnings, I, and proper nouns."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Pacific Ocean\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"December\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"London\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "mountain"}, {"id": "b", "label": "day"}, {"id": "c", "label": "Canada"}, {"id": "d", "label": "river"}], "answer": "c", "explanation": "Yes! The answer is \"Canada\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "friend"}, {"id": "b", "label": "Friday"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "month"}], "answer": "b", "explanation": "Yes! The answer is \"Friday\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "day"}, {"id": "b", "label": "country"}, {"id": "c", "label": "city"}, {"id": "d", "label": "Tokyo"}], "answer": "d", "explanation": "Yes! The answer is \"Tokyo\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Capitalization! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "country"}, {"id": "c", "label": "Friday"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Australia"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "month"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "Mount Everest"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "city"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Maria"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "India"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Nile River"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "Amazon River"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "city"}, {"id": "d", "label": "Pacific Ocean"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Canada"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "Saturn"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "city"}, {"id": "c", "label": "London"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "month"}, {"id": "c", "label": "day"}, {"id": "d", "label": "October"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "month"}, {"id": "c", "label": "Sarah"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "country"}, {"id": "c", "label": "Africa"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "city"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "December"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "country"}, {"id": "d", "label": "Monday"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "river"}, {"id": "c", "label": "day"}, {"id": "d", "label": "July"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "country"}, {"id": "c", "label": "month"}, {"id": "d", "label": "Tuesday"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "Tokyo"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "New York"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End sentences with a period, question mark, or exclamation point.$tl$, 6, $tl$L.6.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: End Punctuation", "body": "End sentences with a period, question mark, or exclamation point."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which end mark best completes the sentence?  \"I love to read___\"\n\nThe answer is \".\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which end mark best completes the sentence?  \"Are you ready___\"\n\nThe answer is \"?\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which end mark best completes the sentence?  \"Where are we going___\"\n\nThe answer is \"?\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"We won the game___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "b", "explanation": "Yes! The answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"Run for your life___\"", "choices": [{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "Yes! The answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"Watch out___\"", "choices": [{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "Yes! The answer is \"!\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about End Punctuation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.6.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$Use commas to separate three or more items in a list.$tl$, 6, $tl$L.6.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 6, $tl$[{"type": "explain", "title": "Let's learn: Commas in a Series", "body": "Use commas to separate three or more items in a list."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like walk, skip, and hop.\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like apples, oranges, and pears.\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like ham, cheese, and lettuce.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like cats, dogs, and fish."}, {"id": "b", "label": "I like cats dogs and fish."}, {"id": "c", "label": "I like cats, dogs and fish"}, {"id": "d", "label": "I like, cats dogs fish."}], "answer": "a", "explanation": "Yes! The answer is \"I like cats, dogs, and fish.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs and bread"}, {"id": "c", "label": "I like milk, eggs, and bread."}, {"id": "d", "label": "I like, milk eggs bread."}], "answer": "c", "explanation": "Yes! The answer is \"I like milk, eggs, and bread.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow and hail"}, {"id": "c", "label": "I like rain, snow, and hail."}, {"id": "d", "label": "I like, rain snow hail."}], "answer": "c", "explanation": "Yes! The answer is \"I like rain, snow, and hail.\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Commas in a Series! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 6, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north south and east."}, {"id": "b", "label": "I like north, south and east"}, {"id": "c", "label": "I like, north south east."}, {"id": "d", "label": "I like north, south, and east."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like, cats dogs fish."}, {"id": "d", "label": "I like cats, dogs, and fish."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples, grapes, and plums."}, {"id": "b", "label": "I like apples grapes and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes, and buses."}, {"id": "c", "label": "I like trains, planes and buses"}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano, drums, and guitar."}, {"id": "b", "label": "I like piano drums and guitar."}, {"id": "c", "label": "I like piano, drums and guitar"}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 6, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring, summer, and fall."}, {"id": "b", "label": "I like spring summer and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis, and golf."}, {"id": "c", "label": "I like soccer, tennis and golf"}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers and bears"}, {"id": "c", "label": "I like, lions tigers bears."}, {"id": "d", "label": "I like lions, tigers, and bears."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens and rulers"}, {"id": "c", "label": "I like, books pens rulers."}, {"id": "d", "label": "I like books, pens, and rulers."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares and triangles"}, {"id": "c", "label": "I like, circles squares triangles."}, {"id": "d", "label": "I like circles, squares, and triangles."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 6, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip and hop"}, {"id": "c", "label": "I like walk, skip, and hop."}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens, and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham cheese and lettuce."}, {"id": "b", "label": "I like ham, cheese, and lettuce."}, {"id": "c", "label": "I like ham, cheese and lettuce"}, {"id": "d", "label": "I like, ham cheese lettuce."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges, and pears."}, {"id": "c", "label": "I like apples, oranges and pears"}, {"id": "d", "label": "I like, apples oranges pears."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green, and blue."}, {"id": "c", "label": "I like red, green and blue"}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 6, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk, eggs, and bread."}, {"id": "b", "label": "I like milk eggs and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold, silver, and bronze."}, {"id": "b", "label": "I like gold silver and bronze."}, {"id": "c", "label": "I like gold, silver and bronze"}, {"id": "d", "label": "I like, gold silver bronze."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow, and hail."}, {"id": "c", "label": "I like rain, snow and hail"}, {"id": "d", "label": "I like, rain snow hail."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump and swim"}, {"id": "c", "label": "I like, run jump swim."}, {"id": "d", "label": "I like run, jump, and swim."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 6, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad, and Grandma."}, {"id": "c", "label": "I like Mom, Dad and Grandma"}, {"id": "d", "label": "I like, Mom Dad Grandma."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 6 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

