create table permissiongroup(
  permissiongroupid bigserial not null constraint permissiongroup_permissiongroupid_pk
  primary key,
  code varchar(255)      not null,
  description varchar(255),
  status      integer default 1,
  unique (code)
);


create table permissiongroupdetail(
  permissiongroupdetailid bigserial not null constraint permissiongroupdetail_permissiongroupdetailid_pk primary key,
  permissiongroupid bigint,
  permissionid bigint
);


create table rolegroup(
  rolegroupid bigserial not null constraint rolegroup_rolegroupid_pk primary key,
  code varchar(255)      not null,
  description varchar(255),
  status      integer default 1,
  unique (code)
);


create table rolegroupdetail(
  rolegroupdetailid bigserial not null constraint rolegroupdetail_rolegroupdetailid_pk primary key,
  roleid bigint,
  rolegroupid bigint
);

insert into permissiongroup(code,description,status) VALUES ('LMS_CHANEL_MANAGE','Quản lý chanel',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_SUB_FUNCTION_MANAGE','Quản lý chức năng con',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_DEPARTMENT_MANAGE','Quản lý phòng ban',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_TRAINING_MANAGE','Quản lý khóa học',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_FUNCTION_MANAGE','Quản lý chức năng',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_SUB_FUNCTION_GROUP_MANAGE','Quản lý nhóm chức năng con',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_LEARNER_MANAGE','Quản lý học viên',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_PROGRAM_MANAGE','Quản lý chương trình học',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_ROLE_MANAGE','Quản lý vai trò và quyền người dùng',1);
insert into permissiongroup(code,description,status) VALUES ('LMS_ASSESSENT_MANAGE','Quản lý bài kiểm tra',1);


insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,5);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,6);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,9);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,10);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,11);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,12);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,13);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,14);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,15);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,16);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,17);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,18);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,19);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,20);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,7);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,8);

insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,4);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,3);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,1);
insert into permissiongroupdetail(permissiongroupid,permissionid) VALUES(1,2);


insert into rolegroupdetail(roleid,rolegroupid) VALUES(1,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(3,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(4,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(5,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(6,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(7,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(9,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(10,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(12,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(13,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(14,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(11,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(15,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(16,1);
insert into rolegroupdetail(roleid,rolegroupid) VALUES(19,1);