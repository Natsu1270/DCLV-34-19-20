set search_path to FCVPlatform;
ALTER TABLE Training_CourseRoster ADD COLUMN FailedOnExpired INTEGER DEFAULT 0;
ALTER TABLE Training_CourseRoster ADD COLUMN AvgScore DECIMAL (10,2);
ALTER TABLE Training_CourseRoster ADD COLUMN Duration DECIMAL (10,2);


UPDATE training_courseroster SET AvgScore = (SELECT AVG(Score) FROM training_courseassessmentinstance a, training_courseassignment ag, training_resource r
WHERE r.resourceid = ag.resourceid and ag.courseassignmentid = a.courseassignmentid AND a.courserosterid = training_courseroster.courserosterid and r.resourcetype = 'ASSESSMENT')
WHERE status IN (5, 6, 7);