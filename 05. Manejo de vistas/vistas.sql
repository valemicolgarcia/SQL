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
    
-- MODIFICAR Y ELIMINAR VISTAS

CREATE VIEW v_game2 AS
SELECT id_game, name, description FROM game;

-- ALTER : queremos agregarle dos columnas
ALTER VIEW v_game2 AS
SELECT id_game, name, description, id_level, id_Class FROM game;

-- REPLACE CON CRETAE VIEW --> tambien me deja eliminar

-- ELIMINAR VISTA

DROP VIEW v_game2;

-- FILTROS A LAS VISTAS

SELECT * FROM v_game;

CREATE OR REPLACE VIEW v_game AS
SELECT id_game, name, description 
FROM game
WHERE id_level = 2;


-- VISTAS CON MULTIPLES TABLAS

CREATE OR REPLACE VIEW v_game_level AS
SELECT g.id_game, g.name, g.description, lg.description as level_description
FROM game g
	INNER JOIN level_game lg ON (lg.id_level = g.id_level);

SELECT * FROM v_game_level;

