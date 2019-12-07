set search_path to FCVPlatform;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel1 BIGINT;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel2 BIGINT;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel3 BIGINT;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel4 BIGINT;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel5 BIGINT;
ALTER TABLE Training_UserProfile ADD COLUMN LineManagerLevel6 BIGINT;
