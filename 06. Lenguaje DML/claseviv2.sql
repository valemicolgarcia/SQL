SELECT * FROM vote;

ALTER TABLE vote
ADD COLUMN unique_id_vote INT;

UPDATE vote
SET percent = value * 10;


UPDATE vote 
SET unique_id_vote = (id_game * id_system_user * value * 10);

SELECT *
FROM level_game;

UPDATE level_game
SET description = concat ('Nivel', id_level);

-- actualizar la cantidad de jugadas con una subconsulta

SELECT count(*)
FROM play as p
WHERE p.id_game = 62;


UPDATE game as g
SET g.cnt_play = (
    SELECT COUNT(*)
    FROM play AS p
    WHERE p.id_game = g.id_game
);

-- aquellos juego suq no esten en la tabl play
CREATE TABLE game_not_played (id_game int, name varchar(100), description varchar(200));

-- primera opcion
INSERT INTO game_not_played (id_game, name, description)
SELECT g.id_game, g.name, g.description
FROM game g
WHERE NOT EXISTS (
    SELECT 1
    FROM play p
    WHERE p.id_game = g.id_game
);

-- segunda opcion
INSERT INTO game_not_played (id_game, name, description)
SELECT g.id_game, g.name, g.description
FROM game g
WHERE g.id_game NOT IN(
    SELECT id_game
    FROM play p
);

INSERT INTO system_user (id_system_user, first_name, last_name, email, password, id_user_type)
VALUES (1001,'Santiago','Acosta','ss@ff.com','123456', (SELECT id_user_type 
														  FROM user_type 
														  WHERE description = 'pellentesque volutpat dui maecenas tristique est et tempus'));


