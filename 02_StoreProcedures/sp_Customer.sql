-----------CREATE STORE PROCEDURES THE Customer


----obtener todos los Usuarios
CREATE PROCEDURE SP_GetAllCustomer
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Customer;
END;
GO
---OBTENER UN USURIO POR ID

CREATE PROCEDURE SP_GetCustomerById
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Customer WHERE Id = @Id;
END;

GO
-- CREATE TABLE Customer (
--     Id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
--     FirstName VARCHAR(50) NOT NULL,
--     LastName VARCHAR(50) NOT NULL,
--     Age INT NOT NULL,
--     TypeClient VARCHAR(50) NOT NULL, -- Ej: 'Natural', 'Jurídico'
--     DateRegistration DATE NOT NULL,
--     DocumentNumber VARCHAR(20) NOT NULL
-- );
-- GO


CREATE PROCEDURE SP_CreateCustomer
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @Age INT,
    @TypeClient VARCHAR(50),
    @DateRegistration DATE,
    @DocumentNumber VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Customer(FirstName, LastName, Age, TypeClient, DateRegistration, DocumentNumber)
                VALUES(@FirstName, @LastName, @Age, @TypeClient, @DateRegistration, @DocumentNumber);
    ---para confirmar que la operacion fue un exito
    SELECT 'Cliente creado de la mejor forma' AS MESSAGE;
END;
GO