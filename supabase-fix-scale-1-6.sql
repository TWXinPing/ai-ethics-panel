-- Allow 6-point verification-threshold responses (was 1–5).
-- Run in Supabase SQL Editor if new submissions fail with a check constraint error.

alter table ai_ethics_response
  drop constraint if exists ai_ethics_response_response_value_check;

alter table ai_ethics_response
  add constraint ai_ethics_response_response_value_check
  check (response_value between 1 and 6);
