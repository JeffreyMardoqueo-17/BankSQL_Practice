-- Crear base de datos
CREATE DATABASE Bank;
GO

-- Usar base de datos
USE Bank;
GO

-- Tabla: Clientes
CREATE TABLE Customer (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    TypeClient VARCHAR(50) NOT NULL, -- Ej: 'Natural', 'Jurídico'
    DateRegistration DATE NOT NULL,
    DocumentNumber VARCHAR(20) NOT NULL
);
GO

-- Tabla: Cuentas
CREATE TABLE Account (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AccountNumber VARCHAR(20) NOT NULL UNIQUE,
    CustomerId INT NOT NULL FOREIGN KEY REFERENCES Customer(Id),
    TypeAccount VARCHAR(50) NOT NULL, -- Ej: 'Ahorro', 'Corriente'
    Balance DECIMAL(18,2) NOT NULL DEFAULT 0.00,
    [State] BIT NOT NULL DEFAULT 1 -- 1 = activa, 0 = bloqueada
);
GO

-- Tabla: Transacciones
CREATE TABLE Transactions (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AccountId INT NOT NULL FOREIGN KEY REFERENCES Account(Id),
    Amount DECIMAL(18,2) NOT NULL,
    TypeTransaction VARCHAR(50) NOT NULL, -- Ej: 'Depósito', 'Retiro'
    DateTransaction DATE NOT NULL
);
GO

-- Tabla: Log de transacciones (para triggers)
CREATE TABLE LogTransactions (
    Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AccountId INT NOT NULL,
    Amount DECIMAL(18,2) NOT NULL,
    TypeTransaction VARCHAR(50) NOT NULL,
    DateTransaction DATE NOT NULL,
    LogDate DATETIME NOT NULL DEFAULT GETDATE()
);
GO
