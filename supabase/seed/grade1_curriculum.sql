-- =====================================================================
-- TopicLeap - Grade 1 full curriculum seed (generated)
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

-- ---- [math] Counting to 120 (1.NBT.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$counting-to-120$tl$, $tl$Counting to 120$tl$, $tl$Count forward and find what number comes next, all the way to 120.$tl$, 1, $tl$1.NBT.A.1$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Counting to 120$tl$, 1, $tl$[{"type": "explain", "title": "About: Counting to 120", "body": "Count forward and find what number comes next, all the way to 120."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What number comes next?  66, 67, ___  The answer is 68."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  66, 67, ___$tl$, null, $tl$68$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 16?$tl$, null, $tl$17$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  98, 99, ___$tl$, null, $tl$100$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 105?$tl$, null, $tl$106$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  65, 66, ___$tl$, null, $tl$67$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 85?$tl$, null, $tl$86$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  50, 51, ___$tl$, null, $tl$52$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 5?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  103, 104, ___$tl$, null, $tl$105$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 61?$tl$, null, $tl$62$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  21, 22, ___$tl$, null, $tl$23$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 54?$tl$, null, $tl$55$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  48, 49, ___$tl$, null, $tl$50$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 102?$tl$, null, $tl$103$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  73, 74, ___$tl$, null, $tl$75$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 16?$tl$, null, $tl$17$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  110, 111, ___$tl$, null, $tl$112$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 18?$tl$, null, $tl$19$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes next?  49, 50, ___$tl$, null, $tl$51$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes right after 9?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-120$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Addition within 20 (1.OA.C.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$addition-within-20$tl$, $tl$Addition within 20$tl$, $tl$Add two numbers that add up to 20 or less. Count on to find the total.$tl$, 1, $tl$1.OA.C.6$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Addition within 20$tl$, 1, $tl$[{"type": "explain", "title": "About: Addition within 20", "body": "Add two numbers that add up to 20 or less. Count on to find the total."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 7 + 1 = ?  The answer is 8."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 7 + 1 = ?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 3 + 9 = ?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 3 + 8 = ?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 2 + 6 = ?$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 1 + 3 = ?$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 5 + 2 = ?$tl$, null, $tl$7$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 3 + 14 = ?$tl$, null, $tl$17$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 6 + 8 = ?$tl$, null, $tl$14$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 10 + 8 = ?$tl$, null, $tl$18$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 5 + 10 = ?$tl$, null, $tl$15$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 2 + 3 = ?$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 4 + 15 = ?$tl$, null, $tl$19$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 9 + 7 = ?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 6 + 14 = ?$tl$, null, $tl$20$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 6 + 4 = ?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 4 + 13 = ?$tl$, null, $tl$17$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 9 + 8 = ?$tl$, null, $tl$17$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 3 + 12 = ?$tl$, null, $tl$15$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 1 + 8 = ?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add: 3 + 10 = ?$tl$, null, $tl$13$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Subtraction within 20 (1.OA.C.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subtraction-within-20$tl$, $tl$Subtraction within 20$tl$, $tl$Take away to find how many are left, with numbers up to 20.$tl$, 1, $tl$1.OA.C.6$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subtraction within 20$tl$, 1, $tl$[{"type": "explain", "title": "About: Subtraction within 20", "body": "Take away to find how many are left, with numbers up to 20."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Subtract: 6 - 2 = ?  The answer is 4."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 6 - 2 = ?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 7 - 5 = ?$tl$, null, $tl$2$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 14 - 10 = ?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 7 - 6 = ?$tl$, null, $tl$1$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 5 - 2 = ?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 18 - 9 = ?$tl$, null, $tl$9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 2 - 2 = ?$tl$, null, $tl$0$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 8 - 2 = ?$tl$, null, $tl$6$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 8 - 3 = ?$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 9 - 5 = ?$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 17 - 9 = ?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 14 - 13 = ?$tl$, null, $tl$1$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 5 - 1 = ?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 13 - 2 = ?$tl$, null, $tl$11$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 11 - 3 = ?$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 12 - 11 = ?$tl$, null, $tl$1$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 12 - 10 = ?$tl$, null, $tl$2$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 19 - 6 = ?$tl$, null, $tl$13$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 12 - 5 = ?$tl$, null, $tl$7$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Subtract: 16 - 7 = ?$tl$, null, $tl$9$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-20$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Tens & Ones (1.NBT.B.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$tens-and-ones$tl$, $tl$Tens & Ones$tl$, $tl$A two-digit number is made of tens and ones. In 34 there are 3 tens and 4 ones.$tl$, 1, $tl$1.NBT.B.2$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Tens & Ones$tl$, 1, $tl$[{"type": "explain", "title": "About: Tens & Ones", "body": "A two-digit number is made of tens and ones. In 34 there are 3 tens and 4 ones."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: How many TENS are in the number 86?  The answer is 8."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 86?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 18?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 78?$tl$, null, $tl$7$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 11?$tl$, null, $tl$1$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 38?$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 96?$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 72?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 88?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 30?$tl$, null, $tl$3$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 20?$tl$, null, $tl$0$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 94?$tl$, null, $tl$9$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 68?$tl$, null, $tl$8$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 89?$tl$, null, $tl$8$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 82?$tl$, null, $tl$2$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 45?$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 95?$tl$, null, $tl$5$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 30?$tl$, null, $tl$3$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 34?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many TENS are in the number 54?$tl$, null, $tl$5$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$How many ONES are in the number 14?$tl$, null, $tl$4$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$tens-and-ones$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Comparing Numbers (1.NBT.B.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$comparing-numbers$tl$, $tl$Comparing Numbers$tl$, $tl$Compare two numbers to tell which one is bigger (greater) or smaller (less).$tl$, 1, $tl$1.NBT.B.3$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Numbers$tl$, 1, $tl$[{"type": "explain", "title": "About: Comparing Numbers", "body": "Compare two numbers to tell which one is bigger (greater) or smaller (less)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which number is bigger: 77 or 96?  The correct answer is \"96\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which number is bigger: 41 or 76?", "choices": [{"id": "a", "label": "41"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "76"}, {"id": "d", "label": "117"}], "answer": "c", "explanation": "The correct answer is \"76\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 77 or 96?$tl$, $tl$[{"id": "a", "label": "77"}, {"id": "b", "label": "96"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "173"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 41 or 76?$tl$, $tl$[{"id": "a", "label": "41"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "76"}, {"id": "d", "label": "117"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 1 or 54?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "55"}, {"id": "d", "label": "54"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 99 or 1?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "99"}, {"id": "d", "label": "100"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 29 or 45?$tl$, $tl$[{"id": "a", "label": "29"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "45"}, {"id": "d", "label": "74"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 7 or 62?$tl$, $tl$[{"id": "a", "label": "7"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "62"}, {"id": "d", "label": "69"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 35 or 68?$tl$, $tl$[{"id": "a", "label": "35"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "103"}, {"id": "d", "label": "68"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 17 or 60?$tl$, $tl$[{"id": "a", "label": "60"}, {"id": "b", "label": "17"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "77"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 51 or 82?$tl$, $tl$[{"id": "a", "label": "51"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "82"}, {"id": "d", "label": "133"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 81 or 90?$tl$, $tl$[{"id": "a", "label": "81"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "90"}, {"id": "d", "label": "171"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 89 or 90?$tl$, $tl$[{"id": "a", "label": "90"}, {"id": "b", "label": "89"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "179"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 89 or 29?$tl$, $tl$[{"id": "a", "label": "89"}, {"id": "b", "label": "29"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "118"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 98 or 87?$tl$, $tl$[{"id": "a", "label": "98"}, {"id": "b", "label": "87"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "185"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 41 or 53?$tl$, $tl$[{"id": "a", "label": "41"}, {"id": "b", "label": "53"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "94"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 59 or 75?$tl$, $tl$[{"id": "a", "label": "59"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "75"}, {"id": "d", "label": "134"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 39 or 67?$tl$, $tl$[{"id": "a", "label": "67"}, {"id": "b", "label": "39"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "106"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 56 or 99?$tl$, $tl$[{"id": "a", "label": "56"}, {"id": "b", "label": "99"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "155"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 52 or 63?$tl$, $tl$[{"id": "a", "label": "52"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "63"}, {"id": "d", "label": "115"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 83 or 45?$tl$, $tl$[{"id": "a", "label": "45"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "83"}, {"id": "d", "label": "128"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which number is bigger: 62 or 50?$tl$, $tl$[{"id": "a", "label": "50"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "62"}, {"id": "d", "label": "112"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Adding Tens (1.NBT.C.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adding-tens$tl$, $tl$Adding Tens$tl$, $tl$Add whole tens together, like 30 + 40, by counting the tens.$tl$, 1, $tl$1.NBT.C.4$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adding Tens$tl$, 1, $tl$[{"type": "explain", "title": "About: Adding Tens", "body": "Add whole tens together, like 30 + 40, by counting the tens."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add the tens: 30 + 40 = ?  The answer is 70."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 40 = ?$tl$, null, $tl$70$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 40 + 60 = ?$tl$, null, $tl$100$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 30 = ?$tl$, null, $tl$60$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 50 = ?$tl$, null, $tl$80$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 40 + 20 = ?$tl$, null, $tl$60$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 50 + 30 = ?$tl$, null, $tl$80$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 50 + 10 = ?$tl$, null, $tl$60$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 40 + 10 = ?$tl$, null, $tl$50$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 20 + 80 = ?$tl$, null, $tl$100$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 10 + 60 = ?$tl$, null, $tl$70$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 20 + 10 = ?$tl$, null, $tl$30$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 90 = ?$tl$, null, $tl$120$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 20 + 70 = ?$tl$, null, $tl$90$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 80 = ?$tl$, null, $tl$110$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 10 + 40 = ?$tl$, null, $tl$50$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 50 + 70 = ?$tl$, null, $tl$120$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 30 + 20 = ?$tl$, null, $tl$50$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 50 + 50 = ?$tl$, null, $tl$100$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 20 + 40 = ?$tl$, null, $tl$60$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Add the tens: 50 + 60 = ?$tl$, null, $tl$110$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-tens$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Shapes (1.G.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$shapes$tl$, $tl$Shapes$tl$, $tl$Learn the names of shapes like circle, square, triangle, and rectangle.$tl$, 1, $tl$1.G.A.1$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Shapes$tl$, 1, $tl$[{"type": "explain", "title": "About: Shapes", "body": "Learn the names of shapes like circle, square, triangle, and rectangle."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is a square?  The correct answer is \"\ud83d\udfe6\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is a heart?", "choices": [{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udfe6"}], "answer": "c", "explanation": "The correct answer is \"\u2764\ufe0f\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\u2764\ufe0f"}, {"id": "b", "label": "\u25ac"}, {"id": "c", "label": "\u2b55"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\u25ac"}, {"id": "b", "label": "\u2b55"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\u25ac"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\u25ac"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\u2b55"}, {"id": "d", "label": "\u2764\ufe0f"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a triangle?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\u2764\ufe0f"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a triangle?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\u2b55"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2764\ufe0f"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a rectangle?$tl$, $tl$[{"id": "a", "label": "\u25ac"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a square?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\u2764\ufe0f"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a star?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\u2b50"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\u2764\ufe0f"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a triangle?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\u2764\ufe0f"}, {"id": "c", "label": "\u2b55"}, {"id": "d", "label": "\u25ac"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u25ac"}, {"id": "d", "label": "\u2764\ufe0f"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2764\ufe0f"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Telling Time (Hour) (1.MD.B.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$time-to-the-hour$tl$, $tl$Telling Time (Hour)$tl$, $tl$When the big hand points to 12 and the little hand points to a number, it is that o'clock.$tl$, 1, $tl$1.MD.B.3$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Telling Time (Hour)$tl$, 1, $tl$[{"type": "explain", "title": "About: Telling Time (Hour)", "body": "When the big hand points to 12 and the little hand points to a number, it is that o'clock."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A clock's big hand points to 12 and the little hand points to 7. What time is it?  The correct answer is \"7:00\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A clock's big hand points to 12 and the little hand points to 7. What time is it?", "choices": [{"id": "a", "label": "7:00"}, {"id": "b", "label": "5:00"}, {"id": "c", "label": "8:00"}, {"id": "d", "label": "4:00"}], "answer": "a", "explanation": "The correct answer is \"7:00\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 7. What time is it?$tl$, $tl$[{"id": "a", "label": "2:00"}, {"id": "b", "label": "8:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "7:00"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 7. What time is it?$tl$, $tl$[{"id": "a", "label": "7:00"}, {"id": "b", "label": "5:00"}, {"id": "c", "label": "8:00"}, {"id": "d", "label": "4:00"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 3. What time is it?$tl$, $tl$[{"id": "a", "label": "3:00"}, {"id": "b", "label": "1:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "2:00"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 6. What time is it?$tl$, $tl$[{"id": "a", "label": "7:00"}, {"id": "b", "label": "5:00"}, {"id": "c", "label": "6:00"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 11. What time is it?$tl$, $tl$[{"id": "a", "label": "3:00"}, {"id": "b", "label": "12:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "7:00"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 11. What time is it?$tl$, $tl$[{"id": "a", "label": "5:00"}, {"id": "b", "label": "3:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "7:00"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 11. What time is it?$tl$, $tl$[{"id": "a", "label": "11:00"}, {"id": "b", "label": "1:00"}, {"id": "c", "label": "7:00"}, {"id": "d", "label": "6:00"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 7. What time is it?$tl$, $tl$[{"id": "a", "label": "10:00"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "7:00"}, {"id": "d", "label": "11:00"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 4. What time is it?$tl$, $tl$[{"id": "a", "label": "9:00"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "4:00"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 1. What time is it?$tl$, $tl$[{"id": "a", "label": "8:00"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "1:00"}, {"id": "d", "label": "5:00"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 4. What time is it?$tl$, $tl$[{"id": "a", "label": "4:00"}, {"id": "b", "label": "11:00"}, {"id": "c", "label": "9:00"}, {"id": "d", "label": "5:00"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 6. What time is it?$tl$, $tl$[{"id": "a", "label": "12:00"}, {"id": "b", "label": "5:00"}, {"id": "c", "label": "4:00"}, {"id": "d", "label": "6:00"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 10. What time is it?$tl$, $tl$[{"id": "a", "label": "10:00"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "12:00"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 10. What time is it?$tl$, $tl$[{"id": "a", "label": "10:00"}, {"id": "b", "label": "8:00"}, {"id": "c", "label": "4:00"}, {"id": "d", "label": "1:00"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 8. What time is it?$tl$, $tl$[{"id": "a", "label": "8:00"}, {"id": "b", "label": "3:00"}, {"id": "c", "label": "6:00"}, {"id": "d", "label": "1:00"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 6. What time is it?$tl$, $tl$[{"id": "a", "label": "9:00"}, {"id": "b", "label": "7:00"}, {"id": "c", "label": "6:00"}, {"id": "d", "label": "1:00"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 4. What time is it?$tl$, $tl$[{"id": "a", "label": "9:00"}, {"id": "b", "label": "4:00"}, {"id": "c", "label": "6:00"}, {"id": "d", "label": "12:00"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 8. What time is it?$tl$, $tl$[{"id": "a", "label": "9:00"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "4:00"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 1. What time is it?$tl$, $tl$[{"id": "a", "label": "7:00"}, {"id": "b", "label": "1:00"}, {"id": "c", "label": "11:00"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A clock's big hand points to 12 and the little hand points to 8. What time is it?$tl$, $tl$[{"id": "a", "label": "4:00"}, {"id": "b", "label": "1:00"}, {"id": "c", "label": "3:00"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$time-to-the-hour$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Number Order (1.NBT.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$number-order$tl$, $tl$Number Order$tl$, $tl$Numbers come in order. Find the number that comes between two others.$tl$, 1, $tl$1.NBT.A.1$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Number Order$tl$, 1, $tl$[{"type": "explain", "title": "About: Number Order", "body": "Numbers come in order. Find the number that comes between two others."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What number comes between 22 and 24?  The answer is 23."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 22 and 24?$tl$, null, $tl$23$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 59 and 61?$tl$, null, $tl$60$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 57 and 59?$tl$, null, $tl$58$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 40 and 42?$tl$, null, $tl$41$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 23 and 25?$tl$, null, $tl$24$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 60 and 62?$tl$, null, $tl$61$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 100 and 102?$tl$, null, $tl$101$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 13 and 15?$tl$, null, $tl$14$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 39 and 41?$tl$, null, $tl$40$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 77 and 79?$tl$, null, $tl$78$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 7 and 9?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 26 and 28?$tl$, null, $tl$27$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 42 and 44?$tl$, null, $tl$43$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 51 and 53?$tl$, null, $tl$52$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 94 and 96?$tl$, null, $tl$95$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 88 and 90?$tl$, null, $tl$89$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 11 and 13?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 114 and 116?$tl$, null, $tl$115$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 89 and 91?$tl$, null, $tl$90$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What number comes between 43 and 45?$tl$, null, $tl$44$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-order$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Word Problems (1.OA.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$word-problems$tl$, $tl$Word Problems$tl$, $tl$Read a short story and add or subtract to solve the problem.$tl$, 1, $tl$1.OA.A.1$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Word Problems$tl$, 1, $tl$[{"type": "explain", "title": "About: Word Problems", "body": "Read a short story and add or subtract to solve the problem."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Mia has 2 crayons and gets 4 more. How many crayons now?  The answer is 6."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Mia has 2 crayons and gets 4 more. How many crayons now?$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Ava has 6 marbles and gives away 3. How many marbles are left?$tl$, null, $tl$3$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Ben has 11 shells and gets 2 more. How many shells now?$tl$, null, $tl$13$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Maya has 2 blocks and gives away 2. How many blocks are left?$tl$, null, $tl$0$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Maya has 5 crayons and gets 8 more. How many crayons now?$tl$, null, $tl$13$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Zoe has 2 marbles and gives away 1. How many marbles are left?$tl$, null, $tl$1$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Sam has 9 crayons and gets 2 more. How many crayons now?$tl$, null, $tl$11$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Kai has 9 marbles and gives away 5. How many marbles are left?$tl$, null, $tl$4$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Leo has 9 apples and gets 8 more. How many apples now?$tl$, null, $tl$17$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Kai has 10 blocks and gives away 9. How many blocks are left?$tl$, null, $tl$1$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Sam has 8 shells and gets 6 more. How many shells now?$tl$, null, $tl$14$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Ben has 10 marbles and gives away 6. How many marbles are left?$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Mia has 9 marbles and gets 8 more. How many marbles now?$tl$, null, $tl$17$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Ava has 7 marbles and gives away 1. How many marbles are left?$tl$, null, $tl$6$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Mia has 7 blocks and gets 4 more. How many blocks now?$tl$, null, $tl$11$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Mia has 3 shells and gives away 3. How many shells are left?$tl$, null, $tl$0$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Maya has 11 blocks and gets 3 more. How many blocks now?$tl$, null, $tl$14$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Ava has 11 marbles and gives away 11. How many marbles are left?$tl$, null, $tl$0$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Zoe has 6 crayons and gets 1 more. How many crayons now?$tl$, null, $tl$7$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Mia has 11 apples and gives away 4. How many apples are left?$tl$, null, $tl$7$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$word-problems$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Light & Seeing (1-PS4-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$light-and-seeing$tl$, $tl$Light & Seeing$tl$, $tl$We need light to see. The Sun, lamps, and flashlights give off light.$tl$, 1, $tl$1-PS4-2$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Light & Seeing$tl$, 1, $tl$[{"type": "explain", "title": "About: Light & Seeing", "body": "We need light to see. The Sun, lamps, and flashlights give off light."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What do your eyes need to be able to see things?  The correct answer is \"light\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "In a completely dark room with no light, you can:", "choices": [{"id": "a", "label": "see everything"}, {"id": "b", "label": "see colors only"}, {"id": "c", "label": "read a book"}, {"id": "d", "label": "see nothing"}], "answer": "d", "explanation": "The correct answer is \"see nothing\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What do your eyes need to be able to see things?$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "light"}, {"id": "c", "label": "water"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In a completely dark room with no light, you can:$tl$, $tl$[{"id": "a", "label": "see everything"}, {"id": "b", "label": "see colors only"}, {"id": "c", "label": "read a book"}, {"id": "d", "label": "see nothing"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which gives off light?$tl$, $tl$[{"id": "a", "label": "the Sun"}, {"id": "b", "label": "a rock"}, {"id": "c", "label": "a chair"}, {"id": "d", "label": "a sock"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$At night we use a lamp or flashlight so we can:$tl$, $tl$[{"id": "a", "label": "hear"}, {"id": "b", "label": "see"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "taste"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which object makes its own light?$tl$, $tl$[{"id": "a", "label": "a candle"}, {"id": "b", "label": "a spoon"}, {"id": "c", "label": "a book"}, {"id": "d", "label": "a shoe"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Why can you see the Moon at night?$tl$, $tl$[{"id": "a", "label": "light bounces off it"}, {"id": "b", "label": "it is on fire"}, {"id": "c", "label": "it is a lamp"}, {"id": "d", "label": "it makes sound"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A shadow is made when something blocks the:$tl$, $tl$[{"id": "a", "label": "light"}, {"id": "b", "label": "sound"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which helps you see in a dark cave?$tl$, $tl$[{"id": "a", "label": "a pillow"}, {"id": "b", "label": "a cup"}, {"id": "c", "label": "a sock"}, {"id": "d", "label": "a flashlight"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Glass and clear plastic let light:$tl$, $tl$[{"id": "a", "label": "disappear"}, {"id": "b", "label": "turn to sound"}, {"id": "c", "label": "freeze"}, {"id": "d", "label": "pass through"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A thick wall blocks light, so behind it is:$tl$, $tl$[{"id": "a", "label": "bright"}, {"id": "b", "label": "colorful"}, {"id": "c", "label": "dark / shadow"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is the biggest source of light for Earth?$tl$, $tl$[{"id": "a", "label": "the Sun"}, {"id": "b", "label": "a candle"}, {"id": "c", "label": "a phone"}, {"id": "d", "label": "a star far away"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$If you close your eyes, you cannot:$tl$, $tl$[{"id": "a", "label": "hear"}, {"id": "b", "label": "smell"}, {"id": "c", "label": "feel"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A mirror works by making light:$tl$, $tl$[{"id": "a", "label": "bounce back"}, {"id": "b", "label": "disappear"}, {"id": "c", "label": "get louder"}, {"id": "d", "label": "freeze"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sunglasses help when there is:$tl$, $tl$[{"id": "a", "label": "too much bright light"}, {"id": "b", "label": "too much sound"}, {"id": "c", "label": "too much water"}, {"id": "d", "label": "no light"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which one does NOT give off light?$tl$, $tl$[{"id": "a", "label": "the Sun"}, {"id": "b", "label": "a rock"}, {"id": "c", "label": "a lamp"}, {"id": "d", "label": "a candle"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Your eyes need ____ to see. (one word)$tl$, null, $tl$light$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$During the day, our main light comes from:$tl$, $tl$[{"id": "a", "label": "the Moon"}, {"id": "b", "label": "stars"}, {"id": "c", "label": "the Sun"}, {"id": "d", "label": "streetlights"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A room with the curtains closed and lights off will be:$tl$, $tl$[{"id": "a", "label": "bright"}, {"id": "b", "label": "dark"}, {"id": "c", "label": "sunny"}, {"id": "d", "label": "windy"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$To read at night you should turn on a:$tl$, $tl$[{"id": "a", "label": "fan"}, {"id": "b", "label": "faucet"}, {"id": "c", "label": "light"}, {"id": "d", "label": "radio only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Light travels in straight lines until it hits something and:$tl$, $tl$[{"id": "a", "label": "turns to water"}, {"id": "b", "label": "makes a sound"}, {"id": "c", "label": "bounces or stops"}, {"id": "d", "label": "disappears forever"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$light-and-seeing$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Sound & Vibration (1-PS4-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sound-and-vibration$tl$, $tl$Sound & Vibration$tl$, $tl$Sound is made when something vibrates (shakes quickly), and we hear it with our ears.$tl$, 1, $tl$1-PS4-1$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sound & Vibration$tl$, 1, $tl$[{"type": "explain", "title": "About: Sound & Vibration", "body": "Sound is made when something vibrates (shakes quickly), and we hear it with our ears."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Sound is made when something:  The correct answer is \"vibrates (shakes quickly)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "When you pluck a guitar string, it makes sound because it:", "choices": [{"id": "a", "label": "lights up"}, {"id": "b", "label": "gets wet"}, {"id": "c", "label": "stops moving"}, {"id": "d", "label": "vibrates"}], "answer": "d", "explanation": "The correct answer is \"vibrates\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sound is made when something:$tl$, $tl$[{"id": "a", "label": "vibrates (shakes quickly)"}, {"id": "b", "label": "freezes"}, {"id": "c", "label": "glows"}, {"id": "d", "label": "melts"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$When you pluck a guitar string, it makes sound because it:$tl$, $tl$[{"id": "a", "label": "lights up"}, {"id": "b", "label": "gets wet"}, {"id": "c", "label": "stops moving"}, {"id": "d", "label": "vibrates"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A drum makes sound when its top:$tl$, $tl$[{"id": "a", "label": "freezes"}, {"id": "b", "label": "glows"}, {"id": "c", "label": "vibrates after you hit it"}, {"id": "d", "label": "disappears"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$To make a louder sound on a drum, you hit it:$tl$, $tl$[{"id": "a", "label": "harder"}, {"id": "b", "label": "softer"}, {"id": "c", "label": "not at all"}, {"id": "d", "label": "with a feather"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which would make a quiet sound?$tl$, $tl$[{"id": "a", "label": "a soft whisper"}, {"id": "b", "label": "a loud shout"}, {"id": "c", "label": "a banging drum"}, {"id": "d", "label": "a fire truck siren"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$You hear sounds with your:$tl$, $tl$[{"id": "a", "label": "eyes"}, {"id": "b", "label": "ears"}, {"id": "c", "label": "nose"}, {"id": "d", "label": "hands"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Tapping a glass gently makes a sound because the glass:$tl$, $tl$[{"id": "a", "label": "melts"}, {"id": "b", "label": "vibrates"}, {"id": "c", "label": "glows"}, {"id": "d", "label": "grows"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Big, strong vibrations make sounds that are:$tl$, $tl$[{"id": "a", "label": "quiet"}, {"id": "b", "label": "silent"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "invisible"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A buzzing bee makes sound by moving its wings very:$tl$, $tl$[{"id": "a", "label": "slowly"}, {"id": "b", "label": "fast (they vibrate)"}, {"id": "c", "label": "once"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$If something is perfectly still and not vibrating, it makes:$tl$, $tl$[{"id": "a", "label": "a loud sound"}, {"id": "b", "label": "light"}, {"id": "c", "label": "no sound"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Humming makes your throat:$tl$, $tl$[{"id": "a", "label": "freeze"}, {"id": "b", "label": "vibrate"}, {"id": "c", "label": "glow"}, {"id": "d", "label": "stop"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which makes a loud sound?$tl$, $tl$[{"id": "a", "label": "a falling feather"}, {"id": "b", "label": "a sleeping cat"}, {"id": "c", "label": "a soft pillow"}, {"id": "d", "label": "a fire truck siren"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A rubber band stretched and plucked will:$tl$, $tl$[{"id": "a", "label": "light up"}, {"id": "b", "label": "get cold"}, {"id": "c", "label": "vibrate and make a sound"}, {"id": "d", "label": "turn to water"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sound can travel through the:$tl$, $tl$[{"id": "a", "label": "empty space with nothing"}, {"id": "b", "label": "a shadow"}, {"id": "c", "label": "air"}, {"id": "d", "label": "a picture"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Covering your ears makes sounds seem:$tl$, $tl$[{"id": "a", "label": "louder"}, {"id": "b", "label": "brighter"}, {"id": "c", "label": "colder"}, {"id": "d", "label": "quieter"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Sound is made when something ____ back and forth quickly. (one word)$tl$, null, $tl$vibrates$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A whistle makes sound when air makes it:$tl$, $tl$[{"id": "a", "label": "freeze"}, {"id": "b", "label": "vibrate"}, {"id": "c", "label": "glow"}, {"id": "d", "label": "melt"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which body part helps you hear?$tl$, $tl$[{"id": "a", "label": "your elbow"}, {"id": "b", "label": "your knee"}, {"id": "c", "label": "your hair"}, {"id": "d", "label": "your ear"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Two pots banged together make a:$tl$, $tl$[{"id": "a", "label": "quiet whisper"}, {"id": "b", "label": "bright light"}, {"id": "c", "label": "loud sound"}, {"id": "d", "label": "cool breeze"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The faster something vibrates, the higher the:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "weight"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "pitch (how high the sound is)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sound-and-vibration$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Signals: Light & Sound (1-PS4-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$communicating-with-light-and-sound$tl$, $tl$Signals: Light & Sound$tl$, $tl$People use light and sound, like sirens and flashing lights, to send messages far away.$tl$, 1, $tl$1-PS4-4$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Signals: Light & Sound$tl$, 1, $tl$[{"type": "explain", "title": "About: Signals: Light & Sound", "body": "People use light and sound, like sirens and flashing lights, to send messages far away."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: People can send a message far away using:  The correct answer is \"light or sound signals\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A flashing light on a fire truck is used to:", "choices": [{"id": "a", "label": "cook food"}, {"id": "b", "label": "tell time"}, {"id": "c", "label": "water plants"}, {"id": "d", "label": "send a warning signal"}], "answer": "d", "explanation": "The correct answer is \"send a warning signal\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$People can send a message far away using:$tl$, $tl$[{"id": "a", "label": "light or sound signals"}, {"id": "b", "label": "only smells"}, {"id": "c", "label": "only colors of socks"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A flashing light on a fire truck is used to:$tl$, $tl$[{"id": "a", "label": "cook food"}, {"id": "b", "label": "tell time"}, {"id": "c", "label": "water plants"}, {"id": "d", "label": "send a warning signal"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A loud siren warns people to:$tl$, $tl$[{"id": "a", "label": "go to sleep"}, {"id": "b", "label": "eat lunch"}, {"id": "c", "label": "read"}, {"id": "d", "label": "get out of the way"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A ringing school bell tells students it is time to:$tl$, $tl$[{"id": "a", "label": "go swimming"}, {"id": "b", "label": "take a nap forever"}, {"id": "c", "label": "change class or line up"}, {"id": "d", "label": "plant a tree"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sailors and campers can signal far away with a:$tl$, $tl$[{"id": "a", "label": "soft pillow"}, {"id": "b", "label": "cup of soup"}, {"id": "c", "label": "bright flashlight"}, {"id": "d", "label": "wet sponge"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A car horn (beep) is a sound used to:$tl$, $tl$[{"id": "a", "label": "clean the car"}, {"id": "b", "label": "get someone's attention"}, {"id": "c", "label": "cool the engine"}, {"id": "d", "label": "paint the road"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Traffic lights use colored light to tell drivers to:$tl$, $tl$[{"id": "a", "label": "stop or go"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "sleep"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A lighthouse shines light to:$tl$, $tl$[{"id": "a", "label": "cook fish"}, {"id": "b", "label": "warm the ocean"}, {"id": "c", "label": "make rain"}, {"id": "d", "label": "help boats find their way at night"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A whistle from a coach is a sound that means:$tl$, $tl$[{"id": "a", "label": "lunchtime forever"}, {"id": "b", "label": "bedtime"}, {"id": "c", "label": "start or stop"}, {"id": "d", "label": "recess only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$You can use patterns of light or sound to:$tl$, $tl$[{"id": "a", "label": "share information"}, {"id": "b", "label": "create new animals"}, {"id": "c", "label": "stop the wind"}, {"id": "d", "label": "make gold"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A doorbell uses sound to tell you:$tl$, $tl$[{"id": "a", "label": "it is raining"}, {"id": "b", "label": "the food is ready always"}, {"id": "c", "label": "someone is at the door"}, {"id": "d", "label": "to go to bed"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Blinking hazard lights on a car tell others:$tl$, $tl$[{"id": "a", "label": "the car is happy"}, {"id": "b", "label": "it is a holiday"}, {"id": "c", "label": "to race"}, {"id": "d", "label": "there may be a problem"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A phone ringing is a sound signal that means:$tl$, $tl$[{"id": "a", "label": "it is sunny"}, {"id": "b", "label": "someone is calling"}, {"id": "c", "label": "time to eat"}, {"id": "d", "label": "the TV is on"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is a way to signal for help at night?$tl$, $tl$[{"id": "a", "label": "whisper quietly"}, {"id": "b", "label": "close your eyes"}, {"id": "c", "label": "wave a flashlight"}, {"id": "d", "label": "hide"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Morse code sends messages using patterns of:$tl$, $tl$[{"id": "a", "label": "colors of food"}, {"id": "b", "label": "long and short signals"}, {"id": "c", "label": "types of rocks"}, {"id": "d", "label": "smells"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$People send messages over a distance using light and ____. (one word)$tl$, null, $tl$sound$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A green traffic light means:$tl$, $tl$[{"id": "a", "label": "stop"}, {"id": "b", "label": "slow down forever"}, {"id": "c", "label": "turn around"}, {"id": "d", "label": "go"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A smoke alarm makes a loud sound to:$tl$, $tl$[{"id": "a", "label": "warn of danger"}, {"id": "b", "label": "play music"}, {"id": "c", "label": "tell jokes"}, {"id": "d", "label": "cook"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Waving your arms is a way to signal using:$tl$, $tl$[{"id": "a", "label": "smell"}, {"id": "b", "label": "taste"}, {"id": "c", "label": "touch only"}, {"id": "d", "label": "what people can see"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A red traffic light means:$tl$, $tl$[{"id": "a", "label": "go fast"}, {"id": "b", "label": "honk"}, {"id": "c", "label": "stop"}, {"id": "d", "label": "sing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$communicating-with-light-and-sound$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Plant Parts (1-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plant-parts$tl$, $tl$Plant Parts$tl$, $tl$Plants have roots, a stem, leaves, and flowers, and each part has a special job.$tl$, 1, $tl$1-LS1-1$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plant Parts$tl$, 1, $tl$[{"type": "explain", "title": "About: Plant Parts", "body": "Plants have roots, a stem, leaves, and flowers, and each part has a special job."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which plant part takes in water from the soil?  The correct answer is \"roots\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which plant part makes food using sunlight?", "choices": [{"id": "a", "label": "roots"}, {"id": "b", "label": "stem"}, {"id": "c", "label": "leaves"}, {"id": "d", "label": "seeds"}], "answer": "c", "explanation": "The correct answer is \"leaves\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which plant part takes in water from the soil?$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "flower"}, {"id": "c", "label": "leaf"}, {"id": "d", "label": "fruit"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which plant part makes food using sunlight?$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "stem"}, {"id": "c", "label": "leaves"}, {"id": "d", "label": "seeds"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which part holds the plant up and carries water?$tl$, $tl$[{"id": "a", "label": "the petals"}, {"id": "b", "label": "the stem"}, {"id": "c", "label": "the seeds"}, {"id": "d", "label": "the roots only"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which plant part often becomes a fruit with seeds?$tl$, $tl$[{"id": "a", "label": "the root"}, {"id": "b", "label": "the stem"}, {"id": "c", "label": "the leaf"}, {"id": "d", "label": "the flower"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which part of a carrot plant do we usually eat?$tl$, $tl$[{"id": "a", "label": "the flower"}, {"id": "b", "label": "the leaf"}, {"id": "c", "label": "the seed"}, {"id": "d", "label": "the root"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Most plants need water, air, and ____ to grow.$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "toys"}, {"id": "d", "label": "darkness"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$New plants can grow from:$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "seeds"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "cups"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Where are a plant's roots usually found?$tl$, $tl$[{"id": "a", "label": "in the sky"}, {"id": "b", "label": "under the ground"}, {"id": "c", "label": "on the flower"}, {"id": "d", "label": "in the fruit"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Leaves are often flat and wide to catch lots of:$tl$, $tl$[{"id": "a", "label": "water only"}, {"id": "b", "label": "sunlight"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is a part of a plant?$tl$, $tl$[{"id": "a", "label": "a leaf"}, {"id": "b", "label": "a wheel"}, {"id": "c", "label": "a button"}, {"id": "d", "label": "a battery"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Flowers can be colorful to attract:$tl$, $tl$[{"id": "a", "label": "bees and butterflies"}, {"id": "b", "label": "cars"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "clouds"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$If a plant gets no water for a long time, it will:$tl$, $tl$[{"id": "a", "label": "grow faster"}, {"id": "b", "label": "turn into an animal"}, {"id": "c", "label": "wilt or dry out"}, {"id": "d", "label": "fly away"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which part of the apple plant do we eat?$tl$, $tl$[{"id": "a", "label": "the root"}, {"id": "b", "label": "the stem"}, {"id": "c", "label": "the fruit"}, {"id": "d", "label": "the leaf"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A seed needs water and warmth to start to:$tl$, $tl$[{"id": "a", "label": "sleep forever"}, {"id": "b", "label": "grow (sprout)"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "sing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The green color in leaves helps them make:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "food"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$The plant part that takes in water from the soil is the ____. (one word)$tl$, null, $tl$roots$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which of these is NOT a plant part?$tl$, $tl$[{"id": "a", "label": "a leaf"}, {"id": "b", "label": "a root"}, {"id": "c", "label": "a stem"}, {"id": "d", "label": "a tire"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Plants make seeds so they can:$tl$, $tl$[{"id": "a", "label": "make noise"}, {"id": "b", "label": "grow new plants"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The stem of a plant carries water up to the:$tl$, $tl$[{"id": "a", "label": "leaves"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "clouds"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sunflowers turn to face the:$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon"}, {"id": "c", "label": "ground"}, {"id": "d", "label": "wall"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plant-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Animal Body Parts (1-LS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$animal-parts$tl$, $tl$Animal Body Parts$tl$, $tl$Animals have body parts like eyes, ears, legs, and wings that help them live.$tl$, 1, $tl$1-LS1-1$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Animal Body Parts$tl$, 1, $tl$[{"type": "explain", "title": "About: Animal Body Parts", "body": "Animals have body parts like eyes, ears, legs, and wings that help them live."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which body part do animals use to see?  The correct answer is \"eyes\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "An animal uses its ears to:", "choices": [{"id": "a", "label": "taste"}, {"id": "b", "label": "see color"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "hear"}], "answer": "d", "explanation": "The correct answer is \"hear\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which body part do animals use to see?$tl$, $tl$[{"id": "a", "label": "fins"}, {"id": "b", "label": "fur"}, {"id": "c", "label": "tail"}, {"id": "d", "label": "eyes"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$An animal uses its ears to:$tl$, $tl$[{"id": "a", "label": "taste"}, {"id": "b", "label": "see color"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "hear"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sharp claws and teeth help an animal to:$tl$, $tl$[{"id": "a", "label": "catch and eat food"}, {"id": "b", "label": "fly higher"}, {"id": "c", "label": "stay warm"}, {"id": "d", "label": "see at night"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Fur or feathers help an animal to:$tl$, $tl$[{"id": "a", "label": "run faster only"}, {"id": "b", "label": "taste food"}, {"id": "c", "label": "stay warm"}, {"id": "d", "label": "hear"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A fish uses its fins to:$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "fly"}, {"id": "c", "label": "dig"}, {"id": "d", "label": "hear"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A bird uses its wings to:$tl$, $tl$[{"id": "a", "label": "fly"}, {"id": "b", "label": "dig tunnels"}, {"id": "c", "label": "swim deep"}, {"id": "d", "label": "chew"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animals use their legs to:$tl$, $tl$[{"id": "a", "label": "see"}, {"id": "b", "label": "hear"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "move and walk or run"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A turtle's hard shell helps to:$tl$, $tl$[{"id": "a", "label": "protect it"}, {"id": "b", "label": "help it fly"}, {"id": "c", "label": "make sound"}, {"id": "d", "label": "see better"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$An elephant uses its trunk to:$tl$, $tl$[{"id": "a", "label": "fly"}, {"id": "b", "label": "grab food and water"}, {"id": "c", "label": "swim fast"}, {"id": "d", "label": "see in the dark"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which part does a dog use to smell?$tl$, $tl$[{"id": "a", "label": "its nose"}, {"id": "b", "label": "its tail"}, {"id": "c", "label": "its paw"}, {"id": "d", "label": "its ear"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Webbed feet help a duck to:$tl$, $tl$[{"id": "a", "label": "climb trees"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "dig"}, {"id": "d", "label": "fly higher"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Strong back legs help a kangaroo or frog to:$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "swim deep"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "hear"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Whiskers help a cat to:$tl$, $tl$[{"id": "a", "label": "fly"}, {"id": "b", "label": "taste"}, {"id": "c", "label": "glow"}, {"id": "d", "label": "feel things around it"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A giraffe's long neck helps it:$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "reach high leaves"}, {"id": "c", "label": "dig"}, {"id": "d", "label": "hide underground"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which body part helps a bird build a nest and eat?$tl$, $tl$[{"id": "a", "label": "its gills"}, {"id": "b", "label": "its fins"}, {"id": "c", "label": "its shell"}, {"id": "d", "label": "its beak"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Animals see with their ____. (one word)$tl$, null, $tl$eyes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$An animal's tail can help it:$tl$, $tl$[{"id": "a", "label": "balance or move"}, {"id": "b", "label": "read"}, {"id": "c", "label": "cook"}, {"id": "d", "label": "talk"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Gills help a fish to:$tl$, $tl$[{"id": "a", "label": "walk on land"}, {"id": "b", "label": "fly"}, {"id": "c", "label": "dig"}, {"id": "d", "label": "breathe underwater"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which animal part is used to chew food?$tl$, $tl$[{"id": "a", "label": "wings"}, {"id": "b", "label": "fins"}, {"id": "c", "label": "fur"}, {"id": "d", "label": "teeth"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Big ears help some animals:$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "glow"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "hear very well"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parts$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Parents & Babies (1-LS3-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$animal-parents-and-babies$tl$, $tl$Parents & Babies$tl$, $tl$Baby animals look a lot like their parents and need them for food and safety.$tl$, 1, $tl$1-LS3-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Parents & Babies$tl$, 1, $tl$[{"type": "explain", "title": "About: Parents & Babies", "body": "Baby animals look a lot like their parents and need them for food and safety."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Baby animals usually look like their:  The correct answer is \"parents\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A baby dog is called a:", "choices": [{"id": "a", "label": "calf"}, {"id": "b", "label": "chick"}, {"id": "c", "label": "kitten"}, {"id": "d", "label": "puppy"}], "answer": "d", "explanation": "The correct answer is \"puppy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Baby animals usually look like their:$tl$, $tl$[{"id": "a", "label": "food"}, {"id": "b", "label": "toys"}, {"id": "c", "label": "cars"}, {"id": "d", "label": "parents"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby dog is called a:$tl$, $tl$[{"id": "a", "label": "calf"}, {"id": "b", "label": "chick"}, {"id": "c", "label": "kitten"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby cat is called a:$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "cub"}, {"id": "c", "label": "kitten"}, {"id": "d", "label": "foal"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby cow is called a:$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "chick"}, {"id": "c", "label": "kitten"}, {"id": "d", "label": "calf"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby chicken is called a:$tl$, $tl$[{"id": "a", "label": "chick"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "calf"}, {"id": "d", "label": "cub"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Many baby animals need their parents for:$tl$, $tl$[{"id": "a", "label": "homework"}, {"id": "b", "label": "money"}, {"id": "c", "label": "cars"}, {"id": "d", "label": "food and safety"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby frog (tadpole) grows up to be a:$tl$, $tl$[{"id": "a", "label": "fish"}, {"id": "b", "label": "frog"}, {"id": "c", "label": "bird"}, {"id": "d", "label": "snake"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A puppy will grow up to be a:$tl$, $tl$[{"id": "a", "label": "cat"}, {"id": "b", "label": "cow"}, {"id": "c", "label": "dog"}, {"id": "d", "label": "duck"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Baby birds hatch from:$tl$, $tl$[{"id": "a", "label": "seeds"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "eggs"}, {"id": "d", "label": "cups"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A mother bird brings her babies:$tl$, $tl$[{"id": "a", "label": "toys"}, {"id": "b", "label": "books"}, {"id": "c", "label": "food"}, {"id": "d", "label": "shoes"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby horse is called a:$tl$, $tl$[{"id": "a", "label": "chick"}, {"id": "b", "label": "calf"}, {"id": "c", "label": "cub"}, {"id": "d", "label": "foal"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Kittens drink ____ from their mother when they are very young.$tl$, $tl$[{"id": "a", "label": "milk"}, {"id": "b", "label": "soda"}, {"id": "c", "label": "juice"}, {"id": "d", "label": "water only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Baby animals are usually ____ than their parents.$tl$, $tl$[{"id": "a", "label": "bigger"}, {"id": "b", "label": "smaller"}, {"id": "c", "label": "older"}, {"id": "d", "label": "heavier"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A duckling will grow up to be a:$tl$, $tl$[{"id": "a", "label": "dog"}, {"id": "b", "label": "duck"}, {"id": "c", "label": "cat"}, {"id": "d", "label": "cow"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A baby sheep is called a:$tl$, $tl$[{"id": "a", "label": "chick"}, {"id": "b", "label": "foal"}, {"id": "c", "label": "lamb"}, {"id": "d", "label": "cub"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$A baby dog is called a ____. (one word)$tl$, null, $tl$puppy$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animal parents often build a nest or den to:$tl$, $tl$[{"id": "a", "label": "go on vacation"}, {"id": "b", "label": "watch TV"}, {"id": "c", "label": "cook"}, {"id": "d", "label": "keep babies safe"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A caterpillar will change and grow into a:$tl$, $tl$[{"id": "a", "label": "butterfly"}, {"id": "b", "label": "bird"}, {"id": "c", "label": "fish"}, {"id": "d", "label": "frog"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Most baby mammals are fed:$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "milk from their mother"}, {"id": "c", "label": "grass only"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Because babies look like their parents, you can tell a kitten came from a:$tl$, $tl$[{"id": "a", "label": "dog"}, {"id": "b", "label": "cow"}, {"id": "c", "label": "duck"}, {"id": "d", "label": "cat"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animal-parents-and-babies$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] How Animals Survive (1-LS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$how-animals-survive$tl$, $tl$How Animals Survive$tl$, $tl$Animals need food, water, air, and shelter, and they have ways to stay safe.$tl$, 1, $tl$1-LS1-2$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: How Animals Survive$tl$, 1, $tl$[{"type": "explain", "title": "About: How Animals Survive", "body": "Animals need food, water, air, and shelter, and they have ways to stay safe."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Animals need food, water, air, and ____ to live.  The correct answer is \"shelter (a safe place)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A bird builds a nest to:", "choices": [{"id": "a", "label": "fly faster"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "keep its eggs and babies safe"}, {"id": "d", "label": "swim"}], "answer": "c", "explanation": "The correct answer is \"keep its eggs and babies safe\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animals need food, water, air, and ____ to live.$tl$, $tl$[{"id": "a", "label": "toys"}, {"id": "b", "label": "shelter (a safe place)"}, {"id": "c", "label": "homework"}, {"id": "d", "label": "money"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A bird builds a nest to:$tl$, $tl$[{"id": "a", "label": "fly faster"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "keep its eggs and babies safe"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Many animals hide or use camouflage to:$tl$, $tl$[{"id": "a", "label": "glow"}, {"id": "b", "label": "fly to space"}, {"id": "c", "label": "stay safe from predators"}, {"id": "d", "label": "read"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In winter, some animals grow thicker fur to:$tl$, $tl$[{"id": "a", "label": "swim faster"}, {"id": "b", "label": "fly"}, {"id": "c", "label": "stay warm"}, {"id": "d", "label": "sing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Bees and ants live together in groups to help each other:$tl$, $tl$[{"id": "a", "label": "watch TV"}, {"id": "b", "label": "play tag"}, {"id": "c", "label": "sleep all year"}, {"id": "d", "label": "survive"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A turtle hides in its shell when it feels:$tl$, $tl$[{"id": "a", "label": "scared or in danger"}, {"id": "b", "label": "happy"}, {"id": "c", "label": "hungry only"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Some birds fly to warmer places in winter. This is called:$tl$, $tl$[{"id": "a", "label": "hibernation"}, {"id": "b", "label": "camouflage"}, {"id": "c", "label": "swimming"}, {"id": "d", "label": "migration"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A bear sleeps through much of winter. This is called:$tl$, $tl$[{"id": "a", "label": "migration"}, {"id": "b", "label": "hibernation"}, {"id": "c", "label": "camouflage"}, {"id": "d", "label": "flying"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animals drink ____ to stay alive.$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "soda"}, {"id": "c", "label": "milkshakes"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A rabbit's strong back legs help it:$tl$, $tl$[{"id": "a", "label": "run away from danger"}, {"id": "b", "label": "fly"}, {"id": "c", "label": "swim deep"}, {"id": "d", "label": "dig gold"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which helps an animal find food?$tl$, $tl$[{"id": "a", "label": "wheels"}, {"id": "b", "label": "good senses like smell and sight"}, {"id": "c", "label": "a phone"}, {"id": "d", "label": "a backpack"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A mother animal protects its babies from:$tl$, $tl$[{"id": "a", "label": "sunshine"}, {"id": "b", "label": "danger"}, {"id": "c", "label": "fresh air"}, {"id": "d", "label": "grass"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Spots and stripes can help an animal:$tl$, $tl$[{"id": "a", "label": "glow"}, {"id": "b", "label": "blend in and hide"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "read"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animals get their energy from:$tl$, $tl$[{"id": "a", "label": "food"}, {"id": "b", "label": "sleep only"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "sunlight directly like plants"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A beaver builds a dam and lodge for:$tl$, $tl$[{"id": "a", "label": "decoration"}, {"id": "b", "label": "racing"}, {"id": "c", "label": "cooking"}, {"id": "d", "label": "shelter and safety"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$A safe place where an animal lives is called its ____ (home). (one word)$tl$, null, $tl$shelter$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$When it is very hot, animals look for:$tl$, $tl$[{"id": "a", "label": "fire"}, {"id": "b", "label": "shade and water"}, {"id": "c", "label": "ice cream"}, {"id": "d", "label": "blankets"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A herd of animals stays together to:$tl$, $tl$[{"id": "a", "label": "stay safer from predators"}, {"id": "b", "label": "get lost"}, {"id": "c", "label": "fight always"}, {"id": "d", "label": "sleep less"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Sharp eyesight helps a hawk to:$tl$, $tl$[{"id": "a", "label": "stay warm"}, {"id": "b", "label": "spot food from high up"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "dig"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Animals that cannot find food and water will:$tl$, $tl$[{"id": "a", "label": "grow wings"}, {"id": "b", "label": "turn into plants"}, {"id": "c", "label": "live forever"}, {"id": "d", "label": "not survive"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$how-animals-survive$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Day & Night Sky (1-ESS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$day-and-night-sky$tl$, $tl$Day & Night Sky$tl$, $tl$In the day we see the Sun; at night we see the Moon and stars, in a daily pattern.$tl$, 1, $tl$1-ESS1-1$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Day & Night Sky$tl$, 1, $tl$[{"type": "explain", "title": "About: Day & Night Sky", "body": "In the day we see the Sun; at night we see the Moon and stars, in a daily pattern."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which do we see in the sky during the DAY?  The correct answer is \"the Sun\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which do we usually see in the sky at NIGHT?", "choices": [{"id": "a", "label": "the Sun"}, {"id": "b", "label": "a rainbow"}, {"id": "c", "label": "the Moon and stars"}, {"id": "d", "label": "a kite"}], "answer": "c", "explanation": "The correct answer is \"the Moon and stars\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which do we see in the sky during the DAY?$tl$, $tl$[{"id": "a", "label": "the Moon"}, {"id": "b", "label": "stars"}, {"id": "c", "label": "fireworks always"}, {"id": "d", "label": "the Sun"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which do we usually see in the sky at NIGHT?$tl$, $tl$[{"id": "a", "label": "the Sun"}, {"id": "b", "label": "a rainbow"}, {"id": "c", "label": "the Moon and stars"}, {"id": "d", "label": "a kite"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The Sun gives Earth:$tl$, $tl$[{"id": "a", "label": "snow"}, {"id": "b", "label": "darkness"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "light and warmth"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Stars look tiny because they are:$tl$, $tl$[{"id": "a", "label": "very small rocks"}, {"id": "b", "label": "made of paper"}, {"id": "c", "label": "very far away"}, {"id": "d", "label": "close to us"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Day and night happen in a:$tl$, $tl$[{"id": "a", "label": "repeating pattern"}, {"id": "b", "label": "random way"}, {"id": "c", "label": "one-time event"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$When it is daytime, the sky is usually:$tl$, $tl$[{"id": "a", "label": "bright"}, {"id": "b", "label": "dark"}, {"id": "c", "label": "full of stars"}, {"id": "d", "label": "green"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$When it is nighttime, the sky is usually:$tl$, $tl$[{"id": "a", "label": "bright and sunny"}, {"id": "b", "label": "green"}, {"id": "c", "label": "yellow"}, {"id": "d", "label": "dark"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The Moon can look like it changes shape. These are called Moon:$tl$, $tl$[{"id": "a", "label": "sounds"}, {"id": "b", "label": "colors"}, {"id": "c", "label": "sizes of rocks"}, {"id": "d", "label": "phases"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is the brightest object in our daytime sky?$tl$, $tl$[{"id": "a", "label": "the Sun"}, {"id": "b", "label": "the Moon"}, {"id": "c", "label": "a star far away"}, {"id": "d", "label": "a streetlight"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$We get day and night because the Earth:$tl$, $tl$[{"id": "a", "label": "stops moving"}, {"id": "b", "label": "grows"}, {"id": "c", "label": "melts"}, {"id": "d", "label": "spins (rotates)"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$You can see thousands of stars best when the sky is:$tl$, $tl$[{"id": "a", "label": "bright at noon"}, {"id": "b", "label": "cloudy and sunny"}, {"id": "c", "label": "dark at night"}, {"id": "d", "label": "green"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The Moon does not make its own light; it reflects light from the:$tl$, $tl$[{"id": "a", "label": "stars"}, {"id": "b", "label": "streetlights"}, {"id": "c", "label": "Earth"}, {"id": "d", "label": "Sun"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which comes out as the Sun goes down?$tl$, $tl$[{"id": "a", "label": "the Sun again"}, {"id": "b", "label": "a rainbow"}, {"id": "c", "label": "the Moon and stars"}, {"id": "d", "label": "snow always"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$We usually sleep at:$tl$, $tl$[{"id": "a", "label": "noon"}, {"id": "b", "label": "morning"}, {"id": "c", "label": "lunchtime"}, {"id": "d", "label": "night"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which pattern repeats every single day?$tl$, $tl$[{"id": "a", "label": "your birthday"}, {"id": "b", "label": "a holiday"}, {"id": "c", "label": "a vacation"}, {"id": "d", "label": "day and night"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$During the day, our light comes from the ____. (one word)$tl$, null, $tl$Sun$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A telescope helps us see faraway objects in the sky like:$tl$, $tl$[{"id": "a", "label": "fish"}, {"id": "b", "label": "ants"}, {"id": "c", "label": "stars and the Moon"}, {"id": "d", "label": "grass"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is true?$tl$, $tl$[{"id": "a", "label": "The Sun comes out at night."}, {"id": "b", "label": "Stars shine brightest at noon."}, {"id": "c", "label": "The Sun appears in the day; the Moon and stars often appear at night."}, {"id": "d", "label": "The Moon is only seen at lunchtime."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Clouds in the daytime can block the:$tl$, $tl$[{"id": "a", "label": "Sun"}, {"id": "b", "label": "Moon at noon"}, {"id": "c", "label": "stars at noon"}, {"id": "d", "label": "ground"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The Sun seems to 'rise' in the morning and 'set' in the:$tl$, $tl$[{"id": "a", "label": "middle of the night"}, {"id": "b", "label": "afternoon nap"}, {"id": "c", "label": "winter"}, {"id": "d", "label": "evening"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night-sky$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Sun & Seasons (1-ESS1-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sun-and-seasons$tl$, $tl$Sun & Seasons$tl$, $tl$The seasons change in a pattern, with more daylight in summer and less in winter.$tl$, 1, $tl$1-ESS1-2$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sun & Seasons$tl$, 1, $tl$[{"type": "explain", "title": "About: Sun & Seasons", "body": "The seasons change in a pattern, with more daylight in summer and less in winter."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which season is usually the coldest?  The correct answer is \"winter\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which season is usually the hottest?", "choices": [{"id": "a", "label": "summer"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "fall"}, {"id": "d", "label": "spring"}], "answer": "a", "explanation": "The correct answer is \"summer\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which season is usually the coldest?$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "spring"}, {"id": "c", "label": "fall"}, {"id": "d", "label": "winter"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which season is usually the hottest?$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "fall"}, {"id": "d", "label": "spring"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In which season do many flowers bloom and trees grow new leaves?$tl$, $tl$[{"id": "a", "label": "spring"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "summer"}, {"id": "d", "label": "fall"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In which season do leaves often turn colors and fall?$tl$, $tl$[{"id": "a", "label": "fall (autumn)"}, {"id": "b", "label": "spring"}, {"id": "c", "label": "summer"}, {"id": "d", "label": "winter"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In summer there are more hours of:$tl$, $tl$[{"id": "a", "label": "daylight"}, {"id": "b", "label": "darkness"}, {"id": "c", "label": "snow"}, {"id": "d", "label": "rain only"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In winter there are fewer hours of:$tl$, $tl$[{"id": "a", "label": "daylight"}, {"id": "b", "label": "nighttime"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "clouds"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The Sun helps make the weather warm in:$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "winter only"}, {"id": "c", "label": "the middle of the night"}, {"id": "d", "label": "caves"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which clothing fits a snowy winter day?$tl$, $tl$[{"id": "a", "label": "a swimsuit"}, {"id": "b", "label": "sandals"}, {"id": "c", "label": "a warm coat"}, {"id": "d", "label": "shorts only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which clothing fits a hot summer day?$tl$, $tl$[{"id": "a", "label": "a heavy coat"}, {"id": "b", "label": "a t-shirt and shorts"}, {"id": "c", "label": "mittens"}, {"id": "d", "label": "a scarf"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$The order of the seasons is:$tl$, $tl$[{"id": "a", "label": "winter, summer, winter, summer"}, {"id": "b", "label": "spring, summer, fall, winter"}, {"id": "c", "label": "fall, fall, fall, fall"}, {"id": "d", "label": "one season only"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Days feel longer (more sunlight) in:$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "midnight"}, {"id": "d", "label": "caves"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which season comes right after winter?$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "fall"}, {"id": "c", "label": "spring"}, {"id": "d", "label": "winter again"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$We see more daylight when the Sun is up:$tl$, $tl$[{"id": "a", "label": "longer"}, {"id": "b", "label": "never"}, {"id": "c", "label": "only at night"}, {"id": "d", "label": "for one minute"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Building a snowman is something you might do in:$tl$, $tl$[{"id": "a", "label": "summer"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "a hot desert day"}, {"id": "d", "label": "a pool"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Swimming outside is most common in:$tl$, $tl$[{"id": "a", "label": "winter"}, {"id": "b", "label": "a snowstorm"}, {"id": "c", "label": "summer"}, {"id": "d", "label": "the night only"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$The coldest season of the year is ____. (one word)$tl$, null, $tl$winter$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Seasons happen in a pattern that repeats every:$tl$, $tl$[{"id": "a", "label": "hour"}, {"id": "b", "label": "year"}, {"id": "c", "label": "minute"}, {"id": "d", "label": "second"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$In fall, farmers often:$tl$, $tl$[{"id": "a", "label": "plant in the snow"}, {"id": "b", "label": "go swimming in ice"}, {"id": "c", "label": "do nothing ever"}, {"id": "d", "label": "harvest crops"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which season comes right after summer?$tl$, $tl$[{"id": "a", "label": "spring"}, {"id": "b", "label": "winter"}, {"id": "c", "label": "summer again"}, {"id": "d", "label": "fall"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$More sunlight and warmth in summer help plants to:$tl$, $tl$[{"id": "a", "label": "freeze"}, {"id": "b", "label": "stop growing forever"}, {"id": "c", "label": "turn to rock"}, {"id": "d", "label": "grow"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$sun-and-seasons$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Weather (K-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$weather-patterns$tl$, $tl$Weather$tl$, $tl$Weather can be sunny, rainy, snowy, windy, or stormy, and it can change day to day.$tl$, 1, $tl$K-ESS2-1$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Weather$tl$, 1, $tl$[{"type": "explain", "title": "About: Weather", "body": "Weather can be sunny, rainy, snowy, windy, or stormy, and it can change day to day."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the weather like on a sunny day?  The correct answer is \"bright and clear\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which tool measures how hot or cold it is?", "choices": [{"id": "a", "label": "a ruler"}, {"id": "b", "label": "a clock"}, {"id": "c", "label": "a spoon"}, {"id": "d", "label": "a thermometer"}], "answer": "d", "explanation": "The correct answer is \"a thermometer\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the weather like on a sunny day?$tl$, $tl$[{"id": "a", "label": "dark and rainy"}, {"id": "b", "label": "snowy"}, {"id": "c", "label": "foggy"}, {"id": "d", "label": "bright and clear"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which tool measures how hot or cold it is?$tl$, $tl$[{"id": "a", "label": "a ruler"}, {"id": "b", "label": "a clock"}, {"id": "c", "label": "a spoon"}, {"id": "d", "label": "a thermometer"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Rain, snow, and hail all fall from:$tl$, $tl$[{"id": "a", "label": "the ground"}, {"id": "b", "label": "clouds"}, {"id": "c", "label": "trees"}, {"id": "d", "label": "rivers"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$On a windy day, you might see leaves and flags:$tl$, $tl$[{"id": "a", "label": "frozen still"}, {"id": "b", "label": "moving"}, {"id": "c", "label": "melting"}, {"id": "d", "label": "glowing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which weather would make you wear a raincoat?$tl$, $tl$[{"id": "a", "label": "sunny"}, {"id": "b", "label": "calm"}, {"id": "c", "label": "clear"}, {"id": "d", "label": "rainy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Snow falls when the weather is very:$tl$, $tl$[{"id": "a", "label": "hot"}, {"id": "b", "label": "cold"}, {"id": "c", "label": "windy only"}, {"id": "d", "label": "sunny"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$We can look at the sky to help us:$tl$, $tl$[{"id": "a", "label": "tell time exactly"}, {"id": "b", "label": "do math"}, {"id": "c", "label": "cook"}, {"id": "d", "label": "guess the weather"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is a kind of weather?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "blue"}, {"id": "d", "label": "loud music"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$On a hot sunny day, it is a good idea to drink:$tl$, $tl$[{"id": "a", "label": "hot soup only"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "sand"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Dark, heavy clouds often mean it might:$tl$, $tl$[{"id": "a", "label": "snow in summer always"}, {"id": "b", "label": "be perfectly sunny"}, {"id": "c", "label": "get colder forever"}, {"id": "d", "label": "rain"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A rainbow sometimes appears after:$tl$, $tl$[{"id": "a", "label": "a sunny dry week"}, {"id": "b", "label": "a snowstorm"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "an earthquake"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which tool shows which way the wind blows?$tl$, $tl$[{"id": "a", "label": "a thermometer"}, {"id": "b", "label": "a wind vane"}, {"id": "c", "label": "a ruler"}, {"id": "d", "label": "a scale"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Weather can be different from:$tl$, $tl$[{"id": "a", "label": "day to day"}, {"id": "b", "label": "never"}, {"id": "c", "label": "only once a year"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which clothing fits a rainy day?$tl$, $tl$[{"id": "a", "label": "sunglasses only"}, {"id": "b", "label": "a swimsuit"}, {"id": "c", "label": "sandals"}, {"id": "d", "label": "boots and an umbrella"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$On a foggy day it is hard to:$tl$, $tl$[{"id": "a", "label": "hear"}, {"id": "b", "label": "see far away"}, {"id": "c", "label": "taste"}, {"id": "d", "label": "smell"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Water that falls from clouds as drops is called ____. (one word)$tl$, null, $tl$rain$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$A very strong storm with thunder and lightning is a:$tl$, $tl$[{"id": "a", "label": "sunny day"}, {"id": "b", "label": "thunderstorm"}, {"id": "c", "label": "light breeze"}, {"id": "d", "label": "clear night"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which is the best clothing for a cold, snowy day?$tl$, $tl$[{"id": "a", "label": "a coat, hat, and gloves"}, {"id": "b", "label": "shorts and sandals"}, {"id": "c", "label": "a swimsuit"}, {"id": "d", "label": "a t-shirt only"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$We can prepare for the day by checking the:$tl$, $tl$[{"id": "a", "label": "dictionary"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "math book"}, {"id": "d", "label": "clock only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Puddles on the ground usually mean it just:$tl$, $tl$[{"id": "a", "label": "snowed in summer"}, {"id": "b", "label": "was very dry"}, {"id": "c", "label": "was windy only"}, {"id": "d", "label": "rained"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-patterns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Main Topic (RI.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$main-topic$tl$, $tl$Main Topic$tl$, $tl$The main topic is what a story or text is mostly about.$tl$, 1, $tl$RI.1.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Main Topic$tl$, 1, $tl$[{"type": "explain", "title": "About: Main Topic", "body": "The main topic is what a story or text is mostly about."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"My dog can run, jump, and catch a ball.\" This is mostly about:  The correct answer is \"what my dog can do\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Bees make honey. They visit many flowers.\" This is mostly about:", "choices": [{"id": "a", "label": "cars"}, {"id": "b", "label": "bees"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "shoes"}], "answer": "b", "explanation": "The correct answer is \"bees\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "My dog can run, jump, and catch a ball." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a red ball"}, {"id": "b", "label": "what my dog can do"}, {"id": "c", "label": "a big tree"}, {"id": "d", "label": "my school"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Bees make honey. They visit many flowers." This is mostly about:$tl$, $tl$[{"id": "a", "label": "cars"}, {"id": "b", "label": "bees"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "shoes"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "I like to swim. The water is cool and fun." This is mostly about:$tl$, $tl$[{"id": "a", "label": "swimming"}, {"id": "b", "label": "cooking"}, {"id": "c", "label": "reading"}, {"id": "d", "label": "sleeping"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The sun is hot. It gives us light in the day." This is mostly about:$tl$, $tl$[{"id": "a", "label": "the moon"}, {"id": "b", "label": "the sun"}, {"id": "c", "label": "a cat"}, {"id": "d", "label": "a hat"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We planted seeds. We water them every day." This is mostly about:$tl$, $tl$[{"id": "a", "label": "growing plants"}, {"id": "b", "label": "a car ride"}, {"id": "c", "label": "a party"}, {"id": "d", "label": "the beach"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Cats like to nap. They sleep a lot in the day." This is mostly about:$tl$, $tl$[{"id": "a", "label": "dogs running"}, {"id": "b", "label": "a big city"}, {"id": "c", "label": "cats sleeping"}, {"id": "d", "label": "a boat"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Rain helps plants grow. It fills up rivers too." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a toy"}, {"id": "b", "label": "a song"}, {"id": "c", "label": "how rain helps"}, {"id": "d", "label": "a shoe"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "I brush my teeth in the morning and at night." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a bike"}, {"id": "b", "label": "a kite"}, {"id": "c", "label": "a frog"}, {"id": "d", "label": "brushing teeth"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Birds build nests with twigs and grass." This is mostly about:$tl$, $tl$[{"id": "a", "label": "fish in the sea"}, {"id": "b", "label": "a red car"}, {"id": "c", "label": "birds making nests"}, {"id": "d", "label": "a snowman"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At the farm we saw cows, pigs, and hens." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a city street"}, {"id": "b", "label": "a spaceship"}, {"id": "c", "label": "a phone"}, {"id": "d", "label": "animals at the farm"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "My mom and I baked cookies. They smell so good." This is mostly about:$tl$, $tl$[{"id": "a", "label": "riding a bus"}, {"id": "b", "label": "a math test"}, {"id": "c", "label": "baking cookies"}, {"id": "d", "label": "a rainy day"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Frogs can hop and swim. They live near ponds." This is mostly about:$tl$, $tl$[{"id": "a", "label": "trucks"}, {"id": "b", "label": "stars"}, {"id": "c", "label": "books"}, {"id": "d", "label": "frogs"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We use a map to find our way." This is mostly about:$tl$, $tl$[{"id": "a", "label": "eating lunch"}, {"id": "b", "label": "using a map"}, {"id": "c", "label": "a pet"}, {"id": "d", "label": "a song"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Apples are sweet and crunchy. I eat one each day." This is mostly about:$tl$, $tl$[{"id": "a", "label": "soccer"}, {"id": "b", "label": "the moon"}, {"id": "c", "label": "apples"}, {"id": "d", "label": "a chair"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The fire truck is red and very loud." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a quiet library"}, {"id": "b", "label": "a soft pillow"}, {"id": "c", "label": "a fire truck"}, {"id": "d", "label": "a slow turtle"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "Ducks swim in the pond. They like the water." This story is mostly about ____. (one word)$tl$, null, $tl$ducks$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In winter it snows. We wear warm coats." This is mostly about:$tl$, $tl$[{"id": "a", "label": "winter"}, {"id": "b", "label": "summer"}, {"id": "c", "label": "a beach"}, {"id": "d", "label": "a desert"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "My sister plays the drums. They are loud!" This is mostly about:$tl$, $tl$[{"id": "a", "label": "my sister playing drums"}, {"id": "b", "label": "a quiet nap"}, {"id": "c", "label": "a fish"}, {"id": "d", "label": "a tree"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Spiders spin webs to catch bugs." This is mostly about:$tl$, $tl$[{"id": "a", "label": "a car wash"}, {"id": "b", "label": "a cake"}, {"id": "c", "label": "spiders and webs"}, {"id": "d", "label": "the sky"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We go to the park to play and run." This is mostly about:$tl$, $tl$[{"id": "a", "label": "playing at the park"}, {"id": "b", "label": "doing dishes"}, {"id": "c", "label": "a long nap"}, {"id": "d", "label": "a spelling test"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-topic$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Key Details (RI.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$key-details$tl$, $tl$Key Details$tl$, $tl$Key details are the small facts in a text that answer who, what, and where.$tl$, 1, $tl$RI.1.1$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Key Details$tl$, 1, $tl$[{"type": "explain", "title": "About: Key Details", "body": "Key details are the small facts in a text that answer who, what, and where."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Sam has a blue kite.\" What color is the kite?  The correct answer is \"blue\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The cat sat on the soft mat.\" Where did the cat sit?", "choices": [{"id": "a", "label": "on the mat"}, {"id": "b", "label": "on a chair"}, {"id": "c", "label": "in a tree"}, {"id": "d", "label": "on a bed"}], "answer": "a", "explanation": "The correct answer is \"on the mat\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Sam has a blue kite." What color is the kite?$tl$, $tl$[{"id": "a", "label": "red"}, {"id": "b", "label": "blue"}, {"id": "c", "label": "green"}, {"id": "d", "label": "yellow"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The cat sat on the soft mat." Where did the cat sit?$tl$, $tl$[{"id": "a", "label": "on the mat"}, {"id": "b", "label": "on a chair"}, {"id": "c", "label": "in a tree"}, {"id": "d", "label": "on a bed"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We had grapes for snack." What did we eat?$tl$, $tl$[{"id": "a", "label": "pizza"}, {"id": "b", "label": "grapes"}, {"id": "c", "label": "soup"}, {"id": "d", "label": "cake"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Mia ran fast to the bus." How did Mia move?$tl$, $tl$[{"id": "a", "label": "slowly"}, {"id": "b", "label": "fast"}, {"id": "c", "label": "backward"}, {"id": "d", "label": "by flying"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Dad read three books." How many books?$tl$, $tl$[{"id": "a", "label": "one"}, {"id": "b", "label": "five"}, {"id": "c", "label": "ten"}, {"id": "d", "label": "three"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The dog hid under the bed." Where did the dog hide?$tl$, $tl$[{"id": "a", "label": "in a tree"}, {"id": "b", "label": "under the bed"}, {"id": "c", "label": "on the roof"}, {"id": "d", "label": "in a box"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It was rainy, so we stayed inside." Why did they stay inside?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "it was rainy"}, {"id": "c", "label": "it was night"}, {"id": "d", "label": "school was closed"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Ben gave two apples to Liz." Who got the apples?$tl$, $tl$[{"id": "a", "label": "Ben"}, {"id": "b", "label": "Mom"}, {"id": "c", "label": "the dog"}, {"id": "d", "label": "Liz"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The frog is green and small." What color is the frog?$tl$, $tl$[{"id": "a", "label": "green"}, {"id": "b", "label": "blue"}, {"id": "c", "label": "red"}, {"id": "d", "label": "brown"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We swim in summer." When do they swim?$tl$, $tl$[{"id": "a", "label": "in winter"}, {"id": "b", "label": "at midnight"}, {"id": "c", "label": "in summer"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Ann planted a sunflower." What did Ann plant?$tl$, $tl$[{"id": "a", "label": "a tree"}, {"id": "b", "label": "a bean"}, {"id": "c", "label": "grass"}, {"id": "d", "label": "a sunflower"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The bus is big and yellow." What color is the bus?$tl$, $tl$[{"id": "a", "label": "blue"}, {"id": "b", "label": "green"}, {"id": "c", "label": "yellow"}, {"id": "d", "label": "pink"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Leo has five red marbles." How many marbles?$tl$, $tl$[{"id": "a", "label": "two"}, {"id": "b", "label": "ten"}, {"id": "c", "label": "one"}, {"id": "d", "label": "five"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The owl sleeps in the day." When does the owl sleep?$tl$, $tl$[{"id": "a", "label": "in the day"}, {"id": "b", "label": "at night"}, {"id": "c", "label": "at noon only"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We saw a star in the dark sky." Where was the star?$tl$, $tl$[{"id": "a", "label": "in the sky"}, {"id": "b", "label": "in the sea"}, {"id": "c", "label": "under a rock"}, {"id": "d", "label": "in a box"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "Tom's hat is red." What color is Tom's hat? (one word)$tl$, null, $tl$red$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The baby drinks milk." What does the baby drink?$tl$, $tl$[{"id": "a", "label": "juice"}, {"id": "b", "label": "soda"}, {"id": "c", "label": "tea"}, {"id": "d", "label": "milk"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We walked to the park." Where did they go?$tl$, $tl$[{"id": "a", "label": "the store"}, {"id": "b", "label": "school"}, {"id": "c", "label": "the zoo"}, {"id": "d", "label": "the park"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Pia has a pet fish named Bo." What is the fish's name?$tl$, $tl$[{"id": "a", "label": "Pia"}, {"id": "b", "label": "Max"}, {"id": "c", "label": "Rex"}, {"id": "d", "label": "Bo"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The cake has six candles." How many candles?$tl$, $tl$[{"id": "a", "label": "three"}, {"id": "b", "label": "ten"}, {"id": "c", "label": "six"}, {"id": "d", "label": "one"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Retelling & Order (RL.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$retelling-stories$tl$, $tl$Retelling & Order$tl$, $tl$Retelling means saying what happened first, next, and last, in order.$tl$, 1, $tl$RL.1.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Retelling & Order$tl$, 1, $tl$[{"type": "explain", "title": "About: Retelling & Order", "body": "Retelling means saying what happened first, next, and last, in order."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"First Ana woke up. Then she ate. Last she went to school.\" What did Ana do FIRST?  The correct answer is \"woke up\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The seed grew. Then it had leaves. Last it bloomed.\" What happened LAST?", "choices": [{"id": "a", "label": "it bloomed"}, {"id": "b", "label": "the seed grew"}, {"id": "c", "label": "it had leaves"}, {"id": "d", "label": "it was picked"}], "answer": "a", "explanation": "The correct answer is \"it bloomed\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "First Ana woke up. Then she ate. Last she went to school." What did Ana do FIRST?$tl$, $tl$[{"id": "a", "label": "ate"}, {"id": "b", "label": "woke up"}, {"id": "c", "label": "went to school"}, {"id": "d", "label": "slept"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The seed grew. Then it had leaves. Last it bloomed." What happened LAST?$tl$, $tl$[{"id": "a", "label": "it bloomed"}, {"id": "b", "label": "the seed grew"}, {"id": "c", "label": "it had leaves"}, {"id": "d", "label": "it was picked"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We packed a bag. Then we drove. Last we played." What happened SECOND?$tl$, $tl$[{"id": "a", "label": "we drove"}, {"id": "b", "label": "we packed"}, {"id": "c", "label": "we played"}, {"id": "d", "label": "we slept"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He woke up, brushed his teeth, then ate." What did he do right BEFORE eating?$tl$, $tl$[{"id": "a", "label": "went to bed"}, {"id": "b", "label": "ran outside"}, {"id": "c", "label": "brushed his teeth"}, {"id": "d", "label": "read a book"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "First it rained. Then the sun came out. Last we saw a rainbow." What came FIRST?$tl$, $tl$[{"id": "a", "label": "it rained"}, {"id": "b", "label": "the rainbow"}, {"id": "c", "label": "the sun set"}, {"id": "d", "label": "the snow"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Mia drew a cat, colored it, and hung it up." What did Mia do LAST?$tl$, $tl$[{"id": "a", "label": "drew a cat"}, {"id": "b", "label": "colored it"}, {"id": "c", "label": "erased it"}, {"id": "d", "label": "hung it up"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We mixed, poured, and baked the cake." What is the LAST step?$tl$, $tl$[{"id": "a", "label": "mixed"}, {"id": "b", "label": "baked the cake"}, {"id": "c", "label": "poured"}, {"id": "d", "label": "ate"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The bell rang. The kids lined up. Then they went in." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the bell rang"}, {"id": "b", "label": "kids went in"}, {"id": "c", "label": "kids lined up"}, {"id": "d", "label": "class ended"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "She tied her shoes, then ran outside." What did she do BEFORE running?$tl$, $tl$[{"id": "a", "label": "sat down"}, {"id": "b", "label": "tied her shoes"}, {"id": "c", "label": "ate lunch"}, {"id": "d", "label": "took a nap"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "First fill the cup, then drink." What do you do first?$tl$, $tl$[{"id": "a", "label": "drink"}, {"id": "b", "label": "fill the cup"}, {"id": "c", "label": "wash it"}, {"id": "d", "label": "pour it out"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The dog barked, then the cat ran." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the cat ran"}, {"id": "b", "label": "the bird flew"}, {"id": "c", "label": "the sun set"}, {"id": "d", "label": "the dog barked"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We read the page, turned it, and read more." What did we do after reading the page?$tl$, $tl$[{"id": "a", "label": "turned it"}, {"id": "b", "label": "closed the book"}, {"id": "c", "label": "slept"}, {"id": "d", "label": "ate"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He planted the seed, then watered it." What did he do LAST?$tl$, $tl$[{"id": "a", "label": "watered it"}, {"id": "b", "label": "planted the seed"}, {"id": "c", "label": "picked a flower"}, {"id": "d", "label": "dug a hole"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Sun up, play all day, sun down, sleep." What do we do when the sun goes down?$tl$, $tl$[{"id": "a", "label": "sleep"}, {"id": "b", "label": "play"}, {"id": "c", "label": "wake up"}, {"id": "d", "label": "eat breakfast"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "She put on socks, then shoes." What did she put on first?$tl$, $tl$[{"id": "a", "label": "shoes"}, {"id": "b", "label": "a hat"}, {"id": "c", "label": "socks"}, {"id": "d", "label": "gloves"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "First we eat, then we play." What do we do first? (one word)$tl$, null, $tl$eat$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The egg hatched. A chick came out. It grew into a hen." What came out of the egg?$tl$, $tl$[{"id": "a", "label": "a chick"}, {"id": "b", "label": "a hen"}, {"id": "c", "label": "a duck"}, {"id": "d", "label": "a frog"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We climbed up, then slid down." What did we do after climbing up?$tl$, $tl$[{"id": "a", "label": "climbed more"}, {"id": "b", "label": "slid down"}, {"id": "c", "label": "went home"}, {"id": "d", "label": "ate"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He washed the cup, dried it, put it away." What is the LAST step?$tl$, $tl$[{"id": "a", "label": "washed it"}, {"id": "b", "label": "dried it"}, {"id": "c", "label": "put it away"}, {"id": "d", "label": "filled it"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Morning: get up. Night: go to bed." What do we do at night?$tl$, $tl$[{"id": "a", "label": "get up"}, {"id": "b", "label": "go to bed"}, {"id": "c", "label": "eat breakfast"}, {"id": "d", "label": "go to school"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$retelling-stories$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Characters (RL.1.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$characters$tl$, $tl$Characters$tl$, $tl$Characters are the people or animals a story is about.$tl$, 1, $tl$RL.1.3$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Characters$tl$, 1, $tl$[{"type": "explain", "title": "About: Characters", "body": "Characters are the people or animals a story is about."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Kind Mia helped the lost puppy.\" Who is the character?  The correct answer is \"Mia\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Brave Leo climbed the tall hill.\" What word describes Leo?", "choices": [{"id": "a", "label": "lazy"}, {"id": "b", "label": "mean"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "sleepy"}], "answer": "c", "explanation": "The correct answer is \"brave\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Kind Mia helped the lost puppy." Who is the character?$tl$, $tl$[{"id": "a", "label": "the rain"}, {"id": "b", "label": "a tree"}, {"id": "c", "label": "Mia"}, {"id": "d", "label": "a car"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Brave Leo climbed the tall hill." What word describes Leo?$tl$, $tl$[{"id": "a", "label": "lazy"}, {"id": "b", "label": "mean"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Grumpy Mr. Fox frowned all day." How does Mr. Fox feel?$tl$, $tl$[{"id": "a", "label": "grumpy"}, {"id": "b", "label": "happy"}, {"id": "c", "label": "calm"}, {"id": "d", "label": "silly"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Happy Ana danced and smiled." How does Ana feel?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "sad"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "scared"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The puppy named Bo wagged his tail." Who is the character?$tl$, $tl$[{"id": "a", "label": "a tree"}, {"id": "b", "label": "Bo the puppy"}, {"id": "c", "label": "the sky"}, {"id": "d", "label": "a rock"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Shy Sam hid behind his mom." What word describes Sam?$tl$, $tl$[{"id": "a", "label": "loud"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "silly"}, {"id": "d", "label": "shy"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Helpful Liz carried the bags." What word describes Liz?$tl$, $tl$[{"id": "a", "label": "lazy"}, {"id": "b", "label": "helpful"}, {"id": "c", "label": "rude"}, {"id": "d", "label": "mean"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The clever fox found a way out." Who is the character?$tl$, $tl$[{"id": "a", "label": "the fox"}, {"id": "b", "label": "the door"}, {"id": "c", "label": "the wall"}, {"id": "d", "label": "the road"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Sad Tom missed his friend." How does Tom feel?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "excited"}, {"id": "c", "label": "silly"}, {"id": "d", "label": "sad"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Curious Zoe asked many questions." What word describes Zoe?$tl$, $tl$[{"id": "a", "label": "bored"}, {"id": "b", "label": "sleepy"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "mean"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The little duck swam after its mom." Who is the character?$tl$, $tl$[{"id": "a", "label": "the pond"}, {"id": "b", "label": "a leaf"}, {"id": "c", "label": "the sun"}, {"id": "d", "label": "the little duck"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Excited Ben jumped when he won." How does Ben feel?$tl$, $tl$[{"id": "a", "label": "bored"}, {"id": "b", "label": "sad"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "excited"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Gentle Grandma hugged the baby." What word describes Grandma?$tl$, $tl$[{"id": "a", "label": "rough"}, {"id": "b", "label": "mean"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Silly Max made everyone laugh." What word describes Max?$tl$, $tl$[{"id": "a", "label": "serious"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "silly"}, {"id": "d", "label": "quiet"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Tired Pia yawned at bedtime." How does Pia feel?$tl$, $tl$[{"id": "a", "label": "tired"}, {"id": "b", "label": "wide awake"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "hungry"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "Kind Ravi shared his lunch." Who shared lunch? (one word)$tl$, null, $tl$Ravi$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The brave knight helped the village." Who is the main character?$tl$, $tl$[{"id": "a", "label": "the knight"}, {"id": "b", "label": "the village"}, {"id": "c", "label": "the road"}, {"id": "d", "label": "the horse only"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Scared Lily ran from the loud noise." How does Lily feel?$tl$, $tl$[{"id": "a", "label": "calm"}, {"id": "b", "label": "scared"}, {"id": "c", "label": "happy"}, {"id": "d", "label": "bored"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Friendly Sam waved to everyone." What word describes Sam?$tl$, $tl$[{"id": "a", "label": "mean"}, {"id": "b", "label": "shy"}, {"id": "c", "label": "friendly"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The wise old owl gave good advice." Who is the character?$tl$, $tl$[{"id": "a", "label": "the tree"}, {"id": "b", "label": "the owl"}, {"id": "c", "label": "the night"}, {"id": "d", "label": "the wind"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$characters$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Setting (RL.1.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$setting$tl$, $tl$Setting$tl$, $tl$The setting is where and when a story takes place.$tl$, 1, $tl$RL.1.3$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Setting$tl$, 1, $tl$[{"type": "explain", "title": "About: Setting", "body": "The setting is where and when a story takes place."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"At the beach, we built a sandcastle.\" Where does this happen?  The correct answer is \"at the beach\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"In the forest, the deer ran by.\" Where does this happen?", "choices": [{"id": "a", "label": "in the ocean"}, {"id": "b", "label": "in a city"}, {"id": "c", "label": "on the moon"}, {"id": "d", "label": "in the forest"}], "answer": "d", "explanation": "The correct answer is \"in the forest\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At the beach, we built a sandcastle." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in space"}, {"id": "b", "label": "at the beach"}, {"id": "c", "label": "at school"}, {"id": "d", "label": "in a cave"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In the forest, the deer ran by." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in the ocean"}, {"id": "b", "label": "in a city"}, {"id": "c", "label": "on the moon"}, {"id": "d", "label": "in the forest"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It was snowy in the village." What is the setting?$tl$, $tl$[{"id": "a", "label": "a hot beach"}, {"id": "b", "label": "a snowy village"}, {"id": "c", "label": "a busy mall"}, {"id": "d", "label": "a desert"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At school, we read and write." Where does this happen?$tl$, $tl$[{"id": "a", "label": "at the zoo"}, {"id": "b", "label": "on a boat"}, {"id": "c", "label": "at school"}, {"id": "d", "label": "in space"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "On the farm, the rooster crowed." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in a city"}, {"id": "b", "label": "in the sea"}, {"id": "c", "label": "on the farm"}, {"id": "d", "label": "on the moon"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In the kitchen, Mom made soup." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in the kitchen"}, {"id": "b", "label": "in the car"}, {"id": "c", "label": "at the park"}, {"id": "d", "label": "in a boat"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Under the sea, a fish swam by." Where does this happen?$tl$, $tl$[{"id": "a", "label": "under the sea"}, {"id": "b", "label": "in the sky"}, {"id": "c", "label": "in a cave"}, {"id": "d", "label": "on a hill"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At night, the stars were bright." When does this happen?$tl$, $tl$[{"id": "a", "label": "at noon"}, {"id": "b", "label": "in the morning"}, {"id": "c", "label": "at lunch"}, {"id": "d", "label": "at night"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In the park, kids played on swings." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in a store"}, {"id": "b", "label": "at the dentist"}, {"id": "c", "label": "in space"}, {"id": "d", "label": "in the park"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "On a rainy day, we stayed in." What is the setting?$tl$, $tl$[{"id": "a", "label": "a sunny beach"}, {"id": "b", "label": "a rainy day"}, {"id": "c", "label": "a snowy hill"}, {"id": "d", "label": "a hot desert"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At the zoo, we saw lions." Where does this happen?$tl$, $tl$[{"id": "a", "label": "at home"}, {"id": "b", "label": "on a bus"}, {"id": "c", "label": "at the zoo"}, {"id": "d", "label": "in a cave"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In space, the rocket flew past stars." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in a pond"}, {"id": "b", "label": "on a farm"}, {"id": "c", "label": "in space"}, {"id": "d", "label": "in a kitchen"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At the library, we found books." Where does this happen?$tl$, $tl$[{"id": "a", "label": "at the beach"}, {"id": "b", "label": "on a boat"}, {"id": "c", "label": "at the library"}, {"id": "d", "label": "in a cave"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In the morning, the sun came up." When does this happen?$tl$, $tl$[{"id": "a", "label": "at midnight"}, {"id": "b", "label": "at dinner"}, {"id": "c", "label": "in the morning"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "On the mountain, snow fell softly." Where does this happen?$tl$, $tl$[{"id": "a", "label": "on the mountain"}, {"id": "b", "label": "at the beach"}, {"id": "c", "label": "in a mall"}, {"id": "d", "label": "in a pool"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "At the pond, frogs hopped." Where did the frogs hop? At the ____. (one word)$tl$, null, $tl$pond$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In the cozy cabin, it was warm." What is the setting?$tl$, $tl$[{"id": "a", "label": "a cozy cabin"}, {"id": "b", "label": "a cold street"}, {"id": "c", "label": "a busy bus"}, {"id": "d", "label": "a loud party"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "At the campsite, we sat by the fire." Where does this happen?$tl$, $tl$[{"id": "a", "label": "in a classroom"}, {"id": "b", "label": "at a store"}, {"id": "c", "label": "at the campsite"}, {"id": "d", "label": "in space"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "In summer, we go to the lake." When do they go?$tl$, $tl$[{"id": "a", "label": "in winter"}, {"id": "b", "label": "in summer"}, {"id": "c", "label": "at midnight"}, {"id": "d", "label": "never"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Inside the warm house, we read books." Where does this happen?$tl$, $tl$[{"id": "a", "label": "inside the house"}, {"id": "b", "label": "outside in the snow"}, {"id": "c", "label": "on a boat"}, {"id": "d", "label": "in a tree"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$setting$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Rhyming Words (RF.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rhyming-words$tl$, $tl$Rhyming Words$tl$, $tl$Rhyming words sound the same at the end, like cat and hat.$tl$, 1, $tl$RF.1.2$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Rhyming Words$tl$, 1, $tl$[{"type": "explain", "title": "About: Rhyming Words", "body": "Rhyming words sound the same at the end, like cat and hat."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word rhymes with CAT?  The correct answer is \"hat\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word rhymes with DOG?", "choices": [{"id": "a", "label": "cat"}, {"id": "b", "label": "pen"}, {"id": "c", "label": "bus"}, {"id": "d", "label": "log"}], "answer": "d", "explanation": "The correct answer is \"log\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with CAT?$tl$, $tl$[{"id": "a", "label": "dog"}, {"id": "b", "label": "hat"}, {"id": "c", "label": "sun"}, {"id": "d", "label": "cup"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with DOG?$tl$, $tl$[{"id": "a", "label": "cat"}, {"id": "b", "label": "pen"}, {"id": "c", "label": "bus"}, {"id": "d", "label": "log"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with SUN?$tl$, $tl$[{"id": "a", "label": "car"}, {"id": "b", "label": "run"}, {"id": "c", "label": "top"}, {"id": "d", "label": "cup"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with BEE?$tl$, $tl$[{"id": "a", "label": "book"}, {"id": "b", "label": "tree"}, {"id": "c", "label": "ball"}, {"id": "d", "label": "cup"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with CAR?$tl$, $tl$[{"id": "a", "label": "star"}, {"id": "b", "label": "sun"}, {"id": "c", "label": "dog"}, {"id": "d", "label": "hat"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with CAKE?$tl$, $tl$[{"id": "a", "label": "milk"}, {"id": "b", "label": "ball"}, {"id": "c", "label": "top"}, {"id": "d", "label": "lake"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with RING?$tl$, $tl$[{"id": "a", "label": "road"}, {"id": "b", "label": "cup"}, {"id": "c", "label": "fan"}, {"id": "d", "label": "king"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with TOP?$tl$, $tl$[{"id": "a", "label": "cat"}, {"id": "b", "label": "mop"}, {"id": "c", "label": "sun"}, {"id": "d", "label": "bee"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with BALL?$tl$, $tl$[{"id": "a", "label": "tall"}, {"id": "b", "label": "bell"}, {"id": "c", "label": "bird"}, {"id": "d", "label": "fish"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with PIG?$tl$, $tl$[{"id": "a", "label": "dog"}, {"id": "b", "label": "cat"}, {"id": "c", "label": "cup"}, {"id": "d", "label": "wig"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with BED?$tl$, $tl$[{"id": "a", "label": "red"}, {"id": "b", "label": "book"}, {"id": "c", "label": "sun"}, {"id": "d", "label": "car"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with FROG?$tl$, $tl$[{"id": "a", "label": "fish"}, {"id": "b", "label": "bird"}, {"id": "c", "label": "dog"}, {"id": "d", "label": "cat"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with HOP?$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "stop"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "sit"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with FAN?$tl$, $tl$[{"id": "a", "label": "man"}, {"id": "b", "label": "fun"}, {"id": "c", "label": "fin"}, {"id": "d", "label": "fox"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with NIGHT?$tl$, $tl$[{"id": "a", "label": "dark"}, {"id": "b", "label": "day"}, {"id": "c", "label": "moon"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write a word that rhymes with CAT (hint: you wear it on your head). (one word)$tl$, null, $tl$hat$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with SNAIL?$tl$, $tl$[{"id": "a", "label": "snake"}, {"id": "b", "label": "tail"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "shell"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with MOON?$tl$, $tl$[{"id": "a", "label": "spoon"}, {"id": "b", "label": "star"}, {"id": "c", "label": "sun"}, {"id": "d", "label": "sky"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with BOOK?$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "page"}, {"id": "c", "label": "word"}, {"id": "d", "label": "look"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word rhymes with TRAIN?$tl$, $tl$[{"id": "a", "label": "rain"}, {"id": "b", "label": "bus"}, {"id": "c", "label": "car"}, {"id": "d", "label": "road"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Sight Words (RF.1.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sight-words$tl$, $tl$Sight Words$tl$, $tl$Sight words are common words we learn to read quickly, like the and you.$tl$, 1, $tl$RF.1.3$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sight Words$tl$, 1, $tl$[{"type": "explain", "title": "About: Sight Words", "body": "Sight words are common words we learn to read quickly, like the and you."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is 'the'?  The correct answer is \"the\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is 'and'?", "choices": [{"id": "a", "label": "the"}, {"id": "b", "label": "and"}, {"id": "c", "label": "go"}, {"id": "d", "label": "my"}], "answer": "b", "explanation": "The correct answer is \"and\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'the'?$tl$, $tl$[{"id": "a", "label": "the"}, {"id": "b", "label": "and"}, {"id": "c", "label": "you"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'and'?$tl$, $tl$[{"id": "a", "label": "the"}, {"id": "b", "label": "and"}, {"id": "c", "label": "go"}, {"id": "d", "label": "my"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'you'?$tl$, $tl$[{"id": "a", "label": "is"}, {"id": "b", "label": "to"}, {"id": "c", "label": "you"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'said'?$tl$, $tl$[{"id": "a", "label": "see"}, {"id": "b", "label": "said"}, {"id": "c", "label": "go"}, {"id": "d", "label": "my"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'have'?$tl$, $tl$[{"id": "a", "label": "have"}, {"id": "b", "label": "here"}, {"id": "c", "label": "this"}, {"id": "d", "label": "that"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'they'?$tl$, $tl$[{"id": "a", "label": "then"}, {"id": "b", "label": "them"}, {"id": "c", "label": "there"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'with'?$tl$, $tl$[{"id": "a", "label": "with"}, {"id": "b", "label": "wish"}, {"id": "c", "label": "when"}, {"id": "d", "label": "what"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'are'?$tl$, $tl$[{"id": "a", "label": "am"}, {"id": "b", "label": "at"}, {"id": "c", "label": "are"}, {"id": "d", "label": "an"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'for'?$tl$, $tl$[{"id": "a", "label": "far"}, {"id": "b", "label": "from"}, {"id": "c", "label": "four"}, {"id": "d", "label": "for"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'this'?$tl$, $tl$[{"id": "a", "label": "that"}, {"id": "b", "label": "then"}, {"id": "c", "label": "this"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'was'?$tl$, $tl$[{"id": "a", "label": "saw"}, {"id": "b", "label": "was"}, {"id": "c", "label": "was not"}, {"id": "d", "label": "way"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'play'?$tl$, $tl$[{"id": "a", "label": "pay"}, {"id": "b", "label": "plan"}, {"id": "c", "label": "play"}, {"id": "d", "label": "place"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'like'?$tl$, $tl$[{"id": "a", "label": "lake"}, {"id": "b", "label": "look"}, {"id": "c", "label": "like"}, {"id": "d", "label": "lick"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'come'?$tl$, $tl$[{"id": "a", "label": "came"}, {"id": "b", "label": "come"}, {"id": "c", "label": "some"}, {"id": "d", "label": "cone"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'good'?$tl$, $tl$[{"id": "a", "label": "god"}, {"id": "b", "label": "gold"}, {"id": "c", "label": "food"}, {"id": "d", "label": "good"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Which little word means the opposite of 'stop'? (one word)$tl$, null, $tl$go$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'here'?$tl$, $tl$[{"id": "a", "label": "here"}, {"id": "b", "label": "hear"}, {"id": "c", "label": "her"}, {"id": "d", "label": "hare"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'little'?$tl$, $tl$[{"id": "a", "label": "little"}, {"id": "b", "label": "lit"}, {"id": "c", "label": "letter"}, {"id": "d", "label": "later"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'big'?$tl$, $tl$[{"id": "a", "label": "bag"}, {"id": "b", "label": "bug"}, {"id": "c", "label": "beg"}, {"id": "d", "label": "big"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is 'help'?$tl$, $tl$[{"id": "a", "label": "held"}, {"id": "b", "label": "heap"}, {"id": "c", "label": "help"}, {"id": "d", "label": "hello"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Opposites (L.1.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$opposites$tl$, $tl$Opposites$tl$, $tl$Opposites are words that mean very different things, like big and small.$tl$, 1, $tl$L.1.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Opposites$tl$, 1, $tl$[{"type": "explain", "title": "About: Opposites", "body": "Opposites are words that mean very different things, like big and small."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the opposite of BIG?  The correct answer is \"small\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "What is the opposite of HOT?", "choices": [{"id": "a", "label": "cold"}, {"id": "b", "label": "warm"}, {"id": "c", "label": "wet"}, {"id": "d", "label": "loud"}], "answer": "a", "explanation": "The correct answer is \"cold\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of BIG?$tl$, $tl$[{"id": "a", "label": "tall"}, {"id": "b", "label": "red"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "small"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of HOT?$tl$, $tl$[{"id": "a", "label": "cold"}, {"id": "b", "label": "warm"}, {"id": "c", "label": "wet"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of UP?$tl$, $tl$[{"id": "a", "label": "high"}, {"id": "b", "label": "top"}, {"id": "c", "label": "over"}, {"id": "d", "label": "down"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of DAY?$tl$, $tl$[{"id": "a", "label": "noon"}, {"id": "b", "label": "sun"}, {"id": "c", "label": "night"}, {"id": "d", "label": "sky"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of HAPPY?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "glad"}, {"id": "c", "label": "silly"}, {"id": "d", "label": "kind"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of FAST?$tl$, $tl$[{"id": "a", "label": "quick"}, {"id": "b", "label": "tall"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "big"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of OPEN?$tl$, $tl$[{"id": "a", "label": "wide"}, {"id": "b", "label": "closed"}, {"id": "c", "label": "door"}, {"id": "d", "label": "in"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of FULL?$tl$, $tl$[{"id": "a", "label": "heavy"}, {"id": "b", "label": "big"}, {"id": "c", "label": "empty"}, {"id": "d", "label": "more"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of OLD?$tl$, $tl$[{"id": "a", "label": "used"}, {"id": "b", "label": "gray"}, {"id": "c", "label": "new"}, {"id": "d", "label": "tall"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of WET?$tl$, $tl$[{"id": "a", "label": "damp"}, {"id": "b", "label": "dry"}, {"id": "c", "label": "rainy"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of IN?$tl$, $tl$[{"id": "a", "label": "on"}, {"id": "b", "label": "out"}, {"id": "c", "label": "under"}, {"id": "d", "label": "over"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of GO?$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "stop"}, {"id": "c", "label": "start"}, {"id": "d", "label": "walk"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of LOUD?$tl$, $tl$[{"id": "a", "label": "noisy"}, {"id": "b", "label": "big"}, {"id": "c", "label": "quiet"}, {"id": "d", "label": "fast"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of LIGHT (not heavy)?$tl$, $tl$[{"id": "a", "label": "bright"}, {"id": "b", "label": "soft"}, {"id": "c", "label": "small"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of YES?$tl$, $tl$[{"id": "a", "label": "maybe"}, {"id": "b", "label": "okay"}, {"id": "c", "label": "no"}, {"id": "d", "label": "sure"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the opposite of UP. (one word)$tl$, null, $tl$down$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of FRONT?$tl$, $tl$[{"id": "a", "label": "side"}, {"id": "b", "label": "back"}, {"id": "c", "label": "top"}, {"id": "d", "label": "middle"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of LEFT?$tl$, $tl$[{"id": "a", "label": "right"}, {"id": "b", "label": "up"}, {"id": "c", "label": "down"}, {"id": "d", "label": "over"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of TALL?$tl$, $tl$[{"id": "a", "label": "short"}, {"id": "b", "label": "high"}, {"id": "c", "label": "long"}, {"id": "d", "label": "big"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$What is the opposite of SOFT?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "smooth"}, {"id": "c", "label": "hard"}, {"id": "d", "label": "light"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Word Meaning (RI.1.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$context-clues$tl$, $tl$Word Meaning$tl$, $tl$Use the other words in a sentence to figure out what a word means.$tl$, 1, $tl$RI.1.4$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Word Meaning$tl$, 1, $tl$[{"type": "explain", "title": "About: Word Meaning", "body": "Use the other words in a sentence to figure out what a word means."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The tiny ant was so small I could hardly see it.\" What does \"tiny\" mean?  The correct answer is \"very small\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"I was so tired I fell asleep right away.\" What does \"tired\" mean?", "choices": [{"id": "a", "label": "happy"}, {"id": "b", "label": "sleepy"}, {"id": "c", "label": "hungry"}, {"id": "d", "label": "angry"}], "answer": "b", "explanation": "The correct answer is \"sleepy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The tiny ant was so small I could hardly see it." What does "tiny" mean?$tl$, $tl$[{"id": "a", "label": "very big"}, {"id": "b", "label": "very loud"}, {"id": "c", "label": "very small"}, {"id": "d", "label": "very fast"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "I was so tired I fell asleep right away." What does "tired" mean?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "sleepy"}, {"id": "c", "label": "hungry"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The soup was hot, so I let it cool." What does "hot" mean here?$tl$, $tl$[{"id": "a", "label": "very cold"}, {"id": "b", "label": "very warm"}, {"id": "c", "label": "very sweet"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The huge dog was bigger than me!" What does "huge" mean?$tl$, $tl$[{"id": "a", "label": "very big"}, {"id": "b", "label": "very small"}, {"id": "c", "label": "very quiet"}, {"id": "d", "label": "very fast"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It was quiet; no one made a sound." What does "quiet" mean?$tl$, $tl$[{"id": "a", "label": "very loud"}, {"id": "b", "label": "no sound"}, {"id": "c", "label": "very bright"}, {"id": "d", "label": "very cold"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The happy baby giggled and smiled." What does "happy" mean?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "glad"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The glass was empty, so I filled it." What does "empty" mean?$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "heavy"}, {"id": "c", "label": "broken"}, {"id": "d", "label": "nothing inside"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The race car was fast and zoomed by." What does "fast" mean?$tl$, $tl$[{"id": "a", "label": "slow"}, {"id": "b", "label": "quick"}, {"id": "c", "label": "still"}, {"id": "d", "label": "late"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The ice was cold on my hand." What does "cold" mean?$tl$, $tl$[{"id": "a", "label": "hot"}, {"id": "b", "label": "sweet"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "not warm"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The bright sun made me squint." What does "bright" mean?$tl$, $tl$[{"id": "a", "label": "dark"}, {"id": "b", "label": "wet"}, {"id": "c", "label": "heavy"}, {"id": "d", "label": "full of light"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The kitten was soft and fluffy." What does "soft" mean?$tl$, $tl$[{"id": "a", "label": "rough"}, {"id": "b", "label": "not hard"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "I was hungry, so I had a snack." What does "hungry" mean?$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "wanting food"}, {"id": "c", "label": "tired"}, {"id": "d", "label": "happy"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The old shoes had holes in them." What does "old" mean?$tl$, $tl$[{"id": "a", "label": "clean"}, {"id": "b", "label": "not new"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "red"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The wet towel dripped water." What does "wet" mean?$tl$, $tl$[{"id": "a", "label": "dry"}, {"id": "b", "label": "warm"}, {"id": "c", "label": "red"}, {"id": "d", "label": "not dry"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He spoke in a loud voice across the room." What does "loud" mean?$tl$, $tl$[{"id": "a", "label": "quiet"}, {"id": "b", "label": "soft"}, {"id": "c", "label": "sweet"}, {"id": "d", "label": "easy to hear"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "The room was dark, so I turned on a light." What does "dark" mean? Not full of ____. (one word)$tl$, null, $tl$light$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The heavy box was hard to lift." What does "heavy" mean?$tl$, $tl$[{"id": "a", "label": "weighs a lot"}, {"id": "b", "label": "weighs little"}, {"id": "c", "label": "is empty"}, {"id": "d", "label": "is small"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "She was sad and began to cry." What does "sad" mean?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "not happy"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "tall"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The new toy was shiny and clean." What does "new" mean?$tl$, $tl$[{"id": "a", "label": "not old"}, {"id": "b", "label": "broken"}, {"id": "c", "label": "used"}, {"id": "d", "label": "dirty"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The slow turtle took a long time." What does "slow" mean?$tl$, $tl$[{"id": "a", "label": "quick"}, {"id": "b", "label": "loud"}, {"id": "c", "label": "not fast"}, {"id": "d", "label": "tall"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Cause & Effect (RI.1.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$cause-and-effect$tl$, $tl$Cause & Effect$tl$, $tl$A cause is why something happens; the effect is what happens.$tl$, 1, $tl$RI.1.3$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Cause & Effect$tl$, 1, $tl$[{"type": "explain", "title": "About: Cause & Effect", "body": "A cause is why something happens; the effect is what happens."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"It rained, so we went inside.\" Why did they go inside?  The correct answer is \"because it rained\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Sam dropped the cup, so it broke.\" What happened to the cup?", "choices": [{"id": "a", "label": "it floated"}, {"id": "b", "label": "it broke"}, {"id": "c", "label": "it grew"}, {"id": "d", "label": "nothing"}], "answer": "b", "explanation": "The correct answer is \"it broke\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It rained, so we went inside." Why did they go inside?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "they were tired"}, {"id": "c", "label": "it was lunch"}, {"id": "d", "label": "because it rained"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Sam dropped the cup, so it broke." What happened to the cup?$tl$, $tl$[{"id": "a", "label": "it floated"}, {"id": "b", "label": "it broke"}, {"id": "c", "label": "it grew"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The dog was hungry, so it barked at its bowl." Why did the dog bark?$tl$, $tl$[{"id": "a", "label": "it was full"}, {"id": "b", "label": "it was sleepy"}, {"id": "c", "label": "it was cold"}, {"id": "d", "label": "it was hungry"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "She watered the plant, so it grew." Why did the plant grow?$tl$, $tl$[{"id": "a", "label": "it was dark"}, {"id": "b", "label": "it was cold"}, {"id": "c", "label": "nobody touched it"}, {"id": "d", "label": "she watered it"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The ice got hot, so it melted." Why did the ice melt?$tl$, $tl$[{"id": "a", "label": "it got cold"}, {"id": "b", "label": "it was night"}, {"id": "c", "label": "it was tiny"}, {"id": "d", "label": "it got hot"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "Ben was sleepy, so he went to bed." Why did Ben go to bed?$tl$, $tl$[{"id": "a", "label": "he was sleepy"}, {"id": "b", "label": "he was hungry"}, {"id": "c", "label": "he was happy"}, {"id": "d", "label": "it was morning"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The wind blew, so the kite flew high." Why did the kite fly high?$tl$, $tl$[{"id": "a", "label": "it was heavy"}, {"id": "b", "label": "it rained"}, {"id": "c", "label": "it was dark"}, {"id": "d", "label": "the wind blew"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It was cold, so she wore a coat." Why did she wear a coat?$tl$, $tl$[{"id": "a", "label": "it was cold"}, {"id": "b", "label": "it was hot"}, {"id": "c", "label": "it was sunny"}, {"id": "d", "label": "it was loud"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He forgot his umbrella, so he got wet." Why did he get wet?$tl$, $tl$[{"id": "a", "label": "he forgot his umbrella"}, {"id": "b", "label": "he stayed dry"}, {"id": "c", "label": "he ran fast"}, {"id": "d", "label": "it was sunny"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The baby was tired, so she cried." Why did the baby cry?$tl$, $tl$[{"id": "a", "label": "she was happy"}, {"id": "b", "label": "she ate"}, {"id": "c", "label": "she ran"}, {"id": "d", "label": "she was tired"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "We planted seeds, so flowers grew." What grew?$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "flowers"}, {"id": "c", "label": "cars"}, {"id": "d", "label": "cups"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The light turned green, so the cars went." Why did the cars go?$tl$, $tl$[{"id": "a", "label": "the light turned green"}, {"id": "b", "label": "it was red"}, {"id": "c", "label": "it was night"}, {"id": "d", "label": "it rained"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "It snowed, so school was closed." Why was school closed?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "it was summer"}, {"id": "c", "label": "it snowed"}, {"id": "d", "label": "it was Friday"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "He studied, so he did well." Why did he do well?$tl$, $tl$[{"id": "a", "label": "he was late"}, {"id": "b", "label": "he studied"}, {"id": "c", "label": "he slept"}, {"id": "d", "label": "he guessed"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The pot was hot, so she used a glove." Why did she use a glove?$tl$, $tl$[{"id": "a", "label": "the pot was cold"}, {"id": "b", "label": "it was empty"}, {"id": "c", "label": "the pot was hot"}, {"id": "d", "label": "it was new"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Read: "It rained, so the ground got ____." What did the ground get? (one word)$tl$, null, $tl$wet$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The music was loud, so he covered his ears." Why did he cover his ears?$tl$, $tl$[{"id": "a", "label": "it was quiet"}, {"id": "b", "label": "it was soft"}, {"id": "c", "label": "the music was loud"}, {"id": "d", "label": "it was off"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The sun came out, so the snow melted." Why did the snow melt?$tl$, $tl$[{"id": "a", "label": "it got colder"}, {"id": "b", "label": "it was night"}, {"id": "c", "label": "the sun came out"}, {"id": "d", "label": "it was windy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "She was thirsty, so she drank water." Why did she drink water?$tl$, $tl$[{"id": "a", "label": "she was full"}, {"id": "b", "label": "she was thirsty"}, {"id": "c", "label": "she was sleepy"}, {"id": "d", "label": "she was cold"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Read: "The ball rolled away, so the dog chased it." Why did the dog chase the ball?$tl$, $tl$[{"id": "a", "label": "the ball stopped"}, {"id": "b", "label": "the dog slept"}, {"id": "c", "label": "the ball rolled away"}, {"id": "d", "label": "it was night"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, or thing.$tl$, 1, $tl$L.1.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 1, $tl$[{"type": "explain", "title": "About: Nouns", "body": "A noun names a person, place, or thing."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a noun (a person, place, or thing)?  The correct answer is \"farmer\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "puppy"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "scribble"}], "answer": "a", "explanation": "The correct answer is \"puppy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "river"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "island"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "window"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "march"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb is an action word that tells what someone does.$tl$, 1, $tl$L.1.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 1, $tl$[{"type": "explain", "title": "About: Action Verbs", "body": "A verb is an action word that tells what someone does."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an action verb (something you can do)?  The correct answer is \"whisper\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "narrow"}, {"id": "b", "label": "build"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "frozen"}], "answer": "b", "explanation": "The correct answer is \"build\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "build"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "frozen"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "island"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "island"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "village"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "tiny"}, {"id": "b", "label": "shout"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "slippery"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "window"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "march"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "island"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "river"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "curious"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "teacher"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "gentle"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun, like big, red, or soft.$tl$, 1, $tl$L.1.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 1, $tl$[{"type": "explain", "title": "About: Adjectives", "body": "An adjective describes a noun, like big, red, or soft."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an adjective (it describes a noun)?  The correct answer is \"gentle\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "scribble"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "shout"}], "answer": "b", "explanation": "The correct answer is \"slippery\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "gentle"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "curious"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "wander"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "scribble"}, {"id": "c", "label": "tiny"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "explore"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "enormous"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "build"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "gallop"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "window"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "march"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "march"}, {"id": "c", "label": "slippery"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "village"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "golden"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun, like he, she, it, or they.$tl$, 1, $tl$L.1.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 1, $tl$[{"type": "explain", "title": "About: Pronouns", "body": "A pronoun takes the place of a noun, like he, she, it, or they."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a pronoun (it takes the place of a noun)?  The correct answer is \"we\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "sister"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "whisper"}], "answer": "c", "explanation": "The correct answer is \"her\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "we"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "her"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "you"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "they"}, {"id": "c", "label": "library"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "doctor"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "it"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "pencil"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "I"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "she"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "us"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "village"}, {"id": "c", "label": "him"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "whisper"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "we"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "her"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "you"}, {"id": "c", "label": "jump"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "they"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "them"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "it"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "build"}, {"id": "c", "label": "march"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "she"}, {"id": "b", "label": "engine"}, {"id": "c", "label": "island"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "us"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "him"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Matching Verbs (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Matching Verbs$tl$, $tl$The verb must match the subject, like 'The dog runs.'$tl$, 1, $tl$L.1.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Matching Verbs$tl$, 1, $tl$[{"type": "explain", "title": "About: Matching Verbs", "body": "The verb must match the subject, like 'The dog runs.'"}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Choose the correct verb: \"The artist ____ every day.\"  The correct answer is \"paints\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The snake ____ every day.\"", "choices": [{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithers"}, {"id": "d", "label": "slithersing"}], "answer": "c", "explanation": "The correct answer is \"slithers\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "paints"}, {"id": "c", "label": "paintsed"}, {"id": "d", "label": "paintsing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slither"}, {"id": "b", "label": "slithersed"}, {"id": "c", "label": "slithers"}, {"id": "d", "label": "slithersing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plant"}, {"id": "b", "label": "plantsed"}, {"id": "c", "label": "plants"}, {"id": "d", "label": "plantsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barks"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hop"}, {"id": "b", "label": "hopsed"}, {"id": "c", "label": "hopsing"}, {"id": "d", "label": "hops"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooksing"}, {"id": "d", "label": "cooks"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wag"}, {"id": "b", "label": "wags"}, {"id": "c", "label": "wagsed"}, {"id": "d", "label": "wagsing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flowsed"}, {"id": "c", "label": "flows"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roarsed"}, {"id": "c", "label": "roars"}, {"id": "d", "label": "roarsing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "plays"}, {"id": "b", "label": "play"}, {"id": "c", "label": "playsed"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "reads"}, {"id": "d", "label": "readsing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sing"}, {"id": "b", "label": "sings"}, {"id": "c", "label": "singsed"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "perform"}, {"id": "b", "label": "performsed"}, {"id": "c", "label": "performs"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grow"}, {"id": "b", "label": "growsed"}, {"id": "c", "label": "growsing"}, {"id": "d", "label": "grows"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticks"}, {"id": "c", "label": "ticksed"}, {"id": "d", "label": "ticksing"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "crie"}, {"id": "b", "label": "cries"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistles"}, {"id": "b", "label": "whistle"}, {"id": "c", "label": "whistlesed"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs tell about something that already happened.$tl$, 1, $tl$L.1.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 1, $tl$[{"type": "explain", "title": "About: Past-Tense Verbs", "body": "Past-tense verbs tell about something that already happened."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the past tense of the verb \"make\"?  The answer is made."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "take"?$tl$, null, $tl$took$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "catch"?$tl$, null, $tl$caught$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "ride"?$tl$, null, $tl$rode$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "drink"?$tl$, null, $tl$drank$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "know"?$tl$, null, $tl$knew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "run"?$tl$, null, $tl$ran$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.1.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals mean more than one. Add -s or -es to most nouns.$tl$, 1, $tl$L.1.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 1, $tl$[{"type": "explain", "title": "About: Plural Nouns", "body": "Plurals mean more than one. Add -s or -es to most nouns."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Write the plural of \"cherry\".  The answer is cherries."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "brush".$tl$, null, $tl$brushes$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "dish".$tl$, null, $tl$dishes$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "wolf".$tl$, null, $tl$wolves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "fairy".$tl$, null, $tl$fairies$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "leaf".$tl$, null, $tl$leaves$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "bus".$tl$, null, $tl$buses$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capital Letters (L.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capital Letters$tl$, $tl$Start sentences and names with a capital (big) letter.$tl$, 1, $tl$L.1.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capital Letters$tl$, 1, $tl$[{"type": "explain", "title": "About: Capital Letters", "body": "Start sentences and names with a capital (big) letter."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word or phrase is a proper noun that must be capitalized?  The correct answer is \"Friday\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "river"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "country"}, {"id": "d", "label": "India"}], "answer": "d", "explanation": "The correct answer is \"India\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "month"}, {"id": "c", "label": "Friday"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "country"}, {"id": "d", "label": "India"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "New York"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "city"}, {"id": "c", "label": "Canada"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Tokyo"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "river"}, {"id": "c", "label": "month"}, {"id": "d", "label": "October"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Africa"}, {"id": "b", "label": "city"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "day"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "Maria"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "July"}, {"id": "c", "label": "country"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "friend"}, {"id": "c", "label": "day"}, {"id": "d", "label": "Australia"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "Pacific Ocean"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Tuesday"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "river"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "country"}, {"id": "b", "label": "Saturn"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "river"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "London"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "day"}, {"id": "c", "label": "river"}, {"id": "d", "label": "Mount Everest"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "river"}, {"id": "c", "label": "December"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "day"}, {"id": "c", "label": "country"}, {"id": "d", "label": "Amazon River"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Nile River"}, {"id": "b", "label": "month"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Monday"}, {"id": "b", "label": "day"}, {"id": "c", "label": "country"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Sarah"}, {"id": "b", "label": "month"}, {"id": "c", "label": "day"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Marks (L.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Marks$tl$, $tl$End a sentence with a period, a question mark, or an exclamation point.$tl$, 1, $tl$L.1.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Marks$tl$, 1, $tl$[{"type": "explain", "title": "About: End Marks", "body": "End a sentence with a period, a question mark, or an exclamation point."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which end mark best completes the sentence?  \"We won the game___\"  The correct answer is \"!\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"Stop right now___\"", "choices": [{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}], "answer": "b", "explanation": "The correct answer is \"!\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a List (L.1.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a List$tl$, $tl$Use commas to separate three or more things in a list.$tl$, 1, $tl$L.1.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a List$tl$, 1, $tl$[{"type": "explain", "title": "About: Commas in a List", "body": "Use commas to separate three or more things in a list."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence uses commas correctly in a list?  The correct answer is \"I like walk, skip, and hop.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like, cats dogs fish."}, {"id": "d", "label": "I like cats, dogs, and fish."}], "answer": "d", "explanation": "The correct answer is \"I like cats, dogs, and fish.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 1, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like, cats dogs fish."}, {"id": "d", "label": "I like cats, dogs, and fish."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions, tigers, and bears."}, {"id": "b", "label": "I like lions tigers and bears."}, {"id": "c", "label": "I like lions, tigers and bears"}, {"id": "d", "label": "I like, lions tigers bears."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain snow and hail."}, {"id": "b", "label": "I like rain, snow, and hail."}, {"id": "c", "label": "I like rain, snow and hail"}, {"id": "d", "label": "I like, rain snow hail."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares and triangles"}, {"id": "c", "label": "I like, circles squares triangles."}, {"id": "d", "label": "I like circles, squares, and triangles."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 1, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums and guitar"}, {"id": "c", "label": "I like piano, drums, and guitar."}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens and rulers"}, {"id": "c", "label": "I like, books pens rulers."}, {"id": "d", "label": "I like books, pens, and rulers."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains, planes, and buses."}, {"id": "b", "label": "I like trains planes and buses."}, {"id": "c", "label": "I like trains, planes and buses"}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver and bronze"}, {"id": "c", "label": "I like gold, silver, and bronze."}, {"id": "d", "label": "I like, gold silver bronze."}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring summer and fall."}, {"id": "b", "label": "I like spring, summer and fall"}, {"id": "c", "label": "I like spring, summer, and fall."}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 1, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs, and bread."}, {"id": "c", "label": "I like milk, eggs and bread"}, {"id": "d", "label": "I like, milk eggs bread."}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges, and pears."}, {"id": "c", "label": "I like apples, oranges and pears"}, {"id": "d", "label": "I like, apples oranges pears."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like, Mom Dad Grandma."}, {"id": "d", "label": "I like Mom, Dad, and Grandma."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils, pens, and markers."}, {"id": "b", "label": "I like pencils pens and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer, tennis, and golf."}, {"id": "b", "label": "I like soccer tennis and golf."}, {"id": "c", "label": "I like soccer, tennis and golf"}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 1, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like red, green, and blue."}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north south and east."}, {"id": "b", "label": "I like north, south and east"}, {"id": "c", "label": "I like north, south, and east."}, {"id": "d", "label": "I like, north south east."}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples grapes and plums."}, {"id": "b", "label": "I like apples, grapes and plums"}, {"id": "c", "label": "I like, apples grapes plums."}, {"id": "d", "label": "I like apples, grapes, and plums."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham, cheese, and lettuce."}, {"id": "b", "label": "I like ham cheese and lettuce."}, {"id": "c", "label": "I like ham, cheese and lettuce"}, {"id": "d", "label": "I like, ham cheese lettuce."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 1, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run, jump, and swim."}, {"id": "b", "label": "I like run jump and swim."}, {"id": "c", "label": "I like run, jump and swim"}, {"id": "d", "label": "I like, run jump swim."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 1 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

