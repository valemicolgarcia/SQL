use gamersmodel;
-- creamos la vistya
CREATE VIEW  v_game AS
SELECT * FROM game;

-- accedemos a la vista
SELECT * FROM v_game;

-- modificamos
CREATE OR REPLACE VIEW v_game AS
SELECT id_game, name, description FROM game;

SELECT * FROM v_game;

-- vista con multiples tablas

CREATE VIEW v_game_level_2 AS
SELECT g.id_game, g.name, g.description, lg.description as
level_description
FROM game g
	INNER JOIN level_game lg ON (lg.id_level = g.id_level);