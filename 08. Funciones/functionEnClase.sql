-- CREAR funcion que dado el id_game, pueda retornar el nombre concatenado con la descripcion del juego
	DELIMITER %%
 CREATE FUNCTION f_funcion(par_id_game INT)
		RETURNS VARCHAR(60) READS SQL DATA -- con s al final
    BEGIN
		
        DECLARE nomDes VARCHAR(60); -- declaramos la variable
        SET nomDes = (
			SELECT CONCAT(nombre, ' ', descripcion)
			FROM games
			WHERE id_game = par_id_game
    );

        
		RETURN nomDes; -- sin s (solo retorna un valor)
    END
    %%

