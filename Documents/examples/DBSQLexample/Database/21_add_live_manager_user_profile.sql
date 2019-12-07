set search_path to TrainingSystem;


ALTER TABLE UserProfile DROP COLUMN livemanager;
ALTER TABLE UserProfile ADD COLUMN LineManager BIGINT;
ALTER TABLE UserProfile ADD CONSTRAINT FK_UserProfile_LineManager FOREIGN KEY (LineManager) REFERENCES Users(UserId) ON DELETE SET NULL;