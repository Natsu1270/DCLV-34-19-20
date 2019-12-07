set search_path to FCVPlatform;
CREATE TABLE Training_UserDevice (
  userDeviceId BIGSERIAL NOT NULL PRIMARY KEY,
  token VARCHAR(512) NOT NULL,
  device VARCHAR(20),
  userId BIGINT NOT NULL,
  CreatedDate TIMESTAMP NOT NULL
);

ALTER TABLE Training_UserDevice ADD CONSTRAINT FK_Training_UD_UserId FOREIGN KEY (userId) REFERENCES Users(UserId) ON DELETE CASCADE;

create index idx_tms_userdevice_userid on Training_UserDevice (userid);
