SELECT * from clientes; -- tiene datos repetidos, por eso normalizamos

CREATE TABLE Contactos ( -- nueva tabla contactos
id_contacto int auto_increment primary key,
telefono varchar (20),
email varchar(100));

INSERT INTO Contactos (telefono, email)  -- se insertan tel e email unicos desde clientes eliminadnado DUPLICADOS gracias a INSTINCT
SELECT distinct telefono, email
FROM Clientes;

ALTER TABLE Clientes
ADD COLUMN id_contacto INT; -- agrego columna q se va a relacionar con tabla contactos

ALTER TABLE Clientes 
ADD FOREIGN KEY (id_contacto_) references Contactos(Id_Contacto); -- relacion entre columna con tabla

UPDATE Clientes cl -- esta consulta se realiza sin indices por eso tarda
SET cl.Id_Contacto = (SELECT co.Id_Contacto FROM Contactos co WHERE co.email = cl.email AND co.telefono = cl. telefono); 

CREATE INDEX idx_email on Contactos (email); -- indice en la col email de contactos

UPDATE Clientes -- elimina los valores de id_contacto en clientes
SET ID_Contacto = null;

ALTER TABLE Clientes
DROP COLUMN telefono;

ALTER TABLE Clientes
DROP COLUMN email;

