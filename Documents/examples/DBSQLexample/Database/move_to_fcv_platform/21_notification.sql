set search_path to FCVPlatform;
CREATE TABLE Training_Notification (
  NotificationId BIGSERIAL NOT NULL PRIMARY KEY,
  Subject VARCHAR(255) NOT NULL,
  Content TEXT,
  Status INTEGER,
  TrigerType VARCHAR(50),
  ReceiverType VARCHAR(50) NOT NULL, -- USER, GROUP, BROADCAST
  ReceiverId BIGINT,
  CourseId BIGINT,
  CreatedById BIGINT NOT NULL,
  CreatedDate TIMESTAMP NOT NULL,
  SentDate TIMESTAMP
);

ALTER TABLE Training_Notification ADD CONSTRAINT FK_Training_Notification_Created FOREIGN KEY (CreatedById) REFERENCES Users(UserId) ON DELETE CASCADE;


ALTER TABLE Training_UserProfile ADD COLUMN RegionId BIGINT;
ALTER TABLE Training_UserProfile ADD CONSTRAINT FK_Training_Profile_Region FOREIGN KEY (RegionId) REFERENCES Region(RegionId) ON DELETE CASCADE;

ALTER TABLE Training_CourseAssignment ADD COLUMN LessonOrder INTEGER DEFAULT 1;
ALTER TABLE Training_CourseAssessmentInstance ADD COLUMN NumberCorrectResponse INTEGER DEFAULT 0;
ALTER TABLE Training_CourseAssessmentInstance ADD COLUMN Duration DECIMAL (10,2);


ALTER TABLE Training_CourseRoster ADD COLUMN LastAssignmentTaken BIGINT;
ALTER TABLE Training_CourseAssignment ADD COLUMN Studied BOOLEAN DEFAULT FALSE;
ALTER TABLE Training_CourseAssignment ADD COLUMN LastStudiedTime TIMESTAMP;

