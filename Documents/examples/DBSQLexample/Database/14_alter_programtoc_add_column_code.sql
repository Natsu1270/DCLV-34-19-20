  set search_path to TrainingSystem;

----drop data------
delete from resource;
delete from programtoc;
-----add column code programtoc------
alter table programtoc add column code varchar(50) not null;
alter table programtoc add constraint programtoc_code_key unique (code);