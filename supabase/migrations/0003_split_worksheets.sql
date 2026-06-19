-- =====================================================================
-- TopicLeap — split each topic's questions into 5-question worksheets.
-- Converts the old "one big worksheet per topic" layout into numbered
-- "Worksheet 1, 2, 3, ..." worksheets of 5 questions each.
--
-- NON-DESTRUCTIVE: the original worksheet row is reused as "Worksheet 1"
-- (so existing attempts/points stay attached); extra worksheets are created
-- for the remaining chunks. Idempotent: safe to run more than once.
--
-- Run AFTER the curriculum is loaded, in the Supabase SQL Editor.
-- =====================================================================

do $$
declare
  t       record;
  ws_ids  uuid[];
  qids    uuid[];
  total   int;
  needed  int;
  k       int;
  i       int;
  newid   uuid;
begin
  for t in select id, grade_level from public.topics loop
    -- existing worksheets for this topic, in order
    select array_agg(w.id order by w.sort_order, w.created_at)
      into ws_ids
      from public.worksheets w
      where w.topic_id = t.id;
    if ws_ids is null then
      continue;  -- topic has no worksheets
    end if;

    -- all questions for this topic, in stable order
    select array_agg(q.id order by w.sort_order, q.sort_order, q.created_at)
      into qids
      from public.questions q
      join public.worksheets w on w.id = q.worksheet_id
      where w.topic_id = t.id;
    if qids is null then
      continue;  -- no questions to chunk
    end if;

    total  := array_length(qids, 1);
    needed := ceil(total::numeric / 5);

    -- create extra worksheets if we need more than already exist
    for k in (coalesce(array_length(ws_ids, 1), 0) + 1)..needed loop
      insert into public.worksheets (topic_id, title, grade_level, sort_order)
      values (t.id, 'Worksheet ' || k, t.grade_level, k - 1)
      returning id into newid;
      ws_ids := ws_ids || newid;
    end loop;

    -- normalize title + order on the worksheets we keep
    for k in 1..needed loop
      update public.worksheets
        set title = 'Worksheet ' || k, sort_order = k - 1
      where id = ws_ids[k];
    end loop;

    -- distribute questions into chunks of 5 (sort_order 0..4 within each)
    for i in 1..total loop
      update public.questions
        set worksheet_id = ws_ids[((i - 1) / 5) + 1],
            sort_order   = ((i - 1) % 5)
      where id = qids[i];
    end loop;

    -- drop any leftover worksheets beyond what's needed (none in the
    -- typical one-worksheet-per-topic starting state)
    if array_length(ws_ids, 1) > needed then
      delete from public.worksheets
      where id = any(ws_ids[needed + 1 : array_length(ws_ids, 1)]);
    end if;
  end loop;
end $$;
