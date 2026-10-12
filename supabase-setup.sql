-- Bitabo database setup for Supabase.
-- Run this once: Supabase dashboard > SQL Editor > New query > paste > Run.

-- One table holds everything (documents, clients, services, business details).
create table if not exists public.records (
  user_id    uuid        not null default auth.uid() references auth.users(id) on delete cascade,
  col        text        not null,   -- 'docs', 'clients', 'services' or 'settings'
  id         text        not null,
  data       jsonb       not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, col, id)
);

-- Each person can only see and change their own rows.
alter table public.records enable row level security;

create policy "read own records"   on public.records for select using (auth.uid() = user_id);
create policy "insert own records" on public.records for insert with check (auth.uid() = user_id);
create policy "update own records" on public.records for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "delete own records" on public.records for delete using (auth.uid() = user_id);

-- Live updates between your phone and your computer.
alter table public.records replica identity full;
alter publication supabase_realtime add table public.records;
