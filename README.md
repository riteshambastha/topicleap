# TopicLeap — Milestone 1

Live at **topicleap.com**.

A K–12 learning platform. v1 is **Grade 4 only**, but the schema is built
multi-tenant / public-ready so more grades are added later as data.

Core loop: kid logs in → picks a subject → picks a topic → chooses
**Learn**, **Learn + Worksheet**, or **Worksheet only** → steps through an
interactive lesson → does an auto-graded worksheet → sees their score + points.

## Stack

- Next.js (App Router) + TypeScript + Tailwind v4 + shadcn-style UI
- Supabase (Postgres + Auth + Row-Level Security)
- Deploy target: Vercel

## One-time setup (you do this)

1. **Create a Supabase project** at https://supabase.com → *New project*.
   Pick a region near you and save the database password.
2. **Run the schema:** Supabase dashboard → *SQL Editor* → paste the contents
   of `supabase/migrations/0001_init.sql` → **Run**.
3. **Seed the Grade 4 topic:** in the SQL Editor, paste
   `supabase/seed/grade4_math_4nbt_b5.sql` → **Run**.
4. **Get your keys:** Project Settings → *API*. Copy the Project URL,
   the `anon public` key, and the `service_role` key.
5. **Create `.env.local`** (copy from `.env.local.example`):

   ```
   NEXT_PUBLIC_SUPABASE_URL=...
   NEXT_PUBLIC_SUPABASE_ANON_KEY=...
   SUPABASE_SERVICE_ROLE_KEY=...
   ```

## Run it

```bash
npm install
npm run dev      # http://localhost:3000
```

1. Open `/signup`, create a parent account.
2. On the parent dashboard, create a child login (username + PIN).
3. Open `/kids`, sign in as that child, and run the loop.

## How it's wired

- **Accounts:** a *family* = one parent + their kids. Both are `auth.users`.
  Parents use email + password; kids use a synthetic email
  (`username@kids.topicleap.com`) with their PIN as the password, created
  server-side with the service-role key.
- **RLS:** content (subjects/topics/lessons/worksheets/questions) is readable
  by any signed-in user; learner data (attempts/answers/points) is readable only
  within your own family via `current_parent_id()`.
- **Grading is server-side** (`/api/worksheets/[id]/grade`): correct answers
  never reach the browser, and the child is taken from the session, not the
  request body.
- `grade_level` is a first-class column on children, topics, lessons,
  worksheets, and questions.

## Not in Milestone 1 (deliberately cut)

AI calls, open-response grading, and the leaderboard UI. Points already write
to `points_ledger` so the leaderboard can be built later with no migration.
