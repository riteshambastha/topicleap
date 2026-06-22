-- =====================================================================
-- TopicLeap — let kids flag a question that looks wrong.
-- Reports are written server-side (service-role) and readable within the
-- family. A future admin dashboard will read these across all families.
-- Run AFTER 0001_init.sql in the Supabase SQL Editor. Non-destructive.
-- =====================================================================

create table if not exists public.question_reports (
  id            uuid primary key default gen_random_uuid(),
  child_id      uuid references public.children(id) on delete cascade,
  question_id   uuid references public.questions(id) on delete cascade,
  worksheet_id  uuid references public.worksheets(id) on delete set null,
  message       text,
  created_at    timestamptz not null default now()
);

create index if not exists question_reports_question_idx
  on public.question_reports (question_id);

alter table public.question_reports enable row level security;

-- A family can read its own children's reports (admins will use the
-- service role to read everything later).
drop policy if exists "family reports read" on public.question_reports;
create policy "family reports read" on public.question_reports
  for select to authenticated
  using (
    child_id in (
      select id from public.children where parent_id = public.current_parent_id()
    )
  );
