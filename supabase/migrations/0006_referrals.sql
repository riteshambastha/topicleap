-- =====================================================================
-- TopicLeap — parent-to-parent referrals.
-- Each parent gets a unique referral_code. A friend signs up via the link,
-- and once BOTH the referrer and the invited parent have at least one
-- learner, every child on both sides earns bonus points (two-sided).
-- Reward rows land in points_ledger with source_type='referral'.
-- Run AFTER 0001_init.sql in the Supabase SQL Editor. Non-destructive.
-- =====================================================================

-- 1) Give every parent a shareable code (nullable; generated lazily/back-
--    filled server-side to guarantee uniqueness without races).
alter table public.parents
  add column if not exists referral_code text;

create unique index if not exists parents_referral_code_key
  on public.parents (referral_code)
  where referral_code is not null;

-- 2) One row per invited parent (the UNIQUE on invited_parent_id prevents
--    a parent from being referred twice / double rewards).
create table if not exists public.referrals (
  id                  uuid primary key default gen_random_uuid(),
  referrer_parent_id  uuid not null references public.parents(id) on delete cascade,
  invited_parent_id   uuid unique references public.parents(id) on delete cascade,
  code                text not null,
  status              text not null default 'pending'
                        check (status in ('pending', 'rewarded')),
  reward_points       int  not null default 0,    -- per-child bonus granted
  created_at          timestamptz not null default now(),
  rewarded_at         timestamptz
);

create index if not exists referrals_referrer_idx
  on public.referrals (referrer_parent_id);

alter table public.referrals enable row level security;

-- A parent can read referrals they sent or the one that brought them in.
-- (All writes happen server-side via the service-role key.)
drop policy if exists "own referrals read" on public.referrals;
create policy "own referrals read" on public.referrals
  for select to authenticated
  using (
    referrer_parent_id = public.current_parent_id()
    or invited_parent_id = public.current_parent_id()
  );
