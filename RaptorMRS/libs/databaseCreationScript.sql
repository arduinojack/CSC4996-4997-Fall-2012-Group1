drop database raptor;

create database raptor;  

use raptor;

 CREATE TABLE `PHARMACY`(
       `encounterID` int(10) unsigned zerofill NOT NULL,
       `medPrescribed1` varchar(55),
       `medDispensed1` varchar(55),
       `equalPrescribed1` bit,
       `medPrescribed2` varchar(55),
       `medDispensed2` varchar(55),
       `equalPrescribed2` bit,
       `medPrescribed3` varchar(55),
       `medDispensed3` varchar(55),
       `equalPrescribed3` bit,
       `medPrescribed4` varchar(55),
       `medDispensed4` varchar(55),
       `equalPrescribed4` bit,
       `medPrescribed5` varchar(55),
       `medDispensed5` varchar(55),
       `equalPrescribed5` bit,
       `creatingUser` varchar(55),
       `createdDate` datetime,
       PRIMARY KEY(`encounterID`),
       UNIQUE KEY `encounterID_UNIQUE` (`encounterID`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 CREATE TABLE `ENCOUNTERS` (
       `encounterID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
       `patientID` int(10) unsigned zerofill NOT NULL,
       `chiefComplaint` varchar(55),
       `vitals` varchar(55),
       `historyOfPresentIllness` varchar(55),
       `chronicIllness` varchar(55),
       `keywords` varchar(55),
       `medicalProcedures` varchar(55),
       `medicationsPrescribed` varchar(55),
       `overallImpression` varchar(55),
       `creatingUser` varchar(55),
       `createdDate` datetime,
       `modifyingUser` varchar(55),
       `lastModifiedDate` datetime,
       PRIMARY KEY (`encounterID`),
       UNIQUE KEY `encounterID_UNIQUE` (`encounterID`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 CREATE TABLE `MEDICATIONS` (  
       `medicationID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
       `description` varchar(55),
       `name` varchar(55)  NOT NULL,
       `dosage` int(11) DEFAULT NULL,
       `creatingUser` varchar(55),
       `createdDate` datetime,
       `modifyingUser` varchar(55),
       `lastModifiedDate` datetime,
       PRIMARY KEY (`medicationID`),
       UNIQUE KEY `medicationID_UNIQUE` (`medicationID`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 CREATE TABLE `PATIENTS` (
       `patientID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
       `firstName` varchar(55) NOT NULL,
       `lastName` varchar(55),  
       `birthDate` date DEFAULT NULL,
       `gender` varchar(15),
       `keywords` varchar(55),
       `residence` varchar(55),
       `socialHistory` varchar(55),
       `creatingUser` varchar(55),  
       `createdDate` datetime,
       `modifyingUser` varchar(55),
       `lastModifiedDate` datetime,
       PRIMARY KEY (`patientID`),
       UNIQUE KEY `patientID_UNIQUE` (`patientID`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 
 data

 
 CREATE TABLE `VITALS` (
       `vitalsID` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
       `encounterID` int(10) unsigned zerofill NOT NULL,
       `systolicBP` int(10) unsigned DEFAULT NULL,
       `diastolicBP` int(10) unsigned DEFAULT NULL,
       `heartRate` int(10) unsigned DEFAULT NULL,
       `respRate` int(10) unsigned DEFAULT NULL,
       `temperatureC` int(10) unsigned DEFAULT NULL,
       `oximetry` int(10) unsigned DEFAULT NULL,
       `fingerPoke` bit(1) DEFAULT NULL,
       `bloodSampleID` int(10) unsigned zerofill DEFAULT NULL,
       `height` int(10) unsigned DEFAULT NULL,
       `weight` int(10) unsigned DEFAULT NULL,
       `calculatedBMI` int(10) unsigned DEFAULT NULL,
       `creatingUser` varchar(55),  
       `createdDate` datetime ,
       `modifyingUser` varchar(55),
       `lastModifiedDate` datetime,
       PRIMARY KEY (`vitalsID`),
       UNIQUE KEY `encounterID_UNIQUE` (`encounterID`),
       UNIQUE KEY `vitalsID_UNIQUE` (`vitalsID`),
       UNIQUE KEY `bloodSampleID_UNIQUE` (`bloodSampleID`)
     ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
     
     insert into raptor.USERS (userID, firstName, lastName, userName, password, roles) values (123, 'bob', 'bobson', 'admin', 'raptor','System Administrator');
     insert into raptor.USERS (userID, firstName, lastName, userName, password, roles) values (234, 'jim', 'jimerson', 'student', 'student','Medical Student');
	 insert into raptor.USERS (userID, firstName, lastName, userName, password, roles) values (345, 'frank', 'frankfurter', 'pharm', 'pharm','Pharmacist');
	 insert into raptor.USERS (userID, firstName, lastName, userName, password, roles) values (456, 'sample', 'testyman', 'research', 'research','Researcher');


     