create table training_organization(
  trainingorganizationid bigserial not null constraint training_organization_trainingorganizationid_pk
  primary key,
  code varchar(255)      not null,
  description varchar(255),
  status      integer default 1,
  unique (code)
);