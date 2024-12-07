-- no deterministic
-- no sql

DELIMITER &&

CREATE FUNCTION f_get_fecha_formateada()
 RETURNS VARCHAR(12) NO SQL
BEGIN

	RETURN DATE_FORMAT(sysdate(),'%d/%m/%Y');

END;

&&

-- cambia cuando cambia el dia, entonces no puede ser deterministic
-- tipos principales de funciones:
-- DETERMINISTIC
-- NO DETERMINISTIC / NOSQL
-- READS SQL DATA

-- otros:
-- MODIFIES SQL DATA
-- SQL SECURITY DEFINER (si hay que poner codigo para crear)