-- =====================================================================
-- TopicLeap — Milestone add-on: motivational kid progress summaries
-- One row per child, refreshed after each completed worksheet.
-- Written server-side with the service-role key; read within the family.
-- Run AFTER 0001_init.sql in the Supabase SQL Editor. Non-destructive.
-- =====================================================================

create table if not exists public.kid_summaries (
  child_id              uuid primary key references public.children(id) on delete cascade,
  summary               text not null,
  total_points          int  not null default 0,
  topics_completed      int  not null default 0,
  accuracy              int  not null default 0,
  worksheets_completed  int  not null default 0,
  generated_at          timestamptz not null default now()
);

alter table public.kid_summaries enable row level security;

-- A family can read its own children's summaries.
drop policy if exists "family summary read" on public.kid_summaries;
create policy "family summary read" on public.kid_summaries
  for select to authenticated
  using (
    child_id in (
      select id from public.children where parent_id = public.current_parent_id()
    )
  );
