CREATE DATABASE BancoMardoqueo;
GO
USE BancoMardoqueo;
GO

-- 1. Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Correo NVARCHAR(100),
    FechaRegistro DATE,
    Estado BIT -- 1 = Activo, 0 = Inactivo
);

------------- 2. Cuentas
CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY IDENTITY,
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    NumeroCuenta CHAR(10) UNIQUE,
    TipoCuenta NVARCHAR(50), -- Ahorros, Corriente
    Saldo DECIMAL(18, 2),
    Activa BIT -- 1 = Activa, 0 = Cerrada
);

-------------- 3. Transacciones
CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY IDENTITY,
    CuentaID INT FOREIGN KEY REFERENCES Cuentas(CuentaID),
    Tipo NVARCHAR(20), -- Depósito, Retiro, Transferencia
    Monto DECIMAL(18, 2),
    Fecha DATETIME DEFAULT GETDATE()
);

---------------------- 4. Empleados (para auditoría)
CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY IDENTITY,
    Nombre NVARCHAR(100),
    Cargo NVARCHAR(50),
    Activo BIT
);

-- 5. AuditoriaTransacciones
CREATE TABLE AuditoriaTransacciones (
    LogID INT PRIMARY KEY IDENTITY,
    TransaccionID INT,
    EmpleadoID INT,
    FechaAccion DATETIME DEFAULT GETDATE(),
    Descripcion NVARCHAR(255)
);
