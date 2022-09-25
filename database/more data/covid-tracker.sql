create database covidtracker;
use covidtracker;

create table role(
	rId bigint not null primary key IDENTITY(1, 1),
    rName varchar(255) not null,
    rCreateddate DATETIME DEFAULT (getdate()),
	rModifieddate DATETIME NULL
);

create table [dbo].[user](
	uId bigint not null primary key IDENTITY(1, 1),
    uUsername varchar(150) not null,
    uPassword varchar(150) not null,
    uFullname varchar(150) not null,
    uPhone varchar(150) not null,
    uAddress varchar(150) not null,
    uEmail varchar(150) null,
    uStatus int not null,
    uRole bigint not null,
    uCreateddate DATETIME DEFAULT (getdate()),
	uModifieddate DATETIME NULL,
	uAvatar varchar(500) not null
);

ALTER TABLE [dbo].[user] ADD CONSTRAINT fk_user_role foreign key(uRole) references role(rId);

CREATE TABLE charity (
  cId bigint NOT NULL PRIMARY KEY IDENTITY(1, 1),
  cName varchar(150) not null,
  cAddress varchar(150) not null,
  cUser bigint NOT NULL,
  cProduct bigint NOT NULL,
    cCreateddate DATETIME DEFAULT (getdate()),
	cModifieddate DATETIME NULL
);

CREATE TABLE products (
	pId bigint NOT NULL PRIMARY KEY IDENTITY(1, 1),
	pName VARCHAR(255) NOT NULL,
	pNumber int NOT NULL,
    pCreateddate DATETIME DEFAULT (getdate()),
	pModifieddate DATETIME NULL,
	uImage varchar(500) not null
  
);

CREATE TABLE patient (
	bnId bigint NOT NULL PRIMARY KEY IDENTITY(1, 1),
	bnCode VARCHAR(10) NOT NULL,
	bnName NVARCHAR(100) NOT NULL,
	bnX VARCHAR(255) NOT NULL,
	bnY VARCHAR(255) NOT NULL,
	bnAddress NVARCHAR(500) NOT NULL,
	bnStatus NVARCHAR(50) NOT NULL,
    bnCreateddate DATETIME DEFAULT (getdate()),
	bnModifieddate DATETIME NULL
);

create table Area(aId int not null primary key IDENTITY(1,1),
	aX VARCHAR(255) NOT NULL,
	aY VARCHAR(255) NOT NULL,
	aAddress NVARCHAR(500) NOT NULL,
	aDetail NTEXT NOT NULL,
    aCreateddate DATETIME DEFAULT (getdate()),
	aModifieddate DATETIME NULL
);


ALTER TABLE charity ADD CONSTRAINT fk_charity_product FOREIGN KEY (cProduct) REFERENCES products(pId) ON DELETE CASCADE;
ALTER TABLE charity ADD CONSTRAINT fk_charity_user FOREIGN KEY (cUser) REFERENCES [dbo].[user](uId) ON DELETE CASCADE;


