use gamersmodel;

-- creamos vista de una consulta 
-- no puedo tener nombres de columnas duplicadas a la hora de crear una vista
CREATE VIEW view_game_2 AS
SELECT g.id_game, g.name, g.id_level, g.id_class, g.description as description_class, lg.description as description_game
	FROM game as g
	INNER JOIN class AS c ON (c.id_level = g.id_level AND c.id_class = g.id_class)
    INNER JOIN level_game AS lg ON (lg.id_level = c.id_level)
WHERE g.id_level = 1;

SELECT * FROM view_game_2;

CREATE OR REPLACE VIEW v_game_play AS
SELECT g.id_game, g.name, g.description, count(*) cnt
FROM play as p
	INNER JOIN game as g ON (g.id_game = p.id_game)
    GROUP BY g.id_game, g.name, g.description;

SELECT * FROM v_game_play
WHERE cnt > 7;

-- selccionar first_name y last_name de usuarios con mail que termina en webnode.com
CREATE VIEW primer_vista AS
SELECT first_name, last_name 
FROM system_user
WHERE email LIKE '%webnode.com';

-- muestre todos los datos de los juegos que han finalizados
CREATE VIEW segunda_vista AS
SELECT g.id_game, g.name, g.description, g.id_level, g.id_class
FROM game AS g
INNER JOIN play AS p ON g.id_game = p.id_game
WHERE p.completed = 1
GROUP BY g.id_game, g.name, g.description, g.id_level, g.id_class
;


-- segunda opcion para resolver
CREATE OR REPLACE VIEW v_game_completed AS
SELECT DISTINCT id_game, name, description, id_level, id_class FROM game
WHERE id_game IN (
	SELECT id_game FROM play
    WHERE completed = 1
);

-- muestre los distintos juegos que tuvieron votacion mayor a 9
CREATE OR REPLACE VIEW tercer_vista AS
SELECT g.id_game, g.name, g.description, g.id_level, g.id_class
FROM game as g
INNER JOIN vote as v ON v.id_game = g.id_game
WHERE value >= 9
;

-- muestre nombe, apellido y mail de los usuarios que juegan al FIFA 22

CREATE OR REPLACE VIEW cuarta_vista AS
SELECT su.first_name, su.last_name, su.email
FROM gammers.game AS g
LEFT JOIN gammers.play AS p ON g.id_game = p.id_game
LEFT JOIN gammers.system_user AS su ON p.id_system_user = su.id_system_user
WHERE g.id_game = 12;

SELECT 
    g.id_game, 
    g.name, 
    g.description, 
    g.id_level, 
    g.id_class, 
    c.description AS description_class, 
    lg.description AS description_game,
    p.completed, 
    su.id_system_user, 
    CONCAT(su.first_name, ' ', su.last_name) AS user_full_name, 
    su.email
FROM play AS p
INNER JOIN game AS g ON (g.id_game = p.id_game)
INNER JOIN class AS c ON (c.id_level = g.id_level AND c.id_class = g.id_class)
INNER JOIN level_game AS lg ON (lg.id_level = c.id_level)
INNER JOIN system_user AS su ON (su.id_system_user = p.id_system_user);

CREATE TABLE tbl_game_play AS
SELECT * FROM v_game_play;

SELECT * FROM tbl_game_play;







