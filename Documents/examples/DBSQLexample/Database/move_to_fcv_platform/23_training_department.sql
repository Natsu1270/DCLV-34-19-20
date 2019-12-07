set search_path to FCVPlatform;
CREATE TABLE Training_UserDepartment (
  UserDepartmentId BIGSERIAL NOT NULL PRIMARY KEY,
  UserProfileID BIGINT NOT NULL,
  DepartmentID BIGINT NOT NULL,
  UNIQUE(UserProfileID, DepartmentID)
);

ALTER TABLE Training_UserDepartment ADD CONSTRAINT FK_Training_UserDepartment_UserId FOREIGN KEY (UserProfileID) REFERENCES Training_UserProfile(UserProfileID) ON DELETE CASCADE;
ALTER TABLE Training_UserDepartment ADD CONSTRAINT FK_Training_UserDepartment_Dept FOREIGN KEY (DepartmentID) REFERENCES Training_Department(DepartmentID) ON DELETE CASCADE;

ALTER TABLE Training_Position ADD COLUMN Level INTEGER;