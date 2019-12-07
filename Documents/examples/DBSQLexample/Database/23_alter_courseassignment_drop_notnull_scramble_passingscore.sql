SET search_path TO TrainingSystem;
ALTER TABLE courseassignment ALTER COLUMN scramble DROP NOT NULL ;
ALTER TABLE courseassignment ALTER COLUMN passingscore DROP NOT NULL ;