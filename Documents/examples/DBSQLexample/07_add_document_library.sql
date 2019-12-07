set search_path to FCVPlatform;
CREATE TABLE Training_DocumentCategory (
  DocumentCategoryId BIGSERIAL NOT NULL PRIMARY KEY,
  Name VARCHAR(255),
  Description TEXT,
  DisplayOrder INTEGER,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP,
  UNIQUE(Name)
);

CREATE TABLE Training_Document (
  DocumentId BIGSERIAL NOT NULL PRIMARY KEY,
  Title VARCHAR(255) NOT NULL,
  Url VARCHAR(255) NOT NULL,
  Thumbnail VARCHAR(255),
  Description TEXT,
  DisplayOrder INTEGER,
  CategoryId BIGINT NOT NULL,
  UploadedBy BIGINT NOT NULL,
  CreatedDate TIMESTAMP NOT NULL,
  ModifiedDate TIMESTAMP NOT NULL,
  Tags VARCHAR(255)
);
ALTER TABLE Training_Document ADD FOREIGN KEY (CategoryId) REFERENCES Training_DocumentCategory(DocumentCategoryId) ON DELETE NO ACTION;
ALTER TABLE Training_Document ADD FOREIGN KEY (UploadedBy) REFERENCES Users(UserId) ON DELETE NO ACTION;

