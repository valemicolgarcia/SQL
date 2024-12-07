DELIMITER $$

DROP PROCEDURE IF EXISTS p_obtener_cantidad_registros

$$

CREATE PROCEDURE p_obtener_registros(par_tabla VARCHAR(30))
BEGIN

    SET @ls_query = concat('SELECT count(*) FROM ',par_tabla, 'ORDER BY ', par_orden);

	PREPARE runSQL FROM @ls_query;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
	

END

$$