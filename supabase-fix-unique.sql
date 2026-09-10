-- Fix: session_id must NOT be unique (many answers share one session).
-- Run in SQL Editor, then tell me when it succeeds.

alter table ai_ethics_response drop constraint if exists ai_ethics_response_session_id_key;

-- Optional cleanup of probe rows
delete from ai_ethics_response
where anonymous_participant_id like 'probe_test%';
