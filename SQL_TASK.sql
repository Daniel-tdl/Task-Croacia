CREATE TABLE  PersonTypes (
  idpersonTypes INT IDENTITY(1,1) PRIMARY KEY,
  TypesName VARCHAR(45) NOT NULL 
);
GO

CREATE TABLE Person (
  idPerson INT IDENTITY(1,1) PRIMARY KEY,
  namePerson VARCHAR(100) NULL,
  IdentNr VARCHAR(100) NOT NULL ,
  firstName VARCHAR(100) NULL ,
  surename VARCHAR(100) NULL,
  idpersonTypes INT NOT NULL 
);
GO

CREATE INDEX fk_Person_PersonTypes_idx ON Person (idpersonTypes ASC);
GO

CREATE TABLE Department (
  idDepartment INT IDENTITY(1,1) PRIMARY KEY,
  department VARCHAR(45) NULL
);
GO

CREATE TABLE Country (
  idCountry INT IDENTITY(1,1) PRIMARY KEY,
  country VARCHAR(45) NULL ,
);
GO

CREATE TABLE Servicee (
  idService INT IDENTITY(1,1) PRIMARY KEY,
  serviceDes VARCHAR(45) NULL 
);
GO

CREATE TABLE Konto (
  idKonto INT IDENTITY(1,1) PRIMARY KEY,
  KontoNr VARCHAR(10) NOT NULL 
);
GO

CREATE TABLE Supplier (
  idSupplier INT IDENTITY(1,1) PRIMARY KEY,
  Person_idPerson INT NOT NULL ,
  Service_idService INT NOT NULL ,
  Konto_idKonto INT NOT NULL 
);
GO

CREATE INDEX fk_Supplier_Person1_idx ON Supplier (Person_idPerson ASC);
GO

CREATE INDEX fk_Supplier_Service1_idx ON Supplier (Service_idService ASC);
GO

CREATE INDEX fk_Supplier_Konto1_idx ON Supplier (Konto_idKonto ASC);
GO

CREATE TABLE Employee (
  idEmployee INT IDENTITY(1,1) PRIMARY KEY,
  Department_idDepartment INT NOT NULL ,
  Person_idPerson INT NOT NULL 
);
GO

CREATE INDEX fk_Employee_Department1_idx ON Employee (Department_idDepartment ASC);
GO

CREATE INDEX fk_Employee_Person1_idx ON Employee (Person_idPerson ASC);
GO

CREATE TABLE Traveler (
  idTraveler INT IDENTITY(1,1) PRIMARY KEY,
  Country_idCountry INT NOT NULL ,
  Person_idPerson INT NOT NULL 
);
GO

CREATE INDEX fk_Employee_Person1_idx ON Traveler (Person_idPerson ASC);
GO

CREATE INDEX fk_Traveler_Country1_idx ON Traveler (Country_idCountry ASC);
GO

CREATE TABLE Client (
  idClient INT IDENTITY(1,1) PRIMARY KEY,
  Person_idPerson INT NOT NULL ,
  Konto_idKonto INT NOT NULL 
);
GO

CREATE INDEX fk_Client_Person1_idx ON Client (Person_idPerson ASC);
GO

CREATE INDEX fk_Client_Konto1_idx ON Client (Konto_idKonto ASC) ;
GO


insert into PersonTypes values ('Client');
GO
insert into PersonTypes values ('Supplier');
GO
insert into PersonTypes values ('Service');
GO
insert into PersonTypes values ('Employee');
GO
insert into PersonTypes values ('Traveler');
GO

insert into Department values ('A');
GO
insert into Department values ('B');
GO
insert into Department values ('C');
GO
insert into Department values ('D');
GO
insert into Department values ('E');
GO
insert into Department values ('F');
GO

insert into Country values ('Noruega');
GO
insert into Country values ('Austrália');
GO
insert into Country values ('Croácia');
GO
insert into Country values ('Brazil');
GO
insert into Country values ('Bélgica');
GO
insert into Country values ('Finlândia');
GO
insert into Country values ('Áustria');
GO
insert into Country values ('França');
GO
insert into Country values ('Coreia do Sul');
GO
insert into Country values ('Argentina');
GO


