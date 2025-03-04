﻿CREATE TABLE [People] (
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[FullName] NTEXT,
	[Age] BIGINT NOT NULL,
	[Height] INT NOT NULL,
	[Dob] DATETIME NOT NULL
);

CREATE TABLE [Orders] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[PersonId] UNIQUEIDENTIFIER REFERENCES [People](Id),
	[PoNumber] NTEXT NOT NULL,
	[OrderStatus] INT NOT NULL,
	[CreatedOn] DATETIME NOT NULL,
	[CreatedBy] NTEXT NOT NULL
);

CREATE TABLE [OrderLines] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[OrderId] INT NOT NULL REFERENCES [Orders](Id),
	[Qty] SMALLINT NOT NULL,
	[SellPrice] NUMERIC(10, 4) NOT NULL
);

CREATE TABLE [SpecificPeople] (
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY,
	[FullName] NTEXT,
	[Age] BIGINT NOT NULL,
	[Height] INT NOT NULL,
	[Dob] DATETIME NOT NULL
);

CREATE TABLE [SpecificOrders] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[PersonId] UNIQUEIDENTIFIER REFERENCES [SpecificPeople](Id),
	[PoNumber] NTEXT NOT NULL,
	[OrderStatus] INT NOT NULL,
	[CreatedOn] DATETIME NOT NULL,
	[CreatedBy] NTEXT NOT NULL
);

CREATE TABLE [SpecificOrderLines] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[OrderId] INT NOT NULL REFERENCES [SpecificOrders](Id),
	[Qty] SMALLINT NOT NULL,
	[SellPrice] NUMERIC(10, 4) NOT NULL
);

CREATE TABLE [TransactionLogs] (
	[Description] NTEXT NOT NULL,
	[CreatedOn] DATETIME NOT NULL
);

CREATE TABLE [Note] (
	[Id] INT IDENTITY(1,1) PRIMARY KEY,
	[Text] NTEXT NOT NULL,
	[CreatedOn] DATETIME NOT NULL
);