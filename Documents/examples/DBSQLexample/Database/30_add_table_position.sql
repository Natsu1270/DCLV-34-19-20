set search_path to FCVPlatform;

CREATE TABLE Training_Position (
  PositionId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  CreatedDate TIMESTAMP,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

ALTER TABLE Training_UserProfile ADD COLUMN PositionId BIGINT;
ALTER TABLE Training_UserProfile ADD CONSTRAINT FK_Position_UserProfile FOREIGN KEY (PositionId) REFERENCES Training_Position(PositionId);


CREATE TABLE Training_Department (
  DepartmentId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  CreatedDate TIMESTAMP,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

ALTER TABLE Training_UserProfile ADD COLUMN DepartmentId BIGINT;
ALTER TABLE Training_UserProfile ADD CONSTRAINT FK_Department_UserProfile FOREIGN KEY (DepartmentId) REFERENCES Training_Department(DepartmentId);