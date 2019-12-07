-- update and create table 20181127

ALTER TABLE training_program add column createdBy BIGINT;

ALTER TABLE training_chanel add column createdBy BIGINT;

ALTER TABLE training_department add column createdBy BIGINT;

ALTER TABLE training_position add column createdBy BIGINT;



CREATE TABLE training_program_department(
    programdepartmentId bigserial not null,
    programId bigint not null ,
    departmentId bigint not null
)