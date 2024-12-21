

USE productos2;
DROP TABLE producto;

CREATE TABLE proveedor2
	(id_proveedor INT NOT NULL auto_increment primary KEY,
    nombre VARCHAR(50));

CREATE TABLE producto 
	(id_producto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo VARCHAR(10) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    id_proveedor INT NOT NULL,
    precio DECIMAL (10,2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (id_proveedor) references proveedor2(id_proveedor));

SELECT * FROM mock_productos;
SELECT DISTINCT proveedor FROM mock_productos;

INSERT INTO proveedor2 (nombre)
SELECT DISTINCT proveedor FROM mock_productos;

SELECT * FROM proveedor2;

INSERT INTO producto (codigo, nombre, id_proveedor, precio, stock)
SELECT pm.codigo, pm.nombre, p.id_proveedor, pm.precio, pm.stock
	FROM mock_productos pm
    INNER JOIN proveedor p ON (p.nombre = pm.proveedor);
    
ALTER TABLE mock_productos
ADD COLUMN id_proveedor INT;

UPDATE mock_productos pm
SET id_proveedor = (SELECT id_proveedor FROM proveedor2 p WHERE p.nombre = pm.proveedor);

SELECT * FROM mock_productos;

INSERT INTO producto (codigo, nombre, id_proveedor, precio, stock)
SELECT codigo, nombre, id_proveedor, precio, stock
FROM mock_productos;
    
TRUNCATE TABLE mock_productos;


