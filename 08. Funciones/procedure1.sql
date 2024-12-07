DELIMITER **

DROP PROCEDURE p_obtener_juegos;

**

CREATE PROCEDURE p_obtener_juegos(par_id_game INT)
BEGIN

	SELECT id_game, name, description
    FROM game
    WHERE id_game = par_id_game;
    
    SELECT *
    FROM play
    WHERE id_game = par_id_game;

END

**