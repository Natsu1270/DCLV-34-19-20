SET search_path to TrainingSystem;

insert into UserGroup(code, name, description, createddate, modifieddate) values('ADMIN', 'Quản trị hệ thống', null, now(), null);
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('admin', 'ADMIN', 'NHeKr5howj0=', 'System Administrator', 'System', 'Administrator', 'khang.nguyen@banvien.com', '0982647619', 1, 1, NOW());
