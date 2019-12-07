SET search_path TO TrainingSystem;

ALTER TABLE courseassignment ADD COLUMN passingscore SMALLINT NOT NULL;
ALTER TABLE courseassignment ADD COLUMN scramble BOOLEAN NOT NULL;




