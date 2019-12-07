set search_path to TrainingSystem;

alter table courseassignment add column limitedQuestion smallint;
alter table courseassignment add column numberOfQuestion smallint;
---list question id string example ("1,2,3,4,5,6,7,8")----------------
alter table courseassignment add column questionPool varchar(255);