-- 1. CREACIÓN DE TABLAS

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY,
    Nombre NVARCHAR(100),
    Email NVARCHAR(100),
    FechaRegistro DATE
);

CREATE TABLE Cuentas (
    CuentaID INT PRIMARY KEY,
    ClienteID INT FOREIGN KEY REFERENCES Clientes(ClienteID),
    TipoCuenta NVARCHAR(50),
    Saldo DECIMAL(18, 2)
);

CREATE TABLE Transacciones (
    TransaccionID INT PRIMARY KEY,
    CuentaID INT FOREIGN KEY REFERENCES Cuentas(CuentaID),
    Monto DECIMAL(18, 2),
    TipoTransaccion NVARCHAR(50), -- 'Deposito' o 'Retiro'
    FechaTransaccion DATETIME
);

-- 2. INSERTAR DATOS DE PRUEBA

INSERT INTO Clientes VALUES
(1, 'Ana Gómez', 'ana@gmail.com', '2023-01-15'),
(2, 'Luis Torres', 'luis@gmail.com', '2023-03-12'),
(3, 'Carlos Ruiz', 'carlos@gmail.com', '2024-05-20');

INSERT INTO Cuentas VALUES
(101, 1, 'Ahorro', 1500.00),
(102, 1, 'Corriente', 500.00),
(103, 2, 'Ahorro', 2500.00),
(104, 3, 'Corriente', 100.00);

INSERT INTO Transacciones VALUES
(1, 101, 500.00, 'Deposito', '2024-01-01'),
(2, 101, 200.00, 'Retiro', '2024-02-01'),
(3, 102, 300.00, 'Deposito', '2024-03-01'),
(4, 103, 1000.00, 'Deposito', '2024-04-01'),
(5, 104, 50.00, 'Retiro', '2024-04-02');