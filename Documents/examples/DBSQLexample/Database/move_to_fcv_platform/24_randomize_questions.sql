set search_path to FCVPlatform;
ALTER TABLE Training_CourseAssessmentInstance ADD COLUMN RandomizeQuestions VARCHAR(512);

UPDATE Training_CourseAssessmentInstance SET RandomizeQuestions = (SELECT QuestionPool FROM Training_CourseAssignment a WHERE a.CourseAssignmentId = Training_CourseAssessmentInstance.CourseAssignmentId);
ALTER TABLE Training_Resource ALTER COLUMN URI Type TEXT;