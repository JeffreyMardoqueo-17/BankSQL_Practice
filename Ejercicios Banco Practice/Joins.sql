---------- 1. Mostrar el nombre de todos los clientes y su número de cuenta
SELECT c.Nombre, cu.NumeroCuenta 
FROM Clientes c
JOIN Cuentas cu ON c.ClienteID = cu.ClienteID;
------------ "Dame el nombre del cliente y su número de cuenta, juntando ambas tablas por su ClienteID."

------------ 2. Listar las transacciones realizadas, incluyendo el número de cuenta y tipo de cuenta
SELECT t.TransaccionID, cu.NumeroCuenta, cu.TipoCuenta, t.Tipo, t.Monto, t.Fecha
FROM Transacciones t
JOIN Cuentas cu ON t.CuentaID = cu.CuentaID;
--------------------"Dame la info de la transacción, pero también la cuenta y su tipo."

------------ 3. Ver todos los clientes con cuentas activas
SELECT DISTINCT c.Nombre
FROM Clientes c
JOIN Cuentas cu ON c.ClienteID = cu.ClienteID
WHERE cu.Activa = 1;
----------💬 "Quiero los clientes que tengan al menos una cuenta activa."


------------ 4. Mostrar las cuentas que tienen un saldo mayor a 1000
SELECT NumeroCuenta, Saldo
FROM Cuentas
WHERE Saldo > 1000;
-----------"Muéstrame las cuentas con más de 1000 de saldo."
-------------------- 5. Ver los clientes inactivos (Estado = 0)
SELECT Nombre, Correo
FROM Clientes
WHERE Estado = 0;
----------"Dame los clientes que ya no están activos."