use gamersmodel;
CREATE VIEW v_game_level AS 

SELECT g.id_game, g.name, g.description, g.id_level, g.id_class, c.description as description_class, lg.description as level_description
FROM game g
	INNER JOIN class c ON (c.id_level = g.id_level AND c.id_class = g.id_class)
    INNER JOIN level_game lg ON (lg.id_level = c.id_level)
;

SELECT * FROM v_game_level; -- no almacenamos los datos fisicamente lo que ahorra espacio y almacenamiento
-- siempre consulta las tablas subyacente en tiempo real, se actualizan

-- actualizamos

UPDATE level_game
SET description = 'Testing modification'
WHERE id_level = 2;