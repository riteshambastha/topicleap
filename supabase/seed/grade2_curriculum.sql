-- =====================================================================
-- TopicLeap - Grade 2 full curriculum seed (generated)
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

-- ---- [math] Place Value to 1000 (2.NBT.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$place-value-to-1000$tl$, $tl$Place Value to 1000$tl$, $tl$A three-digit number is made of hundreds, tens, and ones. In 482 the 4 means 400.$tl$, 2, $tl$2.NBT.A.1$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Place Value to 1000$tl$, 2, $tl$[{"type": "explain", "title": "About: Place Value to 1000", "body": "A three-digit number is made of hundreds, tens, and ones. In 482 the 4 means 400."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the value of the digit 1 in 951? (Write the number, e.g. 300)  The answer is 1."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 1 in 951? (Write the number, e.g. 300)$tl$, null, $tl$1$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 740? (Write the number, e.g. 300)$tl$, null, $tl$700$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 3 in 439? (Write the number, e.g. 300)$tl$, null, $tl$30$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 916? (Write the number, e.g. 300)$tl$, null, $tl$900$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 3 in 623? (Write the number, e.g. 300)$tl$, null, $tl$3$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 2 in 254? (Write the number, e.g. 300)$tl$, null, $tl$200$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 6 in 865? (Write the number, e.g. 300)$tl$, null, $tl$60$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 1 in 216? (Write the number, e.g. 300)$tl$, null, $tl$10$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 5 in 582? (Write the number, e.g. 300)$tl$, null, $tl$500$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 8 in 698? (Write the number, e.g. 300)$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 903? (Write the number, e.g. 300)$tl$, null, $tl$900$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 134? (Write the number, e.g. 300)$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 591? (Write the number, e.g. 300)$tl$, null, $tl$90$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 8 in 768? (Write the number, e.g. 300)$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 9 in 592? (Write the number, e.g. 300)$tl$, null, $tl$90$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 8 in 688? (Write the number, e.g. 300)$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 4 in 456? (Write the number, e.g. 300)$tl$, null, $tl$400$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 8 in 988? (Write the number, e.g. 300)$tl$, null, $tl$80$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 5 in 598? (Write the number, e.g. 300)$tl$, null, $tl$500$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the value of the digit 7 in 703? (Write the number, e.g. 300)$tl$, null, $tl$700$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$place-value-to-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Addition within 100 (2.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$addition-within-100$tl$, $tl$Addition within 100$tl$, $tl$Add two-digit numbers, regrouping ones into a ten when needed.$tl$, 2, $tl$2.NBT.B.5$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Addition within 100$tl$, 2, $tl$[{"type": "explain", "title": "About: Addition within 100", "body": "Add two-digit numbers, regrouping ones into a ten when needed."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 27 + 17 = ?  The answer is 44."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 27 + 17 = ?$tl$, null, $tl$44$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 35 + 64 = ?$tl$, null, $tl$99$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 54 + 44 = ?$tl$, null, $tl$98$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 88 + 12 = ?$tl$, null, $tl$100$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 25 + 72 = ?$tl$, null, $tl$97$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 81 + 15 = ?$tl$, null, $tl$96$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 76 + 13 = ?$tl$, null, $tl$89$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 20 + 52 = ?$tl$, null, $tl$72$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 77 + 11 = ?$tl$, null, $tl$88$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 11 + 86 = ?$tl$, null, $tl$97$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 72 + 25 = ?$tl$, null, $tl$97$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 27 + 25 = ?$tl$, null, $tl$52$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 61 + 38 = ?$tl$, null, $tl$99$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 68 + 24 = ?$tl$, null, $tl$92$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 51 + 14 = ?$tl$, null, $tl$65$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 80 + 17 = ?$tl$, null, $tl$97$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 87 + 10 = ?$tl$, null, $tl$97$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 83 + 14 = ?$tl$, null, $tl$97$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 19 + 76 = ?$tl$, null, $tl$95$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 36 + 35 = ?$tl$, null, $tl$71$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$addition-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Subtraction within 100 (2.NBT.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subtraction-within-100$tl$, $tl$Subtraction within 100$tl$, $tl$Subtract two-digit numbers, regrouping a ten into ones when needed.$tl$, 2, $tl$2.NBT.B.5$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subtraction within 100$tl$, 2, $tl$[{"type": "explain", "title": "About: Subtraction within 100", "body": "Subtract two-digit numbers, regrouping a ten into ones when needed."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Subtract: 92 - 79 = ?  The answer is 13."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 92 - 79 = ?$tl$, null, $tl$13$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 20 - 16 = ?$tl$, null, $tl$4$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 71 - 60 = ?$tl$, null, $tl$11$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 66 - 42 = ?$tl$, null, $tl$24$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 98 - 84 = ?$tl$, null, $tl$14$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 65 - 29 = ?$tl$, null, $tl$36$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 47 - 22 = ?$tl$, null, $tl$25$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 49 - 28 = ?$tl$, null, $tl$21$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 32 - 15 = ?$tl$, null, $tl$17$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 34 - 11 = ?$tl$, null, $tl$23$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 67 - 54 = ?$tl$, null, $tl$13$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 36 - 29 = ?$tl$, null, $tl$7$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 63 - 16 = ?$tl$, null, $tl$47$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 49 - 38 = ?$tl$, null, $tl$11$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 43 - 33 = ?$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 50 - 42 = ?$tl$, null, $tl$8$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 75 - 17 = ?$tl$, null, $tl$58$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 56 - 37 = ?$tl$, null, $tl$19$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 71 - 30 = ?$tl$, null, $tl$41$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 35 - 30 = ?$tl$, null, $tl$5$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$subtraction-within-100$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Add & Subtract within 1000 (2.NBT.B.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$add-subtract-within-1000$tl$, $tl$Add & Subtract within 1000$tl$, $tl$Add and subtract three-digit numbers using hundreds, tens, and ones.$tl$, 2, $tl$2.NBT.B.7$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Add & Subtract within 1000$tl$, 2, $tl$[{"type": "explain", "title": "About: Add & Subtract within 1000", "body": "Add and subtract three-digit numbers using hundreds, tens, and ones."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add: 589 + 174 = ?  The answer is 763."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 589 + 174 = ?$tl$, null, $tl$763$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 459 - 189 = ?$tl$, null, $tl$270$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 227 + 313 = ?$tl$, null, $tl$540$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 806 - 334 = ?$tl$, null, $tl$472$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 553 + 244 = ?$tl$, null, $tl$797$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 881 - 234 = ?$tl$, null, $tl$647$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 205 + 253 = ?$tl$, null, $tl$458$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 900 - 232 = ?$tl$, null, $tl$668$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 341 + 291 = ?$tl$, null, $tl$632$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 968 - 326 = ?$tl$, null, $tl$642$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 549 + 368 = ?$tl$, null, $tl$917$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 407 - 343 = ?$tl$, null, $tl$64$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 550 + 336 = ?$tl$, null, $tl$886$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 713 - 234 = ?$tl$, null, $tl$479$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 479 + 352 = ?$tl$, null, $tl$831$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 303 - 150 = ?$tl$, null, $tl$153$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 597 + 245 = ?$tl$, null, $tl$842$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 965 - 704 = ?$tl$, null, $tl$261$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Add: 427 + 203 = ?$tl$, null, $tl$630$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Subtract: 784 - 107 = ?$tl$, null, $tl$677$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$add-subtract-within-1000$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Skip Counting (2.NBT.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$skip-counting$tl$, $tl$Skip Counting$tl$, $tl$Count by 2s, 5s, 10s, and 100s to find what comes next.$tl$, 2, $tl$2.NBT.A.2$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Skip Counting$tl$, 2, $tl$[{"type": "explain", "title": "About: Skip Counting", "body": "Count by 2s, 5s, 10s, and 100s to find what comes next."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Skip count by 10s: 70, 80, 90, ___  The answer is 100."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 10s: 70, 80, 90, ___$tl$, null, $tl$100$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 5s: 40, 45, 50, ___$tl$, null, $tl$55$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 2s: 8, 10, 12, ___$tl$, null, $tl$14$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 5s: 20, 25, 30, ___$tl$, null, $tl$35$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 2s: 4, 6, 8, ___$tl$, null, $tl$10$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 2s: 10, 12, 14, ___$tl$, null, $tl$16$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 100s: 500, 600, 700, ___$tl$, null, $tl$800$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 10s: 70, 80, 90, ___$tl$, null, $tl$100$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 100s: 700, 800, 900, ___$tl$, null, $tl$1000$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 100s: 300, 400, 500, ___$tl$, null, $tl$600$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 2s: 14, 16, 18, ___$tl$, null, $tl$20$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 10s: 50, 60, 70, ___$tl$, null, $tl$80$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 100s: 100, 200, 300, ___$tl$, null, $tl$400$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 2s: 2, 4, 6, ___$tl$, null, $tl$8$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 10s: 30, 40, 50, ___$tl$, null, $tl$60$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 5s: 25, 30, 35, ___$tl$, null, $tl$40$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 5s: 35, 40, 45, ___$tl$, null, $tl$50$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 10s: 60, 70, 80, ___$tl$, null, $tl$90$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 5s: 15, 20, 25, ___$tl$, null, $tl$30$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Skip count by 100s: 600, 700, 800, ___$tl$, null, $tl$900$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$skip-counting$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Comparing Numbers (2.NBT.A.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$comparing-numbers$tl$, $tl$Comparing Numbers$tl$, $tl$Compare three-digit numbers to tell which is greater or less.$tl$, 2, $tl$2.NBT.A.4$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Numbers$tl$, 2, $tl$[{"type": "explain", "title": "About: Comparing Numbers", "body": "Compare three-digit numbers to tell which is greater or less."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which number is greater: 330 or 673?  The correct answer is \"673\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which number is greater: 526 or 979?", "choices": [{"id": "a", "label": "526"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "979"}, {"id": "d", "label": "1505"}], "answer": "c", "explanation": "The correct answer is \"979\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 330 or 673?$tl$, $tl$[{"id": "a", "label": "330"}, {"id": "b", "label": "673"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "1003"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 526 or 979?$tl$, $tl$[{"id": "a", "label": "526"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "979"}, {"id": "d", "label": "1505"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 597 or 168?$tl$, $tl$[{"id": "a", "label": "168"}, {"id": "b", "label": "597"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "765"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 633 or 238?$tl$, $tl$[{"id": "a", "label": "238"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "871"}, {"id": "d", "label": "633"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 971 or 527?$tl$, $tl$[{"id": "a", "label": "527"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "971"}, {"id": "d", "label": "1498"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 555 or 848?$tl$, $tl$[{"id": "a", "label": "555"}, {"id": "b", "label": "848"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "1403"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 836 or 814?$tl$, $tl$[{"id": "a", "label": "814"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1650"}, {"id": "d", "label": "836"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 173 or 359?$tl$, $tl$[{"id": "a", "label": "173"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "532"}, {"id": "d", "label": "359"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 406 or 856?$tl$, $tl$[{"id": "a", "label": "406"}, {"id": "b", "label": "856"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "1262"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 657 or 153?$tl$, $tl$[{"id": "a", "label": "153"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "810"}, {"id": "d", "label": "657"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 688 or 498?$tl$, $tl$[{"id": "a", "label": "498"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1186"}, {"id": "d", "label": "688"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 537 or 767?$tl$, $tl$[{"id": "a", "label": "767"}, {"id": "b", "label": "537"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "1304"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 186 or 409?$tl$, $tl$[{"id": "a", "label": "186"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "595"}, {"id": "d", "label": "409"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 655 or 841?$tl$, $tl$[{"id": "a", "label": "655"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1496"}, {"id": "d", "label": "841"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 178 or 122?$tl$, $tl$[{"id": "a", "label": "178"}, {"id": "b", "label": "122"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "300"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 138 or 663?$tl$, $tl$[{"id": "a", "label": "138"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "801"}, {"id": "d", "label": "663"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 702 or 856?$tl$, $tl$[{"id": "a", "label": "702"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "1558"}, {"id": "d", "label": "856"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 460 or 702?$tl$, $tl$[{"id": "a", "label": "460"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "702"}, {"id": "d", "label": "1162"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 496 or 224?$tl$, $tl$[{"id": "a", "label": "224"}, {"id": "b", "label": "496"}, {"id": "c", "label": "They are equal"}, {"id": "d", "label": "720"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which number is greater: 581 or 963?$tl$, $tl$[{"id": "a", "label": "581"}, {"id": "b", "label": "They are equal"}, {"id": "c", "label": "963"}, {"id": "d", "label": "1544"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$comparing-numbers$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Arrays & Equal Groups (2.OA.C.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$arrays$tl$, $tl$Arrays & Equal Groups$tl$, $tl$An array has equal rows. Add the rows up (or multiply) to find the total.$tl$, 2, $tl$2.OA.C.4$tl$, 7
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Arrays & Equal Groups$tl$, 2, $tl$[{"type": "explain", "title": "About: Arrays & Equal Groups", "body": "An array has equal rows. Add the rows up (or multiply) to find the total."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: An array has 2 rows with 2 in each row. How many are there in all?  The answer is 4."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 2 rows with 2 in each row. How many are there in all?$tl$, null, $tl$4$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 4 rows with 6 in each row. How many are there in all?$tl$, null, $tl$24$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 6 rows with 2 in each row. How many are there in all?$tl$, null, $tl$12$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 5 rows with 6 in each row. How many are there in all?$tl$, null, $tl$30$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 2 rows with 4 in each row. How many are there in all?$tl$, null, $tl$8$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 2 rows with 3 in each row. How many are there in all?$tl$, null, $tl$6$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 3 rows with 6 in each row. How many are there in all?$tl$, null, $tl$18$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 6 rows with 4 in each row. How many are there in all?$tl$, null, $tl$24$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 5 rows with 5 in each row. How many are there in all?$tl$, null, $tl$25$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 3 rows with 4 in each row. How many are there in all?$tl$, null, $tl$12$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 5 rows with 2 in each row. How many are there in all?$tl$, null, $tl$10$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 4 rows with 3 in each row. How many are there in all?$tl$, null, $tl$12$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 4 rows with 4 in each row. How many are there in all?$tl$, null, $tl$16$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 3 rows with 3 in each row. How many are there in all?$tl$, null, $tl$9$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 6 rows with 3 in each row. How many are there in all?$tl$, null, $tl$18$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 3 rows with 5 in each row. How many are there in all?$tl$, null, $tl$15$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 6 rows with 6 in each row. How many are there in all?$tl$, null, $tl$36$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 4 rows with 5 in each row. How many are there in all?$tl$, null, $tl$20$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 2 rows with 6 in each row. How many are there in all?$tl$, null, $tl$12$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An array has 5 rows with 3 in each row. How many are there in all?$tl$, null, $tl$15$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$arrays$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Money (2.MD.C.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$money$tl$, $tl$Money$tl$, $tl$Count coins: a quarter is 25 cents, a dime 10, a nickel 5, and a penny 1.$tl$, 2, $tl$2.MD.C.8$tl$, 8
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Money$tl$, 2, $tl$[{"type": "explain", "title": "About: Money", "body": "Count coins: a quarter is 25 cents, a dime 10, a nickel 5, and a penny 1."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: You have 3 quarters, 4 dimes, 2 nickels, 2 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)  The answer is 127."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 4 dimes, 2 nickels, 2 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$127$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 quarters, 2 dimes, 3 nickels, 4 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$89$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 dime, 2 nickels. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$20$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 3 dimes. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$55$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 1 dime, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$86$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 quarters, 1 dime, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$61$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 1 dime, 3 nickels, 3 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$53$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 4 dimes, 3 nickels, 4 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$134$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 2 dimes, 2 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$47$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 quarters, 4 dimes, 2 nickels, 3 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$103$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 4 dimes, 2 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$67$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 dimes, 2 nickels, 2 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$32$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 3 dimes, 3 nickels, 4 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$124$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 dimes, 3 nickels, 3 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$38$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 1 dime, 3 nickels, 4 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$54$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 1 dime, 1 nickel, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$91$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 quarters, 4 dimes, 3 nickels, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$106$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 1 quarter, 2 dimes, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$46$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 3 quarters, 2 dimes, 3 nickels, 1 penny. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$111$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$You have 2 quarters, 1 dime, 3 nickels, 4 pennies. How many cents is that in all? (quarter=25, dime=10, nickel=5, penny=1)$tl$, null, $tl$79$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$money$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Telling Time (5 min) (2.MD.C.7) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$telling-time$tl$, $tl$Telling Time (5 min)$tl$, $tl$Read clocks to the nearest five minutes, like 4:15 or 7:30.$tl$, 2, $tl$2.MD.C.7$tl$, 9
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Telling Time (5 min)$tl$, 2, $tl$[{"type": "explain", "title": "About: Telling Time (5 min)", "body": "Read clocks to the nearest five minutes, like 4:15 or 7:30."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which clock time is '10 50' - 10 hours and 50 minutes?  The correct answer is \"10:50\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which clock time is '10 30' - 10 hours and 30 minutes?", "choices": [{"id": "a", "label": "10:30"}, {"id": "b", "label": "1:50"}, {"id": "c", "label": "5:10"}, {"id": "d", "label": "11:40"}], "answer": "a", "explanation": "The correct answer is \"10:30\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '10 50' - 10 hours and 50 minutes?$tl$, $tl$[{"id": "a", "label": "10:50"}, {"id": "b", "label": "4:35"}, {"id": "c", "label": "9:25"}, {"id": "d", "label": "8:00"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '10 30' - 10 hours and 30 minutes?$tl$, $tl$[{"id": "a", "label": "10:30"}, {"id": "b", "label": "1:50"}, {"id": "c", "label": "5:10"}, {"id": "d", "label": "11:40"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '11 15' - 11 hours and 15 minutes?$tl$, $tl$[{"id": "a", "label": "11:15"}, {"id": "b", "label": "6:00"}, {"id": "c", "label": "12:25"}, {"id": "d", "label": "6:40"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '4 50' - 4 hours and 50 minutes?$tl$, $tl$[{"id": "a", "label": "2:05"}, {"id": "b", "label": "4:50"}, {"id": "c", "label": "1:55"}, {"id": "d", "label": "5:45"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '12 40' - 12 hours and 40 minutes?$tl$, $tl$[{"id": "a", "label": "10:10"}, {"id": "b", "label": "12:40"}, {"id": "c", "label": "8:35"}, {"id": "d", "label": "4:15"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '2 25' - 2 hours and 25 minutes?$tl$, $tl$[{"id": "a", "label": "4:15"}, {"id": "b", "label": "7:00"}, {"id": "c", "label": "12:55"}, {"id": "d", "label": "2:25"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '11 00' - 11 hours and 0 minutes?$tl$, $tl$[{"id": "a", "label": "11:00"}, {"id": "b", "label": "10:30"}, {"id": "c", "label": "9:00"}, {"id": "d", "label": "11:30"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '11 30' - 11 hours and 30 minutes?$tl$, $tl$[{"id": "a", "label": "11:30"}, {"id": "b", "label": "1:45"}, {"id": "c", "label": "8:25"}, {"id": "d", "label": "2:45"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '12 05' - 12 hours and 5 minutes?$tl$, $tl$[{"id": "a", "label": "10:10"}, {"id": "b", "label": "11:45"}, {"id": "c", "label": "12:05"}, {"id": "d", "label": "10:35"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '9 10' - 9 hours and 10 minutes?$tl$, $tl$[{"id": "a", "label": "3:55"}, {"id": "b", "label": "9:10"}, {"id": "c", "label": "2:25"}, {"id": "d", "label": "12:15"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '1 25' - 1 hours and 25 minutes?$tl$, $tl$[{"id": "a", "label": "2:50"}, {"id": "b", "label": "3:45"}, {"id": "c", "label": "9:10"}, {"id": "d", "label": "1:25"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '9 20' - 9 hours and 20 minutes?$tl$, $tl$[{"id": "a", "label": "11:00"}, {"id": "b", "label": "1:45"}, {"id": "c", "label": "6:40"}, {"id": "d", "label": "9:20"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '10 30' - 10 hours and 30 minutes?$tl$, $tl$[{"id": "a", "label": "4:15"}, {"id": "b", "label": "7:55"}, {"id": "c", "label": "5:05"}, {"id": "d", "label": "10:30"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '6 45' - 6 hours and 45 minutes?$tl$, $tl$[{"id": "a", "label": "1:45"}, {"id": "b", "label": "9:30"}, {"id": "c", "label": "6:45"}, {"id": "d", "label": "11:50"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '9 15' - 9 hours and 15 minutes?$tl$, $tl$[{"id": "a", "label": "3:05"}, {"id": "b", "label": "3:55"}, {"id": "c", "label": "9:15"}, {"id": "d", "label": "1:15"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '9 25' - 9 hours and 25 minutes?$tl$, $tl$[{"id": "a", "label": "4:45"}, {"id": "b", "label": "9:25"}, {"id": "c", "label": "8:25"}, {"id": "d", "label": "3:50"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '10 35' - 10 hours and 35 minutes?$tl$, $tl$[{"id": "a", "label": "4:30"}, {"id": "b", "label": "10:35"}, {"id": "c", "label": "7:40"}, {"id": "d", "label": "12:10"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '7 40' - 7 hours and 40 minutes?$tl$, $tl$[{"id": "a", "label": "5:55"}, {"id": "b", "label": "9:40"}, {"id": "c", "label": "7:40"}, {"id": "d", "label": "11:55"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '5 10' - 5 hours and 10 minutes?$tl$, $tl$[{"id": "a", "label": "5:10"}, {"id": "b", "label": "2:55"}, {"id": "c", "label": "5:00"}, {"id": "d", "label": "5:50"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which clock time is '11 30' - 11 hours and 30 minutes?$tl$, $tl$[{"id": "a", "label": "11:30"}, {"id": "b", "label": "5:50"}, {"id": "c", "label": "8:40"}, {"id": "d", "label": "7:15"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$telling-time$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [math] Even & Odd (2.OA.C.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$even-and-odd$tl$, $tl$Even & Odd$tl$, $tl$Even numbers can be split into two equal groups; odd numbers have one left over.$tl$, 2, $tl$2.OA.C.3$tl$, 10
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Even & Odd$tl$, 2, $tl$[{"type": "explain", "title": "About: Even & Odd", "body": "Even numbers can be split into two equal groups; odd numbers have one left over."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Is the number 54 even or odd?  The correct answer is \"even\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Is the number 68 even or odd?", "choices": [{"id": "a", "label": "odd"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "even"}], "answer": "d", "explanation": "The correct answer is \"even\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 54 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "even"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 68 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "even"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 18 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 79 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "both"}, {"id": "c", "label": "odd"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 94 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "both"}, {"id": "c", "label": "neither"}, {"id": "d", "label": "even"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 4 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "both"}, {"id": "c", "label": "even"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 56 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 49 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "both"}, {"id": "c", "label": "odd"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 75 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "both"}, {"id": "c", "label": "odd"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 37 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "both"}, {"id": "c", "label": "odd"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 35 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "even"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 94 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "even"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 98 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "even"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 16 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "both"}, {"id": "c", "label": "even"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 49 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 1 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "both"}, {"id": "c", "label": "odd"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 29 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 2 even or odd?$tl$, $tl$[{"id": "a", "label": "odd"}, {"id": "b", "label": "even"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 65 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Is the number 4 even or odd?$tl$, $tl$[{"id": "a", "label": "even"}, {"id": "b", "label": "odd"}, {"id": "c", "label": "both"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$even-and-odd$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Properties of Materials (2-PS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$properties-of-materials$tl$, $tl$Properties of Materials$tl$, $tl$Materials have properties like hardness, color, texture, and flexibility that suit different jobs.$tl$, 2, $tl$2-PS1-1$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Properties of Materials$tl$, 2, $tl$[{"type": "explain", "title": "About: Properties of Materials", "body": "Materials have properties like hardness, color, texture, and flexibility that suit different jobs."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A property tells you about a material, like its color and:  The correct answer is \"texture (how it feels)\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which material is usually hard?", "choices": [{"id": "a", "label": "a pillow"}, {"id": "b", "label": "a cloud"}, {"id": "c", "label": "a rock"}, {"id": "d", "label": "jelly"}], "answer": "c", "explanation": "The correct answer is \"a rock\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A property tells you about a material, like its color and:$tl$, $tl$[{"id": "a", "label": "its name"}, {"id": "b", "label": "texture (how it feels)"}, {"id": "c", "label": "its price"}, {"id": "d", "label": "its owner"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is usually hard?$tl$, $tl$[{"id": "a", "label": "a pillow"}, {"id": "b", "label": "a cloud"}, {"id": "c", "label": "a rock"}, {"id": "d", "label": "jelly"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is usually soft?$tl$, $tl$[{"id": "a", "label": "a brick"}, {"id": "b", "label": "a rock"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "a cotton ball"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is clear (you can see through it)?$tl$, $tl$[{"id": "a", "label": "wood"}, {"id": "b", "label": "a brick"}, {"id": "c", "label": "cardboard"}, {"id": "d", "label": "glass"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is best for keeping you warm?$tl$, $tl$[{"id": "a", "label": "ice"}, {"id": "b", "label": "glass"}, {"id": "c", "label": "metal"}, {"id": "d", "label": "wool"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material bends easily (it is flexible)?$tl$, $tl$[{"id": "a", "label": "rubber"}, {"id": "b", "label": "a brick"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "stone"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would be best to build a strong, sturdy wall?$tl$, $tl$[{"id": "a", "label": "paper"}, {"id": "b", "label": "cotton"}, {"id": "c", "label": "bricks"}, {"id": "d", "label": "jelly"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is smooth?$tl$, $tl$[{"id": "a", "label": "glass"}, {"id": "b", "label": "sandpaper"}, {"id": "c", "label": "a pinecone"}, {"id": "d", "label": "tree bark"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which property describes how heavy something is?$tl$, $tl$[{"id": "a", "label": "weight"}, {"id": "b", "label": "color"}, {"id": "c", "label": "smell"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Metal is a good choice for a pan because it:$tl$, $tl$[{"id": "a", "label": "gets hot to cook food"}, {"id": "b", "label": "floats away"}, {"id": "c", "label": "melts in the sun"}, {"id": "d", "label": "is soft"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material would float on water?$tl$, $tl$[{"id": "a", "label": "a metal nail"}, {"id": "b", "label": "a rock"}, {"id": "c", "label": "a cork"}, {"id": "d", "label": "a coin"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Wood is often used to build furniture because it is:$tl$, $tl$[{"id": "a", "label": "strong and easy to shape"}, {"id": "b", "label": "see-through"}, {"id": "c", "label": "very soft"}, {"id": "d", "label": "liquid"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is the best material for a window?$tl$, $tl$[{"id": "a", "label": "wood"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "clear glass"}, {"id": "d", "label": "brick"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is bendy and stretchy?$tl$, $tl$[{"id": "a", "label": "a glass cup"}, {"id": "b", "label": "a rock"}, {"id": "c", "label": "a brick"}, {"id": "d", "label": "a rubber band"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A property you can test with your hands is:$tl$, $tl$[{"id": "a", "label": "its name"}, {"id": "b", "label": "its price"}, {"id": "c", "label": "who made it"}, {"id": "d", "label": "how rough or smooth it is"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$How a material feels when you touch it is called its ____. (one word)$tl$, null, $tl$texture$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which material is waterproof (water cannot soak in)?$tl$, $tl$[{"id": "a", "label": "paper"}, {"id": "b", "label": "a cotton shirt"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "cardboard"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would make the best soft, cozy blanket?$tl$, $tl$[{"id": "a", "label": "metal"}, {"id": "b", "label": "fleece or wool"}, {"id": "c", "label": "glass"}, {"id": "d", "label": "stone"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Sandpaper feels:$tl$, $tl$[{"id": "a", "label": "smooth"}, {"id": "b", "label": "rough"}, {"id": "c", "label": "wet"}, {"id": "d", "label": "soft"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$We choose materials for a job based on their:$tl$, $tl$[{"id": "a", "label": "properties"}, {"id": "b", "label": "color only"}, {"id": "c", "label": "names"}, {"id": "d", "label": "price only"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$properties-of-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Solids & Liquids (2-PS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$solids-and-liquids$tl$, $tl$Solids & Liquids$tl$, $tl$Solids keep their shape; liquids take the shape of their container.$tl$, 2, $tl$2-PS1-1$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Solids & Liquids$tl$, 2, $tl$[{"type": "explain", "title": "About: Solids & Liquids", "body": "Solids keep their shape; liquids take the shape of their container."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A solid keeps its own:  The correct answer is \"shape\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A liquid takes the shape of its:", "choices": [{"id": "a", "label": "owner"}, {"id": "b", "label": "name"}, {"id": "c", "label": "color"}, {"id": "d", "label": "container"}], "answer": "d", "explanation": "The correct answer is \"container\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A solid keeps its own:$tl$, $tl$[{"id": "a", "label": "temperature only"}, {"id": "b", "label": "shape"}, {"id": "c", "label": "color only"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A liquid takes the shape of its:$tl$, $tl$[{"id": "a", "label": "owner"}, {"id": "b", "label": "name"}, {"id": "c", "label": "color"}, {"id": "d", "label": "container"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a solid?$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "milk"}, {"id": "c", "label": "a rock"}, {"id": "d", "label": "juice"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a liquid?$tl$, $tl$[{"id": "a", "label": "a brick"}, {"id": "b", "label": "a chair"}, {"id": "c", "label": "a spoon"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$If you pour juice into a cup, it takes the shape of the:$tl$, $tl$[{"id": "a", "label": "spoon"}, {"id": "b", "label": "table"}, {"id": "c", "label": "sky"}, {"id": "d", "label": "cup"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which can you hold in your hand without it spilling?$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "milk"}, {"id": "c", "label": "juice"}, {"id": "d", "label": "a block (solid)"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ice is the solid form of:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "milk"}, {"id": "c", "label": "juice"}, {"id": "d", "label": "soda"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$When ice gets warm, it melts into a:$tl$, $tl$[{"id": "a", "label": "solid"}, {"id": "b", "label": "gas only"}, {"id": "c", "label": "liquid"}, {"id": "d", "label": "rock"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which keeps the same shape no matter the container?$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "a toy car (solid)"}, {"id": "c", "label": "juice"}, {"id": "d", "label": "milk"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would flow and spread out if you spilled it?$tl$, $tl$[{"id": "a", "label": "a book"}, {"id": "b", "label": "water (a liquid)"}, {"id": "c", "label": "a rock"}, {"id": "d", "label": "a coin"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A solid can be:$tl$, $tl$[{"id": "a", "label": "only liquid"}, {"id": "b", "label": "hard or soft, but keeps its shape"}, {"id": "c", "label": "only a gas"}, {"id": "d", "label": "invisible always"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Milk poured from a tall glass into a wide bowl will:$tl$, $tl$[{"id": "a", "label": "spread into the bowl's shape"}, {"id": "b", "label": "stay tall"}, {"id": "c", "label": "become solid"}, {"id": "d", "label": "disappear"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which list has only solids?$tl$, $tl$[{"id": "a", "label": "water, milk, juice"}, {"id": "b", "label": "rock, spoon, book"}, {"id": "c", "label": "rain, soup, tea"}, {"id": "d", "label": "milk, ice cream soup, lemonade"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which list has only liquids?$tl$, $tl$[{"id": "a", "label": "rock, spoon, book"}, {"id": "b", "label": "chair, cup, ball"}, {"id": "c", "label": "water, milk, juice"}, {"id": "d", "label": "pencil, plate, fork"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$When you freeze a liquid, it becomes a:$tl$, $tl$[{"id": "a", "label": "gas"}, {"id": "b", "label": "solid"}, {"id": "c", "label": "new color"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$A liquid takes the shape of its ____. (one word)$tl$, null, $tl$container$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is the solid: an ice cube or the water it melts into?$tl$, $tl$[{"id": "a", "label": "the water"}, {"id": "b", "label": "both are gases"}, {"id": "c", "label": "the ice cube"}, {"id": "d", "label": "neither"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Sand poured into a jar fills the jar's shape but each grain is a tiny:$tl$, $tl$[{"id": "a", "label": "liquid"}, {"id": "b", "label": "solid"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "cloud"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which can be poured easily?$tl$, $tl$[{"id": "a", "label": "a solid brick"}, {"id": "b", "label": "a solid rock"}, {"id": "c", "label": "a liquid like water"}, {"id": "d", "label": "a solid book"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A puddle is a small amount of a:$tl$, $tl$[{"id": "a", "label": "liquid"}, {"id": "b", "label": "solid"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "rock"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$solids-and-liquids$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Changing Materials (2-PS1-4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$changing-materials$tl$, $tl$Changing Materials$tl$, $tl$Heating and cooling change materials. Some changes can be undone; some cannot.$tl$, 2, $tl$2-PS1-4$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Changing Materials$tl$, 2, $tl$[{"type": "explain", "title": "About: Changing Materials", "body": "Heating and cooling change materials. Some changes can be undone; some cannot."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Heating ice makes it:  The correct answer is \"melt into water\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Freezing water makes it:", "choices": [{"id": "a", "label": "turn into juice"}, {"id": "b", "label": "get warmer"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "turn into ice"}], "answer": "d", "explanation": "The correct answer is \"turn into ice\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Heating ice makes it:$tl$, $tl$[{"id": "a", "label": "turn to wood"}, {"id": "b", "label": "get harder"}, {"id": "c", "label": "melt into water"}, {"id": "d", "label": "disappear forever"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Freezing water makes it:$tl$, $tl$[{"id": "a", "label": "turn into juice"}, {"id": "b", "label": "get warmer"}, {"id": "c", "label": "vanish"}, {"id": "d", "label": "turn into ice"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Melting and freezing water can be done:$tl$, $tl$[{"id": "a", "label": "again and again (reversible)"}, {"id": "b", "label": "only once ever"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Baking cake batter into a cake is a change that:$tl$, $tl$[{"id": "a", "label": "can be undone easily"}, {"id": "b", "label": "cannot easily be undone"}, {"id": "c", "label": "makes more batter"}, {"id": "d", "label": "freezes it"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Cutting paper into pieces changes its:$tl$, $tl$[{"id": "a", "label": "shape"}, {"id": "b", "label": "material into metal"}, {"id": "c", "label": "color to gold"}, {"id": "d", "label": "weight a lot"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which change can be reversed?$tl$, $tl$[{"id": "a", "label": "burning toast"}, {"id": "b", "label": "baking bread"}, {"id": "c", "label": "melting butter, then cooling it"}, {"id": "d", "label": "frying an egg"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Burning wood turns it into ash and smoke. This change is:$tl$, $tl$[{"id": "a", "label": "easy to undo"}, {"id": "b", "label": "not reversible"}, {"id": "c", "label": "make new wood"}, {"id": "d", "label": "reversible"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Mixing sand and water, then letting it dry, can:$tl$, $tl$[{"id": "a", "label": "make gold"}, {"id": "b", "label": "make glass instantly"}, {"id": "c", "label": "separate them again"}, {"id": "d", "label": "never separate"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Heating chocolate makes it:$tl$, $tl$[{"id": "a", "label": "freeze"}, {"id": "b", "label": "melt"}, {"id": "c", "label": "turn to wood"}, {"id": "d", "label": "disappear"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a change you CANNOT easily undo?$tl$, $tl$[{"id": "a", "label": "melting an ice cube"}, {"id": "b", "label": "cooking an egg"}, {"id": "c", "label": "freezing water"}, {"id": "d", "label": "folding paper"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$When you cool melted wax, it:$tl$, $tl$[{"id": "a", "label": "stays liquid forever"}, {"id": "b", "label": "becomes solid again"}, {"id": "c", "label": "turns to water"}, {"id": "d", "label": "vanishes"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Stretching and squishing clay changes its:$tl$, $tl$[{"id": "a", "label": "material to metal"}, {"id": "b", "label": "shape, not its material"}, {"id": "c", "label": "color to blue"}, {"id": "d", "label": "weight a lot"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Toasting bread is a change that is:$tl$, $tl$[{"id": "a", "label": "easy to undo"}, {"id": "b", "label": "reversible"}, {"id": "c", "label": "hard to undo"}, {"id": "d", "label": "make new bread"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ice, water, and steam are all forms of the same:$tl$, $tl$[{"id": "a", "label": "metal"}, {"id": "b", "label": "wood"}, {"id": "c", "label": "material (water)"}, {"id": "d", "label": "plastic"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Folding a paper airplane changes its:$tl$, $tl$[{"id": "a", "label": "shape"}, {"id": "b", "label": "material"}, {"id": "c", "label": "color"}, {"id": "d", "label": "weight a lot"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Melting then freezing water can be repeated, so it is a ____ change. (one word)$tl$, null, $tl$reversible$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which uses heat to change a material?$tl$, $tl$[{"id": "a", "label": "folding a towel"}, {"id": "b", "label": "baking cookies"}, {"id": "c", "label": "stacking blocks"}, {"id": "d", "label": "cutting paper"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A melted crayon that hardens again shows a change that is:$tl$, $tl$[{"id": "a", "label": "impossible"}, {"id": "b", "label": "not reversible"}, {"id": "c", "label": "reversible"}, {"id": "d", "label": "magic only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Mixing flour, water, and heat to bake bread is:$tl$, $tl$[{"id": "a", "label": "not easily reversible"}, {"id": "b", "label": "easy to undo"}, {"id": "c", "label": "reversible"}, {"id": "d", "label": "make raw flour back"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Breaking a plate changes its shape and is:$tl$, $tl$[{"id": "a", "label": "easy to undo"}, {"id": "b", "label": "reversible"}, {"id": "c", "label": "hard to undo"}, {"id": "d", "label": "make a new plate"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$changing-materials$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] What Plants Need (2-LS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plants-need-sun-and-water$tl$, $tl$What Plants Need$tl$, $tl$Plants need water and sunlight to grow and make their own food.$tl$, 2, $tl$2-LS2-1$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: What Plants Need$tl$, 2, $tl$[{"type": "explain", "title": "About: What Plants Need", "body": "Plants need water and sunlight to grow and make their own food."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: To grow well, plants need water, air, and:  The correct answer is \"sunlight\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A plant kept in a dark closet with no light will:", "choices": [{"id": "a", "label": "grow super fast"}, {"id": "b", "label": "grow poorly or die"}, {"id": "c", "label": "turn into an animal"}, {"id": "d", "label": "make light"}], "answer": "b", "explanation": "The correct answer is \"grow poorly or die\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$To grow well, plants need water, air, and:$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "candy"}, {"id": "c", "label": "toys"}, {"id": "d", "label": "darkness"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A plant kept in a dark closet with no light will:$tl$, $tl$[{"id": "a", "label": "grow super fast"}, {"id": "b", "label": "grow poorly or die"}, {"id": "c", "label": "turn into an animal"}, {"id": "d", "label": "make light"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Plants take in water mostly through their:$tl$, $tl$[{"id": "a", "label": "flowers"}, {"id": "b", "label": "petals"}, {"id": "c", "label": "roots"}, {"id": "d", "label": "leaves only"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Leaves use sunlight to help make the plant's:$tl$, $tl$[{"id": "a", "label": "food"}, {"id": "b", "label": "roots"}, {"id": "c", "label": "soil"}, {"id": "d", "label": "rocks"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$If you never water a plant, it will:$tl$, $tl$[{"id": "a", "label": "dry out and wilt"}, {"id": "b", "label": "grow taller"}, {"id": "c", "label": "turn blue"}, {"id": "d", "label": "make rain"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which two things does a plant need from its surroundings?$tl$, $tl$[{"id": "a", "label": "candy and toys"}, {"id": "b", "label": "water and sunlight"}, {"id": "c", "label": "TV and music"}, {"id": "d", "label": "plastic and metal"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Where do most plants get the water they need?$tl$, $tl$[{"id": "a", "label": "from the sky directly into leaves only"}, {"id": "b", "label": "from the soil"}, {"id": "c", "label": "from rocks"}, {"id": "d", "label": "from animals"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A seed needs warmth and ____ to start growing.$tl$, $tl$[{"id": "a", "label": "soda"}, {"id": "b", "label": "water"}, {"id": "c", "label": "sand only"}, {"id": "d", "label": "darkness forever"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Sunlight helps a plant's leaves to:$tl$, $tl$[{"id": "a", "label": "make sound"}, {"id": "b", "label": "make rocks"}, {"id": "c", "label": "make food (photosynthesis)"}, {"id": "d", "label": "make rain"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two plants, one in sun and one in a dark box: which grows better?$tl$, $tl$[{"id": "a", "label": "the one in the dark"}, {"id": "b", "label": "both die"}, {"id": "c", "label": "the one in the sun"}, {"id": "d", "label": "both grow the same"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Besides water and light, plants also need:$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "plastic"}, {"id": "c", "label": "air"}, {"id": "d", "label": "toys"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Over-watering or no water can both:$tl$, $tl$[{"id": "a", "label": "help a plant"}, {"id": "b", "label": "make it fly"}, {"id": "c", "label": "harm a plant"}, {"id": "d", "label": "change its species"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A wilted, droopy plant most likely needs:$tl$, $tl$[{"id": "a", "label": "less light always"}, {"id": "b", "label": "candy"}, {"id": "c", "label": "a toy"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Plants are different from animals because plants can:$tl$, $tl$[{"id": "a", "label": "walk around"}, {"id": "b", "label": "eat other plants only"}, {"id": "c", "label": "fly"}, {"id": "d", "label": "make their own food"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would help a houseplant grow?$tl$, $tl$[{"id": "a", "label": "putting it in a dark closet"}, {"id": "b", "label": "never watering it"}, {"id": "c", "label": "feeding it candy"}, {"id": "d", "label": "placing it near a sunny window and watering it"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Besides water and air, plants need ____ to make food. (one word)$tl$, null, $tl$sunlight$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Roots hold a plant in the soil and take in:$tl$, $tl$[{"id": "a", "label": "sound"}, {"id": "b", "label": "light"}, {"id": "c", "label": "wind"}, {"id": "d", "label": "water and nutrients"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is NOT something a plant needs to grow?$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "water"}, {"id": "c", "label": "sunlight"}, {"id": "d", "label": "air"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Farmers water their crops so the plants can:$tl$, $tl$[{"id": "a", "label": "sleep"}, {"id": "b", "label": "fly"}, {"id": "c", "label": "sing"}, {"id": "d", "label": "grow"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$On a sunny day, leaves are busy making:$tl$, $tl$[{"id": "a", "label": "noise"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "food for the plant"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$plants-need-sun-and-water$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Seeds & Pollination (2-LS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$seeds-and-pollination$tl$, $tl$Seeds & Pollination$tl$, $tl$Animals and wind help plants by moving pollen and spreading seeds to new places.$tl$, 2, $tl$2-LS2-2$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Seeds & Pollination$tl$, 2, $tl$[{"type": "explain", "title": "About: Seeds & Pollination", "body": "Animals and wind help plants by moving pollen and spreading seeds to new places."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Many plants make ____ that can grow into new plants.  The correct answer is \"seeds\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Bees help plants by moving:", "choices": [{"id": "a", "label": "rocks"}, {"id": "b", "label": "pollen from flower to flower"}, {"id": "c", "label": "water only"}, {"id": "d", "label": "soil"}], "answer": "b", "explanation": "The correct answer is \"pollen from flower to flower\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Many plants make ____ that can grow into new plants.$tl$, $tl$[{"id": "a", "label": "seeds"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "cups"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Bees help plants by moving:$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "pollen from flower to flower"}, {"id": "c", "label": "water only"}, {"id": "d", "label": "soil"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Moving pollen between flowers is called:$tl$, $tl$[{"id": "a", "label": "pollination"}, {"id": "b", "label": "erosion"}, {"id": "c", "label": "melting"}, {"id": "d", "label": "evaporation"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Some seeds are spread by sticking to animal:$tl$, $tl$[{"id": "a", "label": "teeth"}, {"id": "b", "label": "fur"}, {"id": "c", "label": "eyes"}, {"id": "d", "label": "ears only"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A dandelion's fluffy seeds are spread by the:$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "fire"}, {"id": "c", "label": "Moon"}, {"id": "d", "label": "wind"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$When an animal eats a fruit, it can spread the:$tl$, $tl$[{"id": "a", "label": "leaves"}, {"id": "b", "label": "roots"}, {"id": "c", "label": "petals"}, {"id": "d", "label": "seeds inside"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Why are flowers often brightly colored?$tl$, $tl$[{"id": "a", "label": "to scare the Sun"}, {"id": "b", "label": "to make rain"}, {"id": "c", "label": "to stay cold"}, {"id": "d", "label": "to attract pollinators like bees"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A coconut can float across water to a new beach to:$tl$, $tl$[{"id": "a", "label": "grow a new plant"}, {"id": "b", "label": "catch fish"}, {"id": "c", "label": "make sand"}, {"id": "d", "label": "cool the ocean"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which animal is a common pollinator?$tl$, $tl$[{"id": "a", "label": "a shark"}, {"id": "b", "label": "a butterfly"}, {"id": "c", "label": "a polar bear"}, {"id": "d", "label": "a worm in the deep soil"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Seeds spread to new places so plants can:$tl$, $tl$[{"id": "a", "label": "stay all in one spot"}, {"id": "b", "label": "make noise"}, {"id": "c", "label": "fly away forever"}, {"id": "d", "label": "grow where there is room"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A burr seed has tiny hooks so it can:$tl$, $tl$[{"id": "a", "label": "float on water"}, {"id": "b", "label": "glow"}, {"id": "c", "label": "sing"}, {"id": "d", "label": "stick to fur and clothes"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Pollen is a tiny powder made by:$tl$, $tl$[{"id": "a", "label": "flowers"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "clouds"}, {"id": "d", "label": "animals"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Maple 'helicopter' seeds spin and are carried by the:$tl$, $tl$[{"id": "a", "label": "wind"}, {"id": "b", "label": "river"}, {"id": "c", "label": "fire"}, {"id": "d", "label": "Sun"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Plants that make sweet nectar attract bees, which then carry:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "rocks"}, {"id": "c", "label": "leaves"}, {"id": "d", "label": "pollen"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Without pollination, many plants could not make:$tl$, $tl$[{"id": "a", "label": "seeds and fruit"}, {"id": "b", "label": "leaves"}, {"id": "c", "label": "roots"}, {"id": "d", "label": "stems"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Moving pollen from flower to flower is called ____. (one word)$tl$, null, $tl$pollination$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Birds can help spread seeds when they:$tl$, $tl$[{"id": "a", "label": "build nests"}, {"id": "b", "label": "sing"}, {"id": "c", "label": "fly south only"}, {"id": "d", "label": "eat berries and drop the seeds elsewhere"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which helps seeds travel far?$tl$, $tl$[{"id": "a", "label": "wind, water, and animals"}, {"id": "b", "label": "staying still"}, {"id": "c", "label": "sunlight only"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A flower's job is mostly to help the plant make:$tl$, $tl$[{"id": "a", "label": "soil"}, {"id": "b", "label": "seeds"}, {"id": "c", "label": "rocks"}, {"id": "d", "label": "rain"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$If seeds all fell right under the parent plant, the new plants might:$tl$, $tl$[{"id": "a", "label": "grow better"}, {"id": "b", "label": "fly away"}, {"id": "c", "label": "be too crowded"}, {"id": "d", "label": "turn to rock"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$seeds-and-pollination$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Habitats & Diversity (2-LS4-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$habitats-and-diversity$tl$, $tl$Habitats & Diversity$tl$, $tl$Different habitats are home to many different kinds of plants and animals.$tl$, 2, $tl$2-LS4-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Habitats & Diversity$tl$, 2, $tl$[{"type": "explain", "title": "About: Habitats & Diversity", "body": "Different habitats are home to many different kinds of plants and animals."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: The natural home of a living thing is its:  The correct answer is \"habitat\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which animal best fits a desert habitat?", "choices": [{"id": "a", "label": "a polar bear"}, {"id": "b", "label": "a lizard"}, {"id": "c", "label": "a whale"}, {"id": "d", "label": "a penguin"}], "answer": "b", "explanation": "The correct answer is \"a lizard\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The natural home of a living thing is its:$tl$, $tl$[{"id": "a", "label": "hobby"}, {"id": "b", "label": "habitat"}, {"id": "c", "label": "schedule"}, {"id": "d", "label": "color"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which animal best fits a desert habitat?$tl$, $tl$[{"id": "a", "label": "a polar bear"}, {"id": "b", "label": "a lizard"}, {"id": "c", "label": "a whale"}, {"id": "d", "label": "a penguin"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which animal best fits a cold, icy habitat?$tl$, $tl$[{"id": "a", "label": "a camel"}, {"id": "b", "label": "a parrot"}, {"id": "c", "label": "a polar bear"}, {"id": "d", "label": "a cactus"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A pond habitat is home to:$tl$, $tl$[{"id": "a", "label": "frogs and fish"}, {"id": "b", "label": "camels"}, {"id": "c", "label": "polar bears"}, {"id": "d", "label": "lions"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Different habitats are home to different kinds of:$tl$, $tl$[{"id": "a", "label": "cars"}, {"id": "b", "label": "plants and animals"}, {"id": "c", "label": "toys"}, {"id": "d", "label": "phones"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A rainforest habitat is:$tl$, $tl$[{"id": "a", "label": "cold and dry"}, {"id": "b", "label": "sandy and dry"}, {"id": "c", "label": "icy"}, {"id": "d", "label": "warm and very rainy"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Many different kinds of living things in one place shows:$tl$, $tl$[{"id": "a", "label": "sameness"}, {"id": "b", "label": "emptiness"}, {"id": "c", "label": "diversity"}, {"id": "d", "label": "silence"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A cactus is well-suited to live in the:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "arctic"}, {"id": "d", "label": "deep cave"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$An ocean habitat is home to:$tl$, $tl$[{"id": "a", "label": "lions"}, {"id": "b", "label": "camels"}, {"id": "c", "label": "fish, crabs, and whales"}, {"id": "d", "label": "squirrels"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Animals live in a habitat that gives them:$tl$, $tl$[{"id": "a", "label": "homework"}, {"id": "b", "label": "money"}, {"id": "c", "label": "food, water, and shelter"}, {"id": "d", "label": "toys"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which habitat would have lots of tall trees?$tl$, $tl$[{"id": "a", "label": "a forest"}, {"id": "b", "label": "a desert"}, {"id": "c", "label": "the open ocean"}, {"id": "d", "label": "the arctic ice"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A worm's habitat is usually:$tl$, $tl$[{"id": "a", "label": "in the soil"}, {"id": "b", "label": "high in the sky"}, {"id": "c", "label": "in fire"}, {"id": "d", "label": "on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$More kinds of plants and animals usually live in a habitat that has:$tl$, $tl$[{"id": "a", "label": "no water"}, {"id": "b", "label": "no plants"}, {"id": "c", "label": "plenty of food and water"}, {"id": "d", "label": "only ice"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would you most likely find in a meadow habitat?$tl$, $tl$[{"id": "a", "label": "sharks"}, {"id": "b", "label": "penguins"}, {"id": "c", "label": "grasses and butterflies"}, {"id": "d", "label": "cactus only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A habitat where it is dark, damp, and rocky might be a:$tl$, $tl$[{"id": "a", "label": "sunny beach"}, {"id": "b", "label": "cave"}, {"id": "c", "label": "grassy field"}, {"id": "d", "label": "tree top"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$The natural home of a plant or animal is its ____. (one word)$tl$, null, $tl$habitat$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which animals would share a forest habitat?$tl$, $tl$[{"id": "a", "label": "whales and sharks"}, {"id": "b", "label": "camels and lizards"}, {"id": "c", "label": "penguins and seals"}, {"id": "d", "label": "deer, owls, and squirrels"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Diversity is good for a habitat because it:$tl$, $tl$[{"id": "a", "label": "helps many living things survive together"}, {"id": "b", "label": "makes everything the same"}, {"id": "c", "label": "removes all plants"}, {"id": "d", "label": "empties the area"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A fish moved from the ocean to a desert would:$tl$, $tl$[{"id": "a", "label": "thrive"}, {"id": "b", "label": "grow legs instantly"}, {"id": "c", "label": "become a plant"}, {"id": "d", "label": "not survive"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Frogs live near ponds because they need:$tl$, $tl$[{"id": "a", "label": "water"}, {"id": "b", "label": "sand"}, {"id": "c", "label": "ice"}, {"id": "d", "label": "fire"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$habitats-and-diversity$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Fast & Slow Earth Changes (2-ESS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$fast-and-slow-earth-changes$tl$, $tl$Fast & Slow Earth Changes$tl$, $tl$Some land changes happen quickly (volcanoes, floods) and some slowly (erosion).$tl$, 2, $tl$2-ESS1-1$tl$, 7
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Fast & Slow Earth Changes$tl$, 2, $tl$[{"type": "explain", "title": "About: Fast & Slow Earth Changes", "body": "Some land changes happen quickly (volcanoes, floods) and some slowly (erosion)."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which change to the land happens FAST?  The correct answer is \"a volcano erupting\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which change to the land happens SLOWLY?", "choices": [{"id": "a", "label": "a canyon being carved by a river"}, {"id": "b", "label": "an earthquake"}, {"id": "c", "label": "a landslide"}, {"id": "d", "label": "a volcano erupting"}], "answer": "a", "explanation": "The correct answer is \"a canyon being carved by a river\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which change to the land happens FAST?$tl$, $tl$[{"id": "a", "label": "a canyon forming over years"}, {"id": "b", "label": "a mountain wearing down"}, {"id": "c", "label": "a hill slowly eroding"}, {"id": "d", "label": "a volcano erupting"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which change to the land happens SLOWLY?$tl$, $tl$[{"id": "a", "label": "a canyon being carved by a river"}, {"id": "b", "label": "an earthquake"}, {"id": "c", "label": "a landslide"}, {"id": "d", "label": "a volcano erupting"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$An earthquake changes the land:$tl$, $tl$[{"id": "a", "label": "quickly"}, {"id": "b", "label": "over a million years"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only in winter"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Water slowly wearing away rock over many years is:$tl$, $tl$[{"id": "a", "label": "slow erosion"}, {"id": "b", "label": "a fast flood"}, {"id": "c", "label": "an earthquake"}, {"id": "d", "label": "a volcano"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A sudden flood can change the land:$tl$, $tl$[{"id": "a", "label": "very slowly"}, {"id": "b", "label": "quickly"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only at night"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Wind slowly shaping a sand dune is a change that is:$tl$, $tl$[{"id": "a", "label": "slow"}, {"id": "b", "label": "instant"}, {"id": "c", "label": "explosive"}, {"id": "d", "label": "loud"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A landslide moves rock and soil:$tl$, $tl$[{"id": "a", "label": "quickly"}, {"id": "b", "label": "over centuries"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only in summer"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The Grand Canyon was carved by a river over a very:$tl$, $tl$[{"id": "a", "label": "long time (slow)"}, {"id": "b", "label": "short time (fast)"}, {"id": "c", "label": "single day"}, {"id": "d", "label": "single hour"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FAST event?$tl$, $tl$[{"id": "a", "label": "weathering of a cliff"}, {"id": "b", "label": "a volcano erupting"}, {"id": "c", "label": "a slowly growing delta"}, {"id": "d", "label": "a slowly forming cave"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Rocks slowly cracking from freezing water is a:$tl$, $tl$[{"id": "a", "label": "fast change"}, {"id": "b", "label": "slow change"}, {"id": "c", "label": "an instant event"}, {"id": "d", "label": "a loud blast"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which would you NOT notice happening in a single day?$tl$, $tl$[{"id": "a", "label": "a volcano erupting"}, {"id": "b", "label": "an earthquake"}, {"id": "c", "label": "a mountain wearing down"}, {"id": "d", "label": "a flash flood"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ocean waves slowly wearing away a cliff is:$tl$, $tl$[{"id": "a", "label": "a fast eruption"}, {"id": "b", "label": "slow erosion"}, {"id": "c", "label": "an earthquake"}, {"id": "d", "label": "a landslide"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A big storm can change a beach:$tl$, $tl$[{"id": "a", "label": "quickly"}, {"id": "b", "label": "over a million years"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which change takes the longest?$tl$, $tl$[{"id": "a", "label": "a deep canyon forming"}, {"id": "b", "label": "a rockslide"}, {"id": "c", "label": "a flood"}, {"id": "d", "label": "a volcano blast"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Scientists know some land changes are slow because they take:$tl$, $tl$[{"id": "a", "label": "many, many years"}, {"id": "b", "label": "a few seconds"}, {"id": "c", "label": "one minute"}, {"id": "d", "label": "no time"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$An event like a volcano changes the land very ____ (quickly or slowly?). $tl$, null, $tl$quickly$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A new island can form from a volcano:$tl$, $tl$[{"id": "a", "label": "over a billion years only"}, {"id": "b", "label": "fairly quickly"}, {"id": "c", "label": "never"}, {"id": "d", "label": "by magic"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Soil slowly building up to form rich farmland is a:$tl$, $tl$[{"id": "a", "label": "slow change"}, {"id": "b", "label": "fast change"}, {"id": "c", "label": "an explosion"}, {"id": "d", "label": "an earthquake"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is the best example of a sudden, fast change?$tl$, $tl$[{"id": "a", "label": "an earthquake"}, {"id": "b", "label": "weathering"}, {"id": "c", "label": "slow erosion"}, {"id": "d", "label": "a growing sand dune"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Both fast and slow events can change:$tl$, $tl$[{"id": "a", "label": "the shape of the land"}, {"id": "b", "label": "the alphabet"}, {"id": "c", "label": "math facts"}, {"id": "d", "label": "the days of the week"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$fast-and-slow-earth-changes$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Landforms & Maps (2-ESS2-2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$landforms-and-maps$tl$, $tl$Landforms & Maps$tl$, $tl$Earth has mountains, valleys, rivers, and oceans, and maps show where they are.$tl$, 2, $tl$2-ESS2-2$tl$, 8
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Landforms & Maps$tl$, 2, $tl$[{"type": "explain", "title": "About: Landforms & Maps", "body": "Earth has mountains, valleys, rivers, and oceans, and maps show where they are."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: A tall landform that rises high above the land is a:  The correct answer is \"mountain\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "A large body of salt water is an:", "choices": [{"id": "a", "label": "ocean"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "desert"}, {"id": "d", "label": "hill"}], "answer": "a", "explanation": "The correct answer is \"ocean\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A tall landform that rises high above the land is a:$tl$, $tl$[{"id": "a", "label": "valley"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A large body of salt water is an:$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "desert"}, {"id": "d", "label": "hill"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A map uses symbols and a key to show:$tl$, $tl$[{"id": "a", "label": "the future"}, {"id": "b", "label": "places and land features"}, {"id": "c", "label": "sounds"}, {"id": "d", "label": "smells"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A low area of land between mountains is a:$tl$, $tl$[{"id": "a", "label": "peak"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "cliff"}, {"id": "d", "label": "plateau"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A flat, wide area of land is a:$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "plain"}, {"id": "c", "label": "canyon"}, {"id": "d", "label": "volcano"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$On many maps, which direction is at the top?$tl$, $tl$[{"id": "a", "label": "south"}, {"id": "b", "label": "north"}, {"id": "c", "label": "east"}, {"id": "d", "label": "down"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A model of Earth shaped like a ball is a:$tl$, $tl$[{"id": "a", "label": "map key"}, {"id": "b", "label": "globe"}, {"id": "c", "label": "ruler"}, {"id": "d", "label": "clock"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Fresh water flowing across the land is a:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "plateau"}, {"id": "c", "label": "river"}, {"id": "d", "label": "dune"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A dry area that gets very little rain is a:$tl$, $tl$[{"id": "a", "label": "desert"}, {"id": "b", "label": "rainforest"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "swamp"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The map key (legend) helps you understand the map's:$tl$, $tl$[{"id": "a", "label": "price"}, {"id": "b", "label": "symbols"}, {"id": "c", "label": "weight"}, {"id": "d", "label": "sound"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A piece of land with water all around it is an:$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "island"}, {"id": "d", "label": "plain"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A small raised landform, lower than a mountain, is a:$tl$, $tl$[{"id": "a", "label": "hill"}, {"id": "b", "label": "ocean"}, {"id": "c", "label": "valley"}, {"id": "d", "label": "sea"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which tool would best help you find your way in a new place?$tl$, $tl$[{"id": "a", "label": "a clock"}, {"id": "b", "label": "a thermometer"}, {"id": "c", "label": "a map"}, {"id": "d", "label": "a scale"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A deep, narrow valley with steep sides is a:$tl$, $tl$[{"id": "a", "label": "plain"}, {"id": "b", "label": "hill"}, {"id": "c", "label": "beach"}, {"id": "d", "label": "canyon"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Mountains found in a long line together form a:$tl$, $tl$[{"id": "a", "label": "lake"}, {"id": "b", "label": "bay"}, {"id": "c", "label": "mountain range"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$A model of the Earth shaped like a ball is called a ____. (one word)$tl$, null, $tl$globe$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which landform is made of moving ice?$tl$, $tl$[{"id": "a", "label": "a desert"}, {"id": "b", "label": "a plain"}, {"id": "c", "label": "a meadow"}, {"id": "d", "label": "a glacier"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The place where land meets the ocean is the:$tl$, $tl$[{"id": "a", "label": "peak"}, {"id": "b", "label": "valley"}, {"id": "c", "label": "coast"}, {"id": "d", "label": "plateau"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Maps can show where rivers, mountains, and ____ are.$tl$, $tl$[{"id": "a", "label": "cities"}, {"id": "b", "label": "feelings"}, {"id": "c", "label": "sounds"}, {"id": "d", "label": "smells"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A high, flat landform with steep sides is a:$tl$, $tl$[{"id": "a", "label": "valley"}, {"id": "b", "label": "plateau"}, {"id": "c", "label": "canyon"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$landforms-and-maps$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Water on Earth (2-ESS2-3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$water-on-earth$tl$, $tl$Water on Earth$tl$, $tl$Water is found in oceans, lakes, rivers, ice, and underground; ocean water is salty.$tl$, 2, $tl$2-ESS2-3$tl$, 9
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Water on Earth$tl$, 2, $tl$[{"type": "explain", "title": "About: Water on Earth", "body": "Water is found in oceans, lakes, rivers, ice, and underground; ocean water is salty."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Most of the water on Earth is found in the:  The correct answer is \"oceans\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Ocean water is:", "choices": [{"id": "a", "label": "fresh and sweet"}, {"id": "b", "label": "made of juice"}, {"id": "c", "label": "not real water"}, {"id": "d", "label": "salty"}], "answer": "d", "explanation": "The correct answer is \"salty\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Most of the water on Earth is found in the:$tl$, $tl$[{"id": "a", "label": "rivers"}, {"id": "b", "label": "oceans"}, {"id": "c", "label": "ponds"}, {"id": "d", "label": "puddles"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ocean water is:$tl$, $tl$[{"id": "a", "label": "fresh and sweet"}, {"id": "b", "label": "made of juice"}, {"id": "c", "label": "not real water"}, {"id": "d", "label": "salty"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which holds fresh water we can drink?$tl$, $tl$[{"id": "a", "label": "the salty ocean"}, {"id": "b", "label": "a lake or river"}, {"id": "c", "label": "a sand dune"}, {"id": "d", "label": "a rock"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Frozen water at the cold poles is found as:$tl$, $tl$[{"id": "a", "label": "sand"}, {"id": "b", "label": "soil"}, {"id": "c", "label": "steam"}, {"id": "d", "label": "ice"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a body of fresh water?$tl$, $tl$[{"id": "a", "label": "the ocean"}, {"id": "b", "label": "a sea"}, {"id": "c", "label": "a pond"}, {"id": "d", "label": "a salty bay"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Water in the sky inside clouds is made of tiny:$tl$, $tl$[{"id": "a", "label": "rocks"}, {"id": "b", "label": "water droplets"}, {"id": "c", "label": "sand"}, {"id": "d", "label": "smoke"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A small stream of water flowing to a river is a:$tl$, $tl$[{"id": "a", "label": "creek (stream)"}, {"id": "b", "label": "desert"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "dune"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Glaciers are large amounts of water in the form of:$tl$, $tl$[{"id": "a", "label": "steam"}, {"id": "b", "label": "liquid juice"}, {"id": "c", "label": "sand"}, {"id": "d", "label": "ice"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which has fresh water, not salt water?$tl$, $tl$[{"id": "a", "label": "a river"}, {"id": "b", "label": "the ocean"}, {"id": "c", "label": "a salty sea"}, {"id": "d", "label": "ocean spray"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Where can you find water underground?$tl$, $tl$[{"id": "a", "label": "in wells and underground layers"}, {"id": "b", "label": "only in the sky"}, {"id": "c", "label": "only in fire"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Most of Earth's surface is covered by:$tl$, $tl$[{"id": "a", "label": "sand"}, {"id": "b", "label": "forests"}, {"id": "c", "label": "ice only"}, {"id": "d", "label": "water"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is the largest body of water?$tl$, $tl$[{"id": "a", "label": "a pond"}, {"id": "b", "label": "an ocean"}, {"id": "c", "label": "a puddle"}, {"id": "d", "label": "a cup"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Rain that falls and collects can form a:$tl$, $tl$[{"id": "a", "label": "lake"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "desert"}, {"id": "d", "label": "volcano"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Living things need fresh water to:$tl$, $tl$[{"id": "a", "label": "build cars"}, {"id": "b", "label": "make plastic"}, {"id": "c", "label": "drink and survive"}, {"id": "d", "label": "do math"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ice caps and glaciers store water as:$tl$, $tl$[{"id": "a", "label": "salty liquid"}, {"id": "b", "label": "solid ice"}, {"id": "c", "label": "steam"}, {"id": "d", "label": "sand"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Ocean water tastes ____ because it has salt in it. (one word)$tl$, null, $tl$salty$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which one is fresh water people often drink?$tl$, $tl$[{"id": "a", "label": "ocean water"}, {"id": "b", "label": "sea water"}, {"id": "c", "label": "river or lake water (cleaned)"}, {"id": "d", "label": "salty bay water"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Water can be found on Earth as a solid, a liquid, and a:$tl$, $tl$[{"id": "a", "label": "rock"}, {"id": "b", "label": "metal"}, {"id": "c", "label": "gas"}, {"id": "d", "label": "plant"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A large area of salty water smaller than an ocean is a:$tl$, $tl$[{"id": "a", "label": "sea"}, {"id": "b", "label": "pond"}, {"id": "c", "label": "creek"}, {"id": "d", "label": "puddle"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Why is fresh water important?$tl$, $tl$[{"id": "a", "label": "it is for swimming only"}, {"id": "b", "label": "it has no use"}, {"id": "c", "label": "living things need it to live"}, {"id": "d", "label": "it is only for boats"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$water-on-earth$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [science] Wind & Water Shape Land (2-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$wind-and-water-shape-land$tl$, $tl$Wind & Water Shape Land$tl$, $tl$Wind and water slowly wear away and move soil and rock, changing the land.$tl$, 2, $tl$2-ESS2-1$tl$, 10
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Wind & Water Shape Land$tl$, 2, $tl$[{"type": "explain", "title": "About: Wind & Water Shape Land", "body": "Wind and water slowly wear away and move soil and rock, changing the land."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Moving water can carry away soil and sand. This is:  The correct answer is \"erosion\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Wind can shape the land by moving:", "choices": [{"id": "a", "label": "mountains overnight"}, {"id": "b", "label": "sand into dunes"}, {"id": "c", "label": "oceans"}, {"id": "d", "label": "cities"}], "answer": "b", "explanation": "The correct answer is \"sand into dunes\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Moving water can carry away soil and sand. This is:$tl$, $tl$[{"id": "a", "label": "evaporation"}, {"id": "b", "label": "reflection"}, {"id": "c", "label": "erosion"}, {"id": "d", "label": "vibration"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Wind can shape the land by moving:$tl$, $tl$[{"id": "a", "label": "mountains overnight"}, {"id": "b", "label": "sand into dunes"}, {"id": "c", "label": "oceans"}, {"id": "d", "label": "cities"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A river slowly carving a path through rock makes a:$tl$, $tl$[{"id": "a", "label": "mountain peak"}, {"id": "b", "label": "sand dune"}, {"id": "c", "label": "canyon or valley"}, {"id": "d", "label": "cloud"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Ocean waves hitting a cliff cause the cliff to:$tl$, $tl$[{"id": "a", "label": "grow taller"}, {"id": "b", "label": "get colder"}, {"id": "c", "label": "turn to metal"}, {"id": "d", "label": "wear away"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which slows down soil erosion on a hill?$tl$, $tl$[{"id": "a", "label": "removing all plants"}, {"id": "b", "label": "planting grass and trees"}, {"id": "c", "label": "adding loose sand"}, {"id": "d", "label": "pouring more water"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$When a river drops the sand it carried, it builds up:$tl$, $tl$[{"id": "a", "label": "new land (deposition)"}, {"id": "b", "label": "a mountain instantly"}, {"id": "c", "label": "a cloud"}, {"id": "d", "label": "a canyon"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Smooth, rounded pebbles in a stream got that way from:$tl$, $tl$[{"id": "a", "label": "being painted"}, {"id": "b", "label": "melting"}, {"id": "c", "label": "freezing once"}, {"id": "d", "label": "being tumbled by water"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Strong wind in a desert can create:$tl$, $tl$[{"id": "a", "label": "sand dunes"}, {"id": "b", "label": "rivers"}, {"id": "c", "label": "glaciers"}, {"id": "d", "label": "forests"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which two things commonly shape the land over time?$tl$, $tl$[{"id": "a", "label": "sound and light"}, {"id": "b", "label": "wind and water"}, {"id": "c", "label": "cars and roads"}, {"id": "d", "label": "stars and the Moon"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$People can reduce erosion near rivers by planting:$tl$, $tl$[{"id": "a", "label": "plants along the banks"}, {"id": "b", "label": "nothing"}, {"id": "c", "label": "more sand"}, {"id": "d", "label": "plastic"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Rushing flood water can change the land:$tl$, $tl$[{"id": "a", "label": "over a million years"}, {"id": "b", "label": "quickly"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only at night"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A delta is new land built where a river drops its:$tl$, $tl$[{"id": "a", "label": "water only"}, {"id": "b", "label": "sediment (sand and soil)"}, {"id": "c", "label": "ice"}, {"id": "d", "label": "rocks from space"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Wind blowing sand against rock can slowly:$tl$, $tl$[{"id": "a", "label": "build a mountain"}, {"id": "b", "label": "make it grow"}, {"id": "c", "label": "cool the Sun"}, {"id": "d", "label": "wear it down"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which helps protect a beach from washing away?$tl$, $tl$[{"id": "a", "label": "removing all sand"}, {"id": "b", "label": "adding more waves"}, {"id": "c", "label": "plants and barriers"}, {"id": "d", "label": "nothing at all"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Most changes from wind and water happen:$tl$, $tl$[{"id": "a", "label": "slowly over time (but floods are fast)"}, {"id": "b", "label": "only in one second always"}, {"id": "c", "label": "never"}, {"id": "d", "label": "only on the Moon"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Wind and water carrying away soil and rock is called ____. (one word)$tl$, null, $tl$erosion$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A canyon shows that water can:$tl$, $tl$[{"id": "a", "label": "build mountains fast"}, {"id": "b", "label": "freeze instantly"}, {"id": "c", "label": "make sound"}, {"id": "d", "label": "cut through rock over a long time"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Sand at the beach was once mostly:$tl$, $tl$[{"id": "a", "label": "bigger rocks worn down"}, {"id": "b", "label": "made by animals"}, {"id": "c", "label": "fallen from the sky"}, {"id": "d", "label": "grown from seeds"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$To keep soil from washing away, farmers can:$tl$, $tl$[{"id": "a", "label": "remove all plants"}, {"id": "b", "label": "pour water on it"}, {"id": "c", "label": "plant cover crops and trees"}, {"id": "d", "label": "add loose sand"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Both wind and water can change the shape of:$tl$, $tl$[{"id": "a", "label": "the alphabet"}, {"id": "b", "label": "the land"}, {"id": "c", "label": "numbers"}, {"id": "d", "label": "the days"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$wind-and-water-shape-land$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Main Idea (RI.2.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$main-idea$tl$, $tl$Main Idea$tl$, $tl$The main idea is the most important point a text makes.$tl$, 2, $tl$RI.2.2$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Main Idea$tl$, 2, $tl$[{"type": "explain", "title": "About: Main Idea", "body": "The main idea is the most important point a text makes."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Honeybees are helpful. They make honey and help flowers grow by moving pollen.\" The main idea is that honeybees:  The correct answer is \"are helpful\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Recycling is good. It saves trees, uses less energy, and keeps trash out of landfills.\" The main idea is that recycling:", "choices": [{"id": "a", "label": "is hard"}, {"id": "b", "label": "is colorful"}, {"id": "c", "label": "is good for the Earth"}, {"id": "d", "label": "takes time"}], "answer": "c", "explanation": "The correct answer is \"is good for the Earth\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Honeybees are helpful. They make honey and help flowers grow by moving pollen." The main idea is that honeybees:$tl$, $tl$[{"id": "a", "label": "are scary"}, {"id": "b", "label": "are loud"}, {"id": "c", "label": "are tiny"}, {"id": "d", "label": "are helpful"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Recycling is good. It saves trees, uses less energy, and keeps trash out of landfills." The main idea is that recycling:$tl$, $tl$[{"id": "a", "label": "is hard"}, {"id": "b", "label": "is colorful"}, {"id": "c", "label": "is good for the Earth"}, {"id": "d", "label": "takes time"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Penguins stay warm with thick feathers, a layer of fat, and by huddling together." The passage is mostly about how penguins:$tl$, $tl$[{"id": "a", "label": "catch fish"}, {"id": "b", "label": "stay warm"}, {"id": "c", "label": "swim fast"}, {"id": "d", "label": "build nests"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Our class garden grew well. We planted seeds, watered them, and pulled weeds." The main idea is that the class:$tl$, $tl$[{"id": "a", "label": "grew a garden"}, {"id": "b", "label": "went on a trip"}, {"id": "c", "label": "had a party"}, {"id": "d", "label": "read books"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Firefighters are brave. They put out fires, rescue people, and teach safety." The main idea is that firefighters:$tl$, $tl$[{"id": "a", "label": "are tall"}, {"id": "b", "label": "do an important job"}, {"id": "c", "label": "drive fast"}, {"id": "d", "label": "like red"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Sea turtles travel far in the ocean and return to the beach where they were born." The main idea is that sea turtles:$tl$, $tl$[{"id": "a", "label": "eat plants"}, {"id": "b", "label": "are small"}, {"id": "c", "label": "travel far and return home"}, {"id": "d", "label": "sleep a lot"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Libraries are great. You can borrow books, use computers, and join clubs, all for free." The main idea is that libraries:$tl$, $tl$[{"id": "a", "label": "are quiet only"}, {"id": "b", "label": "are far"}, {"id": "c", "label": "are new"}, {"id": "d", "label": "offer many free things"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Exercise keeps you healthy. It makes your heart strong and lifts your mood." The main idea is that exercise:$tl$, $tl$[{"id": "a", "label": "keeps you healthy"}, {"id": "b", "label": "is boring"}, {"id": "c", "label": "needs a ball"}, {"id": "d", "label": "is at night"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Trees help us. They give shade, clean the air, and are homes for birds." The main idea is that trees:$tl$, $tl$[{"id": "a", "label": "are useful"}, {"id": "b", "label": "are tall only"}, {"id": "c", "label": "grow fast"}, {"id": "d", "label": "are green"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Rosa wanted to help her town, so she started a club to clean the park and plant flowers." The main idea is that Rosa:$tl$, $tl$[{"id": "a", "label": "worked to help her town"}, {"id": "b", "label": "moved away"}, {"id": "c", "label": "disliked the park"}, {"id": "d", "label": "was bored"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Spiders are helpful. They catch insects like flies in their webs." The main idea is that spiders:$tl$, $tl$[{"id": "a", "label": "are huge"}, {"id": "b", "label": "cannot spin webs"}, {"id": "c", "label": "help by catching insects"}, {"id": "d", "label": "eat plants"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The ocean is full of life. Tiny plankton, colorful fish, and huge whales live there." The main idea is that the ocean:$tl$, $tl$[{"id": "a", "label": "is always cold"}, {"id": "b", "label": "has no animals"}, {"id": "c", "label": "is small"}, {"id": "d", "label": "is home to many living things"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Sleep is important. It helps your body grow and your brain remember." The main idea is that sleep:$tl$, $tl$[{"id": "a", "label": "is boring"}, {"id": "b", "label": "is important"}, {"id": "c", "label": "is short"}, {"id": "d", "label": "is loud"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Volcanoes can be dangerous but also helpful. Their ash makes soil rich for farming." The main idea is that volcanoes:$tl$, $tl$[{"id": "a", "label": "can be dangerous and helpful"}, {"id": "b", "label": "are always safe"}, {"id": "c", "label": "are only in oceans"}, {"id": "d", "label": "never erupt"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Deserts are harsh, yet many animals live there by hiding from the heat by day." The main idea is that desert animals:$tl$, $tl$[{"id": "a", "label": "never sleep"}, {"id": "b", "label": "live in the sea"}, {"id": "c", "label": "have ways to survive the heat"}, {"id": "d", "label": "love cold"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "Brushing your teeth keeps them clean and healthy." In one word, this is mostly about keeping teeth ____. $tl$, null, $tl$healthy$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Birds build nests by gathering twigs, grass, and leaves to make a cozy home." The main idea is that birds:$tl$, $tl$[{"id": "a", "label": "fly south"}, {"id": "b", "label": "sing songs"}, {"id": "c", "label": "eat worms"}, {"id": "d", "label": "build nests for a home"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The internet connects people. We use it to learn, talk, and find information." The main idea is that the internet:$tl$, $tl$[{"id": "a", "label": "is only for games"}, {"id": "b", "label": "helps people connect and learn"}, {"id": "c", "label": "is broken"}, {"id": "d", "label": "stores food"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Apples are tasty and healthy. They are sweet, crunchy, and full of vitamins." The main idea is that apples:$tl$, $tl$[{"id": "a", "label": "are red only"}, {"id": "b", "label": "are tasty and healthy"}, {"id": "c", "label": "grow fast"}, {"id": "d", "label": "are heavy"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Dogs make great pets. They are loyal, can be trained, and love to play." The main idea is that dogs:$tl$, $tl$[{"id": "a", "label": "make great pets"}, {"id": "b", "label": "are quiet"}, {"id": "c", "label": "are wild"}, {"id": "d", "label": "cannot learn"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$main-idea$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Key Details (RI.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$key-details$tl$, $tl$Key Details$tl$, $tl$Key details are the facts that tell more about the main idea.$tl$, 2, $tl$RI.2.1$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Key Details$tl$, 2, $tl$[{"type": "explain", "title": "About: Key Details", "body": "Key details are the facts that tell more about the main idea."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The hike was perfect. We saw a calm lake, tall pines, and a fire pit.\" Which detail was on the hike?  The correct answer is \"a calm lake\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Our hamster runs on its wheel, stuffs food in its cheeks, and naps a lot.\" Which detail is true?", "choices": [{"id": "a", "label": "it can fly"}, {"id": "b", "label": "it barks"}, {"id": "c", "label": "it runs on its wheel"}, {"id": "d", "label": "it swims"}], "answer": "c", "explanation": "The correct answer is \"it runs on its wheel\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The hike was perfect. We saw a calm lake, tall pines, and a fire pit." Which detail was on the hike?$tl$, $tl$[{"id": "a", "label": "a busy mall"}, {"id": "b", "label": "a long line"}, {"id": "c", "label": "a calm lake"}, {"id": "d", "label": "a parking lot"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Our hamster runs on its wheel, stuffs food in its cheeks, and naps a lot." Which detail is true?$tl$, $tl$[{"id": "a", "label": "it can fly"}, {"id": "b", "label": "it barks"}, {"id": "c", "label": "it runs on its wheel"}, {"id": "d", "label": "it swims"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The storm was fierce: lightning flashed and wind bent the trees." Which detail shows it was fierce?$tl$, $tl$[{"id": "a", "label": "it was sunny"}, {"id": "b", "label": "wind bent the trees"}, {"id": "c", "label": "it was Monday"}, {"id": "d", "label": "we ate dinner"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Grandpa grows tomatoes, sunflowers, and sweet strawberries." Which does Grandpa grow?$tl$, $tl$[{"id": "a", "label": "a car"}, {"id": "b", "label": "strawberries"}, {"id": "c", "label": "a boat"}, {"id": "d", "label": "a kite"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "At the museum we saw dinosaur bones, old coins, and paintings." Which detail is true?$tl$, $tl$[{"id": "a", "label": "we saw dinosaur bones"}, {"id": "b", "label": "the bus was late"}, {"id": "c", "label": "lunch was good"}, {"id": "d", "label": "it was sunny"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "My brother carries groceries, walks the dog, and helps with homework." Which detail shows he helps?$tl$, $tl$[{"id": "a", "label": "he watches TV all day"}, {"id": "b", "label": "he is tall"}, {"id": "c", "label": "he walks the dog"}, {"id": "d", "label": "he likes pizza"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The beach was crowded: towels covered the sand and lines formed at the snack bar." Which shows it was crowded?$tl$, $tl$[{"id": "a", "label": "lines formed at the snack bar"}, {"id": "b", "label": "the sky was blue"}, {"id": "c", "label": "it was July"}, {"id": "d", "label": "we brought a ball"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The recipe was simple: three steps and four ingredients." Which detail shows it was simple?$tl$, $tl$[{"id": "a", "label": "it tasted sweet"}, {"id": "b", "label": "the bowl was red"}, {"id": "c", "label": "Mom smiled"}, {"id": "d", "label": "three steps"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Winter sports are fun. People ski, skate, and sled." Which is a winter sport in the text?$tl$, $tl$[{"id": "a", "label": "skating"}, {"id": "b", "label": "swimming"}, {"id": "c", "label": "surfing"}, {"id": "d", "label": "golf"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The party was lively: music played, kids danced, and balloons floated." Which detail shows it was lively?$tl$, $tl$[{"id": "a", "label": "it was quiet"}, {"id": "b", "label": "kids danced"}, {"id": "c", "label": "it rained"}, {"id": "d", "label": "it was empty"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Our teacher is kind: she helps us, listens, and smiles a lot." Which shows she is kind?$tl$, $tl$[{"id": "a", "label": "she drives a car"}, {"id": "b", "label": "school is big"}, {"id": "c", "label": "math is hard"}, {"id": "d", "label": "she listens"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "We packed sandwiches, juice, and grapes for the picnic." Which food was packed?$tl$, $tl$[{"id": "a", "label": "pizza"}, {"id": "b", "label": "grapes"}, {"id": "c", "label": "soup"}, {"id": "d", "label": "cake"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The old house looked spooky: broken windows and a creaky door." Which shows it was spooky?$tl$, $tl$[{"id": "a", "label": "a creaky door"}, {"id": "b", "label": "it was for sale"}, {"id": "c", "label": "the yard was big"}, {"id": "d", "label": "the roof was flat"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Reading is great: it teaches words, takes you on adventures, and helps you relax." Which is a benefit in the text?$tl$, $tl$[{"id": "a", "label": "it teaches words"}, {"id": "b", "label": "it costs money"}, {"id": "c", "label": "it is loud"}, {"id": "d", "label": "it needs a TV"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The festival had music, tasty food, and games for kids." Which detail is true?$tl$, $tl$[{"id": "a", "label": "it was Tuesday"}, {"id": "b", "label": "the town is small"}, {"id": "c", "label": "cars were parked"}, {"id": "d", "label": "there were games for kids"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "Maya's bike is green." What color is Maya's bike? (one word)$tl$, null, $tl$green$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Exercise makes your heart strong, builds muscles, and lifts your mood." Which is a benefit listed?$tl$, $tl$[{"id": "a", "label": "builds muscles"}, {"id": "b", "label": "takes time"}, {"id": "c", "label": "is on TV"}, {"id": "d", "label": "needs shoes"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The campsite had a lake, flat ground for tents, and a fire pit." Which detail is true?$tl$, $tl$[{"id": "a", "label": "it had a lake"}, {"id": "b", "label": "it had a mall"}, {"id": "c", "label": "it had a pool"}, {"id": "d", "label": "it had a train"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Dad fixed the bike with a wrench and some oil." What did Dad use?$tl$, $tl$[{"id": "a", "label": "a spoon"}, {"id": "b", "label": "glue"}, {"id": "c", "label": "tape only"}, {"id": "d", "label": "a wrench and oil"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The trip was educational: we saw bones, coins, and art." Which shows it was educational?$tl$, $tl$[{"id": "a", "label": "the bus was late"}, {"id": "b", "label": "lunch was tasty"}, {"id": "c", "label": "we saw bones, coins, and art"}, {"id": "d", "label": "it was hot"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$key-details$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Story Lessons (RL.2.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$story-lesson$tl$, $tl$Story Lessons$tl$, $tl$Many stories teach a lesson or moral about how to live or treat others.$tl$, 2, $tl$RL.2.2$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Story Lessons$tl$, 2, $tl$[{"type": "explain", "title": "About: Story Lessons", "body": "Many stories teach a lesson or moral about how to live or treat others."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The hare bragged and napped during the race. The slow tortoise kept going and won.\" The lesson is:  The correct answer is \"slow and steady wins the race\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The ant worked all summer storing food. The grasshopper played and had none in winter.\" The lesson is:", "choices": [{"id": "a", "label": "never work"}, {"id": "b", "label": "winter is fun"}, {"id": "c", "label": "play all day"}, {"id": "d", "label": "plan ahead and work hard"}], "answer": "d", "explanation": "The correct answer is \"plan ahead and work hard\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The hare bragged and napped during the race. The slow tortoise kept going and won." The lesson is:$tl$, $tl$[{"id": "a", "label": "slow and steady wins the race"}, {"id": "b", "label": "always nap"}, {"id": "c", "label": "bragging is good"}, {"id": "d", "label": "races are bad"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The ant worked all summer storing food. The grasshopper played and had none in winter." The lesson is:$tl$, $tl$[{"id": "a", "label": "never work"}, {"id": "b", "label": "winter is fun"}, {"id": "c", "label": "play all day"}, {"id": "d", "label": "plan ahead and work hard"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Maya kept trying to ride her bike, fell many times, but finally did it." The lesson is:$tl$, $tl$[{"id": "a", "label": "bikes are bad"}, {"id": "b", "label": "falling is fun"}, {"id": "c", "label": "stop trying"}, {"id": "d", "label": "don't give up"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Leo shared his snack, and his friend shared back the next day." The lesson is:$tl$, $tl$[{"id": "a", "label": "never share"}, {"id": "b", "label": "food is bad"}, {"id": "c", "label": "being kind comes back to you"}, {"id": "d", "label": "friends are mean"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The boy cried 'wolf' as a joke so often that no one believed him when it was real." The lesson is:$tl$, $tl$[{"id": "a", "label": "jokes are great"}, {"id": "b", "label": "tell the truth"}, {"id": "c", "label": "wolves are nice"}, {"id": "d", "label": "shout a lot"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ana told the truth even though she was scared, and her mom was proud." The lesson is:$tl$, $tl$[{"id": "a", "label": "hide mistakes"}, {"id": "b", "label": "honesty is important"}, {"id": "c", "label": "never speak"}, {"id": "d", "label": "fear is bad"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The team practiced together and won by helping each other." The lesson is:$tl$, $tl$[{"id": "a", "label": "work alone"}, {"id": "b", "label": "quit early"}, {"id": "c", "label": "skip practice"}, {"id": "d", "label": "teamwork helps"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Sam was patient and waited his turn, so everyone had fun." The lesson is:$tl$, $tl$[{"id": "a", "label": "being patient is good"}, {"id": "b", "label": "push in line"}, {"id": "c", "label": "never wait"}, {"id": "d", "label": "fun is bad"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Pia saved her coins for weeks and bought the gift she wanted." The lesson is:$tl$, $tl$[{"id": "a", "label": "spend it all"}, {"id": "b", "label": "goals are silly"}, {"id": "c", "label": "never save"}, {"id": "d", "label": "saving helps you reach a goal"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The little engine kept saying 'I think I can' and climbed the big hill." The lesson is:$tl$, $tl$[{"id": "a", "label": "believe in yourself"}, {"id": "b", "label": "give up on hills"}, {"id": "c", "label": "trains are bad"}, {"id": "d", "label": "stop talking"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ben helped a new student feel welcome, and they became best friends." The lesson is:$tl$, $tl$[{"id": "a", "label": "ignore new kids"}, {"id": "b", "label": "friends are bad"}, {"id": "c", "label": "kindness makes friends"}, {"id": "d", "label": "stay alone"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Zoe rushed her homework and made many mistakes; next time she took her time." The lesson is:$tl$, $tl$[{"id": "a", "label": "rush always"}, {"id": "b", "label": "homework is bad"}, {"id": "c", "label": "careful work is better than rushing"}, {"id": "d", "label": "never check"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The mouse helped the lion escape a net, proving small friends can help too." The lesson is:$tl$, $tl$[{"id": "a", "label": "even small friends can help"}, {"id": "b", "label": "big is best"}, {"id": "c", "label": "never help"}, {"id": "d", "label": "lions are mean"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Mia listened to advice and her plan worked much better." The lesson is:$tl$, $tl$[{"id": "a", "label": "ignore advice"}, {"id": "b", "label": "plans are bad"}, {"id": "c", "label": "listening to others can help"}, {"id": "d", "label": "talk only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Tom shared the last cookie instead of keeping it, and felt good." The lesson is:$tl$, $tl$[{"id": "a", "label": "keep everything"}, {"id": "b", "label": "cookies are bad"}, {"id": "c", "label": "be greedy"}, {"id": "d", "label": "sharing feels good"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "The tortoise kept going slowly and beat the bragging hare." The lesson: slow and ____ wins the race. (one word)$tl$, null, $tl$steady$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The crow dropped pebbles in the jar to raise the water and drink." The lesson is:$tl$, $tl$[{"id": "a", "label": "give up when thirsty"}, {"id": "b", "label": "clever thinking solves problems"}, {"id": "c", "label": "jars are bad"}, {"id": "d", "label": "never think"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Liz apologized after a mistake, and her friend forgave her." The lesson is:$tl$, $tl$[{"id": "a", "label": "never apologize"}, {"id": "b", "label": "saying sorry helps fix things"}, {"id": "c", "label": "mistakes are great"}, {"id": "d", "label": "ignore friends"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The farmer cared for his land every day and grew a big harvest." The lesson is:$tl$, $tl$[{"id": "a", "label": "skip work"}, {"id": "b", "label": "land is bad"}, {"id": "c", "label": "luck is all"}, {"id": "d", "label": "hard work pays off"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Two goats on a narrow bridge worked it out by taking turns." The lesson is:$tl$, $tl$[{"id": "a", "label": "push others off"}, {"id": "b", "label": "never share"}, {"id": "c", "label": "cooperating solves problems"}, {"id": "d", "label": "fight always"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$story-lesson$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Character Feelings (RL.2.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$character-feelings$tl$, $tl$Character Feelings$tl$, $tl$Look at what characters do and say to understand how they feel.$tl$, 2, $tl$RL.2.3$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Character Feelings$tl$, 2, $tl$[{"type": "explain", "title": "About: Character Feelings", "body": "Look at what characters do and say to understand how they feel."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"Tia smiled wide and hugged her trophy.\" How does Tia feel?  The correct answer is \"happy / proud\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Ben's eyes filled with tears when his balloon popped.\" How does Ben feel?", "choices": [{"id": "a", "label": "happy"}, {"id": "b", "label": "excited"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "sad"}], "answer": "d", "explanation": "The correct answer is \"sad\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Tia smiled wide and hugged her trophy." How does Tia feel?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "scared"}, {"id": "d", "label": "happy / proud"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ben's eyes filled with tears when his balloon popped." How does Ben feel?$tl$, $tl$[{"id": "a", "label": "happy"}, {"id": "b", "label": "excited"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "sad"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Mia stomped her feet and crossed her arms." How does Mia feel?$tl$, $tl$[{"id": "a", "label": "calm"}, {"id": "b", "label": "happy"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Leo hid under the blanket during the loud storm." How does Leo feel?$tl$, $tl$[{"id": "a", "label": "proud"}, {"id": "b", "label": "scared"}, {"id": "c", "label": "bored"}, {"id": "d", "label": "silly"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ana jumped up and down when she heard the great news." How does Ana feel?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "excited"}, {"id": "d", "label": "tired"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Sam yawned and rubbed his eyes at bedtime." How does Sam feel?$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "sleepy"}, {"id": "d", "label": "scared"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Pia frowned and sighed when recess was canceled." How does Pia feel?$tl$, $tl$[{"id": "a", "label": "thrilled"}, {"id": "b", "label": "proud"}, {"id": "c", "label": "disappointed"}, {"id": "d", "label": "sleepy"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Max laughed and grinned at the funny clown." How does Max feel?$tl$, $tl$[{"id": "a", "label": "angry"}, {"id": "b", "label": "happy"}, {"id": "c", "label": "scared"}, {"id": "d", "label": "sad"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Zoe's hands shook before her big speech." How does Zoe feel?$tl$, $tl$[{"id": "a", "label": "bored"}, {"id": "b", "label": "sleepy"}, {"id": "c", "label": "nervous"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Tom shared his toys and helped clean up with a smile." Tom is being:$tl$, $tl$[{"id": "a", "label": "mean"}, {"id": "b", "label": "kind"}, {"id": "c", "label": "rude"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Liz tried the hard puzzle again and again without quitting." Liz is:$tl$, $tl$[{"id": "a", "label": "determined"}, {"id": "b", "label": "lazy"}, {"id": "c", "label": "bored"}, {"id": "d", "label": "scared"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The new kid stood alone and looked at the ground quietly." The kid seems:$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "shy or lonely"}, {"id": "c", "label": "angry"}, {"id": "d", "label": "silly"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ravi cheered and high-fived his teammates after the goal." How does Ravi feel?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "happy / excited"}, {"id": "c", "label": "sleepy"}, {"id": "d", "label": "scared"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Nina gasped and stepped back when she saw the spider." How does Nina feel?$tl$, $tl$[{"id": "a", "label": "calm"}, {"id": "b", "label": "proud"}, {"id": "c", "label": "surprised / scared"}, {"id": "d", "label": "bored"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Sam waited patiently for his turn without complaining." Sam is:$tl$, $tl$[{"id": "a", "label": "rude"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "patient"}, {"id": "d", "label": "greedy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "Tia grinned and hugged her trophy." Tia feels ____. (one word)$tl$, null, $tl$happy$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Lily wiped her eyes and missed her old friend." How does Lily feel?$tl$, $tl$[{"id": "a", "label": "excited"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "sad"}, {"id": "d", "label": "silly"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ben checked under the bed twice before sleeping." Ben feels:$tl$, $tl$[{"id": "a", "label": "very brave"}, {"id": "b", "label": "very happy"}, {"id": "c", "label": "very bored"}, {"id": "d", "label": "a little scared"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Ana helped her grandma and felt warm inside." Ana feels:$tl$, $tl$[{"id": "a", "label": "angry"}, {"id": "b", "label": "good / proud"}, {"id": "c", "label": "bored"}, {"id": "d", "label": "scared"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Max pumped his fist and shouted 'Yes!' when he won." How does Max feel?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "tired"}, {"id": "c", "label": "excited"}, {"id": "d", "label": "shy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$character-feelings$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Sequence of Events (RL.2.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sequence$tl$, $tl$Sequence of Events$tl$, $tl$Sequence is the order things happen: first, next, then, and last.$tl$, 2, $tl$RL.2.3$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sequence of Events$tl$, 2, $tl$[{"type": "explain", "title": "About: Sequence of Events", "body": "Sequence is the order things happen: first, next, then, and last."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"First Ana woke up. Next she ate. Then she went to school.\" What did Ana do FIRST?  The correct answer is \"woke up\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"He read the recipe, gathered the food, then cooked.\" What did he do BEFORE cooking?", "choices": [{"id": "a", "label": "gathered the food"}, {"id": "b", "label": "ate dessert"}, {"id": "c", "label": "washed up"}, {"id": "d", "label": "set the table"}], "answer": "a", "explanation": "The correct answer is \"gathered the food\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "First Ana woke up. Next she ate. Then she went to school." What did Ana do FIRST?$tl$, $tl$[{"id": "a", "label": "ate"}, {"id": "b", "label": "went to school"}, {"id": "c", "label": "woke up"}, {"id": "d", "label": "slept"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He read the recipe, gathered the food, then cooked." What did he do BEFORE cooking?$tl$, $tl$[{"id": "a", "label": "gathered the food"}, {"id": "b", "label": "ate dessert"}, {"id": "c", "label": "washed up"}, {"id": "d", "label": "set the table"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The caterpillar ate leaves, made a chrysalis, then became a butterfly." What happened LAST?$tl$, $tl$[{"id": "a", "label": "it ate leaves"}, {"id": "b", "label": "it became a butterfly"}, {"id": "c", "label": "it made a chrysalis"}, {"id": "d", "label": "it laid eggs"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "We bought tickets, found our seats, and watched the show." What came SECOND?$tl$, $tl$[{"id": "a", "label": "bought tickets"}, {"id": "b", "label": "watched the show"}, {"id": "c", "label": "went home"}, {"id": "d", "label": "found our seats"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "First fill the pot, next turn on the stove, then add pasta." What is the SECOND step?$tl$, $tl$[{"id": "a", "label": "turn on the stove"}, {"id": "b", "label": "add pasta"}, {"id": "c", "label": "fill the pot"}, {"id": "d", "label": "eat"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She drew a picture, colored it, then hung it up." What did she do LAST?$tl$, $tl$[{"id": "a", "label": "drew it"}, {"id": "b", "label": "colored it"}, {"id": "c", "label": "erased it"}, {"id": "d", "label": "hung it up"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The bell rang, the kids lined up, then they walked in." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "kids walked in"}, {"id": "b", "label": "kids lined up"}, {"id": "c", "label": "class ended"}, {"id": "d", "label": "the bell rang"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "We washed the car, dried it, then waxed it." What came right after washing?$tl$, $tl$[{"id": "a", "label": "drying it"}, {"id": "b", "label": "waxing it"}, {"id": "c", "label": "driving it"}, {"id": "d", "label": "parking it"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Plant the seed, water it, then watch it grow." What is the LAST step?$tl$, $tl$[{"id": "a", "label": "watch it grow"}, {"id": "b", "label": "plant the seed"}, {"id": "c", "label": "water it"}, {"id": "d", "label": "pick it"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He tied his shoes, grabbed his ball, and ran outside." What did he do LAST?$tl$, $tl$[{"id": "a", "label": "tied his shoes"}, {"id": "b", "label": "ran outside"}, {"id": "c", "label": "grabbed his ball"}, {"id": "d", "label": "sat down"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The sun set, the stars came out, and we fell asleep." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "the sun set"}, {"id": "b", "label": "we fell asleep"}, {"id": "c", "label": "the stars came out"}, {"id": "d", "label": "the sun rose"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Mix the batter, pour it in a pan, then bake." What do you do right after mixing?$tl$, $tl$[{"id": "a", "label": "bake"}, {"id": "b", "label": "eat"}, {"id": "c", "label": "pour it in a pan"}, {"id": "d", "label": "wash dishes"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "We packed a bag, drove to camp, then set up the tent." What came SECOND?$tl$, $tl$[{"id": "a", "label": "packed a bag"}, {"id": "b", "label": "set up the tent"}, {"id": "c", "label": "slept"}, {"id": "d", "label": "drove to camp"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The seed sprouted, grew leaves, then bloomed." What happened SECOND?$tl$, $tl$[{"id": "a", "label": "sprouted"}, {"id": "b", "label": "grew leaves"}, {"id": "c", "label": "bloomed"}, {"id": "d", "label": "was picked"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She wrote the letter, sealed it, then mailed it." What did she do LAST?$tl$, $tl$[{"id": "a", "label": "wrote it"}, {"id": "b", "label": "sealed it"}, {"id": "c", "label": "read it"}, {"id": "d", "label": "mailed it"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "First we eat, then we play." What do we do first? (one word)$tl$, null, $tl$eat$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The alarm rang, Dad got up, then made coffee." What happened FIRST?$tl$, $tl$[{"id": "a", "label": "Dad made coffee"}, {"id": "b", "label": "the alarm rang"}, {"id": "c", "label": "Dad got up"}, {"id": "d", "label": "Dad left"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He picked apples, washed them, then made a pie." What did he do BEFORE the pie?$tl$, $tl$[{"id": "a", "label": "washed the apples"}, {"id": "b", "label": "ate the pie"}, {"id": "c", "label": "sold apples"}, {"id": "d", "label": "planted a tree"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "We climbed the hill, ate lunch, then rolled down." What did we do right after climbing?$tl$, $tl$[{"id": "a", "label": "rolled down"}, {"id": "b", "label": "slept"}, {"id": "c", "label": "drove home"}, {"id": "d", "label": "ate lunch"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Turn off the lights, climb into bed, then fall asleep." What is the FIRST step?$tl$, $tl$[{"id": "a", "label": "turn off the lights"}, {"id": "b", "label": "fall asleep"}, {"id": "c", "label": "climb into bed"}, {"id": "d", "label": "wake up"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sequence$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Cause & Effect (RI.2.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$cause-and-effect$tl$, $tl$Cause & Effect$tl$, $tl$A cause is why something happens; the effect is what happens.$tl$, 2, $tl$RI.2.3$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Cause & Effect$tl$, 2, $tl$[{"type": "explain", "title": "About: Cause & Effect", "body": "A cause is why something happens; the effect is what happens."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"It rained all day, so the game was canceled.\" What was the CAUSE?  The correct answer is \"it rained all day\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"Tom forgot to water his plant, so it wilted.\" What was the EFFECT?", "choices": [{"id": "a", "label": "Tom watered it"}, {"id": "b", "label": "the plant grew"}, {"id": "c", "label": "the plant wilted"}, {"id": "d", "label": "Tom forgot"}], "answer": "c", "explanation": "The correct answer is \"the plant wilted\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "It rained all day, so the game was canceled." What was the CAUSE?$tl$, $tl$[{"id": "a", "label": "it rained all day"}, {"id": "b", "label": "the game was canceled"}, {"id": "c", "label": "the team won"}, {"id": "d", "label": "the sun came out"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Tom forgot to water his plant, so it wilted." What was the EFFECT?$tl$, $tl$[{"id": "a", "label": "Tom watered it"}, {"id": "b", "label": "the plant grew"}, {"id": "c", "label": "the plant wilted"}, {"id": "d", "label": "Tom forgot"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The ice melted because the day was hot." Why did the ice melt?$tl$, $tl$[{"id": "a", "label": "the ice was blue"}, {"id": "b", "label": "the day was hot"}, {"id": "c", "label": "it was winter"}, {"id": "d", "label": "the freezer broke"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She studied hard, so she passed the test." What caused her to pass?$tl$, $tl$[{"id": "a", "label": "she studied hard"}, {"id": "b", "label": "the test was easy"}, {"id": "c", "label": "she was late"}, {"id": "d", "label": "she slept"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The dog barked loudly, so the baby woke up." What was the effect of the barking?$tl$, $tl$[{"id": "a", "label": "the baby woke up"}, {"id": "b", "label": "the dog slept"}, {"id": "c", "label": "the baby ate"}, {"id": "d", "label": "the dog ran"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Because the road was icy, the cars drove slowly." Why did the cars drive slowly?$tl$, $tl$[{"id": "a", "label": "the road was icy"}, {"id": "b", "label": "the cars were red"}, {"id": "c", "label": "it was sunny"}, {"id": "d", "label": "the road was new"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He left the milk out, so it spoiled." What was the cause of the milk spoiling?$tl$, $tl$[{"id": "a", "label": "he left the milk out"}, {"id": "b", "label": "the milk was cold"}, {"id": "c", "label": "the fridge was full"}, {"id": "d", "label": "he drank it"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The wind blew hard, so the kite flew high." What made the kite fly high?$tl$, $tl$[{"id": "a", "label": "the kite was heavy"}, {"id": "b", "label": "it rained"}, {"id": "c", "label": "the wind blew hard"}, {"id": "d", "label": "the string broke"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Because the library was closed, we went to the park." What was the effect?$tl$, $tl$[{"id": "a", "label": "the library opened"}, {"id": "b", "label": "they went to the park"}, {"id": "c", "label": "they read books"}, {"id": "d", "label": "they stayed home"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The fire alarm rang, so everyone left the building." What was the cause?$tl$, $tl$[{"id": "a", "label": "the fire alarm rang"}, {"id": "b", "label": "everyone left"}, {"id": "c", "label": "it was lunch"}, {"id": "d", "label": "the lights were on"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She watered the seeds, so they sprouted." What was the effect?$tl$, $tl$[{"id": "a", "label": "the seeds dried up"}, {"id": "b", "label": "nothing grew"}, {"id": "c", "label": "it snowed"}, {"id": "d", "label": "the seeds sprouted"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Max practiced every day, so he got better." What caused him to improve?$tl$, $tl$[{"id": "a", "label": "he quit"}, {"id": "b", "label": "he practiced every day"}, {"id": "c", "label": "he slept"}, {"id": "d", "label": "it was easy"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "It snowed all night, so school was closed." Why was school closed?$tl$, $tl$[{"id": "a", "label": "it was summer"}, {"id": "b", "label": "it was sunny"}, {"id": "c", "label": "it was Friday"}, {"id": "d", "label": "it snowed all night"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He dropped the glass, so it shattered." What was the effect?$tl$, $tl$[{"id": "a", "label": "it floated"}, {"id": "b", "label": "the glass shattered"}, {"id": "c", "label": "it grew"}, {"id": "d", "label": "nothing"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "Because it was cold, she wore a coat." Why did she wear a coat?$tl$, $tl$[{"id": "a", "label": "it was hot"}, {"id": "b", "label": "it was cold"}, {"id": "c", "label": "it was sunny"}, {"id": "d", "label": "it was loud"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "It rained for hours, so the river ____ over its banks." Fill the effect word. (one word)$tl$, null, $tl$flooded$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The baby was sleepy, so she cried." Why did the baby cry?$tl$, $tl$[{"id": "a", "label": "she was happy"}, {"id": "b", "label": "she was sleepy"}, {"id": "c", "label": "she ate"}, {"id": "d", "label": "she ran"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He studied the map, so he didn't get lost." Why didn't he get lost?$tl$, $tl$[{"id": "a", "label": "he studied the map"}, {"id": "b", "label": "he ran"}, {"id": "c", "label": "he closed his eyes"}, {"id": "d", "label": "he was tired"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The volcano erupted, so people moved away." What was the cause?$tl$, $tl$[{"id": "a", "label": "it was lunch"}, {"id": "b", "label": "the road was new"}, {"id": "c", "label": "the volcano erupted"}, {"id": "d", "label": "the sky was blue"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She turned off the light, so the room got dark." What made the room dark?$tl$, $tl$[{"id": "a", "label": "turning off the light"}, {"id": "b", "label": "the sun"}, {"id": "c", "label": "the lamp on"}, {"id": "d", "label": "the window"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$cause-and-effect$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Vocabulary in Context (RI.2.4) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$context-clues$tl$, $tl$Vocabulary in Context$tl$, $tl$Use the words around an unknown word to figure out its meaning.$tl$, 2, $tl$RI.2.4$tl$, 7
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Vocabulary in Context$tl$, 2, $tl$[{"type": "explain", "title": "About: Vocabulary in Context", "body": "Use the words around an unknown word to figure out its meaning."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Read: \"The path was narrow, so only one person could pass.\" What does \"narrow\" mean?  The correct answer is \"not wide\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Read: \"The soup was scalding, so she let it cool.\" What does \"scalding\" mean?", "choices": [{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}], "answer": "a", "explanation": "The correct answer is \"very hot\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The path was narrow, so only one person could pass." What does "narrow" mean?$tl$, $tl$[{"id": "a", "label": "not wide"}, {"id": "b", "label": "very tall"}, {"id": "c", "label": "bright"}, {"id": "d", "label": "heavy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The soup was scalding, so she let it cool." What does "scalding" mean?$tl$, $tl$[{"id": "a", "label": "very hot"}, {"id": "b", "label": "very cold"}, {"id": "c", "label": "tasty"}, {"id": "d", "label": "empty"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He was exhausted after the long run." What does "exhausted" mean?$tl$, $tl$[{"id": "a", "label": "very tired"}, {"id": "b", "label": "excited"}, {"id": "c", "label": "hungry"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The ancient ruins were thousands of years old." What does "ancient" mean?$tl$, $tl$[{"id": "a", "label": "brand new"}, {"id": "b", "label": "very old"}, {"id": "c", "label": "colorful"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The timid puppy hid behind the couch." What does "timid" mean?$tl$, $tl$[{"id": "a", "label": "shy or fearful"}, {"id": "b", "label": "loud"}, {"id": "c", "label": "huge"}, {"id": "d", "label": "fast"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The enormous elephant was the biggest animal there." What does "enormous" mean?$tl$, $tl$[{"id": "a", "label": "very small"}, {"id": "b", "label": "very fast"}, {"id": "c", "label": "very quiet"}, {"id": "d", "label": "very large"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "After the drought, the land had no water for months." What does "drought" mean?$tl$, $tl$[{"id": "a", "label": "a big flood"}, {"id": "b", "label": "a snowstorm"}, {"id": "c", "label": "a forest"}, {"id": "d", "label": "a long time with no rain"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He was generous and shared his lunch." What does "generous" mean?$tl$, $tl$[{"id": "a", "label": "selfish"}, {"id": "b", "label": "tired"}, {"id": "c", "label": "willing to share"}, {"id": "d", "label": "mean"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The room was vacant; nobody was inside." What does "vacant" mean?$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "loud"}, {"id": "c", "label": "empty"}, {"id": "d", "label": "bright"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The fragile vase broke when it slipped." What does "fragile" mean?$tl$, $tl$[{"id": "a", "label": "very heavy"}, {"id": "b", "label": "brightly colored"}, {"id": "c", "label": "easily broken"}, {"id": "d", "label": "very old"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He gobbled his food because he was famished." What does "famished" mean?$tl$, $tl$[{"id": "a", "label": "very full"}, {"id": "b", "label": "very hungry"}, {"id": "c", "label": "very tired"}, {"id": "d", "label": "very tall"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The cautious driver slowed near the school." What does "cautious" mean?$tl$, $tl$[{"id": "a", "label": "reckless"}, {"id": "b", "label": "sleepy"}, {"id": "c", "label": "careful"}, {"id": "d", "label": "angry"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The aroma of fresh bread filled the room." What does "aroma" mean?$tl$, $tl$[{"id": "a", "label": "a sound"}, {"id": "b", "label": "a color"}, {"id": "c", "label": "a smell"}, {"id": "d", "label": "a price"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She felt feeble and could barely stand." What does "feeble" mean?$tl$, $tl$[{"id": "a", "label": "weak"}, {"id": "b", "label": "strong"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "happy"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The instructions were vague, so nobody knew what to do." What does "vague" mean?$tl$, $tl$[{"id": "a", "label": "very clear"}, {"id": "b", "label": "very loud"}, {"id": "c", "label": "colorful"}, {"id": "d", "label": "not clear"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Read: "The path was visible even at night because of the bright moon." "Visible" means able to be ____. (one word)$tl$, null, $tl$seen$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The two friends were inseparable and went everywhere together." What does "inseparable" mean?$tl$, $tl$[{"id": "a", "label": "far apart"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "always together"}, {"id": "d", "label": "silent"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "He was furious and stomped his feet." What does "furious" mean?$tl$, $tl$[{"id": "a", "label": "very happy"}, {"id": "b", "label": "very calm"}, {"id": "c", "label": "very angry"}, {"id": "d", "label": "very sleepy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "The damp towel was still a little wet." What does "damp" mean?$tl$, $tl$[{"id": "a", "label": "bone dry"}, {"id": "b", "label": "slightly wet"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "on fire"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Read: "She was thrilled to win the prize." What does "thrilled" mean?$tl$, $tl$[{"id": "a", "label": "very bored"}, {"id": "b", "label": "very upset"}, {"id": "c", "label": "very excited"}, {"id": "d", "label": "very tired"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$context-clues$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Synonyms & Antonyms (L.2.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$synonyms-and-antonyms$tl$, $tl$Synonyms & Antonyms$tl$, $tl$Synonyms mean almost the same; antonyms mean the opposite.$tl$, 2, $tl$L.2.5$tl$, 8
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Synonyms & Antonyms$tl$, 2, $tl$[{"type": "explain", "title": "About: Synonyms & Antonyms", "body": "Synonyms mean almost the same; antonyms mean the opposite."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word means almost the same as \"happy\"?  The correct answer is \"glad\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is the OPPOSITE of \"big\"?", "choices": [{"id": "a", "label": "large"}, {"id": "b", "label": "small"}, {"id": "c", "label": "huge"}, {"id": "d", "label": "giant"}], "answer": "b", "explanation": "The correct answer is \"small\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word means almost the same as "happy"?$tl$, $tl$[{"id": "a", "label": "sad"}, {"id": "b", "label": "angry"}, {"id": "c", "label": "glad"}, {"id": "d", "label": "tired"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is the OPPOSITE of "big"?$tl$, $tl$[{"id": "a", "label": "large"}, {"id": "b", "label": "small"}, {"id": "c", "label": "huge"}, {"id": "d", "label": "giant"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "fast" is:$tl$, $tl$[{"id": "a", "label": "quick"}, {"id": "b", "label": "slow"}, {"id": "c", "label": "late"}, {"id": "d", "label": "still"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "hot" is:$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "boiling"}, {"id": "c", "label": "sunny"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "begin" is:$tl$, $tl$[{"id": "a", "label": "stop"}, {"id": "b", "label": "start"}, {"id": "c", "label": "end"}, {"id": "d", "label": "finish"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$An antonym for "empty" is:$tl$, $tl$[{"id": "a", "label": "full"}, {"id": "b", "label": "bare"}, {"id": "c", "label": "hollow"}, {"id": "d", "label": "vacant"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "smart" is:$tl$, $tl$[{"id": "a", "label": "silly"}, {"id": "b", "label": "clever"}, {"id": "c", "label": "slow"}, {"id": "d", "label": "lazy"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "day" is:$tl$, $tl$[{"id": "a", "label": "noon"}, {"id": "b", "label": "morning"}, {"id": "c", "label": "night"}, {"id": "d", "label": "sunrise"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "tired" is:$tl$, $tl$[{"id": "a", "label": "sleepy"}, {"id": "b", "label": "awake"}, {"id": "c", "label": "alert"}, {"id": "d", "label": "lively"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$An antonym for "loud" is:$tl$, $tl$[{"id": "a", "label": "quiet"}, {"id": "b", "label": "noisy"}, {"id": "c", "label": "booming"}, {"id": "d", "label": "blaring"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "little" is:$tl$, $tl$[{"id": "a", "label": "huge"}, {"id": "b", "label": "tall"}, {"id": "c", "label": "small"}, {"id": "d", "label": "wide"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "open" is:$tl$, $tl$[{"id": "a", "label": "closed"}, {"id": "b", "label": "wide"}, {"id": "c", "label": "ajar"}, {"id": "d", "label": "unlocked"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "pretty" is:$tl$, $tl$[{"id": "a", "label": "ugly"}, {"id": "b", "label": "beautiful"}, {"id": "c", "label": "plain"}, {"id": "d", "label": "dull"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "start" is:$tl$, $tl$[{"id": "a", "label": "begin"}, {"id": "b", "label": "launch"}, {"id": "c", "label": "stop"}, {"id": "d", "label": "open"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "angry" is:$tl$, $tl$[{"id": "a", "label": "calm"}, {"id": "b", "label": "happy"}, {"id": "c", "label": "sleepy"}, {"id": "d", "label": "mad"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write a one-word ANTONYM (opposite) of "up". $tl$, null, $tl$down$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "jump" is:$tl$, $tl$[{"id": "a", "label": "sit"}, {"id": "b", "label": "crawl"}, {"id": "c", "label": "leap"}, {"id": "d", "label": "stand"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "wet" is:$tl$, $tl$[{"id": "a", "label": "soggy"}, {"id": "b", "label": "damp"}, {"id": "c", "label": "moist"}, {"id": "d", "label": "dry"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$A synonym for "easy" is:$tl$, $tl$[{"id": "a", "label": "hard"}, {"id": "b", "label": "simple"}, {"id": "c", "label": "tricky"}, {"id": "d", "label": "tough"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$The opposite of "full" is:$tl$, $tl$[{"id": "a", "label": "packed"}, {"id": "b", "label": "empty"}, {"id": "c", "label": "stuffed"}, {"id": "d", "label": "loaded"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$synonyms-and-antonyms$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Fact vs. Opinion (RI.2.8) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$fact-and-opinion$tl$, $tl$Fact vs. Opinion$tl$, $tl$A fact can be proven; an opinion tells what someone feels.$tl$, 2, $tl$RI.2.8$tl$, 9
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Fact vs. Opinion$tl$, 2, $tl$[{"type": "explain", "title": "About: Fact vs. Opinion", "body": "A fact can be proven; an opinion tells what someone feels."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence is a FACT?  The correct answer is \"Water freezes when it gets very cold.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence is an OPINION?", "choices": [{"id": "a", "label": "A week has seven days."}, {"id": "b", "label": "The Sun is a star."}, {"id": "c", "label": "Spiders have eight legs."}, {"id": "d", "label": "Recess is the most fun part of the day."}], "answer": "d", "explanation": "The correct answer is \"Recess is the most fun part of the day.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence is a FACT?$tl$, $tl$[{"id": "a", "label": "Winter is the best season."}, {"id": "b", "label": "Pizza tastes amazing."}, {"id": "c", "label": "Water freezes when it gets very cold."}, {"id": "d", "label": "Blue is the prettiest color."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence is an OPINION?$tl$, $tl$[{"id": "a", "label": "A week has seven days."}, {"id": "b", "label": "The Sun is a star."}, {"id": "c", "label": "Spiders have eight legs."}, {"id": "d", "label": "Recess is the most fun part of the day."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Math is boring."}, {"id": "b", "label": "Dogs are better than cats."}, {"id": "c", "label": "A triangle has three sides."}, {"id": "d", "label": "Summer is too hot."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Chocolate is the best flavor."}, {"id": "b", "label": "Ice melts when heated."}, {"id": "c", "label": "There are 12 months."}, {"id": "d", "label": "Plants need sunlight."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$"Our school has 300 students." This is a:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "opinion"}, {"id": "c", "label": "question"}, {"id": "d", "label": "story"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$"Reading is more fun than TV." This is an:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "rule"}, {"id": "c", "label": "opinion"}, {"id": "d", "label": "number"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which can be checked to see if it is true?$tl$, $tl$[{"id": "a", "label": "Mondays are terrible."}, {"id": "b", "label": "The library opens at 9 a.m."}, {"id": "c", "label": "This book is the best."}, {"id": "d", "label": "Green is a happy color."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word often signals an opinion?$tl$, $tl$[{"id": "a", "label": "measured"}, {"id": "b", "label": "equals"}, {"id": "c", "label": "best"}, {"id": "d", "label": "contains"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Elephants are cute."}, {"id": "b", "label": "Zoos are boring."}, {"id": "c", "label": "Lions are scary."}, {"id": "d", "label": "Elephants are very large animals."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Vanilla is better than chocolate."}, {"id": "b", "label": "Ice is frozen water."}, {"id": "c", "label": "Cows eat grass."}, {"id": "d", "label": "A year has seasons."}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Bees make honey."}, {"id": "b", "label": "Bees are scary."}, {"id": "c", "label": "Honey is the tastiest."}, {"id": "d", "label": "Bugs are gross."}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Ten is an even number."}, {"id": "b", "label": "Birds lay eggs."}, {"id": "c", "label": "The library has books."}, {"id": "d", "label": "Math class is too hard."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$"The cat is black." This is a:$tl$, $tl$[{"id": "a", "label": "opinion"}, {"id": "b", "label": "joke"}, {"id": "c", "label": "fact"}, {"id": "d", "label": "rule"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$"Black cats are the prettiest." This is an:$tl$, $tl$[{"id": "a", "label": "fact"}, {"id": "b", "label": "number"}, {"id": "c", "label": "rule"}, {"id": "d", "label": "opinion"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT you can check?$tl$, $tl$[{"id": "a", "label": "Parks are boring."}, {"id": "b", "label": "The park is on Oak Street."}, {"id": "c", "label": "Swings are the best."}, {"id": "d", "label": "Grass is dull."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$A statement that tells what someone feels and can't be proven is an ____. (one word)$tl$, null, $tl$opinion$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Apples taste the best."}, {"id": "b", "label": "An apple is a fruit."}, {"id": "c", "label": "Red apples are prettiest."}, {"id": "d", "label": "Fruit is boring."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is an OPINION?$tl$, $tl$[{"id": "a", "label": "Snow is cold."}, {"id": "b", "label": "Snow days are the best."}, {"id": "c", "label": "Snow is frozen water."}, {"id": "d", "label": "Snow is white."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which signals an opinion?$tl$, $tl$[{"id": "a", "label": "arrived"}, {"id": "b", "label": "measured"}, {"id": "c", "label": "favorite"}, {"id": "d", "label": "counted"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which is a FACT?$tl$, $tl$[{"id": "a", "label": "Fish are boring."}, {"id": "b", "label": "Sharks are mean."}, {"id": "c", "label": "Fish live in water."}, {"id": "d", "label": "The ocean is scary."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$fact-and-opinion$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [reading] Comparing Texts (RI.2.9) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$compare-texts$tl$, $tl$Comparing Texts$tl$, $tl$We can compare two texts to see how they are alike and different.$tl$, 2, $tl$RI.2.9$tl$, 10
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Comparing Texts$tl$, 2, $tl$[{"type": "explain", "title": "About: Comparing Texts", "body": "We can compare two texts to see how they are alike and different."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: One book says dogs make great pets; another says cats do. Both books are about:  The correct answer is \"good pets\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Two stories both have a brave hero, but one is in space and one is under the sea. They are alike because both have:", "choices": [{"id": "a", "label": "a brave hero"}, {"id": "b", "label": "a spaceship"}, {"id": "c", "label": "an ocean"}, {"id": "d", "label": "a dragon"}], "answer": "a", "explanation": "The correct answer is \"a brave hero\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$One book says dogs make great pets; another says cats do. Both books are about:$tl$, $tl$[{"id": "a", "label": "cars"}, {"id": "b", "label": "weather"}, {"id": "c", "label": "good pets"}, {"id": "d", "label": "sports"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two stories both have a brave hero, but one is in space and one is under the sea. They are alike because both have:$tl$, $tl$[{"id": "a", "label": "a brave hero"}, {"id": "b", "label": "a spaceship"}, {"id": "c", "label": "an ocean"}, {"id": "d", "label": "a dragon"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Book A is about how rain forms; Book B is about how snow forms. Both are about:$tl$, $tl$[{"id": "a", "label": "kinds of weather"}, {"id": "b", "label": "animals"}, {"id": "c", "label": "sports"}, {"id": "d", "label": "food"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$One text says summer is best; another says winter is best. They differ on the best:$tl$, $tl$[{"id": "a", "label": "color"}, {"id": "b", "label": "number"}, {"id": "c", "label": "season"}, {"id": "d", "label": "letter"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two articles describe bees and butterflies. Both insects:$tl$, $tl$[{"id": "a", "label": "live in water"}, {"id": "b", "label": "have fur"}, {"id": "c", "label": "help pollinate flowers"}, {"id": "d", "label": "bark"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Story 1 ends happily; Story 2 ends sadly. They differ in their:$tl$, $tl$[{"id": "a", "label": "ending"}, {"id": "b", "label": "title only"}, {"id": "c", "label": "number of pages only"}, {"id": "d", "label": "author's name"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Both texts explain how to plant a garden. They are both meant to:$tl$, $tl$[{"id": "a", "label": "tell a funny story"}, {"id": "b", "label": "sell toys"}, {"id": "c", "label": "report news only"}, {"id": "d", "label": "teach you how to do something"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$One poem rhymes; the other does not. A difference between them is:$tl$, $tl$[{"id": "a", "label": "whether they rhyme"}, {"id": "b", "label": "both are about cats"}, {"id": "c", "label": "both are short"}, {"id": "d", "label": "both have a title"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two books about the ocean both mention:$tl$, $tl$[{"id": "a", "label": "deserts"}, {"id": "b", "label": "mountains"}, {"id": "c", "label": "sea animals"}, {"id": "d", "label": "cities only"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Article A says exercise is healthy; Article B says sleep is healthy. Both are about staying:$tl$, $tl$[{"id": "a", "label": "rich"}, {"id": "b", "label": "famous"}, {"id": "c", "label": "healthy"}, {"id": "d", "label": "busy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two fables both teach a lesson. They are alike because both have:$tl$, $tl$[{"id": "a", "label": "the same animals"}, {"id": "b", "label": "the same author"}, {"id": "c", "label": "the same length"}, {"id": "d", "label": "a moral / lesson"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Book 1 is set in a city; Book 2 is set on a farm. They differ in their:$tl$, $tl$[{"id": "a", "label": "language"}, {"id": "b", "label": "number of words"}, {"id": "c", "label": "cover color only"}, {"id": "d", "label": "setting"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Both texts describe penguins. A fact in both might be that penguins:$tl$, $tl$[{"id": "a", "label": "live in deserts"}, {"id": "b", "label": "live where it is cold"}, {"id": "c", "label": "can fly high"}, {"id": "d", "label": "eat grass"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$One recipe makes cookies; another makes bread. Both recipes:$tl$, $tl$[{"id": "a", "label": "tell a story"}, {"id": "b", "label": "give steps to follow"}, {"id": "c", "label": "sell a toy"}, {"id": "d", "label": "report scores"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two stories about friendship both show that friends should:$tl$, $tl$[{"id": "a", "label": "never talk"}, {"id": "b", "label": "be mean"}, {"id": "c", "label": "stay apart"}, {"id": "d", "label": "help each other"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$If two books are both about space, their shared topic is ____. (one word)$tl$, null, $tl$space$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Text A is a true report; Text B is a made-up story. They differ because one is:$tl$, $tl$[{"id": "a", "label": "longer only"}, {"id": "b", "label": "shorter only"}, {"id": "c", "label": "real and one is fiction"}, {"id": "d", "label": "colorful only"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Both maps show the same town. They are alike because both show:$tl$, $tl$[{"id": "a", "label": "the future"}, {"id": "b", "label": "the weather"}, {"id": "c", "label": "the town's places"}, {"id": "d", "label": "a story"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$One song is happy and fast; another is slow and sad. They differ in their:$tl$, $tl$[{"id": "a", "label": "mood"}, {"id": "b", "label": "title only"}, {"id": "c", "label": "singer's name"}, {"id": "d", "label": "number of words"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Two articles about recycling both say it helps:$tl$, $tl$[{"id": "a", "label": "cars go faster"}, {"id": "b", "label": "TVs work"}, {"id": "c", "label": "phones charge"}, {"id": "d", "label": "the Earth"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$compare-texts$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Nouns (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$nouns$tl$, $tl$Nouns$tl$, $tl$A noun names a person, place, thing, or idea.$tl$, 2, $tl$L.2.1$tl$, 1
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Nouns$tl$, 2, $tl$[{"type": "explain", "title": "About: Nouns", "body": "A noun names a person, place, thing, or idea."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a noun (a person, place, or thing)?  The correct answer is \"kitchen\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a noun (a person, place, or thing)?", "choices": [{"id": "a", "label": "march"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "island"}], "answer": "d", "explanation": "The correct answer is \"island\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "kitchen"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "stretch"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "scribble"}, {"id": "d", "label": "teacher"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "march"}, {"id": "c", "label": "paint"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "doctor"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "enormous"}, {"id": "d", "label": "fluffy"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "frozen"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "stormy"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "brave"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "village"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "fluffy"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "discover"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "blanket"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "golden"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "stormy"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "gallop"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "march"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "jump"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "library"}, {"id": "d", "label": "bounce"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "brave"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "shiny"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "stretch"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "narrow"}, {"id": "b", "label": "build"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "kitchen"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a noun (a person, place, or thing)?$tl$, $tl$[{"id": "a", "label": "ancient"}, {"id": "b", "label": "build"}, {"id": "c", "label": "bounce"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Action Verbs (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$action-verbs$tl$, $tl$Action Verbs$tl$, $tl$A verb shows action - what the subject does.$tl$, 2, $tl$L.2.1$tl$, 2
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Action Verbs$tl$, 2, $tl$[{"type": "explain", "title": "About: Action Verbs", "body": "A verb shows action \u2014 what the subject does."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an action verb (something you can do)?  The correct answer is \"paint\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an action verb (something you can do)?", "choices": [{"id": "a", "label": "gentle"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "narrow"}], "answer": "c", "explanation": "The correct answer is \"whisper\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "library"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "fluffy"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "cheerful"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "shiny"}, {"id": "c", "label": "river"}, {"id": "d", "label": "engine"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "library"}, {"id": "c", "label": "island"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "wander"}, {"id": "c", "label": "village"}, {"id": "d", "label": "narrow"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "kitchen"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "engine"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "march"}, {"id": "d", "label": "blanket"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "golden"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "gallop"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "scribble"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "ancient"}, {"id": "d", "label": "library"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "shout"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "garden"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "sister"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "brave"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "slippery"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "curious"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "garden"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "sister"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "cheerful"}, {"id": "c", "label": "frozen"}, {"id": "d", "label": "ancient"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "cheerful"}, {"id": "b", "label": "library"}, {"id": "c", "label": "garden"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an action verb (something you can do)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "river"}, {"id": "d", "label": "wander"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$action-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Adjectives (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adjectives$tl$, $tl$Adjectives$tl$, $tl$An adjective describes a noun, telling what kind or how many.$tl$, 2, $tl$L.2.1$tl$, 3
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adjectives$tl$, 2, $tl$[{"type": "explain", "title": "About: Adjectives", "body": "An adjective describes a noun, telling what kind or how many."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is an adjective (it describes a noun)?  The correct answer is \"stormy\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is an adjective (it describes a noun)?", "choices": [{"id": "a", "label": "bounce"}, {"id": "b", "label": "window"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "paint"}], "answer": "c", "explanation": "The correct answer is \"fluffy\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "stormy"}, {"id": "c", "label": "library"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "bounce"}, {"id": "b", "label": "window"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "paint"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "pencil"}, {"id": "b", "label": "village"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "tiny"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "gentle"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "window"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "teacher"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "frozen"}, {"id": "c", "label": "library"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "curious"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "shiny"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "forest"}, {"id": "b", "label": "slippery"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "build"}, {"id": "b", "label": "golden"}, {"id": "c", "label": "whisper"}, {"id": "d", "label": "farmer"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "forest"}, {"id": "c", "label": "brave"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "build"}, {"id": "d", "label": "cheerful"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "enormous"}, {"id": "c", "label": "forest"}, {"id": "d", "label": "scribble"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "river"}, {"id": "c", "label": "engine"}, {"id": "d", "label": "stormy"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "puppy"}, {"id": "c", "label": "fluffy"}, {"id": "d", "label": "balloon"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "paint"}, {"id": "b", "label": "farmer"}, {"id": "c", "label": "narrow"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "march"}, {"id": "b", "label": "tiny"}, {"id": "c", "label": "balloon"}, {"id": "d", "label": "doctor"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "village"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "gentle"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is an adjective (it describes a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "ancient"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "shout"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$adjectives$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Pronouns (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$pronouns$tl$, $tl$Pronouns$tl$, $tl$A pronoun takes the place of a noun, like he, she, it, or they.$tl$, 2, $tl$L.2.1$tl$, 4
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Pronouns$tl$, 2, $tl$[{"type": "explain", "title": "About: Pronouns", "body": "A pronoun takes the place of a noun, like he, she, it, or they."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is a pronoun (it takes the place of a noun)?  The correct answer is \"you\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is a pronoun (it takes the place of a noun)?", "choices": [{"id": "a", "label": "wander"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "us"}, {"id": "d", "label": "swim"}], "answer": "c", "explanation": "The correct answer is \"us\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "gallop"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "window"}, {"id": "d", "label": "you"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "wander"}, {"id": "b", "label": "teacher"}, {"id": "c", "label": "us"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "garden"}, {"id": "b", "label": "she"}, {"id": "c", "label": "mountain"}, {"id": "d", "label": "window"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "library"}, {"id": "d", "label": "it"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "balloon"}, {"id": "b", "label": "explore"}, {"id": "c", "label": "they"}, {"id": "d", "label": "swim"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "her"}, {"id": "d", "label": "march"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "puppy"}, {"id": "b", "label": "balloon"}, {"id": "c", "label": "him"}, {"id": "d", "label": "discover"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "we"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "them"}, {"id": "b", "label": "jump"}, {"id": "c", "label": "farmer"}, {"id": "d", "label": "whisper"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "kitchen"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "window"}, {"id": "b", "label": "bounce"}, {"id": "c", "label": "you"}, {"id": "d", "label": "forest"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "library"}, {"id": "b", "label": "march"}, {"id": "c", "label": "river"}, {"id": "d", "label": "us"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "stretch"}, {"id": "b", "label": "doctor"}, {"id": "c", "label": "she"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "sister"}, {"id": "b", "label": "swim"}, {"id": "c", "label": "village"}, {"id": "d", "label": "it"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "discover"}, {"id": "b", "label": "stretch"}, {"id": "c", "label": "explore"}, {"id": "d", "label": "they"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "farmer"}, {"id": "b", "label": "pencil"}, {"id": "c", "label": "her"}, {"id": "d", "label": "explore"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "him"}, {"id": "b", "label": "whisper"}, {"id": "c", "label": "swim"}, {"id": "d", "label": "puppy"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "jump"}, {"id": "b", "label": "we"}, {"id": "c", "label": "shout"}, {"id": "d", "label": "island"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "swim"}, {"id": "b", "label": "them"}, {"id": "c", "label": "sister"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word is a pronoun (it takes the place of a noun)?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "I"}, {"id": "c", "label": "puppy"}, {"id": "d", "label": "pencil"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$pronouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Subject-Verb Agreement (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$subject-verb-agreement$tl$, $tl$Subject-Verb Agreement$tl$, $tl$The verb must match the subject, like 'The dog runs.'$tl$, 2, $tl$L.2.1$tl$, 5
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Subject-Verb Agreement$tl$, 2, $tl$[{"type": "explain", "title": "About: Subject-Verb Agreement", "body": "The verb must match the subject, like 'The dog runs.'"}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Choose the correct verb: \"The dog ____ every day.\"  The correct answer is \"barks\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Choose the correct verb: \"The chef ____ every day.\"", "choices": [{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooks"}, {"id": "d", "label": "cooksing"}], "answer": "c", "explanation": "The correct answer is \"cooks\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The dog ____ every day."$tl$, $tl$[{"id": "a", "label": "bark"}, {"id": "b", "label": "barksed"}, {"id": "c", "label": "barks"}, {"id": "d", "label": "barksing"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The chef ____ every day."$tl$, $tl$[{"id": "a", "label": "cook"}, {"id": "b", "label": "cooksed"}, {"id": "c", "label": "cooks"}, {"id": "d", "label": "cooksing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The artist ____ every day."$tl$, $tl$[{"id": "a", "label": "paints"}, {"id": "b", "label": "paint"}, {"id": "c", "label": "paintsed"}, {"id": "d", "label": "paintsing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The snake ____ every day."$tl$, $tl$[{"id": "a", "label": "slithers"}, {"id": "b", "label": "slither"}, {"id": "c", "label": "slithersed"}, {"id": "d", "label": "slithersing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The puppy ____ every day."$tl$, $tl$[{"id": "a", "label": "wag"}, {"id": "b", "label": "wagsed"}, {"id": "c", "label": "wags"}, {"id": "d", "label": "wagsing"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The clock ____ every day."$tl$, $tl$[{"id": "a", "label": "tick"}, {"id": "b", "label": "ticksed"}, {"id": "c", "label": "ticksing"}, {"id": "d", "label": "ticks"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The farmer ____ every day."$tl$, $tl$[{"id": "a", "label": "plant"}, {"id": "b", "label": "plants"}, {"id": "c", "label": "plantsed"}, {"id": "d", "label": "plantsing"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The rabbit ____ every day."$tl$, $tl$[{"id": "a", "label": "hop"}, {"id": "b", "label": "hopsed"}, {"id": "c", "label": "hopsing"}, {"id": "d", "label": "hops"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The student ____ every day."$tl$, $tl$[{"id": "a", "label": "read"}, {"id": "b", "label": "readsed"}, {"id": "c", "label": "readsing"}, {"id": "d", "label": "reads"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The singer ____ every day."$tl$, $tl$[{"id": "a", "label": "performs"}, {"id": "b", "label": "perform"}, {"id": "c", "label": "performsed"}, {"id": "d", "label": "performsing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The flower ____ every day."$tl$, $tl$[{"id": "a", "label": "grows"}, {"id": "b", "label": "grow"}, {"id": "c", "label": "growsed"}, {"id": "d", "label": "growsing"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The boy ____ every day."$tl$, $tl$[{"id": "a", "label": "plays"}, {"id": "b", "label": "play"}, {"id": "c", "label": "playsed"}, {"id": "d", "label": "playsing"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The bird ____ every day."$tl$, $tl$[{"id": "a", "label": "sing"}, {"id": "b", "label": "singsed"}, {"id": "c", "label": "sings"}, {"id": "d", "label": "singsing"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The girl ____ every day."$tl$, $tl$[{"id": "a", "label": "run"}, {"id": "b", "label": "runsed"}, {"id": "c", "label": "runs"}, {"id": "d", "label": "runsing"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The baby ____ every day."$tl$, $tl$[{"id": "a", "label": "cries"}, {"id": "b", "label": "crie"}, {"id": "c", "label": "criesed"}, {"id": "d", "label": "criesing"}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The engine ____ every day."$tl$, $tl$[{"id": "a", "label": "roar"}, {"id": "b", "label": "roarsed"}, {"id": "c", "label": "roarsing"}, {"id": "d", "label": "roars"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The kettle ____ every day."$tl$, $tl$[{"id": "a", "label": "whistle"}, {"id": "b", "label": "whistlesed"}, {"id": "c", "label": "whistles"}, {"id": "d", "label": "whistlesing"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The cat ____ every day."$tl$, $tl$[{"id": "a", "label": "sleeps"}, {"id": "b", "label": "sleep"}, {"id": "c", "label": "sleepsed"}, {"id": "d", "label": "sleepsing"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The teacher ____ every day."$tl$, $tl$[{"id": "a", "label": "writes"}, {"id": "b", "label": "write"}, {"id": "c", "label": "writesed"}, {"id": "d", "label": "writesing"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Choose the correct verb: "The river ____ every day."$tl$, $tl$[{"id": "a", "label": "flow"}, {"id": "b", "label": "flows"}, {"id": "c", "label": "flowsed"}, {"id": "d", "label": "flowsing"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$subject-verb-agreement$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Past-Tense Verbs (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$past-tense-verbs$tl$, $tl$Past-Tense Verbs$tl$, $tl$Past-tense verbs tell about something that already happened.$tl$, 2, $tl$L.2.1$tl$, 6
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Past-Tense Verbs$tl$, 2, $tl$[{"type": "explain", "title": "About: Past-Tense Verbs", "body": "Past-tense verbs tell about something that already happened."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the past tense of the verb \"draw\"?  The answer is drew."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "draw"?$tl$, null, $tl$drew$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "think"?$tl$, null, $tl$thought$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "see"?$tl$, null, $tl$saw$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "throw"?$tl$, null, $tl$threw$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "swim"?$tl$, null, $tl$swam$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "grow"?$tl$, null, $tl$grew$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "sing"?$tl$, null, $tl$sang$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "speak"?$tl$, null, $tl$spoke$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "make"?$tl$, null, $tl$made$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "write"?$tl$, null, $tl$wrote$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "teach"?$tl$, null, $tl$taught$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "drink"?$tl$, null, $tl$drank$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "eat"?$tl$, null, $tl$ate$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "give"?$tl$, null, $tl$gave$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "buy"?$tl$, null, $tl$bought$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "go"?$tl$, null, $tl$went$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "begin"?$tl$, null, $tl$began$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "bring"?$tl$, null, $tl$brought$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "know"?$tl$, null, $tl$knew$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$What is the past tense of the verb "fly"?$tl$, null, $tl$flew$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$past-tense-verbs$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Plural Nouns (L.2.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$plural-nouns$tl$, $tl$Plural Nouns$tl$, $tl$Plurals mean more than one. Add -s or -es, or change y to -ies.$tl$, 2, $tl$L.2.1$tl$, 7
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Plural Nouns$tl$, 2, $tl$[{"type": "explain", "title": "About: Plural Nouns", "body": "Plurals mean more than one. Add -s or -es, or change y to -ies."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Write the plural of \"fox\".  The answer is foxes."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "fox".$tl$, null, $tl$foxes$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "story".$tl$, null, $tl$stories$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "lady".$tl$, null, $tl$ladies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "knife".$tl$, null, $tl$knives$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "wish".$tl$, null, $tl$wishes$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "penny".$tl$, null, $tl$pennies$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "cherry".$tl$, null, $tl$cherries$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "baby".$tl$, null, $tl$babies$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "city".$tl$, null, $tl$cities$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "wolf".$tl$, null, $tl$wolves$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "loaf".$tl$, null, $tl$loaves$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "shelf".$tl$, null, $tl$shelves$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "box".$tl$, null, $tl$boxes$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "fairy".$tl$, null, $tl$fairies$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "branch".$tl$, null, $tl$branches$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "berry".$tl$, null, $tl$berries$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "puppy".$tl$, null, $tl$puppies$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "match".$tl$, null, $tl$matches$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "half".$tl$, null, $tl$halves$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$fill_in$tl$, $tl$Write the plural of "glass".$tl$, null, $tl$glasses$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$plural-nouns$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Capitalization (L.2.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$capitalization$tl$, $tl$Capitalization$tl$, $tl$Capitalize the first word of a sentence, the word I, and proper nouns.$tl$, 2, $tl$L.2.2$tl$, 8
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Capitalization$tl$, 2, $tl$[{"type": "explain", "title": "About: Capitalization", "body": "Capitalize the first word of a sentence, the word I, and proper nouns."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word or phrase is a proper noun that must be capitalized?  The correct answer is \"July\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word or phrase is a proper noun that must be capitalized?", "choices": [{"id": "a", "label": "Africa"}, {"id": "b", "label": "month"}, {"id": "c", "label": "day"}, {"id": "d", "label": "friend"}], "answer": "a", "explanation": "The correct answer is \"Africa\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "July"}, {"id": "b", "label": "month"}, {"id": "c", "label": "country"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Africa"}, {"id": "b", "label": "month"}, {"id": "c", "label": "day"}, {"id": "d", "label": "friend"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Nile River"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Amazon River"}, {"id": "b", "label": "month"}, {"id": "c", "label": "country"}, {"id": "d", "label": "river"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "Australia"}, {"id": "c", "label": "day"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Sarah"}, {"id": "b", "label": "country"}, {"id": "c", "label": "ocean"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "river"}, {"id": "c", "label": "London"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "country"}, {"id": "c", "label": "Maria"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "mountain"}, {"id": "b", "label": "Tokyo"}, {"id": "c", "label": "river"}, {"id": "d", "label": "month"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "city"}, {"id": "b", "label": "Pacific Ocean"}, {"id": "c", "label": "month"}, {"id": "d", "label": "day"}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "month"}, {"id": "b", "label": "Saturn"}, {"id": "c", "label": "country"}, {"id": "d", "label": "mountain"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "December"}, {"id": "b", "label": "river"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "country"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "day"}, {"id": "b", "label": "river"}, {"id": "c", "label": "India"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "Tuesday"}, {"id": "c", "label": "country"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "country"}, {"id": "c", "label": "Monday"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "day"}, {"id": "c", "label": "month"}, {"id": "d", "label": "Mount Everest"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "Friday"}, {"id": "b", "label": "river"}, {"id": "c", "label": "month"}, {"id": "d", "label": "city"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "friend"}, {"id": "b", "label": "mountain"}, {"id": "c", "label": "Canada"}, {"id": "d", "label": "ocean"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "ocean"}, {"id": "b", "label": "city"}, {"id": "c", "label": "friend"}, {"id": "d", "label": "October"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which word or phrase is a proper noun that must be capitalized?$tl$, $tl$[{"id": "a", "label": "river"}, {"id": "b", "label": "day"}, {"id": "c", "label": "city"}, {"id": "d", "label": "New York"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$capitalization$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] End Punctuation (L.2.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$end-punctuation$tl$, $tl$End Punctuation$tl$, $tl$End a sentence with a period, question mark, or exclamation point.$tl$, 2, $tl$L.2.2$tl$, 9
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: End Punctuation$tl$, 2, $tl$[{"type": "explain", "title": "About: End Punctuation", "body": "End a sentence with a period, question mark, or exclamation point."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which end mark best completes the sentence?  \"I love to read___\"  The correct answer is \".\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which end mark best completes the sentence?  \"We had lunch___\"", "choices": [{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}], "answer": "d", "explanation": "The correct answer is \".\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "I love to read___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We had lunch___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "."}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "When does it start___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Watch out___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Where are we going___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Can you help me___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Run for your life___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": ","}, {"id": "d", "label": "!"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "That is amazing___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Who is at the door___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What time is it___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": ","}, {"id": "d", "label": "?"}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "My dog is brown___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Look at that___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "We won the game___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Are you ready___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "!"}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "Stop right now___"$tl$, $tl$[{"id": "a", "label": "!"}, {"id": "b", "label": "."}, {"id": "c", "label": "?"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The cake is delicious___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "What a great show___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "How does it work___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "."}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "The sky is blue___"$tl$, $tl$[{"id": "a", "label": "."}, {"id": "b", "label": "?"}, {"id": "c", "label": "!"}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which end mark best completes the sentence?  "She likes apples___"$tl$, $tl$[{"id": "a", "label": "?"}, {"id": "b", "label": "!"}, {"id": "c", "label": "."}, {"id": "d", "label": ","}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$end-punctuation$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

-- ---- [writing] Commas in a Series (L.2.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$commas-in-a-series$tl$, $tl$Commas in a Series$tl$, $tl$Use commas to separate three or more items in a list.$tl$, 2, $tl$L.2.2$tl$, 10
from public.subjects s where s.slug = $tl$writing$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Commas in a Series$tl$, 2, $tl$[{"type": "explain", "title": "About: Commas in a Series", "body": "Use commas to separate three or more items in a list."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which sentence uses commas correctly in a list?  The correct answer is \"I like trains, planes, and buses.\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which sentence uses commas correctly in a list?", "choices": [{"id": "a", "label": "I like ham, cheese, and lettuce."}, {"id": "b", "label": "I like ham cheese and lettuce."}, {"id": "c", "label": "I like ham, cheese and lettuce"}, {"id": "d", "label": "I like, ham cheese lettuce."}], "answer": "a", "explanation": "The correct answer is \"I like ham, cheese, and lettuce.\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 2, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like trains planes and buses."}, {"id": "b", "label": "I like trains, planes and buses"}, {"id": "c", "label": "I like trains, planes, and buses."}, {"id": "d", "label": "I like, trains planes buses."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like ham, cheese, and lettuce."}, {"id": "b", "label": "I like ham cheese and lettuce."}, {"id": "c", "label": "I like ham, cheese and lettuce"}, {"id": "d", "label": "I like, ham cheese lettuce."}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like circles squares and triangles."}, {"id": "b", "label": "I like circles, squares and triangles"}, {"id": "c", "label": "I like, circles squares triangles."}, {"id": "d", "label": "I like circles, squares, and triangles."}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like rain, snow, and hail."}, {"id": "b", "label": "I like rain snow and hail."}, {"id": "c", "label": "I like rain, snow and hail"}, {"id": "d", "label": "I like, rain snow hail."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like soccer tennis and golf."}, {"id": "b", "label": "I like soccer, tennis, and golf."}, {"id": "c", "label": "I like soccer, tennis and golf"}, {"id": "d", "label": "I like, soccer tennis golf."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 2, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like Mom Dad and Grandma."}, {"id": "b", "label": "I like Mom, Dad and Grandma"}, {"id": "c", "label": "I like, Mom Dad Grandma."}, {"id": "d", "label": "I like Mom, Dad, and Grandma."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like walk skip and hop."}, {"id": "b", "label": "I like walk, skip, and hop."}, {"id": "c", "label": "I like walk, skip and hop"}, {"id": "d", "label": "I like, walk skip hop."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like spring summer and fall."}, {"id": "b", "label": "I like spring, summer, and fall."}, {"id": "c", "label": "I like spring, summer and fall"}, {"id": "d", "label": "I like, spring summer fall."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples oranges and pears."}, {"id": "b", "label": "I like apples, oranges and pears"}, {"id": "c", "label": "I like, apples oranges pears."}, {"id": "d", "label": "I like apples, oranges, and pears."}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like milk eggs and bread."}, {"id": "b", "label": "I like milk, eggs and bread"}, {"id": "c", "label": "I like, milk eggs bread."}, {"id": "d", "label": "I like milk, eggs, and bread."}]$tl$::jsonb, $tl$d$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 3$tl$, 2, 2
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 3$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like cats dogs and fish."}, {"id": "b", "label": "I like cats, dogs and fish"}, {"id": "c", "label": "I like cats, dogs, and fish."}, {"id": "d", "label": "I like, cats dogs fish."}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like books pens and rulers."}, {"id": "b", "label": "I like books, pens, and rulers."}, {"id": "c", "label": "I like books, pens and rulers"}, {"id": "d", "label": "I like, books pens rulers."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like red green and blue."}, {"id": "b", "label": "I like red, green and blue"}, {"id": "c", "label": "I like red, green, and blue."}, {"id": "d", "label": "I like, red green blue."}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like north, south, and east."}, {"id": "b", "label": "I like north south and east."}, {"id": "c", "label": "I like north, south and east"}, {"id": "d", "label": "I like, north south east."}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like run jump and swim."}, {"id": "b", "label": "I like run, jump, and swim."}, {"id": "c", "label": "I like run, jump and swim"}, {"id": "d", "label": "I like, run jump swim."}]$tl$::jsonb, $tl$b$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 3$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 4$tl$, 2, 3
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 4$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like lions tigers and bears."}, {"id": "b", "label": "I like lions, tigers and bears"}, {"id": "c", "label": "I like, lions tigers bears."}, {"id": "d", "label": "I like lions, tigers, and bears."}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like pencils pens and markers."}, {"id": "b", "label": "I like pencils, pens, and markers."}, {"id": "c", "label": "I like pencils, pens and markers"}, {"id": "d", "label": "I like, pencils pens markers."}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like apples grapes and plums."}, {"id": "b", "label": "I like apples, grapes, and plums."}, {"id": "c", "label": "I like apples, grapes and plums"}, {"id": "d", "label": "I like, apples grapes plums."}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like piano drums and guitar."}, {"id": "b", "label": "I like piano, drums, and guitar."}, {"id": "c", "label": "I like piano, drums and guitar"}, {"id": "d", "label": "I like, piano drums guitar."}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 2, $tl$mcq$tl$, $tl$Which sentence uses commas correctly in a list?$tl$, $tl$[{"id": "a", "label": "I like gold silver and bronze."}, {"id": "b", "label": "I like gold, silver and bronze"}, {"id": "c", "label": "I like gold, silver, and bronze."}, {"id": "d", "label": "I like, gold silver bronze."}]$tl$::jsonb, $tl$c$tl$, 10, 4
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$writing$tl$ and t.slug = $tl$commas-in-a-series$tl$ and t.grade_level = 2 and w.title = $tl$Worksheet 4$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 4);

