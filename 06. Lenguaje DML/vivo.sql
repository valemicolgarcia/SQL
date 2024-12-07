use gamersmodel;

select * from level_game;

INSERT INTO level_game (id_level, description)
VALUES (16, 'Nivel 16');

INSERT INTO level_game (id_level, description)
VALUES (17, 'N17') , (19, 'N19');

-- No puedo poner dos veces el mismo dato porque estoy violando la primary key

SELECT * FROM game;

INSERT INTO game (id_game, name, description, id_level, id_class) -- ESTO TIENE UN PROBLEMA
VALUES (101, 'Super mario bros', 'super mario bros' ,15, 137);

DESCRIBE game;

ALTER TABLE game
ADD COLUMN price DOUBLE (10,2);


SELECT *  FROM level_game
WHERE id_level IN (17,18,25);

SELECT * FROM level_game
WHERE id_level > 16
AND id_level < 20;

UPDATE level_game
SET description = 'nivel modificado 16'
WHERE id_level = 16;

UPDATE game 
SET name = 'Juego modificado',
	description = 'Descripcion del juego',
	id_level = 15,
	id_class = 15
WHERE id_game = 2;

UPDATE level_game -- NO HACER ESTO, NO ALTERAR ID
SET id_level = 32
WHERE id_level = 17;

DELETE FROM level_game
WHERE id_level IN (17,18,25);

DELETE FROM level_game;


CREATE TABLE games_promoted
(id_game int not null,
id_system_user int not null,
primary key (id_game, id_system_user));

SELECT * FROM games_promoted;

INSERT INTO games_promoted (id_game, id_system_user)
SELECT g.id_game, su.id_system_user
FROM game as g
INNER JOIN system_user as su
WHERE su.email like '%.org'
AND NOT EXISTS (SELECT 1 
					FROM play as p
                    WHERE p.id_game = g.id_game
                    AND p.id_system_user = su.id_system_user)
ORDER BY g.id_game, su.id_system_user; 


DELETE FROM games_promoted
WHERE id_system_user IN (SELECT id_system_user FROM system_user
							WHERE email like '%w3.org');






