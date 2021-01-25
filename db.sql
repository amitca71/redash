create schema app;


CREATE TABLE companys
(	
	companyid text,
	companyname text,
	lat_lng text COLLATE pg_catalog."default",	
	CONSTRAINT companys_pk PRIMARY KEY (companyid)
	
);

CREATE TABLE vessel
(
	companyid text,
	vessel_id integer,
	capacity integer,
	lat float,
	lon float,	
	CONSTRAINT vessel_pkey PRIMARY KEY (companyid, vessel_id),
	CONSTRAINT fk_vessel_company FOREIGN KEY (companyid) REFERENCES companys (companyid)
);

CREATE TABLE crew_person
(
	crew_person_id text COLLATE pg_catalog."default" NOT NULL,
	email text COLLATE pg_catalog."default",
	first_name text COLLATE pg_catalog."default",
	last_name text COLLATE pg_catalog."default",
	name text COLLATE pg_catalog."default",
	companyid text COLLATE pg_catalog."default" NOT NULL,
	CONSTRAINT pk_crew_person PRIMARY KEY (crew_person_id),
	CONSTRAINT fk_crew_person_site FOREIGN KEY (companyid) REFERENCES companys (companyid)
	
);

CREATE TABLE vessel_allocation
(	
	allocation_id SERIAL,
	companyid text,
	vessel_id integer,
	crew_person_id text not null,
	fromtime timestamp without time zone not null,
	thrutime timestamp without time zone,
	CONSTRAINT vessel_allocation_pkey PRIMARY KEY (allocation_id),
	CONSTRAINT vessel_allocation_unq UNIQUE (companyid,vessel_id, crew_person_id,fromtime),
	CONSTRAINT fk_vessel_allocation_vessel FOREIGN KEY (companyid, vessel_id) REFERENCES vessel (companyid,vessel_id),
	CONSTRAINT fk_vessel_allocation_driver FOREIGN KEY (crew_person_id) REFERENCES crew_person (crew_person_id)
		
);
CREATE TABLE harbour
(	
	harbourname text,
	lat float,
	lon float,	
	CONSTRAINT harbour_pk PRIMARY KEY (harbourname)
	
);
CREATE TABLE vessel_equipmnt
(
	companyid text,
	vessel_id integer,
	catalog_id integer,
	number integer,
	
	CONSTRAINT vessel_equipmnt_pkey PRIMARY KEY (companyid,vessel_id,catalog_id)
);



insert into harbour (harbourname, lat, lon) values ('HK', 22.293291, 114.161133);

insert into harbour (harbourname, lat, lon) values ('Makau', 22.197075, 113.558911);

insert into harbour (harbourname, lat, lon) values ('Shanghai', 31.219832454, 121.486998052);



insert into companys (	companyid,companyname ,lat_lng) values ('angloeastern','anglo eastern', '1,1') ;



INSERT INTO public.vessel(companyid, vessel_id, capacity, lat, lon) VALUES ('angloeastern', 1, 300, 31.219832454, 122);
INSERT INTO public.vessel(companyid, vessel_id, capacity, lat, lon) VALUES ('angloeastern', 2, 250, 20, 113.7);
INSERT INTO public.vessel(companyid, vessel_id, capacity, lat, lon) VALUES ('angloeastern', 3, 300, 20.5, 113);
INSERT INTO public.vessel(companyid, vessel_id, capacity, lat, lon) VALUES ('angloeastern', 4, 30000, 31, 123);
INSERT INTO public.vessel(companyid, vessel_id, capacity, lat, lon) VALUES ('angloeastern', 5, 39095, 30, 123);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 6, 38477);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 7, 3999);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 8, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 9, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 10, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 11, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 12, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 13, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 14, 393983);
INSERT INTO public.vessel(companyid, vessel_id, capacity) VALUES ('angloeastern', 15, 393983);



INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5a071c02bbc78c270065f905', 'NA', 'NA', 'NA', 'c1', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5e4e504de672493821bd6527', 'NA', 'NA', 'NA', 'c2', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5bbe255abe750e0100a06fd1', 'NA', 'NA', 'NA', 'c3', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5a22eb7e3d076f2a00481721', 'NA', 'NA', 'NA', 'c4', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5a22e86aa98eff2e00e28db4', 'NA', 'NA', 'NA', 'c5', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5d385d5607bdd483a16bab66', 'NA', 'NA', 'NA', 'c6', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5a2aac555ca5aa2900516ea8', 'NA', 'NA', 'NA', 'c7', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5f0191da69d4555415c81c1f', 'NA', 'NA', 'NA', 'c8', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5ac9cd03d75521170092aca8', 'NA', 'NA', 'NA', 'c9', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('5ef4880a25017eb8aa8d2760', 'NA', 'NA', 'NA', 'c10', 'angloeastern');
INSERT INTO public.crew_person(crew_person_id, email, first_name, last_name, name, companyid)
VALUES ('59ff5d534b87712700d71d19', 'NA', 'NA', 'NA', 'c11', 'angloeastern');


INSERT INTO public.vessel_allocation(companyid, vessel_id, crew_person_id, fromtime, thrutime)
 VALUES ('angloeastern', 1, '5a071c02bbc78c270065f905', '2020-08-31 16:59:00', '2020-08-31 23:20:00');
INSERT INTO public.vessel_allocation(companyid, vessel_id, crew_person_id, fromtime, thrutime)
 VALUES ('angloeastern', 2, '5e4e504de672493821bd6527', '2020-08-31 16:59:00', '2020-08-31 23:00:00');
INSERT INTO public.vessel_allocation(companyid, vessel_id, crew_person_id, fromtime, thrutime)
 VALUES ('angloeastern', 3, '5bbe255abe750e0100a06fd1', '2020-08-31 16:59:00', '2020-08-31 23:00:00');
INSERT INTO public.vessel_allocation(companyid, vessel_id, crew_person_id, fromtime, thrutime)
 VALUES ('angloeastern', 4, '5a22eb7e3d076f2a00481721', '2020-08-31 12:00:00', '2020-08-31 16:00:00');	
INSERT INTO public.vessel_allocation(companyid, vessel_id, crew_person_id, fromtime, thrutime)
 VALUES ('angloeastern', 5, '5a22e86aa98eff2e00e28db4', '2020-08-31 13:00:00', '2020-08-31 14:00:00');
