create table training_userprofile_info
(
  trainingprofileinfoid bigserial not null
    constraint training_userprofile_info_pkey
    primary key,
  userprofileid         bigint,
  departmentid          bigint,
  functionid            bigint,
  channelid             bigint,
  positionid            bigint,
  regionid            bigint
);