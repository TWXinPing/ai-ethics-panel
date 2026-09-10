-- Run once in Supabase → SQL Editor → New query → Run
-- Then copy Project URL + anon public key into index.html CONFIG.

create table if not exists ai_ethics_responses (
  id bigint generated always as identity primary key,
  session_id text not null,
  anonymous_participant_id text not null,
  question_id text not null,
  response_value smallint not null check (response_value between 1 and 5),
  timestamp timestamptz default now(),
  academic_stage text,
  ai_use_frequency text
);

alter table ai_ethics_responses enable row level security;

drop policy if exists "anon_insert" on ai_ethics_responses;
drop policy if exists "anon_select" on ai_ethics_responses;

create policy "anon_insert" on ai_ethics_responses
  for insert to anon with check (true);

create policy "anon_select" on ai_ethics_responses
  for select to anon using (true);

-- Optional: verify
-- select * from ai_ethics_responses limit 5;
