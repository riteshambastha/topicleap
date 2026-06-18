-- =====================================================================
-- TopicLeap — Milestone 1 schema
-- Grade 4 only for v1, but architected multi-tenant / public-ready.
-- grade_level is a first-class column on every content + learner table,
-- so other grades are added later as DATA, not a schema rewrite.
-- =====================================================================

create extension if not exists "pgcrypto";  -- gen_random_uuid()

-- =====================================================================
-- ACCOUNTS
-- A "family" = one parent (root) + their supervised children.
-- Both parents and children map to a row in auth.users:
--   * parent  -> real email + password
--   * child   -> synthetic email (username@kids.topicleap.com) + PIN as password
-- Children are created server-side with the service-role key.
-- =====================================================================

create table public.parents (
  id            uuid primary key default gen_random_uuid(),
  auth_user_id  uuid not null unique references auth.users(id) on delete cascade,
  email         text not null,
  display_name  text not null default 'Parent',
  created_at    timestamptz not null default now()
);

create table public.children (
  id            uuid primary key default gen_random_uuid(),
  parent_id     uuid not null references public.parents(id) on delete cascade,
  auth_user_id  uuid not null unique references auth.users(id) on delete cascade,
  username      text not null unique,          -- what the kid types to log in
  display_name  text not null,
  grade_level   int  not null,                 -- first-class field (v1 = 4)
  created_at    timestamptz not null default now()
);

create index on public.children (parent_id);

-- =====================================================================
-- CONTENT CATALOG (shared across all families — the "public-ready" part)
-- subjects -> topics -> lessons / worksheets -> questions
-- =====================================================================

create table public.subjects (
  id          uuid primary key default gen_random_uuid(),
  slug        text not null unique,            -- 'math'
  name        text not null,                   -- 'Math'
  sort_order  int  not null default 0,
  created_at  timestamptz not null default now()
);

create table public.topics (
  id             uuid primary key default gen_random_uuid(),
  subject_id     uuid not null references public.subjects(id) on delete cascade,
  slug           text not null,                -- 'multiply-multi-digit-by-one-digit'
  name           text not null,
  description    text,
  grade_level    int  not null,                -- first-class field
  standard_code  text,                         -- e.g. '4.NBT.B.5'
  sort_order     int  not null default 0,
  created_at     timestamptz not null default now(),
  unique (subject_id, grade_level, slug)
);

create index on public.topics (subject_id, grade_level);

-- A lesson is a step-by-step interactive walk-through.
-- Steps are stored as an ordered JSONB array; each step is:
--   { "type": "explain" | "worked_example" | "check", "title": "...", "body": "...", ... }
-- "check" steps may carry an inline question (answer/choices) for a quick gut-check
-- (these are NOT graded/scored — scoring lives in worksheets).
create table public.lessons (
  id           uuid primary key default gen_random_uuid(),
  topic_id     uuid not null references public.topics(id) on delete cascade,
  title        text not null,
  grade_level  int  not null,                  -- first-class field
  steps        jsonb not null default '[]'::jsonb,
  sort_order   int  not null default 0,
  created_at   timestamptz not null default now()
);

create index on public.lessons (topic_id);

create table public.worksheets (
  id           uuid primary key default gen_random_uuid(),
  topic_id     uuid not null references public.topics(id) on delete cascade,
  title        text not null,
  grade_level  int  not null,                  -- first-class field
  sort_order   int  not null default 0,
  created_at   timestamptz not null default now()
);

create index on public.worksheets (topic_id);

-- Auto-gradable questions only in M1: multiple-choice or fill-in.
--   mcq:     choices = [{ "id": "a", "label": "..." }, ...], correct_answer = "a"
--   fill_in: choices = null, correct_answer = canonical string (graded
--            case-insensitively after trimming whitespace)
create table public.questions (
  id              uuid primary key default gen_random_uuid(),
  worksheet_id    uuid not null references public.worksheets(id) on delete cascade,
  grade_level     int  not null,               -- first-class field
  question_type   text not null check (question_type in ('mcq', 'fill_in')),
  prompt          text not null,
  choices         jsonb,                        -- mcq only
  correct_answer  text not null,                -- never sent to the browser
  points          int  not null default 10,
  sort_order      int  not null default 0,
  created_at      timestamptz not null default now()
);

create index on public.questions (worksheet_id);

-- =====================================================================
-- LEARNER ACTIVITY (per-child, family-scoped)
-- =====================================================================

create table public.attempts (
  id             uuid primary key default gen_random_uuid(),
  child_id       uuid not null references public.children(id) on delete cascade,
  worksheet_id   uuid not null references public.worksheets(id) on delete cascade,
  status         text not null default 'in_progress'
                   check (status in ('in_progress', 'completed')),
  total_questions int not null default 0,
  correct_count   int not null default 0,
  points_earned   int not null default 0,
  started_at     timestamptz not null default now(),
  completed_at   timestamptz
);

create index on public.attempts (child_id);
create index on public.attempts (worksheet_id);

create table public.answers (
  id              uuid primary key default gen_random_uuid(),
  attempt_id      uuid not null references public.attempts(id) on delete cascade,
  question_id     uuid not null references public.questions(id) on delete cascade,
  response        text,                          -- what the kid submitted
  is_correct      boolean not null default false,
  points_awarded  int not null default 0,
  created_at      timestamptz not null default now(),
  unique (attempt_id, question_id)
);

create index on public.answers (attempt_id);

-- Append-only points history. Leaderboard UI comes in a later milestone;
-- M1 just writes the rows.
create table public.points_ledger (
  id           uuid primary key default gen_random_uuid(),
  child_id     uuid not null references public.children(id) on delete cascade,
  points       int  not null,
  source_type  text not null default 'worksheet_attempt',
  source_id    uuid,                            -- the attempt that earned them
  reason       text,
  created_at   timestamptz not null default now()
);

create index on public.points_ledger (child_id);

-- =====================================================================
-- RLS HELPER — resolve the current auth user to their family (parent id),
-- whether they logged in as the parent or as one of the children.
-- =====================================================================

create or replace function public.current_parent_id()
returns uuid
language sql
stable
security definer
set search_path = public
as $$
  select p.id from public.parents p where p.auth_user_id = auth.uid()
  union
  select c.parent_id from public.children c where c.auth_user_id = auth.uid()
  limit 1
$$;

-- =====================================================================
-- ROW-LEVEL SECURITY
-- Rule of thumb:
--   * Catalog tables  -> any logged-in user may READ; no client writes (seeded
--                        with the service-role key, which bypasses RLS).
--   * Family tables   -> read limited to your own family.
--   * Writes to learner activity happen server-side via the service-role key
--     (grading), so no client INSERT policies are needed in M1.
-- =====================================================================

alter table public.parents       enable row level security;
alter table public.children      enable row level security;
alter table public.subjects      enable row level security;
alter table public.topics        enable row level security;
alter table public.lessons       enable row level security;
alter table public.worksheets    enable row level security;
alter table public.questions     enable row level security;
alter table public.attempts      enable row level security;
alter table public.answers       enable row level security;
alter table public.points_ledger enable row level security;

-- Catalog: readable by any authenticated user.
create policy "catalog read" on public.subjects   for select to authenticated using (true);
create policy "catalog read" on public.topics      for select to authenticated using (true);
create policy "catalog read" on public.lessons     for select to authenticated using (true);
create policy "catalog read" on public.worksheets  for select to authenticated using (true);
-- NOTE: questions are only ever read server-side (to keep correct_answer off
-- the wire), but we still scope the policy to authenticated users.
create policy "catalog read" on public.questions   for select to authenticated using (true);

-- Parents: a parent reads (and can update) their own row.
create policy "own parent row" on public.parents
  for select to authenticated using (auth_user_id = auth.uid());
create policy "update own parent row" on public.parents
  for update to authenticated using (auth_user_id = auth.uid());

-- Children: anyone in the family can read the family's children.
create policy "family children read" on public.children
  for select to authenticated using (parent_id = public.current_parent_id());

-- Learner activity: read limited to your own family.
create policy "family attempts read" on public.attempts
  for select to authenticated
  using (child_id in (select id from public.children where parent_id = public.current_parent_id()));

create policy "family answers read" on public.answers
  for select to authenticated
  using (attempt_id in (
    select a.id from public.attempts a
    join public.children c on c.id = a.child_id
    where c.parent_id = public.current_parent_id()
  ));

create policy "family points read" on public.points_ledger
  for select to authenticated
  using (child_id in (select id from public.children where parent_id = public.current_parent_id()));
