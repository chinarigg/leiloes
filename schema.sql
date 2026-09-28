-- Rode no Supabase: SQL Editor > New query > Run

create table public.cards (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  carta text not null default '',
  preco numeric,
  quem text not null default '',
  leilao int,
  created_at timestamptz not null default now()
);

create table public.orders (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  quem text not null,
  pago boolean not null default false,
  cobranca boolean not null default false,
  frete numeric,
  enviado boolean not null default false,
  obs text not null default '',
  concluido boolean not null default false,
  primary key (user_id, quem)
);

alter table public.cards enable row level security;
alter table public.orders enable row level security;

create policy "cards: só o dono" on public.cards
  for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "orders: só o dono" on public.orders
  for all to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
