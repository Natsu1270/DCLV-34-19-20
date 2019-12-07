set search_path to TrainingSystem;

alter table program add column description varchar(255);
alter table program add column status smallint default 1;