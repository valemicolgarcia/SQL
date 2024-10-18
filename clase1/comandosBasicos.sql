CREATE TABLE Clientes
( id int,
nombre varchar(100),
email varchar(100));

INSERT INTO Clientes (id, nombre, email)
VALUES (1, 'Ana Ruiz' , 'ana@example.com');

SELECT * FROM clientes;

UPDATE Clientes
SET email = 'nuevoana@example.com'
where id = 1;
