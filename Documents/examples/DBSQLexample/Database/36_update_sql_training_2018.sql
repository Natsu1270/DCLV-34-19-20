set search_path to fcvplatform;

ALTER TABLE training_position add column departmentId BIGINT

ALTER TABLE training_program_department add column functionid BIGINT

CREATE TABLE training_program_department(
  programdepartmentId bigserial not null,
  programId bigint not null ,
  departmentId bigint not null
)

-- auto-generated definition
create table training_function
(
  functionid   bigserial    not null
    constraint training_function_pkey
    primary key,
  code         varchar(255) not null,
  name         varchar(255) not null,
  departmentid bigint       not null
    constraint training_function_departmentid_fkey
    references training_department,
  createddate  timestamp    not null,
  modifieddate timestamp,
  constraint training_function_code_departmentid_key
  unique (code, departmentid)
);

-- auto-generated definition
create table training_subfunction
(
  subfunctionid bigserial    not null
    constraint training_subfunction_pkey
    primary key,
  code          varchar(255) not null,
  name          varchar(255) not null,
  functionid    bigint       not null
    constraint training_subfunction_functionid_fkey
    references training_function,
  createddate   timestamp    not null,
  modifieddate  timestamp,
  constraint training_subfunction_code_functionid_key
  unique (code, functionid)
);

-- auto-generated definition
create table training_subfunctiongroup
(
  subfunctiongroupid bigserial    not null
    constraint training_subfunctiongroup_pkey
    primary key,
  name               varchar(255) not null,
  subfunctionid      bigint       not null
    constraint training_subfunctiongroup_subfunctionid_fkey
    references training_subfunction,
  createddate        timestamp    not null,
  modifieddate       timestamp,
  constraint training_subfunctiongroup_name_subfunctionid_key
  unique (name, subfunctionid)
);


-- auto-generated definition
create table training_program_function
(
  programfunctionid bigserial not null,
  programid         bigint    not null,
  functionid        bigint    not null
);

-- auto-generated definition
create table training_usersubfunction
(
  usersubfunctionid bigserial not null
    constraint training_usersubfunctionid_pkey
    primary key,
  userprofileid     bigint    not null,
  subfunctionid     bigint    not null
    constraint fk_training_userfunction_subfunction
    references training_subfunction
    on delete cascade,
  constraint training_userfunction_userprofileid_subfunctionid_key
  unique (userprofileid, subfunctionid)
);

-- auto-generated definition
create table training_usersubfunctiongroup
(
  usersubfunctiongroupid bigserial not null
    constraint training_usersubfunctiongroupid_pkey
    primary key,
  userprofileid          bigint    not null,
  subfunctiongroupid     bigint    not null
    constraint fk_training_userfunction_subfunctiongroup
    references training_subfunctiongroup
    on delete cascade,
  constraint training_userfunction_userprofileid_subfunctiongroupid_key
  unique (userprofileid, subfunctiongroupid)
);

-- auto-generated definition
create table training_subfunctiongroup
(
  subfunctiongroupid bigserial    not null
    constraint training_subfunctiongroup_pkey
    primary key,
  name               varchar(255) not null,
  subfunctionid      bigint       not null
    constraint training_subfunctiongroup_subfunctionid_fkey
    references training_subfunction,
  createddate        timestamp    not null,
  modifieddate       timestamp,
  constraint training_subfunctiongroup_name_subfunctionid_key
  unique (name, subfunctionid)
);

-- auto-generated definition
create table training_subfunction
(
  subfunctionid bigserial    not null
    constraint training_subfunction_pkey
    primary key,
  code          varchar(255) not null,
  name          varchar(255) not null,
  functionid    bigint       not null
    constraint training_subfunction_functionid_fkey
    references training_function,
  createddate   timestamp    not null,
  modifieddate  timestamp,
  constraint training_subfunction_code_functionid_key
  unique (code, functionid)
);
-- auto-generated definition
create table training_userfunction
(
  userfunctionid bigserial not null
    constraint training_userfunctionid_pkey
    primary key,
  userprofileid  bigint    not null,
  functionid     bigint    not null
    constraint fk_training_userfunction_function
    references training_function
    on delete cascade,
  constraint training_userfunction_userprofileid_functionid_key
  unique (userprofileid, functionid)
);


