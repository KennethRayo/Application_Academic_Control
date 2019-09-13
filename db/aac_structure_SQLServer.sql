
-- Volcando estructura de base de datos para aac
DROP DATABASE IF EXISTS aac;
CREATE DATABASE `aac` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE [aac];


-- Volcando estructura para tabla aac.aac_career
DROP TABLE IF EXISTS [aac_branchOffice];
CREATE TABLE aac_branchOffice (
  [ID_BranchOffice] varchar(50) NOT NULL,
  [Description_branchOffice] varchar(250) DEFAULT NULL,
  [ID_Country] varchar(50) DEFAULT NULL,
  [ID_Province] varchar(50) DEFAULT NULL,
  [ID_District] varchar(50) DEFAULT NULL,
  [ID_Canton] varchar(50) DEFAULT NULL,
  [Status_branchOffice] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_branchOffice])
) ;

-- Volcando datos para la tabla aac.aac_profile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_branchOffice` DISABLE KEYS */;
INSERT INTO aac_branchOffice ([ID_BranchOffice], [Description_branchOffice], [ID_Country], 
		[ID_Province], [ID_District], [ID_Canton], [Status_branchOffice]) VALUES
	('BRANCHOF_001', 'UNADENIC Central Nicaragua', 'COUNTR_002', 'PROVIN_00000015', 'DISTR_00000263', 'CANTON_00002152', 'Habilitado');
/*!40000 ALTER TABLE `aac_branchOffice` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_person
DROP TABLE IF EXISTS [aac_person];
CREATE TABLE aac_person (
  [ID_Person] varchar(50) NOT NULL,
  [Name_Person] varchar(200) DEFAULT NULL,
  [Surname_Person] varchar(200) DEFAULT NULL,
  [Lastname_Person] varchar(200) DEFAULT NULL,
  [IdentificationType_Person] varchar(100) DEFAULT NULL,
  [Identification_Person] varchar(100) DEFAULT NULL,
  [Gender_Person] varchar(100) DEFAULT NULL,
  [Birthday_Person] varchar(100) DEFAULT NULL,
  [ID_Country] varchar(50) DEFAULT NULL,
  [ID_Province] varchar(50) DEFAULT NULL,
  [ID_District] varchar(50) DEFAULT NULL,
  [ID_Canton] varchar(50) DEFAULT NULL,
  [ID_BranchOffice] varchar(50) DEFAULT NULL,
  [CivilStatus_Person] varchar(100) DEFAULT NULL,
  [CellPhone_Person] varchar(50) DEFAULT NULL,
  [Email_Person] varchar(200) DEFAULT NULL,
  [HomeAddress_Person] varchar(250) DEFAULT NULL,
  [Status_Person] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_Person])
 ,
  CONSTRAINT [Relation_to_BranchOffice01] FOREIGN KEY ([ID_BranchOffice]) REFERENCES aac_branchOffice ([ID_BranchOffice])
) ;

CREATE INDEX [Relation_to_BranchOffice01] ON aac_person ([ID_BranchOffice]);

-- Volcando datos para la tabla aac.aac_person: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_person` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_profile
DROP TABLE IF EXISTS [aac_profile];
CREATE TABLE aac_profile (
  [ID_Profile] varchar(50) NOT NULL,
  [Name_Profile] varchar(100) DEFAULT NULL,
  [State_Profile] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([ID_Profile])
) ;

-- Volcando datos para la tabla aac.aac_profile: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_profile` DISABLE KEYS */;
INSERT INTO aac_profile ([ID_Profile], [Name_Profile], [State_Profile]) VALUES
	('PROF_001', 'Administrador', 'Habilitado');
/*!40000 ALTER TABLE `aac_profile` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_career
DROP TABLE IF EXISTS [AAC_user];
CREATE TABLE AAC_user (
  [ID_Person] varchar(50) NOT NULL,
  [Password_User] varchar(200) DEFAULT NULL,
  [ID_Profile] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([ID_Person])
 ,
  CONSTRAINT [Relation_to_Person01] FOREIGN KEY ([ID_Person]) REFERENCES AAC_Person ([ID_Person])
 ,
  CONSTRAINT [Relation_to_Profile01] FOREIGN KEY ([ID_Profile]) REFERENCES AAC_Profile ([ID_Profile])
) ;

CREATE INDEX ([ID_Person]);
CREATE INDEX ([ID_Person]);

-- Volcando datos para la tabla aac.aac_user: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_user` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_career
DROP TABLE IF EXISTS [aac_career];
CREATE TABLE aac_career (
  [ID_Career] varchar(50) NOT NULL,
  [Description_Career] varchar(250) DEFAULT NULL,
  [ID_Person] varchar(50) DEFAULT NULL,
  [OpeningDate_Career] varchar(100) DEFAULT NULL,
  [State_Career] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_Career])
 ,
  CONSTRAINT [Relation_to_CIF02] FOREIGN KEY ([ID_Person]) REFERENCES aac_cif ([ID_Person])
) ;

CREATE INDEX [Relation_to_CIF02] ON aac_career ([ID_Person]);

-- Volcando datos para la tabla aac.aac_career: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_career` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_career` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_level
DROP TABLE IF EXISTS [aac_level];
CREATE TABLE aac_level (
  [ID_Level] varchar(50) NOT NULL,
  [OpenningDate_Level] varchar(100) DEFAULT NULL,
  [AcademicGrade_Level] varchar(250) DEFAULT NULL,
  [Description_Level] varchar(250) DEFAULT NULL,
  [Enphatic_Level] varchar(250) DEFAULT NULL,
  [Credits_Level] int DEFAULT NULL,
  [ID_Career] varchar(50) DEFAULT NULL,
  [ID_BranchOffice] varchar(50) DEFAULT NULL,
  [MinimumNote_Level] int DEFAULT NULL,
  [State_Level] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_Level])
 ,
  CONSTRAINT [Relation_to_Career01] FOREIGN KEY ([ID_Career]) REFERENCES aac_career ([ID_Career])
 ,
  CONSTRAINT [Relation_to_BranchOffice02] FOREIGN KEY ([ID_BranchOffice]) REFERENCES aac_branchOffice ([ID_BranchOffice])
) ;

CREATE INDEX [Relation_to_Career01] ON aac_level ([ID_Career]);
CREATE INDEX [Relation_to_BranchOffice02] ON aac_level ([ID_BranchOffice]);

-- Volcando datos para la tabla aac.aac_level: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_level` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_cif
DROP TABLE IF EXISTS [aac_cif];
CREATE TABLE aac_cif (
  [ID_Person] varchar(50) NOT NULL,
  [PaymentMethod_CIF] varchar(100) DEFAULT NULL,
  [Denomination_CIF] varchar(100) DEFAULT NULL,
  [DateOfAdmission_CIF] varchar(100) DEFAULT NULL,
  [Classification_CIF] varchar(250) DEFAULT NULL,
  [TypeOfCurrency_CIF] varchar(250) DEFAULT NULL,
  PRIMARY KEY ([ID_Person]),
  CONSTRAINT [Relation_to_Person02] FOREIGN KEY ([ID_Person]) REFERENCES aac_person ([ID_Person])
) ;

-- Volcando datos para la tabla aac.aac_cif: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_cif` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_cif` ENABLE KEYS */;

-- Volcando estructura para tabla aac.aac_ciftype
DROP TABLE IF EXISTS [aac_ciftype];
CREATE TABLE aac_ciftype (
  [ID_CIFType_CIFType] varchar(50) NOT NULL,
  [Description_CIFType] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_CIFType_CIFType])
) ;

-- Volcando datos para la tabla aac.aac_ciftype: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_ciftype` DISABLE KEYS */;
INSERT INTO aac_ciftype ([ID_CIFType_CIFType], [Description_CIFType]) VALUES
	('A', 'Administrador'),
	('E', 'Estudiante'),
	('P', 'Profesor'),
	('PC', 'Profesor_Coordinador');
/*!40000 ALTER TABLE `aac_ciftype` ENABLE KEYS */;

-- Volcando estructura para tabla aac.aac_cif_ciftype
DROP TABLE IF EXISTS [aac_cif_ciftype];
CREATE TABLE aac_cif_ciftype (
  [ID_CIF_CIFType] varchar(50) NOT NULL,
  [ID_Person] varchar(50) DEFAULT NULL,
  [ID_CIFType_CIFType] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([ID_CIF_CIFType])
 ,
  CONSTRAINT [Relation_to_CIF01] FOREIGN KEY ([ID_Person]) REFERENCES aac_cif ([ID_Person]),
  CONSTRAINT [Relation_to_CIFType01] FOREIGN KEY ([ID_CIFType_CIFType]) REFERENCES aac_ciftype ([ID_CIFType_CIFType])
) ;

CREATE INDEX [Relation_to_CIF01] ON aac_cif_ciftype ([ID_Person]);
CREATE INDEX [Relation_to_CIFType01] ON aac_cif_ciftype ([ID_CIFType_CIFType]);

-- Volcando datos para la tabla aac.aac_cif_ciftype: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_cif_ciftype` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_cif_ciftype` ENABLE KEYS */;

-- Volcando estructura para tabla aac.aac_classroom
DROP TABLE IF EXISTS [aac_classroom];
CREATE TABLE aac_classroom (
  [ID_ClassRom] varchar(50) NOT NULL,
  [Description_ClassRoom] varchar(250) DEFAULT NULL,
  [Location_ClassRoom] varchar(250) DEFAULT NULL,
  [Capacity_ClassRoom] int DEFAULT NULL,
  [ID_BranchOffice] varchar(50) DEFAULT NULL,
  [State_ClassRoom] varchar(100) DEFAULT NULL,
  PRIMARY KEY ([ID_ClassRom])
 ,
  CONSTRAINT [Relation_to_BranchOffice03] FOREIGN KEY ([ID_BranchOffice]) REFERENCES aac_branchOffice ([ID_BranchOffice])
) ;

CREATE INDEX [Relation_to_BranchOffice03] ON aac_classroom ([ID_BranchOffice]);

-- Volcando datos para la tabla aac.aac_classroom: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_classroom` ENABLE KEYS */;


-- Volcando estructura para tabla aac.aac_subject
DROP TABLE IF EXISTS [aac_subject];
CREATE TABLE aac_subject (
  [ID_Subject] varchar(50) NOT NULL,
  [OpenningDate_Subject] varchar(100) DEFAULT NULL,
  [Status_Subject] varchar(100) DEFAULT NULL,
  [Description_Subject] varchar(250) DEFAULT NULL,
  [Credits_Subject] int DEFAULT NULL,
  [MinimunNote_Subject] int DEFAULT NULL,
  [MinimunQuote_Subject] int DEFAULT NULL,
  [TypeOfCurrency_Subject] varchar(150) DEFAULT NULL,
  [Period_Subject] varchar(100) DEFAULT NULL,
  [ReprobingAbsence_Subject] int DEFAULT NULL,
  [HoursDuration_Subject] int DEFAULT NULL,
  [ExtraordinayMinimunNote_Subject] int DEFAULT NULL,
  [ApplyScholarshipDiscounts_Subject] int DEFAULT NULL,
  [DegreeTest_Subject] int DEFAULT NULL,
  [ProfessionalPractice_Subject] int DEFAULT NULL,
  [AppliesUVirtualRetirement_Subject] int DEFAULT NULL,
  [ID_Level] varchar(50) DEFAULT NULL,
  PRIMARY KEY ([ID_Subject])
 ,
  CONSTRAINT [Relation_to_Level01] FOREIGN KEY ([ID_Level]) REFERENCES aac_level ([ID_Level])
) ;

CREATE INDEX [Relation_to_Level01] ON aac_subject ([ID_Level]);

-- Volcando datos para la tabla aac.aac_subject: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `aac_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `aac_subject` ENABLE KEYS */;


-- Volcando estructura para procedimiento aac.AAC_SearchPersonEnabledCBO
DROP PROCEDURE IF EXISTS [AAC_ListBranchOfficeCBO];
CREATE  PROCEDURE AAC_ListBranchOfficeCBO()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_branchoffice.ID_BranchOffice AS ID, 
aac.aac_branchoffice.Description_branchOffice AS Description,
aac.aac_branchoffice.ID_Country AS Country,
aac.aac_branchoffice.ID_Province AS Province,
aac.aac_branchoffice.ID_District AS District,
aac.aac_branchoffice.ID_Canton AS Canton, 
aac.aac_branchoffice.Status_branchOffice AS State 
FROM aac.aac_branchoffice
WHERE  aac.aac_branchoffice.Status_branchOffice = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_Career
DROP PROCEDURE IF EXISTS [AAC_DashboardData_Career];
CREATE  PROCEDURE AAC_DashboardData_Career()
AS
BEGIN
SET NOCOUNT ON;
 (SELECT COUNT(AAC_Career.ID_Career) AS Career FROM AAC_Career);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_CIF
DROP PROCEDURE IF EXISTS [AAC_DashboardData_CIF];
CREATE  PROCEDURE AAC_DashboardData_CIF()
AS
BEGIN
SET NOCOUNT ON;
 (SELECT COUNT(AAC_Person.ID_Person) AS CIF 
 FROM AAC_CIF INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_Coordinator
DROP PROCEDURE IF EXISTS [AAC_DashboardData_Coordinator];
CREATE  PROCEDURE AAC_DashboardData_Coordinator()
AS
BEGIN
SET NOCOUNT ON;
 (SELECT COUNT(AAC_CIF_CIFType.ID_CIF_CIFType) AS Coordinator FROM AAC_CIF_CIFType
 WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC');
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_Level
DROP PROCEDURE IF EXISTS [AAC_DashboardData_Level];
CREATE  PROCEDURE AAC_DashboardData_Level()
AS
BEGIN
SET NOCOUNT ON;
 (SELECT COUNT(AAC_Level.ID_Level) AS Level FROM AAC_Level);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_Subject
DROP PROCEDURE IF EXISTS [AAC_DashboardData_Subject];
CREATE  PROCEDURE AAC_DashboardData_Subject()
AS
BEGIN
SET NOCOUNT ON;
(SELECT COUNT(AAC_Subject.ID_Subject) AS Subject FROM AAC_Subject);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DashboardData_UAD
DROP PROCEDURE IF EXISTS [AAC_DashboardData_UAD];
CREATE  PROCEDURE AAC_DashboardData_UAD()
AS
BEGIN
SET NOCOUNT ON;
 (SELECT COUNT(AAC_Person.ID_Person) AS UAD FROM AAC_Person);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteCanton
DROP PROCEDURE IF EXISTS [AAC_DeleteCanton];
CREATE  PROCEDURE AAC_DeleteCanton(
@p_ID_Canton NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM geo_data.geo_canton WHERE geo_data.geo_canton.ID_Canton = @p_ID_Canton;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteCareer
DROP PROCEDURE IF EXISTS [AAC_DeleteCareer];
CREATE  PROCEDURE AAC_DeleteCareer(
@p_DID_Career NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_Career WHERE ID_Career = @p_DID_Career;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteCIF
DROP PROCEDURE IF EXISTS [AAC_DeleteCIF];
CREATE  PROCEDURE AAC_DeleteCIF(
@p_dlID_Person NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_CIF_CIFType WHERE ID_Person = @p_dlID_Person;
DELETE FROM AAC_CIF WHERE ID_Person = @p_dlID_Person;
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteCIF_CIFType
DROP PROCEDURE IF EXISTS [AAC_DeleteCIF_CIFType];
CREATE  PROCEDURE AAC_DeleteCIF_CIFType(
@p_ID_CIF_CIFType NVARCHAR (50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_CIF_CIFType WHERE ID_CIF_CIFType = @p_ID_CIF_CIFType;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteClassRoom
DROP PROCEDURE IF EXISTS [AAC_DeleteClassRoom];
CREATE  PROCEDURE AAC_DeleteClassRoom(
@p_ID_ClassRom NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_ClassRoom WHERE ID_ClassRom = @p_ID_ClassRom;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteCountry
DROP PROCEDURE IF EXISTS [AAC_DeleteCountry];
CREATE  PROCEDURE AAC_DeleteCountry(
@p_ID_Country NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM geo_data.geo_country WHERE geo_data.geo_country.ID_Country = @p_ID_Country;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteDistrict
DROP PROCEDURE IF EXISTS [AAC_DeleteDistrict];
CREATE  PROCEDURE AAC_DeleteDistrict(
@p_ID_District NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM geo_data.geo_district WHERE geo_data.geo_district.ID_District = @p_ID_District;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteLevel
DROP PROCEDURE IF EXISTS [AAC_DeleteLevel];
CREATE  PROCEDURE AAC_DeleteLevel(
@p_ID_Level NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_Level WHERE ID_Level = @p_ID_Level;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeletePerson
DROP PROCEDURE IF EXISTS [AAC_DeletePerson];
CREATE  PROCEDURE AAC_DeletePerson(
@p_dID_Person NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_Person WHERE ID_Person = @p_dID_Person;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteProvince
DROP PROCEDURE IF EXISTS [AAC_DeleteProvince];
CREATE  PROCEDURE AAC_DeleteProvince(
@p_ID_Province NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM geo_data.geo_province WHERE geo_data.geo_province.ID_Province = @p_ID_Province;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteSubject
DROP PROCEDURE IF EXISTS [AAC_DeleteSubject];
CREATE  PROCEDURE AAC_DeleteSubject(
@p_ID_Subject NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM AAC_Subject WHERE ID_Subject = @p_ID_Subject;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_DeleteUser
DROP PROCEDURE IF EXISTS [AAC_DeleteUser];
CREATE  PROCEDURE AAC_DeleteUser(
@p_ID_Person NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM aac.aac_user WHERE aac.aac_user.ID_Person =  @p_ID_Person;
END;
GO

-- Volcando estructura para procedimiento aac.AAC_GetLevelCredits
DROP PROCEDURE IF EXISTS [AAC_GetLevelCredits];
CREATE  PROCEDURE AAC_GetLevelCredits(
@p_parameterCredits NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Level.Credits_Level AS Credits
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(@p_parameterCredits,'%');

END;
GO

-- Volcando estructura para procedimiento aac.AAC_GetSubjectCredits
DROP PROCEDURE IF EXISTS [AAC_GetSubjectCredits];
CREATE  PROCEDURE AAC_GetSubjectCredits(
@p_parameterCredits NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT (AAC_Subject.Credits_Subject) AS CreditsSubject 
 FROM AAC_Subject
 INNER JOIN AAC_Level ON AAC_Subject.ID_Level = AAC_Level.ID_Level
 WHERE AAC_Level.ID_Level LIKE  CONCAT(@p_parameterCredits,'%');

END;
GO


-- Update Subject

CREATE PROCEDURE AAC_UpdateSubject (
@p_ID_Subject NVARCHAR(50),
@p_OpenningDate_Subject NVARCHAR(100),
@p_Status_Subject NVARCHAR(100),
@p_Description_Subject NVARCHAR(250),
@p_Credits_Subject INT,
@p_MinimunNote_Subject INT,
@p_MinimunQuote_Subject INT,-- Cupo min
@p_TypeOfCurrency_Subject NVARCHAR(150),
@p_Period_Subject NVARCHAR(100),
@p_ReprobingAbsence_Subject INT,-- Reprob ausencia
@p_HoursDuration_Subject INT,
@p_ExtraordinayMinimunNote_Subject INT,
@p_ApplyScholarshipDiscounts_Subject INT,
@p_DegreeTest_Subject INT, -- Prueba grado
@p_ProfessionalPractice_Subject INT,
@p_AppliesUVirtualRetirement_Subject INT,
@p_ID_Level NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
UPDATE AAC_Subject SET OpenningDate_Subject = @p_OpenningDate_Subject, 
Status_Subject = @p_Status_Subject, Description_Subject = @p_Description_Subject, 
Credits_Subject = @p_Credits_Subject, MinimunNote_Subject = @p_MinimunNote_Subject, 
MinimunQuote_Subject = @p_MinimunQuote_Subject, TypeOfCurrency_Subject = @p_TypeOfCurrency_Subject, 
Period_Subject = @p_Period_Subject, ReprobingAbsence_Subject = @p_ReprobingAbsence_Subject, 
HoursDuration_Subject = @p_HoursDuration_Subject, ExtraordinayMinimunNote_Subject = @p_ExtraordinayMinimunNote_Subject, 
ApplyScholarshipDiscounts_Subject = @p_ApplyScholarshipDiscounts_Subject, DegreeTest_Subject = @p_DegreeTest_Subject,
ProfessionalPractice_Subject = @p_ProfessionalPractice_Subject, 
AppliesUVirtualRetirement_Subject = @p_AppliesUVirtualRetirement_Subject, ID_Level = @p_ID_Level
WHERE ID_Subject = @p_ID_Subject;

END;
GO



-- Volcando estructura para procedimiento aac.AAC_InsertCanton
DROP PROCEDURE IF EXISTS [AAC_InsertCanton];
CREATE  PROCEDURE AAC_InsertCanton(
@p_ID_Canton NVARCHAR(50),
@p_Description_Canton NVARCHAR(250),
@p_ID_District NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO geo_data.geo_canton VALUES (@p_ID_Canton, @p_Description_Canton, @p_ID_District);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertCareer
DROP PROCEDURE IF EXISTS [AAC_InsertCareer];
CREATE  PROCEDURE AAC_InsertCareer(
@p_ID_Career NVARCHAR(50),
@p_Description_Career NVARCHAR(250),
@p_ID_Person NVARCHAR(50), 
@p_OpeningDate_Career NVARCHAR(100),
@p_State_Career NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_Career VALUES (@p_ID_Career, @p_Description_Career,
 @p_ID_Person, @p_OpeningDate_Career, @p_State_Career);

END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertCIF
DROP PROCEDURE IF EXISTS [AAC_InsertCIF];
CREATE  PROCEDURE AAC_InsertCIF(
@p_ID_Person NVARCHAR(50),
@p_PaymentMethod_CIF NVARCHAR(100),
@p_Denomination_CIF NVARCHAR(100),
@p_DateOfAdmission_CIF NVARCHAR(100),
@p_Classification_CIF NVARCHAR(250),
@p_TypeOfCurrency_CIF NVARCHAR(250),
@p_IDCIFType NVARCHAR(50),
@p_IDCIF_CIFType NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_CIF VALUES (@p_ID_Person, @p_PaymentMethod_CIF, @p_Denomination_CIF, 
@p_DateOfAdmission_CIF, @p_Classification_CIF, @p_TypeOfCurrency_CIF);
INSERT INTO AAC_CIF_CIFType VALUES (@p_IDCIF_CIFType,@p_ID_Person,@p_IDCIFType);

END;
GO


-- Volcando estructura para procedimiento aac.AAC_UpdateCIF
DROP PROCEDURE IF EXISTS [AAC_UpdateCIF];
CREATE  PROCEDURE AAC_UpdateCIF(
@p_uiID_Person NVARCHAR(50),
@p_uiPaymentMethod_CIF NVARCHAR(100),
@p_uiDenomination_CIF NVARCHAR(100),
@p_uiDateOfAdmission_CIF NVARCHAR(100),
@p_uiClassification_CIF NVARCHAR(250),
@p_uiTypeOfCurrency_CIF NVARCHAR(250),
@p_IDCIFType NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
UPDATE AAC_CIF SET PaymentMethod_CIF = @p_uiPaymentMethod_CIF, 
Denomination_CIF = @p_uiDenomination_CIF, DateOfAdmission_CIF = @p_uiDateOfAdmission_CIF, 
Classification_CIF = @p_uiClassification_CIF, TypeOfCurrency_CIF = @p_uiTypeOfCurrency_CIF
WHERE ID_Person = @p_uiID_Person;
UPDATE AAC_CIF_CIFType SET ID_CIFType_CIFType = @p_IDCIFType WHERE ID_Person = @p_uiID_Person;

END;
GO


-- Volcando estructura para procedimiento aac.AAC_InsertCIF_CIFType
DROP PROCEDURE IF EXISTS [AAC_InsertCIF_CIFType];
CREATE  PROCEDURE AAC_InsertCIF_CIFType(
@p_iID_CIF_CIFType NVARCHAR (50),
@p_iID_Person NVARCHAR(50),
@p_iID_CIFType_CIFType NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_CIF_CIFType VALUES (@p_iID_CIF_CIFType, @p_iID_Person, @p_iID_CIFType_CIFType);

END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertClassRoom
DROP PROCEDURE IF EXISTS [AAC_InsertClassRoom];
CREATE  PROCEDURE AAC_InsertClassRoom(
@p_ID_ClassRom NVARCHAR(50),
@p_Description_ClassRoom NVARCHAR(250),
@p_Location_ClassRoom NVARCHAR(250),
@p_Capacity_ClassRoom INT,
@p_ID_BranchOffice NVARCHAR(50),
@p_State_ClassRoom NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_ClassRoom VALUES (@p_ID_ClassRom, @p_Description_ClassRoom,
@p_Location_ClassRoom, @p_Capacity_ClassRoom, @p_ID_BranchOffice, @p_State_ClassRoom);

END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertCountry
DROP PROCEDURE IF EXISTS [AAC_InsertCountry];
CREATE  PROCEDURE AAC_InsertCountry(
@p_ID_Country NVARCHAR(50),
@p_Description_Country NVARCHAR(250))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO geo_data.geo_country VALUES (@p_ID_Country, @p_Description_Country);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertDistrict
DROP PROCEDURE IF EXISTS [AAC_InsertDistrict];
CREATE  PROCEDURE AAC_InsertDistrict(
@p_ID_District NVARCHAR(50),
@p_Description_District NVARCHAR(250),
@p_ID_Province NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO geo_data.geo_district VALUES (@p_ID_District, @p_Description_District, @p_ID_Province);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertLevel
DROP PROCEDURE IF EXISTS [AAC_InsertLevel];
CREATE  PROCEDURE AAC_InsertLevel(
@p_ID_Level NVARCHAR(50),
@p_OpenningDate_Level NVARCHAR(100),
@p_AcademicGrade_Level NVARCHAR(250),
@p_Description_Level NVARCHAR(250),
@p_Enphatic_Level NVARCHAR(250),
@p_Credits_Level INT,
@p_ID_Career NVARCHAR(50),
@p_ID_BranchOffice NVARCHAR(50),
@p_MinimumNote_Level INT,
@p_State_Level NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_Level VALUES (@p_ID_Level, @p_OpenningDate_Level, @p_AcademicGrade_Level,
@p_Description_Level, @p_Enphatic_Level, @p_Credits_Level, @p_ID_Career, @p_ID_BranchOffice, @p_MinimumNote_Level,
@p_State_Level);

END;
GO


-- -- Volcando estructura para procedimiento aac.AAC_UpdateLevel
DROP PROCEDURE IF EXISTS [AAC_UpdateLevel];

CREATE  PROCEDURE AAC_UpdateLevel (
@p_ID_Level NVARCHAR(50),
@p_OpenningDate_Level NVARCHAR(100),
@p_AcademicGrade_Level NVARCHAR(250),
@p_Description_Level NVARCHAR(250),
@p_Enphatic_Level NVARCHAR(250),
@p_Credits_Level INT,
@p_ID_Career NVARCHAR(50),
@p_ID_BranchOffice NVARCHAR(50),
@p_MinimumNote_Level INT,
@p_State_Level NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
UPDATE AAC_Level SET OpenningDate_Level = @p_OpenningDate_Level, 
AcademicGrade_Level = @p_AcademicGrade_Level, Description_Level = @p_Description_Level, 
Enphatic_Level = @p_Enphatic_Level, Credits_Level = @p_Credits_Level, ID_Career = @p_ID_Career, 
ID_BranchOffice = @p_ID_BranchOffice,
MinimumNote_Level = @p_MinimumNote_Level, State_Level = @p_State_Level
WHERE ID_Level = @p_ID_Level;

END;
GO


-- Volcando estructura para procedimiento aac.AAC_InsertPerson
DROP PROCEDURE IF EXISTS [AAC_InsertPerson];
CREATE  PROCEDURE AAC_InsertPerson(
@p_ID_Person NVARCHAR(50),
@p_Name_Person NVARCHAR(200),
@p_Surname_Person NVARCHAR(200) ,
@p_Lastname_Person NVARCHAR(200),
@p_IdentificationType_Person NVARCHAR(100),
@p_Identification_Person NVARCHAR(100),
@p_Gender_Person NVARCHAR(100),
@p_Birthday_Person NVARCHAR(100),
@p_ID_Country NVARCHAR(50),
@p_ID_Province NVARCHAR(50),
@p_ID_District NVARCHAR(50),
@p_ID_Canton NVARCHAR(50),
@p_ID_BranchOffice NVARCHAR(50),
@p_CivilStatus_Person NVARCHAR(100),
@p_CellPhone_Person NVARCHAR(50),
@p_Email_Person NVARCHAR(200),
@p_HomeAddress_Person NVARCHAR(250),
@p_Status_Person NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO aac.aac_person VALUES (@p_ID_Person, @p_Name_Person, @p_Surname_Person, @p_Lastname_Person,
@p_IdentificationType_Person, @p_Identification_Person,
 @p_Gender_Person, @p_Birthday_Person, @p_ID_Country, @p_ID_Province, @p_ID_District, @p_ID_Canton, @p_ID_BranchOffice,
@p_CivilStatus_Person, @p_CellPhone_Person, @p_Email_Person, 
@p_HomeAddress_Person, @p_Status_Person);

END;
GO




-- Volcando estructura para procedimiento aac.AAC_UpdatePerson
DROP PROCEDURE IF EXISTS [AAC_UpdatePerson];
CREATE  PROCEDURE AAC_UpdatePerson(
@p_ID_Person NVARCHAR(50),
@p_Name_Person NVARCHAR(200),
@p_Surname_Person NVARCHAR(200) ,
@p_Lastname_Person NVARCHAR(200),
@p_IdentificationType_Person NVARCHAR(100),
@p_Identification_Person NVARCHAR(100),
@p_Gender_Person NVARCHAR(100),
@p_Birthday_Person NVARCHAR(100),
@p_ID_Country NVARCHAR(50),
@p_ID_Province NVARCHAR(50),
@p_ID_District NVARCHAR(50),
@p_ID_Canton NVARCHAR(50),
@p_ID_BranchOffice NVARCHAR(50),
@p_CivilStatus_Person NVARCHAR(100),
@p_CellPhone_Person NVARCHAR(50),
@p_Email_Person NVARCHAR(200),
@p_HomeAddress_Person NVARCHAR(250),
@p_Status_Person NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
UPDATE aac.aac_person SET aac.aac_person.Name_Person = @p_Name_Person, 
aac.aac_person.Surname_Person = @p_Surname_Person, 
aac.aac_person.Lastname_Person = @p_Lastname_Person,
aac.aac_person.IdentificationType_Person = @p_IdentificationType_Person, 
aac.aac_person.Identification_Person = @p_Identification_Person,
aac.aac_person.Gender_Person = @p_Gender_Person, 
aac.aac_person.Birthday_Person = @p_Birthday_Person, 
aac.aac_person.ID_Country = @p_ID_Country, 
aac.aac_person.ID_Province = @p_ID_Province,
aac.aac_person.ID_District = @p_ID_District, 
aac.aac_person.ID_Canton = @p_ID_Canton, 
aac.aac_person.ID_BranchOffice = @p_ID_BranchOffice,
aac.aac_person.CivilStatus_Person = @p_CivilStatus_Person, 
aac.aac_person.CellPhone_Person = @p_CellPhone_Person, 
aac.aac_person.Email_Person = @p_Email_Person, 
aac.aac_person.HomeAddress_Person = @p_HomeAddress_Person, 
aac.aac_person.Status_Person = @p_Status_Person 
WHERE aac.aac_person.ID_Person = @p_ID_Person;
-- ALTER TABLE `aac_person` CHANGE COLUMN `HomeAddress` `HomeAddress_Person` VARCHAR(250) NULL DEFAULT NULL AFTER `Email_Person`
END;
GO



-- Volcando estructura para procedimiento aac.AAC_InsertProfile
DROP PROCEDURE IF EXISTS [AAC_InsertProfile];
CREATE  PROCEDURE AAC_InsertProfile(
@p_Id_Profile NVARCHAR(50),
@p_Name_Profile NVARCHAR(100),
@p_State_Profile NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_Profile VALUES (@p_Id_Profile, @p_Name_Profile, @p_State_Profile);

END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertProvince
DROP PROCEDURE IF EXISTS [AAC_InsertProvince];
CREATE  PROCEDURE AAC_InsertProvince(
@p_ID_Province NVARCHAR(50),
@p_Description_Province NVARCHAR(250),
@p_ID_Country NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO geo_data.geo_province VALUES (@p_ID_Province, @p_Description_Province, @p_ID_Country);
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertSubject
DROP PROCEDURE IF EXISTS [AAC_InsertSubject];
CREATE  PROCEDURE AAC_InsertSubject(
@p_ID_Subject NVARCHAR(50),
@p_OpenningDate_Subject NVARCHAR(100),
@p_Status_Subject NVARCHAR(100),
@p_Description_Subject NVARCHAR(250),
@p_Credits_Subject INT,
@p_MinimunNote_Subject INT,
@p_MinimunQuote_Subject INT,
@p_TypeOfCurrency_Subject NVARCHAR(150),
@p_Period_Subject NVARCHAR(100),
@p_ReprobingAbsence_Subject INT,
@p_HoursDuration_Subject INT,
@p_ExtraordinayMinimunNote_Subject INT,
@p_ApplyScholarshipDiscounts_Subject INT,
@p_DegreeTest_Subject INT, 
@p_ProfessionalPractice_Subject INT,
@p_AppliesUVirtualRetirement_Subject INT,
@p_ID_Level NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_Subject VALUES (@p_ID_Subject, @p_OpenningDate_Subject, @p_Status_Subject,
@p_Description_Subject, @p_Credits_Subject, @p_MinimunNote_Subject, @p_MinimunQuote_Subject, 
@p_TypeOfCurrency_Subject, @p_Period_Subject, @p_ReprobingAbsence_Subject, @p_HoursDuration_Subject,
@p_ExtraordinayMinimunNote_Subject, @p_ApplyScholarshipDiscounts_Subject, @p_DegreeTest_Subject,
@p_ProfessionalPractice_Subject, @p_AppliesUVirtualRetirement_Subject, @p_ID_Level);

END;
GO

-- Volcando estructura para procedimiento aac.AAC_InsertUser
DROP PROCEDURE IF EXISTS [AAC_InsertUser];
CREATE  PROCEDURE AAC_InsertUser(
@p_ID_Person NVARCHAR(50),
@p_Password_User NVARCHAR(200),
@p_ID_Profile NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
INSERT INTO AAC_User VALUES (@p_ID_Person, @p_Password_User, @p_ID_Profile);

END;
GO


-- Volcando estructura para procedimiento aac.AAC_ListCanton
DROP PROCEDURE IF EXISTS [AAC_ListCanton];
CREATE  PROCEDURE AAC_ListCanton(
@p_ID_District NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_canton.ID_Canton AS ID, geo_data.geo_canton.Description_Canton AS Description 
FROM geo_data.geo_canton
WHERE geo_data.geo_canton.ID_District = @p_ID_District;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListCareerCBO
DROP PROCEDURE IF EXISTS [AAC_ListCareerCBO];
CREATE  PROCEDURE AAC_ListCareerCBO()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director, AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE AAC_Career.State_Career = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListCIFType
DROP PROCEDURE IF EXISTS [AAC_ListCIFType];
CREATE  PROCEDURE AAC_ListCIFType()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_CIFType.ID_CIFType_CIFType AS 
IDCIFType, AAC_CIFType.Description_CIFType AS Description
FROM AAC_CIFType;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListCIFTypeDirectorCBO
DROP PROCEDURE IF EXISTS [AAC_ListCIFTypeDirectorCBO];
CREATE  PROCEDURE AAC_ListCIFTypeDirectorCBO()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name 
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListCIF_CIFType
DROP PROCEDURE IF EXISTS [AAC_ListCIF_CIFType];
CREATE  PROCEDURE AAC_ListCIF_CIFType(
@p_searchC NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
SELECT ID_CIF_CIFType AS IDCIF_CIFType,
AAC_CIFType.Description_CIFType AS CIFType
FROM AAC_CIF_CIFType
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_Person.ID_Person = @p_searchC;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListClassRoom
DROP PROCEDURE IF EXISTS [AAC_ListClassRoom];
CREATE  PROCEDURE AAC_ListClassRoom()
AS
BEGIN
SET NOCOUNT ON;
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListCountry
DROP PROCEDURE IF EXISTS [AAC_ListCountry];
CREATE  PROCEDURE AAC_ListCountry()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_country.ID_Country AS ID, geo_data.geo_country.Description_Country AS Description 
FROM geo_data.geo_country;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListDistrict
DROP PROCEDURE IF EXISTS [AAC_ListDistrict];
CREATE  PROCEDURE AAC_ListDistrict(
@p_ID_Province NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_district.ID_District AS ID, geo_data.geo_district.Description_District AS Description 
FROM geo_data.geo_district
WHERE geo_data.geo_district.ID_Province = @p_ID_Province;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListGeneralCareer
DROP PROCEDURE IF EXISTS [AAC_ListGeneralCareer];
CREATE  PROCEDURE AAC_ListGeneralCareer()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListLevel
DROP PROCEDURE IF EXISTS [AAC_ListLevel];
CREATE  PROCEDURE AAC_ListLevel()
AS
BEGIN
SET NOCOUNT ON;
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
GO

-- Volcando estructura para procedimiento aac.AAC_ListLevelEnabed
DROP PROCEDURE IF EXISTS [AAC_ListLevelEnabed];
CREATE  PROCEDURE AAC_ListLevelEnabed()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Level.ID_Level AS ID,
AAC_Level.Description_Level AS Description
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
 WHERE AAC_Level.State_Level = 'Habilitado' 
 ORDER BY AAC_Level.OpenningDate_Level DESC; 

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListPerson
DROP PROCEDURE IF EXISTS [AAC_ListPerson];
CREATE  PROCEDURE AAC_ListPerson()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
geo_data.geo_country.Description_Country AS Country, 
geo_data.geo_province.Description_Province AS Province, 
geo_data.geo_district.Description_District AS District, 
geo_data.geo_canton.Description_Canton AS Canton,  
aac.aac_branchoffice.Description_branchOffice AS BranchOffice,
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress_Person AS HomeAddress_Person, aac.aac_person.Status_Person AS State 
FROM aac.aac_person
INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListPersonDirector
DROP PROCEDURE IF EXISTS [AAC_ListPersonDirector];
CREATE  PROCEDURE AAC_ListPersonDirector()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name 
FROM AAC_CIF_CIFType
INNER JOIN aac.aac_person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListPersonEnabledCBO
DROP PROCEDURE IF EXISTS [AAC_ListPersonEnabledCBO];
CREATE  PROCEDURE AAC_ListPersonEnabledCBO()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
geo_data.geo_country.Description_Country AS Country, 
geo_data.geo_province.Description_Province AS Province, 
geo_data.geo_district.Description_District AS District, 
geo_data.geo_canton.Description_Canton AS Canton,  
aac.aac_branchoffice.Description_branchOffice AS BranchOffice,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress_Person AS HomeAddress, aac.aac_person.Status_Person AS State 
FROM aac.aac_person
INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE  aac.aac_person.Status_Person = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListProvince
DROP PROCEDURE IF EXISTS [AAC_ListProvince];
CREATE  PROCEDURE AAC_ListProvince(
@p_ID_Country NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_province.ID_Province AS ID, geo_data.geo_province.Description_Province AS Description FROM geo_data.geo_province
WHERE geo_data.geo_province.ID_Country = @p_ID_Country;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_ListSubject
DROP PROCEDURE IF EXISTS [AAC_ListSubject];
CREATE  PROCEDURE AAC_ListSubject()
AS
BEGIN
SET NOCOUNT ON;
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
GO

-- Volcando estructura para procedimiento aac.AAC_ListSubjectEnabled
DROP PROCEDURE IF EXISTS [AAC_ListSubjectEnabled];
CREATE  PROCEDURE AAC_ListSubjectEnabled()
AS
BEGIN
SET NOCOUNT ON;
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
GO

-- Volcando estructura para procedimiento aac.AAC_ListUser
DROP PROCEDURE IF EXISTS [AAC_ListUser];
CREATE  PROCEDURE AAC_ListUser()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_user.ID_Person AS ID, sha1(aac.aac_user.Password_User) AS Pass, 
aac.aac_person.Email_Person AS Email, aac.aac_person.Name_Person AS NamePerson, 
aac.aac_profile.Name_Profile AS NameProfile, aac.aac_person.Status_Person AS StatusPerson
 FROM AAC_User 
 INNER JOIN AAC_Person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN AAC_Profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile;
END;
GO

-- Volcando estructura para procedimiento aac.AAC_Login
DROP PROCEDURE IF EXISTS [AAC_Login];
CREATE  PROCEDURE AAC_Login(
@p_Email_Person NVARCHAR(200),
@p_Password_User NVARCHAR(200))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_User.ID_Person AS ID, AAC_User.Password_User AS Pass, 
AAC_Person.Email_Person AS Email, AAC_Person.Name_Person AS NamePerson, AAC_Profile.Name_Profile AS NameProfile
 FROM AAC_User 
 INNER JOIN AAC_Person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN AAC_Profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile 
 WHERE AAC_Person.Email_Person = @p_Email_Person AND 
 AAC_User.Password_User = @p_Password_User AND AAC_Person.Status_Person = 'Habilitado'
 AND AAC_Profile.State_Profile = 'Habilitado';

END;
GO


-- Volcando estructura para procedimiento aac.AAC_SeachCareer
DROP PROCEDURE IF EXISTS [AAC_SeachCareer];
CREATE  PROCEDURE AAC_SeachCareer(
@p_parameterCareer NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(@p_parameterCareer,'%') OR 
 Description_Career LIKE  +(@p_parameterCareer,'%') OR 
 Name_Person LIKE  +(@p_parameterCareer,'%');

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SeachCareerEnabled
DROP PROCEDURE IF EXISTS [AAC_SeachCareerEnabled];
CREATE  PROCEDURE AAC_SeachCareerEnabled(
@p_parameterCareer NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Career.ID_Career AS ID, AAC_Career.Description_Career AS Description,
AAC_Person.Name_Person AS Director,  AAC_Career.OpeningDate_Career AS OpeningDate,
 AAC_Career.State_Career AS State
FROM AAC_Career
INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person
WHERE 
 ID_Career LIKE  CONCAT(@p_parameterCareer,'%') OR 
 Description_Career LIKE  +(@p_parameterCareer,'%') OR 
 Name_Person LIKE  +(@p_parameterCareer,'%') AND State_Career = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SeachLevel
DROP PROCEDURE IF EXISTS [AAC_SeachLevel];
CREATE  PROCEDURE AAC_SeachLevel(
@p_parameterLevel NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Level.ID_Level AS ID, AAC_Career.Description_Career AS Career, 
AAC_Level.OpenningDate_Level AS OpenningDate, AAC_Level.AcademicGrade_Level AS AcademicGrade,
AAC_Level.Description_Level AS Description, AAC_Person.Name_Person AS Director,
AAC_Level.Enphatic_Level AS Enphatic, AAC_Level.Credits_Level AS Credits, 
AAC_Level.MinimumNote_Level AS MinimumNote, AAC_Level.State_Level AS State 
 FROM AAC_Level
 INNER JOIN AAC_Career ON AAC_Level.ID_Career = AAC_Career.ID_Career
 INNER JOIN AAC_Person ON AAC_Career.ID_Person = AAC_Person.ID_Person 
WHERE 
 AAC_Level.ID_Level LIKE  CONCAT(@p_parameterLevel,'%') OR 
 AAC_Career.Description_Career LIKE  +(@p_parameterLevel,'%') OR 
 Name_Person LIKE  +(@p_parameterLevel,'%') OR
 AAC_Level.Description_Level LIKE  +(@p_parameterLevel,'%') OR
 AAC_Level.State_Level LIKE  +(@p_parameterLevel,'%') 
 ORDER BY AAC_Level.OpenningDate_Level DESC;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SeachSubject
DROP PROCEDURE IF EXISTS [AAC_SeachSubject];
CREATE  PROCEDURE AAC_SeachSubject(
@p_parameterSubject NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
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
 AAC_Subject.ID_Subject LIKE  CONCAT(@p_parameterSubject,'%') OR 
 AAC_Level.Description_Level LIKE  +(@p_parameterSubject,'%')
  ORDER BY AAC_Subject.OpenningDate_Subject DESC;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchCanton
DROP PROCEDURE IF EXISTS [AAC_SearchCanton];
CREATE  PROCEDURE AAC_SearchCanton(
@p_ID_District NVARCHAR(50),
@p_parameterCanton NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_canton.ID_Canton AS ID, geo_data.geo_canton.Description_Canton AS Description 
FROM geo_data.geo_canton
WHERE geo_data.geo_canton.ID_District = @p_ID_District AND
geo_data.geo_canton.ID_Canton LIKE  CONCAT(@p_parameterCanton,'%') OR 
 geo_data.geo_canton.Description_Canton LIKE  +(@p_parameterCanton,'%')
  ORDER BY geo_data.geo_canton.ID_Canton DESC;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchCIF
DROP PROCEDURE IF EXISTS [AAC_SearchCIF];
CREATE  PROCEDURE AAC_SearchCIF(
@p_searchCIF NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name, 
 AAC_CIF.PaymentMethod_CIF AS PaymentMethod,
 AAC_CIF.Denomination_CIF AS Denomination, AAC_CIF.DateOfAdmission_CIF AS DateOfAdmission,
 AAC_CIF.Classification_CIF AS Classification,
 AAC_CIF.TypeOfCurrency_CIF AS TypeOfCurrency
FROM AAC_CIF 
 INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person
 WHERE AAC_CIF.ID_Person LIKE  CONCAT(@p_searchCIF,'%') OR 
 AAC_Person.Name_Person LIKE  +(@p_searchCIF,'%') OR 
 AAC_CIF.Denomination_CIF LIKE  +(@p_searchCIF,'%');

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchClassRoom
DROP PROCEDURE IF EXISTS [AAC_SearchClassRoom];
CREATE  PROCEDURE AAC_SearchClassRoom(
@p_searchCIF NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(@p_searchCIF,'%') OR 
 Description_ClassRoom LIKE  +(@p_searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  +(@p_searchCIF,'%');

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchClassRoomEnabled
DROP PROCEDURE IF EXISTS [AAC_SearchClassRoomEnabled];
CREATE  PROCEDURE AAC_SearchClassRoomEnabled(
@p_searchCIF NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT ID_ClassRom AS ID, Description_ClassRoom AS Description, 
Location_ClassRoom AS Location, Capacity_ClassRoom AS Capacity,
State_ClassRoom AS State FROM AAC_ClassRoom WHERE 
 ID_ClassRom LIKE  CONCAT(@p_searchCIF,'%') OR 
 Description_ClassRoom LIKE  +(@p_searchCIF,'%') OR 
 Capacity_ClassRoom LIKE  +(@p_searchCIF,'%') AND State_ClassRoom = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchDistrict
DROP PROCEDURE IF EXISTS [AAC_SearchDistrict];
CREATE  PROCEDURE AAC_SearchDistrict(
@p_ID_Province NVARCHAR(50),
@p_parameterDistrict NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_district.ID_District AS ID, geo_data.geo_district.Description_District AS Description 
FROM geo_data.geo_district
WHERE geo_data.geo_district.ID_Province = @p_ID_Province AND
geo_data.geo_district.ID_District LIKE  CONCAT(@p_parameterDistrict,'%') OR 
 geo_data.geo_district.Description_District LIKE  +(@p_parameterDistrict,'%')
  ORDER BY geo_data.geo_district.ID_District DESC;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchPerson
DROP PROCEDURE IF EXISTS [AAC_SearchPerson];
CREATE  PROCEDURE AAC_SearchPerson(
@p_search NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
geo_data.geo_country.Description_Country AS Country, 
geo_data.geo_province.Description_Province AS Province, 
geo_data.geo_district.Description_District AS District, 
geo_data.geo_canton.Description_Canton AS Canton,
aac.aac_branchoffice.Description_branchOffice AS BranchOffice,   
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress_Person AS HomeAddress_Person, aac.aac_person.Status_Person AS State 
FROM aac.aac_person
INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.ID_Person LIKE  CONCAT(@p_search,'%') OR 
aac.aac_person.Name_Person LIKE  +(@p_search,'%') OR aac.aac_person.Lastname_Person LIKE  +(@p_search,'%') 
OR aac.aac_person.Identification_Person LIKE  +(@p_search,'%') OR  
aac.aac_person.CellPhone_Person LIKE  +(@p_search,'%') OR 
geo_data.geo_country.Description_Country LIKE  +(@p_search,'%') OR
geo_data.geo_province.Description_Province LIKE  +(@p_search,'%');

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchPersonEnabled
DROP PROCEDURE IF EXISTS [AAC_SearchPersonEnabled];
CREATE  PROCEDURE AAC_SearchPersonEnabled(
@p_searchen NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
geo_data.geo_country.Description_Country AS Country, 
geo_data.geo_province.Description_Province AS Province, 
geo_data.geo_district.Description_District AS District, 
geo_data.geo_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress_Person AS HomeAddress_Person, aac.aac_person.Status_Person AS State 
FROM aac.aac_person
INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
WHERE aac.aac_person.ID_Person LIKE  CONCAT(@p_searchen,'%') OR 
aac.aac_person.Name_Person LIKE  +(@p_searchen,'%') OR aac.aac_person.Lastname_Person LIKE  +(@p_searchen,'%') 
OR aac.aac_person.Identification_Person LIKE  +(@p_searchen,'%') OR  
aac.aac_person.CellPhone_Person LIKE  +(@p_searchen,'%') OR 
geo_data.geo_country.Description_Country LIKE  +(@p_searchen,'%') OR
geo_data.geo_province.Description_Province LIKE  +(@p_searchen,'%') AND Status_Person = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchPersonEnabledCBO
DROP PROCEDURE IF EXISTS [AAC_SearchPersonEnabledCBO];
CREATE  PROCEDURE AAC_SearchPersonEnabledCBO()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.ID_Person AS ID, aac.aac_person.Name_Person AS Name, aac.aac_person.Surname_Person AS Surname,
aac.aac_person.Lastname_Person AS Lastname, aac.aac_person.IdentificationType_Person AS IdentificationType, 
aac.aac_person.Identification_Person AS Identification, aac.aac_person.Gender_Person AS Gender,
aac.aac_person.Birthday_Person AS Birthday,
geo_data.geo_country.Description_Country AS Country, 
geo_data.geo_province.Description_Province AS Province, 
geo_data.geo_district.Description_District AS District, 
geo_data.geo_canton.Description_Canton AS Canton,  
aac.aac_person.CivilStatus_Person AS CivilStatus, 
aac.aac_person.CellPhone_Person AS CellPhone, aac.aac_person.Email_Person AS Email,
aac.aac_person.HomeAddress_Person AS HomeAddress_Person, aac.aac_person.Status_Person AS State 
FROM aac.aac_person
INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
WHERE  aac.aac_person.Status_Person = 'Habilitado';

END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchProvince
DROP PROCEDURE IF EXISTS [AAC_SearchProvince];
CREATE  PROCEDURE AAC_SearchProvince(
@p_ID_Country NVARCHAR(50),
@p_parameterProvince NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
 SELECT geo_data.geo_province.ID_Province AS ID, geo_data.geo_province.Description_Province AS Description 
 FROM geo_data.geo_province
WHERE geo_data.geo_province.ID_Country = @p_ID_Country AND
geo_data.geo_province.ID_Province LIKE  CONCAT(@p_parameterProvince,'%') OR 
 geo_data.geo_province.Description_Province LIKE  +(@p_parameterProvince,'%')
  ORDER BY geo_data.geo_province.ID_Province DESC;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_SearchUser
DROP PROCEDURE IF EXISTS [AAC_SearchUser];
CREATE  PROCEDURE AAC_SearchUser(
@p_parameterUser NVARCHAR (100))
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_user.ID_Person AS ID, sha1(aac.aac_user.Password_User) AS Pass, 
aac.aac_person.Email_Person AS Email, aac.aac_person.Name_Person AS NamePerson, 
aac.aac_profile.Name_Profile AS NameProfile, aac.aac_person.Status_Person AS StatusPerson
 FROM aac.aac_user 
 INNER JOIN aac.aac_person ON AAC_User.ID_Person=AAC_Person.ID_Person
 INNER JOIN aac.aac_profile ON AAC_User.ID_Profile=AAC_Profile.ID_Profile
 WHERE aac.aac_user.ID_Person LIKE  CONCAT(@p_parameterUser,'%');
END;
GO

-- Volcando estructura para procedimiento aac.AAC_SelectCIF
DROP PROCEDURE IF EXISTS [AAC_SelectCIF];
CREATE  PROCEDURE AAC_SelectCIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT AAC_Person.ID_Person AS ID, AAC_Person.Name_Person AS Name, 
AAC_CIF.PaymentMethod_CIF AS PaymentMethod,
AAC_CIF.Denomination_CIF AS Denomination, AAC_CIF.DateOfAdmission_CIF AS DateOfAdmission,
AAC_CIF.Classification_CIF AS Classification,
AAC_CIF.TypeOfCurrency_CIF AS TypeOfCurrency
FROM AAC_CIF 
INNER JOIN AAC_Person ON AAC_CIF.ID_Person = AAC_Person.ID_Person;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_CantonPerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_CantonPerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_CantonPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_canton.Description_Canton AS Canton, COUNT(geo_data.geo_canton.ID_Canton) AS Quantity
 FROM aac.aac_person
 INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
 GROUP BY
geo_data.geo_canton.Description_Canton;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_CivilStatusPerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_CivilStatusPerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_CivilStatusPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.CivilStatus_Person AS CivilStatus, COUNT(aac.aac_person.CivilStatus_Person) AS Quantity
 FROM aac.aac_person
 GROUP BY
aac.aac_person.CivilStatus_Person;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_CountryPerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_CountryPerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_CountryPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_country.Description_Country AS Country, COUNT(geo_data.geo_country.ID_Country) AS Quantity
 FROM aac.aac_person
 INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country
 GROUP BY
geo_data.geo_country.Description_Country;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_DistrictPerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_DistrictPerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_DistrictPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_district.Description_District AS District, COUNT(geo_data.geo_district.ID_District) AS Quantity
 FROM aac.aac_person
 INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
 GROUP BY
geo_data.geo_district.Description_District;

END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_GenderPerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_GenderPerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_GenderPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
 SELECT aac.aac_person.Gender_Person AS Gender, COUNT(aac.aac_person.Gender_Person) AS Quantity
 FROM AAC_Person
 GROUP BY
 aac.aac_person.Gender_Person;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_Statisitcs_ProvincePerson_UAD
DROP PROCEDURE IF EXISTS [AAC_Statisitcs_ProvincePerson_UAD];
CREATE  PROCEDURE AAC_Statisitcs_ProvincePerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_province.Description_Province AS Province, COUNT(geo_data.geo_province.ID_Province) AS Quantity
FROM aac.aac_person
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province
GROUP BY
geo_data.geo_province.Description_Province;

END;
GO


-- Volcando estructura para procedimiento aac.AAC_UpdateCanton
DROP PROCEDURE IF EXISTS [AAC_UpdateCanton];
CREATE  PROCEDURE AAC_UpdateCanton(
@p_ID_Canton NVARCHAR(50),
@p_Description_Canton NVARCHAR(250),
@p_ID_District NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
UPDATE geo_data.geo_canton SET geo_data.geo_canton.Description_Canton = @p_Description_Canton,
 geo_data.geo_canton.ID_District = @p_ID_District WHERE geo_data.geo_canton.ID_Canton = @p_ID_Canton;
 
END;
GO

-- Volcando estructura para procedimiento aac.AAC_UpdateCareer
DROP PROCEDURE IF EXISTS [AAC_UpdateCareer];
CREATE  PROCEDURE AAC_UpdateCareer(
@p_ID_Career NVARCHAR(50),
@p_Description_Career NVARCHAR(250),
@p_ID_Person NVARCHAR(50), 
@p_State_Career NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
UPDATE AAC_Career SET Description_Career = @p_Description_Career,
 ID_Person = @p_ID_Person, State_Career = @p_State_Career WHERE ID_Career = @p_ID_Career;

END;
GO



-- Volcando estructura para procedimiento aac.AAC_UpdateClassRoom
DROP PROCEDURE IF EXISTS [AAC_UpdateClassRoom];
CREATE  PROCEDURE AAC_UpdateClassRoom(
@p_ID_ClassRom NVARCHAR(50),
@p_Description_ClassRoom NVARCHAR(250),
@p_Location_ClassRoom NVARCHAR(250),
@p_Capacity_ClassRoom INT,
@p_ID_BranchOffice NVARCHAR(50),
@p_State_ClassRoom NVARCHAR(100))
AS
BEGIN
SET NOCOUNT ON;
UPDATE AAC_ClassRoom SET Description_ClassRoom = @p_Description_ClassRoom,
Location_ClassRoom = @p_Location_ClassRoom, Capacity_ClassRoom = @p_Capacity_ClassRoom, 
ID_BranchOffice = @p_ID_BranchOffice, State_ClassRoom = @p_State_ClassRoom 
WHERE ID_ClassRom = @p_ID_ClassRom;

END;
GO





CREATE PROCEDURE AAC_UpdateUser (
@p_ID_Person NVARCHAR(50),
@p_Password_User NVARCHAR(200),
@p_ID_Profile NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
UPDATE aac.aac_user SET aac.aac_user.Password_User = @p_Password_User, aac.aac_user.ID_Profile = @p_ID_Profile 
WHERE aac.aac_user.ID_Person =  @p_ID_Person;
END;
GO




DROP PROCEDURE IF EXISTS [AAC_DeleteUser];

CREATE PROCEDURE AAC_DeleteUser (
@p_ID_Person NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
DELETE FROM aac.aac_user WHERE aac.aac_user.ID_Person =  @p_ID_Person;
END;
GO




DROP PROCEDURE IF EXISTS [AAC_Statistics_GenderPerson_UAD];

 CREATE PROCEDURE AAC_Statistics_GenderPerson_UAD()
 AS
 BEGIN
 SET NOCOUNT ON;
 SELECT aac.aac_person.Gender_Person AS Gender, COUNT(aac.aac_person.Gender_Person) AS Quantity
 FROM AAC_Person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 WHERE aac.aac_person.Status_Person = 'Habilitado'
 GROUP BY
 aac.aac_person.Gender_Person;
 
END;
 
 GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_GenderPerson_BO_UAD];

 CREATE PROCEDURE AAC_Statistics_GenderPerson_BO_UAD(
 @p_ID_BranchOffice NVARCHAR(50))
 AS
 BEGIN
 SET NOCOUNT ON;
 SELECT aac.aac_person.Gender_Person AS Gender, COUNT(aac.aac_person.Gender_Person) AS Quantity
 FROM AAC_Person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
 GROUP BY
 aac.aac_person.Gender_Person;
 
END;
 
 GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_CountryPerson_UAD];

 CREATE PROCEDURE AAC_Statistics_CountryPerson_UAD()
 AS
 BEGIN
 SET NOCOUNT ON;
SELECT geo_data.geo_country.Description_Country AS Country, COUNT(geo_data.geo_country.ID_Country) AS Quantity
 FROM aac.aac_person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country 
 WHERE aac.aac_person.Status_Person = 'Habilitado'
 GROUP BY
geo_data.geo_country.Description_Country;
 
END;
 
 GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_CountryPerson_BO_UAD];

 CREATE PROCEDURE AAC_Statistics_CountryPerson_BO_UAD(
 @p_ID_BranchOffice NVARCHAR(50))
 AS
 BEGIN
 SET NOCOUNT ON;
SELECT geo_data.geo_country.Description_Country AS Country, COUNT(geo_data.geo_country.ID_Country) AS Quantity
 FROM aac.aac_person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_country ON aac.aac_person.ID_Country = geo_data.geo_country.ID_Country 
 WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
 GROUP BY
geo_data.geo_country.Description_Country;
 
END;
 
 GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_ProvincePerson_UAD];

CREATE PROCEDURE AAC_Statistics_ProvincePerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_province.Description_Province AS Province, COUNT(geo_data.geo_province.ID_Province) AS Quantity
FROM aac.aac_person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province 
WHERE aac.aac_person.Status_Person = 'Habilitado'
GROUP BY
geo_data.geo_province.Description_Province;

END;
GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_ProvincePerson_BO_UAD];

CREATE PROCEDURE AAC_Statistics_ProvincePerson_BO_UAD(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_province.Description_Province AS Province, COUNT(geo_data.geo_province.ID_Province) AS Quantity
FROM aac.aac_person
INNER JOIN geo_data.geo_province ON aac.aac_person.ID_Province = geo_data.geo_province.ID_Province 
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
geo_data.geo_province.Description_Province;

END;
GO







DROP PROCEDURE IF EXISTS [AAC_Statistics_DistrictPerson_UAD];

CREATE PROCEDURE AAC_Statistics_DistrictPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_district.Description_District AS District, COUNT(geo_data.geo_district.ID_District) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
 WHERE aac.aac_person.Status_Person = 'Habilitado'
 GROUP BY
geo_data.geo_district.Description_District;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_DistrictPerson_BO_UAD];

CREATE PROCEDURE AAC_Statistics_DistrictPerson_BO_UAD(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_district.Description_District AS District, COUNT(geo_data.geo_district.ID_District) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_district ON aac.aac_person.ID_District = geo_data.geo_district.ID_District
 WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
 GROUP BY
geo_data.geo_district.Description_District;

END;
GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_CantonPerson_UAD];

CREATE PROCEDURE AAC_Statistics_CantonPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_canton.Description_Canton AS Canton, COUNT(geo_data.geo_canton.ID_Canton) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
 WHERE aac.aac_person.Status_Person = 'Habilitado'
 GROUP BY
geo_data.geo_canton.Description_Canton;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_CantonPerson_BO_UAD];

CREATE PROCEDURE AAC_Statistics_CantonPerson_BO_UAD(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT geo_data.geo_canton.Description_Canton AS Canton, COUNT(geo_data.geo_canton.ID_Canton) AS Quantity
 FROM aac.aac_person
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 INNER JOIN geo_data.geo_canton ON aac.aac_person.ID_Canton = geo_data.geo_canton.ID_Canton
 WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
 GROUP BY
geo_data.geo_canton.Description_Canton;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_CivilStatusPerson_UAD];

CREATE PROCEDURE AAC_Statistics_CivilStatusPerson_UAD()
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.CivilStatus_Person AS CivilStatus, COUNT(aac.aac_person.CivilStatus_Person) AS Quantity
 FROM aac.aac_person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 WHERE aac.aac_person.Status_Person = 'Habilitado'
 GROUP BY
aac.aac_person.CivilStatus_Person;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_CivilStatusPerson_BO_UAD];

CREATE PROCEDURE AAC_Statistics_CivilStatusPerson_BO_UAD(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT aac.aac_person.CivilStatus_Person AS CivilStatus, COUNT(aac.aac_person.CivilStatus_Person) AS Quantity
 FROM aac.aac_person 
 INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
 WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
 GROUP BY
aac.aac_person.CivilStatus_Person;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_PersonDirector_CIF];

CREATE PROCEDURE AAC_Statistics_PersonDirector_CIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_person.Name_Person AS Director, COUNT(aac.aac_person.Name_Person) AS Quantity 
FROM aac.aac_cif_ciftype
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC' AND aac.aac_person.Status_Person = 'Habilitado'
GROUP BY
aac.aac_person.Name_Person;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_PersonDirector_BO_CIF];

CREATE PROCEDURE AAC_Statistics_PersonDirector_BO_CIF(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_person.Name_Person AS Director, COUNT(aac.aac_person.Name_Person) AS Quantity 
FROM aac.aac_cif_ciftype
INNER JOIN AAC_Person ON AAC_CIF_CIFType.ID_Person = AAC_Person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
INNER JOIN AAC_CIFType ON AAC_CIF_CIFType.ID_CIFType_CIFType = AAC_CIFType.ID_CIFType_CIFType
WHERE AAC_CIF_CIFType.ID_CIFType_CIFType = 'PC' AND aac.aac_person.Status_Person = 'Habilitado' 
AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
aac.aac_person.Name_Person;

END;
GO




DROP PROCEDURE IF EXISTS [AAC_Statistics_PaymentMethod_CIF];

CREATE PROCEDURE AAC_Statistics_PaymentMethod_CIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.PaymentMethod_CIF AS PaymentMethod, COUNT(aac.aac_cif.PaymentMethod_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado'
GROUP BY
aac.aac_cif.PaymentMethod_CIF;

END;
GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_PaymentMethod_BO_CIF];

CREATE PROCEDURE AAC_Statistics_PaymentMethod_BO_CIF(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.PaymentMethod_CIF AS PaymentMethod, COUNT(aac.aac_cif.PaymentMethod_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
aac.aac_cif.PaymentMethod_CIF;

END;
GO




DROP PROCEDURE IF EXISTS [AAC_Statistics_Classification_CIF];

CREATE PROCEDURE AAC_Statistics_Classification_CIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.Classification_CIF AS Classification, COUNT(aac.aac_cif.Classification_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado'
GROUP BY
aac.aac_cif.Classification_CIF;

END;
GO





DROP PROCEDURE IF EXISTS [AAC_Statistics_Classification_BO_CIF];

CREATE PROCEDURE AAC_Statistics_Classification_BO_CIF(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.Classification_CIF AS Classification, COUNT(aac.aac_cif.Classification_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
aac.aac_cif.Classification_CIF;

END;
GO




DROP PROCEDURE IF EXISTS [AAC_Statistics_Denomination__CIF];
CREATE PROCEDURE AAC_Statistics_Denomination__CIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.Denomination_CIF AS Denomination, COUNT(aac.aac_cif.Denomination_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado'
GROUP BY
aac.aac_cif.Denomination_CIF;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_Denomination_BO__CIF];
CREATE PROCEDURE AAC_Statistics_Denomination_BO__CIF(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.Denomination_CIF AS Denomination, COUNT(aac.aac_cif.Denomination_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
aac.aac_cif.Denomination_CIF;

END;
GO




DROP PROCEDURE IF EXISTS [AAC_Statistics_TypeOfCurrency__CIF];
CREATE PROCEDURE AAC_Statistics_TypeOfCurrency__CIF()
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.TypeOfCurrency_CIF AS TypeOfCurrency, COUNT(aac.aac_cif.TypeOfCurrency_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' 
GROUP BY
aac.aac_cif.TypeOfCurrency_CIF;

END;
GO






DROP PROCEDURE IF EXISTS [AAC_Statistics_TypeOfCurrency_BO__CIF];
CREATE PROCEDURE AAC_Statistics_TypeOfCurrency_BO__CIF(
@p_ID_BranchOffice NVARCHAR(50))
AS
BEGIN
SET NOCOUNT ON;
SELECT  aac.aac_cif.TypeOfCurrency_CIF AS TypeOfCurrency, COUNT(aac.aac_cif.TypeOfCurrency_CIF) AS Quantity 
FROM aac.aac_cif
INNER JOIN aac.aac_person ON aac.aac_cif.ID_Person = aac.aac_person.ID_Person
INNER JOIN aac.aac_branchoffice ON aac.aac_person.ID_BranchOffice = aac.aac_branchoffice.ID_BranchOffice
WHERE aac.aac_person.Status_Person = 'Habilitado' AND aac.aac_branchoffice.ID_BranchOffice = @p_ID_BranchOffice
GROUP BY
aac.aac_cif.TypeOfCurrency_CIF;

END;
GO
