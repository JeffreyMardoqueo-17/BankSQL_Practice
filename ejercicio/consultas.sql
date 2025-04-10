-- 3. CONSULTAS SELECT

-- a. Mostrar todos los clientes
SELECT * FROM Clientes;

-- b. Mostrar nombre y saldo de las cuentas
SELECT C.Nombre, CU.Saldo
FROM Clientes C
INNER JOIN Cuentas CU ON C.ClienteID = CU.ClienteID;

-- c. Mostrar todas las transacciones con nombre del cliente y tipo de cuenta
SELECT C.Nombre, CU.TipoCuenta, T.Monto, T.TipoTransaccion, T.FechaTransaccion
FROM Transacciones T
INNER JOIN Cuentas CU ON T.CuentaID = CU.CuentaID
INNER JOIN Clientes C ON CU.ClienteID = C.ClienteID;

-- d. LEFT JOIN para ver clientes aunque no tengan cuentas
SELECT C.Nombre, CU.CuentaID
FROM Clientes C
LEFT JOIN Cuentas CU ON C.ClienteID = CU.ClienteID;

-- e. RIGHT JOIN para ver cuentas aunque no tengan clientes (por prueba, no debería pasar)
SELECT C.Nombre, CU.CuentaID
FROM Clientes C
RIGHT JOIN Cuentas CU ON C.ClienteID = CU.ClienteID;

-- f. FULL JOIN entre Clientes y Cuentas
SELECT C.Nombre, CU.CuentaID
FROM Clientes C
FULL JOIN Cuentas CU ON C.ClienteID = CU.ClienteID;

-- 4. FILTROS

-- a. Clientes registrados después de 01/01/2023
SELECT * FROM Clientes
WHERE FechaRegistro > '2023-01-01';

-- b. Transacciones mayores a 300
SELECT * FROM Transacciones
WHERE Monto > 300;

-- c. Agrupar total por tipo de transacción
SELECT TipoTransaccion, SUM(Monto) AS Total
FROM Transacciones
GROUP BY TipoTransaccion;

-- d. Mostrar tipos de transacción con total mayor a 500
SELECT TipoTransaccion, SUM(Monto) AS Total
FROM Transacciones
GROUP BY TipoTransaccion
HAVING SUM(Monto) > 500;

-- e. Ordenar cuentas por saldo de mayor a menor
SELECT * FROM Cuentas
ORDER BY Saldo DESC;

-- 5. UPDATE

-- Actualizar el email de un cliente
UPDATE Clientes
SET Email = 'ana_gomez@gmail.com'
WHERE ClienteID = 1;

-- 6. DELETE

-- Eliminar una transacción
DELETE FROM Transacciones
WHERE TransaccionID = 5;
