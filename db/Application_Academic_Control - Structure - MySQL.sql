CREATE DATABASE aac;
USE aac;

/*CREAR TABLAS*/

/*Person*/
CREATE TABLE AAC_Person
(
ID_Person NVARCHAR(50) PRIMARY KEY,
Name_Person NVARCHAR(200),
Surname_Person NVARCHAR(200)/*Primer Apellido*/,
Lastname_Person NVARCHAR(200),
IdentificationType_Person NVARCHAR(100),
Identification_Person NVARCHAR(100),
Gender_Person NVARCHAR(100),
Birthday_Person NVARCHAR(100),
ID_Country NVARCHAR(50),
ID_Province NVARCHAR(50),
ID_District NVARCHAR(50),
ID_Canton NVARCHAR(50),
CivilStatus_Person NVARCHAR(100),
CellPhone_Person NVARCHAR(50),
Email_Person NVARCHAR(200),
HomeAddress NVARCHAR(250),
State_Person NVARCHAR(100)
);


/*Profile*/
CREATE TABLE AAC_Profile
(
ID_Profile NVARCHAR(50) PRIMARY KEY,
Name_Profile NVARCHAR(100),
State_Profile NVARCHAR(50)
);


/*User*/
CREATE TABLE AAC_User
(
ID_Person NVARCHAR(50) PRIMARY KEY,
Password_User NVARCHAR(200),
ID_Profile NVARCHAR(50),
-- Relation --
 CONSTRAINT Relation_to_Person01 FOREIGN KEY (ID_Person) REFERENCES AAC_Person (ID_Person),
 CONSTRAINT Relation_to_Profile01 FOREIGN KEY (ID_Profile) REFERENCES AAC_Profile (ID_Profile)
);


/*CIFType*/
CREATE TABLE AAC_CIFType
(
ID_CIFType_CIFType NVARCHAR(50) PRIMARY KEY,
Description_CIFType NVARCHAR(100)
);


/*CIF*/
CREATE TABLE AAC_CIF
(
ID_Person NVARCHAR(50) PRIMARY KEY,
PaymentMethod_CIF NVARCHAR(100),
Denomination_CIF NVARCHAR(100),
DateOfAdmission_CIF NVARCHAR(100),
Classification_CIF NVARCHAR(250),
TypeOfCurrency_CIF NVARCHAR(250),
-- Relation --
 CONSTRAINT Relation_to_Person02 FOREIGN KEY (ID_Person) REFERENCES AAC_Person (ID_Person)
);


/*CIF_CIFType*/
CREATE TABLE AAC_CIF_CIFType
(
ID_CIF_CIFType NVARCHAR(50) PRIMARY KEY,
ID_Person NVARCHAR(50),/*AAC_CIF*/
ID_CIFType_CIFType NVARCHAR(50),
-- Relation --
 CONSTRAINT Relation_to_CIF01 FOREIGN KEY (ID_Person) REFERENCES AAC_CIF (ID_Person),
 CONSTRAINT Relation_to_CIFType01 FOREIGN KEY (ID_CIFType_CIFType) REFERENCES AAC_CIFType (ID_CIFType_CIFType)
);


/*ClassRoom*/
CREATE TABLE AAC_ClassRoom
(
ID_ClassRom NVARCHAR(50) PRIMARY KEY,
Description_ClassRoom NVARCHAR(250),
Location_ClassRoom NVARCHAR(250),
Capacity_ClassRoom INT,-- DEPENDENCE
State_ClassRoom NVARCHAR(100)
);


/*Career*/
CREATE TABLE AAC_Career
(
ID_Career NVARCHAR(50) PRIMARY KEY,
Description_Career NVARCHAR(250),
ID_Person NVARCHAR(50), /*AAC_CIF*/
OpeningDate_Career NVARCHAR(100),
State_Career NVARCHAR(100),
-- Relation --
 CONSTRAINT Relation_to_CIF02 FOREIGN KEY (ID_Person) REFERENCES AAC_CIF (ID_Person)
);


/*Level*/
CREATE TABLE AAC_Level
(
ID_Level NVARCHAR(50) PRIMARY KEY,
OpenningDate_Level NVARCHAR(100),
AcademicGrade_Level NVARCHAR(250),
Description_Level NVARCHAR(250),
Enphatic_Level NVARCHAR(250),
Credits_Level INT,-- DEPENDENCE
ID_Career NVARCHAR(50),
MinimumNote_Level INT,
State_Level NVARCHAR(100),
-- Relation --
 CONSTRAINT Relation_to_Career01 FOREIGN KEY (ID_Career) REFERENCES AAC_Career (ID_Career)
);
-- ALTER TABLE [dbo].[AAC_Level] DROP CONSTRAINT [Relation_to_Career]


/*Subject*/
CREATE TABLE AAC_Subject
(
ID_Subject NVARCHAR(50) PRIMARY KEY,
OpenningDate_Subject NVARCHAR(100),
Status_Subject NVARCHAR(100),
Description_Subject NVARCHAR(250),
Credits_Subject INT,
MinimunNote_Subject INT,
MinimunQuote_Subject INT,-- Cupo min
TypeOfCurrency_Subject NVARCHAR(150),
Period_Subject NVARCHAR(100),
ReprobingAbsence_Subject INT,-- Reprob ausencia
HoursDuration_Subject INT,
ExtraordinayMinimunNote_Subject INT,
ApplyScholarshipDiscounts_Subject INT,
DegreeTest_Subject INT, -- Prueba grado
ProfessionalPractice_Subject INT,
AppliesUVirtualRetirement_Subject INT,
ID_Level NVARCHAR(50),
-- Relation --
 CONSTRAINT Relation_to_Level01 FOREIGN KEY (ID_Level) REFERENCES AAC_Level (ID_Level)
);
-- ALTER TABLE [dbo].AAC_Subject DROP CONSTRAINT [Relation_to_Level]

/*CREAR PROCEDIMIENTOS ALMACENADOS*/


-- Insert Profile
DELIMITER //

CREATE PROCEDURE AAC_InsertProfile (
p_Id_Profile NVARCHAR(50),
p_Name_Profile NVARCHAR(100),
p_State_Profile NVARCHAR(50))
BEGIN
INSERT INTO AAC_Profile VALUES (p_Id_Profile, p_Name_Profile, p_State_Profile);

END;
//

DELIMITER ;




-- Insert User
DELIMITER //

CREATE PROCEDURE AAC_InsertUser (
p_ID_Person NVARCHAR(50),
p_Password_User NVARCHAR(200),
p_ID_Profile NVARCHAR(50))
BEGIN
INSERT INTO AAC_User VALUES (p_ID_Person, p_Password_User, p_ID_Profile);

END;
//

DELIMITER ;




-- Login
DELIMITER //

CREATE PROCEDURE AAC_Login (
p_Email_Person NVARCHAR(200),
p_Password_User NVARCHAR(200))
BEGIN
SELECT AAC_User.ID_Person AS ID, AAC_User.Password_User AS Pass, 
AAC_Person.Email_Person AS Email, AAC_Person.Name_Person AS NamePerson, AAC_Profile.Name_Profile AS NameProfile

 FROM AAC_User 
 INNER JOIN AAC_Person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN AAC_Profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile 
 WHERE AAC_Person.Email_Person = p_Email_Person AND 
 AAC_User.Password_User = p_Password_User AND AAC_Person.State_Person = 'Habilitado'
 AND AAC_Profile.State_Profile = 'Habilitado';

END;
//

DELIMITER ;




--  Insert Person
DELIMITER //

CREATE PROCEDURE AAC_InsertPerson (
p_ID_Person NVARCHAR(50),
p_Name_Person NVARCHAR(200),
p_Surname_Person NVARCHAR(200)/*Primer Apellido*/,
p_Lastname_Person NVARCHAR(200),
p_IdentificationType_Person NVARCHAR(100),
p_Identification_Person NVARCHAR(100),
p_Gender_Person NVARCHAR(100),
p_Birthday_Person NVARCHAR(100),
p_ID_Country NVARCHAR(50),
p_ID_Province NVARCHAR(50),
p_ID_District NVARCHAR(50),
p_ID_Canton NVARCHAR(50),
p_CivilStatus_Person NVARCHAR(100),
p_CellPhone_Person NVARCHAR(50),
p_Email_Person NVARCHAR(200),
p_HomeAddress NVARCHAR(250),
p_State_Person NVARCHAR(100))
BEGIN
INSERT INTO AAC_Person VALUES (p_ID_Person, p_Name_Person, p_Surname_Person, p_Lastname_Person,
p_IdentificationType_Person, p_Identification_Person,
 p_Gender_Person, p_Birthday_Person, p_ID_Country, p_ID_Province, p_ID_District, p_ID_Canton, 
p_CivilStatus_Person, p_CellPhone_Person, p_Email_Person, 
p_HomeAddress, p_State_Person);

END;
//

DELIMITER ;




-- List Person
DELIMITER //

CREATE PROCEDURE AAC_ListPerson()
BEGIN
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
aac_settings.aac_country.Description_Country AS Country, 
aac_settings.aac_province.Description_Province AS Province, 
aac_settings.aac_district.Description_District AS District, 
aac_settings.aac_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress AS HomeAddress, aac.aac_person.State_Person AS State 
FROM aac.aac_person
INNER JOIN aac_settings.aac_country ON aac.aac_person.ID_Country = aac_settings.aac_country.ID_Country
INNER JOIN aac_settings.aac_province ON aac.aac_person.ID_Province = aac_settings.aac_province.ID_Province
INNER JOIN aac_settings.aac_district ON aac.aac_person.ID_District = aac_settings.aac_district.ID_District
INNER JOIN aac_settings.aac_canton ON aac.aac_person.ID_Canton = aac_settings.aac_canton.ID_Canton;

END;
//

DELIMITER ;




-- List Person Enabled CBO
DELIMITER //

CREATE PROCEDURE AAC_ListPersonEnabledCBO ()
BEGIN
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
aac_settings.aac_country.Description_Country AS Country, 
aac_settings.aac_province.Description_Province AS Province, 
aac_settings.aac_district.Description_District AS District, 
aac_settings.aac_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress AS HomeAddress, aac.aac_person.State_Person AS State 
FROM aac.aac_person
INNER JOIN aac_settings.aac_country ON aac.aac_person.ID_Country = aac_settings.aac_country.ID_Country
INNER JOIN aac_settings.aac_province ON aac.aac_person.ID_Province = aac_settings.aac_province.ID_Province
INNER JOIN aac_settings.aac_district ON aac.aac_person.ID_District = aac_settings.aac_district.ID_District
INNER JOIN aac_settings.aac_canton ON aac.aac_person.ID_Canton = aac_settings.aac_canton.ID_Canton
WHERE  aac.aac_person.State_Person = 'Habilitado';

END
//

DELIMITER ;




-- List Person Director
DELIMITER //

CREATE PROCEDURE AAC_ListPersonDirector()
BEGIN
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name 
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC';

END;
//

DELIMITER ;




-- Update Person
DELIMITER //

CREATE PROCEDURE AAC_UpdatePerson (
p_ID_Person NVARCHAR(50),
p_Name_Person NVARCHAR(200),
p_Surname_Person NVARCHAR(200)/*Primer Apellido*/,
p_Lastname_Person NVARCHAR(200),
p_IdentificationType_Person NVARCHAR(100),
p_Identification_Person NVARCHAR(100),
p_Gender_Person NVARCHAR(100),
p_Birthday_Person NVARCHAR(100),
p_ID_Country NVARCHAR(50),
p_ID_Province NVARCHAR(50),
p_ID_District NVARCHAR(50),
p_ID_Canton NVARCHAR(50),
p_CivilStatus_Person NVARCHAR(100),
p_CellPhone_Person NVARCHAR(50),
p_Email_Person NVARCHAR(200),
p_HomeAddress NVARCHAR(250),
p_State_Person NVARCHAR(100))
BEGIN
UPDATE AAC_Person SET 
Name_Person = p_Name_Person, 
Surname_Person = p_Surname_Person, 
Lastname_Person = p_Lastname_Person,
IdentificationType_Person = p_IdentificationType_Person,
Identification_Person = Identification_Person,
Gender_Person = p_Gender_Person, 
Birthday_Person = p_Birthday_Person,  
ID_Country = p_ID_Country, 
ID_Province = p_ID_Province, 
ID_District = p_ID_District,
ID_Canton = p_ID_Canton, 
CivilStatus_Person = p_CivilStatus_Person, 
CellPhone_Person = p_CellPhone_Person, 
Email_Person = p_Email_Person, 
HomeAddress = p_HomeAddress, 
State_Person = p_State_Person 
WHERE ID_Person = p_ID_Person;

END;
//

DELIMITER ;




-- Delete Person
DELIMITER //

CREATE PROCEDURE AAC_DeletePerson (
p_dID_Person NVARCHAR(50))
BEGIN
DELETE FROM AAC_Person WHERE ID_Person = p_dID_Person;

END;
//

DELIMITER ;




-- Search Person
DELIMITER //

CREATE PROCEDURE AAC_SearchPerson (
p_search NVARCHAR (100))
BEGIN
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
aac_settings.aac_country.Description_Country AS Country, 
aac_settings.aac_province.Description_Province AS Province, 
aac_settings.aac_district.Description_District AS District, 
aac_settings.aac_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress AS HomeAddress, aac.aac_person.State_Person AS State 
FROM aac.aac_person
INNER JOIN aac_settings.aac_country ON aac.aac_person.ID_Country = aac_settings.aac_country.ID_Country
INNER JOIN aac_settings.aac_province ON aac.aac_person.ID_Province = aac_settings.aac_province.ID_Province
INNER JOIN aac_settings.aac_district ON aac.aac_person.ID_District = aac_settings.aac_district.ID_District
INNER JOIN aac_settings.aac_canton ON aac.aac_person.ID_Canton = aac_settings.aac_canton.ID_Canton
WHERE aac.aac_person.ID_Person LIKE  CONCAT(p_search,'%') OR 
aac.aac_person.Name_Person LIKE  CONCAT(p_search,'%') OR aac.aac_person.Lastname_Person LIKE  CONCAT(p_search,'%') 
OR aac.aac_person.Identification_Person LIKE  CONCAT(p_search,'%') OR  
aac.aac_person.CellPhone_Person LIKE  CONCAT(p_search,'%');

END
//

DELIMITER ;





-- Search Person Enabled
DELIMITER //

CREATE PROCEDURE AAC_SearchPersonEnabled (
p_search NVARCHAR (100))
BEGIN
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
aac_settings.aac_country.Description_Country AS Country, 
aac_settings.aac_province.Description_Province AS Province, 
aac_settings.aac_district.Description_District AS District, 
aac_settings.aac_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress AS HomeAddress, aac.aac_person.State_Person AS State 
FROM aac.aac_person
INNER JOIN aac_settings.aac_country ON aac.aac_person.ID_Country = aac_settings.aac_country.ID_Country
INNER JOIN aac_settings.aac_province ON aac.aac_person.ID_Province = aac_settings.aac_province.ID_Province
INNER JOIN aac_settings.aac_district ON aac.aac_person.ID_District = aac_settings.aac_district.ID_District
INNER JOIN aac_settings.aac_canton ON aac.aac_person.ID_Canton = aac_settings.aac_canton.ID_Canton
WHERE aac.aac_person.ID_Person LIKE  CONCAT(p_search,'%') OR 
aac.aac_person.Name_Person LIKE  CONCAT(p_search,'%') OR aac.aac_person.Lastname_Person LIKE  CONCAT(p_search,'%') 
OR aac.aac_person.Identification_Person LIKE  CONCAT(p_search,'%') OR  
aac.aac_person.CellPhone_Person LIKE  CONCAT(p_search,'%')
 AND aac.aac_person.State_Person = 'Habilitado';

END
//

DELIMITER ;



-- Select CIF
DELIMITER //

CREATE PROCEDURE AAC_SelectCIF()
BEGIN
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name, 
AAC_CIF.PaymentMethod_CIF AS PaymentMethod,
AAC_CIF.Denomination_CIF AS Denomination, AAC_CIF.DateOfAdmission_CIF AS DateOfAdmission,
AAC_CIF.Classification_CIF AS Classification,
AAC_CIF.TypeOfCurrency_CIF AS TypeOfCurrency
FROM AAC_CIF 
INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person;

END;
//

DELIMITER ;




-- Search Person Enabled CBO
DELIMITER //

CREATE PROCEDURE AAC_ListCIFTypeDirectorCBO()
BEGIN
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name 
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC';

END
//

DELIMITER ;




-- List CIFType
DELIMITER //

CREATE PROCEDURE AAC_ListCIFType()
BEGIN
SELECT AAC_CIFType.ID_CIFType_CIFType AS 
IDCIFType, AAC_CIFType.Description_CIFType AS Description
FROM AAC_CIFType;

END;
//

DELIMITER ;




 -- Insert CIF
DELIMITER //

CREATE PROCEDURE AAC_InsertCIF (
p_ID_Person NVARCHAR(50),
p_PaymentMethod_CIF NVARCHAR(100),
p_Denomination_CIF NVARCHAR(100),
p_DateOfAdmission_CIF NVARCHAR(100),
p_Classification_CIF NVARCHAR(250),
p_TypeOfCurrency_CIF NVARCHAR(250),
p_IDCIFType NVARCHAR(50),
p_IDCIF_CIFType NVARCHAR(50))
BEGIN
INSERT INTO AAC_CIF VALUES (p_ID_Person, p_PaymentMethod_CIF, p_Denomination_CIF, 
p_DateOfAdmission_CIF, p_Classification_CIF, p_TypeOfCurrency_CIF);
INSERT INTO AAC_CIF_CIFType VALUES (p_IDCIF_CIFType,p_ID_Person,p_IDCIFType);

END;
//

DELIMITER ;




-- Update CIF
DELIMITER //

CREATE PROCEDURE AAC_UpdateCIF (
p_uiID_Person NVARCHAR(50),
p_uiPaymentMethod_CIF NVARCHAR(100),
p_uiDenomination_CIF NVARCHAR(100),
p_uiDateOfAdmission_CIF NVARCHAR(100),
p_uiClassification_CIF NVARCHAR(250),
p_uiTypeOfCurrency_CIF NVARCHAR(250),
p_IDCIFType NVARCHAR(50))
BEGIN
UPDATE AAC_CIF SET PaymentMethod_CIF = p_uiPaymentMethod_CIF, 
Denomination_CIF = p_uiDenomination_CIF, DateOfAdmission_CIF = p_uiDateOfAdmission_CIF, 
Classification_CIF = p_uiClassification_CIF, TypeOfCurrency_CIF = p_uiTypeOfCurrency_CIF
WHERE ID_Person = p_uiID_Person;
UPDATE AAC_CIF_CIFType SET ID_CIFType_CIFType = p_IDCIFType WHERE ID_Person = p_uiID_Person;

END;
//

DELIMITER ;




-- Delete CIF
DELIMITER //

CREATE PROCEDURE AAC_DeleteCIF (
p_dlID_Person NVARCHAR(50))
BEGIN
DELETE FROM AAC_CIF WHERE ID_Person = p_dlID_Person;
DELETE FROM AAC_CIF_CIFType WHERE ID_Person = p_dlID_Person;

END;
//

DELIMITER ;




-- Search CIF
DELIMITER //

CREATE PROCEDURE AAC_SearchCIF (
p_searchCIF NVARCHAR (100))
BEGIN
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, 
 aac.aac_cif.PaymentMethod_CIF AS PaymentMethod,
 aac.aac_cif.Denomination_CIF AS Denomination, 
 aac.aac_cif.DateOfAdmission_CIF AS DateOfAdmission,
 aac.aac_cif.Classification_CIF AS Classification,
 aac.aac_cif.TypeOfCurrency_CIF AS TypeOfCurrency
FROM aac.aac_cif 
 INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
 WHERE aac.aac_person.ID_Person LIKE  CONCAT(p_searchCIF,'%') OR 
 aac.aac_person.Name_Person LIKE  CONCAT(p_searchCIF,'%') OR 
 aac.aac_person.Identification_Person LIKE  CONCAT(p_searchCIF,'%') OR  
 aac.aac_cif.Denomination_CIF LIKE  CONCAT(p_searchCIF,'%');

END
//

DELIMITER ;




-- Insert CIF_CIFType
DELIMITER //

CREATE PROCEDURE AAC_InsertCIF_CIFType (
p_iID_CIF_CIFType NVARCHAR (50),
p_iID_Person NVARCHAR(50),/*AAC_CIF*/
p_iID_CIFType_CIFType NVARCHAR(50))
BEGIN
INSERT INTO AAC_CIF_CIFType VALUES (p_iID_CIF_CIFType, p_iID_Person, p_iID_CIFType_CIFType);

END
//

DELIMITER ;




-- Delete CIF_CIFType
DELIMITER //

CREATE PROCEDURE AAC_DeleteCIF_CIFType (
p_ID_CIF_CIFType NVARCHAR (50))
BEGIN
DELETE FROM AAC_CIF_CIFType WHERE ID_CIF_CIFType = p_ID_CIF_CIFType;

END
//

DELIMITER ;




-- List ClassRoom
DELIMITER //

CREATE PROCEDURE AAC_ListClassRoom()
BEGIN
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom;

END
//

DELIMITER ;




-- Insert ClassRoom
DELIMITER //

CREATE PROCEDURE AAC_InsertClassRoom (
p_ID_ClassRom NVARCHAR(50),
p_Description_ClassRoom NVARCHAR(250),
p_Location_ClassRoom NVARCHAR(250),
p_Capacity_ClassRoom INT,
p_State_ClassRoom NVARCHAR(100))
BEGIN
INSERT INTO AAC_ClassRoom VALUES (p_ID_ClassRom, p_Description_ClassRoom,
p_Location_ClassRoom, p_Capacity_ClassRoom, p_State_ClassRoom);

END
//

DELIMITER ;




-- Update ClassRoom
DELIMITER //

CREATE PROCEDURE AAC_UpdateClassRoom (
p_ID_ClassRom NVARCHAR(50),
p_Description_ClassRoom NVARCHAR(250),
p_Location_ClassRoom NVARCHAR(250),
p_Capacity_ClassRoom INT,
p_State_ClassRoom NVARCHAR(100))
BEGIN
UPDATE AAC_ClassRoom SET Description_ClassRoom = p_Description_ClassRoom,
Location_ClassRoom = p_Location_ClassRoom, Capacity_ClassRoom = p_Capacity_ClassRoom, 
State_ClassRoom = p_State_ClassRoom WHERE ID_ClassRom = p_ID_ClassRom;

END
//

DELIMITER ;




-- Search ClassRoom
DELIMITER //

CREATE PROCEDURE AAC_SearchClassRoom (
p_searchCIF NVARCHAR (100))
BEGIN
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(p_searchCIF,'%') OR 
 Description_ClassRoom LIKE  CONCAT(p_searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  CONCAT(p_searchCIF,'%');

END
//

DELIMITER ;




-- Search ClassRoom Enabled
DELIMITER //

CREATE PROCEDURE AAC_SearchClassRoomEnabled (
p_searchCIF NVARCHAR (100))
BEGIN
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(p_searchCIF,'%') OR 
 Description_ClassRoom LIKE  CONCAT(p_searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  CONCAT(p_searchCIF,'%') AND State_ClassRoom = 'Habilitado';

END
//

DELIMITER ;




-- Delete ClassRoom
DELIMITER //

CREATE PROCEDURE AAC_DeleteClassRoom (
p_ID_ClassRom NVARCHAR(50))
BEGIN
DELETE FROM AAC_ClassRoom WHERE ID_ClassRom = p_ID_ClassRom;

END;
//

DELIMITER ;




-- List General Career
DELIMITER //

CREATE PROCEDURE AAC_ListGeneralCareer()
BEGIN
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person;

END;
//

DELIMITER ;




-- List Career CBO
DELIMITER //

CREATE PROCEDURE AAC_ListCareerCBO()
BEGIN
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director, AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE AAC_Career.State_Career = 'Habilitado';

END;
//

DELIMITER ;




-- Insert Career
DELIMITER //

CREATE PROCEDURE AAC_InsertCareer (
p_ID_Career NVARCHAR(50),
p_Description_Career NVARCHAR(250),
p_ID_Person NVARCHAR(50), /*AAC_CIF*/
p_OpeningDate_Career NVARCHAR(100),
p_State_Career NVARCHAR(100))
BEGIN
INSERT INTO AAC_Career VALUES (p_ID_Career, p_Description_Career,
 p_ID_Person, p_OpeningDate_Career, p_State_Career);

END;
//

DELIMITER ;




-- Update Career
DELIMITER //

CREATE PROCEDURE AAC_UpdateCareer (
p_ID_Career NVARCHAR(50),
p_Description_Career NVARCHAR(250),
p_ID_Person NVARCHAR(50), /*AAC_CIF*/
p_State_Career NVARCHAR(100))
BEGIN
UPDATE AAC_Career SET Description_Career = p_Description_Career,
 ID_Person = p_ID_Person, State_Career = p_State_Career WHERE ID_Career = p_ID_Career;

END;
//

DELIMITER ;




-- Delete Career
DELIMITER //

CREATE PROCEDURE AAC_DeleteCareer (
p_DID_Career NVARCHAR(50))
BEGIN
DELETE FROM AAC_Career WHERE ID_Career = p_DID_Career;

END;
//

DELIMITER ;




-- Search Career Enabled
DELIMITER //

CREATE PROCEDURE AAC_SeachCareerEnabled (
p_parameterCareer NVARCHAR (100))
BEGIN
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(p_parameterCareer,'%') OR 
 Description_Career LIKE  CONCAT(p_parameterCareer,'%') OR 
 Name_Person LIKE  CONCAT(p_parameterCareer,'%') AND State_Career = 'Habilitado';

END
//

DELIMITER ;




-- Search Career
DELIMITER //

CREATE PROCEDURE AAC_SeachCareer (
p_parameterCareer NVARCHAR (100))
BEGIN
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(p_parameterCareer,'%') OR 
 Description_Career LIKE  CONCAT(p_parameterCareer,'%') OR 
 Name_Person LIKE  CONCAT(p_parameterCareer,'%');

END
//

DELIMITER ;




-- Insert Level
DELIMITER //

CREATE PROCEDURE AAC_InsertLevel (
p_ID_Level NVARCHAR(50),
p_OpenningDate_Level NVARCHAR(100),
p_AcademicGrade_Level NVARCHAR(250),
p_Description_Level NVARCHAR(250),
p_Enphatic_Level NVARCHAR(250),
p_Credits_Level INT,
p_ID_Career NVARCHAR(50),
p_MinimumNote_Level INT,
p_State_Level NVARCHAR(100))
BEGIN
INSERT INTO AAC_Level VALUES (p_ID_Level, p_OpenningDate_Level, p_AcademicGrade_Level,
p_Description_Level, p_Enphatic_Level, p_Credits_Level, p_ID_Career, p_MinimumNote_Level,
p_State_Level);

END;
//

DELIMITER ;




-- Update Level
DELIMITER //

CREATE PROCEDURE AAC_UpdateLevel (
p_ID_Level NVARCHAR(50),
p_OpenningDate_Level NVARCHAR(100),
p_AcademicGrade_Level NVARCHAR(250),
p_Description_Level NVARCHAR(250),
p_Enphatic_Level NVARCHAR(250),
p_Credits_Level INT,
p_ID_Career NVARCHAR(50),
p_MinimumNote_Level INT,
p_State_Level NVARCHAR(100))
BEGIN
UPDATE AAC_Level SET OpenningDate_Level = p_OpenningDate_Level, 
AcademicGrade_Level = p_AcademicGrade_Level, Description_Level = p_Description_Level, 
Enphatic_Level = p_Enphatic_Level, Credits_Level = p_Credits_Level, ID_Career = p_ID_Career, 
MinimumNote_Level = p_MinimumNote_Level, State_Level = p_State_Level
WHERE ID_Level = p_ID_Level;

END;
//

DELIMITER ;




-- List Level
DELIMITER //

CREATE PROCEDURE AAC_ListLevel()
BEGIN
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person 
 ORDER BY AAC_Level.OpenningDate_Level DESC;

END;
//

DELIMITER ;




-- List Level Enabled
DELIMITER //

CREATE PROCEDURE AAC_ListLevelEnabed()
BEGIN
SELECT AAC_Level.ID_Level AS ID,
AAC_Level.Description_Level AS Description
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
 WHERE AAC_Level.State_Level = 'Habilitado' 
 ORDER BY AAC_Level.OpenningDate_Level DESC; 

END;
//

DELIMITER ;




-- Search Level
DELIMITER //

CREATE PROCEDURE AAC_SeachLevel (
p_parameterLevel NVARCHAR (100))
BEGIN
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(p_parameterLevel,'%') OR 
 AAC_Career.Description_Career LIKE  CONCAT(p_parameterLevel,'%') OR 
 Name_Person LIKE  CONCAT(p_parameterLevel,'%') OR
 AAC_Level.Description_Level LIKE  CONCAT(p_parameterLevel,'%') OR
 AAC_Level.State_Level LIKE  CONCAT(p_parameterLevel,'%') 
 ORDER BY AAC_Level.OpenningDate_Level DESC;

END
//

DELIMITER ;




-- Delete Level
DELIMITER //

CREATE PROCEDURE AAC_DeleteLevel (
p_ID_Level NVARCHAR(50))
BEGIN
DELETE FROM AAC_Level WHERE ID_Level = p_ID_Level;

END;
//

DELIMITER ;




-- List Subject
DELIMITER //

CREATE PROCEDURE AAC_ListSubject()
BEGIN
SELECT AAC_Subject.ID_Subject AS ID, AAC_Level.Description_Level AS Level,  AAC_Subject.Credits_Subject AS Credits, 
AAC_Subject.OpenningDate_Subject AS OpenningDate, AAC_Subject.Description_Subject AS Descríption,
AAC_Subject.Period_Subject AS Period, AAC_Subject.MinimunNote_Subject AS MinimunNote,
AAC_Subject.HoursDuration_Subject AS HoursDuration, AAC_Subject.ExtraordinayMinimunNote_Subject AS ExtraordinayMinimunNote, 
AAC_Subject.MinimunQuote_Subject AS MinimunQuote, AAC_Subject.TypeOfCurrency_Subject AS TypeOfCurrency,
AAC_Subject.Status_Subject AS Status
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
 ORDER BY AAC_Subject.OpenningDate_Subject DESC;

END;
//

DELIMITER ;




-- List Subject Enabled
DELIMITER //

CREATE PROCEDURE AAC_ListSubjectEnabled()
BEGIN
SELECT AAC_Subject.ID_Subject AS ID, AAC_Level.Description_Level AS Level,  AAC_Subject.Credits_Subject AS Credits, 
AAC_Subject.OpenningDate_Subject AS OpenningDate, AAC_Subject.Description_Subject AS Descríption,
AAC_Subject.Period_Subject AS Period, AAC_Subject.MinimunNote_Subject AS MinimunNote,
AAC_Subject.HoursDuration_Subject AS HoursDuration, AAC_Subject.ExtraordinayMinimunNote_Subject AS ExtraordinayMinimunNote, 
AAC_Subject.MinimunQuote_Subject AS MinimunQuote, AAC_Subject.TypeOfCurrency_Subject AS TypeOfCurrency,
AAC_Subject.Status_Subject AS Status
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
 WHERE AAC_Subject.Status_Subject = 'Habilitado' 
 ORDER BY AAC_Subject.OpenningDate_Subject DESC;

END;
//

DELIMITER ;




-- Insert Subject
DELIMITER //

CREATE PROCEDURE AAC_InsertSubject (
p_ID_Subject NVARCHAR(50),
p_OpenningDate_Subject NVARCHAR(100),
p_Status_Subject NVARCHAR(100),
p_Description_Subject NVARCHAR(250),
p_Credits_Subject INT,
p_MinimunNote_Subject INT,
p_MinimunQuote_Subject INT,-- Cupo min
p_TypeOfCurrency_Subject NVARCHAR(150),
p_Period_Subject NVARCHAR(100),
p_ReprobingAbsence_Subject INT,-- Reprob ausencia
p_HoursDuration_Subject INT,
p_ExtraordinayMinimunNote_Subject INT,
p_ApplyScholarshipDiscounts_Subject INT,
p_DegreeTest_Subject INT, -- Prueba grado
p_ProfessionalPractice_Subject INT,
p_AppliesUVirtualRetirement_Subject INT,
p_ID_Level NVARCHAR(50))
BEGIN
INSERT INTO AAC_Subject VALUES (p_ID_Subject, p_OpenningDate_Subject, p_Status_Subject,
p_Description_Subject, p_Credits_Subject, p_MinimunNote_Subject, p_MinimunQuote_Subject, 
p_TypeOfCurrency_Subject, p_Period_Subject, p_ReprobingAbsence_Subject, p_HoursDuration_Subject,
p_ExtraordinayMinimunNote_Subject, p_ApplyScholarshipDiscounts_Subject, p_DegreeTest_Subject,
p_ProfessionalPractice_Subject, p_AppliesUVirtualRetirement_Subject, p_ID_Level);

END;
//

DELIMITER ;




-- Update Subject
DELIMITER //

CREATE PROCEDURE AAC_UpdateSubject (
p_ID_Subject NVARCHAR(50),
p_OpenningDate_Subject NVARCHAR(100),
p_Status_Subject NVARCHAR(100),
p_Description_Subject NVARCHAR(250),
p_Credits_Subject INT,
p_MinimunNote_Subject INT,
p_MinimunQuote_Subject INT,-- Cupo min
p_TypeOfCurrency_Subject NVARCHAR(150),
p_Period_Subject NVARCHAR(100),
p_ReprobingAbsence_Subject INT,-- Reprob ausencia
p_HoursDuration_Subject INT,
p_ExtraordinayMinimunNote_Subject INT,
p_ApplyScholarshipDiscounts_Subject INT,
p_DegreeTest_Subject INT, -- Prueba grado
p_ProfessionalPractice_Subject INT,
p_AppliesUVirtualRetirement_Subject INT,
p_ID_Level NVARCHAR(50))
BEGIN
UPDATE AAC_Subject SET OpenningDate_Subject = p_OpenningDate_Subject, 
Status_Subject = p_Status_Subject, Description_Subject = p_Description_Subject, 
Credits_Subject = p_Credits_Subject, MinimunNote_Subject = p_MinimunNote_Subject, 
MinimunQuote_Subject = p_MinimunQuote_Subject, TypeOfCurrency_Subject = p_TypeOfCurrency_Subject, 
Period_Subject = p_Period_Subject, ReprobingAbsence_Subject = p_ReprobingAbsence_Subject, 
HoursDuration_Subject = p_HoursDuration_Subject, ExtraordinayMinimunNote_Subject = p_ExtraordinayMinimunNote_Subject, 
ApplyScholarshipDiscounts_Subject = p_ApplyScholarshipDiscounts_Subject, DegreeTest_Subject = p_DegreeTest_Subject,
ProfessionalPractice_Subject = p_ProfessionalPractice_Subject, 
AppliesUVirtualRetirement_Subject = p_AppliesUVirtualRetirement_Subject, ID_Level = p_ID_Level
WHERE ID_Subject = p_ID_Subject;

END;
//

DELIMITER ;




-- Delete Subject
DELIMITER //

CREATE PROCEDURE AAC_DeleteSubject (
p_ID_Subject NVARCHAR(50))
BEGIN
DELETE FROM AAC_Subject WHERE ID_Subject = p_ID_Subject;

END;
//

DELIMITER ;




-- Search Subject
DELIMITER //

CREATE PROCEDURE AAC_SeachSubject (
p_parameterSubject NVARCHAR (100))
BEGIN
SELECT AAC_Subject.ID_Subject AS ID, AAC_Level.Description_Level AS Level,  AAC_Subject.Credits_Subject AS Credits, 
AAC_Subject.OpenningDate_Subject AS OpenningDate, AAC_Subject.Description_Subject AS Descríption,
AAC_Subject.Period_Subject AS Period, AAC_Subject.MinimunNote_Subject AS MinimunNote,
AAC_Subject.HoursDuration_Subject AS HoursDuration, AAC_Subject.ExtraordinayMinimunNote_Subject AS ExtraordinayMinimunNote, 
AAC_Subject.MinimunQuote_Subject AS MinimunQuote, AAC_Subject.TypeOfCurrency_Subject AS TypeOfCurrency,
AAC_Subject.Status_Subject AS Status
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
WHERE 
 AAC_Subject.ID_Subject LIKE  CONCAT(p_parameterSubject,'%') OR 
 AAC_Level.Description_Level LIKE  CONCAT(p_parameterSubject,'%')
  ORDER BY AAC_Subject.OpenningDate_Subject DESC;

END
//

DELIMITER ;




-- GetLevelCredits
DELIMITER //

CREATE PROCEDURE AAC_GetLevelCredits (
p_parameterCredits NVARCHAR (100))
BEGIN
SELECT AAC_Level.Credits_Level AS Credits
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(p_parameterCredits,'%');

END
//

DELIMITER ;




-- GetSubjectCredits
DELIMITER //

CREATE PROCEDURE AAC_GetSubjectCredits (
p_parameterCredits NVARCHAR (100))
BEGIN
SELECT COUNT (AAC_Subject.Credits_Subject) AS CreditsSubject 
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 WHERE AAC_Level.ID_Level LIKE  CONCAT(p_parameterCredits,'%');

END
//

DELIMITER ;




-- List CIF_CIFType
DELIMITER //

CREATE PROCEDURE AAC_ListCIF_CIFType (
p_searchC NVARCHAR(100))
BEGIN
SELECT ID_CIF_CIFType AS IDCIF_CIFType,
AAC_CIFType.Description_CIFType AS CIFType
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_Person.ID_Person = p_searchC;

END;
//

DELIMITER ;




-- ESTADISTICA
 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_UAD()
 BEGIN
 (SELECT COUNT(AAC_Person.ID_Person) AS UAD FROM AAC_Person);
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_CIF()
 BEGIN
 (SELECT COUNT(AAC_Person.ID_Person) AS CIF 
 FROM AAC_CIF INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person);
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_Coordinator()
 BEGIN
 (SELECT COUNT(AAC_CIF_CIFType.ID_CIF_CIFType) AS Coordinator FROM AAC_CIF_CIFType
 WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC');
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_Career()
 BEGIN
 (SELECT COUNT(AAC_Career.ID_Career) AS Career FROM AAC_Career);
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_Level()
 BEGIN
 (SELECT COUNT(AAC_Level.ID_Level) AS Level FROM AAC_Level);
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_DashboardData_Subject()
 BEGIN
(SELECT COUNT(AAC_Subject.ID_Subject) AS Subject FROM AAC_Subject);
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_ListCountry()
 BEGIN
SELECT aac_settings.aac_country.ID_Country AS ID, aac_settings.aac_country.Description_Country AS Description 
FROM aac_settings.aac_country;
 
END;
 //

DELIMITER ;



 
 DELIMITER //

 CREATE PROCEDURE AAC_InsertCountry (
p_ID_Country NVARCHAR(50),
p_Description_Country NVARCHAR(250))
 BEGIN
INSERT INTO aac_settings.aac_country VALUES (p_ID_Country, p_Description_Country);
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_UpdateCountry (
p_ID_Country NVARCHAR(50),
p_Description_Country NVARCHAR(250))
 BEGIN
UPDATE aac_settings.aac_country SET aac_settings.aac_country.Description_Country = p_Description_Country 
WHERE aac_settings.aac_country.ID_Country = p_ID_Country;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_DeleteCountry (
p_ID_Country NVARCHAR(50))
 BEGIN
DELETE FROM aac_settings.aac_country WHERE aac_settings.aac_country.ID_Country = p_ID_Country;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_ListProvince (
p_ID_Country NVARCHAR(50))
BEGIN
SELECT aac_settings.aac_province.ID_Province AS ID, aac_settings.aac_province.Description_Province AS Description FROM aac_settings.aac_province
WHERE aac_settings.aac_province.ID_Country = p_ID_Country;

END;
//

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_InsertProvince (
p_ID_Province NVARCHAR(50),
p_Description_Province NVARCHAR(250),
p_ID_Country NVARCHAR(50))
 BEGIN
INSERT INTO aac_settings.aac_province VALUES (p_ID_Province, p_Description_Province, p_ID_Country);
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_UpdateProvince (
p_ID_Province NVARCHAR(50),
p_Description_Province NVARCHAR(250),
p_ID_Country NVARCHAR(50))
 BEGIN
UPDATE aac_settings.aac_province SET aac_settings.aac_province.Description_Province = p_Description_Province, 
aac_settings.aac_province.ID_Country= p_ID_Country WHERE aac_settings.aac_province.ID_Province = p_ID_Province;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_DeleteProvince (
p_ID_Province NVARCHAR(50))
 BEGIN
DELETE FROM aac_settings.aac_province WHERE aac_settings.aac_province.ID_Province = p_ID_Province;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_SearchProvince (
p_ID_Country NVARCHAR(50),
p_parameterProvince NVARCHAR (100))
 BEGIN
 SELECT aac_settings.aac_province.ID_Province AS ID, aac_settings.aac_province.Description_Province AS Description 
 FROM aac_settings.aac_province
WHERE aac_settings.aac_province.ID_Country = p_ID_Country AND
aac_settings.aac_province.ID_Province LIKE  CONCAT(p_parameterProvince,'%') OR 
 aac_settings.aac_province.Description_Province LIKE  CONCAT(p_parameterProvince,'%')
  ORDER BY aac_settings.aac_province.ID_Province DESC;
 
END
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_ListDistrict (
p_ID_Province NVARCHAR(50))
BEGIN
SELECT aac_settings.aac_district.ID_District AS ID, aac_settings.aac_district.Description_District AS Description 
FROM aac_settings.aac_district
WHERE aac_settings.aac_district.ID_Province = p_ID_Province;

END;
//

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_InsertDistrict (
p_ID_District NVARCHAR(50),
p_Description_District NVARCHAR(250),
p_ID_Province NVARCHAR(50))
 BEGIN
INSERT INTO aac_settings.aac_district VALUES (p_ID_District, p_Description_District, p_ID_Province);
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_UpdateDistrict (
p_ID_District NVARCHAR(50),
p_Description_District NVARCHAR(250),
p_ID_Province NVARCHAR(50))
 BEGIN
UPDATE aac_settings.aac_district SET
aac_settings.aac_district.Description_District = p_Description_District, 
aac_settings.aac_district.ID_Province = p_ID_Province
WHERE aac_settings.aac_district.ID_District = p_ID_District;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_DeleteDistrict (
p_ID_District NVARCHAR(50))
 BEGIN
DELETE FROM aac_settings.aac_district WHERE aac_settings.aac_district.ID_District = p_ID_District;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_SearchDistrict (
p_ID_Province NVARCHAR(50),
p_parameterDistrict NVARCHAR (100))
BEGIN
SELECT aac_settings.aac_district.ID_District AS ID, aac_settings.aac_district.Description_District AS Description 
FROM aac_settings.aac_district
WHERE aac_settings.aac_district.ID_Province = p_ID_Province AND
aac_settings.aac_district.ID_District LIKE  CONCAT(p_parameterDistrict,'%') OR 
 aac_settings.aac_district.Description_District LIKE  CONCAT(p_parameterDistrict,'%')
  ORDER BY aac_settings.aac_district.ID_District DESC;
 
END
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_ListCanton (
p_ID_District NVARCHAR(50))
BEGIN
SELECT aac_settings.aac_canton.ID_Canton AS ID, aac_settings.aac_canton.Description_Canton AS Description 
FROM aac_settings.aac_canton
WHERE aac_settings.aac_canton.ID_District = p_ID_District;

END;
//

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_InsertCanton (
p_ID_Canton NVARCHAR(50),
p_Description_Canton NVARCHAR(250),
p_ID_District NVARCHAR(50))
 BEGIN
INSERT INTO aac_settings.aac_canton VALUES (p_ID_Canton, p_Description_Canton, p_ID_District);
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_UpdateCanton (
p_ID_Canton NVARCHAR(50),
p_Description_Canton NVARCHAR(250),
p_ID_District NVARCHAR(50))
 BEGIN
UPDATE aac_settings.aac_canton SET aac_settings.aac_canton.Description_Canton = p_Description_Canton,
 aac_settings.aac_canton.ID_District = p_ID_District WHERE aac_settings.aac_canton.ID_Canton = p_ID_Canton;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_DeleteCanton (
p_ID_Canton NVARCHAR(50))
 BEGIN
DELETE FROM aac_settings.aac_canton WHERE aac_settings.aac_canton.ID_Canton = p_ID_Canton;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_SearchCanton (
p_ID_District NVARCHAR(50),
p_parameterCanton NVARCHAR (100))
BEGIN
SELECT aac_settings.aac_canton.ID_Canton AS ID, aac_settings.aac_canton.Description_Canton AS Description 
FROM aac_settings.aac_canton
WHERE aac_settings.aac_canton.ID_District = p_ID_District AND
aac_settings.aac_canton.ID_Canton LIKE  CONCAT(p_parameterCanton,'%') OR 
 aac_settings.aac_canton.Description_Canton LIKE  CONCAT(p_parameterCanton,'%')
  ORDER BY aac_settings.aac_canton.ID_Canton DESC;
 
END
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_Statistics_GenderPerson_UAD()
 BEGIN
 SELECT aac.aac_person.Gender_Person AS Gender, COUNT(aac.aac_person.Gender_Person) AS Quantity
 FROM AAC_Person WHERE aac.aac_person.State_Person = 'Habilitado'
 GROUP BY
 aac.aac_person.Gender_Person;
 
END;
 //

DELIMITER ;




 DELIMITER //

 CREATE PROCEDURE AAC_Statistics_CountryPerson_UAD()
 BEGIN
SELECT aac_settings.aac_country.Description_Country AS Country, COUNT(aac_settings.aac_country.ID_Country) AS Quantity
 FROM aac.aac_person 
 INNER JOIN aac_settings.aac_country ON aac.aac_person.ID_Country = aac_settings.aac_country.ID_Country 
 WHERE aac.aac_person.State_Person = 'Habilitado'
 GROUP BY
aac_settings.aac_country.Description_Country;
 
END;
 //

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_Statistics_ProvincePerson_UAD()
BEGIN
SELECT aac_settings.aac_province.Description_Province AS Province, COUNT(aac_settings.aac_province.ID_Province) AS Quantity
FROM aac.aac_person
INNER JOIN aac_settings.aac_province ON aac.aac_person.ID_Province = aac_settings.aac_province.ID_Province 
WHERE aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac_settings.aac_province.Description_Province;

END;
//

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_Statistics_DistrictPerson_UAD()
BEGIN
SELECT aac_settings.aac_district.Description_District AS District, COUNT(aac_settings.aac_district.ID_District) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac_settings.aac_district ON aac.aac_person.ID_District = aac_settings.aac_district.ID_District
 WHERE aac.aac_person.State_Person = 'Habilitado'
 GROUP BY
aac_settings.aac_district.Description_District;

END;
//

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_Statistics_CantonPerson_UAD()
BEGIN
SELECT aac_settings.aac_canton.Description_Canton AS Canton, COUNT(aac_settings.aac_canton.ID_Canton) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac_settings.aac_canton ON aac.aac_person.ID_Canton = aac_settings.aac_canton.ID_Canton
 WHERE aac.aac_person.State_Person = 'Habilitado'
 GROUP BY
aac_settings.aac_canton.Description_Canton;

END;
//

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_Statistics_CivilStatusPerson_UAD()
BEGIN
SELECT aac.aac_person.CivilStatus_Person AS CivilStatus, COUNT(aac.aac_person.CivilStatus_Person) AS Quantity
 FROM aac.aac_person WHERE aac.aac_person.State_Person = 'Habilitado'
 GROUP BY
aac.aac_person.CivilStatus_Person;

END;
//

DELIMITER ;




DELIMITER //

CREATE PROCEDURE AAC_Statistics_PersonDirector_CIF()
BEGIN
SELECT  aac.aac_person.Name_Person AS Director, COUNT(aac.aac_person.Name_Person) AS Quantity 
FROM aac.aac_cif_ciftype
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC' AND aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac.aac_person.Name_Person;

END;
//

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AAC_Statistics_PaymentMethod_CIF()
BEGIN
SELECT  aac.aac_cif.PaymentMethod_CIF AS PaymentMethod, COUNT(aac.aac_cif.PaymentMethod_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
WHERE aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac.aac_cif.PaymentMethod_CIF;

END;
//

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AAC_Statistics_Classification_CIF()
BEGIN
SELECT  aac.aac_cif.Classification_CIF AS Classification, COUNT(aac.aac_cif.Classification_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
WHERE aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac.aac_cif.Classification_CIF;

END;
//

DELIMITER ;



DELIMITER //
CREATE PROCEDURE AAC_Statistics_Denomination__CIF()
BEGIN
SELECT  aac.aac_cif.Denomination_CIF AS Denomination, COUNT(aac.aac_cif.Denomination_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
WHERE aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac.aac_cif.Denomination_CIF;

END;
//

DELIMITER ;



DELIMITER //
CREATE PROCEDURE AAC_Statistics_TypeOfCurrency__CIF()
BEGIN
SELECT  aac.aac_cif.TypeOfCurrency_CIF AS TypeOfCurrency, COUNT(aac.aac_cif.TypeOfCurrency_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
WHERE aac.aac_person.State_Person = 'Habilitado'
GROUP BY
aac.aac_cif.TypeOfCurrency_CIF;

END;
//

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AAC_ListUser ()
BEGIN
SELECT aac.aac_user.ID_Person AS ID, sha1(aac.aac_user.Password_User) AS Pass, 
aac.aac_person.Email_Person AS Email, aac.aac_person.Name_Person AS NamePerson, 
aac.aac_profile.Name_Profile AS NameProfile, aac.aac_person.State_Person AS StatusPerson
 FROM aac.aac_user 
 INNER JOIN aac.aac_person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN aac.aac_profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile;
END;
//

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AAC_SearchUser (
p_parameterUser NVARCHAR (100))
BEGIN
SELECT aac.aac_user.ID_Person AS ID, sha1(aac.aac_user.Password_User) AS Pass, 
aac.aac_person.Email_Person AS Email, aac.aac_person.Name_Person AS NamePerson, 
aac.aac_profile.Name_Profile AS NameProfile, aac.aac_person.State_Person AS StatusPerson
 FROM aac.aac_user 
 INNER JOIN aac.aac_person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN aac.aac_profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile
 WHERE aac.aac_user.ID_Person LIKE  CONCAT(p_parameterUser,'%');
END;
//

DELIMITER ;

call aac.AAC_SearchUser('c4');






DELIMITER //

CREATE PROCEDURE AAC_UpdateUser (
p_ID_Person NVARCHAR(50),
p_Password_User NVARCHAR(200),
p_ID_Profile NVARCHAR(50))
BEGIN
UPDATE aac.aac_user SET aac.aac_user.Password_User = p_Password_User, aac.aac_user.ID_Profile = p_ID_Profile 
WHERE aac.aac_user.ID_Person =  p_ID_Person;
END;
//

DELIMITER ;



DELIMITER //

CREATE PROCEDURE AAC_DeleteUser (
p_ID_Person NVARCHAR(50))
BEGIN
DELETE FROM aac.aac_user WHERE aac.aac_user.ID_Person =  p_ID_Person;
END;
//

DELIMITER ;




/*Datos*/
INSERT INTO AAC_CIFType VALUES ('A', 'Administrador');
INSERT INTO AAC_CIFType VALUES ('E', 'Estudiante');
INSERT INTO AAC_CIFType VALUES ('PC', 'Profesor_Coordinador');
INSERT INTO AAC_CIFType VALUES ('P', 'Profesor');

CALL AAC_InsertProfile ('PROF_001','Administrador','Habilitado');
