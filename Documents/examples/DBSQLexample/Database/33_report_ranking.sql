select userid,
	  username,
	  usr_fullname,
	  user_groupcode,
	  user_groupname,
	  position_name,
	  region_name,
	  department,
	  total_course,
	  coalesce(avg_score, 0) AS avg_score,
	  RANK() OVER (ORDER BY coalesce(avg_score, 0) DESC)
FROM (	
	(-- get user info
	select fcvplatform.users.userid, 
	  fcvplatform.users.username AS username, 
	  fcvplatform.users.fullname AS usr_fullname, 
	  FCVPlatform.usergroup.code AS user_groupcode,
	  FCVPlatform.usergroup.name AS user_groupname,
	  FCVPlatform.region.name AS region_name,
	  FCVPlatform.training_position.name AS position_name,
	  array_to_string(array_agg(FCVPlatform.training_department.name), ', ') as department
	FROM FCVPlatform.users
		LEFT JOIN FCVPlatform.usergroup ON FCVPlatform.users.usergroupid = FCVPlatform.usergroup.usergroupid
		LEFT JOIN FCVPlatform.training_userprofile ON FCVPlatform.training_userprofile.userid = FCVPlatform.users.userid
		LEFT JOIN FCVPlatform.region ON FCVPlatform.training_userprofile.regionid = FCVPlatform.region.regionid
		LEFT JOIN FCVPlatform.training_position ON FCVPlatform.training_userprofile.positionId = FCVPlatform.training_position.positionId
		LEFT JOIN FCVPlatform.training_userdepartment ON FCVPlatform.training_userprofile.userprofileid = FCVPlatform.training_userdepartment.userprofileid
		LEFT JOIN FCVPlatform.training_department ON FCVPlatform.training_userdepartment.departmentId = FCVPlatform.training_department.departmentId
	GROUP BY fcvplatform.users.userid, username, fullname, FCVPlatform.usergroup.code, FCVPlatform.usergroup.name, FCVPlatform.region.name, FCVPlatform.training_position.name)
		AS usr_inf
		LEFT JOIN (
			-- Get total of course for each user
				SELECT learnerid, count(*) AS total_course
				FROM FCVPlatform.training_courseroster
				GROUP BY learnerid)
			AS cr ON usr_inf.userid = cr.learnerid) 
	AS usr_sc
	LEFT JOIN (
		-- Get average score (score is 0 if the course is expired time)
		SELECT tcr.learnerid, avg(coalesce(tcr.avgscore, 0)) AS avg_score
		FROM fcvplatform.training_course as tc join fcvplatform.training_courseroster tcr
			ON tc.courseid = tcr.courseid
		WHERE tcr.failedonexpired = 1 or (tcr.failedonexpired = 0 and tcr.status > 5)
		GROUP BY tcr.learnerid
	) AS usr_avg
	ON usr_sc.userid = usr_avg.learnerid
WHERE total_course is not null
ORDER BY avg_score DESC

