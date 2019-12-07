set search_path to FCVPlatform;


CREATE TABLE Training_Program(
  ProgramId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description TEXT,
  Status INTEGER NOT NULL DEFAULT 1,
  SortOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

CREATE TABLE Training_Skill
(
    SkillId BIGSERIAL NOT NULL PRIMARY KEY,
    Code VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    SortOrder INTEGER,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,
    ProgramId BIGINT NOT NULL,

    UNIQUE (Code, ProgramId)
);
ALTER TABLE Training_Skill ADD CONSTRAINT FK_Skill_Program FOREIGN KEY (ProgramId) REFERENCES Training_Program(ProgramId);


CREATE TABLE Training_ProgramToc (
  ProgramTocId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramId BIGINT NOT NULL,
  SkillId BIGINT NOT NULL,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description TEXT,
  SortOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  LevelLearner VARCHAR(512),
  UNIQUE(Code, SkillId, ProgramId)
);

ALTER TABLE Training_ProgramToc ADD CONSTRAINT FK_ProgramToc_Program FOREIGN KEY (ProgramId) REFERENCES Training_Program(ProgramId);
ALTER TABLE Training_ProgramToc ADD CONSTRAINT FK_ProgramToc_Skill FOREIGN KEY (SkillId) REFERENCES Training_Skill(SkillId);

CREATE TABLE Training_Resource (
  ResourceId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramTocId BIGINT NOT NULL,
  ResourceCode VARCHAR(50) NOT NULL,
  Title VARCHAR(512),
  Description TEXT,
  ResourceIcon VARCHAR(255),
  SortOrder INTEGER,
  Uri VARCHAR(512),
  ResourceType VARCHAR(50) NOT NULL,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  Status INTEGER NOT NULL DEFAULT 1,
  Downloadable BOOLEAN NOT NULL DEFAULT TRUE,
  UNIQUE(ResourceCode)
);

ALTER TABLE Training_Resource ADD CONSTRAINT FK_Resource_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES Training_ProgramToc(ProgramTocId);


CREATE TABLE Training_QuestionType (
  QuestionTypeId BIGSERIAL NOT NULL PRIMARY KEY,
  Type VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(512),
  UNIQUE(Type)
);

CREATE TABLE Training_Question (
  QuestionId BIGSERIAL NOT NULL PRIMARY KEY,
  QuestionUid VARCHAR(50) NOT NULL,
  Code VARCHAR(100) NOT NULL,
  QuestionNumber BIGINT NOT NULL,
  ProgramId BIGINT NOT NULL,
  ProgramTocId BIGINT NOT NULL,
  ResourceId BIGINT,
  QuestionXml TEXT,
  QuestionPregeneratedHTML TEXT,
  CorrectAnswer TEXT,
  CorrectAnswerHTML TEXT,
  AnswerOption INTEGER,
  Score INTEGER,
  QuestionTypeId BIGINT NOT NULL,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  DOK VARCHAR(10),
  UNIQUE(QuestionUid)
);

ALTER TABLE Training_Question ADD CONSTRAINT FK_Question_Type FOREIGN KEY (QuestionTypeId) REFERENCES Training_QuestionType(QuestionTypeId);
ALTER TABLE Training_Question ADD CONSTRAINT FK_Question_Resource FOREIGN KEY (ResourceId) REFERENCES Training_Resource(ResourceId);
ALTER TABLE Training_Question ADD CONSTRAINT FK_Question_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES Training_ProgramToc(ProgramTocId);

CREATE TABLE Training_CertificationTemplate (
  CertificationTemplateId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  TemplateURI VARCHAR(255),
  TemplateContent TEXT,
  Description TEXT,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  Status INTEGER NOT NULL DEFAULT 1,
  UNIQUE(Code)
);

CREATE TABLE Training_Course(
  CourseId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(100) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  StartDate TIMESTAMP NOT NULL,
  EndDate TIMESTAMP NOT NULL,
  InviteDate TIMESTAMP,
  ProgramId BIGINT NOT NULL,
  ProgramTocId BIGINT NOT NULL,
  SkillId BIGINT,
  CreatedDate TIMESTAMP NOT NULL,
  CreatedBy BIGINT NOT NULL,
  TrainerId BIGINT NOT NULL,
  CertificationTemplateId BIGINT,
  ModifiedDate TIMESTAMP,
  ModifiedBy BIGINT,
  Status INTEGER,
  LearningType VARCHAR(50),
  UNIQUE(Code)
);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_Program FOREIGN KEY (ProgramId) REFERENCES Training_Program(ProgramId);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES Training_ProgramToc(ProgramTocId);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_Trainer FOREIGN KEY (TrainerId) REFERENCES Users(UserId);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_Skill FOREIGN KEY (SkillId) REFERENCES Training_Skill(SkillId);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId) ON DELETE SET NULL;
ALTER TABLE Training_Course ADD CONSTRAINT FK_Course_CertTemplate FOREIGN KEY (CertificationTemplateId) REFERENCES Training_CertificationTemplate(CertificationTemplateId) ON DELETE SET NULL;


CREATE TABLE Training_CourseAssignment (
  CourseAssignmentId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseID BIGINT NOT NULL,
  ResourceId BIGINT NOT NULL,
  LimitedQuestion INTEGER,
  NumberOfQuestion INTEGER,
  QuestionPool VARCHAR(255),
  PassingScore INTEGER,
  Scramble BOOLEAN NOT NULL DEFAULT TRUE,

  UNIQUE(CourseId, ResourceId)
);

ALTER TABLE Training_CourseAssignment ADD CONSTRAINT FK_CourseAssignment_Course FOREIGN KEY (CourseId) REFERENCES Training_Course(CourseId);
ALTER TABLE Training_CourseAssignment ADD CONSTRAINT FK_Course_Resource FOREIGN KEY (ResourceId) REFERENCES Training_Resource(ResourceId);

CREATE TABLE Training_CourseRoster (
  CourseRosterID BIGSERIAL NOT NULL PRIMARY KEY,
  CourseId BIGINT NOT NULL,
  LearnerId BIGINT NOT NULL,
  Status INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(CourseId, LearnerId)
);

ALTER TABLE Training_CourseRoster ADD CONSTRAINT FK_TrainingCourseRoster_Course FOREIGN KEY (CourseId) REFERENCES Training_Course(CourseId);
ALTER TABLE Training_CourseRoster ADD CONSTRAINT FK_TrainingCourseRoster_Learner FOREIGN KEY (LearnerId) REFERENCES Users(UserId);


CREATE TABLE Training_CourseRosterParticipation (
  CourseRosterParticipationId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT,
  Status INTEGER,
  AcceptedDate VARCHAR(20),
  AcceptedDateTime TIMESTAMP NOT NULL,
  UNIQUE(CourseRosterId, AcceptedDate)
);
ALTER TABLE Training_CourseRosterParticipation ADD CONSTRAINT FK_CourseRosterParticipation_Roster FOREIGN KEY (CourseRosterId) REFERENCES Training_CourseRoster(CourseRosterId) ON DELETE CASCADE;


CREATE TABLE Training_CourseAssessmentInstance (
  CourseAssessmentInstanceId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT NOT NULL,
  CourseAssignmentId BIGINT NOT NULL,
  TakenDate TIMESTAMP NOT NULL,
  SubmittedDate TIMESTAMP,
  CompletedDate TIMESTAMP,
  Score INTEGER,
  Passed BOOLEAN,
  CreatedBy BIGINT NOT NULL,
  ModifiedBy BIGINT,
  ModifiedDate TIMESTAMP,
  UNIQUE(CourseRosterId, CourseAssignmentId)
);

ALTER TABLE Training_CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_Roster FOREIGN KEY (CourseRosterId) REFERENCES Training_CourseRoster(CourseRosterId);
ALTER TABLE Training_CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_Assignment FOREIGN KEY (CourseAssignmentId) REFERENCES Training_CourseAssignment(CourseAssignmentId);
ALTER TABLE Training_CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE Training_CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId);

CREATE TABLE Training_AssessmentResponse (
  AssessmentResponseId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseAssessmentInstanceId BIGINT NOT NULL,
  QuestionId BIGINT NOT NULL,
  Answer TEXT,
  Score INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(CourseAssessmentInstanceId, QuestionId)
);

ALTER TABLE Training_AssessmentResponse ADD CONSTRAINT FK_AssessmentResponse_Instance FOREIGN KEY (CourseAssessmentInstanceId) REFERENCES Training_CourseAssessmentInstance(CourseAssessmentInstanceId);
ALTER TABLE Training_AssessmentResponse ADD CONSTRAINT FK_AssessmentResponse_Question FOREIGN KEY (QuestionId) REFERENCES Training_Question(QuestionId);


CREATE TABLE Training_CourseRosterCertification (
  CourseRosterCertificationId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT NOT NULL,
  IssuedDate TIMESTAMP NOT NULL,
  CertificateIssuedPath VARCHAR(512),
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  CreatedBy BIGINT NOT NULL,
  ModifiedBy BIGINT,
  UNIQUE(CourseRosterId)
);

ALTER TABLE Training_CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_Roster FOREIGN KEY (CourseRosterId) REFERENCES Training_CourseRoster(CourseRosterId);
ALTER TABLE Training_CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE Training_CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId);



CREATE TABLE Training_UserProfile (
  UserProfileId BIGSERIAL NOT NULL PRIMARY KEY,
  UserId BIGINT NOT NULL,
  Avatar VARCHAR(512),
  Code VARCHAR(20),
  UserType VARCHAR(10), -- SM, SE, ASM, RSM
  LineManagerId BIGINT,
  UNIQUE(UserId)
);

ALTER TABLE Training_UserProfile ADD CONSTRAINT FK_UserProfile_User FOREIGN KEY (UserId) REFERENCES Users(UserId);
ALTER TABLE Training_UserProfile ADD CONSTRAINT FK_UserProfile_LineManager FOREIGN KEY (LineManagerId) REFERENCES Users(UserId);



CREATE TABLE Training_ResourceACL (
  ResourceACLId BIGSERIAL NOT NULL PRIMARY KEY,
  ResourceId BIGINT NOT NULL,
  Role VARCHAR(10) NOT NULL,
  Accessible BOOLEAN NOT NULL DEFAULT TRUE,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Role, ResourceId)
);
ALTER TABLE Training_ResourceACL ADD CONSTRAINT FK_ResourceACL_Resource FOREIGN KEY (ResourceId) REFERENCES Training_Resource(ResourceId) ON DELETE CASCADE;


CREATE TABLE Training_CourseFeedback (
  CourseFeedbackId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT NOT NULL,
  Quality FLOAT,
  TestEasyToUnderstand FLOAT,
  QuestionEasy FLOAT,
  FeedbackContent TEXT,
  CreatedDate TIMESTAMP NOT NULL,
  UNIQUE(CourseRosterId)
);

ALTER TABLE Training_CourseFeedback ADD CONSTRAINT FK_CourseFeedback_Roster FOREIGN KEY (CourseRosterId) REFERENCES Training_CourseRoster(CourseRosterId) ON DELETE CASCADE;

CREATE TABLE Training_ProficiencySetting (
  ProficiencySettingId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255),
  Priority INTEGER,
  LowValue FLOAT,
  UpperValue FLOAT,
  ImageDisplay VARCHAR(255),
  RatingDisplay FLOAT,
  TopValue INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

CREATE TABLE Training_FtpHostInfo(
  FtpID BIGSERIAL Primary Key,
  FtpHost VARCHAR(255),
  FtpPort INTEGER,
  FtpUserName VARCHAR(255),
  FtpPassword VARCHAR(255),
  FtpServerPath VARCHAR(255),
  FtpName VARCHAR(255)
);

CREATE TABLE Training_ProgramTocACL (
  ProgramTocACLId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramTocId BIGINT NOT NULL,
  Role VARCHAR(10) NOT NULL,
  Accessible BOOLEAN NOT NULL DEFAULT TRUE,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Role, ProgramTocId)
);

ALTER TABLE Training_ProgramTocACL ADD CONSTRAINT FK_ProgramTocACL_Toc FOREIGN KEY (ProgramTocId) REFERENCES Training_ProgramToc(ProgramTocId) ON DELETE CASCADE;



CREATE TABLE Training_CourseRegistration (
  CourseRegistrationId BIGSERIAL NOT NULL PRIMARY KEY,
  LearnerId BIGINT NOT NULL,
  ProgramId BIGINT NOT NULL,
  ProgramTocId BIGINT,
  Reason VARCHAR(512),
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  ApproveDate TIMESTAMP,
  ApproveBy BIGINT,
  Status INTEGER
);

ALTER TABLE Training_CourseRegistration ADD CONSTRAINT FK_CourseRegistration_Program FOREIGN KEY (ProgramId) REFERENCES Training_Program(ProgramId);
ALTER TABLE Training_CourseRegistration ADD CONSTRAINT FK_CourseRegistration_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES Training_ProgramToc(ProgramTocId);
ALTER TABLE Training_CourseRegistration ADD CONSTRAINT FK_CourseRegistration_Learner FOREIGN KEY (LearnerId) REFERENCES Users(UserId);
ALTER TABLE Training_CourseRegistration ADD CONSTRAINT FK_CourseRegistration_ApproveBy FOREIGN KEY (ApproveBy) REFERENCES Users(UserId) ON DELETE SET NULL;
