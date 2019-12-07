set search_path to TrainingSystem;

----------drop data--------------
delete from resource;
delete from resourcecategory;
delete from programtoc;
delete from skill;
delete from program;
---------add roreign key---------
alter table programtoc add column skillId bigint not null;
alter table programtoc add constraint fk_skill_programtoc foreign key(skillId) references skill(skillId);
alter table programtoc drop constraint fk_programtoc_program;
alter table programtoc drop column programId;

alter table skill add column programId bigint not null;
alter table skill add constraint fk_program_skill foreign key(programId) references program(programId);


