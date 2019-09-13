/*CREAR BASE DE DATOS*/

SELECT name FROM sys.databases;
CREATE DATABASE Application_Academic_Control;
GO
USE Application_Academic_Control;
GO
/*CREAR TABLAS*/

/*Country*/
CREATE TABLE AAC_Country
(
ID_Country NVARCHAR(50) PRIMARY KEY,
Description_Country NVARCHAR(250)
);
GO


/*Province*/
CREATE TABLE AAC_Province
(
ID_Province NVARCHAR(50) PRIMARY KEY,
Description_Province NVARCHAR(250),
ID_Country NVARCHAR(50)
-- Relation --
 CONSTRAINT Relation_to_Country FOREIGN KEY (ID_Country) REFERENCES AAC_Country (ID_Country)
);
GO


/*Province*/
CREATE TABLE AAC_District
(
ID_District NVARCHAR(50) PRIMARY KEY,
Description_District NVARCHAR(250),
ID_Province NVARCHAR(50)
-- Relation --
 CONSTRAINT Relation_to_Province FOREIGN KEY (ID_Province) REFERENCES AAC_Province (ID_Province)
);
GO


/*Canton*/
CREATE TABLE AAC_Canton
(
ID_Canton NVARCHAR(50) PRIMARY KEY,
Description_Canton NVARCHAR(250),
ID_District NVARCHAR(50)
-- Relation --
 CONSTRAINT Relation_to_District FOREIGN KEY (ID_District) REFERENCES AAC_District (ID_District)
);
GO


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
-- Relation --
 CONSTRAINT Relation_to_Country01 FOREIGN KEY (ID_Country) REFERENCES AAC_Country (ID_Country),
 CONSTRAINT Relation_to_Province01 FOREIGN KEY (ID_Province) REFERENCES AAC_Province (ID_Province),
 CONSTRAINT Relation_to_District01 FOREIGN KEY (ID_District) REFERENCES AAC_District (ID_District),
 CONSTRAINT Relation_to_Canton01 FOREIGN KEY (ID_Canton) REFERENCES AAC_Canton (ID_Canton)
);
GO


/*Profile*/
CREATE TABLE AAC_Profile
(
ID_Profile NVARCHAR(50) PRIMARY KEY,
Name_Profile NVARCHAR(100),
State_Profile NVARCHAR(50)
);
GO


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
GO


/*CIFType*/
CREATE TABLE AAC_CIFType
(
ID_CIFType_CIFType NVARCHAR(50) PRIMARY KEY,
Description_CIFType NVARCHAR(100)
);
GO


/*CIF*/
CREATE TABLE AAC_CIF
(
ID_Person NVARCHAR(50) PRIMARY KEY,
PaymentMethod_CIF NVARCHAR(100),
Denomination_CIF NVARCHAR(100),
DateOfAdmission_CIF NVARCHAR(100),
Classification_CIF NVARCHAR(250),
TypeOfCurrency_CIF NVARCHAR(250)
-- Relation --
 CONSTRAINT Relation_to_Person02 FOREIGN KEY (ID_Person) REFERENCES AAC_Person (ID_Person)
);
GO


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
GO


/*ClassRoom*/
CREATE TABLE AAC_ClassRoom
(
ID_ClassRom NVARCHAR(50) PRIMARY KEY,
Description_ClassRoom NVARCHAR(250),
Location_ClassRoom NVARCHAR(250),
Capacity_ClassRoom INT,--DEPENDENCE
State_ClassRoom NVARCHAR(100),
);
GO


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
GO


/*Level*/
CREATE TABLE AAC_Level
(
ID_Level NVARCHAR(50) PRIMARY KEY,
OpenningDate_Level NVARCHAR(100),
AcademicGrade_Level NVARCHAR(250),
Description_Level NVARCHAR(250),
Enphatic_Level NVARCHAR(250),
Credits_Level INT,--DEPENDENCE
ID_Career NVARCHAR(50),
MinimumNote_Level INT,
State_Level NVARCHAR(100),
-- Relation --
 CONSTRAINT Relation_to_Career01 FOREIGN KEY (ID_Career) REFERENCES AAC_Career (ID_Career)
);
--ALTER TABLE [dbo].[AAC_Level] DROP CONSTRAINT [Relation_to_Career]
GO


/*Subject*/
CREATE TABLE AAC_Subject
(
ID_Subject NVARCHAR(50) PRIMARY KEY,
OpenningDate_Subject NVARCHAR(100),
Status_Subject NVARCHAR(100),
Description_Subject NVARCHAR(250),
Credits_Subject INT,
MinimunNote_Subject INT,
MinimunQuote_Subject INT,--Cupo min
TypeOfCurrency_Subject NVARCHAR(150),
Period_Subject NVARCHAR(100),
ReprobingAbsence_Subject INT,--Reprob ausencia
HoursDuration_Subject INT,
ExtraordinayMinimunNote_Subject INT,
ApplyScholarshipDiscounts_Subject INT,
DegreeTest_Subject INT, --Prueba grado
ProfessionalPractice_Subject INT,
AppliesUVirtualRetirement_Subject INT,
ID_Level NVARCHAR(50),
-- Relation --
 CONSTRAINT Relation_to_Level01 FOREIGN KEY (ID_Level) REFERENCES AAC_Level (ID_Level)
);
--ALTER TABLE [dbo].AAC_Subject DROP CONSTRAINT [Relation_to_Level]
GO

/*CREAR PROCEDIMIENTOS ALMACENADOS*/


-- Insert Profile
CREATE PROCEDURE AAC_InsertProfile
@Id_Profile NVARCHAR(50),
@Name_Profile NVARCHAR(100),
@State_Profile NVARCHAR(50)
AS
INSERT INTO AAC_Profile VALUES (@Id_Profile, @Name_Profile, @State_Profile);
GO


-- Insert User
CREATE PROCEDURE AAC_InsertUser
@ID_Person NVARCHAR(50),
@Password_User NVARCHAR(200),
@ID_Profile NVARCHAR(50)
AS
INSERT INTO AAC_User VALUES (@ID_Person, @Password_User, @ID_Profile);
GO


-- Login
CREATE PROCEDURE AAC_Login
@Email_Person NVARCHAR(200),
@Password_User NVARCHAR(200)
AS
SELECT AAC_User.ID_Person AS ID, AAC_User.Password_User AS Pass, 
AAC_Person.Email_Person AS Email, AAC_Person.Name_Person AS NamePerson, AAC_Profile.Name_Profile AS NameProfile
 FROM AAC_User 
 INNER JOIN AAC_Person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN AAC_Profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile 
 WHERE AAC_Person.Email_Person = @Email_Person AND 
 AAC_User.Password_User = @Password_User AND AAC_Person.State_Person = 'Habilitado'
 AND AAC_Profile.State_Profile = 'Habilitado'
GO


--  Insert Person
CREATE PROCEDURE AAC_InsertPerson
@ID_Person NVARCHAR(50),
@Name_Person NVARCHAR(200),
@Surname_Person NVARCHAR(200)/*Primer Apellido*/,
@Lastname_Person NVARCHAR(200),
@IdentificationType_Person NVARCHAR(100),
@Identification_Person NVARCHAR(100),
@Gender_Person NVARCHAR(100),
@Birthday_Person NVARCHAR(100),
@ID_Country NVARCHAR(50),
@ID_Province NVARCHAR(50),
@ID_District NVARCHAR(50),
@ID_Canton NVARCHAR(50),
@CivilStatus_Person NVARCHAR(100),
@CellPhone_Person NVARCHAR(50),
@Email_Person NVARCHAR(200),
@HomeAddress NVARCHAR(250),
@State_Person NVARCHAR(100)
AS
INSERT INTO AAC_Person VALUES (@ID_Person, @Name_Person, @Surname_Person, @Lastname_Person,
@IdentificationType_Person, @Identification_Person,
 @Gender_Person, @Birthday_Person, @ID_Country, @ID_Province, @ID_District, @ID_Canton, 
@CivilStatus_Person, @CellPhone_Person, @Email_Person, 
@HomeAddress, @State_Person);
GO


-- List Person
CREATE PROCEDURE AAC_ListPerson
AS
SELECT ID_Person AS ID, Name_Person AS Name, Surname_Person AS Surname,
Lastname_Person AS Lastname, IdentificationType_Person AS IdentificationType, 
Identification_Person AS Identification, Gender_Person AS Gender,
Birthday_Person AS Birthday,
AAC_Country.Description_Country AS Country, 
AAC_Province.Description_Province AS Province, 
AAC_District.Description_District AS District, 
AAC_Canton.Description_Canton AS Canton,  
CivilStatus_Person AS CivilStatus, 
CellPhone_Person AS CellPhone, Email_Person AS Email,
HomeAddress AS HomeAddress, State_Person AS State 
FROM AAC_Person
INNER JOIN AAC_Country ON AAC_Person.ID_Country = AAC_Country.ID_Country
INNER JOIN AAC_Province ON AAC_Person.ID_Province = AAC_Province.ID_Province
INNER JOIN AAC_District ON AAC_Person.ID_District = AAC_District.ID_District
INNER JOIN AAC_Canton ON AAC_Person.ID_Canton = AAC_Canton.ID_Canton
GO


-- List Person Director
CREATE PROCEDURE AAC_ListPersonDirector
AS
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name 
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC';
GO


-- Update Person
CREATE PROCEDURE AAC_UpdatePerson
@ID_Person NVARCHAR(50),
@Name_Person NVARCHAR(200),
@Surname_Person NVARCHAR(200)/*Primer Apellido*/,
@Lastname_Person NVARCHAR(200),
@IdentificationType_Person NVARCHAR(100),
@Identification_Person NVARCHAR(100),
@Gender_Person NVARCHAR(100),
@Birthday_Person NVARCHAR(100),
@ID_Country NVARCHAR(50),
@ID_Province NVARCHAR(50),
@ID_District NVARCHAR(50),
@ID_Canton NVARCHAR(50),
@CivilStatus_Person NVARCHAR(100),
@CellPhone_Person NVARCHAR(50),
@Email_Person NVARCHAR(200),
@HomeAddress NVARCHAR(250),
@State_Person NVARCHAR(100)
AS
UPDATE AAC_Person SET 
Name_Person = @Name_Person, 
Surname_Person = @Surname_Person, 
Lastname_Person = @Lastname_Person,
IdentificationType_Person = @IdentificationType_Person,
Identification_Person = Identification_Person,
Gender_Person = @Gender_Person, 
Birthday_Person = @Birthday_Person,  
ID_Country = @ID_Country, 
ID_Province = @ID_Province, 
ID_District = @ID_District,
ID_Canton = @ID_Canton, 
CivilStatus_Person = @CivilStatus_Person, 
CellPhone_Person = @CellPhone_Person, 
Email_Person = @Email_Person, 
HomeAddress = @HomeAddress, 
State_Person = @State_Person 
WHERE ID_Person = @ID_Person;
GO


-- Delete Person
CREATE PROCEDURE AAC_DeletePerson
@dID_Person NVARCHAR(50)
AS
DELETE FROM AAC_Person WHERE ID_Person = @dID_Person;
GO


-- Search Person
CREATE PROCEDURE AAC_SearchPerson
@search NVARCHAR (100)
AS
SELECT ID_Person AS ID, Name_Person AS Name, Surname_Person AS Surname,
Lastname_Person AS Lastname, IdentificationType_Person AS IdentificationType, 
Identification_Person AS Identification, Gender_Person AS Gender,
Birthday_Person AS Birthday,
AAC_Country.Description_Country AS Country, 
AAC_Province.Description_Province AS Province, 
AAC_District.Description_District AS District, 
AAC_Canton.Description_Canton AS Canton,  
CivilStatus_Person AS CivilStatus, 
CellPhone_Person AS CellPhone, Email_Person AS Email,
HomeAddress AS HomeAddress, State_Person AS State 
FROM AAC_Person
INNER JOIN AAC_Country ON AAC_Person.ID_Country = AAC_Country.ID_Country
INNER JOIN AAC_Province ON AAC_Person.ID_Province = AAC_Province.ID_Province
INNER JOIN AAC_District ON AAC_Person.ID_District = AAC_District.ID_District
INNER JOIN AAC_Canton ON AAC_Person.ID_Canton = AAC_Canton.ID_Canton
WHERE ID_Person LIKE  CONCAT(@search,'%') OR 
Name_Person LIKE  CONCAT(@search,'%') OR Lastname_Person LIKE  CONCAT(@search,'%') 
OR IdentificationType_Person LIKE  CONCAT(@search,'%') OR  
CellPhone_Person LIKE  CONCAT(@search,'%') OR 
Description_Country LIKE  CONCAT(@search,'%') OR
Description_Province LIKE  CONCAT(@search,'%');
GO


-- Search Person Enabled
CREATE PROCEDURE AAC_SearchPersonEnabled
@searchen NVARCHAR (100)
AS
SELECT ID_Person AS ID, Name_Person AS Name, Surname_Person AS Surname,
Lastname_Person AS Lastname, IdentificationType_Person AS IdentificationType, 
Identification_Person AS Identification, Gender_Person AS Gender,
Birthday_Person AS Birthday,
AAC_Country.Description_Country AS Country, 
AAC_Province.Description_Province AS Province, 
AAC_District.Description_District AS District, 
AAC_Canton.Description_Canton AS Canton,  
CivilStatus_Person AS CivilStatus, 
CellPhone_Person AS CellPhone, Email_Person AS Email,
HomeAddress AS HomeAddress, State_Person AS State 
FROM AAC_Person
INNER JOIN AAC_Country ON AAC_Person.ID_Country = AAC_Country.ID_Country
INNER JOIN AAC_Province ON AAC_Person.ID_Province = AAC_Province.ID_Province
INNER JOIN AAC_District ON AAC_Person.ID_District = AAC_District.ID_District
INNER JOIN AAC_Canton ON AAC_Person.ID_Canton = AAC_Canton.ID_Canton
WHERE ID_Person LIKE  CONCAT(@searchen,'%') OR 
Name_Person LIKE  CONCAT(@searchen,'%') OR Lastname_Person LIKE  CONCAT(@searchen,'%') 
OR IdentificationType_Person LIKE  CONCAT(@searchen,'%') OR  
CellPhone_Person LIKE  CONCAT(@searchen,'%') OR 
Description_Country LIKE  CONCAT(@searchen,'%') OR
Description_Province LIKE  CONCAT(@searchen,'%') AND State_Person = 'Habilitado';
GO


-- Select CIF
CREATE PROCEDURE AAC_SelectCIF
AS
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name, 
AAC_CIF.PaymentMethod_CIF AS PaymentMethod,
AAC_CIF.Denomination_CIF AS Denomination, AAC_CIF.DateOfAdmission_CIF AS DateOfAdmission,
AAC_CIF.Classification_CIF AS Classification,
AAC_CIF.TypeOfCurrency_CIF AS TypeOfCurrency
FROM AAC_CIF 
INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person
GO


-- List CIFType
CREATE PROCEDURE AAC_ListCIFType
AS
SELECT AAC_CIFType.ID_CIFType_CIFType AS 
IDCIFType, AAC_CIFType.Description_CIFType AS Description
FROM AAC_CIFType
GO


 -- Insert CIF
CREATE PROCEDURE AAC_InsertCIF
@ID_Person NVARCHAR(50),
@PaymentMethod_CIF NVARCHAR(100),
@Denomination_CIF NVARCHAR(100),
@DateOfAdmission_CIF NVARCHAR(100),
@Classification_CIF NVARCHAR(250),
@TypeOfCurrency_CIF NVARCHAR(250),
@IDCIFType NVARCHAR(50),
@IDCIF_CIFType NVARCHAR(50)
AS
INSERT INTO AAC_CIF VALUES (@ID_Person, @PaymentMethod_CIF, @Denomination_CIF, 
@DateOfAdmission_CIF, @Classification_CIF, @TypeOfCurrency_CIF);
INSERT INTO AAC_CIF_CIFType VALUES (@IDCIF_CIFType,@ID_Person,@IDCIFType);
GO


-- Update CIF
CREATE PROCEDURE AAC_UpdateCIF
@uiID_Person NVARCHAR(50),
@uiPaymentMethod_CIF NVARCHAR(100),
@uiDenomination_CIF NVARCHAR(100),
@uiDateOfAdmission_CIF NVARCHAR(100),
@uiClassification_CIF NVARCHAR(250),
@uiTypeOfCurrency_CIF NVARCHAR(250),
@IDCIFType NVARCHAR(50)
AS
UPDATE AAC_CIF SET PaymentMethod_CIF = @uiPaymentMethod_CIF, 
Denomination_CIF = @uiDenomination_CIF, DateOfAdmission_CIF = @uiDateOfAdmission_CIF, 
Classification_CIF = @uiClassification_CIF, TypeOfCurrency_CIF = @uiTypeOfCurrency_CIF
WHERE ID_Person = @uiID_Person;
UPDATE AAC_CIF_CIFType SET ID_CIFType_CIFType = @IDCIFType WHERE ID_Person = @uiID_Person;
GO


--Delete CIF
CREATE PROCEDURE AAC_DeleteCIF
@dlID_Person NVARCHAR(50)
AS
DELETE FROM AAC_CIF WHERE ID_Person = @dlID_Person;
DELETE FROM AAC_CIF_CIFType WHERE ID_Person = @dlID_Person;
GO


-- Search CIF
CREATE PROCEDURE AAC_SearchCIF
@searchCIF NVARCHAR (100)
AS
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name, 
 AAC_CIF.PaymentMethod_CIF AS PaymentMethod,
 AAC_CIF.Denomination_CIF AS Denomination, AAC_CIF.DateOfAdmission_CIF AS DateOfAdmission,
 AAC_CIF.Classification_CIF AS Classification,
 AAC_CIF.TypeOfCurrency_CIF AS TypeOfCurrency
FROM AAC_CIF 
 INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person
 WHERE AAC_CIF.ID_Person LIKE  CONCAT(@searchCIF,'%') OR 
 AAC_Person.Name_Person LIKE  CONCAT(@searchCIF,'%') OR 
 AAC_CIF.Denomination_CIF LIKE  CONCAT(@searchCIF,'%')
GO


-- Insert CIF_CIFType
CREATE PROCEDURE AAC_InsertCIF_CIFType
@iID_CIF_CIFType NVARCHAR (50),
@iID_Person NVARCHAR(50),/*AAC_CIF*/
@iID_CIFType_CIFType NVARCHAR(50)
AS
INSERT INTO AAC_CIF_CIFType VALUES (@iID_CIF_CIFType, @iID_Person, @iID_CIFType_CIFType);
GO


-- Delete CIF_CIFType
CREATE PROCEDURE AAC_DeleteCIF_CIFType
@ID_CIF_CIFType NVARCHAR (50)
AS
DELETE FROM AAC_CIF_CIFType WHERE ID_CIF_CIFType = @ID_CIF_CIFType;
GO


-- List ClassRoom
CREATE PROCEDURE AAC_ListClassRoom
AS
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom;
GO


-- Insert ClassRoom
CREATE PROCEDURE AAC_InsertClassRoom
@ID_ClassRom NVARCHAR(50),
@Description_ClassRoom NVARCHAR(250),
@Location_ClassRoom NVARCHAR(250),
@Capacity_ClassRoom INT,
@State_ClassRoom NVARCHAR(100)
AS
INSERT INTO AAC_ClassRoom VALUES (@ID_ClassRom, @Description_ClassRoom,
@Location_ClassRoom, @Capacity_ClassRoom, @State_ClassRoom);
GO


-- Update ClassRoom
CREATE PROCEDURE AAC_UpdateClassRoom
@ID_ClassRom NVARCHAR(50),
@Description_ClassRoom NVARCHAR(250),
@Location_ClassRoom NVARCHAR(250),
@Capacity_ClassRoom INT,
@State_ClassRoom NVARCHAR(100)
AS
UPDATE AAC_ClassRoom SET Description_ClassRoom = @Description_ClassRoom,
Location_ClassRoom = @Location_ClassRoom, Capacity_ClassRoom = @Capacity_ClassRoom, 
State_ClassRoom = @State_ClassRoom WHERE ID_ClassRom = @ID_ClassRom;
GO


-- Search ClassRoom
CREATE PROCEDURE AAC_SearchClassRoom
@searchCIF NVARCHAR (100)
AS
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(@searchCIF,'%') OR 
 Description_ClassRoom LIKE  CONCAT(@searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  CONCAT(@searchCIF,'%');
GO


-- Search ClassRoom Enabled
CREATE PROCEDURE AAC_SearchClassRoomEnabled
@searchCIF NVARCHAR (100)
AS
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(@searchCIF,'%') OR 
 Description_ClassRoom LIKE  CONCAT(@searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  CONCAT(@searchCIF,'%') AND State_ClassRoom = 'Habilitado';
GO


-- Delete ClassRoom
CREATE PROCEDURE AAC_DeleteClassRoom
@ID_ClassRom NVARCHAR(50)
AS
DELETE FROM AAC_ClassRoom WHERE ID_ClassRom = @ID_ClassRom;
GO


-- List General Career
CREATE PROCEDURE AAC_ListGeneralCareer
AS
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person;
GO


-- List Career
CREATE PROCEDURE AAC_ListCareer
AS
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director, AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE AAC_Career.State_Career = 'Habilitado';
GO


-- Insert Career
CREATE PROCEDURE AAC_InsertCareer
@ID_Career NVARCHAR(50),
@Description_Career NVARCHAR(250),
@ID_Person NVARCHAR(50), /*AAC_CIF*/
@OpeningDate_Career NVARCHAR(100),
@State_Career NVARCHAR(100)
AS
INSERT INTO AAC_Career VALUES (@ID_Career, @Description_Career,
 @ID_Person, @OpeningDate_Career, @State_Career);
GO


-- Update Career
CREATE PROCEDURE AAC_UpdateCareer
@ID_Career NVARCHAR(50),
@Description_Career NVARCHAR(250),
@ID_Person NVARCHAR(50), /*AAC_CIF*/
@State_Career NVARCHAR(100)
AS
UPDATE AAC_Career SET Description_Career = @Description_Career,
 ID_Person = @ID_Person, State_Career = @State_Career WHERE ID_Career = @ID_Career;
GO


-- Delete Career
CREATE PROCEDURE AAC_DeleteCareer
@DID_Career NVARCHAR(50)
AS
DELETE FROM AAC_Career WHERE ID_Career = @DID_Career;
GO


-- Search Career Enabled
CREATE PROCEDURE AAC_SeachCareerEnabled
@parameterCareer NVARCHAR (100)
AS
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(@parameterCareer,'%') OR 
 Description_Career LIKE  CONCAT(@parameterCareer,'%') OR 
 Name_Person LIKE  CONCAT(@parameterCareer,'%') AND State_Career = 'Habilitado';
GO


-- Search Career
CREATE PROCEDURE AAC_SeachCareer
@parameterCareer NVARCHAR (100)
AS
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(@parameterCareer,'%') OR 
 Description_Career LIKE  CONCAT(@parameterCareer,'%') OR 
 Name_Person LIKE  CONCAT(@parameterCareer,'%');
GO


-- Insert Level
CREATE PROCEDURE AAC_InsertLevel
@ID_Level NVARCHAR(50),
@OpenningDate_Level NVARCHAR(100),
@AcademicGrade_Level NVARCHAR(250),
@Description_Level NVARCHAR(250),
@Enphatic_Level NVARCHAR(250),
@Credits_Level INT,
@ID_Career NVARCHAR(50),
@MinimumNote_Level INT,
@State_Level NVARCHAR(100)
AS
INSERT INTO AAC_Level VALUES (@ID_Level, @OpenningDate_Level, @AcademicGrade_Level,
@Description_Level, @Enphatic_Level, @Credits_Level, @ID_Career, @MinimumNote_Level,
@State_Level);
GO


-- Update Level
CREATE PROCEDURE AAC_UpdateLevel
@ID_Level NVARCHAR(50),
@OpenningDate_Level NVARCHAR(100),
@AcademicGrade_Level NVARCHAR(250),
@Description_Level NVARCHAR(250),
@Enphatic_Level NVARCHAR(250),
@Credits_Level INT,
@ID_Career NVARCHAR(50),
@MinimumNote_Level INT,
@State_Level NVARCHAR(100)
AS
UPDATE AAC_Level SET OpenningDate_Level = @OpenningDate_Level, 
AcademicGrade_Level = @AcademicGrade_Level, Description_Level = @Description_Level, 
Enphatic_Level = @Enphatic_Level, Credits_Level = @Credits_Level, ID_Career = @ID_Career, 
MinimumNote_Level = @MinimumNote_Level, State_Level = @State_Level
WHERE ID_Level = @ID_Level;
GO


-- List Level
CREATE PROCEDURE AAC_ListLevel
AS
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person 
 ORDER BY AAC_Level.OpenningDate_Level DESC
GO


-- List Level Enabled
CREATE PROCEDURE AAC_ListLevelEnabed
AS
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
 WHERE AAC_Level.State_Level = 'Habilitado' 
 ORDER BY AAC_Level.OpenningDate_Level DESC 
GO


-- Search Level
CREATE PROCEDURE AAC_SeachLevel
@parameterLevel NVARCHAR (100)
AS
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(@parameterLevel,'%') OR 
 AAC_Career.Description_Career LIKE  CONCAT(@parameterLevel,'%') OR 
 Name_Person LIKE  CONCAT(@parameterLevel,'%') OR
 AAC_Level.Description_Level LIKE  CONCAT(@parameterLevel,'%') OR
 AAC_Level.State_Level LIKE  CONCAT(@parameterLevel,'%') 
 ORDER BY AAC_Level.OpenningDate_Level DESC
GO


-- Delete Level
CREATE PROCEDURE AAC_DeleteLevel
@ID_Level NVARCHAR(50)
AS
DELETE FROM AAC_Level WHERE ID_Level = @ID_Level;
GO


-- List Subject
CREATE PROCEDURE AAC_ListSubject
AS
SELECT AAC_Subject.ID_Subject AS ID, AAC_Level.Description_Level AS Level,  AAC_Subject.Credits_Subject AS Credits, 
AAC_Subject.OpenningDate_Subject AS OpenningDate, AAC_Subject.Description_Subject AS Descríption,
AAC_Subject.Period_Subject AS Period, AAC_Subject.MinimunNote_Subject AS MinimunNote,
AAC_Subject.HoursDuration_Subject AS HoursDuration, AAC_Subject.ExtraordinayMinimunNote_Subject AS ExtraordinayMinimunNote, 
AAC_Subject.MinimunQuote_Subject AS MinimunQuote, AAC_Subject.TypeOfCurrency_Subject AS TypeOfCurrency,
AAC_Subject.Status_Subject AS Status
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
 ORDER BY AAC_Subject.OpenningDate_Subject DESC
GO


-- List Subject Enabled
CREATE PROCEDURE AAC_ListSubjectEnabled
AS
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
 ORDER BY AAC_Subject.OpenningDate_Subject DESC
GO


-- Insert Subject
CREATE PROCEDURE AAC_InsertSubject
@ID_Subject NVARCHAR(50),
@OpenningDate_Subject NVARCHAR(100),
@Status_Subject NVARCHAR(100),
@Description_Subject NVARCHAR(250),
@Credits_Subject INT,
@MinimunNote_Subject INT,
@MinimunQuote_Subject INT,--Cupo min
@TypeOfCurrency_Subject NVARCHAR(150),
@Period_Subject NVARCHAR(100),
@ReprobingAbsence_Subject INT,--Reprob ausencia
@HoursDuration_Subject INT,
@ExtraordinayMinimunNote_Subject INT,
@ApplyScholarshipDiscounts_Subject INT,
@DegreeTest_Subject INT, --Prueba grado
@ProfessionalPractice_Subject INT,
@AppliesUVirtualRetirement_Subject INT,
@ID_Level NVARCHAR(50)
AS
INSERT INTO AAC_Subject VALUES (@ID_Subject, @OpenningDate_Subject, @Status_Subject,
@Description_Subject, @Credits_Subject, @MinimunNote_Subject, @MinimunQuote_Subject, 
@TypeOfCurrency_Subject, @Period_Subject, @ReprobingAbsence_Subject, @HoursDuration_Subject,
@ExtraordinayMinimunNote_Subject, @ApplyScholarshipDiscounts_Subject, @DegreeTest_Subject,
@ProfessionalPractice_Subject, @AppliesUVirtualRetirement_Subject, @ID_Level);
GO


-- Update Subject
CREATE PROCEDURE AAC_UpdateSubject
@ID_Subject NVARCHAR(50),
@OpenningDate_Subject NVARCHAR(100),
@Status_Subject NVARCHAR(100),
@Description_Subject NVARCHAR(250),
@Credits_Subject INT,
@MinimunNote_Subject INT,
@MinimunQuote_Subject INT,--Cupo min
@TypeOfCurrency_Subject NVARCHAR(150),
@Period_Subject NVARCHAR(100),
@ReprobingAbsence_Subject INT,--Reprob ausencia
@HoursDuration_Subject INT,
@ExtraordinayMinimunNote_Subject INT,
@ApplyScholarshipDiscounts_Subject INT,
@DegreeTest_Subject INT, --Prueba grado
@ProfessionalPractice_Subject INT,
@AppliesUVirtualRetirement_Subject INT,
@ID_Level NVARCHAR(50)
AS
UPDATE AAC_Subject SET OpenningDate_Subject = @OpenningDate_Subject, 
Status_Subject = @Status_Subject, Description_Subject = @Description_Subject, 
Credits_Subject = @Credits_Subject, MinimunNote_Subject = @MinimunNote_Subject, 
MinimunQuote_Subject = @MinimunQuote_Subject, TypeOfCurrency_Subject = @TypeOfCurrency_Subject, 
Period_Subject = @Period_Subject, ReprobingAbsence_Subject = @ReprobingAbsence_Subject, 
HoursDuration_Subject = @HoursDuration_Subject, ExtraordinayMinimunNote_Subject = @ExtraordinayMinimunNote_Subject, 
ApplyScholarshipDiscounts_Subject = @ApplyScholarshipDiscounts_Subject, DegreeTest_Subject = @DegreeTest_Subject,
ProfessionalPractice_Subject = @ProfessionalPractice_Subject, 
AppliesUVirtualRetirement_Subject = @AppliesUVirtualRetirement_Subject, ID_Level = @ID_Level
WHERE ID_Subject = @ID_Subject;
GO


-- Delete Subject
CREATE PROCEDURE AAC_DeleteSubject
@ID_Subject NVARCHAR(50)
AS
DELETE FROM AAC_Subject WHERE ID_Subject = @ID_Subject;
GO


-- Search Subject
CREATE PROCEDURE AAC_SeachSubject
@parameterSubject NVARCHAR (100)
AS
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
 AAC_Subject.ID_Subject LIKE  CONCAT(@parameterSubject,'%') OR 
 AAC_Level.Description_Level LIKE  CONCAT(@parameterSubject,'%')
  ORDER BY AAC_Subject.OpenningDate_Subject DESC
GO


-- GetLevelCredits
CREATE PROCEDURE AAC_GetLevelCredits
@parameterCredits NVARCHAR (100)
AS
SELECT AAC_Level.Credits_Level AS Credits
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(@parameterCredits,'%') 
GO


-- GetSubjectCredits
CREATE PROCEDURE AAC_GetSubjectCredits
@parameterCredits NVARCHAR (100)
AS
SELECT COUNT (AAC_Subject.Credits_Subject) AS CreditsSubject 
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 WHERE AAC_Level.ID_Level LIKE  CONCAT(@parameterCredits,'%') 
GO


-- List CIF_CIFType
CREATE PROCEDURE AAC_ListCIF_CIFType
@searchC NVARCHAR(100)
AS
SELECT ID_CIF_CIFType AS IDCIF_CIFType,
AAC_CIFType.Description_CIFType AS CIFType
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_Person.ID_Person = @searchC;
GO


-- ESTADISTICA
 CREATE PROCEDURE AAC_DashboardData_UAD
 AS
 (SELECT COUNT(AAC_Person.ID_Person) AS UAD FROM AAC_Person)
 GO


 CREATE PROCEDURE AAC_DashboardData_CIF
 AS
 (SELECT COUNT(AAC_Person.ID_Person) AS CIF 
 FROM AAC_CIF INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person)
 GO


 CREATE PROCEDURE AAC_DashboardData_Coordinator
 AS
 (SELECT COUNT(AAC_CIF_CIFType.ID_CIF_CIFType) AS Coordinator FROM AAC_CIF_CIFType
 WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC')
 GO


 CREATE PROCEDURE AAC_DashboardData_Career
 AS
 (SELECT COUNT(AAC_Career.ID_Career) AS Career FROM AAC_Career)
 GO


 CREATE PROCEDURE AAC_DashboardData_Level
 AS
 (SELECT COUNT(AAC_Level.ID_Level) AS Level FROM AAC_Level)
 GO


 CREATE PROCEDURE AAC_DashboardData_Subject
 AS
(SELECT COUNT(AAC_Subject.ID_Subject) AS Subject FROM AAC_Subject)
 GO


 CREATE PROCEDURE AAC_ListCountry
 AS
SELECT ID_Country AS ID, Description_Country AS Description FROM AAC_Country;
 GO

 
 CREATE PROCEDURE AAC_InsertCountry
@ID_Country NVARCHAR(50),
@Description_Country NVARCHAR(250)
 AS
INSERT INTO AAC_Country VALUES (@ID_Country, @Description_Country);
 GO


CREATE PROCEDURE AAC_UpdateCountry
@ID_Country NVARCHAR(50),
@Description_Country NVARCHAR(250)
 AS
UPDATE AAC_Country SET Description_Country = @Description_Country 
WHERE ID_Country = @ID_Country;
 GO


CREATE PROCEDURE AAC_DeleteCountry
@ID_Country NVARCHAR(50)
 AS
DELETE AAC_Country WHERE ID_Country = @ID_Country;
 GO


CREATE PROCEDURE AAC_ListProvince
@ID_Country NVARCHAR(50)
AS
SELECT ID_Province AS ID, Description_Province AS Description FROM AAC_Province
WHERE ID_Country = @ID_Country;
GO


 CREATE PROCEDURE AAC_InsertProvince
@ID_Province NVARCHAR(50),
@Description_Province NVARCHAR(250),
@ID_Country NVARCHAR(50)
 AS
INSERT INTO AAC_Province VALUES (@ID_Province, @Description_Province, @ID_Country);
 GO


CREATE PROCEDURE AAC_UpdateProvince
@ID_Province NVARCHAR(50),
@Description_Province NVARCHAR(250),
@ID_Country NVARCHAR(50)
 AS
UPDATE AAC_Province SET Description_Province = @Description_Province, 
ID_Country= @ID_Country WHERE ID_Province = @ID_Province;
 GO


CREATE PROCEDURE AAC_DeleteProvince
@ID_Province NVARCHAR(50)
 AS
DELETE FROM AAC_Province WHERE ID_Province = @ID_Province;
 GO


CREATE PROCEDURE AAC_SearchProvince
@ID_Country NVARCHAR(50),
@parameterProvince NVARCHAR (100)
 AS
 SELECT ID_Province AS ID, Description_Province AS Description FROM AAC_Province
WHERE ID_Country = @ID_Country AND
AAC_Province.ID_Province LIKE  CONCAT(@parameterProvince,'%') OR 
 AAC_Province.Description_Province LIKE  CONCAT(@parameterProvince,'%')
  ORDER BY AAC_Province.ID_Province DESC
 GO


CREATE PROCEDURE AAC_ListDistrict
@ID_Province NVARCHAR(50)
AS
SELECT ID_District AS ID, Description_District AS Description FROM AAC_District
WHERE ID_Province = @ID_Province;
GO


 CREATE PROCEDURE AAC_InsertDistrict
@ID_District NVARCHAR(50),
@Description_District NVARCHAR(250),
@ID_Province NVARCHAR(50)
 AS
INSERT INTO AAC_District VALUES (@ID_District, @Description_District, @ID_Province);
 GO


CREATE PROCEDURE AAC_UpdateDistrict
@ID_District NVARCHAR(50),
@Description_District NVARCHAR(250),
@ID_Province NVARCHAR(50)
 AS
UPDATE AAC_District SET
Description_District = @Description_District, ID_Province = @ID_Province
WHERE ID_District = @ID_District;
 GO


CREATE PROCEDURE AAC_DeleteDistrict
@ID_District NVARCHAR(50)
 AS
DELETE FROM AAC_District WHERE ID_District = @ID_District;
 GO


CREATE PROCEDURE AAC_SearchDistrict
@ID_Province NVARCHAR(50),
@parameterDistrict NVARCHAR (100)
AS
SELECT ID_District AS ID, Description_District AS Description FROM AAC_District
WHERE ID_Province = @ID_Province AND
AAC_District.ID_District LIKE  CONCAT(@parameterDistrict,'%') OR 
 AAC_District.Description_District LIKE  CONCAT(@parameterDistrict,'%')
  ORDER BY AAC_District.ID_District DESC
 GO


CREATE PROCEDURE AAC_ListCanton
@ID_District NVARCHAR(50)
AS
SELECT ID_Canton AS ID, Description_Canton AS Description FROM AAC_Canton
WHERE ID_District = @ID_District;
GO


 CREATE PROCEDURE AAC_InsertCanton
@ID_Canton NVARCHAR(50),
@Description_Canton NVARCHAR(250),
@ID_District NVARCHAR(50)
 AS
INSERT INTO AAC_Canton VALUES (@ID_Canton, @Description_Canton, @ID_District);
 GO


CREATE PROCEDURE AAC_UpdateCanton
@ID_Canton NVARCHAR(50),
@Description_Canton NVARCHAR(250),
@ID_District NVARCHAR(50)
 AS
UPDATE AAC_Canton SET Description_Canton = @Description_Canton,
 ID_District = @ID_District WHERE ID_Canton = @ID_Canton;
 GO


CREATE PROCEDURE AAC_DeleteCanton
@ID_Canton NVARCHAR(50)
 AS
DELETE FROM AAC_Canton WHERE ID_Canton = @ID_Canton;
 GO


CREATE PROCEDURE AAC_SearchCanton
@ID_District NVARCHAR(50),
@parameterCanton NVARCHAR (100)
AS
SELECT ID_Canton AS ID, Description_Canton AS Description FROM AAC_Canton
WHERE ID_District = @ID_District AND
AAC_Canton.ID_Canton LIKE  CONCAT(@parameterCanton,'%') OR 
 AAC_Canton.Description_Canton LIKE  CONCAT(@parameterCanton,'%')
  ORDER BY AAC_Canton.ID_Canton DESC
 GO


 CREATE PROCEDURE AAC_Statisitcs_GenderPerson_UAD
 AS
 SELECT AAC_Person.Gender_Person AS Gender, COUNT(AAC_Person.Gender_Person) AS Quantity
 FROM AAC_Person
 GROUP BY
 AAC_Person.Gender_Person
 GO


 CREATE PROCEDURE AAC_Statisitcs_CountryPerson_UAD
 AS
SELECT AAC_Country.Description_Country AS Country, COUNT(AAC_Country.ID_Country) AS Quantity
 FROM AAC_Person
 INNER JOIN AAC_Country ON AAC_Person.ID_Country = AAC_Country.ID_Country
 GROUP BY
AAC_Country.Description_Country
 GO


CREATE PROCEDURE AAC_Statisitcs_ProvincePerson_UAD
AS
SELECT AAC_Province.Description_Province AS Province, COUNT(AAC_Province.ID_Province) AS Quantity
FROM AAC_Person
INNER JOIN AAC_Province ON AAC_Person.ID_Province = AAC_Province.ID_Province
GROUP BY
AAC_Province.Description_Province
GO


CREATE PROCEDURE AAC_Statisitcs_DistrictPerson_UAD
AS
SELECT AAC_District.Description_District AS District, COUNT(AAC_District.ID_District) AS Quantity
 FROM AAC_Person
 INNER JOIN AAC_District ON AAC_Person.ID_District = AAC_District.ID_District
 GROUP BY
AAC_District.Description_District
GO


CREATE PROCEDURE AAC_Statisitcs_CantonPerson_UAD
AS
SELECT AAC_Canton.Description_Canton AS Canton, COUNT(AAC_Canton.ID_Canton) AS Quantity
 FROM AAC_Person
 INNER JOIN AAC_Canton ON AAC_Person.ID_Canton = AAC_Canton.ID_Canton
 GROUP BY
AAC_Canton.Description_Canton
GO


CREATE PROCEDURE AAC_Statisitcs_CivilStatusPerson_UAD
AS
SELECT AAC_Person.CivilStatus_Person AS CivilStatus, COUNT(AAC_Person.CivilStatus_Person) AS Quantity
 FROM AAC_Person
 GROUP BY
AAC_Person.CivilStatus_Person
GO



INSERT INTO AAC_CIFType VALUES ('A', 'Administrador');
INSERT INTO AAC_CIFType VALUES ('E', 'Estudiante');
INSERT INTO AAC_CIFType VALUES ('PC', 'Profesor_Coordinador');
INSERT INTO AAC_CIFType VALUES ('P', 'Profesor');


EXECUTE AAC_InsertProfile 'PROF_001','Administrador','Habilitado'


-- Country -- Nicaragua
INSERT INTO AAC_Country VALUES ('COUNTR_001','Nicaragua');

-- Country -- United Stades
INSERT INTO AAC_Country VALUES ('COUNTR_002','United Stades');

-- Country -- Mexico
INSERT INTO AAC_Country VALUES ('COUNTR_003','Mexico');

-- Country -- Belize
INSERT INTO AAC_Country VALUES ('COUNTR_004','Belize');

-- Country -- Guatemala
INSERT INTO AAC_Country VALUES ('COUNTR_005','Guatemala');

-- Country -- El Salvador
INSERT INTO AAC_Country VALUES ('COUNTR_006','El Salvador');
							/*PROVINCIAS*/
-- Provinces El Salvador
INSERT INTO AAC_Province VALUES ('PROVIN_00000001','Ahuachapan','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000002','Sonsonate','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000003','Santa Ana','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000004','Chalatenango','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000005','La Libertad','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000006','San Salvador','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000007','Cuscatlán','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000008','La Paz','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000009','Cabañas','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000010','San Vicente','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000011','San Miguel','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000012','Usulután','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000013','Morazán','COUNTR_006');
INSERT INTO AAC_Province VALUES ('PROVIN_00000014','La Unión','COUNTR_006');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - AHUACHAPAN*/
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000001','Ahuachapan','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000001','El Anonal','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000002','Ashapuco','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000003','Cuyanausul','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000004','Chancuyo','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000005','Chipilapa','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000006','El Barrio Los Ausoles','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000007','El Junquillo','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000008','El Roble','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000009','El Tigre','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000010','Guayaltepec','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000011','La Coyotera','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000012','La Danta','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000013','La Montañita','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000014','Las Chinamas','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000015','Loma de la Gloria','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000016','Los Huatales','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000017','Los Magueyes','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000018','Los Toles','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000019','Llano de Doña María','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000020','Llano de la Laguna','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000021','Nejapa','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000022','Palo Pique','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000023','Río Frío','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000024','San Lázaro','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000025','San Ramón','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000026','Santa Cruz','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000027','Santa Rosa Acacalco','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000028','Suntecumat','PROVIN_00000001');
INSERT INTO AAC_Canton VALUES ('CANTON_00000029','Tacubita','PROVIN_00000001');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000002','Apaneca','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000030','El Zaltillal','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000031','Palo Verde','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000032','Quezalapa','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000033','San Ramoncito','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000034','Taltapanca','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000035','Tisapa','DISTR_00000002');
INSERT INTO AAC_Canton VALUES ('CANTON_00000036','Tulapa','DISTR_00000002');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000003','Atiquizaya','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000037','El Chayal','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000038','Izcanquillo','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000039','Joya del Platanar','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000040','Joya del Zapote','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000041','La Esperanza','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000042','Loma de Alarcón','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000043','Pepenance','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000044','Rincón Grande','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000045','Salitrero','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000046','San Juan El Espino','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000047','Santa Rita','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000048','Tapacún','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000049','Tortuguero','DISTR_00000003');
INSERT INTO AAC_Canton VALUES ('CANTON_00000050','Zunca','DISTR_00000003');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000004','Concepción de Ataco','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000051','El Arco','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000052','El Limón','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000053','El Molino','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000054','El Naranjito','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000055','El Tronconal','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000056','La Ceiba','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000057','La Joya de los Apantes','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000058','Los Tablones','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000059','San José','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000060','Shucutitán','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000061','Texucín ','DISTR_00000004');
INSERT INTO AAC_Canton VALUES ('CANTON_00000062','Chirizo','DISTR_00000004');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000005','El Refugio','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000063','Comapa','DISTR_00000005');
INSERT INTO AAC_Canton VALUES ('CANTON_00000064','El Rosario','DISTR_00000005');
INSERT INTO AAC_Canton VALUES ('CANTON_00000065','San Antonio','DISTR_00000005');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000006','Guaymango','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000066','Cauta Abajo','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000067','Cauta Arriba','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000068','El Carmen','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000069','El Escalón','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000070','El Rosario','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000071','El Zarzal','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000072','Iztagapán','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000073','La Esperanza','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000074','La Paz','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000075','Los Platanares','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000076','Los Puentecitos','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000077','Morro Grande','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000078','San Andrés','DISTR_00000006');
INSERT INTO AAC_Canton VALUES ('CANTON_00000079','San Martín','DISTR_00000006');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000007','Jujutla','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000080','Barra de Santiago','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000081','El Diamante','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000082','Faya','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000083','Guayapa Abajo','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000084','Guayapa Arriba','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000085','Las Mesas','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000086','Los Amates','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000087','Rosario Arriba','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000088','Rosario Abajo','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000089','San Antonio','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000090','San José El Naranjo','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000091','Tihuicha','DISTR_00000007');
INSERT INTO AAC_Canton VALUES ('CANTON_00000092','Zapúa','DISTR_00000007');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000008','San Francisco Menéndez','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000093','Cara Sucia','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000094','Ceiba','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000095','El Coroso','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000096','El Jocotillo','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000097','El Sacramento','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000098','El Zapote','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000099','Garita Palmera','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000100','La Hachadura','DISTR_00000008');
INSERT INTO AAC_Canton VALUES ('CANTON_00000101','San Benito','DISTR_00000008');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000009','San Lorenzo','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000102','El Conacaste','DISTR_00000009');
INSERT INTO AAC_Canton VALUES ('CANTON_00000103','El Jicaral','DISTR_00000009');
INSERT INTO AAC_Canton VALUES ('CANTON_00000104','El Portillo','DISTR_00000009');
INSERT INTO AAC_Canton VALUES ('CANTON_00000105','La Guascota','DISTR_00000009');
INSERT INTO AAC_Canton VALUES ('CANTON_00000106','Las Posas','DISTR_00000009');
INSERT INTO AAC_Canton VALUES ('CANTON_00000107','San Juan Buenavista','DISTR_00000009');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000010','San Pedro Puxtla','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000108','El Cortez','DISTR_00000010');
INSERT INTO AAC_Canton VALUES ('CANTON_00000109','El Durazno','DISTR_00000010');
INSERT INTO AAC_Canton VALUES ('CANTON_00000110','Guachipilín','DISTR_00000010');
INSERT INTO AAC_Canton VALUES ('CANTON_00000111','La Concepción','DISTR_00000010');
INSERT INTO AAC_Canton VALUES ('CANTON_00000112','Pululapa','DISTR_00000010');
INSERT INTO AAC_Canton VALUES ('CANTON_00000113','Texispulco','DISTR_00000010');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000011','Tacuba','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_0000114','Agua Fría','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_0000115','El Chaguito','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000116','El Jícaro','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000117','El Níspero','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000118','El Rodeo','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000119','El Rosario','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000120','El Sincuyo','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000121','La Montaña','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000122','La Pandeadura','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000123','La Puerta','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000124','Loma Larga','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000125','Monte Hermoso','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000126','San Juan','DISTR_00000011');
INSERT INTO AAC_Canton VALUES ('CANTON_00000127','San Rafael','DISTR_00000011');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000012','Turín','PROVIN_00000001');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000128','El Jobo','DISTR_00000012');
INSERT INTO AAC_Canton VALUES ('CANTON_00000129','El Paraíso','DISTR_00000012');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - SONSONATE*/
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000013','Sonsonate','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000130','Chiquihuat','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000131','El Cacao','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000132','El Edén','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000133','El Presidio','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000134','La Ensenada','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000135','Las Delicias','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000136','Las Salinas de Ayacachapa','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000137','Las Tablas','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000138','Loma del Muerto','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000139','Miravalles','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000140','Santa Emilia','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000141','Tasulá','DISTR_00000013');
INSERT INTO AAC_Canton VALUES ('CANTON_00000142','Tonalá','DISTR_00000013');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000014','Acajutla','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000143','El Coyol','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000144','El Salamo','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000145','El Suncita','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000146','Punta Remedios','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000147','Metalío','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000148','Morro Grande','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000149','San Julián','DISTR_00000014');
INSERT INTO AAC_Canton VALUES ('CANTON_00000150','Valle Nuevo','DISTR_00000014');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000015','Armenia','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000151','Azacualpa','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000152','El Cerro','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000153','El Guayabo','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000154','El Rosario','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000155','La Puerta','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000156','Las Crucitas','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000157','Las Tres Ceibas','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000158','Los Mangos','DISTR_00000015');
INSERT INTO AAC_Canton VALUES ('CANTON_00000159','Valle Nuevo','DISTR_00000015');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000016','Caluco','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000160','Agua Caliente','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000161','Cerro Alto','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000162','El Castaño','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000163','El Zapote','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000164','Cerro de Las Flores','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000165','Los Gramales','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000166','Plan de Amaya','DISTR_00000016');
INSERT INTO AAC_Canton VALUES ('CANTON_00000167','Suquiat','DISTR_00000016');

-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000017','Cuisnahuat','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000168','Shuca','DISTR_00000017');
INSERT INTO AAC_Canton VALUES ('CANTON_00000169','Apancoyo','DISTR_00000017');
INSERT INTO AAC_Canton VALUES ('CANTON_00000170','Coquiama','DISTR_00000017');
INSERT INTO AAC_Canton VALUES ('CANTON_00000171','El Balsamar','DISTR_00000017');
INSERT INTO AAC_Canton VALUES ('CANTON_00000172','San Lucas','DISTR_00000017');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000018','Izalco','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000173','Cangrejera','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000174','Ceiba del Charco','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000175','Cruz Grande','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000176','Cuntan','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000177','Cuyagualo','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000178','Chorro Abajo','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000179','Chorro Arriba','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000180','El Sunza','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000181','Huiscolyolate','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000182','Joya de Cerén','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000183','La Chapina','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000184','Las Higueras','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000185','Las Lajas','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000186','Las Marías','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000187','Piedras Pachas','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000188','Quebrada Española','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000189','San Isidro','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000190','San Luis','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000191','Shon Shon','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000192','Talcomunca','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000193','Tapaishucut','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000194','Tecuma','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000195','Teshcal','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000196','Tres Ceibas','DISTR_00000018');
INSERT INTO AAC_Canton VALUES ('CANTON_00000197','Tunalmiles','DISTR_00000018');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000019','Juayúa','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000198','Buenos Aires','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000199','La Fuente','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000200','La Unión','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000201','Los Apantes','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000202','Los Cañales','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000203','Los Naranjos','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000204','Ojo de Agua','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000205','San José La Majada','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000206','San Juan de Dios','DISTR_00000019');
INSERT INTO AAC_Canton VALUES ('CANTON_00000207','Valle Nuevo','DISTR_00000019');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000020','Nahulingo','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000208','Alemán','DISTR_00000020');
INSERT INTO AAC_Canton VALUES ('CANTON_00000209','Conacaste Herrado','DISTR_00000020');
INSERT INTO AAC_Canton VALUES ('CANTON_00000210','El Guayabo','DISTR_00000020');
INSERT INTO AAC_Canton VALUES ('CANTON_00000211','Piedra de Moler','DISTR_00000020');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000021','Nahuizalco','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000212','Anal Abajo','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000213','Anal Arriba','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000214','Cusamaluco','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000215','El Arenal','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000216','El Carrizal','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000217','El Canelo','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000218','El Cerrito','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000219','El Chaparrón','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000220','La Guacamaya','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000221','La Pushtán','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000222','Sabana Grande','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000223','Sabana San Juan Abajo','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000224','Sabana San Juan Arriba','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000225','Sisimetepet','DISTR_00000021');
INSERT INTO AAC_Canton VALUES ('CANTON_00000226','Tajcuilujlan','DISTR_00000021');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000022','Salcoatitán','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000227','Anizales','DISTR_00000022');
INSERT INTO AAC_Canton VALUES ('CANTON_00000228','El Puente','DISTR_00000022');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000023','San Antonio Del Monte','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000229','Agua Santa','DISTR_00000023');
INSERT INTO AAC_Canton VALUES ('CANTON_00000230','Cuyuapa Abajo','DISTR_00000023');
INSERT INTO AAC_Canton VALUES ('CANTON_00000231','Cuyuapa Arriba','DISTR_00000023');
INSERT INTO AAC_Canton VALUES ('CANTON_00000232','El Castaño','DISTR_00000023');
INSERT INTO AAC_Canton VALUES ('CANTON_00000233','Las Hojas','DISTR_00000023');
INSERT INTO AAC_Canton VALUES ('CANTON_00000234','San Ramón','DISTR_00000023');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000024','San Julián','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000235','Agua Shuca','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000236','Chilata','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000237','El Achiotal','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000238','El Bebedero','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000239','El Sauce','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000240','Los Lagartos','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000241','Monserrat','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000242','Palo Verde','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000243','Peña Blanca','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000244','Petacas','DISTR_00000024');
INSERT INTO AAC_Canton VALUES ('CANTON_00000245','Tierra Colorada','DISTR_00000024');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000025','Santa Catarina Masahuat','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000246','Cuyuapa','DISTR_00000025');
INSERT INTO AAC_Canton VALUES ('CANTON_00000247','El Matasano','DISTR_00000025');
INSERT INTO AAC_Canton VALUES ('CANTON_00000248','Las Peñas','DISTR_00000025');
INSERT INTO AAC_Canton VALUES ('CANTON_00000249','San Rafael','DISTR_00000025');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000026','Santa Isabel Ishuatán','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000250','Acachapa','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000251','Apancoyo','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000252','Atiluya','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000253','Corozal','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000254','Las Piedras','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000255','Miramar','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000256','Paraíso','DISTR_00000026');
INSERT INTO AAC_Canton VALUES ('CANTON_00000257','Paso de Canoa','DISTR_00000026');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000027','Santo Domingo De Guzmán','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000258','El Carrizal','DISTR_00000027');
INSERT INTO AAC_Canton VALUES ('CANTON_00000259','El Caulote','DISTR_00000027');
INSERT INTO AAC_Canton VALUES ('CANTON_00000260','El Zarzal','DISTR_00000027');
INSERT INTO AAC_Canton VALUES ('CANTON_00000261','El Zope','DISTR_00000027');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000028','Sonzacate','PROVIN_00000002');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000262','El Almendro','DISTR_00000028');
INSERT INTO AAC_Canton VALUES ('CANTON_00000263','El Mojón','DISTR_00000028');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - SANTA ANA*/
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000029','Santa Ana','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000264','Aldea San Antonio','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000265','Ayuta','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000266','Calzontes Abajo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000267','Calzontes Arriba','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000268','Cantarrana','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000269','Comecayo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000270','Cutunay ','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000271','Camones','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000272','Chupaderos','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000273','El Portezuelo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000274','Flor Amarilla Abajo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000275','Flor Amarilla Arriba','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000276','La Empalizada','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000277','La Montañita','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000278','Las Aradas','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000279','Loma Alta','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000280','Lomas de San Marcelino','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000281','Los Apoyos','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000282','Monte Largo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000283','Nancintepeque','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000284','Natividad','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000285','Ochupse Abajo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000286','Ochupse Arriba','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000287','Palo de Campana','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000288','Pinalito','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000289','Piñalón','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000290','Planes de La Laguna','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000291','Potrerillos de La Laguna','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000292','Potrerillos del Matazano','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000293','Potrero Grande Abajo','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000294','Potrero Grande Arriba','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000295','Primavera','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000296','Ranchador','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000297','San Juan Buenavista','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000298','Tablón del Matazano','DISTR_00000029');
INSERT INTO AAC_Canton VALUES ('CANTON_00000299','Valle del Matazano','DISTR_00000029');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000030','Candelaria De La Frontera','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000300','Casa de Tejas','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000301','El Jute','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000302','El Zacamil','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000303','La Criba','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000304','Los Parada','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000305','Monte Verde','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000306','Piedras Azules','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000307','San Jerónimo','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000308','San José Pinalito','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000309','San Vicente','DISTR_00000030');
INSERT INTO AAC_Canton VALUES ('CANTON_00000310','Tierra Blanca','DISTR_00000030');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000031','Chalchuapa','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000311','Ayutuxtepeque','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000312','Buenos Aires','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000313','El Arado','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000314','El Coco','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000315','El Cuje','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000316','El Duraznillo','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000317','El Paste','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000318','El Tanque','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000319','Galeano','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000320','Guachipilín','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000321','La Libertad','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000322','La Magdalena','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000323','Las Cruces','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000324','Las Flores','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000325','Ojo de Agua','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000326','Piedra Rejada','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000327','Porvenir Jocotillo','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000328','San José','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000329','San Sebastián','DISTR_00000031');
INSERT INTO AAC_Canton VALUES ('CANTON_00000330','El Zacamil','DISTR_00000031');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000032','Coatepeque','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000331','Caña Brava','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000332','Conacastes','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000333','El Cerro','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000334','El Tinteral','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000335','Jocotón','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000336','Junquillo','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000337','La Joya','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000338','Las Piletas','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000339','Palo Negro','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000340','Resbaladero','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000341','Solimán','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000342','Siete Príncipes','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000343','San Felipe','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000344','San Jacinto','DISTR_00000032');
INSERT INTO AAC_Canton VALUES ('CANTON_00000345','Zacatal','DISTR_00000032');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000033','El Congo','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000346','El Guineo','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000347','El Pezote','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000348','El Rodeo','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000349','La Laguna','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000350','La Presa','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000351','Los Pinos','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000352','Monte Bello','DISTR_00000033');
INSERT INTO AAC_Canton VALUES ('CANTON_00000353','San José de Las Flores','DISTR_00000033');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000034','El Porvenir','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000354','El Rosario','DISTR_00000034');
INSERT INTO AAC_Canton VALUES ('CANTON_00000355','San Cristóbal','DISTR_00000034');
INSERT INTO AAC_Canton VALUES ('CANTON_00000356','San Juan Chiquito','DISTR_00000034');
INSERT INTO AAC_Canton VALUES ('CANTON_00000357','Santa Rosa Senca','DISTR_00000034');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000035','Masahuat','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000358','El Carmen','DISTR_00000035');
INSERT INTO AAC_Canton VALUES ('CANTON_00000359','Honduritas','DISTR_00000035');
INSERT INTO AAC_Canton VALUES ('CANTON_00000360','Joya','DISTR_00000035');
INSERT INTO AAC_Canton VALUES ('CANTON_00000361','La Ruda','DISTR_00000035');
INSERT INTO AAC_Canton VALUES ('CANTON_00000362','San Sebastián','DISTR_00000035');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000036','Metapán','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000363','Aldea Zapote','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000364','Belén Guijat','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000365','Camulián','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000366','Cañas Dulces','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000367','Capulín','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000368','Cuyuiscat','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000369','El Brujo','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000370','El Carrizalillo','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000371','El Limón','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000372','El Malpaso','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000373','El Panal','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000374','El Rosario','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000375','El Shiste','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000376','La Ceibita','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000377','La Isla','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000378','La Joya','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000379','Las Pavas','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000380','Las Piedras','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000381','Matalapa','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000382','Montenegro','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000383','San Antonio La Junta','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000384','San Antonio Masahuat','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000385','San Jerónimo','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000386','San José Ingenio','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000387','San Juan','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000388','San Miguel Ingenio','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000389','Santa Rita','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000390','Tahuilapa','DISTR_00000036');
INSERT INTO AAC_Canton VALUES ('CANTON_00000391','Tecomapa','DISTR_00000036');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000037','San Antonio Pajonal','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000392','El Mojón','DISTR_00000037');
INSERT INTO AAC_Canton VALUES ('CANTON_00000393','El Tablón','DISTR_00000037');
INSERT INTO AAC_Canton VALUES ('CANTON_00000394','La Piedrona','DISTR_00000037');
INSERT INTO AAC_Canton VALUES ('CANTON_00000395','Los Ángeles','DISTR_00000037');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000038','San Sebastián Salitrillo','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000396','Los Amates','DISTR_00000038');
INSERT INTO AAC_Canton VALUES ('CANTON_00000397','San Luis','DISTR_00000038');
INSERT INTO AAC_Canton VALUES ('CANTON_00000398','Santa Bárbara','DISTR_00000038');
INSERT INTO AAC_Canton VALUES ('CANTON_00000399','Santa Rosa','DISTR_00000038');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000039','Santa Rosa Guachipilín','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000400','El Despoblado','DISTR_00000039');
INSERT INTO AAC_Canton VALUES ('CANTON_00000401','El Matazano','DISTR_00000039');
INSERT INTO AAC_Canton VALUES ('CANTON_00000402','Llano Las Majadas','DISTR_00000039');
INSERT INTO AAC_Canton VALUES ('CANTON_00000403','Palo Galán','DISTR_00000039');
INSERT INTO AAC_Canton VALUES ('CANTON_00000404','San Francisco Apanta','DISTR_00000039');
INSERT INTO AAC_Canton VALUES ('CANTON_00000405','San José Capulín','DISTR_00000039');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000040','Santiago De La Frontera','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000406','La Flor','DISTR_00000040');
INSERT INTO AAC_Canton VALUES ('CANTON_00000407','Guacamayas','DISTR_00000040');
INSERT INTO AAC_Canton VALUES ('CANTON_00000408','La Danta','DISTR_00000040');
INSERT INTO AAC_Canton VALUES ('CANTON_00000409','Las Piletas','DISTR_00000040');
INSERT INTO AAC_Canton VALUES ('CANTON_00000410','Los Chilamates','DISTR_00000040');
INSERT INTO AAC_Canton VALUES ('CANTON_00000411','Santa Cruz','DISTR_00000040');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000041','Texistepeque','PROVIN_00000003');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000412','Costa Rica','DISTR_00000041');
INSERT INTO AAC_Canton VALUES ('CANTON_00000413','Cujucuyo','DISTR_00000041');
INSERT INTO AAC_Canton VALUES ('CANTON_00000414','Chilcuyo','DISTR_00000041');
INSERT INTO AAC_Canton VALUES ('CANTON_00000415','El Jute','DISTR_00000041');
INSERT INTO AAC_Canton VALUES ('CANTON_00000416','San Miguel','DISTR_00000041');
INSERT INTO AAC_Canton VALUES ('CANTON_00000417','Santo Tomás','DISTR_00000041');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - CHALATENANGO*/
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000042','Chalatenango','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000418','Chiapas','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000419','Hacienda Grande','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000420','Guarjilla','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000421','Las Micas','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000422','San Bartolo','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000423','San José','DISTR_00000042');
INSERT INTO AAC_Canton VALUES ('CANTON_00000424','Upatoro','DISTR_00000042');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000043','Agua Caliente','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000425','Agua Fría','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000426','Agua Zarca','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000427','Cerro Grande','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000428','Encumbrado','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000429','Obrajuelo','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000430','Ojos de Agua','DISTR_00000043');
INSERT INTO AAC_Canton VALUES ('CANTON_00000431','Santa Rosa','DISTR_00000043');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000044','Arcatao','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000432','Cerro Grande','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000433','Eramón','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000434','Gualcimaca','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000435','Las Vegas','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000436','Los Filos','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000437','Los Sitios','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000438','Teosinte','DISTR_00000044');
INSERT INTO AAC_Canton VALUES ('CANTON_00000439','Zazalapa','DISTR_00000044');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000045','Azacualpa','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000440','Cuesta de Marina','DISTR_00000045');
INSERT INTO AAC_Canton VALUES ('CANTON_00000441','El Lano','DISTR_00000045');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000046','Citalá','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000442','Gualcho','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000443','Lagunetas','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000444','Los Planes','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000445','Llano de la Virgen','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000446','San Francisco','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000447','San Lorenzo','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000448','San Ramón','DISTR_00000046');
INSERT INTO AAC_Canton VALUES ('CANTON_00000449','Talquesalar','DISTR_00000046');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000047','Comalapa','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000450','Candelaria','DISTR_00000047');
INSERT INTO AAC_Canton VALUES ('CANTON_00000451','El Morro','DISTR_00000047');
INSERT INTO AAC_Canton VALUES ('CANTON_00000452','Guachipilín','DISTR_00000047');
INSERT INTO AAC_Canton VALUES ('CANTON_00000453','La Junta','DISTR_00000047');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000048','Concepción Quezaltepeque','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000454','El Conacaste','DISTR_00000048');
INSERT INTO AAC_Canton VALUES ('CANTON_00000455','El Jocotillo','DISTR_00000048');
INSERT INTO AAC_Canton VALUES ('CANTON_00000456','El Rosario','DISTR_00000048');
INSERT INTO AAC_Canton VALUES ('CANTON_00000457','Llano Grande','DISTR_00000048');
INSERT INTO AAC_Canton VALUES ('CANTON_00000458','Monte Redondo','DISTR_00000048');
INSERT INTO AAC_Canton VALUES ('CANTON_00000459','Glosingo','DISTR_00000048');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000049','Dulce Nombre de María','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000460','Chorro Blanco','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000461','El Común','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000462','El Ocotal','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000463','El Rosario','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000464','Las Cuevitas','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000465','Los Achíotes','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000466','Los Encuentros','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000467','Los Gutiérrez','DISTR_00000049');
INSERT INTO AAC_Canton VALUES ('CANTON_00000468','Los Sitios','DISTR_00000049');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000050','Carrizal','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000469','La Trinidad','DISTR_00000050');
INSERT INTO AAC_Canton VALUES ('CANTON_00000470','Petapa','DISTR_00000050');
INSERT INTO AAC_Canton VALUES ('CANTON_00000471','Potrerillos','DISTR_00000050');
INSERT INTO AAC_Canton VALUES ('CANTON_00000472','Vainillas','DISTR_00000050');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000051','El Paraíso','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000473','El Tablón','DISTR_00000051');
INSERT INTO AAC_Canton VALUES ('CANTON_00000474','Santa Bárbara','DISTR_00000051');
INSERT INTO AAC_Canton VALUES ('CANTON_00000475','valle Nuevo','DISTR_00000051');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000052','La Laguna','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000476','Las Pacayas','DISTR_00000052');
INSERT INTO AAC_Canton VALUES ('CANTON_00000477','Los Prados','DISTR_00000052');
INSERT INTO AAC_Canton VALUES ('CANTON_00000478','Plan Verde','DISTR_00000052');
INSERT INTO AAC_Canton VALUES ('CANTON_00000479','San José','DISTR_00000052');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000053','La Palma','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000480','El Aguacatal','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000481','El Gramal','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000482','La Calera','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000483','La Granadilla','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000484','Los Horcones','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000485','Los Planes','DISTR_00000053');
INSERT INTO AAC_Canton VALUES ('CANTON_00000486','San José Sacare','DISTR_00000053');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000054','La Reina','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000487','El Pepeto','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000488','El Tigre','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000489','Las Peñas','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000490','San José El Carao','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000491','Talchaluya','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000492','Tecomates','DISTR_00000054');
INSERT INTO AAC_Canton VALUES ('CANTON_00000493','Tilapa','DISTR_00000054');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000055','Las Vueltas','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000494','El Conacaste','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000495','El Sicahuite','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000496','La Ceiba','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000497','La Laguna','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000498','Las Vueltas','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000499','Los Naranjos','DISTR_00000055');
INSERT INTO AAC_Canton VALUES ('CANTON_00000500','San José','DISTR_00000055');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000056','Nombre de Jesús','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000501','Escalante','DISTR_00000056');
INSERT INTO AAC_Canton VALUES ('CANTON_00000502','Los Heríquez','DISTR_00000056');
INSERT INTO AAC_Canton VALUES ('CANTON_00000503','Patamera','DISTR_00000056');
INSERT INTO AAC_Canton VALUES ('CANTON_00000504','Plazuelas','DISTR_00000056');
INSERT INTO AAC_Canton VALUES ('CANTON_00000505','Potrarillos','DISTR_00000056');
INSERT INTO AAC_Canton VALUES ('CANTON_00000506','Quipure','DISTR_00000056');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000057','Nueva Concepción','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000507','El Gavilán','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000508','El Zapote','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000509','Laguna Seca','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000510','Las Tablas','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000511','Los chilamates','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000512','Potenciana','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000513','Potero Sula','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000514','Santa Rita Cimarrón','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000515','Santa Rosa','DISTR_00000057');
INSERT INTO AAC_Canton VALUES ('CANTON_00000516','Sunapa','DISTR_00000057');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000058','Nueva Trinidad','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000517','Carasque','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000518','El Sitio','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000519','Hacienda Vieja','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000520','Huizúcar','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000521','Jaguatalla','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000522','Manaquil','DISTR_00000058');
INSERT INTO AAC_Canton VALUES ('CANTON_00000523','El Zacamil','DISTR_00000058');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000059','Ojos de Agua','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000524','El Coyolar','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000525','El Sitio','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000526','El Portillo','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000527','El Tablón','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000528','El Zapotal','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000529','La Montañita','DISTR_00000059');
INSERT INTO AAC_Canton VALUES ('CANTON_00000530','Yurique','DISTR_00000059');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000060','Potonico','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000531','Corral Falso','DISTR_00000060');
INSERT INTO AAC_Canton VALUES ('CANTON_00000532','La Montaña','DISTR_00000060');
INSERT INTO AAC_Canton VALUES ('CANTON_00000533','Monte Redondo','DISTR_00000060');
INSERT INTO AAC_Canton VALUES ('CANTON_00000534','Santa Teresa','DISTR_00000060');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000061','San Antonio de La Cruz','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000535','Copalío','DISTR_00000061');
INSERT INTO AAC_Canton VALUES ('CANTON_00000536','San Benito','DISTR_00000061');
INSERT INTO AAC_Canton VALUES ('CANTON_00000537','Santa Ana','DISTR_00000061');
INSERT INTO AAC_Canton VALUES ('CANTON_00000538','Zapote','DISTR_00000061');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000062','San Antonio Los Ranchos','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000539','El Gramal ','DISTR_00000062');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000063','San Fernando','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000540','Jocotán','DISTR_00000063');
INSERT INTO AAC_Canton VALUES ('CANTON_00000541','Los Llanitos','DISTR_00000063');
INSERT INTO AAC_Canton VALUES ('CANTON_00000542','Nuevo san Fernando','DISTR_00000063');
INSERT INTO AAC_Canton VALUES ('CANTON_00000543','San Juan de la Cruz','DISTR_00000063');
INSERT INTO AAC_Canton VALUES ('CANTON_00000544','Valle de Jesús','DISTR_00000063');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000064','San Francisco Lempa','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000545','Los Menjívar','DISTR_00000064');
INSERT INTO AAC_Canton VALUES ('CANTON_00000546','Los Zepeda','DISTR_00000064');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000065','San Francisco Morazán','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000547','El Higueral','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000548','Las Cañitas','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000549','Las Parvitas','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000550','Los Naranjos','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000551','Plan del Horno','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000552','San Miguelito','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000553','Sumpul de Chacones','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000554','Teosinte','DISTR_00000065');
INSERT INTO AAC_Canton VALUES ('CANTON_00000555','El Tremedal','DISTR_00000065');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000066','San Ignacio','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000556','El Carmen','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000557','El Centro','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000558','El Pinar','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000559','El Rosario','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000560','Las Pilas','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000561','Santa Rosa','DISTR_00000066');
INSERT INTO AAC_Canton VALUES ('CANTON_00000562','Río chiquito','DISTR_00000066');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000067','San Isidro Labrador','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000563','El Mojón','DISTR_00000067');
INSERT INTO AAC_Canton VALUES ('CANTON_00000564','La Montaña','DISTR_00000067');
INSERT INTO AAC_Canton VALUES ('CANTON_00000565','Alvarenga','DISTR_00000067');
INSERT INTO AAC_Canton VALUES ('CANTON_00000566','Los Amates','DISTR_00000067');
INSERT INTO AAC_Canton VALUES ('CANTON_00000567','El Sicahuital','DISTR_00000067');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000068','San José Cancasque','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000568','Candelaria','DISTR_00000068');
INSERT INTO AAC_Canton VALUES ('CANTON_00000569','La Concepción','DISTR_00000068');
INSERT INTO AAC_Canton VALUES ('CANTON_00000570','Los Guillenes','DISTR_00000068');
INSERT INTO AAC_Canton VALUES ('CANTON_00000571','Portillo del Norte','DISTR_00000068');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000069','San José Las Flores','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000572','Aldea Vieja','DISTR_00000069');
INSERT INTO AAC_Canton VALUES ('CANTON_00000573','Hacienda','DISTR_00000069');
INSERT INTO AAC_Canton VALUES ('CANTON_00000574','Hacienda vieja','DISTR_00000069');
INSERT INTO AAC_Canton VALUES ('CANTON_00000575','Lagunita','DISTR_00000069');
INSERT INTO AAC_Canton VALUES ('CANTON_00000576','Las Limas','DISTR_00000069');
INSERT INTO AAC_Canton VALUES ('CANTON_00000577','Llano Verde','DISTR_00000069');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000070','San Luis del Carmen','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000578','El Pital','DISTR_00000070');
INSERT INTO AAC_Canton VALUES ('CANTON_00000579','El Sitio','DISTR_00000070');
INSERT INTO AAC_Canton VALUES ('CANTON_00000580','Los Naranjos','DISTR_00000070');
INSERT INTO AAC_Canton VALUES ('CANTON_00000581','Santa Cruz','DISTR_00000070');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000071','San Miguel de Mercedes','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000582','El Cerro de la Cruz','DISTR_00000071');
INSERT INTO AAC_Canton VALUES ('CANTON_00000583','El Salitre','DISTR_00000071');
INSERT INTO AAC_Canton VALUES ('CANTON_00000584','El Matasano','DISTR_00000071');
INSERT INTO AAC_Canton VALUES ('CANTON_00000585','Los Guardados','DISTR_00000071');
INSERT INTO AAC_Canton VALUES ('CANTON_00000586','Piedras Gordas','DISTR_00000071');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000072','San Rafael','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000587','Los Desamparados','DISTR_00000072');
INSERT INTO AAC_Canton VALUES ('CANTON_00000588','Ojos de Agua','DISTR_00000072');
INSERT INTO AAC_Canton VALUES ('CANTON_00000589','San Antonio Buenavista','DISTR_00000072');
INSERT INTO AAC_Canton VALUES ('CANTON_00000590','San José los Sitios','DISTR_00000072');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000073','Santa Rita','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000591','Barillas','DISTR_00000073');
INSERT INTO AAC_Canton VALUES ('CANTON_00000592','Chiilamate','DISTR_00000073');
INSERT INTO AAC_Canton VALUES ('CANTON_00000593','San Nicolás Piedras Gordas','DISTR_00000073');
INSERT INTO AAC_Canton VALUES ('CANTON_00000594','Tobías','DISTR_00000073');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000074','Tejutla','PROVIN_00000004');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000595','Aguaje Escondido','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000596','Aldeíta','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000597','Aposentos','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000598','Concepción','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000599','Estanzuelas','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000600','El Carrizal','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000601','El Cerrón','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000602','El Salitre','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000603','El Tránsito','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000604','Izotal','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000605','Los Martínez','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000606','Quitasol','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000607','Río Grande de Alvarado','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000608','Río Grande de Cardoza','DISTR_00000074');
INSERT INTO AAC_Canton VALUES ('CANTON_00000609','San José','DISTR_00000074');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - LA LIBERTAD */
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000075','Santa Tecla','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000610','Ayagualo','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000611','Buena Vista','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000612','El Limón','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000613','El Matazano','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000614','El Progreso','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000615','Quequeisque','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000616','El Triunfo','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000617','El Sacazil','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000618','Las Granadillas','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000619','Loma Larga','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000620','Los Amates','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000621','Los Pajales','DISTR_00000075');
INSERT INTO AAC_Canton VALUES ('CANTON_00000622','Victoria','DISTR_00000075');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000076','Antiguo Cuscatlán','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000623','El Espino','DISTR_00000076');
INSERT INTO AAC_Canton VALUES ('CANTON_00000624','La Ceiba','DISTR_00000076');
INSERT INTO AAC_Canton VALUES ('CANTON_00000625','La Labranza','DISTR_00000076');
INSERT INTO AAC_Canton VALUES ('CANTON_00000626','La Puerta de la Laguna','DISTR_00000076');
INSERT INTO AAC_Canton VALUES ('CANTON_00000627','Santa Elena','DISTR_00000076');
INSERT INTO AAC_Canton VALUES ('CANTON_00000628','Soledad','DISTR_00000076');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000077','Chiltiupán','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000629','Cuervo Abajo','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000630','Cuervo Arriba','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000631','El Tecolote','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000632','El Zonte','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000633','Julupe','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000634','Las Flores','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000635','Las Termópilas','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000636','El Regadío','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000637','Santa Lucía','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000638','Siberia','DISTR_00000077');
INSERT INTO AAC_Canton VALUES ('CANTON_00000639','Taquillo','DISTR_00000077');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000078','Ciudad Arce','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000640','El conacaste','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000641','La Esperanza','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000642','La Joyita','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000643','La Reforma','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000644','Los Acosta','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000645','Las Cruces','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000646','Las Lomas','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000647','San Andrés','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000648','Santa Lucía','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000649','Santa Rosa','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000650','Veracruz','DISTR_00000078');
INSERT INTO AAC_Canton VALUES ('CANTON_00000651','Zapotitán','DISTR_00000078');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000079','Colón','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000651','Cuyagualo','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000652','Entre Ríos','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000653','El Botoncillal','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000654','El Capulín','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000655','El Cobanal','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000657','El Limón','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000658','El Manguito','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000659','Hacienda Nueva','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000660','Las Angosturas','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000661','Las Brisas','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000662','Las Moras','DISTR_00000079');
INSERT INTO AAC_Canton VALUES ('CANTON_00000663','Lourdes','DISTR_00000079');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000080','Comasagua','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000664','El Conacaste','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000665','El Faro','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000666','El Matazano','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000667','El Penón','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000668','El Rosario','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000669','La Shila','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000670','San Antonio','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000671','San Francisco El Potrerón','DISTR_00000080');
INSERT INTO AAC_Canton VALUES ('CANTON_00000672','San José El Porvenir','DISTR_00000080');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000081','Huizúcar','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000673','Analquito','DISTR_00000081');
INSERT INTO AAC_Canton VALUES ('CANTON_00000674','La Lima','DISTR_00000081');
INSERT INTO AAC_Canton VALUES ('CANTON_00000675','Nazareth','DISTR_00000081');
INSERT INTO AAC_Canton VALUES ('CANTON_00000676','Ojos de Agua','DISTR_00000081');
INSERT INTO AAC_Canton VALUES ('CANTON_00000677','San Juan Buenavista','DISTR_00000081');
INSERT INTO AAC_Canton VALUES ('CANTON_00000678','Tilapa','DISTR_00000081');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000082','Jayaque','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000679','La Cumbre','DISTR_00000082');
INSERT INTO AAC_Canton VALUES ('CANTON_00000680','La Labor','DISTR_00000082');
INSERT INTO AAC_Canton VALUES ('CANTON_00000681','Las Flores','DISTR_00000082');
INSERT INTO AAC_Canton VALUES ('CANTON_00000682','Minas','DISTR_00000082');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000083','Jicalapa','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000683','La Argentina','DISTR_00000083');
INSERT INTO AAC_Canton VALUES ('CANTON_00000684','La Perla','DISTR_00000083');
INSERT INTO AAC_Canton VALUES ('CANTON_00000685','San José El Tablón','DISTR_00000083');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000084','Nuevo Cuscatlán','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000686','Nuevo Cuscatlán','DISTR_00000084');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000085','Puerto de la Libertad','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000687','Cangrejera','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000688','El Cimarrón','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000689','El Maja','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000690','Melara','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000691','San Alfredo','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000692','San Diego','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000693','Santa Cruz','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000694','San Rafael','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000695','Tepuagua','DISTR_00000085');
INSERT INTO AAC_Canton VALUES ('CANTON_00000696','Toluca','DISTR_00000085');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000086','Quezaltepeque','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000697','El Puente','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000698','El Señor','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000699','Girón','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000700','Las Mercedes','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000701','Macance','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000702','Platanillos','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000703','Primavera','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000704','San Francisco','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000705','San Juan Los Planes','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000706','Santa Rosa','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000707','Segura','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000708','Sitio de Los Nejapas','DISTR_00000086');
INSERT INTO AAC_Canton VALUES ('CANTON_00000709','Tacachico','DISTR_00000086');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000087','Sacacoyo','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000710','Ateos','DISTR_00000087');
INSERT INTO AAC_Canton VALUES ('CANTON_00000711','Buena Vista','DISTR_00000087');
INSERT INTO AAC_Canton VALUES ('CANTON_00000712','La Montañita','DISTR_00000087');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000088','San José Villanueva','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000713','El Escalón','DISTR_00000088');
INSERT INTO AAC_Canton VALUES ('CANTON_00000714','El Palomar','DISTR_00000088');
INSERT INTO AAC_Canton VALUES ('CANTON_00000715','Las Dispensas','DISTR_00000088');
INSERT INTO AAC_Canton VALUES ('CANTON_00000716','Matazano','DISTR_00000088');
INSERT INTO AAC_Canton VALUES ('CANTON_00000717','Tula','DISTR_00000088');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000089','San Juan Opico','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000718','Agua Escondida','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000719','Barranca Honda','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000720','Buena Vista','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000721','Chanmico','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000722','Chantusnene','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000723','El Ángel Talcualuya','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000724','El Castillo','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000725','El Jabalí','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000726','El Matazano','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000727','Joya de Cerén','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000728','La Nueva Encarnación','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000729','Las Delicias','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000730','Granadillas','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000731','Los Amates','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000732','Minas de Plomo','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000733','Nombre de Dios','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000734','Pitichorro','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000735','San Antonio','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000736','San Felipe','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000737','San José La Cueva','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000738','San Nicolás Los Encuentros','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000739','San Nicolás La Encarnación','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000740','San Pedro Mártir','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000741','San Pedro Oriente','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000742','Sitio del Niño','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000743','Sitio Grande','DISTR_00000089');
INSERT INTO AAC_Canton VALUES ('CANTON_00000744','Tehuicho','DISTR_00000089');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000090','San Matías','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000745','El Jícaro','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000746','El Jocote','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000747','La Puebla','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000748','Las Anonas','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000749','Masajapa','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000750','San Pedro Las Flores','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000751','Santa Rosa','DISTR_00000090');
INSERT INTO AAC_Canton VALUES ('CANTON_00000752','Santa Teresa','DISTR_00000090');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000091','San Pablo Tacachico','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000753','Atiocoyo','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000754','Campana','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000755','El Tránsito','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000756','San Juan Mesas','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000757','Mogotes','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000758','Moncagua','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000759','Obraje Nuevo','DISTR_00000091');
INSERT INTO AAC_Canton VALUES ('CANTON_00000760','san Isidro','DISTR_00000091');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000092','Talnique','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000761','El Tránsito','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000762','Las Quebradas','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000763','Los Cipreses','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000764','Los Laureles','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000765','San Carlos','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000766','San José Los Sitios','DISTR_00000092');
INSERT INTO AAC_Canton VALUES ('CANTON_00000767','Santa Lucía','DISTR_00000092');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000093','Tamanique','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000768','Buenos Aires','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000769','El Cuervo','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000770','El Palmar','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000771','El Pinal','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000772','El Sunzal','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000773','San Alfonso','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000774','San Benito','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000775','San Emilio','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000776','San Isidro','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000777','Santa Lucía','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000778','Tarpeya','DISTR_00000093');
INSERT INTO AAC_Canton VALUES ('CANTON_00000779','San Antonio','DISTR_00000093');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000094','Teotepeque','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000780','El Ángel','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000781','Los Izotes','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000782','El Matazano','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000783','Mizata','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000784','San Benito','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000785','San Isidro','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000786','San Marcos','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000787','Santa María Mizata','DISTR_00000094');
INSERT INTO AAC_Canton VALUES ('CANTON_00000788','Sihuapilapa','DISTR_00000094');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000095','Tepecoyo','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000789','El Carrizo','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000790','El Guamo','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000791','El Mojón','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000791','El Zamil','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000792','La Javia','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000793','Las Flores','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000794','Los Alpes','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000795','Los Laureles','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000796','San Antonio','DISTR_00000095');
INSERT INTO AAC_Canton VALUES ('CANTON_00000797','Tierra Colorada','DISTR_00000095');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000096','Zaragoza','PROVIN_00000005');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000798','El Barillo','DISTR_00000096');
INSERT INTO AAC_Canton VALUES ('CANTON_00000799','Guadalupe','DISTR_00000096');
INSERT INTO AAC_Canton VALUES ('CANTON_00000800','San Francisco','DISTR_00000096');
INSERT INTO AAC_Canton VALUES ('CANTON_00000801','San Sebastián','DISTR_00000096');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - SAN SALVADOR */
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000097','San Salvador','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000802','El Carmen','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000803','El Manguito','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000804','El Tejar','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000805','Lomas de Candelaria','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000806','Monserrat','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000807','Planes de Renderos','DISTR_00000097');
INSERT INTO AAC_Canton VALUES ('CANTON_00000808','San Antonio Abad','DISTR_00000097');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000098','Aguilares','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000809','La Florida','DISTR_00000098');
INSERT INTO AAC_Canton VALUES ('CANTON_00000810','Las Tunas','DISTR_00000098');
INSERT INTO AAC_Canton VALUES ('CANTON_00000811','Los Mangos','DISTR_00000098');
INSERT INTO AAC_Canton VALUES ('CANTON_00000812','Piñalitos','DISTR_00000098');
INSERT INTO AAC_Canton VALUES ('CANTON_00000813','Pishishapa','DISTR_00000098');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000099','Apopa','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000814','El Ángel','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000815','Guadalupe','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000816','Joya Galana','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000817','Joya Grande','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000818','Las Delicias','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000819','San Nicolás','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000820','Suchinango','DISTR_00000099');
INSERT INTO AAC_Canton VALUES ('CANTON_00000821','Tres Ceibas','DISTR_00000099');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000100','Ayutuxtepeque','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000822','El Zapote','DISTR_00000100');
INSERT INTO AAC_Canton VALUES ('CANTON_00000823','Los Llanitos','DISTR_00000100');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000101','Ciudad Delgado','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000824','El Arenal','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000825','El Callejón','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000826','La Cabaña','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000827','Calle Real','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000828','Milingo','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000829','Plan del Pino','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000830','San José Cortez','DISTR_00000101');
INSERT INTO AAC_Canton VALUES ('CANTON_00000831','San Laureano','DISTR_00000101');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000102','Cuscatancingo','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000832','Las Flores','DISTR_00000102');
INSERT INTO AAC_Canton VALUES ('CANTON_00000833','San Luis Mariona','DISTR_00000102');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000103','El Paisnal','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000834','El Jicarón','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000835','El Matazano','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000836','El Tronador','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000837','La Cabaña','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000838','Las Delicias','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000839','Las Ventanas','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000840','Los Dos Cerros','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000841','Natividad','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000842','Potrero Grande','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000843','San Antonio Grande','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000844','San Diego','DISTR_00000103');
INSERT INTO AAC_Canton VALUES ('CANTON_00000845','San Rafael','DISTR_00000103');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000104','Guazapa','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000846','Calle Nuea','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000847','Loma de Ramos','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000848','Nance Verde','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000849','San Cristóbal','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000850','San Jerónimo','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000851','San Lucas','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000852','Santa Bárbara','DISTR_00000104');
INSERT INTO AAC_Canton VALUES ('CANTON_00000853','Zacamil','DISTR_00000104');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000105','Ilopango','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000854','Changallo','DISTR_00000105');
INSERT INTO AAC_Canton VALUES ('CANTON_00000855','Dolores Apulo','DISTR_00000105');
INSERT INTO AAC_Canton VALUES ('CANTON_00000856','San Bartolo','DISTR_00000105');
INSERT INTO AAC_Canton VALUES ('CANTON_00000857','Santa Lucía','DISTR_00000105');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000106','Mejicanos','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000858','Chancala','DISTR_00000106');
INSERT INTO AAC_Canton VALUES ('CANTON_00000859','San Miguel','DISTR_00000106');
INSERT INTO AAC_Canton VALUES ('CANTON_00000860','San Roque','DISTR_00000106');
INSERT INTO AAC_Canton VALUES ('CANTON_00000861','Zacamil','DISTR_00000106');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000107','Nejapa','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000862','Aldea de Mercedes','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000863','Camotepeque','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000864','Bonete','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000865','Conacaste','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000866','El Salitre','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000867','Galera Quemada','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000868','San Jerónimo Los Planes','DISTR_00000107');
INSERT INTO AAC_Canton VALUES ('CANTON_00000869','Tutultepeque','DISTR_00000107');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000108','Panchimalco','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000870','Amayón','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000871','Azacualpa','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000872','El Cedro','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000873','El Divisadero','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000874','El Guayabo','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000875','Las Crucitas','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000876','Los Pajales','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000877','Los Palones','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000878','Los Planes de Renderos','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000879','Los Troncones','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000880','Loma y Media','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000881','Panchimalquito','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000882','Quezalapa','DISTR_00000108');
INSERT INTO AAC_Canton VALUES ('CANTON_00000883','San Isidro','DISTR_00000108');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000109','Rosario de Mora','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000884','Cerco de Piedra','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000885','El Carrizal','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000886','El Jutío','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000887','Las Barrosas','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000888','Palo Grande','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000889','Plan del Mango','DISTR_00000109');
INSERT INTO AAC_Canton VALUES ('CANTON_00000890','San Ramón','DISTR_00000109');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000110','San Marcos','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000891','Casa de Piedra','DISTR_00000110');
INSERT INTO AAC_Canton VALUES ('CANTON_00000892','Cerro de Amatepec','DISTR_00000110');
INSERT INTO AAC_Canton VALUES ('CANTON_00000893','El Pepeto','DISTR_00000110');
INSERT INTO AAC_Canton VALUES ('CANTON_00000894','Guadalupe','DISTR_00000110');
INSERT INTO AAC_Canton VALUES ('CANTON_00000895','Planes de Renderos','DISTR_00000110');
INSERT INTO AAC_Canton VALUES ('CANTON_00000896','San José Ahuacatitán','DISTR_00000110');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000111','San Martín','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000897','Animas','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000898','El Rosario','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000899','El Sauce','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000900','La Flor','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000901','La Palma','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000902','Las Delicias','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000903','San José Primero','DISTR_00000111');
INSERT INTO AAC_Canton VALUES ('CANTON_00000904','San José Segundo','DISTR_00000111');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000112','Santiago Texacuangos','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000905','Asino','DISTR_00000112');
INSERT INTO AAC_Canton VALUES ('CANTON_00000906','El Morro','DISTR_00000112');
INSERT INTO AAC_Canton VALUES ('CANTON_00000907','Joya Grande','DISTR_00000112');
INSERT INTO AAC_Canton VALUES ('CANTON_00000908','La Cuchilla','DISTR_00000112');
INSERT INTO AAC_Canton VALUES ('CANTON_00000909','Shaltipa','DISTR_00000112');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000113','Santo Tomás','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000910','Caña Brava','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000911','Cuapa','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000912','Chaltepe','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000913','El Carmen','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000914','El Ciprés','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000915','El Guaje','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000916','El Porvenir','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000917','Las Casitas','DISTR_00000113');
INSERT INTO AAC_Canton VALUES ('CANTON_00000918','Potrerillos','DISTR_00000113');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000114','Soyapango','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000919','Buena Vista','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000920','El Cacao','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000921','El Guaje','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000922','El Limón','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000923','El Matazano','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000924','El Tránsito','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000925','Prusia','DISTR_00000114');
INSERT INTO AAC_Canton VALUES ('CANTON_00000926','Venecia','DISTR_00000114');
-- District El Salvador -- Municipios 
INSERT INTO AAC_District VALUES ('DISTR_00000115','Tonacatepeque','PROVIN_00000006');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000927','El Sauce','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000928','El Rosario','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000929','El Tránsito','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000930','La Fuente','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000931','La Unión','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000932','Las Flores','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000933','Malacoff','DISTR_00000115');
INSERT INTO AAC_Canton VALUES ('CANTON_00000934','Veracruz','DISTR_00000115');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - CUSCATLAN */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000116','Cojutepeque','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000935','Cujuapa','DISTR_00000116');
INSERT INTO AAC_Canton VALUES ('CANTON_00000936','El Carrizal','DISTR_00000116');
INSERT INTO AAC_Canton VALUES ('CANTON_00000937','Jiñuco','DISTR_00000116');
INSERT INTO AAC_Canton VALUES ('CANTON_00000938','La Palma','DISTR_00000116');
INSERT INTO AAC_Canton VALUES ('CANTON_00000939','Los Naranjos','DISTR_00000116');
INSERT INTO AAC_Canton VALUES ('CANTON_00000940','Ojos de Agua','DISTR_00000116');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000117','Candelaria','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000941','Concepción','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000942','El Rosario','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000943','Miraflor Arriba','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000944','San Antonio','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000945','San José La Ceiba','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000946','San Juan Miraflor Abajo','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000947','San Miguel Nace Verde','DISTR_00000117');
INSERT INTO AAC_Canton VALUES ('CANTON_00000948','San Rafael La Loma','DISTR_00000117');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000118','El Carmen','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000949','Candelaria','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000950','Concepción','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000951','El Carmen','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000952','La Paz','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000953','San Antonio','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000954','San Sebastián','DISTR_00000118');
INSERT INTO AAC_Canton VALUES ('CANTON_00000955','Santa Lucía','DISTR_00000118');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000119','El Rosario','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000956','Amatillo','DISTR_00000119');
INSERT INTO AAC_Canton VALUES ('CANTON_00000957','El Calvario','DISTR_00000119');
INSERT INTO AAC_Canton VALUES ('CANTON_00000958','San Martín','DISTR_00000119');
INSERT INTO AAC_Canton VALUES ('CANTON_00000959','Veracruz','DISTR_00000119');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000120','Monte San Juan','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000960','Candelaria','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000961','Concepción','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000962','El Carmen','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000963','El Rosario','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000964','San Andrés','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000965','San Antonio','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000966','San José','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000967','San Martín','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000968','San Nicolás','DISTR_00000120');
INSERT INTO AAC_Canton VALUES ('CANTON_00000969','Soledad','DISTR_00000120');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000121','Oratorio de Concepción','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000970','Palacios','DISTR_00000121');
INSERT INTO AAC_Canton VALUES ('CANTON_00000971','Tacanagua','DISTR_00000121');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000122','San Bartolomé Perulapía','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000972','El Triunfo','DISTR_00000122');
INSERT INTO AAC_Canton VALUES ('CANTON_00000973','Las Lomas','DISTR_00000122');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000123','San Cristóbal','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000974','La Virgen','DISTR_00000123');
INSERT INTO AAC_Canton VALUES ('CANTON_00000975','San Antonio','DISTR_00000123');
INSERT INTO AAC_Canton VALUES ('CANTON_00000976','San Francisco','DISTR_00000123');
INSERT INTO AAC_Canton VALUES ('CANTON_00000977','San José','DISTR_00000123');
INSERT INTO AAC_Canton VALUES ('CANTON_00000978','Santa Anita','DISTR_00000123');
INSERT INTO AAC_Canton VALUES ('CANTON_00000979','Santa Cruz','DISTR_00000123');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000124','San José Guayabal','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000980','Animas','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000981','El Salitre','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000982','La Cruz','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000983','Los Meléndez','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000984','Los Ramírez','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000985','Los Rodríguez','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000986','Llano Grande','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000987','Palacios','DISTR_00000124');
INSERT INTO AAC_Canton VALUES ('CANTON_00000988','Piedra Labrada','DISTR_00000124');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000125','San Pedro Perulapán','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00000989','Buena Vista','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000990','Buenos Aires','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000991','El Carmen','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000992','El Espino','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000993','El Limón','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000994','El Paraíso','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000995','El Rodeo','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000996','Huisiltepeque','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000997','Istagua','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000998','La Cruz','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00000999','La Esperanza','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001000','La Loma','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001001','Miraflores','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001002','San Agustín','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001003','San Francisco','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001004','Tecoluco','DISTR_00000125');
INSERT INTO AAC_Canton VALUES ('CANTON_00001005','Tecomatepe','DISTR_00000125');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000126','San Rafael Cedros','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001006','Cerro Colorado','DISTR_00000126');
INSERT INTO AAC_Canton VALUES ('CANTON_00001007','Copinol','DISTR_00000126');
INSERT INTO AAC_Canton VALUES ('CANTON_00001008','El Espinal','DISTR_00000126');
INSERT INTO AAC_Canton VALUES ('CANTON_00001009','Jiboa','DISTR_00000126');
INSERT INTO AAC_Canton VALUES ('CANTON_00001010','Palacios','DISTR_00000126');
INSERT INTO AAC_Canton VALUES ('CANTON_00001011','Soledad','DISTR_00000126');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000127','San Ramón','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001012','Jesús','DISTR_00000127');
INSERT INTO AAC_Canton VALUES ('CANTON_00001013','San Agustín','DISTR_00000127');
INSERT INTO AAC_Canton VALUES ('CANTON_00001014','San Pablo','DISTR_00000127');
INSERT INTO AAC_Canton VALUES ('CANTON_00001015','San Pedro','DISTR_00000127');
INSERT INTO AAC_Canton VALUES ('CANTON_00001016','Santa Isabel','DISTR_00000127');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000128','Santa Cruz Analquito','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001017','Barrio Abajo','DISTR_00000128');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000129','Santa Cruz Michapa','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001018','Animas','DISTR_00000129');
INSERT INTO AAC_Canton VALUES ('CANTON_00001019','Buena Vista','DISTR_00000129');
INSERT INTO AAC_Canton VALUES ('CANTON_00001020','Delicias','DISTR_00000129');
INSERT INTO AAC_Canton VALUES ('CANTON_00001021','El Centro','DISTR_00000129');
INSERT INTO AAC_Canton VALUES ('CANTON_00001022','Michapa','DISTR_00000129');
INSERT INTO AAC_Canton VALUES ('CANTON_00001023','Rosales','DISTR_00000129');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000130','Suchitoto','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001024','Aguacayo','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001025','Bermuda','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001026','Buenavista','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001027','Caulote','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001028','Colima','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001029','Consolación','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001030','Copapayo','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001031','Corozal','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001032','Delicias','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001033','Estanzuelas','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001034','Guadalupe','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001035','Haciendita','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001036','Ichanquero','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001037','Milingo','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001038','Mirandilla','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001039','Molino','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001040','Montepeque','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001041','Palacios','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001042','Palo Grande','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001043','Pepeistenango','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001044','Platanar','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001045','Roble','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001046','San Cristóbal','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001047','San Juan','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001048','San Lucas','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001049','Tablón','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001050','Tenango','DISTR_00000130');
INSERT INTO AAC_Canton VALUES ('CANTON_00001051','Zapote','DISTR_00000130');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000131','Tenancingo','PROVIN_00000007');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001052','Ajuluco','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001053','Copalchan','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001054','Corral Viejo','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001055','Huisiltepeque','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001056','El Pepeto','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001057','Jiñuco','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001058','La Cruz','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001059','Rosario Perico','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001060','Rosario Tablón','DISTR_00000131');
INSERT INTO AAC_Canton VALUES ('CANTON_00001061','Santa Anita','DISTR_00000131');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - LA PAZ */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000132','Zacatecoluca','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001062','Amayo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001063','Ánimas Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001064','Ánimas Arriba','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001065','Azcualpa','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001066','Buena Vista Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001067','Buena Vista Arriba','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001068','Buena Vista Arrinconada','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001069','El Amate','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001070','El Callejón','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001071','El Carmen','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001072','El Copinol','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001073','El Despoblado','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001074','El Escobal','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001075','El Espino Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001076','El Espino Arriba','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001077','El Maneadero','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001078','El Socorro','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001079','Hatos de Los Reyes','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001080','La Herradura','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001081','La Isla','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001082','La Isleta','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001083','La Joya','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001084','La Lucha','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001085','Las Tablas','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001086','Liévano','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001087','Los Blancos','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001088','Los Platanares','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001089','Penitonte Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001090','Penitonte Arriba','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001091','Piedra Grande Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001092','Piedra Grande Arriba','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001093','Pineda','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001094','San Francisco Los Reyes','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001095','San José de La Montaña','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001096','San Josecito','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001097','San Lucas','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001098','San Marcos de La Cruz','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001099','San Rafael','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001100','San Rafael Tasajera','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001101','Santa Lucía','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001102','Tapechame','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001103','Tierra Blanca','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001104','Ulapa','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001105','Ulapa Abajo','DISTR_00000132');
INSERT INTO AAC_Canton VALUES ('CANTON_00001108','Ulapa Arriba','DISTR_00000132');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000133','Cuyultitán','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001109','San Antonio','DISTR_00000133');
INSERT INTO AAC_Canton VALUES ('CANTON_00001110','San Isidro','DISTR_00000133');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000134','El Rosario','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001111','Asunción Amatepe','DISTR_00000134');
INSERT INTO AAC_Canton VALUES ('CANTON_00001112','El Cerro','DISTR_00000134');
INSERT INTO AAC_Canton VALUES ('CANTON_00001113','El Pedregal','DISTR_00000134');
INSERT INTO AAC_Canton VALUES ('CANTON_00001114','Tilapa','DISTR_00000134');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000135','Jerusalén','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001115','El Conacaste','DISTR_00000135');
INSERT INTO AAC_Canton VALUES ('CANTON_00001116','El Espino','DISTR_00000135');
INSERT INTO AAC_Canton VALUES ('CANTON_00001117','Los Romeros','DISTR_00000135');
INSERT INTO AAC_Canton VALUES ('CANTON_00001118','Veracruz Abajo','DISTR_00000135');
INSERT INTO AAC_Canton VALUES ('CANTON_00001119','Veracruz Arriba','DISTR_00000135');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000136','Mercedes La Ceiba','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001120','San Antonio','DISTR_00000136');
INSERT INTO AAC_Canton VALUES ('CANTON_00001121','San Luis','DISTR_00000136');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000137','Olocuilta','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001122','Cupinco','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001123','Jayuca','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001124','Joyas de Girón','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001125','La Esperanza','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001126','Planes de las Delicias','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001127','San Antonio Girón','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001128','San José Buenavista','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001129','San Sebastián','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001130','Santa Fe','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001131','Santo Tomás','DISTR_00000137');
INSERT INTO AAC_Canton VALUES ('CANTON_00001132','Valle Nuevo','DISTR_00000137');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000138','Paraíso de Osorio','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001133','El Copinol','DISTR_00000138');
INSERT INTO AAC_Canton VALUES ('CANTON_00001134','Los Zacatales','DISTR_00000138');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000139','San Antonio Masahuat','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001135','Belén','DISTR_00000139');
INSERT INTO AAC_Canton VALUES ('CANTON_00001136','El Socorro','DISTR_00000139');
INSERT INTO AAC_Canton VALUES ('CANTON_00001137','San Antonio La Loma','DISTR_00000139');
INSERT INTO AAC_Canton VALUES ('CANTON_00001138','San José La Instancia','DISTR_00000139');
INSERT INTO AAC_Canton VALUES ('CANTON_00001139','San José Los Solares','DISTR_00000139');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000140','San Emigdio','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001140','Concepción de Lourdes','DISTR_00000140');
INSERT INTO AAC_Canton VALUES ('CANTON_00001141','San José Costa Rica','DISTR_00000140');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000141','San Francisco Chinameca','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001142','Candelaria','DISTR_00000141');
INSERT INTO AAC_Canton VALUES ('CANTON_00001143','Concepción Los Planes','DISTR_00000141');
INSERT INTO AAC_Canton VALUES ('CANTON_00001144','San Antonio Panchimilama','DISTR_00000141');
INSERT INTO AAC_Canton VALUES ('CANTON_00001145','San José La Montaña','DISTR_00000141');
INSERT INTO AAC_Canton VALUES ('CANTON_00001146','Santa Cruz La Vega','DISTR_00000141');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000142','San Juan Nonualco','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001147','El Chile','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001148','El Golfo','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001149','El Pajal','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001150','El Salto','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001151','La Laguneta','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001152','La Longaniza','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001153','Las Delicias','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001154','Las Piedronas','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001155','Los Zacatilos','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001156','Tehuiste Abajo','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001157','Tehuiste Arriba','DISTR_00000142');
INSERT INTO AAC_Canton VALUES ('CANTON_00001158','Tierra Colorada','DISTR_00000142');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000143','San Juan Talpa','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001159','Comalapa','DISTR_00000143');
INSERT INTO AAC_Canton VALUES ('CANTON_00001160','Tobalón','DISTR_00000143');
INSERT INTO AAC_Canton VALUES ('CANTON_00001161','Veracruz','DISTR_00000143');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000144','San Juan Tepezontes','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001162','La Cruz','DISTR_00000144');
INSERT INTO AAC_Canton VALUES ('CANTON_00001163','La Esperanza','DISTR_00000144');
INSERT INTO AAC_Canton VALUES ('CANTON_00001164','Los Laureles','DISTR_00000144');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000145','San Luis La Herradura','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001165','El Cordoncillo','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001166','San Rafael Tasajera','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001167','El Zapote','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001168','San Antonio Los Blancos','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001169','El Llano','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001170','Las Anonas','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001171','El Escobal','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001172','San Sebastián La Zorra','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001173','San Sebastián El Chingo','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001174','Guadalupe La Zorra','DISTR_00000145');
INSERT INTO AAC_Canton VALUES ('CANTON_00001175','La Calzada','DISTR_00000145');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000146','San Luis Talpa','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001176','Amatecampo','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001177','Cuchilla de Comalapa','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001178','El Pimental','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001179','El Porvenir','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001180','Nuevo Edén','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001181','Sambombera','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001182','San Francisco Amatepe','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001183','San Marcos Jiboa','DISTR_00000146');
INSERT INTO AAC_Canton VALUES ('CANTON_00001184','Talcualuya','DISTR_00000146');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000147','San Miguel Tepezontes','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001185','San Bartolo','DISTR_00000147');
INSERT INTO AAC_Canton VALUES ('CANTON_00001186','Soledad de Las Flores','DISTR_00000147');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000148','San Pedro Masahuat','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001187','Barahona','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001188','Buena Vista','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001189','Colonia Valladares','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001190','Delicias','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001191','Dulce Nombre','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001192','El Achiotal','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001193','El Ángel','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001194','El Carmen','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001195','El Cicahuite','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001196','El Paredón','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001197','El Pimental','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001198','El Porvenir','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001199','La Sabana','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001200','Las Flores','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001201','Las Hojas','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001202','Las Isletas','DISTR_00000148');
INSERT INTO AAC_Canton VALUES ('CANTON_00001203','Mar','DISTR_00000148');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000149','San Pedro Nonualco','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001204','El Lazareto','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001205','El Roble','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001206','Hacienda Vieja','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001207','La Carbonera','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001208','La Comunidad','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001209','San Juan Nahuistepeque','DISTR_00000149');
INSERT INTO AAC_Canton VALUES ('CANTON_00001210','San Ramón','DISTR_00000149');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000150','San Rafael Obrajuelo','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001211','El Carao','DISTR_00000150');
INSERT INTO AAC_Canton VALUES ('CANTON_00001212','La Longaniza','DISTR_00000150');
INSERT INTO AAC_Canton VALUES ('CANTON_00001213','La Palma','DISTR_00000150');
INSERT INTO AAC_Canton VALUES ('CANTON_00001214','San Jerónimo','DISTR_00000150');
INSERT INTO AAC_Canton VALUES ('CANTON_00001215','San José Obrajuelo','DISTR_00000150');
INSERT INTO AAC_Canton VALUES ('CANTON_00001216','San Pedro Mártir','DISTR_00000150');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000151','Santa María Ostuma','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001217','Concepción','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001218','El Chaperno','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001219','El Tránsito','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001220','Loma Larga','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001221','San Antonio','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001222','San Isidro','DISTR_00000151');
INSERT INTO AAC_Canton VALUES ('CANTON_00001223','San José Carrizal','DISTR_00000151');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000152','Santiago Nonualco','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001224','Anulunco','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001225','Concepción Jalpanga','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001226','Chancuyo','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001227','El Sauce','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001228','Jalponguita','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001229','La Cruz del Mojón','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001230','Las Animas','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001231','Las Guarumas','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001232','San Antonio Arriba','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001233','San Francisco El Porfiado','DISTR_00000152');
INSERT INTO AAC_Canton VALUES ('CANTON_00001234','San Francisco Hacienda','DISTR_00000152');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000153','Tapalhauca','PROVIN_00000008');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001235','La Baza','DISTR_00000153');
INSERT INTO AAC_Canton VALUES ('CANTON_00001236','Las Lajas','DISTR_00000153');
INSERT INTO AAC_Canton VALUES ('CANTON_00001237','San Pedro La Palma','DISTR_00000153');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - CABAÑAS */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000154','Sensuntepeque','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001238','Copinolapa','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001239','Cunchique','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001240','Cuyantepeque','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001241','Chunte','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001242','El Aguacate','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001243','El Volcán','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001244','La Trinidad','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001245','Las Marías','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001246','Los Llanitos','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001247','Llano Grande','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001248','Nombre de Dios','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001249','Pide de la Cuesta','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001250','Río Grande','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001251','Rojas','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001252','San Gregorio','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001253','San Lorenzo','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001254','San Marcos','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001255','San Matías','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001256','San Nicolás','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001257','Santa Rosa','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00002258','Tempisque','DISTR_00000154');
INSERT INTO AAC_Canton VALUES ('CANTON_00001259','Tronalagua','DISTR_00000154');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000155','Cinquera','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001260','El Cacao','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001261','El Tule','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001252','Huilihuiste','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001263','La Escopeta','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001264','San Antonio','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001265','San Benito','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001266','San Nicolás','DISTR_00000155');
INSERT INTO AAC_Canton VALUES ('CANTON_00001267','Valle Nuevo','DISTR_00000155');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000156','Dolores','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001268','Cañafístula','DISTR_00000156');
INSERT INTO AAC_Canton VALUES ('CANTON_00001269','Chapelcoro','DISTR_00000156');
INSERT INTO AAC_Canton VALUES ('CANTON_00001270','Curarén','DISTR_00000156');
INSERT INTO AAC_Canton VALUES ('CANTON_00001271','El Rincón','DISTR_00000156');
INSERT INTO AAC_Canton VALUES ('CANTON_00001272','Niqueresque','DISTR_00000156');
INSERT INTO AAC_Canton VALUES ('CANTON_00001273','San Carlos','DISTR_00000156');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000157','Guacotecti','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001274','El Agua Zarca','DISTR_00000157');
INSERT INTO AAC_Canton VALUES ('CANTON_00001275','El Bañadero','DISTR_00000157');
INSERT INTO AAC_Canton VALUES ('CANTON_00001276','El Tempisque','DISTR_00000157');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000158','Ilobasco','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001277','Agua Zarca','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001278','Azacualpa','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001279','Cerro Colorado','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001280','El Mestizo','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001281','El Potrero','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001282','La Calera','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001283','La Labor','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001284','Las Huertas','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001285','Los Hoyos','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001286','Los Llanitos','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001287','Maquilishuat','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001288','Nanastepeque','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001289','Oratorio','DISTR_00000158');
INSERT INTO AAC_Canton VALUES ('CANTON_00001290','San Francisco del Monte','DISTR_00000158');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000159','Jutiapa','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001291','Caleras','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001292','Carolina','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001293','Llano Largo','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001294','Palacios','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001295','Platanar','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001296','San Sebastián','DISTR_00000159');
INSERT INTO AAC_Canton VALUES ('CANTON_00001297','Santa Bárbara','DISTR_00000159');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000160','San Isidro','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001298','El Amate','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001299','Izacatal','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001300','Los Jobos','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001301','Llano de la Hacienda','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001302','Potrero de Batres','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001303','Potrero y Tabla','DISTR_00000160');
INSERT INTO AAC_Canton VALUES ('CANTON_00001304','San Francisco','DISTR_00000160');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000161','Tejutepeque','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001305','Concepción','DISTR_00000161');
INSERT INTO AAC_Canton VALUES ('CANTON_00001306','El Zapote','DISTR_00000161');
INSERT INTO AAC_Canton VALUES ('CANTON_00001307','San Antonio Buenavista','DISTR_00000161');
INSERT INTO AAC_Canton VALUES ('CANTON_00001308','San Francisco Echeverría','DISTR_00000161');
INSERT INTO AAC_Canton VALUES ('CANTON_00001309','Santa Olaya','DISTR_00000161');
INSERT INTO AAC_Canton VALUES ('CANTON_00001310','Santa Rita','DISTR_00000161');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000162','Victoria','PROVIN_00000009');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001311','Azacualpa','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001312','El Caracol','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001313','El Zapote','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001314','La Bermuda','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001315','La Uvilla','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001316','Paratao','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001317','Peña Blanca','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001318','San Antonio','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001319','San Pedro','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001320','Santa Marta','DISTR_00000162');
INSERT INTO AAC_Canton VALUES ('CANTON_00001321','Rojitas','DISTR_00000162');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - SAN VICENTE */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000163','San Vicente','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001322','Antón Flores','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001323','Chamoco','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001324','Chucuyo','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001325','Dos Quebradas','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001326','El Caracol','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001327','El Marquetado','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001328','El Rebelde','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001329','La Joya','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001330','La Soledad','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001331','León de Piedra','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001332','Los Laureles','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001333','Los Pozos','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001334','Llanos de Ahichilco','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001335','Obrajuelo Lempa','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001336','Parras Lempa','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001337','San Antonio Achichilco','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001338','San Antonio Caminos','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001339','San Antonio Tras El Cerro','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001340','San Bartolo Ichanmico','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001341','San Diego','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001342','San Jacinto','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001343','San José Río Frío','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001344','San Juan Buenavista','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001345','San Rafael San Diego','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001346','Santa Gertrudis','DISTR_00000163');
INSERT INTO AAC_Canton VALUES ('CANTON_00001347','Volcán Opico','DISTR_00000163');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000164','Apastepeque','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001348','Calderas','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001349','Cotumayo','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001350','El Guayabo','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001351','Las Minas','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001352','San Felipe','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001353','San Jacinto','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001354','San José Almendro','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001355','San Juan de Merino','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001356','San Nicolás','DISTR_00000164');
INSERT INTO AAC_Canton VALUES ('CANTON_00001357','San Pedro','DISTR_00000164');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000165','Guadalupe','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001358','San Antonio Los Ranchos','DISTR_00000165');
INSERT INTO AAC_Canton VALUES ('CANTON_00001359','San Benito','DISTR_00000165');
INSERT INTO AAC_Canton VALUES ('CANTON_00001360','San Emigdio','DISTR_00000165');
INSERT INTO AAC_Canton VALUES ('CANTON_00001361','San Francisco Agua Agria','DISTR_00000165');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000166','San Cayetano Istepeque','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001362','Candelaria','DISTR_00000166');
INSERT INTO AAC_Canton VALUES ('CANTON_00001363','Cerro Grande','DISTR_00000166');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000167','San Esteban Catarina','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001364','Amatitán Abajo','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001365','Amatitán Arriba','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001366','Cerros de San Pedro','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001367','San Esteban','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001368','San Ildefonso','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001369','San Jacinto La Burrera','DISTR_00000167');
INSERT INTO AAC_Canton VALUES ('CANTON_00001370','Santa Catarina','DISTR_00000167');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000168','San Ildefonso','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001371','Candelaria Lempa','DISTR_00000168');
INSERT INTO AAC_Canton VALUES ('CANTON_00001372','Guachipilín','DISTR_00000168');
INSERT INTO AAC_Canton VALUES ('CANTON_00001373','Lajas y Canoas','DISTR_00000168');
INSERT INTO AAC_Canton VALUES ('CANTON_00001374','San Francisco','DISTR_00000168');
INSERT INTO AAC_Canton VALUES ('CANTON_00001375','San Lorenzo','DISTR_00000168');
INSERT INTO AAC_Canton VALUES ('CANTON_00001376','San Pablo Cañales','DISTR_00000168');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000169','San Lorenzo','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001377','La Cruz','DISTR_00000169');
INSERT INTO AAC_Canton VALUES ('CANTON_00001378','Las Animas','DISTR_00000169');
INSERT INTO AAC_Canton VALUES ('CANTON_00001379','San Francisco','DISTR_00000169');
INSERT INTO AAC_Canton VALUES ('CANTON_00001380','Santa Lucía','DISTR_00000169');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000170','San Sebastián','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001381','El Paraíso','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001382','El Porvenir Aguacayo','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001383','La Esperanza','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001384','La Labor','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001385','Las Rosas','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001386','Los Laureles','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001387','San Francisco','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001388','Santa Elena','DISTR_00000170');
INSERT INTO AAC_Canton VALUES ('CANTON_00001389','Santa Teresa','DISTR_00000170');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000171','Santa Clara','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001390','Agua Helada','DISTR_00000171');
INSERT INTO AAC_Canton VALUES ('CANTON_00001391','El Rosario','DISTR_00000171');
INSERT INTO AAC_Canton VALUES ('CANTON_00001392','San Jerónimo','DISTR_00000171');
INSERT INTO AAC_Canton VALUES ('CANTON_00001393','San Juan de Merinos','DISTR_00000171');
INSERT INTO AAC_Canton VALUES ('CANTON_00001394','Santa Rosa','DISTR_00000171');
INSERT INTO AAC_Canton VALUES ('CANTON_00001395','Tortuguero','DISTR_00000171');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000172','Santo Domingo','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001396','El Refugio','DISTR_00000172');
INSERT INTO AAC_Canton VALUES ('CANTON_00001397','Iscanales','DISTR_00000172');
INSERT INTO AAC_Canton VALUES ('CANTON_00001398','Los Rodríguez','DISTR_00000172');
INSERT INTO AAC_Canton VALUES ('CANTON_00001399','Talpetates','DISTR_00000172');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000173','Tecoluca','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001400','Barrio Nuevo','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001401','El Arco','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001402','El Campanario','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001403','El Carao','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001404','El Coyolito','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001405','El Pacún','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001406','El Palomar','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001407','El Perical','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001408','El Porrillo','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001409','El Puente','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001410','El Socorro','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001411','La Esperanza','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001412','Las Anonas','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001413','Las Mesas','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001414','San Andrés Achiote','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001415','San Benito','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001416','San Carlos','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001417','San Fernando','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001418','San Francisco Angulo','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001419','San José Llano Grande','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001420','San Nicolás Lempa','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001421','San Ramón Grifal','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001422','Santa Bárbara','DISTR_00000173');
INSERT INTO AAC_Canton VALUES ('CANTON_00001423','Santa Cruz','DISTR_00000173');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000174','Tepetitán','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001424','Concepción de Cañas','DISTR_00000174');
INSERT INTO AAC_Canton VALUES ('CANTON_00001425','La Virgen','DISTR_00000174');
INSERT INTO AAC_Canton VALUES ('CANTON_00001426','Loma Alta','DISTR_00000174');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000175','Verapaz','PROVIN_00000010');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001427','El Carmen','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001428','Molineros','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001429','San Antonio Jiboa','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001430','San Isidro','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001431','San Jerónimo Limón','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001432','San José Borjas','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001433','San Juan Bautista','DISTR_00000175');
INSERT INTO AAC_Canton VALUES ('CANTON_00001434','San Pedro Agua Caliente','DISTR_00000175');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - SAN MIGUEL */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000176','San Miguel','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001435','Altamira','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001436','Anchico','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001437','Cerro Bonito','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001438','Concepción','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001439','El Amate','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001440','El Brazo','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001441','El Divisadero','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001442','El Havillal','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001443','El Jalacatal','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001444','El Jute','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001445','El Niño','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001446','El Papalón','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001447','El Progreso','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001448','El Sitio','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001449','El Tecomatal','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001450','El Volcán','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001451','El Zamorán','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001452','Hato Nuevo','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001453','La Canoa','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001454','La Puerta','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001455','La Trinidad','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001456','Las Delicias','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001457','Las Lomitas','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001458','Miraflores','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001459','Monte Grande','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001460','San Andrés','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001461','San Antonio Chávez','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001462','San Antonio Silva','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001463','San Carlos','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001464','San Jacinto','DISTR_00000176');
INSERT INTO AAC_Canton VALUES ('CANTON_00001465','Santa Inés','DISTR_00000176');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000177','Carolina','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001466','La Ceibita','DISTR_00000177');
INSERT INTO AAC_Canton VALUES ('CANTON_00001467','La Orilla','DISTR_00000177');
INSERT INTO AAC_Canton VALUES ('CANTON_00001468','Miracapa','DISTR_00000177');
INSERT INTO AAC_Canton VALUES ('CANTON_00001469','Rosas Nacaspilo','DISTR_00000177');
INSERT INTO AAC_Canton VALUES ('CANTON_00001470','Soledad Torrero','DISTR_00000177');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000178','Chapeltique','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001471','Cercas de Piedra','DISTR_00000178');
INSERT INTO AAC_Canton VALUES ('CANTON_00001472','Hualamá','DISTR_00000178');
INSERT INTO AAC_Canton VALUES ('CANTON_00001473','La Trinidad Los Anatos','DISTR_00000178');
INSERT INTO AAC_Canton VALUES ('CANTON_00001474','San Jerónimo','DISTR_00000178');
INSERT INTO AAC_Canton VALUES ('CANTON_00001475','San Pedro','DISTR_00000178');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000179','Chinameca','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001476','Boquerón','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001477','Conacastal','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001478','Copinol Primero','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001479','Copinol Segundo','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001480','Chambala','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001481','El Jocote','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001482','Jocote Dulce','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001483','La Cruz Primera','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001484','La Cruz Segunda','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001485','La Peña','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001486','Las Marías','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001487','Las Mesas','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001488','Los Arenales','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001489','Los Planes Primero','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001490','Los Planes Segundo','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001491','Los Planes Tercero','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001492','Ojos de Agua','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001493','Oromontique','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001494','San Antonio','DISTR_00000179');
INSERT INTO AAC_Canton VALUES ('CANTON_00001495','Zaragoza','DISTR_00000179');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000180','Chirilagua','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001496','Chilanguera','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001497','Guadalupe','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001498','El Capulín','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001499','Hoja de Sal','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001500','La Estrechura','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001501','Nueva Concepción','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001502','San José Gualoso','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001503','San Pedro','DISTR_00000180');
INSERT INTO AAC_Canton VALUES ('CANTON_00001504','Tierra Blanca','DISTR_00000180');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000181','Ciudad Barrios','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001505','Belén','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001506','Guanacaste','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001507','Llano El Ángel','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001508','Nuevo Porvenir','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001509','San Cristóbal','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001510','San Juan','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001511','San Luisito','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001512','San Matías','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001513','Toponahuaste','DISTR_00000181');
INSERT INTO AAC_Canton VALUES ('CANTON_00001514','Torrecilla','DISTR_00000181');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000182','Comacarán','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001515','Candelaria','DISTR_00000182');
INSERT INTO AAC_Canton VALUES ('CANTON_00001516','El Colorado','DISTR_00000182');
INSERT INTO AAC_Canton VALUES ('CANTON_00001517','El Platanarillo','DISTR_00000182');
INSERT INTO AAC_Canton VALUES ('CANTON_00001518','Hormiguero','DISTR_00000182');
INSERT INTO AAC_Canton VALUES ('CANTON_00001519','Jicaral','DISTR_00000182');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000183','El Tránsito','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001520','Borbollón','DISTR_00000183');
INSERT INTO AAC_Canton VALUES ('CANTON_00001521','Calle Nueva','DISTR_00000183');
INSERT INTO AAC_Canton VALUES ('CANTON_00001522','Llano El Coyol','DISTR_00000183');
INSERT INTO AAC_Canton VALUES ('CANTON_00001523','Moropala','DISTR_00000183');
INSERT INTO AAC_Canton VALUES ('CANTON_00001524','Piedra Pacha','DISTR_00000183');
INSERT INTO AAC_Canton VALUES ('CANTON_00001525','Primavera','DISTR_00000183');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000184','Lolotique','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001526','Amaya','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001527','Concepción','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001528','El Jícaro','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001529','El Nancito','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001530','El Palón','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001531','Las Ventas','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001532','San Francisco','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001533','Santa Bárbara','DISTR_00000184');
INSERT INTO AAC_Canton VALUES ('CANTON_00001534','Valencia','DISTR_00000184');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000185','Moncagua','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001535','El Cerro','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001536','El Jobo','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001537','El Papalón','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001538','El Platanar','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001539','El Rodeo','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001540','El Salara','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001541','El Valle Alegre','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001542','La Estancia','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001543','La Fragua','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001544','Los Ejidos','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001545','Santa Bárbara','DISTR_00000185');
INSERT INTO AAC_Canton VALUES ('CANTON_00001546','Tongoloma','DISTR_00000185');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000186','Nueva Guadalupe','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001547','Los Planes','DISTR_00000186');
INSERT INTO AAC_Canton VALUES ('CANTON_00001548','San Luis','DISTR_00000186');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000187','Nuevo Edén de San Juan','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001549','Cucuruchos','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001550','Jardín','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001551','Laureles','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001552','Montecillos','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001553','Ojeo','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001554','Queseras','DISTR_00000187');
INSERT INTO AAC_Canton VALUES ('CANTON_00001555','San Sebastián','DISTR_00000187');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000188','Quelepa','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001556','El Obrajuelo','DISTR_00000188');
INSERT INTO AAC_Canton VALUES ('CANTON_00001557','El Tamboral','DISTR_00000188');
INSERT INTO AAC_Canton VALUES ('CANTON_00001558','San Antonio','DISTR_00000188');
INSERT INTO AAC_Canton VALUES ('CANTON_00001559','San José','DISTR_00000188');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000189','San Antonio del Mosco','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001560','San Diego','DISTR_00000189');
INSERT INTO AAC_Canton VALUES ('CANTON_00001561','San Marcos','DISTR_00000189');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000190','San Gerardo','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001562','La Laguna','DISTR_00000190');
INSERT INTO AAC_Canton VALUES ('CANTON_00001563','La Joya','DISTR_00000190');
INSERT INTO AAC_Canton VALUES ('CANTON_00001564','Quebracho','DISTR_00000190');
INSERT INTO AAC_Canton VALUES ('CANTON_00001565','San Jerónimo','DISTR_00000190');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000191','San Jorge','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001566','Candelaria','DISTR_00000191');
INSERT INTO AAC_Canton VALUES ('CANTON_00001567','El Roble','DISTR_00000191');
INSERT INTO AAC_Canton VALUES ('CANTON_00001568','Joya de Ventura','DISTR_00000191');
INSERT INTO AAC_Canton VALUES ('CANTON_00001569','La Ceiba','DISTR_00000191');
INSERT INTO AAC_Canton VALUES ('CANTON_00001570','La Morita','DISTR_00000191');
INSERT INTO AAC_Canton VALUES ('CANTON_00001571','San Julián','DISTR_00000191');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000192','San Luis de La Reina','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001572','Junquillo','DISTR_00000192');
INSERT INTO AAC_Canton VALUES ('CANTON_00001573','Ostucal','DISTR_00000192');
INSERT INTO AAC_Canton VALUES ('CANTON_00001574','San Antonio','DISTR_00000192');
INSERT INTO AAC_Canton VALUES ('CANTON_00001575','San Juan','DISTR_00000192');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000193','San Rafael Oriente','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001576','Los Zelaya','DISTR_00000193');
INSERT INTO AAC_Canton VALUES ('CANTON_00001577','Piedra Azul','DISTR_00000193');
INSERT INTO AAC_Canton VALUES ('CANTON_00001578','Rodeo de Pedrón','DISTR_00000193');
INSERT INTO AAC_Canton VALUES ('CANTON_00001579','Santa Clara','DISTR_00000193');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000194','Sesori','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001580','Charlaca','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001581','El Espíritu Santo','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001583','El Tablón','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001584','Las Mesas','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001585','Manahuare','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001586','Masatepeque','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001587','Minitas','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001588','Petacones','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001589','San Jacinto','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001590','San Sebastián','DISTR_00000194');
INSERT INTO AAC_Canton VALUES ('CANTON_00001591','Santa Rosa','DISTR_00000194');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000195','Uluazapa','PROVIN_00000011');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001592','Juan Yanes','DISTR_00000195');
INSERT INTO AAC_Canton VALUES ('CANTON_00001593','Los Pilones','DISTR_00000195');
INSERT INTO AAC_Canton VALUES ('CANTON_00001594','Río Vargas','DISTR_00000195');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - USULUTÁN */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000196','Usulután','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001595','Buenavista','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001596','El Cerrito','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001597','El Obrajuelo','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001598','El Ojo de Agua','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001599','El Ojuste','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001600','El Talpetate','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001601','El Trillo','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001602','La Joya de Tomasico','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001603','La Laguna','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001604','La Peña','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001605','La Presa','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001606','La Presa','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001607','Las Salinas','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001608','Palo Galán','DISTR_00000196');
INSERT INTO AAC_Canton VALUES ('CANTON_00001609','Santa Bárbara','DISTR_00000196');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000197','Alegría','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001610','Apastepeque','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001611','El Quebracho','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001612','El Zapotillo','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001613','La Montañita','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001614','La Peña','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001615','Las Casitas','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001616','San Juan','DISTR_00000197');
INSERT INTO AAC_Canton VALUES ('CANTON_00001617','Yomo','DISTR_00000197');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000198','Berlín','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001618','Colón','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001619','Concepción','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001620','El Corozal','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001621','El Tablón','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001622','La Unión','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001623','Las Delicias','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001624','Las Piletas','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001625','Los Talpetales','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001626','San Felipe','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001627','San Francisco','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001628','San Isidro','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001629','San José','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001630','San Juan Loma Alta','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001631','San Lorenzo','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001632','Santa Cruz','DISTR_00000198');
INSERT INTO AAC_Canton VALUES ('CANTON_00001633','Virginia','DISTR_00000198');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_0000199','California','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001634','El Pozón','DISTR_00000199');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000200','Concepción Batres','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001635','El Cañal','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001636','El Paraisal','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001637','El Porvenir','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001638','Hacienda Nueva','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001639','La Anchila','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001640','La Danta','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001641','San Antonio','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001642','San Felipe','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001643','San Ildefonso','DISTR_00000200');
INSERT INTO AAC_Canton VALUES ('CANTON_00001644','San Pedro','DISTR_00000200');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000201','El Triunfo','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001645','El Jicarito','DISTR_00000201');
INSERT INTO AAC_Canton VALUES ('CANTON_00001646','La Palmera','DISTR_00000201');
INSERT INTO AAC_Canton VALUES ('CANTON_00001647','Los Novillos','DISTR_00000201');
INSERT INTO AAC_Canton VALUES ('CANTON_00001648','San Antonio','DISTR_00000201');
INSERT INTO AAC_Canton VALUES ('CANTON_00001649','Santa Clara del Palón','DISTR_00000201');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000202','Ereguayquín','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001650','Analco','DISTR_00000202');
INSERT INTO AAC_Canton VALUES ('CANTON_00001651','Encuentros','DISTR_00000202');
INSERT INTO AAC_Canton VALUES ('CANTON_00001652','El Maculis','DISTR_00000202');
INSERT INTO AAC_Canton VALUES ('CANTON_00001653','La Ceiba','DISTR_00000202');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000203','Estanzuelas','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001654','Caragual','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001655','Condadillo','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001656','Escarbadero','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001657','La Cruz','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001658','Ojuate','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001659','Potrero de José','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001660','San Pedro','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001661','Sitio de San Antonio','DISTR_00000203');
INSERT INTO AAC_Canton VALUES ('CANTON_00001662','Tecomatal','DISTR_00000203');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000204','Jiquilisco','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001663','Aguacayo','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001664','Bolívar','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001665','Cabos Negros','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001666','California','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001667','Cruzadilla de San Juan','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001668','Ceiba Gacha','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001669','El Carmen','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001670','El Carrizal','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001671','El Castaño','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001672','El Coyolito','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001673','El Paraíso','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001674','Hule Chacho','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001675','Isla Méndez','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001676','La Canoa','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001677','La Concordia','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001678','La Esperanza','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001679','La Montañona','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001680','La Nuria','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001681','La Tirana','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001682','Las Delicias','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001683','Las Flores','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001684','Los Campos','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001685','Los Limones','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001686','Los Tres Chorros','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001687','Nueva California','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001688','Puerto Avalos','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001689','Roquinte','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001690','Salinas del Potrero','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001691','Salinas Sisiguayo','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001692','Salinas Zamorano','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001693','San Antonio Potrerillos','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001694','San José','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001695','San Juan de Letrán','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001696','San Juan del Gozo','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001697','San Judas','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001698','San Marcos Lempa','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001699','San Pedro','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001700','Taburete Claros','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001701','Taburete Jagual','DISTR_00000204');
INSERT INTO AAC_Canton VALUES ('CANTON_00001702','Tierra Blanca','DISTR_00000204');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000205','Jucuapa','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001703','El Amatón','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001704','El Chaguite','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001705','El Níspero','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001706','El Plan Grande','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001707','Loma de la Cruz','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001708','Llano del Chilamate','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001709','Llano Grande de las Piedras','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001710','Tapesquillo Alto','DISTR_00000205');
INSERT INTO AAC_Canton VALUES ('CANTON_00001711','Tapesquillo Bajo','DISTR_00000205');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000206','Jucuarán','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001712','El Jicaro','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001713','El Jutal','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001714','El Llano','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001715','El Zapote','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001716','La Cruz','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001717','El Progreso','DISTR_00000206');
INSERT INTO AAC_Canton VALUES ('CANTON_00001718','Samuria','DISTR_00000206');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000207','Mercedes Umaña','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001719','El Caulote','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001720','El Jícaro','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001721','El Jocotillo','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001722','La Montañita','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001723','La Puerta','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001724','Los Horcones','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001725','Los Talnetes','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001726','San Benito','DISTR_00000207');
INSERT INTO AAC_Canton VALUES ('CANTON_00001727','Santa Anita','DISTR_00000207');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000208','Nueva Granada','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001728','Azacualpía de Gualcho','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001729','Azacualpía del Joco','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001730','El Amatillo','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001731','El Carrizal','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001732','Jocomontique','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001733','La Isleta','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001734','La Palomía','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001735','Las Llaves','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001736','Lepaz','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001737','Potrero de Joco','DISTR_00000208');
INSERT INTO AAC_Canton VALUES ('CANTON_00001738','San José','DISTR_00000208');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000209','Ozatlán','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001739','El Delirio','DISTR_00000209');
INSERT INTO AAC_Canton VALUES ('CANTON_00001740','El Palmital','DISTR_00000209');
INSERT INTO AAC_Canton VALUES ('CANTON_00001741','Joya del Pilar','DISTR_00000209');
INSERT INTO AAC_Canton VALUES ('CANTON_00001742','La Breña','DISTR_00000209');
INSERT INTO AAC_Canton VALUES ('CANTON_00001743','La Poza','DISTR_00000209');
INSERT INTO AAC_Canton VALUES ('CANTON_00001744','Las Trancas','DISTR_00000209');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000210','Puerto El Triunfo','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001745','Corral de Mulas','DISTR_00000210');
INSERT INTO AAC_Canton VALUES ('CANTON_00001746','Sitio de Santa Lucía','DISTR_00000210');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000211','San Agustín','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001747','Buenos Aires','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001748','El Corozo','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001749','El Desparramo','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001750','El Jícaro','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001751','El Jocote','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001752','El Rodeo','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001753','El Zapote','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001754','Galingagua','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001755','Joval Arrozales','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001756','La Montaña','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001757','La Mora','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001758','La Quesera','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001759','Las Ceibas','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001760','Linares','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001761','Los Arrozales','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001762','Los Eucaliptos','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001763','Los Planes','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001764','Nombre de Dios','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001765','San Antonio','DISTR_00000211');
INSERT INTO AAC_Canton VALUES ('CANTON_00001766','Tres Calles','DISTR_00000211');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000212','San Buenaventura','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001767','El Aceituno','DISTR_00000212');
INSERT INTO AAC_Canton VALUES ('CANTON_00001768','El Semillero','DISTR_00000212');
INSERT INTO AAC_Canton VALUES ('CANTON_00001769','La Caridad','DISTR_00000212');
INSERT INTO AAC_Canton VALUES ('CANTON_00001770','La Tronconada','DISTR_00000212');
INSERT INTO AAC_Canton VALUES ('CANTON_00001771','Los Charcos','DISTR_00000212');
INSERT INTO AAC_Canton VALUES ('CANTON_00001772','Los Espinos','DISTR_00000212');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000213','San Dionisio','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001773','Iglesia Vieja','DISTR_00000213');
INSERT INTO AAC_Canton VALUES ('CANTON_00001774','Mundo Nuevo','DISTR_00000213');
INSERT INTO AAC_Canton VALUES ('CANTON_00001775','San Francisco','DISTR_00000213');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000214','San Francisco Javier','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001776','El Palmo','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001777','El Tablón','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001778','El Zúngano','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001779','Joval Hornos','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001780','La Cruz','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001781','La Peña','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001782','Los Horcones','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001783','Los Hornos','DISTR_00000214');
INSERT INTO AAC_Canton VALUES ('CANTON_00001784','Los Ríos','DISTR_00000214');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000215','Santa Elena','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001785','Cerro El Nansal','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001786','El Nisperal','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001787','El Rebalse','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001788','El Volcán','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001789','Joya Ancha Abajo','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001790','Joya Ancha Arriba','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001791','Las Cruces','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001792','Los Amates','DISTR_00000215');
INSERT INTO AAC_Canton VALUES ('CANTON_00001793','Piedra de Agua','DISTR_00000215');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000216','Santa María','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001794','Mejicalpa','DISTR_00000216');
INSERT INTO AAC_Canton VALUES ('CANTON_00001795','San Francisco','DISTR_00000216');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000217','Santiago de María','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001796','Cerro Verde','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001797','Batres','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001798','El Marquezado','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001799','El Tigre','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001800','Las Flores','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001801','Las Playas','DISTR_00000217');
INSERT INTO AAC_Canton VALUES ('CANTON_00001802','Loma de Los Gonzáles','DISTR_00000217');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000218','Tecapán','PROVIN_00000012');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001803','El Cerro Verde','DISTR_00000218');
INSERT INTO AAC_Canton VALUES ('CANTON_00001804','El Jícaro','DISTR_00000218');
INSERT INTO AAC_Canton VALUES ('CANTON_00001805','El Paso de Gualacho','DISTR_00000218');
INSERT INTO AAC_Canton VALUES ('CANTON_00001806','Los Chapetones','DISTR_00000218');
INSERT INTO AAC_Canton VALUES ('CANTON_00001807','Los Horcones','DISTR_00000218');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - MORAZÁN */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000219','San Francisco Gotera','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001808','Cacahuatalejo','DISTR_00000219');
INSERT INTO AAC_Canton VALUES ('CANTON_00001809','El Norte','DISTR_00000219');
INSERT INTO AAC_Canton VALUES ('CANTON_00001810','El Rosario','DISTR_00000219');
INSERT INTO AAC_Canton VALUES ('CANTON_00001811','El Triunfo','DISTR_00000219');
INSERT INTO AAC_Canton VALUES ('CANTON_00001812','San Francisquito','DISTR_00000219');
INSERT INTO AAC_Canton VALUES ('CANTON_00001813','San José','DISTR_00000219');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000220','Arambala','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001814','El Carrizal','DISTR_00000220');
INSERT INTO AAC_Canton VALUES ('CANTON_00001815','Nahuaterique','DISTR_00000220');
INSERT INTO AAC_Canton VALUES ('CANTON_00001816','Pueblo Viejo','DISTR_00000220');
INSERT INTO AAC_Canton VALUES ('CANTON_00001817','Tierra Colorada','DISTR_00000220');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000221','Cacaopera','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001818','Agua Blanca','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001819','Calavera','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001820','Estancia','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001821','Guachipilín','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001822','Junquillo','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001823','Ocotillo','DISTR_00000221');
INSERT INTO AAC_Canton VALUES ('CANTON_00001824','Sunsulaca','DISTR_00000221');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000222','Chilanga','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001825','Chaparral','DISTR_00000222');
INSERT INTO AAC_Canton VALUES ('CANTON_00001826','Joya del Matazano','DISTR_00000222');
INSERT INTO AAC_Canton VALUES ('CANTON_00001827','Lajitas','DISTR_00000222');
INSERT INTO AAC_Canton VALUES ('CANTON_00001828','Pedernal','DISTR_00000222');
INSERT INTO AAC_Canton VALUES ('CANTON_00001829','Piedra Parada','DISTR_00000222');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000223','Corinto','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001830','Corralito','DISTR_00000223');
INSERT INTO AAC_Canton VALUES ('CANTON_00001831','Hondablo','DISTR_00000223');
INSERT INTO AAC_Canton VALUES ('CANTON_00001832','Laguna','DISTR_00000223');
INSERT INTO AAC_Canton VALUES ('CANTON_00001833','San Felipe','DISTR_00000223');
INSERT INTO AAC_Canton VALUES ('CANTON_00001834','Varilla Negra','DISTR_00000223');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000224','Delicias de Concepción','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001835','El Volcán','DISTR_00000224');
INSERT INTO AAC_Canton VALUES ('CANTON_00001836','La Cuchilla','DISTR_00000224');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000225','El Divisadero','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001837','La Cañada','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001838','Loma Larga','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001839','Loma Tendida','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001840','Llano de Santiago','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001841','San Pedro','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001842','Santa Anita','DISTR_00000225');
INSERT INTO AAC_Canton VALUES ('CANTON_00001843','Villa Modelo','DISTR_00000225');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000226','El Rosario','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001844','La Laguna','DISTR_00000226');
INSERT INTO AAC_Canton VALUES ('CANTON_00001845','Ojos de Agua','DISTR_00000226');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000227','Gualococti','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001846','La Joya','DISTR_00000227');
INSERT INTO AAC_Canton VALUES ('CANTON_00001847','San Lucas','DISTR_00000227');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000228','Guatajiagua','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001848','Abolinos','DISTR_00000228');
INSERT INTO AAC_Canton VALUES ('CANTON_00001849','Cirigual','DISTR_00000228');
INSERT INTO AAC_Canton VALUES ('CANTON_00001850','Maiguera','DISTR_00000228');
INSERT INTO AAC_Canton VALUES ('CANTON_00001851','Pajigua','DISTR_00000228');
INSERT INTO AAC_Canton VALUES ('CANTON_00001852','San Bartolo','DISTR_00000228');
INSERT INTO AAC_Canton VALUES ('CANTON_00001853','Volcán','DISTR_00000228');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000229','Joateca','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001854','Paturia','DISTR_00000229');
INSERT INTO AAC_Canton VALUES ('CANTON_00001855','Volcancillo','DISTR_00000229');
INSERT INTO AAC_Canton VALUES ('CANTON_00001856','Zapotal','DISTR_00000229');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000230','Jocoaitique','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001857','El Rodeo','DISTR_00000230');
INSERT INTO AAC_Canton VALUES ('CANTON_00001858','Volcancillo','DISTR_00000230');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000231','Jocoro','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001859','Flamenco','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001860','Guachipilín','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001861','Lagunetas','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001862','Laureles','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001863','Las Marías','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001864','San Felipe','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001865','San José','DISTR_00000231');
INSERT INTO AAC_Canton VALUES ('CANTON_00001866','San Juan','DISTR_00000231');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000232','Lolotiquillo','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001867','Gualindo','DISTR_00000232');
INSERT INTO AAC_Canton VALUES ('CANTON_00001868','Manzanilla','DISTR_00000232');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000233','Meanguera','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001869','Cerro Prado','DISTR_00000233');
INSERT INTO AAC_Canton VALUES ('CANTON_00001870','Guacamaya','DISTR_00000233');
INSERT INTO AAC_Canton VALUES ('CANTON_00001871','La Joya','DISTR_00000233');
INSERT INTO AAC_Canton VALUES ('CANTON_00001872','Soledad','DISTR_00000233');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000234','Osicala','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001873','Agua Zarca','DISTR_00000234');
INSERT INTO AAC_Canton VALUES ('CANTON_00001874','Cerro El Coyol','DISTR_00000234');
INSERT INTO AAC_Canton VALUES ('CANTON_00001875','Huilihuiste','DISTR_00000234');
INSERT INTO AAC_Canton VALUES ('CANTON_00001876','La Montaña','DISTR_00000234');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000235','Perquín','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001877','Casa Blanca','DISTR_00000235');
INSERT INTO AAC_Canton VALUES ('CANTON_00001878','Las Trojas','DISTR_00000235');
INSERT INTO AAC_Canton VALUES ('CANTON_00001879','Sabanetas','DISTR_00000235');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000236','San Carlos','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001880','La Jagua','DISTR_00000236');
INSERT INTO AAC_Canton VALUES ('CANTON_00001881','San Diego','DISTR_00000236');
INSERT INTO AAC_Canton VALUES ('CANTON_00001882','San Marcos','DISTR_00000236');
INSERT INTO AAC_Canton VALUES ('CANTON_00001883','Valle Nuevo','DISTR_00000236');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000237','San Fernando','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001884','Azacualpa','DISTR_00000237');
INSERT INTO AAC_Canton VALUES ('CANTON_00001885','Cañaverales','DISTR_00000237');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000238','San Isidro','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001886','El Rosario','DISTR_00000238');
INSERT INTO AAC_Canton VALUES ('CANTON_00001887','Piedra Parada','DISTR_00000238');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000239','San Simón','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001888','El Carrizal','DISTR_00000239');
INSERT INTO AAC_Canton VALUES ('CANTON_00001889','El Cerro','DISTR_00000239');
INSERT INTO AAC_Canton VALUES ('CANTON_00001890','Las Quebradas','DISTR_00000239');
INSERT INTO AAC_Canton VALUES ('CANTON_00001891','Potrero de Adentro','DISTR_00000239');
INSERT INTO AAC_Canton VALUES ('CANTON_00001892','San Francisco','DISTR_00000239');
INSERT INTO AAC_Canton VALUES ('CANTON_00001893','Valle Grande','DISTR_00000239');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000240','Sensembra','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001894','El Limón','DISTR_00000240');
INSERT INTO AAC_Canton VALUES ('CANTON_00001895','El Rodeo','DISTR_00000240');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000241','Sociedad','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001896','Animas','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001897','Bejucal','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001898','Calpules','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001899','Candelaria','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001900','El Tablón','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001901','Labranza','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001902','La Joya','DISTR_00000241');
INSERT INTO AAC_Canton VALUES ('CANTON_00001903','Peñón','DISTR_00000241');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000242','Torola','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001904','Agua Zarca','DISTR_00000242');
INSERT INTO AAC_Canton VALUES ('CANTON_00001905','Cerritos','DISTR_00000242');
INSERT INTO AAC_Canton VALUES ('CANTON_00001906','Progreso','DISTR_00000242');
INSERT INTO AAC_Canton VALUES ('CANTON_00001907','Tijeretas','DISTR_00000242');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000243','Yamabal','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001908','El Chile','DISTR_00000243');
INSERT INTO AAC_Canton VALUES ('CANTON_00001909','Joya de Matazano','DISTR_00000243');
INSERT INTO AAC_Canton VALUES ('CANTON_00001910','San Francisquito','DISTR_00000243');
INSERT INTO AAC_Canton VALUES ('CANTON_00001911','San Juan','DISTR_00000243');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000244','Yoloaiquín','PROVIN_00000013');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001912','El Aceituno','DISTR_00000244');
INSERT INTO AAC_Canton VALUES ('CANTON_00001913','El Volcán','DISTR_00000244');
/*EL SALVADOR - DISTRITOS 
(MUNICIPIOS) - LA UNIÓN */
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000245','La Unión','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001914','Agua Caliente','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001915','Agua Escondida','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001916','Amapalita','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001917','El Jícaro','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001918','La Quezadilla','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001919','Sirama','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001920','Tihuilotal','DISTR_00000245');
INSERT INTO AAC_Canton VALUES ('CANTON_00001921','Volcancillo','DISTR_00000245');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000246','Anamorós','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001922','Agua Blanca','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001923','Cedros','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001924','El Carbonal','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001925','El Cordoncillo','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001926','El Tizate','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001927','Huertas Viejas','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001928','Terroritos','DISTR_00000246');
INSERT INTO AAC_Canton VALUES ('CANTON_00001929','Tulima','DISTR_00000246');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000247','Bolívar','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001930','Albornos','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001931','Candelaria Albornos','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001932','El Tránsito','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001933','Guadalupe','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001934','Joya de Las Tunas','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001935','La Rinconada','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001936','La Paz','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001937','Nueva Guadalupe','DISTR_00000247');
INSERT INTO AAC_Canton VALUES ('CANTON_00001938','Santa Lucía','DISTR_00000247');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000248','Concepción de Oriente','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001939','El Guayabo','DISTR_00000248');
INSERT INTO AAC_Canton VALUES ('CANTON_00001940','El Molino','DISTR_00000248');
INSERT INTO AAC_Canton VALUES ('CANTON_00001941','El Zapote','DISTR_00000248');
INSERT INTO AAC_Canton VALUES ('CANTON_00001942','Gueripe','DISTR_00000248');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000249','Conchagua','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001943','Cerro El Jiote','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001944','Conchaguita','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001945','El Cacao','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001946','El Ciprés','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001947','El Faro','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001948','El Pilón','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001949','El Tamarindo','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001950','Huisquil','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001951','Los Ángeles','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001952','Llano de Los Patos','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001953','Maquigue','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001954','Piedra Blanca','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001955','Piedra Rayada','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001956','Playas Negras','DISTR_00000249');
INSERT INTO AAC_Canton VALUES ('CANTON_00001957','Yologual','DISTR_00000249');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000250','El Carmen','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001958','Alto El Roble','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001959','Caulotillo','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001960','El Gavilán','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001961','El Piche','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001962','El Tejar','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001963','El Zapotal','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001964','La Cañada','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001965','Los Conejos','DISTR_00000250');
INSERT INTO AAC_Canton VALUES ('CANTON_00001966','Olomega','DISTR_00000250');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000251','El Sauce','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001967','Canaire','DISTR_00000251');
INSERT INTO AAC_Canton VALUES ('CANTON_00001968','El Rincón','DISTR_00000251');
INSERT INTO AAC_Canton VALUES ('CANTON_00001969','San Juan','DISTR_00000251');
INSERT INTO AAC_Canton VALUES ('CANTON_00001970','Santa Rosita','DISTR_00000251');
INSERT INTO AAC_Canton VALUES ('CANTON_00001971','Talpetate','DISTR_00000251');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000252','Intipucá','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001972','El Carao','DISTR_00000252');
INSERT INTO AAC_Canton VALUES ('CANTON_00001973','La Leona','DISTR_00000252');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000253','Lislique','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001974','Agua Fría','DISTR_00000253');
INSERT INTO AAC_Canton VALUES ('CANTON_00001975','Derrumbado','DISTR_00000253');
INSERT INTO AAC_Canton VALUES ('CANTON_00001976','Guajiniquil','DISTR_00000253');
INSERT INTO AAC_Canton VALUES ('CANTON_00001977','Higueras','DISTR_00000253');
INSERT INTO AAC_Canton VALUES ('CANTON_00001978','Pilas','DISTR_00000253');
INSERT INTO AAC_Canton VALUES ('CANTON_00001979','Terrero','DISTR_00000253');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000254','Meanguera del Golfo','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001980','Conacastal o Guanacastal','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001981','El Corozal','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001982','El Salador o El Zambullido','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001983','Guerrero o El Majahual','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001984','Isla Conchagüita','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001985','Isla Meanguerita','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001986','La Negra','DISTR_00000254');
INSERT INTO AAC_Canton VALUES ('CANTON_00001987','La Periquera','DISTR_00000254');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000255','Nueva Esparta','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001988','El Ocotillo','DISTR_00000255');
INSERT INTO AAC_Canton VALUES ('CANTON_00001989','El Portillo','DISTR_00000255');
INSERT INTO AAC_Canton VALUES ('CANTON_00001990','Honduritas','DISTR_00000255');
INSERT INTO AAC_Canton VALUES ('CANTON_00001991','Las Marías','DISTR_00000255');
INSERT INTO AAC_Canton VALUES ('CANTON_00001992','Monteca','DISTR_00000255');
INSERT INTO AAC_Canton VALUES ('CANTON_00001993','Talpetate','DISTR_00000255');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000256','Pasaquina','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00001994','Cerro Pelón','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00001995','Horcones','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00001996','El Rebalse','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00001997','El Tablón','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00001998','Piedras Blancas','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00001999','San Eduardo','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00002000','San Felipe','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00002001','Santa Clara','DISTR_00000256');
INSERT INTO AAC_Canton VALUES ('CANTON_00002002','Valle Afuera','DISTR_00000256');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000257','Polorós','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002003','Boquín','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002004','Carpintero','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002005','Lajitas','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002006','Mala Laja','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002007','Ocote','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002008','Pueblo','DISTR_00000257');
INSERT INTO AAC_Canton VALUES ('CANTON_00002009','Rodeo','DISTR_00000257');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000258','San Alejo','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002010','Agua Fría','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002011','Bobadilla','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002012','Ceibitas','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002013','Cerco de Piedra','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002014','Copalío','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002015','El Caragón','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002016','El Tamarindo','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002017','El Tizatillo','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002018','Hato Nuevo','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002019','Las Queseras','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002020','Los Jiotes','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002021','Mogotillo','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002022','San Jerónimo','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002023','San José','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002024','Santa Cruz','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002025','Tempique','DISTR_00000258');
INSERT INTO AAC_Canton VALUES ('CANTON_00002026','Terreno Blanco','DISTR_00000258');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000259','San José La Fuente','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002027','El Chaguitillo','DISTR_00000259');
INSERT INTO AAC_Canton VALUES ('CANTON_00002028','El Sombrerito','DISTR_00000259');
INSERT INTO AAC_Canton VALUES ('CANTON_00002029','El Zapote','DISTR_00000259');
INSERT INTO AAC_Canton VALUES ('CANTON_00002030','La Joya','DISTR_00000259');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000260','Santa Rosa de Lima','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002031','Copetillo','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002032','El Algodón','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002033','El Portillo','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002034','La Chorrera','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002035','Las Cañas','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002036','Los Mojones','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002037','Pasaquinita','DISTR_00000260');
INSERT INTO AAC_Canton VALUES ('CANTON_00002038','San Sebastián','DISTR_00000260');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000261','Yayantique','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002039','El Centeno','DISTR_00000261');
INSERT INTO AAC_Canton VALUES ('CANTON_00002040','El Pastor','DISTR_00000261');
INSERT INTO AAC_Canton VALUES ('CANTON_00002041','El Socorro','DISTR_00000261');
INSERT INTO AAC_Canton VALUES ('CANTON_00002042','Los Amates','DISTR_00000261');
-- District El Salvador -- Municipios
INSERT INTO AAC_District VALUES ('DISTR_00000262','Yucuaiquín','PROVIN_00000014');
-- Canton El Salvador 
INSERT INTO AAC_Canton VALUES ('CANTON_00002043','Candelaria','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002044','Ciricuario','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002045','La Cañada','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002046','Las Marías','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002047','Los Hatillos','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002048','Tepemechín','DISTR_00000262');
INSERT INTO AAC_Canton VALUES ('CANTON_00002049','Valle Nuevo','DISTR_00000262');



-- Country -- Honduras
INSERT INTO AAC_Country VALUES ('COUNTR_007','Honduras');

-- Country -- Costa Rica
INSERT INTO AAC_Country VALUES ('COUNTR_008','Costa Rica');

-- Country -- Costa Rica
INSERT INTO AAC_Country VALUES ('COUNTR_009','Panamá');





-- Provinces Nicaragua
INSERT INTO AAC_Province VALUES ('PROVIN_015','Boaco','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_016','Carazo','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_017','Chinandega','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_018','Chontales','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_019','Estelí','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_020','Granada','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_021','Jinotega','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_022','León','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_023','Madriz','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_024','Managua','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_025','Masaya','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_026','Matagalpa','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_027','Nueva Segovia','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_028','Río San Juan','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_029','Rivas','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_030','Atlántico Norte','COUNTR_001');
INSERT INTO AAC_Province VALUES ('PROVIN_031','Atlántico Sur','COUNTR_001');
-- Canton Nicaragua
INSERT INTO AAC_Canton VALUES ('CANTON_015','Boaco','PROVIN_015');
INSERT INTO AAC_Canton VALUES ('CANTON_016','Jinotepe','PROVIN_016');
INSERT INTO AAC_Canton VALUES ('CANTON_017','Chinandega','PROVIN_017');
INSERT INTO AAC_Canton VALUES ('CANTON_018','Juigalpa','PROVIN_018');
INSERT INTO AAC_Canton VALUES ('CANTON_019','Estelí','PROVIN_019');
INSERT INTO AAC_Canton VALUES ('CANTON_020','Granada','PROVIN_020');
INSERT INTO AAC_Canton VALUES ('CANTON_021','Jinotega','PROVIN_021');
INSERT INTO AAC_Canton VALUES ('CANTON_022','León','PROVIN_022');
INSERT INTO AAC_Canton VALUES ('CANTON_023','Somoto','PROVIN_023');
INSERT INTO AAC_Canton VALUES ('CANTON_024','Managua','PROVIN_024');
INSERT INTO AAC_Canton VALUES ('CANTON_025','Masaya','PROVIN_025');
INSERT INTO AAC_Canton VALUES ('CANTON_026','Matagalpa','PROVIN_026');
INSERT INTO AAC_Canton VALUES ('CANTON_027','Ocotal','PROVIN_027');
INSERT INTO AAC_Canton VALUES ('CANTON_028','San Carlos','PROVIN_028');
INSERT INTO AAC_Canton VALUES ('CANTON_029','Rivas','PROVIN_029');
INSERT INTO AAC_Canton VALUES ('CANTON_030','Puerto Cabezas','PROVIN_030');
INSERT INTO AAC_Canton VALUES ('CANTON_031','Bluefields','PROVIN_031');

-- District Nicaragua -- Municipios -- Boaco
INSERT INTO AAC_District VALUES ('DISTR_030','Boaco','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_031','Camoapa','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_032','San José De Los Remates','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_033','San Lorenzo','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_034','Santa Lucía','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_035','Teustepe','CANTON_015');



INSERT INTO AAC_District VALUES ('DISTR_036','Masahuat','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_037','Metapán','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_039','San Antonio Pajonal','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_040','San Sebastián Salitrillo','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_041','Santa Rosa Guachipilín','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_042','Santiago De La Frontera','CANTON_015');
INSERT INTO AAC_District VALUES ('DISTR_043','Texistepeque','CANTON_015');
