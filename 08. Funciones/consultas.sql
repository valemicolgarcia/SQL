SELECT f_calcular_area(10,5);
use gamersmodel;
SELECT *
	FROM play
    WHERE id_game = 1;

SELECT f_get_jugadas(6);

SELECT id_game, name, description, f_get_jugadas(id_game)
FROM game
WHERE f_get_jugadas(id_game) >5
ORDER BY f_get_jugadas(id_game) DESC;

