/*For all dummy data,
Please arrange sql in Table alphabet order and include "SET search_path TO TrainingSystem;" above each table sql for ease of use*/


-- CertificationTemplate
SET search_path TO TrainingSystem;
INSERT INTO CertificationTemplate (code, name, TemplateURI, TemplateContent, Description, CreatedDate)
VALUES ('ct1','Certificate 1','certificate1.html','This is Certificate 1 Content','Certificate 1 description',now()),
  ('ct2','Certificate 2','certificate2.html','This is Certificate 2 Content','Certificate 2 description',now()),
  ('ct3','Certificate 3','certificate3.html','This is Certificate 3 Content','Certificate 3 description',now()),
  ('ct4','Certificate 4','certificate4.html','This is Certificate 4 Content','Certificate 4 description',now()),
  ('ct5','Certificate 5','certificate5.html','This is Certificate 5 Content','Certificate 5 description',now()),
  ('ct6','Certificate 6','certificate6.html','This is Certificate 6 Content','Certificate 6 description',now()),
  ('ct7','Certificate 7','certificate7.html','This is Certificate 7 Content','Certificate 7 description',now()),
  ('ct8','Certificate 8','certificate8.html','This is Certificate 8 Content','Certificate 8 description',now()),
  ('ct9','Certificate 9','certificate9.html','This is Certificate 9 Content','Certificate 9 description',now()),
  ('ct10','Certificate 10','certificate10.html','This is Certificate 10 Content','Certificate 10 description',now()),
  ('ct11','Certificate 11','certificate11.html','This is Certificate 11 Content','Certificate 11 description',now()),
  ('ct12','Certificate 12','certificate12.html','This is Certificate 12 Content','Certificate 12 description',now()),
  ('ct13','Certificate 13','certificate13.html','This is Certificate 13 Content','Certificate 13 description',now()),
  ('ct14','Certificate 14','certificate14.html','This is Certificate 14 Content','Certificate 14 description',now()),
  ('ct15','Certificate 15','certificate15.html','This is Certificate 15 Content','Certificate 15 description',now()),
  ('ct16','Certificate 16','certificate16.html','This is Certificate 16 Content','Certificate 16 description',now()),
  ('ct17','Certificate 17','certificate17.html','This is Certificate 17 Content','Certificate 17 description',now()),
  ('ct18','Certificate 18','certificate18.html','This is Certificate 18 Content','Certificate 18 description',now()),
  ('ct19','Certificate 19','certificate19.html','This is Certificate 19 Content','Certificate 19 description',now()),
  ('ct20','Certificate 20','certificate20.html','This is Certificate 20 Content','Certificate 20 description',now()),
  ('ct21','Certificate 21','certificate21.html','This is Certificate 21 Content','Certificate 21 description',now());

--ProficiencySetting
SET search_path TO TrainingSystem;
--Stars
INSERT INTO proficiencysetting(code, name, lowvalue, uppervalue, ratingdisplay, createddate, priority)
VALUES
  ('PF000001', '1 Star', 0, 20, 1, now(), 2),
  ('PF000002', '2 Star', 21, 40, 2, now(), 2),
  ('PF000003', '3 Star', 41, 60, 3, now(), 2),
  ('PF000004', '4 Star', 61, 80, 4, now(), 2),
  ('PF000005', '5 Star', 81, 100, 5, now(), 2);
--Ranks
INSERT INTO proficiencysetting(code, name, topvalue, createddate, priority)
VALUES
  ('PF000006', 'First', 1, now(), 1),
  ('PF000007', 'Second', 2, now(), 1),
  ('PF000008', 'Third', 3, now(), 1),
  ('PF000009', 'Forth', 4, now(), 1),
  ('PF000010', 'Fifth', 5, now(), 1),
  ('PF000011', 'Sixth', 6, now(), 1),
  ('PF000012', 'Seventh', 7, now(), 1),
  ('PF000013', 'Eighth', 8, now(), 1),
  ('PF000014', 'Ninth', 9, now(), 1),
  ('PF000015', 'Tenth', 10, now(), 1);
--Program --> use import program function instead
/*SET search_path TO TrainingSystem;
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-01', 'Just testing program 1', 1, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-02', 'Just testing program 2', 2, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-03', 'Just testing program 3', 3, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-04', 'Just testing program 4', 4, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-05', 'Just testing program 5', 5, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-06', 'Just testing program 6', 6, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-07', 'Just testing program 7', 7, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-08', 'Just testing program 8', 8, now());
insert into program(code, name, sortorder, createdDate) values('PROG-TEST-09', 'Just testing program 9', 9, now());*/

--Programtoc --> use import program function instead
/*set search_path to TrainingSystem;
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-01', 'Mockdata program-toc-01', 1, now(), (SELECT MAX(skillid) FROM skill));
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-02', 'Mockdata program-toc-02', 2, now(), (SELECT MAX(skillid) FROM skill));
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-03', 'Mockdata program-toc-03', 3, now(), (SELECT MAX(skillid) FROM skill));
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-04', 'Mockdata program-toc-04', 4, now(), (SELECT MAX(skillid) FROM skill)-1);
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-05', 'Mockdata program-toc-05', 5, now(), (SELECT MAX(skillid) FROM skill)-1);
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-06', 'Mockdata program-toc-06', 6, now(), (SELECT MAX(skillid) FROM skill)-1);
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-07', 'Mockdata program-toc-07', 7, now(), (SELECT MAX(skillid) FROM skill)-2);
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-08', 'Mockdata program-toc-08', 8, now(), (SELECT MAX(skillid) FROM skill)-2);
insert into programtoc(name, description, sortorder, createdDate, skillid) values('PROG-TOC-09', 'Mockdata program-toc-09', 9, now(), (SELECT MAX(skillid) FROM skill)-2);
*/

--Question
set search_path to TrainingSystem;
INSERT INTO Question(questionuid, questionnumber, programid, programtocid, resourceid, questionxml, questionpregeneratedhtml, correctanswer, correctanswerhtml, answeroption, score, questiontypeid, createddate, code)
VALUES
  ('QUID01', 1, (select max(ProgramId) from Program)-1, (SELECT MAX(programtocid) FROM programtoc)-8, (SELECT MAX(resourceid) FROM resource)-8, '<h3>Question 1 content</h3>',
            '<html></html>', 'Question 01 Correct Answer', 'Question 1 Correct Answer HTML', 1, 1, (SELECT MAX(questiontypeid) FROM questiontype)-1, now(), 'CH000001'),
  ('QUID02', 2, (select max(ProgramId) from Program)-1, (SELECT MAX(programtocid) FROM programtoc)-8, (SELECT MAX(resourceid) FROM resource)-8, '<h3>Question 2 content</h3>',
            '<html></html>', 'Question 02 Correct Answer', 'Question 02 Correct Answer HTML', 1, 2, ((SELECT MAX(questiontypeid) FROM questiontype))-2, now(), 'CH000002'),
  ('QUID03', 3, (select max(ProgramId) from Program)-1, (SELECT MAX(programtocid) FROM programtoc)-8, (SELECT MAX(resourceid) FROM resource)-8, '<h3>Question 3 content</h3>',
            '<html></html>', 'Question 03 Correct Answer', 'Question 03 Correct Answer HTML', 1, 3, ((SELECT MAX(questiontypeid) FROM questiontype)), now(), 'CH000003'),
  ('QUID04', 4, (select max(ProgramId) from Program)-1, (SELECT MAX(programtocid) FROM programtoc)-8, (SELECT MAX(resourceid) FROM resource)-8, '<h4>Question 4 content</h4>',
            '<html></html>', 'Question 04 Correct Answer', 'Question 04 Correct Answer HTML', 1, 4, ((SELECT MAX(questiontypeid) FROM questiontype))-2, now(), 'CH000004'),
  ('QUID05', 5, (select max(ProgramId) from Program)-1, (SELECT MAX(programtocid) FROM programtoc)-7, (SELECT MAX(resourceid) FROM resource)-7, '<h5>Question 5 content</h5>',
            '<html></html>', 'Question 05 Correct Answer', 'Question 05 Correct Answer HTML', 1, 1, ((SELECT MAX(questiontypeid) FROM questiontype)), now(), 'CH000005'),
  ('QUID06', 6, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-7, (SELECT MAX(resourceid) FROM resource)-7, '<h6>Question 6 content</h6>',
            '<html></html>', 'Question 06 Correct Answer', 'Question 06 Correct Answer HTML', 0, 2, ((SELECT MAX(questiontypeid) FROM questiontype))-1, now(), 'CH000006'),
  ('QUID07', 7, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-7, (SELECT MAX(resourceid) FROM resource)-7, '<h7>Question 7 content</h7>',
            '<html></html>', 'Question 07 Correct Answer', 'Question 07 Correct Answer HTML', 0, 3, ((SELECT MAX(questiontypeid) FROM questiontype))-2, now(), 'CH000007'),
  ('QUID08', 8, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-7, (SELECT MAX(resourceid) FROM resource)-7, '<h8>Question 8 content</h8>',
            '<html></html>', 'Question 08 Correct Answer', 'Question 08 Correct Answer HTML', 0, 4, ((SELECT MAX(questiontypeid) FROM questiontype)), now(), 'CH000008'),
  ('QUID09', 9, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-6, (SELECT MAX(resourceid) FROM resource)-6, '<h9>Question 9 content</h9>',
            '<html></html>', 'Question 09 Correct Answer', 'Question 09 Correct Answer HTML', 0, 1, ((SELECT MAX(questiontypeid) FROM questiontype))-1, now(), 'CH000009'),
  ('QUID10', 10, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-6, (SELECT MAX(resourceid) FROM resource)-6, '<h10>Question 10 content</h10>',
             '<html></html>', 'Question 10 Correct Answer', 'Question 10 Correct Answer HTML', 0, 2, ((SELECT MAX(questiontypeid) FROM questiontype))-2, now(), 'CH000010'),
  ('QUID11', 11, (select max(ProgramId) from Program), (SELECT MAX(programtocid) FROM programtoc)-6, (SELECT MAX(resourceid) FROM resource)-6, '<h11>Question 11 content</h11>',
             '<html></html>', 'Question 11 Correct Answer', 'Question 11 Correct Answer HTML', 0, 3, ((SELECT MAX(questiontypeid) FROM questiontype)), now(), 'CH000011');

--QuestionType
set search_path to TrainingSystem;
insert into questionType(type, name, description) values('MC', 'Multiple choice', 'Multiple choice');
insert into questionType(type, name, description) values('Yes_No', 'Yes No question', 'Yes No question');
insert into questionType(type, name, description) values('True_False', 'True False question', 'True False question');
insert into questionType(type, name, description) values('MSC', 'Multiple select choice', 'Multiple select choice');

--Resource --> use import program function instead
/*set search_path to TrainingSystem;
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc), 'RES-01', 'Resource 01', 'Just testing resource 01', '/content/resourceidcon/example-icon1.png', 1, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 0, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-1, 'RES-02', 'Resource 02', 'Just testing resource 02', '/content/resourceidcon/example-icon2.png', 2, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 0, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-2, 'RES-03', 'Resource 03', 'Just testing resource 03', '/content/resourceidcon/example-icon3.png', 3, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 0, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-3, 'RES-04', 'Resource 04', 'Just testing resource 04', '/content/resourceidcon/example-icon4.png', 4, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 0, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-4, 'RES-05', 'Resource 05', 'Just testing resource 05', '/content/resourceidcon/example-icon5.png', 5, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 0, TRUE );
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-5, 'RES-06', 'Resource 06', 'Just testing resource 06', '/content/resourceidcon/example-icon6.png', 6, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 1, TRUE );
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-6, 'RES-07', 'Resource 07', 'Just testing resource 07', '/content/resourceidcon/example-icon7.png', 7, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 1, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-7, 'RES-08', 'Resource 08', 'Just testing resource 08', '/content/resourceidcon/example-icon8.png', 8, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 1, FALSE);
insert into resource(programtocid, resourcecode, title, description, resourceicon, sortorder, uri, resourcetype, createddate, status, downloadable)
values((SELECT MAX(programtocid) FROM programtoc)-8, 'RES-09', 'Resource 09', 'Just testing resource 09', '/content/resourceidcon/example-icon9.png', 9, '/content/resource/resource-code/example.pdf', 'PDF-TYPE', now(), 1, FALSE);
*/
--ResourceCatergory -->not currently used
/*set search_path to TrainingSystem;
insert into resourcecategory(programid, name, description, sortorder) VALUES ((SELECT MAX(programid) FROM program), 'resource category 1', 'resource category 1 description', 1);
insert into resourcecategory(programid, name, description, sortorder) VALUES ((SELECT MAX(programid) FROM program)-1, 'resource category 1', 'resource category 1 description', 2);
*/
-- Skill --> use import program function instead
/*SET search_path TO TrainingSystem;
INSERT INTO Skill (Code, Name, Description, SortOrder, CreatedDate, ProgramId)
VALUES ('sk1','Skill 1','Skill 1 Description','1', now(), (select max(ProgramId) from Program)),
  ('sk2','Skill 2','Skill 2 Description','2', now(), (select max(ProgramId) from Program)),
  ('sk3','Skill 3','Skill 3 Description','3', now(), (select max(ProgramId) from Program)),
  ('sk4','Skill 4','Skill 4 Description','4', now(), (select max(ProgramId) from Program)),
  ('sk5','Skill 5','Skill 5 Description','5', now(), (select max(ProgramId) from Program)),
  ('sk6','Skill 6','Skill 6 Description','6', now(), (select max(ProgramId) from Program)),
  ('sk7','Skill 7','Skill 7 Description','7', now(), (select max(ProgramId) from Program)),
  ('sk8','Skill 8','Skill 8 Description','8', now(), (select max(ProgramId) from Program)),
  ('sk9','Skill 9','Skill 9 Description','9', now(), (select max(ProgramId) from Program)),
  ('sk10','Skill 10','Skill 10 Description','10', now(), (select max(ProgramId) from Program)),
  ('sk11','Skill 11','Skill 11 Description','11', now(), (select max(ProgramId) from Program));*/

-- UserGroup
SET search_path TO TrainingSystem;
insert into UserGroup(code, name, description, createddate, modifieddate) values('ADMIN', 'Quản trị hệ thống', null, now(), null);
INSERT INTO UserGroup(code, name, description, createddate, modifieddate) VALUES('RSM', 'RSM', null, now(), null);
INSERT INTO UserGroup(code, name, description, createddate, modifieddate) VALUES('ASM', 'ASM', null, now(), null);
INSERT INTO UserGroup(code, name, description, createddate, modifieddate) VALUES('SE', 'SE', null, now(), null);
INSERT INTO UserGroup(code, name, description, createddate, modifieddate) VALUES('SM', 'SM', null, now(), null);

-- User
SET search_path TO TrainingSystem;
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('lqviet', 'lqviet', 'NHeKr5howj0=', 'Le Quoc viet', 'Viet', 'Le', 'viet.le@banvien.com', '0982647619', 1, 2, NOW());
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('ntdung', 'ntdung', 'NHeKr5howj0=', 'Nguyen Tien Dung', 'Dung', 'Nguyen', 'dung.nguyen@banvien.com', '0982647619', 1, 3, NOW());
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('donganh', 'donganh', 'NHeKr5howj0=', 'Dong Anh', 'Anh', 'Dong', 'dong.anh@banvien.com', '0982647619', 1, 4, NOW());
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('vule', 'vule', 'NHeKr5howj0=', 'Vu Le', 'Vu', 'Le', 'vu.le@banvien.com', '0982647619', 1, 4, NOW());
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('dat', 'dat', 'NHeKr5howj0=', 'Dat', 'Anh', 'Dong', 'dat.nguyen@banvien.com', '0982647619', 1, 4, NOW());
INSERT INTO Users(Username, Code, Password, FullName, FirstName, LastName, Email, PhoneNumber, Status, UserGroupId, CreatedDate)
VALUES('admin', 'ADMIN', 'NHeKr5howj0=', 'System Administrator', 'System', 'Administrator', 'khang.nguyen@banvien.com', '0982647619', 1, 6, NOW());


