-- =====================================================================
-- TopicLeap - Grade 8 full curriculum seed (generated)
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

-- ---- [math] Exponent Rules (8.EE.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$exponent-rules$tl$, $tl$Exponent Rules$tl$, $tl$Use the laws of exponents to multiply, divide, and raise powers to powers.$tl$, 8, $tl$8.EE.A.1$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Exponent Rules$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Exponent Rules", "body": "Use the laws of exponents to multiply, divide, and raise powers to powers."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Simplify and evaluate:  2^1 x 2^1 = ?\n\nThe answer is \"4\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Simplify and evaluate:  3^3 / 3^2 = ?\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Simplify and evaluate:  (2^2)^3 = ?\n\nThe answer is \"64\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Simplify and evaluate:  3^4 / 3^3 = ?\n\nThe answer is 3."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Simplify and evaluate:  (4^3)^2 = ?\n\nThe answer is 4096."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Simplify and evaluate:  2^5 / 2^4 = ?\n\nThe answer is 2."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Exponent Rules! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (3^2)^2 = ?$tl$, null, $tl$81$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  3^5 / 3^2 = ?$tl$, null, $tl$27$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (3^3)^3 = ?$tl$, null, $tl$19683$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  3^4 / 3^3 = ?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  3^3 x 3^1 = ?$tl$, null, $tl$81$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  2^4 / 2^2 = ?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  4^5 / 4^2 = ?$tl$, null, $tl$64$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (4^3)^3 = ?$tl$, null, $tl$262144$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  3^3 x 3^2 = ?$tl$, null, $tl$243$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (3^2)^3 = ?$tl$, null, $tl$729$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (5^3)^3 = ?$tl$, null, $tl$1953125$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  5^3 / 5^1 = ?$tl$, null, $tl$25$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  4^4 / 4^2 = ?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  5^5 / 5^2 = ?$tl$, null, $tl$125$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  4^2 x 4^3 = ?$tl$, null, $tl$1024$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  5^5 / 5^1 = ?$tl$, null, $tl$625$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  6^5 / 6^1 = ?$tl$, null, $tl$1296$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  (6^3)^3 = ?$tl$, null, $tl$10077696$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  3^5 / 3^1 = ?$tl$, null, $tl$81$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Simplify and evaluate:  6^3 x 6^3 = ?$tl$, null, $tl$46656$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$exponent-rules$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Scientific Notation (8.EE.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$scientific-notation$tl$, $tl$Scientific Notation$tl$, $tl$Scientific notation writes very large or small numbers as a number times a power of ten.$tl$, 8, $tl$8.EE.A.3$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Scientific Notation$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Scientific Notation", "body": "Scientific notation writes very large or small numbers as a number times a power of ten."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Write 3.2 x 10^2 as a standard number (no commas).\n\nThe answer is \"320\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Write 7.2 x 10^2 as a standard number (no commas).\n\nThe answer is \"720\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Write 5.2 x 10^2 as a standard number (no commas).\n\nThe answer is \"520\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Write 9.7 x 10^3 as a standard number (no commas).\n\nThe answer is 9700."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Write 2.7 x 10^3 as a standard number (no commas).\n\nThe answer is 2700."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Write 3.6 x 10^3 as a standard number (no commas).\n\nThe answer is 3600."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Scientific Notation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 7.7 x 10^2 as a standard number (no commas).$tl$, null, $tl$770$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 4.2 x 10^2 as a standard number (no commas).$tl$, null, $tl$420$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 3.5 x 10^2 as a standard number (no commas).$tl$, null, $tl$350$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 7.2 x 10^2 as a standard number (no commas).$tl$, null, $tl$720$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 4.9 x 10^2 as a standard number (no commas).$tl$, null, $tl$490$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 9.7 x 10^3 as a standard number (no commas).$tl$, null, $tl$9700$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 5.2 x 10^3 as a standard number (no commas).$tl$, null, $tl$5200$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 6.5 x 10^3 as a standard number (no commas).$tl$, null, $tl$6500$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 1.6 x 10^3 as a standard number (no commas).$tl$, null, $tl$1600$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 1.9 x 10^3 as a standard number (no commas).$tl$, null, $tl$1900$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 9.8 x 10^4 as a standard number (no commas).$tl$, null, $tl$98000$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 7.1 x 10^4 as a standard number (no commas).$tl$, null, $tl$71000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 1.1 x 10^4 as a standard number (no commas).$tl$, null, $tl$11000$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 1.4 x 10^4 as a standard number (no commas).$tl$, null, $tl$14000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 1.9 x 10^4 as a standard number (no commas).$tl$, null, $tl$19000$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 9.6 x 10^5 as a standard number (no commas).$tl$, null, $tl$960000$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 9.4 x 10^5 as a standard number (no commas).$tl$, null, $tl$940000$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 2.9 x 10^5 as a standard number (no commas).$tl$, null, $tl$290000$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 7.6 x 10^5 as a standard number (no commas).$tl$, null, $tl$760000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write 3.9 x 10^5 as a standard number (no commas).$tl$, null, $tl$390000$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$scientific-notation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Square & Cube Roots (8.EE.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$roots$tl$, $tl$Square & Cube Roots$tl$, $tl$A square root undoes squaring; a cube root undoes cubing.$tl$, 8, $tl$8.EE.A.2$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Square & Cube Roots$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Square & Cube Roots", "body": "A square root undoes squaring; a cube root undoes cubing."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the square root of 25?\n\nThe answer is \"5\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the square root of 9?\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the square root of 64?\n\nThe answer is \"8\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the square root of 324?\n\nThe answer is 18."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the square root of 144?\n\nThe answer is 12."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the square root of 256?\n\nThe answer is 16."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Square & Cube Roots! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 16?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 49?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 9?$tl$, null, $tl$3$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 100?$tl$, null, $tl$10$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 81?$tl$, null, $tl$9$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 225?$tl$, null, $tl$15$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 144?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 121?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 256?$tl$, null, $tl$16$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 196?$tl$, null, $tl$14$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 27?$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 125?$tl$, null, $tl$5$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 216?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 64?$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 343?$tl$, null, $tl$7$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 1000?$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 576?$tl$, null, $tl$24$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the square root of 529?$tl$, null, $tl$23$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 729?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the cube root of 512?$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$roots$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Linear Equations (8.EE.C.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$linear-equations$tl$, $tl$Linear Equations$tl$, $tl$Solve equations with variables on both sides by collecting like terms.$tl$, 8, $tl$8.EE.C.7$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Linear Equations$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Linear Equations", "body": "Solve equations with variables on both sides by collecting like terms."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Solve for x:  3x + 1 = 1x + 13\n\nThe answer is \"6\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Solve for x:  4x + 3 = 3x + 10\n\nThe answer is \"7\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Solve for x:  4x + 7 = 3x + 9\n\nThe answer is \"2\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Solve for x:  4x + 5 = 2x + 17\n\nThe answer is 6."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Solve for x:  7x + 10 = 1x + 52\n\nThe answer is 7."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Solve for x:  3x + 12 = 2x + 18\n\nThe answer is 6."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Linear Equations! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  4x + 7 = 3x + 13$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  4x + 9 = 2x + 21$tl$, null, $tl$6$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  3x + 3 = 2x + 9$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  3x + 8 = 2x + 13$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  5x + 9 = 2x + 15$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  7x + 5 = 3x + 29$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  3x + 7 = 1x + 27$tl$, null, $tl$10$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  3x + 4 = 2x + 8$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  6x + 11 = 5x + 15$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  6x + 7 = 3x + 22$tl$, null, $tl$5$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  9x + 10 = 2x + 38$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  9x + 1 = 5x + 37$tl$, null, $tl$9$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  9x + 11 = 8x + 21$tl$, null, $tl$10$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  7x + 6 = 5x + 14$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  7x + 15 = 4x + 45$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  12x + 19 = 4x + 51$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  9x + 5 = 2x + 103$tl$, null, $tl$14$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  11x + 14 = 2x + 104$tl$, null, $tl$10$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  7x + 20 = 4x + 38$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Solve for x:  11x + 4 = 4x + 67$tl$, null, $tl$9$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$linear-equations$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Slope (8.EE.B.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$slope$tl$, $tl$Slope$tl$, $tl$Slope is the rate of change: the rise (change in y) divided by the run (change in x).$tl$, 8, $tl$8.EE.B.6$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Slope$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Slope", "body": "Slope is the rate of change: the rise (change in y) divided by the run (change in x)."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Find the slope of the line through (3, 2) and (6, 11).\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Find the slope of the line through (4, 6) and (5, 9).\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Find the slope of the line through (3, 4) and (7, 20).\n\nThe answer is \"4\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Find the slope of the line through (5, 6) and (9, 26).\n\nThe answer is 5."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Find the slope of the line through (5, 2) and (9, 14).\n\nThe answer is 3."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Find the slope of the line through (4, 3) and (9, 28).\n\nThe answer is 5."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Slope! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (2, 1) and (3, 4).$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (3, 3) and (7, 19).$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 3) and (6, 5).$tl$, null, $tl$2$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (3, 4) and (7, 20).$tl$, null, $tl$4$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (6, 4) and (8, 12).$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 5) and (7, 9).$tl$, null, $tl$2$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (4, 2) and (7, 8).$tl$, null, $tl$2$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (3, 1) and (5, 7).$tl$, null, $tl$3$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (3, 4) and (6, 22).$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 2) and (7, 6).$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 6) and (11, 36).$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (0, 3) and (4, 19).$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (4, 3) and (9, 8).$tl$, null, $tl$1$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (1, 3) and (6, -22).$tl$, null, $tl$-5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (1, 5) and (3, 13).$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 5) and (10, -30).$tl$, null, $tl$-7$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (0, 3) and (6, 27).$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (0, 0) and (3, -27).$tl$, null, $tl$-9$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (5, 4) and (12, -3).$tl$, null, $tl$-1$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Find the slope of the line through (2, 4) and (4, 10).$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Pythagorean Theorem (8.G.B.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pythagorean-theorem$tl$, $tl$Pythagorean Theorem$tl$, $tl$In a right triangle, a^2 + b^2 = c^2, where c is the hypotenuse.$tl$, 8, $tl$8.G.B.7$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pythagorean Theorem$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Pythagorean Theorem", "body": "In a right triangle, a^2 + b^2 = c^2, where c is the hypotenuse."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A right triangle has legs of 6 and 8. What is the length of the hypotenuse?\n\nThe answer is \"10\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A right triangle has legs of 8 and 15. What is the length of the hypotenuse?\n\nThe answer is \"17\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A right triangle has legs of 3 and 4. What is the length of the hypotenuse?\n\nThe answer is \"5\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  A right triangle has a hypotenuse of 25 and one leg of 7. What is the other leg?\n\nThe answer is 24."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  A right triangle has a hypotenuse of 10 and one leg of 6. What is the other leg?\n\nThe answer is 8."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  A right triangle has a hypotenuse of 15 and one leg of 9. What is the other leg?\n\nThe answer is 12."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Pythagorean Theorem! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 17 and one leg of 8. What is the other leg?$tl$, null, $tl$15$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 3 and 4. What is the length of the hypotenuse?$tl$, null, $tl$5$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 5 and one leg of 3. What is the other leg?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 5 and 12. What is the length of the hypotenuse?$tl$, null, $tl$13$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 13 and one leg of 5. What is the other leg?$tl$, null, $tl$12$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 6 and 8. What is the length of the hypotenuse?$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 20 and 21. What is the length of the hypotenuse?$tl$, null, $tl$29$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 8 and 15. What is the length of the hypotenuse?$tl$, null, $tl$17$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 29 and one leg of 20. What is the other leg?$tl$, null, $tl$21$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 7 and 24. What is the length of the hypotenuse?$tl$, null, $tl$25$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 15 and 20. What is the length of the hypotenuse?$tl$, null, $tl$25$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 12 and 16. What is the length of the hypotenuse?$tl$, null, $tl$20$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 9 and 12. What is the length of the hypotenuse?$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 15 and one leg of 9. What is the other leg?$tl$, null, $tl$12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 20 and one leg of 12. What is the other leg?$tl$, null, $tl$16$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 20 and 48. What is the length of the hypotenuse?$tl$, null, $tl$52$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 40 and 42. What is the length of the hypotenuse?$tl$, null, $tl$58$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has legs of 18 and 24. What is the length of the hypotenuse?$tl$, null, $tl$30$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 52 and one leg of 20. What is the other leg?$tl$, null, $tl$48$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A right triangle has a hypotenuse of 26 and one leg of 10. What is the other leg?$tl$, null, $tl$24$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$pythagorean-theorem$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Functions (8.F.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$functions$tl$, $tl$Functions$tl$, $tl$A function pairs each input with exactly one output. Evaluate f(x) by substituting.$tl$, 8, $tl$8.F.A.1$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Functions$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Functions", "body": "A function pairs each input with exactly one output. Evaluate f(x) by substituting."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  If f(x) = 5x + 2, what is f(3)?\n\nThe answer is \"17\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  If f(x) = 5x + 6, what is f(6)?\n\nThe answer is \"36\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  If f(x) = 5x + 7, what is f(3)?\n\nThe answer is \"22\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  If f(x) = 3x + 5, what is f(8)?\n\nThe answer is 29."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  If f(x) = 4x + 1, what is f(6)?\n\nThe answer is 25."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  If f(x) = 3x + 2, what is f(8)?\n\nThe answer is 26."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Functions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 2x + 8, what is f(4)?$tl$, null, $tl$16$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x + 4, what is f(2)?$tl$, null, $tl$14$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 4x + 5, what is f(8)?$tl$, null, $tl$37$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 3x + 6, what is f(6)?$tl$, null, $tl$24$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x + 2, what is f(2)?$tl$, null, $tl$12$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x + 5, what is f(7)?$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 4x + 1, what is f(3)?$tl$, null, $tl$13$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x + 4, what is f(6)?$tl$, null, $tl$34$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 6x + 6, what is f(9)?$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 6x + 11, what is f(8)?$tl$, null, $tl$59$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 2x + 12, what is f(12)?$tl$, null, $tl$36$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 7x + 4, what is f(6)?$tl$, null, $tl$46$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 7x + 14, what is f(9)?$tl$, null, $tl$77$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x + 5, what is f(6)?$tl$, null, $tl$35$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 6x + 8, what is f(4)?$tl$, null, $tl$32$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 2x^2 + 4, what is f(5)?$tl$, null, $tl$54$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x^2 + 7, what is f(2)?$tl$, null, $tl$27$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 3x^2 + 5, what is f(2)?$tl$, null, $tl$17$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 2x^2 + 3, what is f(4)?$tl$, null, $tl$35$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$If f(x) = 5x^2 + 5, what is f(2)?$tl$, null, $tl$25$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$functions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Volume of Cylinders & Cones (8.G.C.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$volume-cylinders-cones$tl$, $tl$Volume of Cylinders & Cones$tl$, $tl$Cylinder volume = pi x r x r x h; a cone is one-third of that. Use 3.14 for pi.$tl$, 8, $tl$8.G.C.9$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Volume of Cylinders & Cones$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Volume of Cylinders & Cones", "body": "Cylinder volume = pi x r x r x h; a cone is one-third of that. Use 3.14 for pi."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Find the volume of a cylinder with radius 3 and height 3. Use 3.14 for pi. (V = pi x r x r x h)\n\nThe answer is \"84.78\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Find the volume of a cylinder with radius 3 and height 7. Use 3.14 for pi. (V = pi x r x r x h)\n\nThe answer is \"197.82\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Find the volume of a cylinder with radius 4 and height 6. Use 3.14 for pi. (V = pi x r x r x h)\n\nThe answer is \"301.44\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the volume of a cylinder with radius 3 and height 4. Use 3.14 for pi. (V = pi x r x r x h)", "choices": [{"id": "a", "label": "226.08"}, {"id": "b", "label": "37.68"}, {"id": "c", "label": "113.04"}, {"id": "d", "label": "75.36"}], "answer": "c", "explanation": "Yes! The answer is \"113.04\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the volume of a cylinder with radius 2 and height 6. Use 3.14 for pi. (V = pi x r x r x h)", "choices": [{"id": "a", "label": "24"}, {"id": "b", "label": "75.36"}, {"id": "c", "label": "37.68"}, {"id": "d", "label": "150.72"}], "answer": "b", "explanation": "Yes! The answer is \"75.36\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Find the volume of a cone with radius 5 and height 6. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)", "choices": [{"id": "a", "label": "157"}, {"id": "b", "label": "150"}, {"id": "c", "label": "471"}, {"id": "d", "label": "78.5"}], "answer": "a", "explanation": "Yes! The answer is \"157\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Volume of Cylinders & Cones! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 3 and height 5. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "47.1"}, {"id": "b", "label": "141.3"}, {"id": "c", "label": "45"}, {"id": "d", "label": "282.6"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 2 and height 5. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "62.8"}, {"id": "b", "label": "125.6"}, {"id": "c", "label": "20"}, {"id": "d", "label": "31.4"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 4 and height 5. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "251.2"}, {"id": "b", "label": "502.4"}, {"id": "c", "label": "62.8"}, {"id": "d", "label": "125.6"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 4 and height 3. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "48"}, {"id": "b", "label": "37.68"}, {"id": "c", "label": "75.36"}, {"id": "d", "label": "150.72"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 4 and height 5. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "80"}, {"id": "b", "label": "251.2"}, {"id": "c", "label": "502.4"}, {"id": "d", "label": "62.8"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 4 and height 4. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "200.96"}, {"id": "b", "label": "66.98666666666666666666666667"}, {"id": "c", "label": "16.74666666666666666666666667"}, {"id": "d", "label": "64"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 4 and height 7. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "117.2266666666666666666666667"}, {"id": "b", "label": "351.68"}, {"id": "c", "label": "29.30666666666666666666666667"}, {"id": "d", "label": "50.24"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 5 and height 9. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "235.5"}, {"id": "b", "label": "47.1"}, {"id": "c", "label": "706.5"}, {"id": "d", "label": "225"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 3 and height 5. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "15.7"}, {"id": "b", "label": "45"}, {"id": "c", "label": "141.3"}, {"id": "d", "label": "47.1"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 5 and height 6. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "471"}, {"id": "b", "label": "31.4"}, {"id": "c", "label": "78.5"}, {"id": "d", "label": "157"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 6 and height 7. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "1582.56"}, {"id": "b", "label": "791.28"}, {"id": "c", "label": "131.88"}, {"id": "d", "label": "252"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 6 and height 12. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "1356.48"}, {"id": "b", "label": "432"}, {"id": "c", "label": "2712.96"}, {"id": "d", "label": "452.16"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 6 and height 8. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "301.44"}, {"id": "b", "label": "1808.64"}, {"id": "c", "label": "904.32"}, {"id": "d", "label": "150.72"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 5 and height 10. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "157"}, {"id": "b", "label": "1570"}, {"id": "c", "label": "314"}, {"id": "d", "label": "785"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cylinder with radius 7 and height 9. Use 3.14 for pi. (V = pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "197.82"}, {"id": "b", "label": "395.64"}, {"id": "c", "label": "441"}, {"id": "d", "label": "1384.74"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 8 and height 14. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "117.2266666666666666666666667"}, {"id": "b", "label": "896"}, {"id": "c", "label": "937.8133333333333333333333333"}, {"id": "d", "label": "2813.44"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 9 and height 3. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "28.26"}, {"id": "b", "label": "254.34"}, {"id": "c", "label": "243"}, {"id": "d", "label": "763.02"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 9 and height 8. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "2034.72"}, {"id": "b", "label": "75.36"}, {"id": "c", "label": "648"}, {"id": "d", "label": "678.24"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 10 and height 4. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "400"}, {"id": "b", "label": "418.6666666666666666666666667"}, {"id": "c", "label": "314"}, {"id": "d", "label": "41.86666666666666666666666667"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Find the volume of a cone with radius 7 and height 7. Use 3.14 for pi. (V = (1/3) x pi x r x r x h)$tl$, $tl$[{"id": "a", "label": "343"}, {"id": "b", "label": "359.0066666666666666666666667"}, {"id": "c", "label": "1077.02"}, {"id": "d", "label": "51.28666666666666666666666667"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$volume-cylinders-cones$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Rational & Irrational Numbers (8.NS.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rational-irrational$tl$, $tl$Rational & Irrational Numbers$tl$, $tl$Rational numbers can be written as fractions; irrational numbers (like pi) cannot.$tl$, 8, $tl$8.NS.A.1$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Rational & Irrational Numbers$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Rational & Irrational Numbers", "body": "Rational numbers can be written as fractions; irrational numbers (like pi) cannot."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Is the number 5 rational or irrational?\n\nThe answer is \"rational\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Is the decimal 0.1010010001... (never repeats) rational or irrational?\n\nThe answer is \"irrational\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Is the square root of 5 rational or irrational?\n\nThe answer is \"irrational\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Is the fraction 2/7 rational or irrational?", "choices": [{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "rational"}, {"id": "d", "label": "neither"}], "answer": "c", "explanation": "Yes! The answer is \"rational\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Is the square root of 20 rational or irrational?", "choices": [{"id": "a", "label": "rational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "irrational"}], "answer": "d", "explanation": "Yes! The answer is \"irrational\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Is the number pi rational or irrational?", "choices": [{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}], "answer": "b", "explanation": "Yes! The answer is \"irrational\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Rational & Irrational Numbers! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.1010010001... (never repeats) rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.11 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "rational"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the repeating decimal 0.333... rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 2 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "irrational"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the number -7 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 25 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the number -4 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "rational"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 7 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 16 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the number pi rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "irrational"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 10 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "irrational"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the fraction 6/3 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "rational"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the fraction 2/6 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "rational"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 20 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.76 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "rational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the fraction 5/9 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the square root of 11 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "irrational"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.41 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.21 rational or irrational?$tl$, $tl$[{"id": "a", "label": "irrational"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "rational"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Is the decimal 0.47 rational or irrational?$tl$, $tl$[{"id": "a", "label": "rational"}, {"id": "b", "label": "irrational"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$rational-irrational$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Slope-Intercept Form (8.F.B.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$slope-intercept$tl$, $tl$Slope-Intercept Form$tl$, $tl$In y = mx + b, m is the slope and b is the y-intercept.$tl$, 8, $tl$8.F.B.4$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Slope-Intercept Form$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Slope-Intercept Form", "body": "In y = mx + b, m is the slope and b is the y-intercept."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  For the line y = 3x + 5, what is the slope?\n\nThe answer is \"3\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  For the line y = 5x + 1, what is the y-intercept?\n\nThe answer is \"1\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  For the line y = 5x + 3, what is the slope?\n\nThe answer is \"5\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  For the line y = 7x + 4, what is the slope?\n\nThe answer is 7."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  For the line y = 6x + 3, what is the y-intercept?\n\nThe answer is 3."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  For the line y = 3x + 1, what is the y-intercept?\n\nThe answer is 1."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Slope-Intercept Form! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 3x + 2, what is the y-intercept?$tl$, null, $tl$2$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 2x + 8, what is the y-intercept?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 2x + 8, what is the slope?$tl$, null, $tl$2$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 5x + 2, what is the slope?$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 3x + 4, what is the slope?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 3x + 8, what is the slope?$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 7x + 10, what is the slope?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 3x + 11, what is the y-intercept?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 6x + 5, what is the slope?$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 2x + 11, what is the slope?$tl$, null, $tl$2$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = -8x + 13, what is the slope?$tl$, null, $tl$-8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 8x + 12, what is the y-intercept?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 6x + 3, what is the slope?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 6x + 5, what is the y-intercept?$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = -6x + 10, what is the y-intercept?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 3x + 6, what is the slope?$tl$, null, $tl$3$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 11x + 11, what is the slope?$tl$, null, $tl$11$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 8x + 13, what is the slope?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 12x + 17, what is the slope?$tl$, null, $tl$12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$For the line y = 12x + 13, what is the y-intercept?$tl$, null, $tl$13$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$slope-intercept$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Forces & Motion (MS-PS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$forces-and-motion$tl$, $tl$Forces & Motion$tl$, $tl$Newton's laws and graphs describe how forces change an object's motion.$tl$, 8, $tl$MS-PS2-2$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Forces & Motion$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Forces & Motion", "body": "Newton's laws and graphs describe how forces change an object's motion."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Newton's second law is written as the equation:\n\nThe answer is \"F = ma\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  If the net force on an object is zero, its velocity is:\n\nThe answer is \"constant (unchanging)\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A 2 kg object accelerating at 3 m/s^2 experiences a net force of:\n\nThe answer is \"6 N\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Acceleration is the rate of change of:", "choices": [{"id": "a", "label": "velocity"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "force"}, {"id": "d", "label": "distance"}], "answer": "a", "explanation": "Yes! The answer is \"velocity\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "On a distance-time graph, a steeper line means a:", "choices": [{"id": "a", "label": "slower speed"}, {"id": "b", "label": "object at rest"}, {"id": "c", "label": "negative mass"}, {"id": "d", "label": "greater speed"}], "answer": "d", "explanation": "Yes! The answer is \"greater speed\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A flat (horizontal) line on a distance-time graph means the object is:", "choices": [{"id": "a", "label": "speeding up"}, {"id": "b", "label": "at rest"}, {"id": "c", "label": "slowing down"}, {"id": "d", "label": "moving fastest"}], "answer": "b", "explanation": "Yes! The answer is \"at rest\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Forces & Motion! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Newton's second law is written as the equation:$tl$, $tl$[{"id": "a", "label": "F = ma"}, {"id": "b", "label": "E = mc^2"}, {"id": "c", "label": "V = IR"}, {"id": "d", "label": "d = rt only"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If the net force on an object is zero, its velocity is:$tl$, $tl$[{"id": "a", "label": "increasing"}, {"id": "b", "label": "constant (unchanging)"}, {"id": "c", "label": "zero always"}, {"id": "d", "label": "random"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A 2 kg object accelerating at 3 m/s^2 experiences a net force of:$tl$, $tl$[{"id": "a", "label": "6 N"}, {"id": "b", "label": "1.5 N"}, {"id": "c", "label": "5 N"}, {"id": "d", "label": "9 N"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Acceleration is the rate of change of:$tl$, $tl$[{"id": "a", "label": "velocity"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "force"}, {"id": "d", "label": "distance"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$On a distance-time graph, a steeper line means a:$tl$, $tl$[{"id": "a", "label": "slower speed"}, {"id": "b", "label": "object at rest"}, {"id": "c", "label": "negative mass"}, {"id": "d", "label": "greater speed"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A flat (horizontal) line on a distance-time graph means the object is:$tl$, $tl$[{"id": "a", "label": "speeding up"}, {"id": "b", "label": "slowing down"}, {"id": "c", "label": "moving fastest"}, {"id": "d", "label": "at rest"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The product of an object's mass and velocity is its:$tl$, $tl$[{"id": "a", "label": "acceleration"}, {"id": "b", "label": "momentum"}, {"id": "c", "label": "force"}, {"id": "d", "label": "energy"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Newton's third law says forces come in:$tl$, $tl$[{"id": "a", "label": "single pushes"}, {"id": "b", "label": "random sizes"}, {"id": "c", "label": "equal and opposite pairs"}, {"id": "d", "label": "no pairs"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Inertia depends on an object's:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "speed only"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An unbalanced force will cause an object to:$tl$, $tl$[{"id": "a", "label": "stay at constant velocity"}, {"id": "b", "label": "accelerate"}, {"id": "c", "label": "disappear"}, {"id": "d", "label": "gain mass"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Doubling the force on a fixed mass will ____ the acceleration.$tl$, $tl$[{"id": "a", "label": "double"}, {"id": "b", "label": "halve"}, {"id": "c", "label": "not change"}, {"id": "d", "label": "cube"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Doubling the mass while keeping force constant will ____ the acceleration.$tl$, $tl$[{"id": "a", "label": "double"}, {"id": "b", "label": "not change"}, {"id": "c", "label": "halve"}, {"id": "d", "label": "triple"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Friction and air resistance are forces that generally:$tl$, $tl$[{"id": "a", "label": "speed motion up"}, {"id": "b", "label": "create mass"}, {"id": "c", "label": "add energy from nothing"}, {"id": "d", "label": "oppose motion"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A car turning a corner at constant speed is still accelerating because its ____ changes.$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "color"}, {"id": "c", "label": "direction (velocity)"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Velocity differs from speed because velocity includes:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "time only"}, {"id": "c", "label": "direction"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Newton's second law: Force = mass x ____ . (one word)$tl$, null, $tl$acceleration$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A rocket moves forward by expelling gas backward, demonstrating Newton's:$tl$, $tl$[{"id": "a", "label": "first law only"}, {"id": "b", "label": "second law only"}, {"id": "c", "label": "law of gravity"}, {"id": "d", "label": "third law"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$On a velocity-time graph, a straight slanted line shows:$tl$, $tl$[{"id": "a", "label": "constant speed"}, {"id": "b", "label": "constant acceleration"}, {"id": "c", "label": "an object at rest"}, {"id": "d", "label": "zero force"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Momentum is conserved in a closed system during a:$tl$, $tl$[{"id": "a", "label": "temperature change"}, {"id": "b", "label": "color change"}, {"id": "c", "label": "collision"}, {"id": "d", "label": "name change"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The SI unit of force is the:$tl$, $tl$[{"id": "a", "label": "newton"}, {"id": "b", "label": "joule"}, {"id": "c", "label": "watt"}, {"id": "d", "label": "meter"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$forces-and-motion$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Energy & Its Conservation (MS-PS3-5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$energy-transfer$tl$, $tl$Energy & Its Conservation$tl$, $tl$Energy changes form and is conserved; work transfers energy to objects.$tl$, 8, $tl$MS-PS3-5$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Energy & Its Conservation$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Energy & Its Conservation", "body": "Energy changes form and is conserved; work transfers energy to objects."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Kinetic energy depends on an object's mass and its:\n\nThe answer is \"speed (velocity)\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Gravitational potential energy depends on mass, gravity, and:\n\nThe answer is \"height\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The law of conservation of energy says energy is:\n\nThe answer is \"never created or destroyed\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "As a roller coaster descends, potential energy transforms into:", "choices": [{"id": "a", "label": "chemical energy"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "kinetic energy"}, {"id": "d", "label": "sound only"}], "answer": "c", "explanation": "Yes! The answer is \"kinetic energy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Doing work on an object transfers ____ to it.", "choices": [{"id": "a", "label": "mass"}, {"id": "b", "label": "color"}, {"id": "c", "label": "charge"}, {"id": "d", "label": "energy"}], "answer": "d", "explanation": "Yes! The answer is \"energy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The SI unit of energy and work is the:", "choices": [{"id": "a", "label": "newton"}, {"id": "b", "label": "watt"}, {"id": "c", "label": "joule"}, {"id": "d", "label": "meter"}], "answer": "c", "explanation": "Yes! The answer is \"joule\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Energy & Its Conservation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Kinetic energy depends on an object's mass and its:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "temperature only"}, {"id": "c", "label": "charge"}, {"id": "d", "label": "speed (velocity)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Gravitational potential energy depends on mass, gravity, and:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "height"}, {"id": "c", "label": "speed"}, {"id": "d", "label": "charge"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The law of conservation of energy says energy is:$tl$, $tl$[{"id": "a", "label": "never created or destroyed"}, {"id": "b", "label": "always increasing"}, {"id": "c", "label": "always lost"}, {"id": "d", "label": "made from nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$As a roller coaster descends, potential energy transforms into:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "chemical energy"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "sound only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Doing work on an object transfers ____ to it.$tl$, $tl$[{"id": "a", "label": "energy"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "color"}, {"id": "d", "label": "charge"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The SI unit of energy and work is the:$tl$, $tl$[{"id": "a", "label": "joule"}, {"id": "b", "label": "newton"}, {"id": "c", "label": "watt"}, {"id": "d", "label": "meter"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Thermal energy always flows from ____ to colder regions.$tl$, $tl$[{"id": "a", "label": "colder"}, {"id": "b", "label": "equal"}, {"id": "c", "label": "hotter"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A stretched spring stores ____ energy.$tl$, $tl$[{"id": "a", "label": "elastic potential"}, {"id": "b", "label": "kinetic"}, {"id": "c", "label": "thermal"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$When a moving car brakes, kinetic energy is mostly transformed into:$tl$, $tl$[{"id": "a", "label": "thermal energy (heat)"}, {"id": "b", "label": "new matter"}, {"id": "c", "label": "light only"}, {"id": "d", "label": "sound only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Power is the rate at which ____ is transferred.$tl$, $tl$[{"id": "a", "label": "energy (work)"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "force"}, {"id": "d", "label": "distance"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Chemical energy is stored in the:$tl$, $tl$[{"id": "a", "label": "bonds between atoms"}, {"id": "b", "label": "motion of objects"}, {"id": "c", "label": "height of objects"}, {"id": "d", "label": "color of objects"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A pendulum at its highest point has the most:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "sound energy"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "potential energy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A pendulum at its lowest point has the most:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "potential energy"}, {"id": "c", "label": "chemical energy"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Efficiency compares useful output energy to total:$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "input energy"}, {"id": "c", "label": "force"}, {"id": "d", "label": "time only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Energy 'lost' to friction is usually transformed into:$tl$, $tl$[{"id": "a", "label": "nothing"}, {"id": "b", "label": "new matter"}, {"id": "c", "label": "light only"}, {"id": "d", "label": "heat"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Energy of motion is called ____ energy. (one word)$tl$, null, $tl$kinetic$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A solar panel transforms light energy into:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "mass"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "electrical energy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Lifting a box increases its:$tl$, $tl$[{"id": "a", "label": "kinetic energy"}, {"id": "b", "label": "potential energy"}, {"id": "c", "label": "thermal energy"}, {"id": "d", "label": "charge"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The total mechanical energy (KE + PE) of a system with no friction stays:$tl$, $tl$[{"id": "a", "label": "increasing"}, {"id": "b", "label": "zero"}, {"id": "c", "label": "random"}, {"id": "d", "label": "constant"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which is a unit of power?$tl$, $tl$[{"id": "a", "label": "watt"}, {"id": "b", "label": "joule"}, {"id": "c", "label": "newton"}, {"id": "d", "label": "meter"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$energy-transfer$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Waves & Information (MS-PS4-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$waves$tl$, $tl$Waves & Information$tl$, $tl$Waves carry energy and information; light and sound have measurable properties.$tl$, 8, $tl$MS-PS4-3$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Waves & Information$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Waves & Information", "body": "Waves carry energy and information; light and sound have measurable properties."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Waves transfer ____ without permanently transferring matter.\n\nThe answer is \"energy\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The number of wave cycles per second is the:\n\nThe answer is \"frequency\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Wave speed equals frequency times:\n\nThe answer is \"wavelength\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Sound is a ____ wave that needs a medium.", "choices": [{"id": "a", "label": "longitudinal (mechanical)"}, {"id": "b", "label": "transverse only"}, {"id": "c", "label": "electromagnetic"}, {"id": "d", "label": "light"}], "answer": "a", "explanation": "Yes! The answer is \"longitudinal (mechanical)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Light is an ____ wave that can travel through a vacuum.", "choices": [{"id": "a", "label": "mechanical"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "electromagnetic"}, {"id": "d", "label": "water"}], "answer": "c", "explanation": "Yes! The answer is \"electromagnetic\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Higher frequency light corresponds to:", "choices": [{"id": "a", "label": "lower energy"}, {"id": "b", "label": "no energy"}, {"id": "c", "label": "slower speed"}, {"id": "d", "label": "higher energy"}], "answer": "d", "explanation": "Yes! The answer is \"higher energy\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Waves & Information! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Waves transfer ____ without permanently transferring matter.$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "energy"}, {"id": "c", "label": "atoms"}, {"id": "d", "label": "temperature"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The number of wave cycles per second is the:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "wavelength"}, {"id": "c", "label": "frequency"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Wave speed equals frequency times:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "period"}, {"id": "c", "label": "mass"}, {"id": "d", "label": "wavelength"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Sound is a ____ wave that needs a medium.$tl$, $tl$[{"id": "a", "label": "longitudinal (mechanical)"}, {"id": "b", "label": "transverse only"}, {"id": "c", "label": "electromagnetic"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Light is an ____ wave that can travel through a vacuum.$tl$, $tl$[{"id": "a", "label": "mechanical"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "water"}, {"id": "d", "label": "electromagnetic"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Higher frequency light corresponds to:$tl$, $tl$[{"id": "a", "label": "lower energy"}, {"id": "b", "label": "higher energy"}, {"id": "c", "label": "no energy"}, {"id": "d", "label": "slower speed"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Increasing amplitude increases a wave's:$tl$, $tl$[{"id": "a", "label": "frequency"}, {"id": "b", "label": "energy"}, {"id": "c", "label": "wavelength"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$When a wave passes from one medium to another and bends, it is:$tl$, $tl$[{"id": "a", "label": "reflected"}, {"id": "b", "label": "absorbed"}, {"id": "c", "label": "refracted"}, {"id": "d", "label": "created"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The electromagnetic spectrum ranges from radio waves to:$tl$, $tl$[{"id": "a", "label": "sound waves"}, {"id": "b", "label": "water waves"}, {"id": "c", "label": "gamma rays"}, {"id": "d", "label": "seismic waves"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Digital signals are more reliable than analog because they:$tl$, $tl$[{"id": "a", "label": "are slower"}, {"id": "b", "label": "use no energy"}, {"id": "c", "label": "resist noise and copy without loss"}, {"id": "d", "label": "are louder"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The bouncing of a wave off a surface is:$tl$, $tl$[{"id": "a", "label": "reflection"}, {"id": "b", "label": "refraction"}, {"id": "c", "label": "diffraction only"}, {"id": "d", "label": "absorption"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Visible light is between ____ and ultraviolet on the spectrum.$tl$, $tl$[{"id": "a", "label": "gamma rays"}, {"id": "b", "label": "infrared"}, {"id": "c", "label": "radio waves"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A higher-pitched sound has a higher:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "wavelength"}, {"id": "c", "label": "speed in air"}, {"id": "d", "label": "frequency"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If wave speed is constant and frequency increases, wavelength:$tl$, $tl$[{"id": "a", "label": "decreases"}, {"id": "b", "label": "increases"}, {"id": "c", "label": "stays the same"}, {"id": "d", "label": "becomes zero"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Information can be sent over distances using patterns in:$tl$, $tl$[{"id": "a", "label": "matter only"}, {"id": "b", "label": "light and radio waves"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "shadows only"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Wave speed = frequency x ____ . (one word)$tl$, null, $tl$wavelength$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$X-rays and microwaves are both types of:$tl$, $tl$[{"id": "a", "label": "sound waves"}, {"id": "b", "label": "ocean waves"}, {"id": "c", "label": "seismic waves"}, {"id": "d", "label": "electromagnetic waves"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An echo is produced by the ____ of sound waves.$tl$, $tl$[{"id": "a", "label": "refraction"}, {"id": "b", "label": "absorption"}, {"id": "c", "label": "reflection"}, {"id": "d", "label": "creation"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Compared to sound, light in air travels:$tl$, $tl$[{"id": "a", "label": "much faster"}, {"id": "b", "label": "slower"}, {"id": "c", "label": "at the same speed"}, {"id": "d", "label": "backward"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The distance from one crest to the next is the:$tl$, $tl$[{"id": "a", "label": "amplitude"}, {"id": "b", "label": "wavelength"}, {"id": "c", "label": "frequency"}, {"id": "d", "label": "period"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$waves$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Chemical Reactions (MS-PS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$chemical-reactions$tl$, $tl$Chemical Reactions$tl$, $tl$Reactions rearrange atoms and conserve mass; bonds form by sharing or transferring electrons.$tl$, 8, $tl$MS-PS1-2$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Chemical Reactions$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Chemical Reactions", "body": "Reactions rearrange atoms and conserve mass; bonds form by sharing or transferring electrons."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  In a chemical reaction, atoms are:\n\nThe answer is \"rearranged, not created or destroyed\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A balanced equation has equal numbers of each atom on:\n\nThe answer is \"both sides\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  The principle that mass is the same before and after a reaction is:\n\nThe answer is \"conservation of mass\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Evidence of a chemical reaction can include a color change, gas, or:", "choices": [{"id": "a", "label": "a change in shape only"}, {"id": "b", "label": "melting only"}, {"id": "c", "label": "dissolving only"}, {"id": "d", "label": "temperature change"}], "answer": "d", "explanation": "Yes! The answer is \"temperature change\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A reaction that releases energy (heat) is:", "choices": [{"id": "a", "label": "endothermic"}, {"id": "b", "label": "physical"}, {"id": "c", "label": "neutral"}, {"id": "d", "label": "exothermic"}], "answer": "d", "explanation": "Yes! The answer is \"exothermic\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A reaction that absorbs energy is:", "choices": [{"id": "a", "label": "exothermic"}, {"id": "b", "label": "physical"}, {"id": "c", "label": "endothermic"}, {"id": "d", "label": "instant"}], "answer": "c", "explanation": "Yes! The answer is \"endothermic\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Chemical Reactions! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$In a chemical reaction, atoms are:$tl$, $tl$[{"id": "a", "label": "destroyed"}, {"id": "b", "label": "rearranged, not created or destroyed"}, {"id": "c", "label": "created from nothing"}, {"id": "d", "label": "turned to energy only"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A balanced equation has equal numbers of each atom on:$tl$, $tl$[{"id": "a", "label": "both sides"}, {"id": "b", "label": "the left only"}, {"id": "c", "label": "the right only"}, {"id": "d", "label": "neither side"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The principle that mass is the same before and after a reaction is:$tl$, $tl$[{"id": "a", "label": "conservation of energy"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "conservation of mass"}, {"id": "d", "label": "inertia"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Evidence of a chemical reaction can include a color change, gas, or:$tl$, $tl$[{"id": "a", "label": "a change in shape only"}, {"id": "b", "label": "melting only"}, {"id": "c", "label": "dissolving only"}, {"id": "d", "label": "temperature change"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A reaction that releases energy (heat) is:$tl$, $tl$[{"id": "a", "label": "endothermic"}, {"id": "b", "label": "physical"}, {"id": "c", "label": "neutral"}, {"id": "d", "label": "exothermic"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A reaction that absorbs energy is:$tl$, $tl$[{"id": "a", "label": "exothermic"}, {"id": "b", "label": "endothermic"}, {"id": "c", "label": "physical"}, {"id": "d", "label": "instant"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$In 2H2 + O2 -> 2H2O, the substances on the left are the:$tl$, $tl$[{"id": "a", "label": "reactants"}, {"id": "b", "label": "products"}, {"id": "c", "label": "catalysts"}, {"id": "d", "label": "ions"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A substance that speeds a reaction without being consumed is a:$tl$, $tl$[{"id": "a", "label": "reactant"}, {"id": "b", "label": "product"}, {"id": "c", "label": "catalyst"}, {"id": "d", "label": "precipitate"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Atoms bond by sharing or transferring:$tl$, $tl$[{"id": "a", "label": "protons"}, {"id": "b", "label": "neutrons"}, {"id": "c", "label": "electrons"}, {"id": "d", "label": "nuclei"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A covalent bond involves ____ electrons.$tl$, $tl$[{"id": "a", "label": "transferring"}, {"id": "b", "label": "destroying"}, {"id": "c", "label": "sharing"}, {"id": "d", "label": "creating"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An ionic bond involves ____ electrons.$tl$, $tl$[{"id": "a", "label": "sharing"}, {"id": "b", "label": "destroying"}, {"id": "c", "label": "creating"}, {"id": "d", "label": "transferring"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Rusting iron is an example of a:$tl$, $tl$[{"id": "a", "label": "physical change"}, {"id": "b", "label": "chemical change"}, {"id": "c", "label": "phase change"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Subscripts in a chemical formula indicate the number of:$tl$, $tl$[{"id": "a", "label": "molecules only"}, {"id": "b", "label": "reactions"}, {"id": "c", "label": "atoms of each element"}, {"id": "d", "label": "grams"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Coefficients in a balanced equation indicate the number of:$tl$, $tl$[{"id": "a", "label": "atoms only"}, {"id": "b", "label": "molecules (or moles)"}, {"id": "c", "label": "electrons"}, {"id": "d", "label": "grams"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If 8 g reacts with 12 g in a sealed flask, the products mass is:$tl$, $tl$[{"id": "a", "label": "4 g"}, {"id": "b", "label": "12 g"}, {"id": "c", "label": "0 g"}, {"id": "d", "label": "20 g"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The starting substances in a chemical reaction are the ____. (one word)$tl$, null, $tl$reactants$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Burning (combustion) typically combines a fuel with:$tl$, $tl$[{"id": "a", "label": "nitrogen"}, {"id": "b", "label": "helium"}, {"id": "c", "label": "gold"}, {"id": "d", "label": "oxygen"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A precipitate forming when two solutions mix is a sign of a:$tl$, $tl$[{"id": "a", "label": "physical change"}, {"id": "b", "label": "phase change"}, {"id": "c", "label": "chemical reaction"}, {"id": "d", "label": "mixture"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Endothermic reactions often make their surroundings feel:$tl$, $tl$[{"id": "a", "label": "warmer"}, {"id": "b", "label": "unchanged"}, {"id": "c", "label": "heavier"}, {"id": "d", "label": "colder"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The properties of the products in a reaction are usually ____ the reactants.$tl$, $tl$[{"id": "a", "label": "identical to"}, {"id": "b", "label": "heavier than always"}, {"id": "c", "label": "lighter than always"}, {"id": "d", "label": "different from"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$chemical-reactions$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Atoms & the Periodic Table (MS-PS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$atoms-and-periodic-table$tl$, $tl$Atoms & the Periodic Table$tl$, $tl$Atomic structure and the periodic table explain elements' properties and reactivity.$tl$, 8, $tl$MS-PS1-1$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Atoms & the Periodic Table$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Atoms & the Periodic Table", "body": "Atomic structure and the periodic table explain elements' properties and reactivity."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The number of protons in an atom defines its:\n\nThe answer is \"element (atomic number)\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Atoms of the same element with different neutron counts are:\n\nThe answer is \"isotopes\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An atom that has lost or gained electrons is an:\n\nThe answer is \"ion\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Vertical columns of the periodic table are:", "choices": [{"id": "a", "label": "periods"}, {"id": "b", "label": "rows only"}, {"id": "c", "label": "groups (families)"}, {"id": "d", "label": "cells"}], "answer": "c", "explanation": "Yes! The answer is \"groups (families)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Elements in the same group tend to have similar:", "choices": [{"id": "a", "label": "masses exactly"}, {"id": "b", "label": "colors"}, {"id": "c", "label": "prices"}, {"id": "d", "label": "chemical properties"}], "answer": "d", "explanation": "Yes! The answer is \"chemical properties\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Across a period, atomic number ____ from left to right.", "choices": [{"id": "a", "label": "decreases"}, {"id": "b", "label": "increases"}, {"id": "c", "label": "stays the same"}, {"id": "d", "label": "is random"}], "answer": "b", "explanation": "Yes! The answer is \"increases\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Atoms & the Periodic Table! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The number of protons in an atom defines its:$tl$, $tl$[{"id": "a", "label": "mass number"}, {"id": "b", "label": "charge"}, {"id": "c", "label": "color"}, {"id": "d", "label": "element (atomic number)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Atoms of the same element with different neutron counts are:$tl$, $tl$[{"id": "a", "label": "ions"}, {"id": "b", "label": "isotopes"}, {"id": "c", "label": "molecules"}, {"id": "d", "label": "compounds"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An atom that has lost or gained electrons is an:$tl$, $tl$[{"id": "a", "label": "isotope"}, {"id": "b", "label": "element"}, {"id": "c", "label": "mixture"}, {"id": "d", "label": "ion"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Vertical columns of the periodic table are:$tl$, $tl$[{"id": "a", "label": "periods"}, {"id": "b", "label": "rows only"}, {"id": "c", "label": "groups (families)"}, {"id": "d", "label": "cells"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Elements in the same group tend to have similar:$tl$, $tl$[{"id": "a", "label": "chemical properties"}, {"id": "b", "label": "masses exactly"}, {"id": "c", "label": "colors"}, {"id": "d", "label": "prices"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Across a period, atomic number ____ from left to right.$tl$, $tl$[{"id": "a", "label": "decreases"}, {"id": "b", "label": "stays the same"}, {"id": "c", "label": "is random"}, {"id": "d", "label": "increases"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Most reactive metals are found on the ____ of the table.$tl$, $tl$[{"id": "a", "label": "far right"}, {"id": "b", "label": "middle bottom"}, {"id": "c", "label": "far left"}, {"id": "d", "label": "top right only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Noble gases are nearly unreactive because they have:$tl$, $tl$[{"id": "a", "label": "full outer electron shells"}, {"id": "b", "label": "no electrons"}, {"id": "c", "label": "extra protons"}, {"id": "d", "label": "no nucleus"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The mass number equals protons plus:$tl$, $tl$[{"id": "a", "label": "electrons"}, {"id": "b", "label": "ions"}, {"id": "c", "label": "molecules"}, {"id": "d", "label": "neutrons"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Valence electrons are the electrons in the:$tl$, $tl$[{"id": "a", "label": "nucleus"}, {"id": "b", "label": "innermost shell"}, {"id": "c", "label": "cytoplasm"}, {"id": "d", "label": "outermost shell"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two or more elements chemically combined form a:$tl$, $tl$[{"id": "a", "label": "mixture"}, {"id": "b", "label": "compound"}, {"id": "c", "label": "isotope"}, {"id": "d", "label": "ion"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An element is a pure substance made of one kind of:$tl$, $tl$[{"id": "a", "label": "molecule"}, {"id": "b", "label": "mixture"}, {"id": "c", "label": "compound"}, {"id": "d", "label": "atom"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Metals tend to ____ electrons to form positive ions.$tl$, $tl$[{"id": "a", "label": "gain"}, {"id": "b", "label": "share only"}, {"id": "c", "label": "lose"}, {"id": "d", "label": "destroy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Nonmetals tend to ____ electrons to form negative ions.$tl$, $tl$[{"id": "a", "label": "lose"}, {"id": "b", "label": "destroy"}, {"id": "c", "label": "gain"}, {"id": "d", "label": "create"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Most of an atom's mass is concentrated in the:$tl$, $tl$[{"id": "a", "label": "electron cloud"}, {"id": "b", "label": "nucleus"}, {"id": "c", "label": "shells"}, {"id": "d", "label": "empty space"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Atoms of one element with different numbers of neutrons are called ____. (one word)$tl$, null, $tl$isotopes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Reactivity of an element is mostly determined by its:$tl$, $tl$[{"id": "a", "label": "valence electrons"}, {"id": "b", "label": "number of neutrons"}, {"id": "c", "label": "color"}, {"id": "d", "label": "mass alone"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Horizontal rows of the periodic table are:$tl$, $tl$[{"id": "a", "label": "groups"}, {"id": "b", "label": "periods"}, {"id": "c", "label": "families"}, {"id": "d", "label": "columns"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The periodic table is arranged in order of increasing:$tl$, $tl$[{"id": "a", "label": "mass number"}, {"id": "b", "label": "atomic number"}, {"id": "c", "label": "alphabet"}, {"id": "d", "label": "density"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A neutral atom has equal numbers of protons and:$tl$, $tl$[{"id": "a", "label": "neutrons"}, {"id": "b", "label": "electrons"}, {"id": "c", "label": "ions"}, {"id": "d", "label": "molecules"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$atoms-and-periodic-table$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Evolution & Natural Selection (MS-LS4-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$natural-selection$tl$, $tl$Evolution & Natural Selection$tl$, $tl$Natural selection, supported by fossil, anatomical, and DNA evidence, shapes species over time.$tl$, 8, $tl$MS-LS4-4$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Evolution & Natural Selection$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Evolution & Natural Selection", "body": "Natural selection, supported by fossil, anatomical, and DNA evidence, shapes species over time."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Heritable traits that improve survival and reproduction tend to become:\n\nThe answer is \"more common over generations\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The raw material for new variation in populations comes from:\n\nThe answer is \"mutations\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An organism's reproductive success is a measure of its:\n\nThe answer is \"fitness\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Natural selection requires variation, heredity, and differences in:", "choices": [{"id": "a", "label": "survival and reproduction"}, {"id": "b", "label": "color only"}, {"id": "c", "label": "names"}, {"id": "d", "label": "habitats only"}], "answer": "a", "explanation": "Yes! The answer is \"survival and reproduction\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Fossils, anatomy, and DNA all provide ____ for evolution.", "choices": [{"id": "a", "label": "disproof"}, {"id": "b", "label": "evidence"}, {"id": "c", "label": "randomness"}, {"id": "d", "label": "opinions"}], "answer": "b", "explanation": "Yes! The answer is \"evidence\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Over very long times, accumulated changes can produce new:", "choices": [{"id": "a", "label": "planets"}, {"id": "b", "label": "minerals"}, {"id": "c", "label": "seasons"}, {"id": "d", "label": "species"}], "answer": "d", "explanation": "Yes! The answer is \"species\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Evolution & Natural Selection! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Heritable traits that improve survival and reproduction tend to become:$tl$, $tl$[{"id": "a", "label": "less common"}, {"id": "b", "label": "more common over generations"}, {"id": "c", "label": "random"}, {"id": "d", "label": "extinct immediately"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The raw material for new variation in populations comes from:$tl$, $tl$[{"id": "a", "label": "studying"}, {"id": "b", "label": "exercise"}, {"id": "c", "label": "mutations"}, {"id": "d", "label": "weather"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An organism's reproductive success is a measure of its:$tl$, $tl$[{"id": "a", "label": "height"}, {"id": "b", "label": "speed only"}, {"id": "c", "label": "age"}, {"id": "d", "label": "fitness"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Natural selection requires variation, heredity, and differences in:$tl$, $tl$[{"id": "a", "label": "survival and reproduction"}, {"id": "b", "label": "color only"}, {"id": "c", "label": "names"}, {"id": "d", "label": "habitats only"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Fossils, anatomy, and DNA all provide ____ for evolution.$tl$, $tl$[{"id": "a", "label": "evidence"}, {"id": "b", "label": "disproof"}, {"id": "c", "label": "randomness"}, {"id": "d", "label": "opinions"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Over very long times, accumulated changes can produce new:$tl$, $tl$[{"id": "a", "label": "planets"}, {"id": "b", "label": "minerals"}, {"id": "c", "label": "species"}, {"id": "d", "label": "seasons"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Similar bones in a human arm and a whale fin are ____ structures.$tl$, $tl$[{"id": "a", "label": "identical"}, {"id": "b", "label": "homologous"}, {"id": "c", "label": "unrelated"}, {"id": "d", "label": "artificial"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Selective breeding by humans is also called:$tl$, $tl$[{"id": "a", "label": "natural selection"}, {"id": "b", "label": "artificial selection"}, {"id": "c", "label": "mutation"}, {"id": "d", "label": "migration"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Antibiotic resistance in bacteria evolves because resistant cells:$tl$, $tl$[{"id": "a", "label": "choose to resist"}, {"id": "b", "label": "survive and reproduce more"}, {"id": "c", "label": "never reproduce"}, {"id": "d", "label": "become viruses"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If the environment changes, the best-adapted individuals are more likely to:$tl$, $tl$[{"id": "a", "label": "all die equally"}, {"id": "b", "label": "survive and pass on traits"}, {"id": "c", "label": "stop reproducing"}, {"id": "d", "label": "become plants"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Genetic variation in a population generally helps it:$tl$, $tl$[{"id": "a", "label": "stay identical"}, {"id": "b", "label": "adapt to change"}, {"id": "c", "label": "go extinct"}, {"id": "d", "label": "stop evolving"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two populations separated for a long time may eventually be unable to:$tl$, $tl$[{"id": "a", "label": "interbreed (forming new species)"}, {"id": "b", "label": "survive at all"}, {"id": "c", "label": "mutate"}, {"id": "d", "label": "photosynthesize"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Darwin's finches differ in beak shape because different shapes suit different:$tl$, $tl$[{"id": "a", "label": "foods"}, {"id": "b", "label": "weathers"}, {"id": "c", "label": "colors"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Traits that do not affect survival much tend to:$tl$, $tl$[{"id": "a", "label": "always vanish"}, {"id": "b", "label": "always spread"}, {"id": "c", "label": "persist or drift, not be strongly selected"}, {"id": "d", "label": "cause extinction"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing DNA sequences shows that closely related species share:$tl$, $tl$[{"id": "a", "label": "more similar genes"}, {"id": "b", "label": "no genes"}, {"id": "c", "label": "identical genes always"}, {"id": "d", "label": "random genes"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A heritable feature that improves survival is an ____. (one word)$tl$, null, $tl$adaptation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Camouflage increases an animal's fitness by helping it:$tl$, $tl$[{"id": "a", "label": "fly"}, {"id": "b", "label": "avoid predators"}, {"id": "c", "label": "photosynthesize"}, {"id": "d", "label": "grow taller"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Natural selection acts on ____ traits, not traits learned during life.$tl$, $tl$[{"id": "a", "label": "learned"}, {"id": "b", "label": "painted"}, {"id": "c", "label": "temporary"}, {"id": "d", "label": "inherited"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A population's gene pool is the:$tl$, $tl$[{"id": "a", "label": "collection of all its alleles"}, {"id": "b", "label": "number of animals only"}, {"id": "c", "label": "its habitat"}, {"id": "d", "label": "its food"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The scientist most associated with the theory of evolution by natural selection is:$tl$, $tl$[{"id": "a", "label": "Charles Darwin"}, {"id": "b", "label": "Isaac Newton"}, {"id": "c", "label": "Gregor Mendel only"}, {"id": "d", "label": "Albert Einstein"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$natural-selection$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Genetics & Heredity (MS-LS3-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$heredity-and-genes$tl$, $tl$Genetics & Heredity$tl$, $tl$Genes made of DNA pass traits to offspring; mutations create variation.$tl$, 8, $tl$MS-LS3-2$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Genetics & Heredity$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Genetics & Heredity", "body": "Genes made of DNA pass traits to offspring; mutations create variation."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Genes are segments of:\n\nThe answer is \"DNA\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Different versions of the same gene are called:\n\nThe answer is \"alleles\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  An organism's genetic makeup is its:\n\nThe answer is \"genotype\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An organism's observable traits make up its:", "choices": [{"id": "a", "label": "genotype"}, {"id": "b", "label": "phenotype"}, {"id": "c", "label": "allele"}, {"id": "d", "label": "gene"}], "answer": "b", "explanation": "Yes! The answer is \"phenotype\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A capital letter usually represents a ____ allele.", "choices": [{"id": "a", "label": "recessive"}, {"id": "b", "label": "mutated"}, {"id": "c", "label": "dominant"}, {"id": "d", "label": "missing"}], "answer": "c", "explanation": "Yes! The answer is \"dominant\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A trait expressed only when two recessive alleles are present is:", "choices": [{"id": "a", "label": "dominant"}, {"id": "b", "label": "codominant always"}, {"id": "c", "label": "recessive"}, {"id": "d", "label": "blended"}], "answer": "c", "explanation": "Yes! The answer is \"recessive\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Genetics & Heredity! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Genes are segments of:$tl$, $tl$[{"id": "a", "label": "RNA only"}, {"id": "b", "label": "protein"}, {"id": "c", "label": "DNA"}, {"id": "d", "label": "ATP"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Different versions of the same gene are called:$tl$, $tl$[{"id": "a", "label": "alleles"}, {"id": "b", "label": "chromosomes"}, {"id": "c", "label": "ribosomes"}, {"id": "d", "label": "ions"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An organism's genetic makeup is its:$tl$, $tl$[{"id": "a", "label": "phenotype"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "genotype"}, {"id": "d", "label": "niche"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An organism's observable traits make up its:$tl$, $tl$[{"id": "a", "label": "genotype"}, {"id": "b", "label": "allele"}, {"id": "c", "label": "phenotype"}, {"id": "d", "label": "gene"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A capital letter usually represents a ____ allele.$tl$, $tl$[{"id": "a", "label": "recessive"}, {"id": "b", "label": "mutated"}, {"id": "c", "label": "missing"}, {"id": "d", "label": "dominant"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A trait expressed only when two recessive alleles are present is:$tl$, $tl$[{"id": "a", "label": "dominant"}, {"id": "b", "label": "codominant always"}, {"id": "c", "label": "blended"}, {"id": "d", "label": "recessive"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A Punnett square predicts the ____ of offspring genotypes.$tl$, $tl$[{"id": "a", "label": "probabilities"}, {"id": "b", "label": "exact futures"}, {"id": "c", "label": "habitats"}, {"id": "d", "label": "food"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A cross of Tt x Tt gives a 3:1 ratio of:$tl$, $tl$[{"id": "a", "label": "recessive to dominant"}, {"id": "b", "label": "dominant to recessive phenotypes"}, {"id": "c", "label": "all recessive"}, {"id": "d", "label": "all dominant"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A permanent change in a DNA sequence is a:$tl$, $tl$[{"id": "a", "label": "habitat"}, {"id": "b", "label": "mutation"}, {"id": "c", "label": "phenotype only"}, {"id": "d", "label": "ion"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Mutations can be harmful, helpful, or:$tl$, $tl$[{"id": "a", "label": "always fatal"}, {"id": "b", "label": "always beneficial"}, {"id": "c", "label": "impossible"}, {"id": "d", "label": "neutral"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Offspring of sexual reproduction inherit ____ of their genes from each parent.$tl$, $tl$[{"id": "a", "label": "all"}, {"id": "b", "label": "half"}, {"id": "c", "label": "none"}, {"id": "d", "label": "three quarters"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Sexual reproduction increases genetic:$tl$, $tl$[{"id": "a", "label": "sameness"}, {"id": "b", "label": "variation"}, {"id": "c", "label": "extinction"}, {"id": "d", "label": "mass"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Tightly coiled DNA forms structures called:$tl$, $tl$[{"id": "a", "label": "chromosomes"}, {"id": "b", "label": "ribosomes"}, {"id": "c", "label": "vacuoles"}, {"id": "d", "label": "membranes"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If both parents are Tt, what fraction of offspring are expected to be tt?$tl$, $tl$[{"id": "a", "label": "1/2"}, {"id": "b", "label": "1/4"}, {"id": "c", "label": "3/4"}, {"id": "d", "label": "0"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Codominance is when ____ alleles are both fully expressed.$tl$, $tl$[{"id": "a", "label": "two different"}, {"id": "b", "label": "no"}, {"id": "c", "label": "only recessive"}, {"id": "d", "label": "only dominant"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Different versions of a gene are called ____. (one word)$tl$, null, $tl$alleles$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A mutation in a body (somatic) cell is:$tl$, $tl$[{"id": "a", "label": "not passed to offspring"}, {"id": "b", "label": "always passed on"}, {"id": "c", "label": "always fatal"}, {"id": "d", "label": "not real"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Genetic engineering can change an organism's traits by altering its:$tl$, $tl$[{"id": "a", "label": "habitat"}, {"id": "b", "label": "diet only"}, {"id": "c", "label": "behavior only"}, {"id": "d", "label": "DNA"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The passing of traits from parents to offspring is called:$tl$, $tl$[{"id": "a", "label": "heredity"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "metamorphosis"}, {"id": "d", "label": "respiration"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Identical twins have the same genotype because they came from one:$tl$, $tl$[{"id": "a", "label": "sperm only"}, {"id": "b", "label": "gene"}, {"id": "c", "label": "chromosome"}, {"id": "d", "label": "fertilized egg"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$heredity-and-genes$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Gravity & the Solar System (MS-ESS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$solar-system$tl$, $tl$Gravity & the Solar System$tl$, $tl$Gravity governs orbits, tides, eclipses, and the motions of the solar system.$tl$, 8, $tl$MS-ESS1-2$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Gravity & the Solar System$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Gravity & the Solar System", "body": "Gravity governs orbits, tides, eclipses, and the motions of the solar system."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The force that keeps planets in orbit around the Sun is:\n\nThe answer is \"gravity\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Gravitational force between two objects increases with greater ____ and less distance.\n\nThe answer is \"mass\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Earth's seasons are caused by the:\n\nThe answer is \"tilt of Earth's axis as it orbits\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A solar eclipse occurs when the ____ blocks sunlight to Earth.", "choices": [{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "another planet"}, {"id": "d", "label": "a comet"}], "answer": "b", "explanation": "Yes! The answer is \"Moon\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A lunar eclipse occurs when ____ shadow falls on the Moon.", "choices": [{"id": "a", "label": "Earth's"}, {"id": "b", "label": "the Sun's"}, {"id": "c", "label": "Mars's"}, {"id": "d", "label": "Jupiter's"}], "answer": "a", "explanation": "Yes! The answer is \"Earth's\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The Moon shines because it ____ sunlight.", "choices": [{"id": "a", "label": "produces"}, {"id": "b", "label": "reflects"}, {"id": "c", "label": "absorbs all"}, {"id": "d", "label": "blocks"}], "answer": "b", "explanation": "Yes! The answer is \"reflects\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Gravity & the Solar System! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The force that keeps planets in orbit around the Sun is:$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "magnetism"}, {"id": "c", "label": "gravity"}, {"id": "d", "label": "inertia alone"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Gravitational force between two objects increases with greater ____ and less distance.$tl$, $tl$[{"id": "a", "label": "mass"}, {"id": "b", "label": "color"}, {"id": "c", "label": "temperature"}, {"id": "d", "label": "speed"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Earth's seasons are caused by the:$tl$, $tl$[{"id": "a", "label": "distance changing a lot"}, {"id": "b", "label": "tilt of Earth's axis as it orbits"}, {"id": "c", "label": "Sun's brightness changing"}, {"id": "d", "label": "Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A solar eclipse occurs when the ____ blocks sunlight to Earth.$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "another planet"}, {"id": "d", "label": "a comet"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A lunar eclipse occurs when ____ shadow falls on the Moon.$tl$, $tl$[{"id": "a", "label": "the Sun's"}, {"id": "b", "label": "Mars's"}, {"id": "c", "label": "Jupiter's"}, {"id": "d", "label": "Earth's"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The Moon shines because it ____ sunlight.$tl$, $tl$[{"id": "a", "label": "produces"}, {"id": "b", "label": "reflects"}, {"id": "c", "label": "absorbs all"}, {"id": "d", "label": "blocks"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The inner planets are mostly ____ compared with the gas giants.$tl$, $tl$[{"id": "a", "label": "rocky and small"}, {"id": "b", "label": "gaseous and huge"}, {"id": "c", "label": "made of ice only"}, {"id": "d", "label": "stars"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Tides on Earth are caused mainly by the gravity of the:$tl$, $tl$[{"id": "a", "label": "Moon"}, {"id": "b", "label": "Sun only"}, {"id": "c", "label": "stars"}, {"id": "d", "label": "other galaxies"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$One year is the time Earth takes to ____ the Sun.$tl$, $tl$[{"id": "a", "label": "spin once"}, {"id": "b", "label": "cross the Moon"}, {"id": "c", "label": "orbit"}, {"id": "d", "label": "heat up"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$One day is the time Earth takes to:$tl$, $tl$[{"id": "a", "label": "orbit the Sun"}, {"id": "b", "label": "orbit the Moon"}, {"id": "c", "label": "rotate once on its axis"}, {"id": "d", "label": "cool down"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The Sun is best described as a:$tl$, $tl$[{"id": "a", "label": "planet"}, {"id": "b", "label": "moon"}, {"id": "c", "label": "comet"}, {"id": "d", "label": "star"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Compared to the Sun, the planets are:$tl$, $tl$[{"id": "a", "label": "much larger"}, {"id": "b", "label": "much smaller"}, {"id": "c", "label": "the same size"}, {"id": "d", "label": "stars too"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The phases of the Moon repeat about every:$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "year"}, {"id": "c", "label": "month"}, {"id": "d", "label": "week"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Gravity is what gives objects their:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "temperature"}, {"id": "c", "label": "weight"}, {"id": "d", "label": "charge"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Models help us understand the solar system because the real distances are:$tl$, $tl$[{"id": "a", "label": "extremely large"}, {"id": "b", "label": "very small"}, {"id": "c", "label": "exactly to scale on paper"}, {"id": "d", "label": "unknown"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The force that holds planets in orbit around the Sun is ____. (one word)$tl$, null, $tl$gravity$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Astronomers measure huge space distances in units like the:$tl$, $tl$[{"id": "a", "label": "meter only"}, {"id": "b", "label": "mile only"}, {"id": "c", "label": "light-year"}, {"id": "d", "label": "kilogram"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The closer a planet is to the Sun, generally the ____ its orbit (year).$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "colder"}, {"id": "c", "label": "shorter"}, {"id": "d", "label": "heavier"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Earth, the Moon, and the Sun all interact through:$tl$, $tl$[{"id": "a", "label": "friction"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "magnetism only"}, {"id": "d", "label": "gravity"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A galaxy is a massive system of stars, gas, dust, and:$tl$, $tl$[{"id": "a", "label": "oceans"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "dark matter / planetary systems"}, {"id": "d", "label": "continents"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solar-system$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Climate & Human Impact (MS-ESS3-5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$human-impact$tl$, $tl$Climate & Human Impact$tl$, $tl$Human activities affect Earth's climate and systems; solutions reduce harm.$tl$, 8, $tl$MS-ESS3-5$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Climate & Human Impact$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Climate & Human Impact", "body": "Human activities affect Earth's climate and systems; solutions reduce harm."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The buildup of carbon dioxide and methane in the atmosphere enhances the:\n\nThe answer is \"greenhouse effect\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Burning fossil fuels is a major source of:\n\nThe answer is \"carbon dioxide emissions\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Average global temperatures have been:\n\nThe answer is \"rising over the past century\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Renewable energy sources include solar, wind, and:", "choices": [{"id": "a", "label": "coal"}, {"id": "b", "label": "hydroelectric"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}], "answer": "b", "explanation": "Yes! The answer is \"hydroelectric\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Deforestation contributes to climate change partly by removing trees that absorb:", "choices": [{"id": "a", "label": "oxygen"}, {"id": "b", "label": "carbon dioxide"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "metal"}], "answer": "b", "explanation": "Yes! The answer is \"carbon dioxide\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Loss of habitat is a leading cause of declining:", "choices": [{"id": "a", "label": "biodiversity"}, {"id": "b", "label": "pollution"}, {"id": "c", "label": "traffic"}, {"id": "d", "label": "erosion"}], "answer": "a", "explanation": "Yes! The answer is \"biodiversity\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Climate & Human Impact! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The buildup of carbon dioxide and methane in the atmosphere enhances the:$tl$, $tl$[{"id": "a", "label": "ozone layer"}, {"id": "b", "label": "water cycle only"}, {"id": "c", "label": "tides"}, {"id": "d", "label": "greenhouse effect"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Burning fossil fuels is a major source of:$tl$, $tl$[{"id": "a", "label": "carbon dioxide emissions"}, {"id": "b", "label": "clean oxygen"}, {"id": "c", "label": "fresh water"}, {"id": "d", "label": "forests"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Average global temperatures have been:$tl$, $tl$[{"id": "a", "label": "falling sharply"}, {"id": "b", "label": "rising over the past century"}, {"id": "c", "label": "perfectly steady"}, {"id": "d", "label": "unmeasurable"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Renewable energy sources include solar, wind, and:$tl$, $tl$[{"id": "a", "label": "coal"}, {"id": "b", "label": "hydroelectric"}, {"id": "c", "label": "oil"}, {"id": "d", "label": "natural gas"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Deforestation contributes to climate change partly by removing trees that absorb:$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "oxygen"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "metal"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Loss of habitat is a leading cause of declining:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "traffic"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "biodiversity"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Reducing, reusing, and recycling helps conserve:$tl$, $tl$[{"id": "a", "label": "pollution"}, {"id": "b", "label": "landfills"}, {"id": "c", "label": "traffic"}, {"id": "d", "label": "natural resources"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Ocean acidification is caused by oceans absorbing excess:$tl$, $tl$[{"id": "a", "label": "carbon dioxide"}, {"id": "b", "label": "oxygen"}, {"id": "c", "label": "salt"}, {"id": "d", "label": "plastic only"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Scientists track climate using long-term data on temperature, ice, and:$tl$, $tl$[{"id": "a", "label": "traffic"}, {"id": "b", "label": "sea level"}, {"id": "c", "label": "population names"}, {"id": "d", "label": "stock prices"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Switching from gasoline cars to electric and transit reduces:$tl$, $tl$[{"id": "a", "label": "clean air"}, {"id": "b", "label": "forest cover"}, {"id": "c", "label": "greenhouse gas emissions"}, {"id": "d", "label": "fresh water"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A nonrenewable resource is one that:$tl$, $tl$[{"id": "a", "label": "never runs out"}, {"id": "b", "label": "forms far slower than we use it"}, {"id": "c", "label": "regrows yearly"}, {"id": "d", "label": "is unlimited"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Protecting wetlands and forests helps maintain:$tl$, $tl$[{"id": "a", "label": "more pollution"}, {"id": "b", "label": "faster warming"}, {"id": "c", "label": "fewer species"}, {"id": "d", "label": "ecosystem services and biodiversity"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Single-use plastics are a problem mainly because they:$tl$, $tl$[{"id": "a", "label": "decompose instantly"}, {"id": "b", "label": "feed wildlife"}, {"id": "c", "label": "clean oceans"}, {"id": "d", "label": "persist and pollute for a long time"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Engineering solutions to climate include carbon capture and:$tl$, $tl$[{"id": "a", "label": "renewable energy"}, {"id": "b", "label": "burning more coal"}, {"id": "c", "label": "clearing forests"}, {"id": "d", "label": "wasting water"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Human population growth increases demand for:$tl$, $tl$[{"id": "a", "label": "less of everything"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "resources like water, food, and energy"}, {"id": "d", "label": "only entertainment"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Using resources so they last for the future is called being ____. (one word)$tl$, null, $tl$sustainable$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Evidence that current warming is human-influenced includes the rise in CO2 from:$tl$, $tl$[{"id": "a", "label": "volcanoes only"}, {"id": "b", "label": "fossil fuel use"}, {"id": "c", "label": "the Sun cooling"}, {"id": "d", "label": "ocean cooling"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Conserving energy at home (LED bulbs, insulation) helps reduce:$tl$, $tl$[{"id": "a", "label": "emissions and resource use"}, {"id": "b", "label": "biodiversity"}, {"id": "c", "label": "clean air"}, {"id": "d", "label": "forests"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Restoring ecosystems (replanting, cleanups) can:$tl$, $tl$[{"id": "a", "label": "cause extinction"}, {"id": "b", "label": "increase biodiversity"}, {"id": "c", "label": "add pollution"}, {"id": "d", "label": "warm the planet"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$International cooperation on climate matters because the atmosphere is:$tl$, $tl$[{"id": "a", "label": "owned by one nation"}, {"id": "b", "label": "not affected by humans"}, {"id": "c", "label": "only regional"}, {"id": "d", "label": "shared by all countries"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$human-impact$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Plate Tectonics (MS-ESS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plate-tectonics$tl$, $tl$Plate Tectonics$tl$, $tl$Moving plates, driven by mantle convection, reshape Earth and cause quakes and volcanoes.$tl$, 8, $tl$MS-ESS2-3$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plate Tectonics$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Plate Tectonics", "body": "Moving plates, driven by mantle convection, reshape Earth and cause quakes and volcanoes."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Earth's lithosphere is broken into moving:\n\nThe answer is \"tectonic plates\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Plates move because of ____ currents in the mantle.\n\nThe answer is \"convection\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  At a divergent boundary, plates:\n\nThe answer is \"move apart, forming new crust\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "At a convergent boundary, plates:", "choices": [{"id": "a", "label": "spread apart"}, {"id": "b", "label": "slide past only"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "collide"}], "answer": "d", "explanation": "Yes! The answer is \"collide\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "At a transform boundary, plates:", "choices": [{"id": "a", "label": "collide head-on"}, {"id": "b", "label": "spread apart"}, {"id": "c", "label": "melt"}, {"id": "d", "label": "slide past each other"}], "answer": "d", "explanation": "Yes! The answer is \"slide past each other\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Most earthquakes and volcanoes occur:", "choices": [{"id": "a", "label": "along plate boundaries"}, {"id": "b", "label": "randomly anywhere"}, {"id": "c", "label": "in the sky"}, {"id": "d", "label": "only midplate"}], "answer": "a", "explanation": "Yes! The answer is \"along plate boundaries\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plate Tectonics! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Earth's lithosphere is broken into moving:$tl$, $tl$[{"id": "a", "label": "continents only"}, {"id": "b", "label": "tectonic plates"}, {"id": "c", "label": "oceans"}, {"id": "d", "label": "craters"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Plates move because of ____ currents in the mantle.$tl$, $tl$[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "reflection"}, {"id": "c", "label": "convection"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$At a divergent boundary, plates:$tl$, $tl$[{"id": "a", "label": "move apart, forming new crust"}, {"id": "b", "label": "collide"}, {"id": "c", "label": "slide past"}, {"id": "d", "label": "stop moving"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$At a convergent boundary, plates:$tl$, $tl$[{"id": "a", "label": "spread apart"}, {"id": "b", "label": "slide past only"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "collide"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$At a transform boundary, plates:$tl$, $tl$[{"id": "a", "label": "collide head-on"}, {"id": "b", "label": "spread apart"}, {"id": "c", "label": "slide past each other"}, {"id": "d", "label": "melt"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Most earthquakes and volcanoes occur:$tl$, $tl$[{"id": "a", "label": "randomly anywhere"}, {"id": "b", "label": "along plate boundaries"}, {"id": "c", "label": "in the sky"}, {"id": "d", "label": "only midplate"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Subduction is when one plate ____ beneath another.$tl$, $tl$[{"id": "a", "label": "sinks"}, {"id": "b", "label": "rises into the air"}, {"id": "c", "label": "disappears"}, {"id": "d", "label": "stops forever"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$New ocean floor forms at:$tl$, $tl$[{"id": "a", "label": "beaches"}, {"id": "b", "label": "mountain peaks"}, {"id": "c", "label": "mid-ocean ridges"}, {"id": "d", "label": "river deltas"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Matching fossils and rock types on separate continents support:$tl$, $tl$[{"id": "a", "label": "the water cycle"}, {"id": "b", "label": "gravity"}, {"id": "c", "label": "continental drift / plate tectonics"}, {"id": "d", "label": "photosynthesis"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The theory that continents were once joined as one landmass is:$tl$, $tl$[{"id": "a", "label": "the rock cycle"}, {"id": "b", "label": "the food web"}, {"id": "c", "label": "Pangaea / continental drift"}, {"id": "d", "label": "the water cycle"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Mountains often form where plates:$tl$, $tl$[{"id": "a", "label": "collide and crust is pushed up"}, {"id": "b", "label": "spread apart only"}, {"id": "c", "label": "stop existing"}, {"id": "d", "label": "melt instantly"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A sudden release of energy along a fault causes an:$tl$, $tl$[{"id": "a", "label": "eclipse"}, {"id": "b", "label": "aurora"}, {"id": "c", "label": "tide"}, {"id": "d", "label": "earthquake"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Magma reaching the surface through a vent forms a:$tl$, $tl$[{"id": "a", "label": "glacier"}, {"id": "b", "label": "canyon"}, {"id": "c", "label": "volcano"}, {"id": "d", "label": "delta"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The age of seafloor rocks ____ with distance from a mid-ocean ridge.$tl$, $tl$[{"id": "a", "label": "increases"}, {"id": "b", "label": "decreases"}, {"id": "c", "label": "stays the same"}, {"id": "d", "label": "is random"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The Ring of Fire is a zone of frequent earthquakes and:$tl$, $tl$[{"id": "a", "label": "volcanoes"}, {"id": "b", "label": "hurricanes"}, {"id": "c", "label": "deserts"}, {"id": "d", "label": "glaciers"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Slow-moving currents in the mantle that drive plate motion are ____ currents. (one word)$tl$, null, $tl$convection$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Plates move at roughly the rate that:$tl$, $tl$[{"id": "a", "label": "a car drives"}, {"id": "b", "label": "sound travels"}, {"id": "c", "label": "fingernails grow"}, {"id": "d", "label": "light travels"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Deep ocean trenches usually form at ____ boundaries.$tl$, $tl$[{"id": "a", "label": "divergent"}, {"id": "b", "label": "transform only"}, {"id": "c", "label": "convergent (subduction)"}, {"id": "d", "label": "midplate"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Earth's interior heat that drives tectonics comes partly from:$tl$, $tl$[{"id": "a", "label": "the Moon"}, {"id": "b", "label": "radioactive decay and leftover heat"}, {"id": "c", "label": "ocean tides"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Over millions of years, plate movements:$tl$, $tl$[{"id": "a", "label": "reshape continents and oceans"}, {"id": "b", "label": "change daily weather"}, {"id": "c", "label": "stop gravity"}, {"id": "d", "label": "create stars"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plate-tectonics$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Central Idea & Analysis (RI.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$central-idea$tl$, $tl$Central Idea & Analysis$tl$, $tl$Determine central ideas and analyze how they develop through supporting details.$tl$, 8, $tl$RI.8.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Central Idea & Analysis$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Central Idea & Analysis", "body": "Determine central ideas and analyze how they develop through supporting details."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A central idea is best described as a text's:\n\nThe answer is \"most important controlling point\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Two or more central ideas in a longer text are usually connected by a:\n\nThe answer is \"shared overall message or topic\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Read: \"Automation boosts productivity but also displaces some workers, forcing society to adapt.\" The central idea is that automation:\n\nThe answer is \"brings both gains and challenges\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Supporting details strengthen a central idea by providing:", "choices": [{"id": "a", "label": "evidence and examples"}, {"id": "b", "label": "distractions"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "page numbers"}], "answer": "a", "explanation": "Yes! The answer is \"evidence and examples\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To analyze how a central idea develops, trace it across:", "choices": [{"id": "a", "label": "a single word"}, {"id": "b", "label": "paragraphs and sections"}, {"id": "c", "label": "the cover"}, {"id": "d", "label": "the index"}], "answer": "b", "explanation": "Yes! The answer is \"paragraphs and sections\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "An objective statement of a central idea omits the reader's:", "choices": [{"id": "a", "label": "the main point"}, {"id": "b", "label": "key evidence"}, {"id": "c", "label": "topic"}, {"id": "d", "label": "personal judgments"}], "answer": "d", "explanation": "Yes! The answer is \"personal judgments\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Central Idea & Analysis! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A central idea is best described as a text's:$tl$, $tl$[{"id": "a", "label": "first sentence"}, {"id": "b", "label": "longest word"}, {"id": "c", "label": "most important controlling point"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two or more central ideas in a longer text are usually connected by a:$tl$, $tl$[{"id": "a", "label": "random list"}, {"id": "b", "label": "shared overall message or topic"}, {"id": "c", "label": "page number"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Automation boosts productivity but also displaces some workers, forcing society to adapt." The central idea is that automation:$tl$, $tl$[{"id": "a", "label": "brings both gains and challenges"}, {"id": "b", "label": "is only good"}, {"id": "c", "label": "is only bad"}, {"id": "d", "label": "is unimportant"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Supporting details strengthen a central idea by providing:$tl$, $tl$[{"id": "a", "label": "evidence and examples"}, {"id": "b", "label": "distractions"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "page numbers"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$To analyze how a central idea develops, trace it across:$tl$, $tl$[{"id": "a", "label": "paragraphs and sections"}, {"id": "b", "label": "a single word"}, {"id": "c", "label": "the cover"}, {"id": "d", "label": "the index"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An objective statement of a central idea omits the reader's:$tl$, $tl$[{"id": "a", "label": "the main point"}, {"id": "b", "label": "personal judgments"}, {"id": "c", "label": "key evidence"}, {"id": "d", "label": "topic"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A detail unrelated to the controlling idea is:$tl$, $tl$[{"id": "a", "label": "irrelevant"}, {"id": "b", "label": "essential"}, {"id": "c", "label": "central"}, {"id": "d", "label": "the thesis"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Despite risks, vaccination has saved millions of lives by preventing disease outbreaks." The central idea is that vaccination is:$tl$, $tl$[{"id": "a", "label": "dangerous"}, {"id": "b", "label": "useless"}, {"id": "c", "label": "largely beneficial to public health"}, {"id": "d", "label": "new"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$In an argument, the central idea is usually the author's main:$tl$, $tl$[{"id": "a", "label": "counterexample"}, {"id": "b", "label": "claim or thesis"}, {"id": "c", "label": "footnote"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A strong reader determines a central idea by identifying the point that:$tl$, $tl$[{"id": "a", "label": "appears once"}, {"id": "b", "label": "is shortest"}, {"id": "c", "label": "is in bold"}, {"id": "d", "label": "the details collectively support"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Urban green spaces reduce heat, clean air, and improve residents' well-being." The central idea is that green spaces:$tl$, $tl$[{"id": "a", "label": "benefit cities in multiple ways"}, {"id": "b", "label": "are decorative only"}, {"id": "c", "label": "are harmful"}, {"id": "d", "label": "are rare"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Section headings and topic sentences often signal a text's:$tl$, $tl$[{"id": "a", "label": "price"}, {"id": "b", "label": "developing central ideas"}, {"id": "c", "label": "binding"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Removing supporting details would leave a central idea:$tl$, $tl$[{"id": "a", "label": "clearer always"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "less fully developed or proven"}, {"id": "d", "label": "unchanged in proof"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two central ideas in one article should be analyzed for how they:$tl$, $tl$[{"id": "a", "label": "contradict the title"}, {"id": "b", "label": "are printed"}, {"id": "c", "label": "relate to each other"}, {"id": "d", "label": "are paginated"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Determining a central idea helps a reader understand the text's:$tl$, $tl$[{"id": "a", "label": "word count"}, {"id": "b", "label": "margins"}, {"id": "c", "label": "font size"}, {"id": "d", "label": "overall purpose and message"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The most important controlling point of a text is its ____ idea. (one word)$tl$, null, $tl$central$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which best states a central idea?$tl$, $tl$[{"id": "a", "label": "Wind turbines are tall."}, {"id": "b", "label": "Renewable energy is essential for a sustainable future."}, {"id": "c", "label": "It was a windy day."}, {"id": "d", "label": "Panels can be blue."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A central idea differs from a supporting detail because it is:$tl$, $tl$[{"id": "a", "label": "narrower"}, {"id": "b", "label": "broader and more important"}, {"id": "c", "label": "a single fact"}, {"id": "d", "label": "the title only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Reading widely builds vocabulary, empathy, and critical thinking." The central idea is that reading:$tl$, $tl$[{"id": "a", "label": "is boring"}, {"id": "b", "label": "develops valuable skills"}, {"id": "c", "label": "is easy"}, {"id": "d", "label": "wastes time"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Analyzing the development of a central idea means examining the text's:$tl$, $tl$[{"id": "a", "label": "structure and evidence"}, {"id": "b", "label": "fonts"}, {"id": "c", "label": "page numbers"}, {"id": "d", "label": "cover art"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$central-idea$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Theme Development (RL.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$theme-development$tl$, $tl$Theme Development$tl$, $tl$Analyze how a theme develops over the course of a text through plot and character.$tl$, 8, $tl$RL.8.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Theme Development$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Theme Development", "body": "Analyze how a theme develops over the course of a text through plot and character."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A theme is a literary work's:\n\nThe answer is \"central message about life or human nature\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Authors develop a theme through plot, conflict, and:\n\nThe answer is \"characters' choices and changes\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A theme differs from a subject because a theme is a:\n\nThe answer is \"complete insight or claim\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"Warned of the danger, the leaders ignored it and the city fell.\" A theme is:", "choices": [{"id": "a", "label": "ignoring wisdom invites disaster"}, {"id": "b", "label": "cities are old"}, {"id": "c", "label": "warnings are fun"}, {"id": "d", "label": "leaders are tall"}], "answer": "a", "explanation": "Yes! The answer is \"ignoring wisdom invites disaster\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A recurring symbol throughout a story often reinforces the:", "choices": [{"id": "a", "label": "index"}, {"id": "b", "label": "theme"}, {"id": "c", "label": "page count"}, {"id": "d", "label": "glossary"}], "answer": "b", "explanation": "Yes! The answer is \"theme\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To analyze theme development, track how it emerges:", "choices": [{"id": "a", "label": "only at the start"}, {"id": "b", "label": "in the title only"}, {"id": "c", "label": "over the entire text"}, {"id": "d", "label": "never"}], "answer": "c", "explanation": "Yes! The answer is \"over the entire text\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Theme Development! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A theme is a literary work's:$tl$, $tl$[{"id": "a", "label": "central message about life or human nature"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "narrator"}, {"id": "d", "label": "title"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Authors develop a theme through plot, conflict, and:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "characters' choices and changes"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A theme differs from a subject because a theme is a:$tl$, $tl$[{"id": "a", "label": "single noun"}, {"id": "b", "label": "place"}, {"id": "c", "label": "name"}, {"id": "d", "label": "complete insight or claim"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Warned of the danger, the leaders ignored it and the city fell." A theme is:$tl$, $tl$[{"id": "a", "label": "cities are old"}, {"id": "b", "label": "warnings are fun"}, {"id": "c", "label": "ignoring wisdom invites disaster"}, {"id": "d", "label": "leaders are tall"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A recurring symbol throughout a story often reinforces the:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "index"}, {"id": "c", "label": "page count"}, {"id": "d", "label": "glossary"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$To analyze theme development, track how it emerges:$tl$, $tl$[{"id": "a", "label": "over the entire text"}, {"id": "b", "label": "only at the start"}, {"id": "c", "label": "in the title only"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "After years of revenge, he found only emptiness, not peace." A theme is:$tl$, $tl$[{"id": "a", "label": "revenge is rewarding"}, {"id": "b", "label": "revenge does not bring fulfillment"}, {"id": "c", "label": "peace is impossible"}, {"id": "d", "label": "time stops"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A theme should be stated as a:$tl$, $tl$[{"id": "a", "label": "plot summary"}, {"id": "b", "label": "single word"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "general statement about life"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two different works can explore the same theme, such as:$tl$, $tl$[{"id": "a", "label": "the cost of ambition"}, {"id": "b", "label": "the same plot"}, {"id": "c", "label": "the same author"}, {"id": "d", "label": "the same length"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$As a narrative unfolds, a theme typically becomes:$tl$, $tl$[{"id": "a", "label": "clearer through events and choices"}, {"id": "b", "label": "less important"}, {"id": "c", "label": "random"}, {"id": "d", "label": "the title"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "She told the truth though it cost her everything, and kept her integrity." The theme concerns:$tl$, $tl$[{"id": "a", "label": "integrity and honesty"}, {"id": "b", "label": "winning at all costs"}, {"id": "c", "label": "fear"}, {"id": "d", "label": "luck"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A dynamic character's growth often reveals the work's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "cover"}, {"id": "d", "label": "theme"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A well-developed theme applies:$tl$, $tl$[{"id": "a", "label": "beyond the story to human experience"}, {"id": "b", "label": "only to one scene"}, {"id": "c", "label": "to the cover"}, {"id": "d", "label": "to nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "The estranged siblings reconciled, realizing family mattered most." The theme is:$tl$, $tl$[{"id": "a", "label": "family is a burden"}, {"id": "b", "label": "money matters most"}, {"id": "c", "label": "the importance of family / reconciliation"}, {"id": "d", "label": "isolation is best"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which is a theme, not a topic?$tl$, $tl$[{"id": "a", "label": "Unchecked power can corrupt."}, {"id": "b", "label": "a ruler"}, {"id": "c", "label": "a kingdom"}, {"id": "d", "label": "a war"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The deeper message or insight of a literary work is its ____. (one word)$tl$, null, $tl$theme$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Conflicts in a narrative often serve to develop its:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "page number"}, {"id": "c", "label": "setting only"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Mocked for years, the inventor persisted and transformed the world." The theme is:$tl$, $tl$[{"id": "a", "label": "mockery wins"}, {"id": "b", "label": "quit early"}, {"id": "c", "label": "luck is all"}, {"id": "d", "label": "perseverance can lead to greatness"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A precise theme statement is a:$tl$, $tl$[{"id": "a", "label": "plot recap"}, {"id": "b", "label": "the title"}, {"id": "c", "label": "universal truth illustrated by the work"}, {"id": "d", "label": "a character's name"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Tracing characters' responses to conflict helps a reader identify the:$tl$, $tl$[{"id": "a", "label": "publisher"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "theme"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$theme-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Objective Summary (RI.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$summarizing$tl$, $tl$Objective Summary$tl$, $tl$Summarize a text's central ideas and key details objectively.$tl$, 8, $tl$RI.8.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Objective Summary$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Objective Summary", "body": "Summarize a text's central ideas and key details objectively."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An objective summary remains:\n\nThe answer is \"neutral and free of personal opinion\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A strong summary captures the central idea and the:\n\nThe answer is \"most significant supporting details\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A summary should be ____ than the original text.\n\nThe answer is \"more concise\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Summaries should be written in:", "choices": [{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "code"}, {"id": "c", "label": "the reader's own words"}, {"id": "d", "label": "emojis"}], "answer": "c", "explanation": "Yes! The answer is \"the reader's own words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "What does NOT belong in an objective summary?", "choices": [{"id": "a", "label": "the central idea"}, {"id": "b", "label": "the reader's evaluation"}, {"id": "c", "label": "key points"}, {"id": "d", "label": "the topic"}], "answer": "b", "explanation": "Yes! The answer is \"the reader's evaluation\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "In summarizing an argument, include the author's claim and:", "choices": [{"id": "a", "label": "favorite color"}, {"id": "b", "label": "main supporting reasons"}, {"id": "c", "label": "birthday"}, {"id": "d", "label": "font"}], "answer": "b", "explanation": "Yes! The answer is \"main supporting reasons\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Objective Summary! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An objective summary remains:$tl$, $tl$[{"id": "a", "label": "opinionated"}, {"id": "b", "label": "neutral and free of personal opinion"}, {"id": "c", "label": "exaggerated"}, {"id": "d", "label": "fictional"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A strong summary captures the central idea and the:$tl$, $tl$[{"id": "a", "label": "most significant supporting details"}, {"id": "b", "label": "every minor detail"}, {"id": "c", "label": "your reaction"}, {"id": "d", "label": "the page color"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A summary should be ____ than the original text.$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "more concise"}, {"id": "c", "label": "identical"}, {"id": "d", "label": "just the title"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Summaries should be written in:$tl$, $tl$[{"id": "a", "label": "the author's exact words"}, {"id": "b", "label": "code"}, {"id": "c", "label": "emojis"}, {"id": "d", "label": "the reader's own words"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$What does NOT belong in an objective summary?$tl$, $tl$[{"id": "a", "label": "the reader's evaluation"}, {"id": "b", "label": "the central idea"}, {"id": "c", "label": "key points"}, {"id": "d", "label": "the topic"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$In summarizing an argument, include the author's claim and:$tl$, $tl$[{"id": "a", "label": "favorite color"}, {"id": "b", "label": "main supporting reasons"}, {"id": "c", "label": "birthday"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Narrative summaries should preserve the:$tl$, $tl$[{"id": "a", "label": "logical order of events"}, {"id": "b", "label": "random order"}, {"id": "c", "label": "reverse only"}, {"id": "d", "label": "no order"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Inserting 'this is wrong' into a summary makes it:$tl$, $tl$[{"id": "a", "label": "stronger"}, {"id": "b", "label": "required"}, {"id": "c", "label": "no longer objective"}, {"id": "d", "label": "shorter"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$To condense a passage, a reader should:$tl$, $tl$[{"id": "a", "label": "repeat sentences"}, {"id": "b", "label": "synthesize ideas and drop minor details"}, {"id": "c", "label": "add new examples"}, {"id": "d", "label": "copy it"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A precise one-sentence summary states the text's:$tl$, $tl$[{"id": "a", "label": "smallest detail"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "author bio"}, {"id": "d", "label": "central idea"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Quoting extensively in a summary tends to make it:$tl$, $tl$[{"id": "a", "label": "objective"}, {"id": "b", "label": "ideal"}, {"id": "c", "label": "too long and not concise"}, {"id": "d", "label": "short"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A summary and the source share the same:$tl$, $tl$[{"id": "a", "label": "wording"}, {"id": "b", "label": "central idea"}, {"id": "c", "label": "length"}, {"id": "d", "label": "page count"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which is the best summary of a study showing exercise improves memory and mood across ages?$tl$, $tl$[{"id": "a", "label": "Exercise benefits memory and mood for people of all ages."}, {"id": "b", "label": "Exercise is fun."}, {"id": "c", "label": "People are different."}, {"id": "d", "label": "Gyms can be busy."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An objective summary of a debate presents:$tl$, $tl$[{"id": "a", "label": "only your side"}, {"id": "b", "label": "only the loser"}, {"id": "c", "label": "both sides' main points fairly"}, {"id": "d", "label": "no points"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Paraphrasing differs from summarizing because paraphrasing:$tl$, $tl$[{"id": "a", "label": "restates a passage at similar length"}, {"id": "b", "label": "is much shorter"}, {"id": "c", "label": "adds opinion"}, {"id": "d", "label": "is the title"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A concise, neutral restatement of a text's key points is a ____. (one word)$tl$, null, $tl$summary$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Effective summarizers focus on ideas that are:$tl$, $tl$[{"id": "a", "label": "trivial"}, {"id": "b", "label": "longest"}, {"id": "c", "label": "central, not trivial"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An objective summary answers primarily:$tl$, $tl$[{"id": "a", "label": "how you felt"}, {"id": "b", "label": "the price"}, {"id": "c", "label": "what the text says and why it matters"}, {"id": "d", "label": "the publisher"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Before summarizing, a skilled reader:$tl$, $tl$[{"id": "a", "label": "identifies the central idea and key points"}, {"id": "b", "label": "chooses a font"}, {"id": "c", "label": "counts pages"}, {"id": "d", "label": "skips the text"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Synthesizing multiple sources into one summary requires:$tl$, $tl$[{"id": "a", "label": "copying one source"}, {"id": "b", "label": "ignoring all"}, {"id": "c", "label": "inventing facts"}, {"id": "d", "label": "combining their key ideas accurately"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$summarizing$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Citing Strong Evidence (RI.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$textual-evidence$tl$, $tl$Citing Strong Evidence$tl$, $tl$Cite the strongest textual evidence to support analysis and inferences.$tl$, 8, $tl$RI.8.1$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Citing Strong Evidence$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Citing Strong Evidence", "body": "Cite the strongest textual evidence to support analysis and inferences."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The strongest support for an analysis is:\n\nThe answer is \"specific evidence drawn from the text\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  An inference must be supported by:\n\nThe answer is \"clues and evidence in the text\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Strong textual evidence is relevant and:\n\nThe answer is \"accurate (truly stated in the text)\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Quotation marks indicate the words are the:", "choices": [{"id": "a", "label": "reader's words"}, {"id": "b", "label": "a summary"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "author's exact words"}], "answer": "d", "explanation": "Yes! The answer is \"author's exact words\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which best supports the claim 'the narrator is unreliable'?", "choices": [{"id": "a", "label": "The book is long."}, {"id": "b", "label": "It was a Tuesday."}, {"id": "c", "label": "The cover is gray."}, {"id": "d", "label": "'I'm sure I locked it,' he said, though the door stood open."}], "answer": "d", "explanation": "Yes! The answer is \"'I'm sure I locked it,' he said, though the door stood open.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "When asked to justify an interpretation, cite:", "choices": [{"id": "a", "label": "textual evidence"}, {"id": "b", "label": "a guess"}, {"id": "c", "label": "the page color"}, {"id": "d", "label": "the author's age"}], "answer": "a", "explanation": "Yes! The answer is \"textual evidence\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Citing Strong Evidence! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The strongest support for an analysis is:$tl$, $tl$[{"id": "a", "label": "specific evidence drawn from the text"}, {"id": "b", "label": "a personal guess"}, {"id": "c", "label": "the title only"}, {"id": "d", "label": "an unrelated quote"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An inference must be supported by:$tl$, $tl$[{"id": "a", "label": "a wild guess"}, {"id": "b", "label": "the cover"}, {"id": "c", "label": "nothing"}, {"id": "d", "label": "clues and evidence in the text"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Strong textual evidence is relevant and:$tl$, $tl$[{"id": "a", "label": "invented"}, {"id": "b", "label": "accurate (truly stated in the text)"}, {"id": "c", "label": "off-topic"}, {"id": "d", "label": "about the author"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Quotation marks indicate the words are the:$tl$, $tl$[{"id": "a", "label": "reader's words"}, {"id": "b", "label": "a summary"}, {"id": "c", "label": "the title"}, {"id": "d", "label": "author's exact words"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which best supports the claim 'the narrator is unreliable'?$tl$, $tl$[{"id": "a", "label": "'I'm sure I locked it,' he said, though the door stood open."}, {"id": "b", "label": "The book is long."}, {"id": "c", "label": "It was a Tuesday."}, {"id": "d", "label": "The cover is gray."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$When asked to justify an interpretation, cite:$tl$, $tl$[{"id": "a", "label": "a guess"}, {"id": "b", "label": "the page color"}, {"id": "c", "label": "the author's age"}, {"id": "d", "label": "textual evidence"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A claim with no supporting evidence is:$tl$, $tl$[{"id": "a", "label": "always correct"}, {"id": "b", "label": "the central idea"}, {"id": "c", "label": "unsupported / weak"}, {"id": "d", "label": "a quotation"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Citing precise evidence makes an argument more:$tl$, $tl$[{"id": "a", "label": "convincing and credible"}, {"id": "b", "label": "confusing"}, {"id": "c", "label": "shorter only"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An explicit detail is one the text:$tl$, $tl$[{"id": "a", "label": "only implies"}, {"id": "b", "label": "never includes"}, {"id": "c", "label": "puts in the title"}, {"id": "d", "label": "states directly"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An inference combines text evidence with the reader's:$tl$, $tl$[{"id": "a", "label": "random guesses"}, {"id": "b", "label": "the cover"}, {"id": "c", "label": "page numbers"}, {"id": "d", "label": "background knowledge"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Paraphrased evidence must still be:$tl$, $tl$[{"id": "a", "label": "made up"}, {"id": "b", "label": "about you"}, {"id": "c", "label": "grounded in the text"}, {"id": "d", "label": "unrelated"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Several relevant quotations make a point:$tl$, $tl$[{"id": "a", "label": "weaker"}, {"id": "b", "label": "stronger and better supported"}, {"id": "c", "label": "off-topic"}, {"id": "d", "label": "shorter only"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$If the text contradicts your claim, the best move is to:$tl$, $tl$[{"id": "a", "label": "revise your claim"}, {"id": "b", "label": "keep it anyway"}, {"id": "c", "label": "blame the text"}, {"id": "d", "label": "stop reading"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Best evidence that a character feels guilt:$tl$, $tl$[{"id": "a", "label": "The story is sad."}, {"id": "b", "label": "'He avoided their eyes and his voice faltered.'"}, {"id": "c", "label": "It has 12 chapters."}, {"id": "d", "label": "The cover is blue."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Identifying the strongest evidence means choosing details that are:$tl$, $tl$[{"id": "a", "label": "longest"}, {"id": "b", "label": "most relevant and convincing"}, {"id": "c", "label": "most colorful"}, {"id": "d", "label": "random"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Information taken directly from a text to support a point is text ____. (one word)$tl$, null, $tl$evidence$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Drawing a conclusion the text implies but does not state is an:$tl$, $tl$[{"id": "a", "label": "explicit fact"}, {"id": "b", "label": "title"}, {"id": "c", "label": "opinion only"}, {"id": "d", "label": "inference"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A thorough analysis includes a claim, evidence, and:$tl$, $tl$[{"id": "a", "label": "a guess"}, {"id": "b", "label": "the title"}, {"id": "c", "label": "page count"}, {"id": "d", "label": "reasoning that links them"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Citing the paragraph number helps readers:$tl$, $tl$[{"id": "a", "label": "pick a font"}, {"id": "b", "label": "count words"}, {"id": "c", "label": "skip reading"}, {"id": "d", "label": "locate and verify the evidence"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Evidence should be chosen because it:$tl$, $tl$[{"id": "a", "label": "directly supports the claim"}, {"id": "b", "label": "is the longest"}, {"id": "c", "label": "looks nice"}, {"id": "d", "label": "is random"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$textual-evidence$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Author's Purpose & Rhetoric (RI.8.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$authors-perspective$tl$, $tl$Author's Purpose & Rhetoric$tl$, $tl$Analyze an author's purpose, perspective, and use of rhetorical appeals.$tl$, 8, $tl$RI.8.6$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Author's Purpose & Rhetoric$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Author's Purpose & Rhetoric", "body": "Analyze an author's purpose, perspective, and use of rhetorical appeals."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  An author's purpose could be to inform, entertain, persuade, or:\n\nThe answer is \"explain a process\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  An author's perspective is their:\n\nThe answer is \"stance or attitude toward the topic\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A persuasive essay primarily aims to:\n\nThe answer is \"convince the reader\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Emotionally charged word choice can reveal an author's:", "choices": [{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "bias / perspective"}, {"id": "d", "label": "binding"}], "answer": "c", "explanation": "Yes! The answer is \"bias / perspective\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text presenting only one side of an issue is likely:", "choices": [{"id": "a", "label": "objective"}, {"id": "b", "label": "fictional"}, {"id": "c", "label": "biased"}, {"id": "d", "label": "a poem"}], "answer": "c", "explanation": "Yes! The answer is \"biased\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "To find the author's purpose, ask:", "choices": [{"id": "a", "label": "why was this written?"}, {"id": "b", "label": "how long is it?"}, {"id": "c", "label": "who printed it?"}, {"id": "d", "label": "what font?"}], "answer": "a", "explanation": "Yes! The answer is \"why was this written?\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Author's Purpose & Rhetoric! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An author's purpose could be to inform, entertain, persuade, or:$tl$, $tl$[{"id": "a", "label": "explain a process"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "drive"}, {"id": "d", "label": "eat"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An author's perspective is their:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "handwriting"}, {"id": "c", "label": "address"}, {"id": "d", "label": "stance or attitude toward the topic"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A persuasive essay primarily aims to:$tl$, $tl$[{"id": "a", "label": "convince the reader"}, {"id": "b", "label": "only list facts"}, {"id": "c", "label": "tell a joke"}, {"id": "d", "label": "sell paper"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Emotionally charged word choice can reveal an author's:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "binding"}, {"id": "d", "label": "bias / perspective"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A text presenting only one side of an issue is likely:$tl$, $tl$[{"id": "a", "label": "objective"}, {"id": "b", "label": "fictional"}, {"id": "c", "label": "biased"}, {"id": "d", "label": "a poem"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$To find the author's purpose, ask:$tl$, $tl$[{"id": "a", "label": "why was this written?"}, {"id": "b", "label": "how long is it?"}, {"id": "c", "label": "who printed it?"}, {"id": "d", "label": "what font?"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Recognizing perspective helps a reader evaluate a text's:$tl$, $tl$[{"id": "a", "label": "reliability and intent"}, {"id": "b", "label": "weight"}, {"id": "c", "label": "color"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Rhetorical appeals to emotion are called:$tl$, $tl$[{"id": "a", "label": "logos"}, {"id": "b", "label": "ethos"}, {"id": "c", "label": "pathos"}, {"id": "d", "label": "kairos"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Appeals to logic and evidence are called:$tl$, $tl$[{"id": "a", "label": "pathos"}, {"id": "b", "label": "logos"}, {"id": "c", "label": "ethos"}, {"id": "d", "label": "kairos"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Appeals to the author's credibility are called:$tl$, $tl$[{"id": "a", "label": "pathos"}, {"id": "b", "label": "logos"}, {"id": "c", "label": "ethos"}, {"id": "d", "label": "kairos"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A satirical piece uses humor or irony mainly to:$tl$, $tl$[{"id": "a", "label": "report neutrally"}, {"id": "b", "label": "criticize or make a point"}, {"id": "c", "label": "teach arithmetic"}, {"id": "d", "label": "sell shoes"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A balanced informational text presents:$tl$, $tl$[{"id": "a", "label": "only one side"}, {"id": "b", "label": "no information"}, {"id": "c", "label": "multiple viewpoints fairly"}, {"id": "d", "label": "just images"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An author who emphasizes alarming statistics likely intends to:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "change fonts"}, {"id": "c", "label": "sell paper"}, {"id": "d", "label": "persuade or warn readers"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Tone is the author's ____ toward the subject; mood is what the reader feels.$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "attitude"}, {"id": "c", "label": "font"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Detecting an author's bias is easier when you:$tl$, $tl$[{"id": "a", "label": "read only that text"}, {"id": "b", "label": "compare the text with other sources"}, {"id": "c", "label": "ignore evidence"}, {"id": "d", "label": "check the font"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The reason an author writes a text is the author's ____. (one word)$tl$, null, $tl$purpose$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An author selects details and word choice to shape the reader's:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "margins"}, {"id": "c", "label": "perception and feelings"}, {"id": "d", "label": "index"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A 'how-to' manual's main purpose is to:$tl$, $tl$[{"id": "a", "label": "persuade"}, {"id": "b", "label": "entertain only"}, {"id": "c", "label": "argue"}, {"id": "d", "label": "instruct or explain"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two authors may report the same facts yet convey different:$tl$, $tl$[{"id": "a", "label": "page counts"}, {"id": "b", "label": "perspectives"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "titles"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Considering purpose and perspective encourages readers to think:$tl$, $tl$[{"id": "a", "label": "less"}, {"id": "b", "label": "not at all"}, {"id": "c", "label": "critically"}, {"id": "d", "label": "only about length"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$authors-perspective$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Word Meaning & Connotation (L.8.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$word-connotation$tl$, $tl$Word Meaning & Connotation$tl$, $tl$Analyze denotation, connotation, roots, and affixes to determine meaning.$tl$, 8, $tl$L.8.5$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Word Meaning & Connotation$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Word Meaning & Connotation", "body": "Analyze denotation, connotation, roots, and affixes to determine meaning."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A word's denotation is its:\n\nThe answer is \"literal dictionary meaning\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A word's connotation is its:\n\nThe answer is \"emotional or implied association\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  'Frugal' and 'stingy' share a denotation but differ in:\n\nThe answer is \"connotation\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which has the more POSITIVE connotation?", "choices": [{"id": "a", "label": "arrogant"}, {"id": "b", "label": "confident"}, {"id": "c", "label": "cocky"}, {"id": "d", "label": "smug"}], "answer": "b", "explanation": "Yes! The answer is \"confident\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which has the more NEGATIVE connotation?", "choices": [{"id": "a", "label": "curious"}, {"id": "b", "label": "interested"}, {"id": "c", "label": "inquisitive"}, {"id": "d", "label": "nosy"}], "answer": "d", "explanation": "Yes! The answer is \"nosy\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Read: \"A delicate aroma drifted from the kitchen.\" \"Aroma\" carries a ____ connotation.", "choices": [{"id": "a", "label": "negative"}, {"id": "b", "label": "positive"}, {"id": "c", "label": "strictly neutral"}, {"id": "d", "label": "no"}], "answer": "b", "explanation": "Yes! The answer is \"positive\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Word Meaning & Connotation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A word's denotation is its:$tl$, $tl$[{"id": "a", "label": "literal dictionary meaning"}, {"id": "b", "label": "emotional association"}, {"id": "c", "label": "rhyme"}, {"id": "d", "label": "origin"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A word's connotation is its:$tl$, $tl$[{"id": "a", "label": "dictionary definition"}, {"id": "b", "label": "emotional or implied association"}, {"id": "c", "label": "letter count"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$'Frugal' and 'stingy' share a denotation but differ in:$tl$, $tl$[{"id": "a", "label": "spelling only"}, {"id": "b", "label": "length"}, {"id": "c", "label": "connotation"}, {"id": "d", "label": "prefix"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which has the more POSITIVE connotation?$tl$, $tl$[{"id": "a", "label": "arrogant"}, {"id": "b", "label": "confident"}, {"id": "c", "label": "cocky"}, {"id": "d", "label": "smug"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which has the more NEGATIVE connotation?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "nosy"}, {"id": "c", "label": "interested"}, {"id": "d", "label": "inquisitive"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "A delicate aroma drifted from the kitchen." "Aroma" carries a ____ connotation.$tl$, $tl$[{"id": "a", "label": "positive"}, {"id": "b", "label": "negative"}, {"id": "c", "label": "strictly neutral"}, {"id": "d", "label": "no"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "A foul stench rose from the drain." "Stench" carries a ____ connotation.$tl$, $tl$[{"id": "a", "label": "positive"}, {"id": "b", "label": "neutral"}, {"id": "c", "label": "no"}, {"id": "d", "label": "negative"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Authors choose words with particular connotations to:$tl$, $tl$[{"id": "a", "label": "count pages"}, {"id": "b", "label": "fill space"}, {"id": "c", "label": "change fonts"}, {"id": "d", "label": "shape readers' attitudes"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The Greek root 'chrono' (as in chronological) relates to:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "light"}, {"id": "c", "label": "sound"}, {"id": "d", "label": "time"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The root 'dict' (as in predict, dictate) relates to:$tl$, $tl$[{"id": "a", "label": "speaking / saying"}, {"id": "b", "label": "seeing"}, {"id": "c", "label": "hearing"}, {"id": "d", "label": "writing only"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$'Youthful' vs 'immature': the more negative term is:$tl$, $tl$[{"id": "a", "label": "youthful"}, {"id": "b", "label": "both equal"}, {"id": "c", "label": "immature"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "His relentless effort finally paid off." "Relentless" here connotes:$tl$, $tl$[{"id": "a", "label": "cruelty"}, {"id": "b", "label": "determined persistence (positive)"}, {"id": "c", "label": "laziness"}, {"id": "d", "label": "fear"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Recognizing connotation explains why synonyms are not always:$tl$, $tl$[{"id": "a", "label": "spelled alike"}, {"id": "b", "label": "the same length"}, {"id": "c", "label": "interchangeable"}, {"id": "d", "label": "nouns"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The prefix 'anti-' (as in antifreeze) means:$tl$, $tl$[{"id": "a", "label": "against"}, {"id": "b", "label": "before"}, {"id": "c", "label": "again"}, {"id": "d", "label": "without"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "The economical design saved fuel and money." "Economical" connotes being:$tl$, $tl$[{"id": "a", "label": "wasteful"}, {"id": "b", "label": "cheap-quality"}, {"id": "c", "label": "careless"}, {"id": "d", "label": "efficient (positive)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The feelings and associations attached to a word are its ____. (one word)$tl$, null, $tl$connotation$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choosing 'cheap' rather than 'affordable' adds a more ____ tone.$tl$, $tl$[{"id": "a", "label": "positive"}, {"id": "b", "label": "neutral"}, {"id": "c", "label": "formal"}, {"id": "d", "label": "negative"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The root 'photo' (as in photograph) relates to:$tl$, $tl$[{"id": "a", "label": "light"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "water"}, {"id": "d", "label": "earth"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Words with strong connotations are especially common in:$tl$, $tl$[{"id": "a", "label": "math proofs"}, {"id": "b", "label": "phone books"}, {"id": "c", "label": "tax forms"}, {"id": "d", "label": "persuasive and literary writing"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "She was slender," suggests a ____ impression compared with "she was scrawny."$tl$, $tl$[{"id": "a", "label": "more negative"}, {"id": "b", "label": "identical"}, {"id": "c", "label": "more positive"}, {"id": "d", "label": "no"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$word-connotation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Text Structure (RI.8.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$text-structure$tl$, $tl$Text Structure$tl$, $tl$Analyze how a text's structure organizes information and develops ideas.$tl$, 8, $tl$RI.8.5$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Text Structure$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Text Structure", "body": "Analyze how a text's structure organizes information and develops ideas."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  A text arranged in time order uses a ____ structure.\n\nThe answer is \"chronological / sequence\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A text explaining reasons and their results uses:\n\nThe answer is \"cause and effect\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A text examining similarities and differences uses:\n\nThe answer is \"compare and contrast\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A text that raises an issue and proposes remedies uses:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "problem and solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}], "answer": "b", "explanation": "Yes! The answer is \"problem and solution\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'consequently, thus, due to' indicate:", "choices": [{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "description"}, {"id": "d", "label": "cause and effect"}], "answer": "d", "explanation": "Yes! The answer is \"cause and effect\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Signal words 'conversely, likewise, in contrast' indicate:", "choices": [{"id": "a", "label": "compare and contrast"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}], "answer": "a", "explanation": "Yes! The answer is \"compare and contrast\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Text Structure! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A text arranged in time order uses a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare-contrast"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "chronological / sequence"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A text explaining reasons and their results uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "compare"}, {"id": "d", "label": "cause and effect"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A text examining similarities and differences uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "compare and contrast"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A text that raises an issue and proposes remedies uses:$tl$, $tl$[{"id": "a", "label": "problem and solution"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "description"}, {"id": "d", "label": "compare"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Signal words 'consequently, thus, due to' indicate:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Signal words 'conversely, likewise, in contrast' indicate:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "problem-solution"}, {"id": "d", "label": "compare and contrast"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Signal words 'initially, subsequently, ultimately' indicate:$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "sequence"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Analyzing structure helps a reader see how the author:$tl$, $tl$[{"id": "a", "label": "organizes and emphasizes ideas"}, {"id": "b", "label": "picks a cover"}, {"id": "c", "label": "sets the price"}, {"id": "d", "label": "chooses a font"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An article on 'why coral reefs are dying and how to protect them' uses:$tl$, $tl$[{"id": "a", "label": "problem and solution with cause-effect"}, {"id": "b", "label": "sequence only"}, {"id": "c", "label": "description only"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A passage that paints a detailed picture of a setting uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "description"}, {"id": "c", "label": "cause-effect"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A historical account from earliest to latest events uses a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "problem-solution"}, {"id": "c", "label": "description"}, {"id": "d", "label": "chronological"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Recognizing problem-solution structure helps you find the author's:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "rhyme"}, {"id": "c", "label": "title"}, {"id": "d", "label": "proposed solution"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Authors sometimes combine structures, like comparing the causes of two events, blending:$tl$, $tl$[{"id": "a", "label": "only sequence"}, {"id": "b", "label": "compare-contrast and cause-effect"}, {"id": "c", "label": "only description"}, {"id": "d", "label": "none"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A 'pros and cons' section most likely uses:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "cause-effect"}, {"id": "c", "label": "compare and contrast"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$'Pollution increased; consequently, species declined' demonstrates:$tl$, $tl$[{"id": "a", "label": "sequence"}, {"id": "b", "label": "compare"}, {"id": "c", "label": "cause and effect"}, {"id": "d", "label": "description"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$A text organized strictly by time order uses a ____ structure. (one word)$tl$, null, $tl$chronological$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Understanding text structure first makes a complex text:$tl$, $tl$[{"id": "a", "label": "easier to analyze and recall"}, {"id": "b", "label": "longer"}, {"id": "c", "label": "impossible"}, {"id": "d", "label": "cheaper"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$How an author orders and connects ideas is part of a text's:$tl$, $tl$[{"id": "a", "label": "price"}, {"id": "b", "label": "author bio"}, {"id": "c", "label": "structure"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Cause-effect structure answers the question:$tl$, $tl$[{"id": "a", "label": "what comes first?"}, {"id": "b", "label": "how are they alike?"}, {"id": "c", "label": "why did this happen and what resulted?"}, {"id": "d", "label": "what is the issue?"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A flowchart of steps best matches a ____ structure.$tl$, $tl$[{"id": "a", "label": "compare"}, {"id": "b", "label": "description"}, {"id": "c", "label": "sequence / chronological"}, {"id": "d", "label": "problem-solution"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$text-structure$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Figurative Language & Tone (L.8.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$figurative-tone$tl$, $tl$Figurative Language & Tone$tl$, $tl$Interpret figurative language and analyze how word choice creates tone and mood.$tl$, 8, $tl$L.8.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Figurative Language & Tone$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Figurative Language & Tone", "body": "Interpret figurative language and analyze how word choice creates tone and mood."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  \"The news was a punch to the gut\" is a:\n\nThe answer is \"metaphor\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  \"She fought like a tiger\" is a:\n\nThe answer is \"simile\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Giving human qualities to nonhuman things is:\n\nThe answer is \"personification\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "\"I'm so hungry I could eat a horse\" is:", "choices": [{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "a metaphor"}, {"id": "d", "label": "an idiom"}], "answer": "b", "explanation": "Yes! The answer is \"hyperbole\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "'Bite the bullet,' meaning to endure hardship, is an:", "choices": [{"id": "a", "label": "idiom"}, {"id": "b", "label": "literal action"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "fact"}], "answer": "a", "explanation": "Yes! The answer is \"idiom\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Tone is the author's ____ toward the subject.", "choices": [{"id": "a", "label": "attitude"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "font"}, {"id": "d", "label": "spelling"}], "answer": "a", "explanation": "Yes! The answer is \"attitude\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Figurative Language & Tone! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"The news was a punch to the gut" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "metaphor"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"She fought like a tiger" is a:$tl$, $tl$[{"id": "a", "label": "metaphor"}, {"id": "b", "label": "simile"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "hyperbole"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Giving human qualities to nonhuman things is:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "personification"}, {"id": "c", "label": "hyperbole"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"I'm so hungry I could eat a horse" is:$tl$, $tl$[{"id": "a", "label": "hyperbole"}, {"id": "b", "label": "a simile"}, {"id": "c", "label": "a metaphor"}, {"id": "d", "label": "an idiom"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$'Bite the bullet,' meaning to endure hardship, is an:$tl$, $tl$[{"id": "a", "label": "literal action"}, {"id": "b", "label": "idiom"}, {"id": "c", "label": "simile"}, {"id": "d", "label": "fact"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Tone is the author's ____ toward the subject.$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "attitude"}, {"id": "d", "label": "spelling"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A passage using 'bleak, hollow, gray' creates a ____ tone.$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "comic"}, {"id": "c", "label": "excited"}, {"id": "d", "label": "somber / melancholy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Verbal irony is saying the opposite of what one:$tl$, $tl$[{"id": "a", "label": "truly means"}, {"id": "b", "label": "spells"}, {"id": "c", "label": "measures"}, {"id": "d", "label": "prints"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Mood is the feeling created in the:$tl$, $tl$[{"id": "a", "label": "author only"}, {"id": "b", "label": "printer"}, {"id": "c", "label": "reader"}, {"id": "d", "label": "margins"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Words imitating sounds, like 'clang' and 'sizzle,' are:$tl$, $tl$[{"id": "a", "label": "onomatopoeia"}, {"id": "b", "label": "similes"}, {"id": "c", "label": "metaphors"}, {"id": "d", "label": "idioms"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An allusion is a reference to a well-known person, event, or:$tl$, $tl$[{"id": "a", "label": "page number"}, {"id": "b", "label": "font"}, {"id": "c", "label": "work (e.g., from history or literature)"}, {"id": "d", "label": "margin"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Symbolism is when something concrete represents an abstract:$tl$, $tl$[{"id": "a", "label": "idea"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "number"}, {"id": "d", "label": "font"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"Time devoured the old city" gives time a human/animal action, so it is:$tl$, $tl$[{"id": "a", "label": "a simile"}, {"id": "b", "label": "hyperbole"}, {"id": "c", "label": "an idiom"}, {"id": "d", "label": "personification"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A sarcastic tone usually conveys:$tl$, $tl$[{"id": "a", "label": "sincere praise"}, {"id": "b", "label": "neutral facts"}, {"id": "c", "label": "mockery or scorn"}, {"id": "d", "label": "fear only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"Her smile was sunshine" is a:$tl$, $tl$[{"id": "a", "label": "simile"}, {"id": "b", "label": "metaphor"}, {"id": "c", "label": "idiom"}, {"id": "d", "label": "onomatopoeia"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$An author's attitude toward the subject is the ____. (one word)$tl$, null, $tl$tone$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Figurative language and word choice together create:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "margins"}, {"id": "c", "label": "tone and mood"}, {"id": "d", "label": "the index"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An understatement deliberately makes something seem:$tl$, $tl$[{"id": "a", "label": "more important"}, {"id": "b", "label": "less important than it is"}, {"id": "c", "label": "louder"}, {"id": "d", "label": "colorful"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$"The thunder roared and the wind shrieked" mainly uses:$tl$, $tl$[{"id": "a", "label": "statistics"}, {"id": "b", "label": "an idiom"}, {"id": "c", "label": "personification"}, {"id": "d", "label": "an allusion"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which is NOT figurative language?$tl$, $tl$[{"id": "a", "label": "He's drowning in homework."}, {"id": "b", "label": "Quiet as a tomb."}, {"id": "c", "label": "The stars blinked."}, {"id": "d", "label": "The meeting starts at nine."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$figurative-tone$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Analyzing Conflicting Sources (RI.8.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-authors$tl$, $tl$Analyzing Conflicting Sources$tl$, $tl$Analyze how two texts present and interpret the same topic or event differently.$tl$, 8, $tl$RI.8.9$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Analyzing Conflicting Sources$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Analyzing Conflicting Sources", "body": "Analyze how two texts present and interpret the same topic or event differently."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Comparing two texts on the same topic highlights their differing:\n\nThe answer is \"approaches and perspectives\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  A firsthand memoir and a researched article on one event differ most in:\n\nThe answer is \"point of view and type of detail\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  When two authors disagree, a critical reader:\n\nThe answer is \"weighs the evidence and reasoning in each\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Reading several sources on a topic helps a reader develop a:", "choices": [{"id": "a", "label": "more balanced, informed view"}, {"id": "b", "label": "narrower view"}, {"id": "c", "label": "less knowledge"}, {"id": "d", "label": "ignorance of facts"}], "answer": "a", "explanation": "Yes! The answer is \"more balanced, informed view\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A primary source is created by someone who:", "choices": [{"id": "a", "label": "wrote a later textbook"}, {"id": "b", "label": "invented a story"}, {"id": "c", "label": "studied an unrelated topic"}, {"id": "d", "label": "witnessed or took part in the event"}], "answer": "d", "explanation": "Yes! The answer is \"witnessed or took part in the event\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A secondary source typically:", "choices": [{"id": "a", "label": "analyzes or interprets events afterward"}, {"id": "b", "label": "is always firsthand"}, {"id": "c", "label": "is fiction"}, {"id": "d", "label": "contains no facts"}], "answer": "a", "explanation": "Yes! The answer is \"analyzes or interprets events afterward\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Analyzing Conflicting Sources! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing two texts on the same topic highlights their differing:$tl$, $tl$[{"id": "a", "label": "page numbers"}, {"id": "b", "label": "approaches and perspectives"}, {"id": "c", "label": "fonts"}, {"id": "d", "label": "prices"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A firsthand memoir and a researched article on one event differ most in:$tl$, $tl$[{"id": "a", "label": "point of view and type of detail"}, {"id": "b", "label": "the date"}, {"id": "c", "label": "whether it occurred"}, {"id": "d", "label": "the planet"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$When two authors disagree, a critical reader:$tl$, $tl$[{"id": "a", "label": "believes the longer text"}, {"id": "b", "label": "ignores both"}, {"id": "c", "label": "picks randomly"}, {"id": "d", "label": "weighs the evidence and reasoning in each"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Reading several sources on a topic helps a reader develop a:$tl$, $tl$[{"id": "a", "label": "narrower view"}, {"id": "b", "label": "more balanced, informed view"}, {"id": "c", "label": "less knowledge"}, {"id": "d", "label": "ignorance of facts"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A primary source is created by someone who:$tl$, $tl$[{"id": "a", "label": "wrote a later textbook"}, {"id": "b", "label": "invented a story"}, {"id": "c", "label": "witnessed or took part in the event"}, {"id": "d", "label": "studied an unrelated topic"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A secondary source typically:$tl$, $tl$[{"id": "a", "label": "is always firsthand"}, {"id": "b", "label": "is fiction"}, {"id": "c", "label": "analyzes or interprets events afterward"}, {"id": "d", "label": "contains no facts"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two authors may present the same facts yet reach different:$tl$, $tl$[{"id": "a", "label": "page counts"}, {"id": "b", "label": "titles"}, {"id": "c", "label": "conclusions"}, {"id": "d", "label": "fonts"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing a novel to its film adaptation often reveals the film:$tl$, $tl$[{"id": "a", "label": "adds nothing"}, {"id": "b", "label": "is identical"}, {"id": "c", "label": "omits or alters details"}, {"id": "d", "label": "has no characters"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Synthesizing sources means:$tl$, $tl$[{"id": "a", "label": "copying one source"}, {"id": "b", "label": "ignoring all"}, {"id": "c", "label": "reading none"}, {"id": "d", "label": "integrating ideas across multiple texts"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Differences in tone between two articles on one event reflect each author's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "perspective and purpose"}, {"id": "d", "label": "binding"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$An author's bias is easier to detect when you:$tl$, $tl$[{"id": "a", "label": "read only that text"}, {"id": "b", "label": "ignore evidence"}, {"id": "c", "label": "compare the text against other accounts"}, {"id": "d", "label": "check the font"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Evaluating conflicting sources requires checking each source's:$tl$, $tl$[{"id": "a", "label": "page color"}, {"id": "b", "label": "font size"}, {"id": "c", "label": "author's age"}, {"id": "d", "label": "credibility and evidence"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A scientific report differs from an opinion column mainly in its:$tl$, $tl$[{"id": "a", "label": "use of evidence and objectivity"}, {"id": "b", "label": "topic"}, {"id": "c", "label": "alphabet"}, {"id": "d", "label": "length"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing how two writers describe the same setting reveals each one's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "publisher"}, {"id": "c", "label": "price"}, {"id": "d", "label": "style and word choice"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Two infographics of the same data may differ in:$tl$, $tl$[{"id": "a", "label": "the facts"}, {"id": "b", "label": "the truth"}, {"id": "c", "label": "the topic"}, {"id": "d", "label": "emphasis and presentation"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Examining how two texts are alike and different is to ____ them. (one word, starts with c)$tl$, null, $tl$compare$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Considering multiple viewpoints before forming a conclusion demonstrates:$tl$, $tl$[{"id": "a", "label": "critical reading"}, {"id": "b", "label": "lazy reading"}, {"id": "c", "label": "skimming"}, {"id": "d", "label": "guessing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Reading an eyewitness account alongside a historian's analysis gives the reader:$tl$, $tl$[{"id": "a", "label": "less information"}, {"id": "b", "label": "a fuller understanding of the event"}, {"id": "c", "label": "only opinions"}, {"id": "d", "label": "only fiction"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$When sources conflict, the most reliable is usually the one with:$tl$, $tl$[{"id": "a", "label": "stronger evidence and credibility"}, {"id": "b", "label": "the most pages"}, {"id": "c", "label": "the prettiest font"}, {"id": "d", "label": "the oldest cover"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing texts across genres on one theme shows how form affects:$tl$, $tl$[{"id": "a", "label": "meaning and impact"}, {"id": "b", "label": "page count"}, {"id": "c", "label": "price"}, {"id": "d", "label": "binding"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-authors$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Plot & Character Development (RL.8.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plot-character-development$tl$, $tl$Plot & Character Development$tl$, $tl$Analyze how dialogue and events drive plot and reveal character.$tl$, 8, $tl$RL.8.3$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plot & Character Development$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Plot & Character Development", "body": "Analyze how dialogue and events drive plot and reveal character."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  The arrangement of events in a narrative is the:\n\nThe answer is \"plot\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  The central struggle that drives a story is the:\n\nThe answer is \"conflict\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  A character who undergoes significant change is:\n\nThe answer is \"dynamic\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "A complex, multi-faceted character is described as:", "choices": [{"id": "a", "label": "flat"}, {"id": "b", "label": "static only"}, {"id": "c", "label": "round"}, {"id": "d", "label": "off-page"}], "answer": "c", "explanation": "Yes! The answer is \"round\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "The moment of greatest tension and turning point is the:", "choices": [{"id": "a", "label": "climax"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "resolution"}, {"id": "d", "label": "setting"}], "answer": "a", "explanation": "Yes! The answer is \"climax\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Events that build tension before the climax are the:", "choices": [{"id": "a", "label": "resolution"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "rising action"}, {"id": "d", "label": "falling action"}], "answer": "c", "explanation": "Yes! The answer is \"rising action\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plot & Character Development! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The arrangement of events in a narrative is the:$tl$, $tl$[{"id": "a", "label": "theme"}, {"id": "b", "label": "plot"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The central struggle that drives a story is the:$tl$, $tl$[{"id": "a", "label": "setting"}, {"id": "b", "label": "genre"}, {"id": "c", "label": "title"}, {"id": "d", "label": "conflict"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A character who undergoes significant change is:$tl$, $tl$[{"id": "a", "label": "static / flat"}, {"id": "b", "label": "minor only"}, {"id": "c", "label": "the narrator"}, {"id": "d", "label": "dynamic"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A complex, multi-faceted character is described as:$tl$, $tl$[{"id": "a", "label": "flat"}, {"id": "b", "label": "static only"}, {"id": "c", "label": "round"}, {"id": "d", "label": "off-page"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The moment of greatest tension and turning point is the:$tl$, $tl$[{"id": "a", "label": "exposition"}, {"id": "b", "label": "resolution"}, {"id": "c", "label": "climax"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Events that build tension before the climax are the:$tl$, $tl$[{"id": "a", "label": "resolution"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "rising action"}, {"id": "d", "label": "falling action"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Events after the climax that lead to the ending are the:$tl$, $tl$[{"id": "a", "label": "rising action"}, {"id": "b", "label": "exposition"}, {"id": "c", "label": "climax"}, {"id": "d", "label": "falling action"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A struggle within a character's own mind is:$tl$, $tl$[{"id": "a", "label": "external conflict"}, {"id": "b", "label": "setting"}, {"id": "c", "label": "internal conflict"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A struggle against another character, nature, or society is:$tl$, $tl$[{"id": "a", "label": "internal conflict"}, {"id": "b", "label": "theme"}, {"id": "c", "label": "external conflict"}, {"id": "d", "label": "plot only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$The reason a character behaves a certain way is their:$tl$, $tl$[{"id": "a", "label": "motivation"}, {"id": "b", "label": "height"}, {"id": "c", "label": "clothing"}, {"id": "d", "label": "name"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Characterization is the way an author reveals a character's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "cover"}, {"id": "d", "label": "personality and traits"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$How a character responds to conflict reveals their:$tl$, $tl$[{"id": "a", "label": "address"}, {"id": "b", "label": "shoe size"}, {"id": "c", "label": "favorite color"}, {"id": "d", "label": "values and growth"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Read: "Maya must betray a friend to save many strangers." This is mainly:$tl$, $tl$[{"id": "a", "label": "internal conflict (a moral dilemma)"}, {"id": "b", "label": "external conflict only"}, {"id": "c", "label": "setting"}, {"id": "d", "label": "tone"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Character development means a character:$tl$, $tl$[{"id": "a", "label": "never changes"}, {"id": "b", "label": "grows or changes meaningfully over the story"}, {"id": "c", "label": "is described once"}, {"id": "d", "label": "is just named"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Subplots are secondary storylines that usually:$tl$, $tl$[{"id": "a", "label": "replace the title"}, {"id": "b", "label": "support or complicate the main plot"}, {"id": "c", "label": "number the pages"}, {"id": "d", "label": "design the cover"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$The central problem that drives a story is the ____. (one word)$tl$, null, $tl$conflict$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A foil is a character who, by contrast, highlights another character's:$tl$, $tl$[{"id": "a", "label": "traits"}, {"id": "b", "label": "page number"}, {"id": "c", "label": "font"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$A flashback interrupts the plot to show:$tl$, $tl$[{"id": "a", "label": "a future event for certain"}, {"id": "b", "label": "an earlier event"}, {"id": "c", "label": "the ending"}, {"id": "d", "label": "the title"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Comparing a character at the beginning and end reveals their:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "price"}, {"id": "d", "label": "development (or lack of change)"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Analyzing plot and characters together helps a reader interpret the story's:$tl$, $tl$[{"id": "a", "label": "page count"}, {"id": "b", "label": "font"}, {"id": "c", "label": "theme and meaning"}, {"id": "d", "label": "price"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$plot-character-development$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea.$tl$, 8, $tl$L.8.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Nouns", "body": "A noun names a person, place, thing, or idea."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"mountain\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"puppy\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a noun (a person, place, or thing)?\n\nThe answer is \"kitchen\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "whisper"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "shiny"}], "answer": "c", "explanation": "Yes! The answer is \"forest\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "fluffy"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "shiny"}], "answer": "c", "explanation": "Yes! The answer is \"doctor\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "frozen"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "slippery"}], "answer": "c", "explanation": "Yes! The answer is \"teacher\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "window"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "library"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "march"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "village"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "build"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "island"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "farmer"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "window"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action or a state of being.$tl$, 8, $tl$L.8.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Action Verbs", "body": "A verb shows action or a state of being."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an action verb (something you can do)?\n\nThe answer is \"jump\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an action verb (something you can do)?\n\nThe answer is \"scribble\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an action verb (something you can do)?\n\nThe answer is \"bounce\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "tiny"}], "answer": "a", "explanation": "Yes! The answer is \"build\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "discover"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "stormy"}], "answer": "a", "explanation": "Yes! The answer is \"discover\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "golden"}, {"id": "b", "label": "river"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "balloon"}], "answer": "c", "explanation": "Yes! The answer is \"shout\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Action Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "window"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "build"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "window"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "enormous"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "library"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "window"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "island"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "island"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun.$tl$, 8, $tl$L.8.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Adjectives", "body": "An adjective describes a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"fluffy\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"shiny\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is an adjective (it describes a noun)?\n\nThe answer is \"cheerful\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "window"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "frozen"}], "answer": "d", "explanation": "Yes! The answer is \"frozen\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "scribble"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "village"}], "answer": "c", "explanation": "Yes! The answer is \"tiny\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "bounce"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "whisper"}], "answer": "c", "explanation": "Yes! The answer is \"ancient\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Adjectives! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "library"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "build"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "river"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "march"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "farmer"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "village"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "narrow"}, {"id": "c", "label": "window"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun.$tl$, 8, $tl$L.8.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Pronouns", "body": "A pronoun takes the place of a noun."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"it\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"they\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word is a pronoun (it takes the place of a noun)?\n\nThe answer is \"him\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "paint"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "you"}], "answer": "d", "explanation": "Yes! The answer is \"you\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "build"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "her"}], "answer": "d", "explanation": "Yes! The answer is \"her\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "blanket"}, {"id": "b", "label": "discover"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "I"}], "answer": "d", "explanation": "Yes! The answer is \"I\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Pronouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "I"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "they"}, {"id": "c", "label": "march"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "her"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "village"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "us"}, {"id": "c", "label": "march"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "it"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "him"}, {"id": "b", "label": "build"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "you"}, {"id": "b", "label": "library"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "we"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "window"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "she"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "blanket"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "village"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "island"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "they"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "her"}, {"id": "c", "label": "village"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "us"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "river"}, {"id": "d", "label": "it"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "blanket"}, {"id": "c", "label": "him"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "you"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "we"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "she"}, {"id": "b", "label": "window"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must agree with its subject in number.$tl$, 8, $tl$L.8.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Subject-Verb Agreement", "body": "The verb must agree with its subject in number."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Choose the correct verb: \"The flower ____ every day.\"\n\nThe answer is \"grows\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Choose the correct verb: \"The singer ____ every day.\"\n\nThe answer is \"performs\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Choose the correct verb: \"The artist ____ every day.\"\n\nThe answer is \"paints\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The snake ____ every day.\"", "choices": [{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithersing"}, {"id": "d", "label": "slithers"}], "answer": "d", "explanation": "Yes! The answer is \"slithers\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The rabbit ____ every day.\"", "choices": [{"id": "a", "label": "hop"}, {"id": "b", "label": "hops"}, {"id": "c", "label": "hopsed"}, {"id": "d", "label": "hopsing"}], "answer": "b", "explanation": "Yes! The answer is \"hops\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The student ____ every day.\"", "choices": [{"id": "a", "label": "read"}, {"id": "b", "label": "reads"}, {"id": "c", "label": "readsed"}, {"id": "d", "label": "readsing"}], "answer": "b", "explanation": "Yes! The answer is \"reads\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Subject-Verb Agreement! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "crie"}, {"id": "b", "label": "criesed"}, {"id": "c", "label": "cries"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sing"}, {"id": "b", "label": "singsed"}, {"id": "c", "label": "singsing"}, {"id": "d", "label": "sings"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "play"}, {"id": "b", "label": "playsed"}, {"id": "c", "label": "plays"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barks"}, {"id": "c", "label": "barksed"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wag"}, {"id": "b", "label": "wags"}, {"id": "c", "label": "wagsed"}, {"id": "d", "label": "wagsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooksing"}, {"id": "d", "label": "cooks"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flowsed"}, {"id": "c", "label": "flows"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roars"}, {"id": "c", "label": "roarsed"}, {"id": "d", "label": "roarsing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticksed"}, {"id": "c", "label": "ticks"}, {"id": "d", "label": "ticksing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "perform"}, {"id": "b", "label": "performs"}, {"id": "c", "label": "performsed"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plants"}, {"id": "b", "label": "plant"}, {"id": "c", "label": "plantsed"}, {"id": "d", "label": "plantsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hops"}, {"id": "b", "label": "hop"}, {"id": "c", "label": "hopsed"}, {"id": "d", "label": "hopsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slither"}, {"id": "b", "label": "slithers"}, {"id": "c", "label": "slithersed"}, {"id": "d", "label": "slithersing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "growsed"}, {"id": "c", "label": "grows"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistle"}, {"id": "b", "label": "whistlesed"}, {"id": "c", "label": "whistles"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paints"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "paintsed"}, {"id": "d", "label": "paintsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "write"}, {"id": "b", "label": "writesed"}, {"id": "c", "label": "writesing"}, {"id": "d", "label": "writes"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "readsing"}, {"id": "d", "label": "reads"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "runs"}, {"id": "b", "label": "run"}, {"id": "c", "label": "runsed"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs describe actions that already happened.$tl$, 8, $tl$L.8.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Past-Tense Verbs", "body": "Past-tense verbs describe actions that already happened."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  What is the past tense of the verb \"think\"?\n\nThe answer is \"thought\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  What is the past tense of the verb \"know\"?\n\nThe answer is \"knew\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  What is the past tense of the verb \"buy\"?\n\nThe answer is \"bought\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  What is the past tense of the verb \"grow\"?\n\nThe answer is grew."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  What is the past tense of the verb \"draw\"?\n\nThe answer is drew."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  What is the past tense of the verb \"swim\"?\n\nThe answer is swam."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Past-Tense Verbs! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "bring"?$tl$, null, $tl$brought$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "ride"?$tl$, null, $tl$rode$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "drink"?$tl$, null, $tl$drank$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "take"?$tl$, null, $tl$took$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.8.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals show more than one.$tl$, 8, $tl$L.8.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Plural Nouns", "body": "Plurals show more than one."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Write the plural of \"shelf\".\n\nThe answer is \"shelves\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Write the plural of \"loaf\".\n\nThe answer is \"loaves\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Write the plural of \"wish\".\n\nThe answer is \"wishes\"."}, {"type": "worked_example", "title": "Worked example 4", "body": "Example 4.  Write the plural of \"penny\".\n\nThe answer is pennies."}, {"type": "worked_example", "title": "Worked example 5", "body": "Example 5.  Write the plural of \"baby\".\n\nThe answer is babies."}, {"type": "worked_example", "title": "Worked example 6", "body": "Example 6.  Write the plural of \"half\".\n\nThe answer is halves."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Plural Nouns! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "loaf".$tl$, null, $tl$loaves$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "wolf".$tl$, null, $tl$wolves$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capitalization$tl$, $tl$Capitalize sentence beginnings, I, and proper nouns.$tl$, 8, $tl$L.8.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Capitalization", "body": "Capitalize sentence beginnings, I, and proper nouns."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"India\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Pacific Ocean\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which word or phrase is a proper noun that must be capitalized?\n\nThe answer is \"Australia\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "mountain"}, {"id": "b", "label": "month"}, {"id": "c", "label": "river"}, {"id": "d", "label": "Nile River"}], "answer": "d", "explanation": "Yes! The answer is \"Nile River\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "December"}, {"id": "b", "label": "month"}, {"id": "c", "label": "city"}, {"id": "d", "label": "country"}], "answer": "a", "explanation": "Yes! The answer is \"December\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "river"}, {"id": "b", "label": "month"}, {"id": "c", "label": "Saturn"}, {"id": "d", "label": "country"}], "answer": "c", "explanation": "Yes! The answer is \"Saturn\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Capitalization! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "Amazon River"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Monday"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "India"}, {"id": "c", "label": "river"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Tuesday"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "month"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "Nile River"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Sarah"}, {"id": "c", "label": "month"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "Saturn"}, {"id": "c", "label": "day"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Canada"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "December"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Africa"}, {"id": "b", "label": "city"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Mount Everest"}, {"id": "b", "label": "city"}, {"id": "c", "label": "day"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "July"}, {"id": "c", "label": "day"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "London"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "Pacific Ocean"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Maria"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "October"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "Friday"}, {"id": "c", "label": "day"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "country"}, {"id": "c", "label": "river"}, {"id": "d", "label": "New York"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Tokyo"}, {"id": "c", "label": "country"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Australia"}, {"id": "b", "label": "country"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End sentences with a period, question mark, or exclamation point.$tl$, 8, $tl$L.8.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: End Punctuation", "body": "End sentences with a period, question mark, or exclamation point."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which end mark best completes the sentence?  \"That is amazing___\"\n\nThe answer is \"!\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which end mark best completes the sentence?  \"When does it start___\"\n\nThe answer is \"?\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which end mark best completes the sentence?  \"Look at that___\"\n\nThe answer is \"!\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"The cake is delicious___\"", "choices": [{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}], "answer": "c", "explanation": "Yes! The answer is \".\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"I love to read___\"", "choices": [{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}], "answer": "c", "explanation": "Yes! The answer is \".\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"My dog is brown___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}], "answer": "a", "explanation": "Yes! The answer is \".\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about End Punctuation! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.8.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$Use commas to separate three or more items in a list.$tl$, 8, $tl$L.8.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 8, $tl$[{"type": "explain", "title": "Let's learn: Commas in a Series", "body": "Use commas to separate three or more items in a list."}, {"type": "worked_example", "title": "Worked example 1", "body": "Example 1.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like trains, planes, and buses.\"."}, {"type": "worked_example", "title": "Worked example 2", "body": "Example 2.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like ham, cheese, and lettuce.\"."}, {"type": "worked_example", "title": "Worked example 3", "body": "Example 3.  Which sentence uses commas correctly in a list?\n\nThe answer is \"I like piano, drums, and guitar.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like apples, grapes, and plums."}, {"id": "b", "label": "I like apples grapes and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}], "answer": "a", "explanation": "Yes! The answer is \"I like apples, grapes, and plums.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like cats, dogs, and fish."}, {"id": "d", "label": "I like, cats dogs fish."}], "answer": "c", "explanation": "Yes! The answer is \"I like cats, dogs, and fish.\"."}, {"type": "check", "title": "Your turn", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens, and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}], "answer": "b", "explanation": "Yes! The answer is \"I like pencils, pens, and markers.\"."}, {"type": "explain", "title": "You've got this!", "body": "Great work learning about Commas in a Series! Now tap a worksheet to practice and earn points. You can always come back to this lesson."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 8, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring summer and fall."}, {"id": "b", "label": "I like spring, summer, and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens and markers"}, {"id": "c", "label": "I like, pencils pens markers."}, {"id": "d", "label": "I like pencils, pens, and markers."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like, apples oranges pears."}, {"id": "d", "label": "I like apples, oranges, and pears."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples grapes and plums."}, {"id": "b", "label": "I like apples, grapes and plums"}, {"id": "c", "label": "I like, apples grapes plums."}, {"id": "d", "label": "I like apples, grapes, and plums."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens and rulers"}, {"id": "c", "label": "I like, books pens rulers."}, {"id": "d", "label": "I like books, pens, and rulers."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 8, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs, and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares and triangles"}, {"id": "c", "label": "I like, circles squares triangles."}, {"id": "d", "label": "I like circles, squares, and triangles."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver, and bronze."}, {"id": "c", "label": "I like gold, silver and bronze"}, {"id": "d", "label": "I like, gold silver bronze."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham cheese and lettuce."}, {"id": "b", "label": "I like ham, cheese and lettuce"}, {"id": "c", "label": "I like, ham cheese lettuce."}, {"id": "d", "label": "I like ham, cheese, and lettuce."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 8, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red, green, and blue."}, {"id": "b", "label": "I like red green and blue."}, {"id": "c", "label": "I like red, green and blue"}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains, planes, and buses."}, {"id": "b", "label": "I like trains planes and buses."}, {"id": "c", "label": "I like trains, planes and buses"}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like cats, dogs, and fish."}, {"id": "d", "label": "I like, cats dogs fish."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow and hail"}, {"id": "c", "label": "I like, rain snow hail."}, {"id": "d", "label": "I like rain, snow, and hail."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run, jump, and swim."}, {"id": "b", "label": "I like run jump and swim."}, {"id": "c", "label": "I like run, jump and swim"}, {"id": "d", "label": "I like, run jump swim."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 8, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer, tennis, and golf."}, {"id": "b", "label": "I like soccer tennis and golf."}, {"id": "c", "label": "I like soccer, tennis and golf"}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom, Dad, and Grandma."}, {"id": "b", "label": "I like Mom Dad and Grandma."}, {"id": "c", "label": "I like Mom, Dad and Grandma"}, {"id": "d", "label": "I like, Mom Dad Grandma."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums, and guitar."}, {"id": "c", "label": "I like piano, drums and guitar"}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north south and east."}, {"id": "b", "label": "I like north, south and east"}, {"id": "c", "label": "I like, north south east."}, {"id": "d", "label": "I like north, south, and east."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 8, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers, and bears."}, {"id": "c", "label": "I like lions, tigers and bears"}, {"id": "d", "label": "I like, lions tigers bears."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 8 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

