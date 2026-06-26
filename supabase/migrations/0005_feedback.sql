-- =====================================================================
-- TopicLeap — site-wide Feedback / Support submissions.
-- Anyone (logged in or not) can send feedback from the public /feedback
-- page. Writes happen server-side with the service role, so RLS blocks all
-- direct client reads/writes; a future admin dashboard reads via service role.
-- Run AFTER 0001_init.sql in the Supabase SQL Editor. Non-destructive.
-- =====================================================================

create table if not exists public.feedback (
  id          uuid primary key default gen_random_uuid(),
  full_name   text not null,
  is_parent   boolean,
  message     text not null,
  user_agent  text,
  created_at  timestamptz not null default now()
);

create index if not exists feedback_created_idx
  on public.feedback (created_at desc);

-- RLS on, with NO policies: only the service-role key (used by the API
-- route) can read or write. Direct anon/authenticated access is denied.
alter table public.feedback enable row level security;
