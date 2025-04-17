--EJERCICIOS (por niveles)
--🟢 BÁSICO
--Obtener todos los clientes registrados.

--Ver todas las cuentas activas con saldo mayor a 1000.

--Listar transacciones realizadas hoy.

--¿Cuántas cuentas tiene cada cliente?

----1. Obtener todos los clientes registrados
SELECT * FROM Clientes;

----2. Ver todas as cuentas activas con saldo mayor a 1000
DECLARE @SaldoMayor INT = 5000;
	select * from
	Cuentas WHERE Activa = 1
	AND Saldo > @SaldoMayor;

--- 3.Listar transacciones realizadas hoy.
SELECT * FROM Transacciones

-----¿Cuántas cuentas tiene cada cliente?
SELECT cl.Nombre, COUNT(*) AS NumeroCuentas
FROM Cuentas cu
JOIN Clientes cl ON cu.ClienteId = cl.ClienteId
GROUP BY cl.Nombre;
