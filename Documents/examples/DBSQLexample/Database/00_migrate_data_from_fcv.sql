set search_path to TrainingSystem;
INSERT INTO Region(Code, Name, SortOrder, CreatedDate)
SELECT name, name, sortorder, now()
    FROM dblink('user=fcv password=123456 host=localhost port=5432 dbname=FCVPlatform', 'select Name, Description, SortOrder from FCVPlatform.Region')
      AS t1(name text, description text, sortorder integer);


INSERT INTO UserGroup(UserGroupId, Code, Name, Description, CreatedDate)
SELECT UserGroupId, Code, Name, Description, NOW()
    FROM dblink('user=fcv password=123456 host=localhost port=5432 dbname=FCVPlatform', 'select UserGroupId, Code, Name, Description from FCVPlatform.Region')
      AS t1(UserGroupId bigint, code text, name text, description text);

INSERT INTO Users(UserId, )