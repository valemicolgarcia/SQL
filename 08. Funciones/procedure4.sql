DELIMITER $$

DROP PROCEDURE IF EXISTS p_obtener_registros

$$

CREATE PROCEDURE p_obtener_registros(out par_tabla VARCHAR(30), OUT par_orden VARCHAR(20))
BEGIN

    SET @ls_query = concat('SELECT * FROM ',par_tabla); -- @:global 

	IF par_orden IS NOT NULL THEN
		SET @ls_query = concat(@ls_query,' ORDER BY ',par_orden);
    END IF;

	PREPARE runSQL FROM @ls_query;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
	

END

$$