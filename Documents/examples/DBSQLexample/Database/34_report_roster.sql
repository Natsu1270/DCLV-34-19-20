select courseid, name, startdate, enddate, learningtype, tcr_tc_usr.learningcourse_status, statusfeedback, trainerid, tcr_tc_usr.courserosterid, 
sourcetype, avgscore, duration, failedonexpired, status as registration_status, userid, username, code, fullname, user_groupcode,
user_groupname, region_name, postition_name, department, avgfeedback, assessment_cout, 
case 
	when region_name is null 
		then 
			(SELECT array_to_string(array_agg(distinct regionname), ', ')  
			FROM FCVPlatform.vw_sub_perfect_store_usermanager  
			WHERE nnwid = userid or seid = userid or rsmid = userid or asmid = userid or smid = userid)
		else '' 
	end as soleforce_regions
from ((
		(select tcr.courseid, name, startdate, enddate, learningtype, tcr.status as learningcourse_status, learnerid, programid, statusfeedback, trainerid, courserosterid, sourcetype, avgscore, duration, failedonexpired
	   	from FCVPlatform.training_courseroster as tc left join FCVPlatform.training_course as tcr on tc.courseid=tcr.courseid) as tcr_tc
	
		left join fcvplatform.training_courseregistration as cg
		on  tcr_tc.learnerid = cg.learnerid and tcr_tc.programid = cg.programid
	
		left join (select FCVPlatform.users.userid, username, FCVPlatform.users.code, fullname, email, phonenumber, 
						FCVPlatform.usergroup.code as user_groupcode,
						FCVPlatform.usergroup.name as user_groupname,FCVPlatform.region.name as region_name, 
						FCVPlatform.training_position.name AS postition_name, array_to_string(array_agg(FCVPlatform.training_department.name), ', ') as department
					FROM FCVPlatform.users
						LEFT JOIN FCVPlatform.usergroup ON FCVPlatform.users.usergroupid = FCVPlatform.usergroup.usergroupid
						LEFT JOIN FCVPlatform.training_userprofile ON FCVPlatform.training_userprofile.userid = FCVPlatform.users.userid
						LEFT JOIN FCVPlatform.region ON FCVPlatform.training_userprofile.regionid = FCVPlatform.region.regionid
						LEFT JOIN FCVPlatform.training_position ON FCVPlatform.training_userprofile.positionId = FCVPlatform.training_position.positionId
						LEFT JOIN FCVPlatform.training_userdepartment ON FCVPlatform.training_userprofile.userprofileid = FCVPlatform.training_userdepartment.userprofileid
						LEFT JOIN FCVPlatform.training_department ON FCVPlatform.training_userdepartment.departmentId = FCVPlatform.training_department.departmentId
					GROUP BY FCVPlatform.users.userid, username, FCVPlatform.users.code, fullname, email, phonenumber, FCVPlatform.usergroup.code, FCVPlatform.usergroup.name, FCVPlatform.region.name, FCVPlatform.training_position.name) as usr
			on tcr_tc.learnerid = usr.userid) as tcr_tc_usr
	  left join (SELECT courseid as courseid_asm_count, count(*) as assessment_cout
				FROM fcvplatform.training_courseassignment
				group by courseid) as scr
	  	on scr.courseid_asm_count = tcr_tc_usr.courseid) as tcr_tc_usr
				
	left join (select courserosterid, (quality + testeasytounderstand + questioneasy)/3 as avgfeedback from fcvplatform.training_coursefeedback) as fb_avg
		on fb_avg.courserosterid = tcr_tc_usr.courserosterid
order by courseid