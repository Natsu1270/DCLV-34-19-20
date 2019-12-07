set search_path to TrainingSystem;
CREATE TABLE City (
  CityId BIGSERIAL NOT NULL PRIMARY KEY,
  Code VARCHAR(50) NOT NULL,
  Name VARCHAR(255) NOT NULL,
  SortOrder INTEGER,
  RegionId BIGINT,
  UNIQUE(Code)
);

ALTER TABLE City ADD CONSTRAINT FK_City_Region FOREIGN KEY (RegionId) REFERENCES Region(RegionId);

CREATE TABLE Distributor(
  DistributorID BIGSERIAL NOT NULL PRIMARY KEY,
  code          VARCHAR(100) NOT NULL,
  name          VARCHAR(255) NOT NULL,
  regionid      BIGINT NOT NULL,
  status        INTEGER NOT NULL DEFAULT 1,
  cityid        BIGINT,
  prefix        VARCHAR(255),
  addr1         VARCHAR(255),
  addr2         VARCHAR(255),
  addr3         VARCHAR(255),
  addr4         VARCHAR(255),
  UNIQUE(Code, Name)
);
ALTER TABLE Distributor ADD CONSTRAINT FK_Distributor_Region FOREIGN KEY (RegionId) REFERENCES Region(RegionId);
ALTER TABLE Distributor ADD CONSTRAINT FK_Distributor_City FOREIGN KEY (CityId) REFERENCES City(CityId);


CREATE TABLE LineManager (
  LineManagerId BIGSERIAL NOT NULL PRIMARY KEY,
  userid        BIGINT NOT NULL,
  staffuserid   BIGINT,
  regionid      BIGINT,
  distributorid BIGINT,
  createddate   TIMESTAMP NOT NULL,
  modifieddate  TIMESTAMP,
  active        boolean     NOT NULL DEFAULT TRUE,
  cityid        BIGINT,
  mergefromid   bigint,
  mergedate     timestamp without time zone,
  description   text
);

ALTER TABLE LineManager ADD CONSTRAINT FK_LineManager_User FOREIGN KEY (UserId) REFERENCES Users(UserId);
ALTER TABLE LineManager ADD CONSTRAINT FK_LineManager_Staff FOREIGN KEY (StaffUserId) REFERENCES Users(UserId);
ALTER TABLE LineManager ADD CONSTRAINT FK_LineManager_Region FOREIGN KEY (StaffUserId) REFERENCES Users(UserId);
ALTER TABLE LineManager ADD CONSTRAINT FK_LineManager_Distributor FOREIGN KEY (DistributorId) REFERENCES Distributor(DistributorId);


