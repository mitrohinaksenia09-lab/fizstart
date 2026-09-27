-- ФизСтарт: структура базы знаний Supabase/PostgreSQL
-- Запусти этот файл в Supabase → SQL Editor.

create table if not exists theory_sections (
  id text primary key,
  title text not null,
  description text not null default '',
  progress integer not null default 0,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists theory_subsections (
  id text primary key,
  theory_id text not null references theory_sections(id) on delete cascade,
  title text not null,
  level text not null default 'База',
  duration text not null default '',
  goal text not null default '',
  text text not null default '',
  example text not null default '',
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists formulas (
  id bigserial primary key,
  theory_id text references theory_sections(id) on delete cascade,
  subsection_id text references theory_subsections(id) on delete cascade,
  formula text not null,
  sort_order integer not null default 0
);

create table if not exists mistakes (
  id bigserial primary key,
  subsection_id text not null references theory_subsections(id) on delete cascade,
  text text not null,
  sort_order integer not null default 0
);

create table if not exists practice_tasks (
  id text primary key,
  subsection_id text not null references theory_subsections(id) on delete cascade,
  question text not null,
  answer text not null,
  unit text not null default '',
  solution text not null default '',
  difficulty text not null default 'База',
  number text not null default '',
  topic text not null default '',
  subtopic text not null default '',
  sort_order integer not null default 0
);

create table if not exists tasks (
  id text primary key,
  number text not null default '',
  topic text not null default '',
  subtopic text not null default '',
  difficulty text not null default 'База',
  question text not null,
  answer text not null,
  unit text not null default '',
  solution text not null default '',
  sort_order integer not null default 0
);

create table if not exists exams (
  id text primary key,
  title text not null,
  description text not null default '',
  level text not null default 'База',
  duration integer not null default 235,
  sort_order integer not null default 0,
  created_at timestamptz not null default now()
);

create table if not exists exam_tasks (
  id text primary key,
  exam_id text not null references exams(id) on delete cascade,
  number text not null default '',
  topic text not null default '',
  subtopic text not null default '',
  difficulty text not null default 'База',
  question text not null,
  answer text not null,
  unit text not null default '',
  solution text not null default '',
  sort_order integer not null default 0
);

-- Для бесплатного сайта: публичное чтение базы знаний.
alter table theory_sections enable row level security;
alter table theory_subsections enable row level security;
alter table formulas enable row level security;
alter table mistakes enable row level security;
alter table practice_tasks enable row level security;
alter table tasks enable row level security;
alter table exams enable row level security;
alter table exam_tasks enable row level security;

do $$ begin
  create policy "public read theory_sections" on theory_sections for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read theory_subsections" on theory_subsections for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read formulas" on formulas for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read mistakes" on mistakes for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read practice_tasks" on practice_tasks for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read tasks" on tasks for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read exams" on exams for select using (true);
exception when duplicate_object then null; end $$;
do $$ begin
  create policy "public read exam_tasks" on exam_tasks for select using (true);
exception when duplicate_object then null; end $$;
