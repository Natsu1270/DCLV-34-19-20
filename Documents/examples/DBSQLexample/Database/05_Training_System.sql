set search_path to TrainingSystem;
CREATE TABLE Region (
  RegionId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  SortOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

CREATE TABLE Skill
(
    SkillId BIGSERIAL NOT NULL PRIMARY KEY,
    Code VARCHAR(255) NOT NULL,
    Name VARCHAR(255) NOT NULL,
    Description TEXT,
    SortOrder INTEGER,
    CreatedDate timestamp NOT NULL,
    ModifiedDate timestamp,

    UNIQUE (Code)
);

CREATE TABLE Program(
  ProgramId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  SortOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

CREATE TABLE ProgramToc (
  ProgramTocId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramId BIGINT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description TEXT,
  SortOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Name, ProgramId)
);

ALTER TABLE ProgramToc ADD CONSTRAINT FK_ProgramToc_Program FOREIGN KEY (ProgramId) REFERENCES Program(ProgramId);

CREATE TABLE ResourceCategory (
  ResourceCategoryId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramId BIGINT NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description TEXT,
  SortOrder INTEGER,
  UNIQUE(ProgramId, Name)
);

ALTER TABLE ResourceCategory ADD CONSTRAINT FK_ResourceCat_Program FOREIGN KEY (ProgramId) REFERENCES Program(ProgramId);

CREATE TABLE Resource (
  ResourceId BIGSERIAL NOT NULL PRIMARY KEY,
  ProgramTocId BIGINT NOT NULL,
  ResourceCode VARCHAR(50) NOT NULL,
  Title VARCHAR(512),
  Description TEXT,
  ResourceIcon VARCHAR(255),
  SortOrder INTEGER,
  ResourceCategoryId BIGINT NOT NULL,
  Uri VARCHAR(512),
  ResourceType VARCHAR(50) NOT NULL,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(ResourceCode)
);

ALTER TABLE Resource ADD CONSTRAINT FK_Resource_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES ProgramToc(ProgramTocId);
ALTER TABLE Resource ADD CONSTRAINT FK_Resource_ResourceCategory FOREIGN KEY (ResourceCategoryId) REFERENCES ResourceCategory(ResourceCategoryId);


CREATE TABLE QuestionType (
  QuestionTypeId BIGSERIAL NOT NULL PRIMARY KEY,
  Type VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  Description VARCHAR(512),
  UNIQUE(Type)
);

CREATE TABLE Question (
  QuestionId BIGSERIAL NOT NULL PRIMARY KEY,
  QuestionUid VARCHAR(50) NOT NULL,
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
  UNIQUE(QuestionUid)
);

ALTER TABLE Question ADD CONSTRAINT FK_Question_Type FOREIGN KEY (QuestionTypeId) REFERENCES QuestionType(QuestionTypeId);
ALTER TABLE Question ADD CONSTRAINT FK_Question_Resource FOREIGN KEY (ResourceId) REFERENCES Resource(ResourceId);
ALTER TABLE Question ADD CONSTRAINT FK_Question_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES ProgramToc(ProgramTocId);

CREATE TABLE CertificationTemplate (
  CertificationTemplateId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(255) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  TemplateURI VARCHAR(255),
  TemplateContent TEXT,
  Description TEXT,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Code)
);

CREATE TABLE Course(
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
  UNIQUE(Code)
);
ALTER TABLE Course ADD CONSTRAINT FK_Course_Program FOREIGN KEY (ProgramId) REFERENCES Program(ProgramId);
ALTER TABLE Course ADD CONSTRAINT FK_Course_ProgramToc FOREIGN KEY (ProgramTocId) REFERENCES ProgramToc(ProgramTocId);
ALTER TABLE Course ADD CONSTRAINT FK_Course_Trainer FOREIGN KEY (TrainerId) REFERENCES Users(UserId);
ALTER TABLE Course ADD CONSTRAINT FK_Course_Skill FOREIGN KEY (SkillId) REFERENCES Skill(SkillId);
ALTER TABLE Course ADD CONSTRAINT FK_Course_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE Course ADD CONSTRAINT FK_Course_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId) ON DELETE SET NULL;
ALTER TABLE Course ADD CONSTRAINT FK_Course_CertTemplate FOREIGN KEY (CertificationTemplateId) REFERENCES CertificationTemplate(CertificationTemplateId) ON DELETE SET NULL;


CREATE TABLE CourseAssignment (
  CourseAssignmentId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseID BIGINT NOT NULL,
  ResourceId BIGINT NOT NULL,

  UNIQUE(CourseId, ResourceId)
);

ALTER TABLE CourseAssignment ADD CONSTRAINT FK_CourseAssignment_Course FOREIGN KEY (CourseId) REFERENCES Course(CourseId);
ALTER TABLE CourseAssignment ADD CONSTRAINT FK_Course_Resource FOREIGN KEY (ResourceId) REFERENCES Resource(ResourceId);

CREATE TABLE CourseRoster (
  CourseRosterID BIGSERIAL NOT NULL PRIMARY KEY,
  CourseId BIGINT NOT NULL,
  LearnerId BIGINT NOT NULL,
  Status INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(CourseId, LearnerId)
);

CREATE TABLE CourseRosterParticipation (
  CourseRosterParticipationId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT,
  Status INTEGER,
  AcceptedDate VARCHAR(20),
  AcceptedDateTime TIMESTAMP NOT NULL,
  UNIQUE(CourseRosterId, AcceptedDate)
);
ALTER TABLE CourseRosterParticipation ADD CONSTRAINT FK_CourseRosterParticipation_Roster FOREIGN KEY (CourseRosterId) REFERENCES CourseRoster(CourseRosterId) ON DELETE CASCADE;


CREATE TABLE CourseAssessmentInstance (
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

ALTER TABLE CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_Roster FOREIGN KEY (CourseRosterId) REFERENCES CourseRoster(CourseRosterId);
ALTER TABLE CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_Assignment FOREIGN KEY (CourseAssignmentId) REFERENCES CourseAssignment(CourseAssignmentId);
ALTER TABLE CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE CourseAssessmentInstance ADD CONSTRAINT FK_CourseAssessmentInstance_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId);

CREATE TABLE AssessmentResponse (
  AssessmentResponseId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseAssessmentInstanceId BIGINT NOT NULL,
  QuestionId BIGINT NOT NULL,
  Answer TEXT,
  Score INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(CourseAssessmentInstanceId, QuestionId)
);

ALTER TABLE AssessmentResponse ADD CONSTRAINT FK_AssessmentResponse_Instance FOREIGN KEY (CourseAssessmentInstanceId) REFERENCES CourseAssessmentInstance(CourseAssessmentInstanceId);
ALTER TABLE AssessmentResponse ADD CONSTRAINT FK_AssessmentResponse_Question FOREIGN KEY (QuestionId) REFERENCES Question(QuestionId);


CREATE TABLE CourseRosterCertification (
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

ALTER TABLE CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_Roster FOREIGN KEY (CourseRosterId) REFERENCES CourseRoster(CourseRosterId);
ALTER TABLE CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_CreatedBy FOREIGN KEY (CreatedBy) REFERENCES Users(UserId);
ALTER TABLE CourseRosterCertification ADD CONSTRAINT FK_CourseRosterCert_ModifiedBy FOREIGN KEY (ModifiedBy) REFERENCES Users(UserId);



CREATE TABLE UserProfile (
  UserProfileId BIGSERIAL NOT NULL PRIMARY KEY,
  UserId BIGINT NOT NULL,
  Avatar VARCHAR(512),
  Code VARCHAR(20),
  UserType VARCHAR(10), -- SM, SE, ASM, RSM
  UNIQUE(UserId)
);

ALTER TABLE UserProfile ADD CONSTRAINT FK_UserProfile_User FOREIGN KEY (UserId) REFERENCES Users(UserId);

CREATE TABLE SalesForce (
  SalesForceId BIGSERIAL NOT NULL PRIMARY KEY,
  DistributorCode VARCHAR(20) NOT NULL,
  DistributorName VARCHAR(255) NOT NULL,
  CustomerCode VARCHAR(20) NOT NULL,
  CustomerName VARCHAR(255) NOT NULL,
  Addr1 VARCHAR(255),
  Addr2 VARCHAR(255),
  Addr3 VARCHAR(255),
  Addr4 VARCHAR(255),
  Addr5 VARCHAR(255),
  SmCode VARCHAR(20),
  SmName VARCHAR(255),
  SeCode VARCHAR(20),
  SeName VARCHAR(255),
  AsmCode VARCHAR(20),
  AsmName VARCHAR(255),
  RsmCode VARCHAR(20),
  RsmName VARCHAR(255),
  GeoCode VARCHAR(20),
  CreatedDate TIMESTAMP,
  Status VARCHAR(10),
  Channel TEXT,
  SubDisCode TEXT,
  Located VARCHAR(10)
);

CREATE TABLE ResourceACL (
  ResourceACLId BIGSERIAL NOT NULL PRIMARY KEY,
  ResourceId BIGINT NOT NULL,
  Role VARCHAR(10) NOT NULL,
  Accessible BOOLEAN NOT NULL DEFAULT TRUE,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Role, ResourceId)
);
ALTER TABLE ResourceACL ADD CONSTRAINT FK_ResourceACL_Resource FOREIGN KEY (ResourceId) REFERENCES Resource(ResourceId) ON DELETE CASCADE;


CREATE TABLE CourseFeedback (
  CourseFeedbackId BIGSERIAL NOT NULL PRIMARY KEY,
  CourseRosterId BIGINT NOT NULL,
  Quality FLOAT,
  TestEasyToUnderstand FLOAT,
  QuestionEasy FLOAT,
  FeedbackContent TEXT,
  CreatedDate TIMESTAMP NOT NULL,
  UNIQUE(CourseRosterId)
);

ALTER TABLE CourseFeedback ADD CONSTRAINT FK_CourseFeedback_Roster FOREIGN KEY (CourseRosterId) REFERENCES CourseRoster(CourseRosterId) ON DELETE CASCADE;

CREATE TABLE ProficiencySetting (
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

CREATE TABLE FtpHostInfo(
  FtpID BIGSERIAL Primary Key,
  FtpHost VARCHAR(255),
  FtpPort INTEGER,
  FtpUserName VARCHAR(255),
  FtpPassword VARCHAR(255),
  FtpServerPath VARCHAR(255),
  FtpName VARCHAR(255)
);