SET search_path to TrainingSystem;

CREATE TABLE UserGroup
(
    UserGroupId BIGSERIAL NOT NULL PRIMARY KEY,
    Code VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,

    UNIQUE (Code)
);

CREATE TABLE Users
(
    UserId BIGSERIAL NOT NULL PRIMARY KEY,
    UserName VARCHAR(255) NOT NULL,
    Code VARCHAR(255),
    Password VARCHAR(255),
    FullName VARCHAR(255),
    FirstName VARCHAR(255),
    LastName VARCHAR(255),
    Email VARCHAR(255),
    PhoneNumber VARCHAR(20),
    Status integer NOT NULL DEFAULT 1,
    UserGroupId BIGINT NOT NULL,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,

    unique(Code)
);
ALTER TABLE Users ADD CONSTRAINT FK_Users_UserGroup FOREIGN KEY (UserGroupId) REFERENCES UserGroup(UserGroupId);

CREATE TABLE Role
(
    RoleId BIGSERIAL NOT NULL PRIMARY KEY,
    Code VARCHAR(20) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    description VARCHAR(512),
    UNIQUE (code)
);

CREATE TABLE Permission
(
    PermissionId BIGSERIAL NOT NULL PRIMARY KEY,
    Code VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description VARCHAR(512),
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,

    UNIQUE (code)
);

CREATE TABLE RoleAcl
(
    RoleAclId BIGSERIAL NOT NULL PRIMARY KEY,
    RoleId bigint NOT NULL,
    PermissionId bigint NOT NULL,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp
);
ALTER TABLE RoleAcl ADD CONSTRAINT FK_RoleAcl_Permission FOREIGN KEY (PermissionId) REFERENCES Permission(PermissionId);

CREATE TABLE UserGroupRoleAcl
(
    UserGroupRoleAclId BIGSERIAL NOT NULL PRIMARY KEY,
    UserGroupId bigint NOT NULL,
    RoleId bigint NOT NULL,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,
    UNIQUE(UserGroupId, RoleId)
);
ALTER TABLE UserGroupRoleAcl ADD CONSTRAINT FK_UserGroupRoleAcl_UserGroup FOREIGN KEY (UserGroupId) REFERENCES UserGroup(UserGroupId);
ALTER TABLE UserGroupRoleAcl ADD CONSTRAINT FK_UserGroupRoleAcl_role FOREIGN KEY (RoleId) REFERENCES Role(RoleId);

CREATE TABLE UserRoleAcl
(
    UserRoleAclId BIGSERIAL NOT NULL PRIMARY KEY,
    UserId bigint NOT NULL,
    RoleId bigint NOT NULL,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,

    unique(UserId, RoleId)
);
ALTER TABLE UserRoleAcl ADD CONSTRAINT FK_UserRoleAcl_User FOREIGN KEY (UserId) REFERENCES Users(UserId);
ALTER TABLE UserRoleAcl ADD CONSTRAINT FK_UserRoleAcl_Role FOREIGN KEY (RoleId) REFERENCES Role(RoleId);


