----INsert de clientes
INSERT INTO Clientes (Nombre, Correo, FechaRegistro, Estado) VALUES
('Carlos Pérez', 'carlos.perez@email.com', '2024-01-15', 1),
('Ana Morales', 'ana.morales@email.com', '2024-02-10', 1),
('Luis Torres', 'luis.torres@email.com', '2023-12-01', 0);
GO
----INSERT DE CUENTASS
INSERT INTO Cuentas (ClienteID, NumeroCuenta, TipoCuenta, Saldo, Activa) VALUES
(1, '0000123456', 'Ahorros', 1500.00, 1),
(1, '0000123457', 'Corriente', 500.00, 1),
(2, '0000123458', 'Ahorros', 3000.00, 1),
(3, '0000123459', 'Corriente', 0.00, 0);
-----INSERT  DE Transacciones
GO
INSERT INTO Transacciones (CuentaID, Tipo, Monto) VALUES
(1, 'Depósito', 1000.00),
(1, 'Retiro', 200.00),
(2, 'Depósito', 500.00),
(3, 'Depósito', 3000.00),
(3, 'Transferencia', 500.00);
GO
INSERT INTO Empleados (Nombre, Cargo, Activo) VALUES
('María Gómez', 'Cajera', 1),
('Juan Rodríguez', 'Supervisor', 1),
('Pedro Sánchez', 'Auditor', 0);
GO
INSERT INTO AuditoriaTransacciones (TransaccionID, EmpleadoID, Descripcion) VALUES
(1, 1, 'Depósito realizado correctamente por el cliente'),
(2, 1, 'Retiro procesado sin novedades'),
(3, 2, 'Depósito autorizado por supervisor'),
(4, 1, 'Ingreso inicial a cuenta de Ana Morales'),
(5, 2, 'Transferencia observada por supervisor');
GO
SELECT * FROM Clientes;
SELECT * FROM Cuentas;
SELECT * FROM Transacciones;
SELECT * FROM Empleados;
SELECT * FROM AuditoriaTransacciones;
