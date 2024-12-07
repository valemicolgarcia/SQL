DELIMITER $LOQUESEA$

DROP PROCEDURE p_actualizar_datos;

$LOQUESEA$

CREATE PROCEDURE p_actualizar_datos()
BEGIN

	--  PRimero creamos los proveedores siempre y cuando no este en la tabla
	INSERT INTO proveedor (nombre)
	SELECT DISTINCT proveedor FROM productos_mock
	WHERE proveedor NOT IN (SELECT nombre FROM proveedor);

	-- Actualizo el proveedor en nuestra tabla
	UPDATE productos_mock pm
	SET id_proveedor = (SELECT id_proveedor FROm proveedor p WHERE p.nombre = pm.proveedor);

	-- Inserto el producto en nuesta tabla
	INSERT INTO producto (codigo, nombre, id_proveedor, precio, stock)
	SELECT codigo,nombre, id_proveedor, precio, stock
	FROM productos_mock
	WHERE codigo NOT IN (SELECT codigo FROM producto);

	TRUNCATE TABLE productos_mock;

END

$LOQUESEA$