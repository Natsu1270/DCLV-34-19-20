create table userpermissionacl
(
  userpermissionaclid bigserial not null
    constraint userpermissionacl_pkey
    primary key,
  userid        bigint    not null
    constraint fk_userpermissionacl_user
    references users,
  permissionid        bigint    not null
    constraint fk_userpermissionacl_permission
    references permission,
  createddate   timestamp not null,
  modifieddate  timestamp,
  constraint userpermissionacl_userid_permissionid_key
  unique (userid, permissionid)
);