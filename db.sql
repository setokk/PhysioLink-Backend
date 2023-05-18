CREATE DATABASE physiolink;
CREATE  TABLE physiolink.service ( 
	id                   VARCHAR(100) CHARACTER SET utf8 NOT NULL PRIMARY KEY,
	title                VARCHAR(70) CHARACTER SET utf8 NOT NULL     ,
	description          VARCHAR(400) CHARACTER SET utf8 NOT NULL     ,
	price                DOUBLE  NOT NULL     
 ) engine=InnoDB;
CREATE  TABLE physiolink.`user` ( 
	id                   INT  NOT NULL   AUTO_INCREMENT  PRIMARY KEY,
	username             VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	password             VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	role                 VARCHAR(25) CHARACTER SET utf8 NOT NULL     
 ) engine=InnoDB;
CREATE  TABLE physiolink.doctor ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	email                VARCHAR(70) CHARACTER SET utf8 NOT NULL     ,
	phone_number         VARCHAR(25) CHARACTER SET utf8 NOT NULL     ,
	afm                  VARCHAR(15) CHARACTER SET utf8 NOT NULL     ,
	address              VARCHAR(60) CHARACTER SET utf8 NOT NULL     ,
	postal_code			 VARCHAR(10) CHARACTER SET utf8 NOT NULL     ,	
	physio_name          VARCHAR(40) CHARACTER SET utf8  NOT NULL     ,
	name                 VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	surname              VARCHAR(50) CHARACTER SET utf8 NOT NULL     
 ) engine=InnoDB;
CREATE  TABLE physiolink.has_service ( 
	doctor_id            INT  NOT NULL     PRIMARY KEY,
	service_id           VARCHAR(100) CHARACTER SET utf8 NOT NULL     
 ) engine=InnoDB;
CREATE  TABLE physiolink.patient ( 
	id                   INT  NOT NULL     PRIMARY KEY,
	email                VARCHAR(70) CHARACTER SET utf8 NOT NULL     ,
	phone_number         VARCHAR(25) CHARACTER SET utf8 NOT NULL     ,
	amka                 VARCHAR(30) CHARACTER SET utf8 NOT NULL     ,
	name                 VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	surname              VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	doctor_id               INT  NOT NULL     ,
	address              VARCHAR(60) CHARACTER SET utf8 NOT NULL     ,
	postal_code			 VARCHAR(10) CHARACTER SET utf8 NOT NULL       
 ) engine=InnoDB;
CREATE TABLE physiolink.appointment (
	id                   INT  NOT NULL  AUTO_INCREMENT   PRIMARY KEY,
	patient_id			 INT NOT NULL,
    doctor_id               INT NOT NULL,
	date                 DATETIME NOT NULL,
	isConfirmed          BOOLEAN NOT NULL,
	message              VARCHAR(250) CHARACTER SET utf8 NOT NULL
) engine=InnoDB;
ALTER TABLE physiolink.doctor ADD CONSTRAINT doc_to_user_id FOREIGN KEY ( id ) REFERENCES physiolink.`user`( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_service ADD CONSTRAINT doc_to_ser_id FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_service ADD CONSTRAINT ser_to_doc_id FOREIGN KEY ( service_id ) REFERENCES physiolink.service( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.patient ADD CONSTRAINT patient_to_user_id FOREIGN KEY ( id ) REFERENCES physiolink.`user`( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.patient ADD CONSTRAINT fk_patient_doctor FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.appointment ADD CONSTRAINT fk_appointment_doctor FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.appointment ADD CONSTRAINT fk_appointment_patient FOREIGN KEY ( patient_id ) REFERENCES physiolink.patient( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
INSERT INTO physiolink.`user` (username, password, role) VALUES ("psf1", "psf1", "psf");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc1", "doc1", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat1", "pat1", "patient");
INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, address, postal_code, physio_name) VALUES (2, "Μιχαήλ", "Μπρο", "michael@physiolink.gr", "6934236578", "11594834", "Εγνατίας 24", "58234", "Απόλλων");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, address, postal_code, amka, doctor_id) VALUES (3, "Γιώργος", "Μπροο", "giwrgos@physiolink.gr", "6905394567", "Εγνατίας 10", "55344", "160501356544", 2);