set search_path to FCVPlatform;
CREATE TABLE Training_Function (
  FunctionId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  DepartmentID BIGINT NOT NULL,
  CreatedDate TIMESTAMP  NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code, DepartmentID)
);
ALTER TABLE Training_Function ADD FOREIGN KEY (DepartmentID) REFERENCES Training_Department(DepartmentID) ON DELETE NO ACTION;

CREATE TABLE Training_SubFunction (
  SubFunctionId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  FunctionID BIGINT NOT NULL,
  CreatedDate TIMESTAMP  NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code, FunctionId)
);
ALTER TABLE Training_SubFunction ADD FOREIGN KEY (FunctionID) REFERENCES Training_Function(FunctionID) ON DELETE NO ACTION;

CREATE TABLE Training_SubFunctionGroup (
  SubFunctionGroupId BIGSERIAL NOT NULL PRIMARY KEY,
  Name VARCHAR(255) NOT NULL,
  SubFunctionID BIGINT NOT NULL,
  CreatedDate TIMESTAMP  NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Name, SubFunctionId)
);

ALTER TABLE Training_SubFunctionGroup ADD FOREIGN KEY (SubFunctionID) REFERENCES Training_SubFunction(SubFunctionID) ON DELETE NO ACTION;


ALTER TABLE training_program_department ADD FunctionId BIGINT;

ALTER TABLE training_userdepartment ADD FunctionId BIGINT;
ALTER TABLE training_userdepartment ADD SubFunctionId BIGINT;
ALTER TABLE training_userdepartment ADD SubFunctionGroupId BIGINT;

ALTER TABLE training_userdepartment ADD FOREIGN KEY (FunctionId) REFERENCES Training_Function(FunctionId) ON DELETE NO ACTION;
ALTER TABLE training_userdepartment ADD FOREIGN KEY (SubFunctionID) REFERENCES Training_SubFunction(SubFunctionID) ON DELETE NO ACTION;
ALTER TABLE training_userdepartment ADD FOREIGN KEY (SubFunctionGroupId) REFERENCES Training_SubFunctionGroup(SubFunctionGroupId) ON DELETE NO ACTION;

