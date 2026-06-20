-- =====================================================================
-- TopicLeap - Kindergarten full curriculum seed (generated)
-- Lessons + worksheets of 4 questions each.
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

insert into public.subjects (slug, name, sort_order) values ($tl$letters$tl$, $tl$Letters & Writing$tl$, 4)
on conflict (slug) do update set name = excluded.name, sort_order = excluded.sort_order;

-- ---- [math] Counting to 10 (K.CC.B.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$counting-to-10$tl$, $tl$Counting to 10$tl$, $tl$Count the pictures one by one to find how many there are, all the way up to 10.$tl$, 0, $tl$K.CC.B.5$tl$, 1
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Counting to 10$tl$, 0, $tl$[{"type": "explain", "title": "About: Counting to 10", "body": "Count the pictures one by one to find how many there are, all the way up to 10."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: How many do you see?  \ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22  The correct answer is \"10\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "How many do you see?  \ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97", "choices": [{"id": "a", "label": "3"}, {"id": "b", "label": "1"}, {"id": "c", "label": "6"}, {"id": "d", "label": "10"}], "answer": "d", "explanation": "The correct answer is \"10\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🐢🐢🐢🐢🐢🐢🐢🐢🐢🐢$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "7"}, {"id": "c", "label": "2"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🚗🚗🚗🚗🚗🚗🚗🚗🚗🚗$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "1"}, {"id": "c", "label": "6"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🍌🍌🍌🍌🍌🍌🍌$tl$, $tl$[{"id": "a", "label": "8"}, {"id": "b", "label": "2"}, {"id": "c", "label": "6"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🍪🍪🍪🍪🍪🍪🍪🍪$tl$, $tl$[{"id": "a", "label": "8"}, {"id": "b", "label": "5"}, {"id": "c", "label": "10"}, {"id": "d", "label": "3"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🚗🚗🚗🚗🚗🚗🚗$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "2"}, {"id": "c", "label": "4"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🎈🎈🎈🎈🎈🎈🎈$tl$, $tl$[{"id": "a", "label": "6"}, {"id": "b", "label": "1"}, {"id": "c", "label": "7"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🐟🐟🐟🐟🐟🐟🐟🐟🐟$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "3"}, {"id": "c", "label": "9"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$How many do you see?  🍪🍪$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "2"}, {"id": "c", "label": "4"}, {"id": "d", "label": "3"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$counting-to-10$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [math] Number Recognition (K.CC.A.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$number-recognition$tl$, $tl$Number Recognition$tl$, $tl$Learn to spot and name the numbers 0 to 10 when you see them.$tl$, 0, $tl$K.CC.A.3$tl$, 2
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Number Recognition$tl$, 0, $tl$[{"type": "explain", "title": "About: Number Recognition", "body": "Learn to spot and name the numbers 0 to 10 when you see them."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is the number 3?  The correct answer is \"3\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is the number 7?", "choices": [{"id": "a", "label": "6"}, {"id": "b", "label": "9"}, {"id": "c", "label": "2"}, {"id": "d", "label": "7"}], "answer": "d", "explanation": "The correct answer is \"7\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 3?$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "9"}, {"id": "c", "label": "7"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 7?$tl$, $tl$[{"id": "a", "label": "6"}, {"id": "b", "label": "9"}, {"id": "c", "label": "2"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 10?$tl$, $tl$[{"id": "a", "label": "4"}, {"id": "b", "label": "10"}, {"id": "c", "label": "0"}, {"id": "d", "label": "3"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 4?$tl$, $tl$[{"id": "a", "label": "10"}, {"id": "b", "label": "4"}, {"id": "c", "label": "7"}, {"id": "d", "label": "9"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 6?$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "2"}, {"id": "c", "label": "6"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 8?$tl$, $tl$[{"id": "a", "label": "7"}, {"id": "b", "label": "8"}, {"id": "c", "label": "1"}, {"id": "d", "label": "10"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 7?$tl$, $tl$[{"id": "a", "label": "5"}, {"id": "b", "label": "7"}, {"id": "c", "label": "4"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is the number 5?$tl$, $tl$[{"id": "a", "label": "6"}, {"id": "b", "label": "9"}, {"id": "c", "label": "5"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$number-recognition$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [math] Shapes (K.G.A.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$shapes-basic$tl$, $tl$Shapes$tl$, $tl$Learn the names of basic shapes like circle, square, triangle, star, and heart.$tl$, 0, $tl$K.G.A.2$tl$, 3
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Shapes$tl$, 0, $tl$[{"type": "explain", "title": "About: Shapes", "body": "Learn the names of basic shapes like circle, square, triangle, star, and heart."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is a circle?  The correct answer is \"\u2b55\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is a heart?", "choices": [{"id": "a", "label": "\ud83d\udd36"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udd3a"}], "answer": "c", "explanation": "The correct answer is \"\u2764\ufe0f\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\u2b55"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a heart?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd36"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\u2764\ufe0f"}, {"id": "d", "label": "\ud83d\udd3a"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\u2b50"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a circle?$tl$, $tl$[{"id": "a", "label": "\u2b55"}, {"id": "b", "label": "\u2764\ufe0f"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83d\udd3a"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a triangle?$tl$, $tl$[{"id": "a", "label": "\u2b50"}, {"id": "b", "label": "\ud83d\udd36"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\u2b55"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a star?$tl$, $tl$[{"id": "a", "label": "\u2b50"}, {"id": "b", "label": "\u2b55"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\u2764\ufe0f"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a star?$tl$, $tl$[{"id": "a", "label": "\u2b50"}, {"id": "b", "label": "\u2b55"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\ud83d\udd36"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a diamond?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd36"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$shapes-basic$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [math] More & Fewer (K.CC.C.6) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$more-and-fewer$tl$, $tl$More & Fewer$tl$, $tl$Compare groups of things to see which group has more and which has fewer.$tl$, 0, $tl$K.CC.C.6$tl$, 4
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: More & Fewer$tl$, 0, $tl$[{"type": "explain", "title": "About: More & Fewer", "body": "Compare groups of things to see which group has more and which has fewer."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which group has the MOST?  The correct answer is \"\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which group has the MOST?", "choices": [{"id": "a", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}, {"id": "b", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}, {"id": "c", "label": "\ud83c\udf4e\ud83c\udf4e"}, {"id": "d", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}], "answer": "d", "explanation": "The correct answer is \"\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a"}, {"id": "b", "label": "\ud83c\udf6a\ud83c\udf6a"}, {"id": "c", "label": "\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a"}, {"id": "d", "label": "\ud83c\udf6a\ud83c\udf6a\ud83c\udf6a"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}, {"id": "b", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}, {"id": "c", "label": "\ud83c\udf4e\ud83c\udf4e"}, {"id": "d", "label": "\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e\ud83c\udf4e"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf88\ud83c\udf88\ud83c\udf88"}, {"id": "b", "label": "\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88"}, {"id": "c", "label": "\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88"}, {"id": "d", "label": "\ud83c\udf88\ud83c\udf88"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf38"}, {"id": "b", "label": "\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38"}, {"id": "c", "label": "\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38"}, {"id": "d", "label": "\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38\ud83c\udf38"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83d\ude97"}, {"id": "b", "label": "\ud83d\ude97\ud83d\ude97\ud83d\ude97"}, {"id": "c", "label": "\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97"}, {"id": "d", "label": "\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97\ud83d\ude97"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc22\ud83d\udc22"}, {"id": "b", "label": "\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22"}, {"id": "c", "label": "\ud83d\udc22\ud83d\udc22\ud83d\udc22\ud83d\udc22"}, {"id": "d", "label": "\ud83d\udc22"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\u2b50\u2b50\u2b50\u2b50\u2b50"}, {"id": "b", "label": "\u2b50\u2b50\u2b50"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\u2b50\u2b50"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which group has the MOST?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf88\ud83c\udf88"}, {"id": "b", "label": "\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88"}, {"id": "c", "label": "\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88\ud83c\udf88"}, {"id": "d", "label": "\ud83c\udf88"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$more-and-fewer$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [math] Adding to 5 (K.OA.A.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$adding-to-5$tl$, $tl$Adding to 5$tl$, $tl$Put two small groups together and count them all to add up to 5.$tl$, 0, $tl$K.OA.A.1$tl$, 5
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Adding to 5$tl$, 0, $tl$[{"type": "explain", "title": "About: Adding to 5", "body": "Put two small groups together and count them all to add up to 5."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Add them up:  \ud83d\udfe1 + \ud83d\udfe1\ud83d\udfe1 = ?  The correct answer is \"3\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Add them up:  \ud83d\udfe2\ud83d\udfe2\ud83d\udfe2 + \ud83d\udfe2 = ?", "choices": [{"id": "a", "label": "4"}, {"id": "b", "label": "6"}, {"id": "c", "label": "7"}, {"id": "d", "label": "8"}], "answer": "a", "explanation": "The correct answer is \"4\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🟡 + 🟡🟡 = ?$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "4"}, {"id": "c", "label": "6"}, {"id": "d", "label": "5"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🟢🟢🟢 + 🟢 = ?$tl$, $tl$[{"id": "a", "label": "4"}, {"id": "b", "label": "6"}, {"id": "c", "label": "7"}, {"id": "d", "label": "8"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🔴🔴🔴🔴 + 🔴 = ?$tl$, $tl$[{"id": "a", "label": "5"}, {"id": "b", "label": "1"}, {"id": "c", "label": "4"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🔴 + 🔴 = ?$tl$, $tl$[{"id": "a", "label": "8"}, {"id": "b", "label": "6"}, {"id": "c", "label": "2"}, {"id": "d", "label": "5"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🔵🔵 + 🔵🔵 = ?$tl$, $tl$[{"id": "a", "label": "1"}, {"id": "b", "label": "3"}, {"id": "c", "label": "4"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🟢 + 🟢🟢🟢 = ?$tl$, $tl$[{"id": "a", "label": "7"}, {"id": "b", "label": "9"}, {"id": "c", "label": "4"}, {"id": "d", "label": "2"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🔴🔴 + 🔴 = ?$tl$, $tl$[{"id": "a", "label": "3"}, {"id": "b", "label": "2"}, {"id": "c", "label": "5"}, {"id": "d", "label": "7"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Add them up:  🔵 + 🔵🔵🔵🔵 = ?$tl$, $tl$[{"id": "a", "label": "7"}, {"id": "b", "label": "5"}, {"id": "c", "label": "4"}, {"id": "d", "label": "9"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$adding-to-5$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [math] Patterns (K.MATH) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$patterns$tl$, $tl$Patterns$tl$, $tl$A pattern repeats over and over. Find what comes next in the pattern.$tl$, 0, $tl$K.MATH$tl$, 6
from public.subjects s where s.slug = $tl$math$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Patterns$tl$, 0, $tl$[{"type": "explain", "title": "About: Patterns", "body": "A pattern repeats over and over. Find what comes next in the pattern."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What comes next?  \ud83d\udd34\ud83d\udd35\ud83d\udd34\ud83d\udd35 ___  The correct answer is \"\ud83d\udd34\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "What comes next?  \ud83d\udd3a\ud83d\udfe6\ud83d\udd3a\ud83d\udfe6\ud83d\udd3a\ud83d\udfe6 ___", "choices": [{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udd35"}, {"id": "d", "label": "\ud83c\udf4c"}], "answer": "a", "explanation": "The correct answer is \"\ud83d\udd3a\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔴🔵🔴🔵 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udd35"}, {"id": "b", "label": "\ud83d\udd34"}, {"id": "c", "label": "\ud83c\udf4c"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔺🟦🔺🟦🔺🟦 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udd35"}, {"id": "d", "label": "\ud83c\udf4c"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔺🟦🔺🟦 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udd3a"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udc31"}, {"id": "d", "label": "\ud83d\udd34"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔴🔵🔴🔵 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udd34"}, {"id": "b", "label": "\ud83d\udd35"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\ud83c\udf4c"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔺🟦🔺🟦 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83d\udc31"}, {"id": "d", "label": "\ud83d\udd3a"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🔴🔵🔴🔵 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udd35"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udd34"}, {"id": "d", "label": "\ud83d\udc36"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🍎🍌🍎🍌🍎🍌 ___$tl$, $tl$[{"id": "a", "label": "\ud83c\udf4c"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83d\udd35"}, {"id": "d", "label": "\u2b50"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What comes next?  🐶🐱🐶🐱 ___$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83d\udd34"}, {"id": "d", "label": "\ud83d\udd35"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$math$tl$ and t.slug = $tl$patterns$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] Living & Nonliving (K-LS1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$living-and-nonliving$tl$, $tl$Living & Nonliving$tl$, $tl$Living things grow, eat, and need water. Nonliving things do not. Tell them apart!$tl$, 0, $tl$K-LS1$tl$, 1
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Living & Nonliving$tl$, 0, $tl$[{"type": "explain", "title": "About: Living & Nonliving", "body": "Living things grow, eat, and need water. Nonliving things do not. Tell them apart!"}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is ALIVE (living)?  The correct answer is \"\ud83c\udf33\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is ALIVE (living)?", "choices": [{"id": "a", "label": "\ud83e\uddf1"}, {"id": "b", "label": "\ud83e\udd44"}, {"id": "c", "label": "\ud83d\udcda"}, {"id": "d", "label": "\ud83d\udc36"}], "answer": "d", "explanation": "The correct answer is \"\ud83d\udc36\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\ud83e\udea8"}, {"id": "b", "label": "\ud83d\ude97"}, {"id": "c", "label": "\u26bd"}, {"id": "d", "label": "\ud83c\udf33"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\ud83e\uddf1"}, {"id": "b", "label": "\ud83e\udd44"}, {"id": "c", "label": "\ud83d\udcda"}, {"id": "d", "label": "\ud83d\udc36"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd11"}, {"id": "b", "label": "\ud83c\udf38"}, {"id": "c", "label": "\ud83e\ude91"}, {"id": "d", "label": "\ud83d\ude99"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\u231a"}, {"id": "b", "label": "\ud83d\udc1f"}, {"id": "c", "label": "\u270f\ufe0f"}, {"id": "d", "label": "\ud83e\udd64"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\ud83d\udcfa"}, {"id": "b", "label": "\ud83d\udc26"}, {"id": "c", "label": "\ud83e\udde6"}, {"id": "d", "label": "\ud83c\udf7d\ufe0f"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ALIVE (living)?$tl$, $tl$[{"id": "a", "label": "\ud83d\udeb2"}, {"id": "b", "label": "\ud83d\udd28"}, {"id": "c", "label": "\ud83e\udd8b"}, {"id": "d", "label": "\ud83e\uddf4"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is NOT living?$tl$, $tl$[{"id": "a", "label": "\ud83e\udea8"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83c\udf37"}, {"id": "d", "label": "\ud83d\udc22"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is NOT living?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf33"}, {"id": "b", "label": "\ud83d\udc36"}, {"id": "c", "label": "\ud83d\ude97"}, {"id": "d", "label": "\ud83d\udc1d"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$living-and-nonliving$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] The Five Senses (K-LS1-SENSES) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$five-senses$tl$, $tl$The Five Senses$tl$, $tl$We use our eyes, ears, nose, tongue, and hands to see, hear, smell, taste, and touch.$tl$, 0, $tl$K-LS1-SENSES$tl$, 2
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: The Five Senses$tl$, 0, $tl$[{"type": "explain", "title": "About: The Five Senses", "body": "We use our eyes, ears, nose, tongue, and hands to see, hear, smell, taste, and touch."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which part do you SEE with?  The correct answer is \"\ud83d\udc41\ufe0f\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which part do you HEAR with?", "choices": [{"id": "a", "label": "\ud83d\udc41\ufe0f"}, {"id": "b", "label": "\ud83d\udc43"}, {"id": "c", "label": "\ud83d\udc42"}, {"id": "d", "label": "\u270b"}], "answer": "c", "explanation": "The correct answer is \"\ud83d\udc42\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which part do you SEE with?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc41\ufe0f"}, {"id": "b", "label": "\ud83d\udc42"}, {"id": "c", "label": "\ud83d\udc43"}, {"id": "d", "label": "\ud83d\udc45"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which part do you HEAR with?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc41\ufe0f"}, {"id": "b", "label": "\ud83d\udc43"}, {"id": "c", "label": "\ud83d\udc42"}, {"id": "d", "label": "\u270b"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which part do you SMELL with?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc41\ufe0f"}, {"id": "b", "label": "\ud83d\udc43"}, {"id": "c", "label": "\ud83d\udc42"}, {"id": "d", "label": "\ud83d\udc45"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which part do you TASTE with?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc43"}, {"id": "b", "label": "\ud83d\udc42"}, {"id": "c", "label": "\ud83d\udc45"}, {"id": "d", "label": "\ud83d\udc41\ufe0f"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which part do you TOUCH and feel with?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc41\ufe0f"}, {"id": "b", "label": "\ud83d\udc42"}, {"id": "c", "label": "\ud83d\udc43"}, {"id": "d", "label": "\u270b"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$You use your eyes to:$tl$, $tl$[{"id": "a", "label": "hear"}, {"id": "b", "label": "smell"}, {"id": "c", "label": "see"}, {"id": "d", "label": "taste"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$You use your ears to:$tl$, $tl$[{"id": "a", "label": "see"}, {"id": "b", "label": "taste"}, {"id": "c", "label": "touch"}, {"id": "d", "label": "hear"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$You use your nose to:$tl$, $tl$[{"id": "a", "label": "smell"}, {"id": "b", "label": "hear"}, {"id": "c", "label": "see"}, {"id": "d", "label": "taste"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$five-senses$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] Weather (K-ESS2-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$weather-basics$tl$, $tl$Weather$tl$, $tl$Weather can be sunny, rainy, snowy, cloudy, or stormy. Learn what each one looks like.$tl$, 0, $tl$K-ESS2-1$tl$, 3
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Weather$tl$, 0, $tl$[{"type": "explain", "title": "About: Weather", "body": "Weather can be sunny, rainy, snowy, cloudy, or stormy. Learn what each one looks like."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one shows RAIN?  The correct answer is \"\ud83c\udf27\ufe0f\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one shows SUN?", "choices": [{"id": "a", "label": "\ud83c\udf27\ufe0f"}, {"id": "b", "label": "\u2744\ufe0f"}, {"id": "c", "label": "\u2601\ufe0f"}, {"id": "d", "label": "\u2600\ufe0f"}], "answer": "d", "explanation": "The correct answer is \"\u2600\ufe0f\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows RAIN?$tl$, $tl$[{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\u2744\ufe0f"}, {"id": "c", "label": "\ud83c\udf27\ufe0f"}, {"id": "d", "label": "\ud83c\udf08"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows SUN?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf27\ufe0f"}, {"id": "b", "label": "\u2744\ufe0f"}, {"id": "c", "label": "\u2601\ufe0f"}, {"id": "d", "label": "\u2600\ufe0f"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows SNOW?$tl$, $tl$[{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\ud83c\udf08"}, {"id": "c", "label": "\u2744\ufe0f"}, {"id": "d", "label": "\ud83c\udf27\ufe0f"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows a RAINBOW?$tl$, $tl$[{"id": "a", "label": "\u2601\ufe0f"}, {"id": "b", "label": "\ud83c\udf08"}, {"id": "c", "label": "\u2744\ufe0f"}, {"id": "d", "label": "\u2600\ufe0f"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows CLOUDS?$tl$, $tl$[{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\u2601\ufe0f"}, {"id": "c", "label": "\ud83c\udf08"}, {"id": "d", "label": "\u2744\ufe0f"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one shows a STORM?$tl$, $tl$[{"id": "a", "label": "\u26c8\ufe0f"}, {"id": "b", "label": "\u2600\ufe0f"}, {"id": "c", "label": "\ud83c\udf08"}, {"id": "d", "label": "\u2744\ufe0f"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What should you wear in the RAIN?$tl$, $tl$[{"id": "a", "label": "sunglasses"}, {"id": "b", "label": "a swimsuit"}, {"id": "c", "label": "sandals"}, {"id": "d", "label": "a raincoat"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What do you see on a SUNNY day?$tl$, $tl$[{"id": "a", "label": "\u2744\ufe0f"}, {"id": "b", "label": "\u2600\ufe0f"}, {"id": "c", "label": "\ud83c\udf27\ufe0f"}, {"id": "d", "label": "\u26c8\ufe0f"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$weather-basics$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] Animals & Sounds (K-LS1-ANIMALS) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$animals-and-sounds$tl$, $tl$Animals & Sounds$tl$, $tl$Different animals make different sounds and live in different places.$tl$, 0, $tl$K-LS1-ANIMALS$tl$, 4
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Animals & Sounds$tl$, 0, $tl$[{"type": "explain", "title": "About: Animals & Sounds", "body": "Different animals make different sounds and live in different places."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which animal says 'moo'?  The correct answer is \"\ud83d\udc04\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which animal says 'woof'?", "choices": [{"id": "a", "label": "\ud83d\udc04"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83d\udc36"}, {"id": "d", "label": "\ud83e\udd86"}], "answer": "c", "explanation": "The correct answer is \"\ud83d\udc36\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'moo'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83d\udc04"}, {"id": "d", "label": "\ud83d\udc14"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'woof'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc04"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83d\udc36"}, {"id": "d", "label": "\ud83e\udd86"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'meow'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc04"}, {"id": "c", "label": "\ud83d\udc31"}, {"id": "d", "label": "\ud83d\udc14"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'quack'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83e\udd86"}, {"id": "d", "label": "\ud83d\udc04"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'baa'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc37"}, {"id": "b", "label": "\ud83d\udc14"}, {"id": "c", "label": "\ud83d\udc36"}, {"id": "d", "label": "\ud83d\udc11"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'oink'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc11"}, {"id": "b", "label": "\ud83d\udc37"}, {"id": "c", "label": "\ud83d\udc04"}, {"id": "d", "label": "\ud83d\udc31"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal says 'cock-a-doodle-doo'?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc04"}, {"id": "c", "label": "\ud83d\udc14"}, {"id": "d", "label": "\ud83e\udd86"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal lives in the water?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83d\udc14"}, {"id": "d", "label": "\ud83d\udc1f"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$animals-and-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] What Plants Need (K-LS1-PLANTS) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$what-plants-need$tl$, $tl$What Plants Need$tl$, $tl$Plants need water, sunlight, air, and soil to grow big and strong.$tl$, 0, $tl$K-LS1-PLANTS$tl$, 5
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: What Plants Need$tl$, 0, $tl$[{"type": "explain", "title": "About: What Plants Need", "body": "Plants need water, sunlight, air, and soil to grow big and strong."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What do plants need to grow?  The correct answer is \"water and sunlight\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which helps a plant grow?", "choices": [{"id": "a", "label": "sunlight"}, {"id": "b", "label": "a hat"}, {"id": "c", "label": "a toy car"}, {"id": "d", "label": "a shoe"}], "answer": "a", "explanation": "The correct answer is \"sunlight\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What do plants need to grow?$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "toys"}, {"id": "c", "label": "shoes"}, {"id": "d", "label": "water and sunlight"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which helps a plant grow?$tl$, $tl$[{"id": "a", "label": "sunlight"}, {"id": "b", "label": "a hat"}, {"id": "c", "label": "a toy car"}, {"id": "d", "label": "a shoe"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Plants drink:$tl$, $tl$[{"id": "a", "label": "soda"}, {"id": "b", "label": "water"}, {"id": "c", "label": "milkshakes"}, {"id": "d", "label": "juice boxes"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Where do most plants grow?$tl$, $tl$[{"id": "a", "label": "in the closet"}, {"id": "b", "label": "in a box of toys"}, {"id": "c", "label": "in the soil (dirt)"}, {"id": "d", "label": "in the fridge"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What part of a plant grows under the ground?$tl$, $tl$[{"id": "a", "label": "roots"}, {"id": "b", "label": "flowers"}, {"id": "c", "label": "leaves"}, {"id": "d", "label": "fruit"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$A plant in a dark room with no light will:$tl$, $tl$[{"id": "a", "label": "grow super fast"}, {"id": "b", "label": "not grow well"}, {"id": "c", "label": "turn into an animal"}, {"id": "d", "label": "fly away"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a plant?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83c\udf3b"}, {"id": "c", "label": "\ud83d\ude97"}, {"id": "d", "label": "\ud83e\udea8"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Plants need air and:$tl$, $tl$[{"id": "a", "label": "candy"}, {"id": "b", "label": "water"}, {"id": "c", "label": "plastic"}, {"id": "d", "label": "toys"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$what-plants-need$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [science] Day & Night (K-ESS1-1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$day-and-night$tl$, $tl$Day & Night$tl$, $tl$In the day we see the Sun. At night we see the Moon and stars.$tl$, 0, $tl$K-ESS1-1$tl$, 6
from public.subjects s where s.slug = $tl$science$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Day & Night$tl$, 0, $tl$[{"type": "explain", "title": "About: Day & Night", "body": "In the day we see the Sun. At night we see the Moon and stars."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which do you see at NIGHT?  The correct answer is \"\ud83c\udf19\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which do you see in the DAY sky?", "choices": [{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\ud83c\udf19"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83e\udd89"}], "answer": "a", "explanation": "The correct answer is \"\u2600\ufe0f\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which do you see at NIGHT?$tl$, $tl$[{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\ud83c\udf08"}, {"id": "c", "label": "\ud83c\udf19"}, {"id": "d", "label": "\ud83c\udf3b"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which do you see in the DAY sky?$tl$, $tl$[{"id": "a", "label": "\u2600\ufe0f"}, {"id": "b", "label": "\ud83c\udf19"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83e\udd89"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which comes out at night?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf1e"}, {"id": "b", "label": "\ud83c\udf3b"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83d\udc1d"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$When is it dark outside?$tl$, $tl$[{"id": "a", "label": "at noon"}, {"id": "b", "label": "in the morning"}, {"id": "c", "label": "at lunchtime"}, {"id": "d", "label": "at night"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$When is it bright outside?$tl$, $tl$[{"id": "a", "label": "at midnight"}, {"id": "b", "label": "at night"}, {"id": "c", "label": "in the day"}, {"id": "d", "label": "in dreams"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which animal is awake at night?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc14"}, {"id": "b", "label": "\ud83d\udc1d"}, {"id": "c", "label": "\ud83e\udd89"}, {"id": "d", "label": "\ud83e\udd8b"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$We usually SLEEP during the:$tl$, $tl$[{"id": "a", "label": "morning"}, {"id": "b", "label": "afternoon"}, {"id": "c", "label": "night"}, {"id": "d", "label": "lunchtime"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$The Sun gives us:$tl$, $tl$[{"id": "a", "label": "light and warmth"}, {"id": "b", "label": "snow"}, {"id": "c", "label": "rain"}, {"id": "d", "label": "darkness"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$science$tl$ and t.slug = $tl$day-and-night$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Colors (K-COLORS) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$colors$tl$, $tl$Colors$tl$, $tl$Learn to name colors like red, blue, green, yellow, and more.$tl$, 0, $tl$K-COLORS$tl$, 1
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Colors$tl$, 0, $tl$[{"type": "explain", "title": "About: Colors", "body": "Learn to name colors like red, blue, green, yellow, and more."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is RED?  The correct answer is \"\ud83d\udfe5\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is BLUE?", "choices": [{"id": "a", "label": "\ud83d\udfe5"}, {"id": "b", "label": "\ud83d\udfe9"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\ud83d\udfea"}], "answer": "c", "explanation": "The correct answer is \"\ud83d\udfe6\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is RED?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe5"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udfe9"}, {"id": "d", "label": "\ud83d\udfe8"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is BLUE?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe5"}, {"id": "b", "label": "\ud83d\udfe9"}, {"id": "c", "label": "\ud83d\udfe6"}, {"id": "d", "label": "\ud83d\udfea"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is GREEN?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe9"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udfe8"}, {"id": "d", "label": "\ud83d\udfe5"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is YELLOW?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe8"}, {"id": "b", "label": "\ud83d\udfe7"}, {"id": "c", "label": "\ud83d\udfe9"}, {"id": "d", "label": "\ud83d\udfe6"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is ORANGE?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe8"}, {"id": "b", "label": "\ud83d\udfe5"}, {"id": "c", "label": "\ud83d\udfe7"}, {"id": "d", "label": "\ud83d\udfea"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is PURPLE?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\ud83d\udfea"}, {"id": "c", "label": "\ud83d\udfe5"}, {"id": "d", "label": "\ud83d\udfe9"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is BLACK?$tl$, $tl$[{"id": "a", "label": "\u2b1c"}, {"id": "b", "label": "\u2b1b"}, {"id": "c", "label": "\ud83d\udfe5"}, {"id": "d", "label": "\ud83d\udfe8"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is WHITE?$tl$, $tl$[{"id": "a", "label": "\u2b1b"}, {"id": "b", "label": "\ud83d\udfe6"}, {"id": "c", "label": "\ud83d\udfe9"}, {"id": "d", "label": "\u2b1c"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$colors$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Rhyming Words (RF.K.2) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$rhyming-words$tl$, $tl$Rhyming Words$tl$, $tl$Rhyming words sound the same at the end, like cat and hat.$tl$, 0, $tl$RF.K.2$tl$, 2
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Rhyming Words$tl$, 0, $tl$[{"type": "explain", "title": "About: Rhyming Words", "body": "Rhyming words sound the same at the end, like cat and hat."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word rhymes with CAT?  The correct answer is \"hat\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word rhymes with DOG?", "choices": [{"id": "a", "label": "log"}, {"id": "b", "label": "cat"}, {"id": "c", "label": "pen"}, {"id": "d", "label": "bus"}], "answer": "a", "explanation": "The correct answer is \"log\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with CAT?$tl$, $tl$[{"id": "a", "label": "dog"}, {"id": "b", "label": "sun"}, {"id": "c", "label": "cup"}, {"id": "d", "label": "hat"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with DOG?$tl$, $tl$[{"id": "a", "label": "log"}, {"id": "b", "label": "cat"}, {"id": "c", "label": "pen"}, {"id": "d", "label": "bus"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with SUN?$tl$, $tl$[{"id": "a", "label": "car"}, {"id": "b", "label": "top"}, {"id": "c", "label": "cup"}, {"id": "d", "label": "bun"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with BEE?$tl$, $tl$[{"id": "a", "label": "book"}, {"id": "b", "label": "ball"}, {"id": "c", "label": "cup"}, {"id": "d", "label": "tree"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with CAR?$tl$, $tl$[{"id": "a", "label": "sun"}, {"id": "b", "label": "dog"}, {"id": "c", "label": "hat"}, {"id": "d", "label": "star"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with CAKE?$tl$, $tl$[{"id": "a", "label": "milk"}, {"id": "b", "label": "ball"}, {"id": "c", "label": "lake"}, {"id": "d", "label": "top"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with RING?$tl$, $tl$[{"id": "a", "label": "king"}, {"id": "b", "label": "road"}, {"id": "c", "label": "cup"}, {"id": "d", "label": "fan"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word rhymes with TOP?$tl$, $tl$[{"id": "a", "label": "mop"}, {"id": "b", "label": "cat"}, {"id": "c", "label": "sun"}, {"id": "d", "label": "bee"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$rhyming-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Same & Different (K-SORT) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$same-and-different$tl$, $tl$Same & Different$tl$, $tl$Look closely to find the picture that is different from the others.$tl$, 0, $tl$K-SORT$tl$, 3
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Same & Different$tl$, 0, $tl$[{"type": "explain", "title": "About: Same & Different", "body": "Look closely to find the picture that is different from the others."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is DIFFERENT?  The correct answer is \"\ud83d\udc31\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is DIFFERENT?", "choices": [{"id": "a", "label": "\ud83c\udf4e"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83c\udf4e"}, {"id": "d", "label": "\u2b50"}], "answer": "d", "explanation": "The correct answer is \"\u2b50\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc31"}, {"id": "b", "label": "\ud83d\udc36"}, {"id": "c", "label": "\ud83d\udc36"}, {"id": "d", "label": "\ud83d\udc36"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf4e"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83c\udf4e"}, {"id": "d", "label": "\u2b50"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udd34"}, {"id": "b", "label": "\ud83d\udd34"}, {"id": "c", "label": "\ud83d\udd34"}, {"id": "d", "label": "\ud83d\udd35"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc1f"}, {"id": "b", "label": "\ud83c\udf38"}, {"id": "c", "label": "\ud83c\udf38"}, {"id": "d", "label": "\ud83c\udf38"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc36"}, {"id": "c", "label": "\ud83d\ude97"}, {"id": "d", "label": "\ud83d\udc36"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\u2b50"}, {"id": "b", "label": "\u2b50"}, {"id": "c", "label": "\u2b50"}, {"id": "d", "label": "\ud83c\udf4c"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udfe6"}, {"id": "b", "label": "\ud83d\udd3a"}, {"id": "c", "label": "\ud83d\udd3a"}, {"id": "d", "label": "\ud83d\udd3a"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is DIFFERENT?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc1d"}, {"id": "b", "label": "\ud83d\udc22"}, {"id": "c", "label": "\ud83d\udc1d"}, {"id": "d", "label": "\ud83d\udc1d"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$same-and-different$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Beginning Sounds (RF.K.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$beginning-sounds$tl$, $tl$Beginning Sounds$tl$, $tl$Listen for the first sound in a word, like the B sound at the start of 'bee'.$tl$, 0, $tl$RF.K.3$tl$, 4
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Beginning Sounds$tl$, 0, $tl$[{"type": "explain", "title": "About: Beginning Sounds", "body": "Listen for the first sound in a word, like the B sound at the start of 'bee'."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which picture starts with the B sound?  The correct answer is \"\ud83d\udc1d\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which picture starts with the S sound?", "choices": [{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83d\udc1d"}, {"id": "d", "label": "\u2600\ufe0f"}], "answer": "d", "explanation": "The correct answer is \"\u2600\ufe0f\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the B sound?$tl$, $tl$[{"id": "a", "label": "\ud83c\udf4e"}, {"id": "b", "label": "\ud83d\udc1d"}, {"id": "c", "label": "\ud83d\udc31"}, {"id": "d", "label": "\u2600\ufe0f"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the S sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83d\udc1d"}, {"id": "d", "label": "\u2600\ufe0f"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the C sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc1f"}, {"id": "b", "label": "\ud83d\udc31"}, {"id": "c", "label": "\ud83c\udf47"}, {"id": "d", "label": "\ud83c\udfa9"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the D sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc31"}, {"id": "b", "label": "\ud83d\udc36"}, {"id": "c", "label": "\ud83c\udf4e"}, {"id": "d", "label": "\ud83d\udc1d"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the F sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc31"}, {"id": "b", "label": "\ud83c\udf47"}, {"id": "c", "label": "\ud83d\udc1f"}, {"id": "d", "label": "\ud83c\udfa9"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the A sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc36"}, {"id": "b", "label": "\ud83d\udc1d"}, {"id": "c", "label": "\u2600\ufe0f"}, {"id": "d", "label": "\ud83c\udf4e"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the G sound?$tl$, $tl$[{"id": "a", "label": "\ud83d\udc31"}, {"id": "b", "label": "\ud83c\udfa9"}, {"id": "c", "label": "\ud83d\udc1f"}, {"id": "d", "label": "\ud83c\udf47"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which picture starts with the H sound?$tl$, $tl$[{"id": "a", "label": "\ud83c\udfa9"}, {"id": "b", "label": "\ud83c\udf4e"}, {"id": "c", "label": "\ud83d\udc1d"}, {"id": "d", "label": "\ud83d\udc1f"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$beginning-sounds$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Sight Words (RF.K.3c) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$sight-words$tl$, $tl$Sight Words$tl$, $tl$Sight words are little words we see a lot, like the, and, you, and see.$tl$, 0, $tl$RF.K.3c$tl$, 5
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Sight Words$tl$, 0, $tl$[{"type": "explain", "title": "About: Sight Words", "body": "Sight words are little words we see a lot, like the, and, you, and see."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which word is 'the'?  The correct answer is \"the\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which word is 'and'?", "choices": [{"id": "a", "label": "and"}, {"id": "b", "label": "the"}, {"id": "c", "label": "go"}, {"id": "d", "label": "my"}], "answer": "a", "explanation": "The correct answer is \"and\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'the'?$tl$, $tl$[{"id": "a", "label": "and"}, {"id": "b", "label": "you"}, {"id": "c", "label": "the"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'and'?$tl$, $tl$[{"id": "a", "label": "and"}, {"id": "b", "label": "the"}, {"id": "c", "label": "go"}, {"id": "d", "label": "my"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'you'?$tl$, $tl$[{"id": "a", "label": "is"}, {"id": "b", "label": "to"}, {"id": "c", "label": "see"}, {"id": "d", "label": "you"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'see'?$tl$, $tl$[{"id": "a", "label": "the"}, {"id": "b", "label": "my"}, {"id": "c", "label": "go"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'go'?$tl$, $tl$[{"id": "a", "label": "is"}, {"id": "b", "label": "you"}, {"id": "c", "label": "go"}, {"id": "d", "label": "and"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'my'?$tl$, $tl$[{"id": "a", "label": "to"}, {"id": "b", "label": "the"}, {"id": "c", "label": "my"}, {"id": "d", "label": "see"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'is'?$tl$, $tl$[{"id": "a", "label": "go"}, {"id": "b", "label": "is"}, {"id": "c", "label": "you"}, {"id": "d", "label": "and"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which word is 'to'?$tl$, $tl$[{"id": "a", "label": "my"}, {"id": "b", "label": "to"}, {"id": "c", "label": "see"}, {"id": "d", "label": "the"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$sight-words$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [reading] Opposites (L.K.5) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$opposites$tl$, $tl$Opposites$tl$, $tl$Opposites are words that mean very different things, like big and small.$tl$, 0, $tl$L.K.5$tl$, 6
from public.subjects s where s.slug = $tl$reading$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Opposites$tl$, 0, $tl$[{"type": "explain", "title": "About: Opposites", "body": "Opposites are words that mean very different things, like big and small."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: What is the opposite of BIG?  The correct answer is \"small\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "What is the opposite of HOT?", "choices": [{"id": "a", "label": "warm"}, {"id": "b", "label": "wet"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "cold"}], "answer": "d", "explanation": "The correct answer is \"cold\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of BIG?$tl$, $tl$[{"id": "a", "label": "tall"}, {"id": "b", "label": "red"}, {"id": "c", "label": "fast"}, {"id": "d", "label": "small"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of HOT?$tl$, $tl$[{"id": "a", "label": "warm"}, {"id": "b", "label": "wet"}, {"id": "c", "label": "loud"}, {"id": "d", "label": "cold"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of UP?$tl$, $tl$[{"id": "a", "label": "high"}, {"id": "b", "label": "top"}, {"id": "c", "label": "over"}, {"id": "d", "label": "down"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of DAY?$tl$, $tl$[{"id": "a", "label": "noon"}, {"id": "b", "label": "sun"}, {"id": "c", "label": "night"}, {"id": "d", "label": "sky"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of HAPPY?$tl$, $tl$[{"id": "a", "label": "glad"}, {"id": "b", "label": "silly"}, {"id": "c", "label": "sad"}, {"id": "d", "label": "kind"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of FAST?$tl$, $tl$[{"id": "a", "label": "quick"}, {"id": "b", "label": "slow"}, {"id": "c", "label": "tall"}, {"id": "d", "label": "big"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of OPEN?$tl$, $tl$[{"id": "a", "label": "closed"}, {"id": "b", "label": "wide"}, {"id": "c", "label": "door"}, {"id": "d", "label": "in"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$What is the opposite of FULL?$tl$, $tl$[{"id": "a", "label": "empty"}, {"id": "b", "label": "heavy"}, {"id": "c", "label": "big"}, {"id": "d", "label": "more"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$reading$tl$ and t.slug = $tl$opposites$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] Uppercase Letters (RF.K.1d) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$uppercase-letters$tl$, $tl$Uppercase Letters$tl$, $tl$Uppercase (big) letters are the tall capital letters like A, B, and C.$tl$, 0, $tl$RF.K.1d$tl$, 1
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Uppercase Letters$tl$, 0, $tl$[{"type": "explain", "title": "About: Uppercase Letters", "body": "Uppercase (big) letters are the tall capital letters like A, B, and C."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Tap the big (uppercase) letter H.  The correct answer is \"H\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Tap the big (uppercase) letter Y.", "choices": [{"id": "a", "label": "Y"}, {"id": "b", "label": "E"}, {"id": "c", "label": "M"}, {"id": "d", "label": "G"}], "answer": "a", "explanation": "The correct answer is \"Y\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter H.$tl$, $tl$[{"id": "a", "label": "L"}, {"id": "b", "label": "P"}, {"id": "c", "label": "H"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter Y.$tl$, $tl$[{"id": "a", "label": "Y"}, {"id": "b", "label": "E"}, {"id": "c", "label": "M"}, {"id": "d", "label": "G"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter J.$tl$, $tl$[{"id": "a", "label": "T"}, {"id": "b", "label": "J"}, {"id": "c", "label": "D"}, {"id": "d", "label": "S"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter O.$tl$, $tl$[{"id": "a", "label": "O"}, {"id": "b", "label": "C"}, {"id": "c", "label": "N"}, {"id": "d", "label": "T"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter U.$tl$, $tl$[{"id": "a", "label": "M"}, {"id": "b", "label": "Q"}, {"id": "c", "label": "F"}, {"id": "d", "label": "U"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter A.$tl$, $tl$[{"id": "a", "label": "K"}, {"id": "b", "label": "C"}, {"id": "c", "label": "A"}, {"id": "d", "label": "L"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter R.$tl$, $tl$[{"id": "a", "label": "R"}, {"id": "b", "label": "F"}, {"id": "c", "label": "U"}, {"id": "d", "label": "D"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the big (uppercase) letter G.$tl$, $tl$[{"id": "a", "label": "H"}, {"id": "b", "label": "O"}, {"id": "c", "label": "G"}, {"id": "d", "label": "Z"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$uppercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] Lowercase Letters (RF.K.1d) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$lowercase-letters$tl$, $tl$Lowercase Letters$tl$, $tl$Lowercase (small) letters are the little letters like a, b, and c.$tl$, 0, $tl$RF.K.1d$tl$, 2
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Lowercase Letters$tl$, 0, $tl$[{"type": "explain", "title": "About: Lowercase Letters", "body": "Lowercase (small) letters are the little letters like a, b, and c."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Tap the small (lowercase) letter o.  The correct answer is \"o\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Tap the small (lowercase) letter x.", "choices": [{"id": "a", "label": "e"}, {"id": "b", "label": "r"}, {"id": "c", "label": "x"}, {"id": "d", "label": "h"}], "answer": "c", "explanation": "The correct answer is \"x\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter o.$tl$, $tl$[{"id": "a", "label": "o"}, {"id": "b", "label": "p"}, {"id": "c", "label": "k"}, {"id": "d", "label": "b"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter x.$tl$, $tl$[{"id": "a", "label": "e"}, {"id": "b", "label": "r"}, {"id": "c", "label": "x"}, {"id": "d", "label": "h"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter o.$tl$, $tl$[{"id": "a", "label": "i"}, {"id": "b", "label": "k"}, {"id": "c", "label": "j"}, {"id": "d", "label": "o"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter n.$tl$, $tl$[{"id": "a", "label": "k"}, {"id": "b", "label": "y"}, {"id": "c", "label": "n"}, {"id": "d", "label": "f"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter w.$tl$, $tl$[{"id": "a", "label": "c"}, {"id": "b", "label": "u"}, {"id": "c", "label": "w"}, {"id": "d", "label": "d"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter a.$tl$, $tl$[{"id": "a", "label": "s"}, {"id": "b", "label": "i"}, {"id": "c", "label": "a"}, {"id": "d", "label": "w"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter r.$tl$, $tl$[{"id": "a", "label": "k"}, {"id": "b", "label": "q"}, {"id": "c", "label": "r"}, {"id": "d", "label": "j"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Tap the small (lowercase) letter f.$tl$, $tl$[{"id": "a", "label": "f"}, {"id": "b", "label": "h"}, {"id": "c", "label": "c"}, {"id": "d", "label": "k"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$lowercase-letters$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] Match Big & Small (RF.K.1d) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$match-upper-and-lower$tl$, $tl$Match Big & Small$tl$, $tl$Every big letter has a matching small letter, like A and a.$tl$, 0, $tl$RF.K.1d$tl$, 3
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Match Big & Small$tl$, 0, $tl$[{"type": "explain", "title": "About: Match Big & Small", "body": "Every big letter has a matching small letter, like A and a."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which small letter matches W?  The correct answer is \"w\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which small letter matches W?", "choices": [{"id": "a", "label": "r"}, {"id": "b", "label": "w"}, {"id": "c", "label": "p"}, {"id": "d", "label": "g"}], "answer": "b", "explanation": "The correct answer is \"w\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches W?$tl$, $tl$[{"id": "a", "label": "t"}, {"id": "b", "label": "s"}, {"id": "c", "label": "f"}, {"id": "d", "label": "w"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches W?$tl$, $tl$[{"id": "a", "label": "r"}, {"id": "b", "label": "w"}, {"id": "c", "label": "p"}, {"id": "d", "label": "g"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches I?$tl$, $tl$[{"id": "a", "label": "b"}, {"id": "b", "label": "i"}, {"id": "c", "label": "s"}, {"id": "d", "label": "k"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches L?$tl$, $tl$[{"id": "a", "label": "s"}, {"id": "b", "label": "g"}, {"id": "c", "label": "l"}, {"id": "d", "label": "o"}]$tl$::jsonb, $tl$c$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches W?$tl$, $tl$[{"id": "a", "label": "w"}, {"id": "b", "label": "k"}, {"id": "c", "label": "t"}, {"id": "d", "label": "j"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches Y?$tl$, $tl$[{"id": "a", "label": "i"}, {"id": "b", "label": "j"}, {"id": "c", "label": "y"}, {"id": "d", "label": "s"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches U?$tl$, $tl$[{"id": "a", "label": "f"}, {"id": "b", "label": "g"}, {"id": "c", "label": "l"}, {"id": "d", "label": "u"}]$tl$::jsonb, $tl$d$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which small letter matches J?$tl$, $tl$[{"id": "a", "label": "i"}, {"id": "b", "label": "e"}, {"id": "c", "label": "b"}, {"id": "d", "label": "j"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$match-upper-and-lower$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] Alphabet Order (RF.K.1) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$alphabet-order$tl$, $tl$Alphabet Order$tl$, $tl$The letters of the alphabet go in order: A, B, C, D, and on to Z.$tl$, 0, $tl$RF.K.1$tl$, 4
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Alphabet Order$tl$, 0, $tl$[{"type": "explain", "title": "About: Alphabet Order", "body": "The letters of the alphabet go in order: A, B, C, D, and on to Z."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which letter comes right after Q?  The correct answer is \"R\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which letter comes right after E?", "choices": [{"id": "a", "label": "H"}, {"id": "b", "label": "F"}, {"id": "c", "label": "B"}, {"id": "d", "label": "R"}], "answer": "b", "explanation": "The correct answer is \"F\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after Q?$tl$, $tl$[{"id": "a", "label": "U"}, {"id": "b", "label": "R"}, {"id": "c", "label": "X"}, {"id": "d", "label": "Z"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after E?$tl$, $tl$[{"id": "a", "label": "H"}, {"id": "b", "label": "F"}, {"id": "c", "label": "B"}, {"id": "d", "label": "R"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after J?$tl$, $tl$[{"id": "a", "label": "Z"}, {"id": "b", "label": "K"}, {"id": "c", "label": "R"}, {"id": "d", "label": "V"}]$tl$::jsonb, $tl$b$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after E?$tl$, $tl$[{"id": "a", "label": "J"}, {"id": "b", "label": "F"}, {"id": "c", "label": "Z"}, {"id": "d", "label": "S"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after X?$tl$, $tl$[{"id": "a", "label": "M"}, {"id": "b", "label": "V"}, {"id": "c", "label": "H"}, {"id": "d", "label": "Y"}]$tl$::jsonb, $tl$d$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after T?$tl$, $tl$[{"id": "a", "label": "H"}, {"id": "b", "label": "U"}, {"id": "c", "label": "N"}, {"id": "d", "label": "O"}]$tl$::jsonb, $tl$b$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after K?$tl$, $tl$[{"id": "a", "label": "L"}, {"id": "b", "label": "N"}, {"id": "c", "label": "B"}, {"id": "d", "label": "I"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter comes right after H?$tl$, $tl$[{"id": "a", "label": "I"}, {"id": "b", "label": "T"}, {"id": "c", "label": "V"}, {"id": "d", "label": "K"}]$tl$::jsonb, $tl$a$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$alphabet-order$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] Vowels (RF.K.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$vowels$tl$, $tl$Vowels$tl$, $tl$The vowels are A, E, I, O, and U. Every word needs a vowel.$tl$, 0, $tl$RF.K.3$tl$, 5
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: Vowels$tl$, 0, $tl$[{"type": "explain", "title": "About: Vowels", "body": "The vowels are A, E, I, O, and U. Every word needs a vowel."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which one is a vowel?  The correct answer is \"O\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which one is a vowel?", "choices": [{"id": "a", "label": "J"}, {"id": "b", "label": "F"}, {"id": "c", "label": "I"}, {"id": "d", "label": "T"}], "answer": "c", "explanation": "The correct answer is \"I\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "X"}, {"id": "b", "label": "F"}, {"id": "c", "label": "O"}, {"id": "d", "label": "Y"}]$tl$::jsonb, $tl$c$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "J"}, {"id": "b", "label": "F"}, {"id": "c", "label": "I"}, {"id": "d", "label": "T"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "X"}, {"id": "b", "label": "N"}, {"id": "c", "label": "E"}, {"id": "d", "label": "T"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "W"}, {"id": "b", "label": "N"}, {"id": "c", "label": "H"}, {"id": "d", "label": "U"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "M"}, {"id": "b", "label": "U"}, {"id": "c", "label": "T"}, {"id": "d", "label": "Z"}]$tl$::jsonb, $tl$b$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "F"}, {"id": "b", "label": "C"}, {"id": "c", "label": "E"}, {"id": "d", "label": "N"}]$tl$::jsonb, $tl$c$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "Q"}, {"id": "b", "label": "M"}, {"id": "c", "label": "I"}, {"id": "d", "label": "B"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which one is a vowel?$tl$, $tl$[{"id": "a", "label": "Q"}, {"id": "b", "label": "X"}, {"id": "c", "label": "M"}, {"id": "d", "label": "A"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$vowels$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

-- ---- [letters] First Letters (RF.K.3) ----
insert into public.topics (subject_id, slug, name, description, grade_level, standard_code, sort_order)
select s.id, $tl$beginning-letter$tl$, $tl$First Letters$tl$, $tl$Match a picture to the letter its name begins with.$tl$, 0, $tl$RF.K.3$tl$, 6
from public.subjects s where s.slug = $tl$letters$tl$
on conflict (subject_id, grade_level, slug) do update set name = excluded.name, description = excluded.description, standard_code = excluded.standard_code, sort_order = excluded.sort_order;
insert into public.lessons (topic_id, title, grade_level, steps, sort_order)
select t.id, $tl$Learn: First Letters$tl$, 0, $tl$[{"type": "explain", "title": "About: First Letters", "body": "Match a picture to the letter its name begins with."}, {"type": "worked_example", "title": "Worked example", "body": "Try this one: Which letter does this word start with?  \ud83c\udf4e (apple)  The correct answer is \"A\"."}, {"type": "check", "title": "Quick check", "body": "Pick the best answer.", "prompt": "Which letter does this word start with?  \ud83d\udc1d (bee)", "choices": [{"id": "a", "label": "B"}, {"id": "b", "label": "A"}, {"id": "c", "label": "C"}, {"id": "d", "label": "S"}], "answer": "a", "explanation": "The correct answer is \"B\"."}]$tl$::jsonb, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0
and not exists (select 1 from public.lessons l where l.topic_id = t.id);
insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 1$tl$, 0, 0
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 1$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🍎 (apple)$tl$, $tl$[{"id": "a", "label": "A"}, {"id": "b", "label": "B"}, {"id": "c", "label": "C"}, {"id": "d", "label": "D"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🐝 (bee)$tl$, $tl$[{"id": "a", "label": "B"}, {"id": "b", "label": "A"}, {"id": "c", "label": "C"}, {"id": "d", "label": "S"}]$tl$::jsonb, $tl$a$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🐱 (cat)$tl$, $tl$[{"id": "a", "label": "A"}, {"id": "b", "label": "B"}, {"id": "c", "label": "C"}, {"id": "d", "label": "D"}]$tl$::jsonb, $tl$c$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🐶 (dog)$tl$, $tl$[{"id": "a", "label": "B"}, {"id": "b", "label": "C"}, {"id": "c", "label": "P"}, {"id": "d", "label": "D"}]$tl$::jsonb, $tl$d$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 1$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

insert into public.worksheets (topic_id, title, grade_level, sort_order)
select t.id, $tl$Worksheet 2$tl$, 0, 1
from public.topics t join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0
and not exists (select 1 from public.worksheets w where w.topic_id = t.id and w.title = $tl$Worksheet 2$tl$);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🥚 (egg)$tl$, $tl$[{"id": "a", "label": "E"}, {"id": "b", "label": "A"}, {"id": "c", "label": "I"}, {"id": "d", "label": "O"}]$tl$::jsonb, $tl$a$tl$, 10, 0
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 0);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🐟 (fish)$tl$, $tl$[{"id": "a", "label": "S"}, {"id": "b", "label": "V"}, {"id": "c", "label": "T"}, {"id": "d", "label": "F"}]$tl$::jsonb, $tl$d$tl$, 10, 1
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 1);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🍇 (grapes)$tl$, $tl$[{"id": "a", "label": "G"}, {"id": "b", "label": "J"}, {"id": "c", "label": "C"}, {"id": "d", "label": "Q"}]$tl$::jsonb, $tl$a$tl$, 10, 2
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 2);
insert into public.questions (worksheet_id, grade_level, question_type, prompt, choices, correct_answer, points, sort_order)
select w.id, 0, $tl$mcq$tl$, $tl$Which letter does this word start with?  🎩 (hat)$tl$, $tl$[{"id": "a", "label": "A"}, {"id": "b", "label": "H"}, {"id": "c", "label": "N"}, {"id": "d", "label": "M"}]$tl$::jsonb, $tl$b$tl$, 10, 3
from public.worksheets w join public.topics t on t.id = w.topic_id join public.subjects s on s.id = t.subject_id
where s.slug = $tl$letters$tl$ and t.slug = $tl$beginning-letter$tl$ and t.grade_level = 0 and w.title = $tl$Worksheet 2$tl$
and not exists (select 1 from public.questions q where q.worksheet_id = w.id and q.sort_order = 3);

