set search_path to FCVPlatform;
UPDATE Training_CourseRoster SET FailedOnExpired = 1, AvgScore = 0 WHERE CourseID IN (SELECT CourseID FROM Training_Course WHERE DATE(EndDate) < DATE(NOW()))
AND FailedOnExpired IS NULL OR FailedOnExpired = 0 AND Status <> 6;