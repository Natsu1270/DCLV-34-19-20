set search_path to FCVPlatform;
UPDATE Users set Status = 2 WHERE UserGroupID = (SELECT userGroupId FROM UserGroup WHERE code = 'SM') AND username not IN (SELECT smcode FROM salesforce);
UPDATE Users set Status = 2 WHERE UserGroupID = (SELECT userGroupId FROM UserGroup WHERE code = 'SE') AND username not IN (SELECT secode FROM salesforce);
UPDATE Users set Status = 2 WHERE UserGroupID = (SELECT userGroupId FROM UserGroup WHERE code = 'ASM') AND username not IN (SELECT asmcode FROM salesforce);
UPDATE Users set Status = 2 WHERE UserGroupID = (SELECT userGroupId FROM UserGroup WHERE code = 'RSM') AND username not IN (SELECT rsmcode FROM salesforce);
