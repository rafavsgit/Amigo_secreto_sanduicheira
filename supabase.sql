-- Rode UMA vez no Supabase: SQL Editor > New query > cole tudo > Run.
-- Pode rodar de novo sem problema (ele recria as regras).

-- 1) Tabela que guarda jogadores, sorteio (cifrado), palpites e revelacoes
create table if not exists kv (
  col text not null,
  id text not null,
  data jsonb not null,
  updated_at timestamptz default now(),
  primary key (col, id)
);

alter table kv enable row level security;

drop policy if exists "kv read" on kv;
drop policy if exists "kv insert" on kv;
drop policy if exists "kv update" on kv;
drop policy if exists "kv delete" on kv;

create policy "kv read" on kv for select using (true);
create policy "kv insert" on kv for insert with check (true);
-- palpites, revelacoes, personagens e descricoes dos universos podem ser regravados;
-- jogadores e sorteio ficam travados
create policy "kv update" on kv for update
  using (col in ('guesses','reveal','chars','universes','admin'))
  with check (col in ('guesses','reveal','chars','universes','admin'));
-- so personagens podem ser apagados
create policy "kv delete" on kv for delete using (col = 'chars');

-- 2) Pasta publica das fotos de referencia
insert into storage.buckets (id, name, public)
values ('refs', 'refs', true)
on conflict (id) do nothing;

drop policy if exists "refs read" on storage.objects;
drop policy if exists "refs upload" on storage.objects;

create policy "refs read" on storage.objects for select using (bucket_id = 'refs');
create policy "refs upload" on storage.objects for insert with check (bucket_id = 'refs');
