SET search_path TO TrainingSystem;

ALTER TABLE Resource ADD COLUMN Status SMALLINT DEFAULT 0;
ALTER TABLE Resource ADD COLUMN Downloadable BOOLEAN DEFAULT TRUE;

/*Drop resourceCategoryId for now since there is no use for ResourceCategory yet*/
ALTER TABLE Resource DROP COLUMN resourcecategoryid;