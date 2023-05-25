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
	afm                  VARCHAR(9) CHARACTER SET utf8 NOT NULL     ,
	city 				 VARCHAR(30) CHARACTER SET utf8 NOT NULL     ,
	address              VARCHAR(60) CHARACTER SET utf8 NOT NULL     ,
	postal_code			 VARCHAR(10) CHARACTER SET utf8 NOT NULL     ,	
	physio_name          VARCHAR(40) CHARACTER SET utf8  NOT NULL     ,
	name                 VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	surname              VARCHAR(50) CHARACTER SET utf8 NOT NULL     
 ) engine=InnoDB;
CREATE  TABLE physiolink.patient ( 
	id                   INT  NOT NULL     PRIMARY KEY               ,
	email                VARCHAR(70) CHARACTER SET utf8 NOT NULL     ,
	phone_number         VARCHAR(25) CHARACTER SET utf8 NOT NULL     ,
	amka                 VARCHAR(11) CHARACTER SET utf8 NOT NULL     ,
	name                 VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	surname              VARCHAR(50) CHARACTER SET utf8 NOT NULL     ,
	doctor_id               INT  NOT NULL     ,
	city 				 VARCHAR(30) CHARACTER SET utf8 NOT NULL     ,
	address              VARCHAR(60) CHARACTER SET utf8 NOT NULL     ,
	postal_code			 VARCHAR(10) CHARACTER SET utf8 NOT NULL       
 ) engine=InnoDB;
CREATE TABLE physiolink.appointment (
	id                   INT  NOT NULL  AUTO_INCREMENT   PRIMARY KEY,
	patient_id			 INT NOT NULL,
    doctor_id               INT NOT NULL,
	date                 DATETIME NOT NULL,
	isConfirmed          BOOLEAN NOT NULL,
	isCompleted 		 BOOLEAN NOT NULL,
	message              VARCHAR(250) CHARACTER SET utf8 NOT NULL
) engine=InnoDB;

CREATE  TABLE physiolink.has_service ( 
	doctor_id            INT  NOT NULL,
	service_id           VARCHAR(100) CHARACTER SET utf8 NOT NULL     
 ) engine=InnoDB;
CREATE TABLE physiolink.has_payment (
	appointment_id       INT  NOT NULL      ,
	service_id           VARCHAR(100) CHARACTER SET utf8 NOT NULL
) engine=InnoDB;

CREATE TABLE physiolink.notification (
	user_id 			INT NOT NULL,
	title			    VARCHAR(50) CHARACTER SET utf8 NOT NULL,
	message 			VARCHAR(300) CHARACTER SET utf8 NOT NULL
) engine=InnoDB;

ALTER TABLE physiolink.doctor ADD CONSTRAINT doc_to_user_id FOREIGN KEY ( id ) REFERENCES physiolink.`user`( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_service ADD CONSTRAINT doc_to_ser_id FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_service ADD CONSTRAINT ser_to_doc_id FOREIGN KEY ( service_id ) REFERENCES physiolink.service( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.patient ADD CONSTRAINT patient_to_user_id FOREIGN KEY ( id ) REFERENCES physiolink.`user`( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.patient ADD CONSTRAINT fk_patient_doctor FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.appointment ADD CONSTRAINT fk_appointment_doctor FOREIGN KEY ( doctor_id ) REFERENCES physiolink.doctor( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.appointment ADD CONSTRAINT fk_appointment_patient FOREIGN KEY ( patient_id ) REFERENCES physiolink.patient( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_payment ADD CONSTRAINT fk_appointment_service FOREIGN KEY ( service_id ) REFERENCES physiolink.service( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.has_payment ADD CONSTRAINT fk_service_appointment FOREIGN KEY ( appointment_id ) REFERENCES physiolink.appointment( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE physiolink.notification ADD CONSTRAINT fk_user_notification FOREIGN KEY ( user_id ) REFERENCES physiolink.`user`( id ) ON DELETE NO ACTION ON UPDATE NO ACTION;


INSERT INTO physiolink.`user` (username, password, role) VALUES ("psf1", "psf1", "psf");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc1", "doc1", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat1", "pat1", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat2", "pat2", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat3", "pat3", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat4", "pat4", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat5", "pat5", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc2", "doc2", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat6", "pat6", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat7", "pat7", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat8", "pat8", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat9", "pat9", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat10", "pat10", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc3", "doc3", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat11", "pat11", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat12", "pat12", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat13", "pat13", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat14", "pat14", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat15", "pat15", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc4", "doc4", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat16", "pat16", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat17", "pat17", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat18", "pat18", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat19", "pat19", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat20", "pat20", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc5", "doc5", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat21", "pat21", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat22", "pat22", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat23", "pat23", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat24", "pat24", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat25", "pat25", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc6", "doc6", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat26", "pat26", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat27", "pat27", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat28", "pat28", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat29", "pat29", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat30", "pat30", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc7", "doc7", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat31", "pat31", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat32", "pat32", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat33", "pat33", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat34", "pat34", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat35", "pat35", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc8", "doc8", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat36", "pat36", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat37", "pat37", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat38", "pat38", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat39", "pat39", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat40", "pat40", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc9", "doc9", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat41", "pat41", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat42", "pat42", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat43", "pat43", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat44", "pat44", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat45", "pat45", "patient");

INSERT INTO physiolink.`user` (username, password, role) VALUES ("doc10", "doc10", "doctor");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat46", "pat46", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat47", "pat47", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat48", "pat48", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat49", "pat49", "patient");
INSERT INTO physiolink.`user` (username, password, role) VALUES ("pat50", "pat50", "patient");



INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (2, "Γιώργος", "Παπαδόπουλος", "giorgos.papadopoulos@physiolink.gr", "6911111111", "111111111", "Θεσσαλονίκη", "Τσιμισκή 296", "51111", "Αίολος");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (3, "Ιάσων", "Καραφουλίδης", "iason.karoufoulidis@physiolink.gr", "6900000000", "Κιλκίς", "Εγνατίας 10", "50000", "22222200001", 2);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (4, "Μαρία", "Δολεσίδου", "maria.dolesidou@physiolink.gr", "6900000001", "Αθήνα", "Κατερίνας 3", "50001", "22222200002", 2);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (5, "Ιωάννης", "Βλαχόπουλος", "ioannis.vlaxopoulos@physiolink.gr", "6900000002", "Θεσσαλονίκη", "Εγνατίας 54", "50002", "22222200003", 2);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (6, "Κωνσταντίνος", "Αγγελίδης", "konstantinos.aggelidis@physiolink.gr", "6900000003", "Βόλος", "Ψαρά 15", "50003", "22222200004", 2);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (7, "Δήμητρα", "Ιωαννίδου", "dimitra.ioannidou@physiolink.gr", "6900000004", "Αλεξανδρούπολης", "Μακαρίτη 99", "50004", "22222200005", 2);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (8, "Μαρία", "Παπανικολάου", "maria.papanikolaou@physiolink.gr", "6911111112", "111111112", "Αθήνα", "Έγλη 34", "51112", "Optimum");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (9, "Βικτώρια", "Λιμενίδου", "viktoria.limenidou@physiolink.gr", "6900000005", "Ιωαννίνα", "Κλάψας 13", "50005", "22222200006", 8);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (10, "Αναστασία", "Παπανδρέου", "anastasia.papandreou@physiolink.gr", "6900000006", "Κιλκίς", "Μακαρωνά 72", "50006", "22222200007", 8);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (11, "Ελένη", "Χατζηδάκη", "eleni.xatzidaki@physiolink.gr", "6900000007", "Λάρισα", "Ιωάννου 22", "50007", "22222200008", 8);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (12, "Δημήτριος", "Γέμελος", "dimitrios.gemelos@physiolink.gr", "6900000008", "Πάτρα", "Κωσταντινίδη 45", "50008", "22222200009", 8);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (13, "Μάριος ", "Πουταχίδης", "marios.poutaxidis@physiolink.gr", "6900000009", "Αθήνα", "Κυψέλης 26", "50009", "22222200010", 8);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (14, "Ιωάννης", "Δημητρίου", "ioannis.dimitriou@physiolink.gr", "6911111113", "111111113", "Θεσσαλονίκη", "Ναπολέοντα 77", "51113", "Energy");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (15, "Παναγιώτης", "Στεργιούλας-Μπόλης", "panagiwtis.stergioulasmpolis@physiolink.gr", "6900000010", "Λαμία", "Κυπαρισίου 21", "50010", "22222200011", 14);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (16, "Βασίλειος", "Δανιηλίδης", "vasilios.danilidis@physiolink.gr", "6900000011", "Ναύπλιο", "Κοριτσιού 265", "50011", "22222200012", 14);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (17, "Ελένη", "Καρασαβίδου", "eleni.karasavidou@physiolink.gr", "6900000012", "Μύκονος", "Χώρας 66", "50012", "22222200013", 14);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (18, "Σοφία", "Τσιτηρίδου", "sofia.tsitiridou@physiolink.gr", "6900000013", "Ρόδος", "Τουλίπας 98", "50013", "22222200014", 14);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (19, "Ευρώπη", "Πιτσάρη", "europi.pitsari@physiolink.gr", "6900000014", "Θάσος", "Κύκλοπα 54", "50014", "22222200015", 14);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (20, "Μιχαήλ", "Κατσουλάκης", "michalis.katsoulakis@physiolink.gr", "6911111114", "111111114", "Αθήνα", "25ης Μαρτίου 129", "51114", "Health");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (21, "Θεοδώρα", "Κατσεησβίλη ", "theodora.katseisvili@physiolink.gr", "6900000015", "Φλώρινα", "Τσολία 34", "50015", "22222200016", 20);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (22, "Σοφία", "Θεολόγου", "sofia.theologou@physiolink.gr", "6900000016", "Θεσσαλονίκη", "Αγ. Σοφία 5", "50016", "22222200017", 20);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (23, "Σοφία", "Καμτσόγλου", "sofia.kamtsoglou@physiolink.gr", "6900000017", "Αθήνα", "Μαρίας 54", "50017", "22222200018", 20);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (24, "Στάθης", "Χαχαμίδης", "stathis.xaxamidis@physiolink.gr", "6900000018", "Κρήτη", "Αγ. Αθανασίου 77", "50018", "22222200019", 20);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (25, "Βασιλική", "Τζίτζικα", "vasiliki.tzitzika@physiolink.gr", "6900000019", "Κιλκίς", "Μακρινίτσας 86", "50019", "22222200020", 20);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (26, "Δήμητρα", "Κυριακοπούλου", "dimitra.kuriakopoulou@physiolink.gr", "6911111115", "111111115", "Καβάλα", "Νίκης 65", "51115", "Physio");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (27, "Kostandin", "Kote ", "konstandin.kote@physiolink.gr", "6900000020", "Καβάλα", "Ξυλοκόπου 44", "50020", "22222200021", 26);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (28, "Ιωάννα ", "Ρουμελιώτη", "ioanna.roumelioti@physiolink.gr", "6900000021", "Σέρρες", "Σβόλου 10", "50021", "22222200022", 26);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (29, "Μιχάηλ", "Χαραλαμπίδης", "mixahl.xaralampidis@physiolink.gr", "6900000022", "Θεσσαλονίκη", "Τσιμισκή 78", "50022", "22222200023", 26);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (30, "Μαρία", "Μανουσαρίδου", "maria.manousaridou@physiolink.gr", "6900000023", "Αθήνα", "Αναστάσιου 19", "50023", "22222200024", 26);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (31, "Χαράλαμπος", "Μαθιουδάκης", "xaralampos.mathioudakis@physiolink.gr", "6900000024", "Αθήνα", "Παύλου Μελά 3", "50024", "22222200025", 26);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (32, "Χρήστος", "Παπαγεωργίου", "christos.papageorgiou@physiolink.gr", "6911111116", "111111116", "Βόλος", "Αθηνών 23", "51116", "Ηρακλής");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (33, "Σοφοκλής", "Παντερής ", "sofoklis.panteris@physiolink.gr", "6900000025", "Θεσσαλονίκη", "Μεγαλομάρτηρα 82", "50025", "22222200026", 32);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (34, "Θεοδώρα", "Μπακογιάννη", "theodora.mpakogianni@physiolink.gr", "6900000026", "Θεσσαλονίκη", "Ακακίας 34", "50026", "22222200027", 32);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (35, "Γιάνης", "Βαρουφάκης", "gianis.varoufakis@physiolink.gr", "6900000027", "Αθήνα", "Αγ. Γεωργίου 56", "50027", "22222200028", 32);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (36, "Ιωάννης", "Λουκάτος", "ioannis.loukatos@physiolink.gr", "6900000028", "Αθήνα", "Ελ. Βενιζέλου 51", "50028", "22222200029", 32);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (37, "Χρήστος", "Μαρμαρίδης", "xristos.marmaridis@physiolink.gr", "6900000029", "Αθήνα", "Γρ. Λαμπράκη 1", "50029", "22222200030", 32);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (38, "Γιάννης", "Αγαπίδης", "giannis.agapidis@physiolink.gr", "6911111117", "111111117", "Σέρρες", "Κολοκοτρώνη 54", "51117", "Οδυσσέας");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (39, "Αλεξάνδρα", "Κουδούνη ", "alexandra.koudouni@physiolink.gr", "6900000030", "Ξάνθη", "Νικολάου 12", "50030", "22222200031", 38);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (40, "Βασίλειος", "Σταφυλίδης", "vasilios.stafilidis@physiolink.gr", "6900000031", "Ξάνθη", "Θεοτόκου 122", "50031", "22222200032", 38);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (41, "Γεώργιος", "Καριπίδης", "georgios.karipidis@physiolink.gr", "6900000032", "Ξάνθη", "Μύνωα 62", "50032", "22222200033", 38);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (42, "Δημήτριος", "Μεταξάς", "dimitrios.metaxas@physiolink.gr", "6900000033", "Καβάλα", "Σαντορίνης 133", "50033", "22222200034", 38);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (43, "Πολυνίκη", "Εμμανουηλίδου", "poluniki.emmanouilidou@physiolink.gr", "6900000034", "Καβάλα", "Σταυρού 49", "50034", "22222200035", 38);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (44, "Χριστίνα", "Ομορφίδου", "christina.omorfidou@physiolink.gr", "6911111118", "111111118", "Αθήνα", "Φράγκων 33", "51118", "Αχιλλέας");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (45, "Αριστοτέλης ", "Χαρισιάδης", "aristotelis.xarisiadis@physiolink.gr", "6900000035", "Βόλος", "Κουταλιού 9", "50035", "22222200036", 44);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (46, "Κατερίνα", "Κοτσίδου", "katerina.kotsidou@physiolink.gr", "6900000036", "Βόλος", "Νεας Κρήνης 23", "50036", "22222200037", 44);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (47, "Νικόλαος", "Τσακανίκας", "nikolaos.tsakanikas@physiolink.gr", "6900000037", "Βόλος", "Διαβατών 61", "50037", "22222200038", 44);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (48, "Άννα", "Μανούσου", "anna.manousou@physiolink.gr", "6900000038", "Βόλος", "Θήλης 71", "50038", "22222200039", 44);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (49, "Εμμανουήλ", "Κυδονάκης", "emmanouil.kudonakis@physiolink.gr", "6900000039", "Λάρισα", "Γαλατσίου 80", "50039", "22222200040", 44);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (50, "Εμμανουήλ", "Τσουδαρός", "emmanouhl.tsoudaros@physiolink.gr", "6911111119", "111111119", "Θεσσαλονίκη", "Εγνατίας 156", "51119", "Ξέρξης");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (51, "Χρήστος ", "Τσαρχόπουλος", "christos.tsarchopoulos@physiolink.gr", "6900000040", "Κερκυρά", "Κλεοπάτρας 52", "50040", "22222200041", 50);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (52, "Γεώργιος", "Αναγνώστακης", "georgios.anagnostakis@physiolink.gr", "6900000041", "Κερκυρά", "Αυγούστου 11", "50041", "22222200042", 50);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (53, "Μαρία ", "Βενιζέλου", "maria.venizelou@physiolink.gr", "6900000042", "Ζάκυνθος", "Ελευθερίας 8", "50042", "22222200043", 50);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (54, "Χριστίνα", "Καλογιάννη", "xristina.kalogianni@physiolink.gr", "6900000043", "Ζάκυνθος", "Τυράννου 72", "50043", "22222200044", 50);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (55, "Αναστασία", "Κουσενίδου", "anastasia.kousenidou@physiolink.gr", "6900000044", "Ζάκυνθος", "Λουλουδιού 2", "50044", "22222200045", 50);

INSERT INTO physiolink.doctor (id, name, surname, email, phone_number, afm, city, address, postal_code, physio_name) VALUES (56, "Κώστας", "Κουκλίδης", "kostas.kouklidis@physiolink.gr", "6911111110", "111111110", "Θεσσαλονίκη", "Δελφών 21", "51110", "Δήμητρα");
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (57, "Ελένη ", "Σενεπρέμτε ", "eleni.senepremte@physiolink.gr", "6900000045", "Καρδίτσα", "Πελοπονήσου 90", "50045", "22222200046", 56);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (58, "Θεόδωρος", "Παπαδόπουλος", "theodoros.papadopoulos@physiolink.gr", "6900000046", "Καρδίτσα", "Αγχιάλου 2", "50046", "22222200047", 56);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (59, "Παναγιώτης", "Παππάς", "panagiotis.pappas@physiolink.gr", "6900000047", "Καρδίτσα", "Μεγάρων 1", "50047", "22222200048", 56);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (60, "Αθανάσιος", "Βλάχος", "athanasios.vlachos@physiolink.gr", "6900000048", "Τρίκαλα", "Σιδηροδρόμου 89", "50048", "22222200049", 56);
INSERT INTO physiolink.patient (id, name, surname, email, phone_number, city, address, postal_code, amka, doctor_id) VALUES (61, "Ευάγγελος", "Οικονόμου", "euaggelos.oikonomou@physiolink.gr", "6900000049", "Τρίκαλα", "Μαγνησίας 24", "50049", "22222200050", 56);



INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-001","Αθλητική μάλαξη","Μια εξειδικευμένη υπηρεσία για ασθενείς με χρόνια αποφρακτική πνευμονοπάθεια (ΧΑΠ), μια κοινή πνευμονοπάθεια που συχνά προκαλείται από το κάπνισμα, η οποία περιλαμβάνει διάγνωση, θεραπεία, αποκατάσταση και συνεχή διαχείριση.",45);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-002","Οστεοαρθρίτιδα ","Η θεραπεία για την οστεοαρθρίτιδα επικεντρώνεται στη διαχείριση των συμπτωμάτων της νόσου και στην επιβράδυνση της εξέλιξής της. Χρησιμοποιούμε μια σειρά θεραπειών, όπως φυσικοθεραπεία, φαρμακευτική αγωγή, ενέσεις στις αρθρώσεις και τροποποιήσεις του τρόπου ζωής για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας και να βελτιώσετε την ποιότητα ζωής σας.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-003","Αρθροπλαστική","Η αρθροπλαστική είναι μια χειρουργική επέμβαση που περιλαμβάνει την αντικατάσταση μιας κατεστραμμένης ή άρρωστης άρθρωσης με μια τεχνητή άρθρωση. Παρέχουμε διαδικασίες αρθροπλαστικής σε ασθενείς με σοβαρή βλάβη των αρθρώσεων ή χρόνιο πόνο που δεν μπορεί να αντιμετωπιστεί με άλλες θεραπείες.",70);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-004","Αρθροσκόπηση","Η αρθροσκόπηση είναι μια ελάχιστα επεμβατική χειρουργική διαδικασία που μας επιτρέπει να δούμε και να αντιμετωπίσουμε προβλήματα στο εσωτερικό μιας άρθρωσης. Οι αρθροσκοπικές διαδικασίες μας μπορούν να βοηθήσουν στη διάγνωση και τη θεραπεία μιας σειράς προβλημάτων των αρθρώσεων, συμπεριλαμβανομένων των ρήξεων, των φλεγμονών και των βλαβών του χόνδρου.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-005","Θεραπεία με βλαστοκύτταρα ","Η θεραπεία με βλαστοκύτταρα είναι μια θεραπεία αιχμής που χρησιμοποιεί βλαστοκύτταρα για την αποκατάσταση κατεστραμμένων ιστών στο σώμα. Η θεραπεία με βλαστοκύτταρα μπορεί να βοηθήσει στην επιτάχυνση της διαδικασίας επούλωσης και στη μείωση του πόνου και της φλεγμονής.",250);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-006","Διαχείριση του στρες","Το πρόγραμμά για τη διαχείριση του άγχους σας βοηθά να εντοπίσετε και να διαχειριστείτε τα επίπεδα άγχους σας. Προσφέρουμε μια σειρά από τεχνικές διαχείρισης του στρες, όπως τεχνικές χαλάρωσης, mindfulness και γνωσιακή-συμπεριφορική θεραπεία.",50);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-007","Αυχενικό σύνδρομο"," Η θεραπεία για το αυχενικό σύνδρομο επικεντρώνεται στην ανακούφιση από τον πόνο και την αποκατάσταση της λειτουργίας του αυχένα και του άνω μέρους της πλάτης. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φυσικοθεραπείας, της φαρμακευτικής αγωγής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας και να βελτιώσετε την ποιότητα ζωής σας.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-008","Διαχείριση πονοκεφάλου "," Το πρόγραμμα διαχείρισης πονοκεφάλων σας βοηθά να διαχειριστείτε τους πονοκεφάλους σας και να μειώσετε τη συχνότητα και τη σοβαρότητά τους. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φαρμακευτικής αγωγής, των τροποποιήσεων του τρόπου ζωής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας.",70);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-009","Μυοσκελετικές διαταραχές ","Η θεραπεία των μυοσκελετικών διαταραχών επικεντρώνεται στη διαχείριση και θεραπεία μιας σειράς παθήσεων που επηρεάζουν τους μύες, τα οστά και τις αρθρώσεις. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φυσικοθεραπείας, της φαρμακευτικής αγωγής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας και να βελτιώσετε την ποιότητα ζωής σας.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-010","Ορθοπεδικές παθήσεις"," Η ορθοπεδική θεραπεία  επικεντρώνεται στη διαχείριση και θεραπεία μιας σειράς παθήσεων που επηρεάζουν τα οστά, τις αρθρώσεις και τους μυς. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φυσικοθεραπείας, της φαρμακευτικής αγωγής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας και να βελτιώσετε την ποιότητα ζωής σας.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-011","Διαχείριση πόνου στην πλάτη","Το πρόγραμμά για τη διαχείριση του πόνου στην πλάτη σας βοηθά να διαχειριστείτε τον πόνο στην πλάτη σας και να μειώσετε τον αντίκτυπό του στη ζωή σας. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φυσικοθεραπείας, της φαρμακευτικής αγωγής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-012","Διαχείριση παχυσαρκίας ","Το πρόγραμμά για τη διαχείριση της παχυσαρκίας σας βοηθά να διαχειριστείτε το βάρος σας και να μειώσετε τον κίνδυνο εμφάνισης προβλημάτων υγείας που σχετίζονται με την παχυσαρκία. Προσφέρουμε μια σειρά προγραμμάτων απώλειας βάρους, συμπεριλαμβανομένων προγραμμάτων διατροφής και άσκησης, φαρμακευτικής αγωγής και άλλων τρόπων για να σας βοηθήσουμε να διαχειριστείτε το βάρος σας.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-013","Βελονισμός"," Η θεραπεία βελονισμού περιλαμβάνει την εισαγωγή λεπτών βελονών σε συγκεκριμένα σημεία του σώματος για την ανακούφιση από τον πόνο και την προώθηση της επούλωσης. Προσφέρουμε τον βελονισμό ως συμπληρωματική θεραπεία στις άλλες θεραπείες μας.",50);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-014","Διακοπή καπνίσματος","Το πρόγραμμά για τη διακοπή του καπνίσματος σας βοηθά να κόψετε το κάπνισμα και να μειώσετε τον κίνδυνο εμφάνισης προβλημάτων υγείας που σχετίζονται με το κάπνισμα. Προσφέρουμε μια σειρά από θεραπείες διακοπής του καπνίσματος, συμπεριλαμβανομένης της θεραπείας υποκατάστασης νικοτίνης, της φαρμακευτικής αγωγής και της συμβουλευτικής.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-015","Διαχείριση της κατάθλιψης","Το πρόγραμμά για τη διαχείριση της κατάθλιψης σας βοηθά να διαχειριστείτε τα συμπτώματα της κατάθλιψης και να βελτιώσετε την ποιότητα ζωής σας. Χρησιμοποιούμε μια σειρά θεραπειών, συμπεριλαμβανομένης της φαρμακευτικής αγωγής, της συμβουλευτικής και άλλων μεθόδων για να σας βοηθήσουμε να διαχειριστείτε τα συμπτώματά σας.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-016","Νευρολογικές παθήσεις","Η υπηρεσία αυτή παρέχει θεραπεία και διαχείριση νευρολογικών διαταραχών, όπως η νόσος του Πάρκινσον, η σκλήρυνση κατά πλάκας και η επιληψία.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-017","Τενοντοπάθεια","Η υπηρεσία αυτή παρέχει διάγνωση, θεραπεία και διαχείριση της τενοντοπάθειας ασβεστοποίησης, μιας κατάστασης κατά την οποία σχηματίζονται εναποθέσεις ασβεστίου στους τένοντες, προκαλώντας πόνο και μειωμένη κινητικότητα.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-018","Kήλη δίσκου","Πρόκειται για μια πάθηση κατά την οποία οι δίσκοι στη σπονδυλική στήλη γλιστρούν από τη θέση τους και πιέζουν τα νεύρα, προκαλώντας πόνο, μούδιασμα και αδυναμία.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-019","Eπικονδυλίτιδα","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση της επικονδυλίτιδας, μιας πάθησης που είναι ευρέως γνωστή ως αγκώνας του τένις ή αγκώνας του γκολφέρ, η οποία προκαλεί πόνο και φλεγμονή στους τένοντες του αγκώνα.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-020","Ρευματολογικές παθήσεις","Η υπηρεσία αυτή παρέχει θεραπεία και διαχείριση ρευματολογικών παθήσεων, όπως η ρευματοειδής αρθρίτιδα, ο λύκος και η ψωριασική αρθρίτιδα.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-021","Σκολίωση","Η υπηρεσία αυτή παρέχει διάγνωση, θεραπεία και διαχείριση της σκολίωσης, μιας πάθησης κατά την οποία η σπονδυλική στήλη καμπυλώνει ανώμαλα, προκαλώντας πόνο και μειωμένη κινητικότητα.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-022","Συνδρόμου καρπιαίου σωλήνα","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση του συνδρόμου καρπιαίου σωλήνα, μιας πάθησης κατά την οποία το μέσο νεύρο στον καρπό συμπιέζεται, προκαλώντας πόνο, μούδιασμα και αδυναμία στο χέρι.",70);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-023","Απλή Επίσκεψη","Η υπηρεσία αυτή παρέχει φυσικοθεραπεία για μια σειρά παθήσεων, συμπεριλαμβανομένων των αθλητικών τραυματισμών, των μυοσκελετικών διαταραχών και της μετεγχειρητικής αποκατάστασης.",50);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-024","Λεμφοιδήματος"," Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση του λεμφοιδήματος, μιας κατάστασης κατά την οποία το λεμφικό σύστημα έχει υποστεί βλάβη ή έχει μπλοκαριστεί, προκαλώντας πρήξιμο στα άκρα.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-025","Εξωσωματική θεραπεία"," Αυτή η υπηρεσία παρέχει μη επεμβατική θεραπεία για παθήσεις όπως η πελματιαία απονευρωσίτιδα, η τενοντίτιδα και ο αγκώνας του τένις, χρησιμοποιώντας κρουστικά κύματα για την τόνωση της επούλωσης.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-026","Οστικό οιδήμα"," Μια κατάσταση κατά την οποία υπάρχει οίδημα στο μυελό των οστών, που προκαλεί πόνο και μειωμένη κινητικότητα.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-027","Αυχεναλγία","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση της αυχεναλγίας, μιας κατάστασης κατά την οποία υπάρχει χρόνιος πόνος σε ένα άκρο μετά την επούλωση ενός τραυματισμού.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-028","Οστεοπόρωση","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση της οστεοπόρωσης, μιας κατάστασης κατά την οποία τα οστά γίνονται εύθραυστα και αδύναμα, αυξάνοντας τον κίνδυνο καταγμάτων.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-029","Σπονδυλόλυση","Η υπηρεσία αυτή παρέχει διάγνωση, θεραπεία και διαχείριση της σπονδυλόλυσης και της σπονδυλολίσθησης, καταστάσεων στις οποίες υπάρχει ελάττωμα ή κάταγμα στους σπονδύλους της σπονδυλικής στήλης, προκαλώντας πόνο και μειωμένη κινητικότητα.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-030","Αποκατάσταση μεγάλου δακτύλου","Αυτή η υπηρεσία παρέχει αποκατάσταση για παθήσεις που επηρεάζουν το μεγάλο δάκτυλο του ποδιού, όπως οι κάλους, οι σφυροδακτυλία και το δάκτυλο του χλοοτάπητα.",70);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-031","Αρθροσκόπηση μηνίσκου"," Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση των ρήξεων μηνίσκου με τη χρήση αρθροσκοπικής χειρουργικής, μιας ελάχιστα επεμβατικής διαδικασίας.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-032","Αρθροσκόπηση χιαστών συνδέσμων","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και διαχείριση των κακώσεων του χιαστού συνδέσμου με τη χρήση αρθροσκοπικής χειρουργικής, μιας ελάχιστα επεμβατικής διαδικασίας.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-033","Αρθροσκόπηση χονδροπάθειας","Αυτή η υπηρεσία παρέχει διάγνωση, θεραπεία και αντιμετώπιση της χονδροπάθειας με τη χρήση αρθροσκοπικής χειρουργικής, μιας ελάχιστα επεμβατικής διαδικασίας.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-034","Αυτόλογοι αυξητικοί παράγοντες συμπυκνωμένοι σε αιμοπετάλια"," Μια θεραπεία κατά την οποία το αίμα του ίδιου του ασθενούς λαμβάνεται, επεξεργάζεται και στη συνέχεια εγχέεται πίσω στο σώμα για να προωθήσει την επούλωση και την αναγέννηση των ιστών.",250);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-035","Ενδοσκοπική διάνοιξη","Μια ελάχιστα επεμβατική χειρουργική επέμβαση που περιλαμβάνει την εισαγωγή μιας μικρής κάμερας στον καρπό για την απεικόνιση και απελευθέρωση του καρπιαίου σωλήνα, παρέχοντας ανακούφιση από το σύνδρομο του καρπιαίου σωλήνα.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-036","Ηλεκτρονική συνταγογράφηση","Μια υπηρεσία κατά την οποία οι συνταγές παρέχονται ηλεκτρονικά, εξαλείφοντας την ανάγκη για έντυπες συνταγές και αυξάνοντας την ευκολία για τους ασθενείς.",50);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-037","Αντιμετώπιση τενοντίτιδας","Μια θεραπεία κατά την οποία ένα συμπυκνωμένο διάλυμα αιμοπεταλίων εγχέεται στην πληγείσα περιοχή για την προώθηση της επούλωσης και την ανακούφιση από τα συμπτώματα της τενοντίτιδας.",250);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-038","Κυφοπλαστική","Μια χειρουργική επέμβαση που χρησιμοποιείται για τη θεραπεία καταγμάτων συμπίεσης στη σπονδυλική στήλη, κατά την οποία ένα μπαλόνι εισάγεται στον προσβεβλημένο σπόνδυλο και φουσκώνει για την αποκατάσταση του ύψους, ακολουθούμενη από έγχυση οστικού τσιμέντου.",300);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-039","Μικροχειρουργική αποκατάσταση","Μια εξειδικευμένη υπηρεσία αποκατάστασης για παθήσεις που επηρεάζουν τα χέρια και τα δάχτυλα, όπως βλάβες νεύρων, τραυματισμοί τενόντων ή αρθρίτιδα, με τη χρήση προηγμένων μικροχειρουργικών τεχνικών.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-040","Παρακολούθηση καταγμάτων"," Μια υπηρεσία κατά την οποία οι ασθενείς με κατάγματα παρακολουθούνται στενά για να διασφαλιστεί η σωστή επούλωση και να αποφευχθούν επιπλοκές, συμπεριλαμβανομένων τακτικών ακτινογραφιών και ραντεβού παρακολούθησης.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-041","Πυελλογραφία","Μια διαγνωστική τεχνική απεικόνισης που χρησιμοποιείται για την αξιολόγηση της πυελικής περιοχής, η οποία χρησιμοποιείται συνήθως για τη διάγνωση καταγμάτων της πυέλου, όγκων ή φλεγμονωδών καταστάσεων.",150);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-042","Κύφωση","Μια εξειδικευμένη υπηρεσία για ασθενείς με κύφωση, μια πάθηση που χαρακτηρίζεται από μη φυσιολογική καμπυλότητα της σπονδυλικής στήλης, η οποία περιλαμβάνει πρόληψη, διάγνωση, θεραπεία και αποκατάσταση.",100);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-043","Ηλεκτροβελονισμός","Ενισχύει τα θεραπευτικά αποτελέσματα του παραδοσιακού βελονισμού για την ανακούφιση από τον πόνο, τη μείωση του στρες ή άλλες καταστάσεις.",80);
INSERT INTO physiolink.service (id, title, description,price) VALUES ("ΦΘ-044","Διαχείριση της νόσου της ΧΑΠ-καπνιστή","Μια εξειδικευμένη υπηρεσία για ασθενείς με χρόνια αποφρακτική πνευμονοπάθεια (ΧΑΠ), μια κοινή πνευμονοπάθεια που συχνά προκαλείται από το κάπνισμα, η οποία περιλαμβάνει διάγνωση, θεραπεία, αποκατάσταση και συνεχή διαχείριση.",100);



INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (3,2,"2023-04-23 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (4,2,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (5,2,"2023-06-23 14:00:00",false,false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (6,2,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (9,8,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (10,8,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (11,8,"2023-06-12 14:00:00",false,false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (12,8,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (15,14,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (16,14,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (17,14,"2023-06-12 14:00:00",false,false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (18,14,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (21,20,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (22,20,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (23,20,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (24,20,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (27,26,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (28,26,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (29,26,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (30,26,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (33,32,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (34,32,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (35,32,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (36,32,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (39,38,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (40,38,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (41,38,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (42,38,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (45,44,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (46,44,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (47,44,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (48,44,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (51,50,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (52,50,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (53,50,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (54,50,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");

INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (57,56,"2023-04-10 10:00:00",true,true,"Πόνος στο γόνατο.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (58,56,"2023-04-25 12:00:00",true,true,"Πόνος στο καρπό.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (59,56,"2023-06-12 14:00:00",false, false,"Πόνος στην μέση.");
INSERT INTO physiolink.appointment ( patient_id, doctor_id, date, isConfirmed, isCompleted, message) VALUES (60,56,"2023-05-31 08:00:00",true,false,"Πόνος στο όμο.");



INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-002");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-003");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-004");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-005");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-006");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-007");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-008");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-009");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (2,"ΦΘ-010");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-002");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-003");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-011");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-012");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-013");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-014");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-015");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-016");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (8,"ΦΘ-017");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-002");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-018");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-019");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-020");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-021");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-022");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-023");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-024");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (14,"ΦΘ-025");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-002");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-003");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-004");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-005");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-006");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-007");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-008");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-009");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (20,"ΦΘ-010");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-026");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-027");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-028");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-029");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-030");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-031");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-032");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-033");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (26,"ΦΘ-034");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-026");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-027");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-028");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-029");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-010");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-011");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-012");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-013");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (32,"ΦΘ-014");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-034");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-035");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-036");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-037");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-039");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-040");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-041");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-042");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (38,"ΦΘ-042");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-002");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-003");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-004");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-005");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-006");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-007");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-008");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-009");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (44,"ΦΘ-010");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-020");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-021");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-022");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-023");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-024");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-025");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-026");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-027");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (50,"ΦΘ-028");

INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-001");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-034");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-035");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-036");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-037");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-039");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-040");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-041");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-042");
INSERT INTO physiolink.has_service (doctor_id,service_id) VALUES (56,"ΦΘ-042");


INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (1,"ΦΘ-001");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (2,"ΦΘ-013");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (5,"ΦΘ-010");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (6,"ΦΘ-033");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (9,"ΦΘ-009");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (10,"ΦΘ-002");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (13,"ΦΘ-001");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (14,"ΦΘ-005");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (17,"ΦΘ-022");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (18,"ΦΘ-041");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (21,"ΦΘ-007");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (22,"ΦΘ-037");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (25,"ΦΘ-027");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (26,"ΦΘ-019");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (29,"ΦΘ-003");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (30,"ΦΘ-020");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (33,"ΦΘ-030");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (34,"ΦΘ-011");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (37,"ΦΘ-003");
INSERT INTO physiolink.has_payment (appointment_id,service_id) VALUES (38,"ΦΘ-021");
