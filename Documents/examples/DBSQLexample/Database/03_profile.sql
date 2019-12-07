SET search_path to TrainingSystem;
create table Profiling (
  profilingid bigserial not null primary key,
  name character varying(255),
  key character varying(200) NOT NULL,
  value character varying(200) NOT NULL,
  description character varying(255),
  createddate timestamp without time zone NOT NULL,
  modifieddate timestamp without time zone,
  CONSTRAINT profiling_key_key UNIQUE (key)
);

INSERT INTO Profiling(Name, Key, Value, CreatedDate) VALUES('jcr.rmi.url', 'jcr.rmi.url', 'rmi://localhost:1097/jackrabbit.repository', now());