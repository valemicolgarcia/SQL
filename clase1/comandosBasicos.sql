CREATE TABLE Clientes
( id int,
nombre varchar(100),
email varchar(100));

INSERT INTO Clientes (id, nombre, email)
VALUES (1, 'Ana Ruiz' , 'ana@example.com');

SELECT * FROM clientes;
SET SQL_SAFE_UPDATES = 0;

UPDATE Clientes
SET email = 'nuevoana@example.com'
where id = 1;

DELETE FROM Clientes
WHERE id = 1;