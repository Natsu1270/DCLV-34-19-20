set search_path to TrainingSystem;

--- set constraint not null foreign key ----
alter table question alter column resourceid set not null;
---drop not null none require field -------
alter table question alter column programtocid drop not null;
alter table question alter column programid drop not null;