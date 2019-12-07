set search_path to TrainingSystem;

CREATE TABLE CourseRegistration (
  CourseRegistrationId BIGSERIAL NOT NULL PRIMARY KEY,
  LearnerId BIGINT NOT NULL,
  ProgramId BIGINT NOT NULL,
  ProgramTocId BIGINT,
  Reason VARCHAR(512),
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  ApproveDate TIMESTAMP,
  ApproveBy BIGINT,
  Status INTEGER,
  UNIQUE(CourseRegistrationId)
);

ALTER TABLE CourseRegistration ADD CONSTRAINT FK_CourseRegistration_Program FOREIGN KEY (ProgramId) REFERENCES Program(ProgramId);
ALTER TABLE CourseRegistration ADD CONSTRAINT FK_CourseRegistration_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES ProgramToc(ProgramTocId);
ALTER TABLE CourseRegistration ADD CONSTRAINT FK_CourseRegistration_Learner FOREIGN KEY (LearnerId) REFERENCES Users(UserId);
ALTER TABLE CourseRegistration ADD CONSTRAINT FK_CourseRegistration_ApproveBy FOREIGN KEY (ApproveBy) REFERENCES Users(UserId) ON DELETE SET NULL;
