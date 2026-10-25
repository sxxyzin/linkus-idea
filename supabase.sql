-- AX Proof 공유 DB 설정 (Supabase → SQL Editor에 붙여넣고 Run)
create table if not exists axproof_records (
  id text primary key,
  kind text not null,
  data jsonb not null,
  created_at timestamptz not null default now(),  -- 서버 시간
  updated_at timestamptz
);
alter table axproof_records enable row level security;
create policy "read all"   on axproof_records for select using (true);
create policy "insert all" on axproof_records for insert with check (true);
-- 판단 카드(kind='card')는 수정 불가: 원본 잠금
create policy "update non-card" on axproof_records for update
  using (kind <> 'card') with check (kind <> 'card');
-- created_at을 클라이언트가 바꾸지 못하게 고정
create or replace function axproof_keep_created() returns trigger as $$
begin new.created_at := old.created_at; return new; end $$ language plpgsql;
drop trigger if exists axproof_keep_created on axproof_records;
create trigger axproof_keep_created before update on axproof_records
  for each row execute function axproof_keep_created();
