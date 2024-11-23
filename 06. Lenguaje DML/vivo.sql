use gamersmodel;

select * from level_game;

INSERT INTO level_game (id_level, description)
VALUES (16, 'Nivel 16');

INSERT INTO level_game (id_level, description)
VALUES (17, 'N17') , (19, 'N19');

-- No puedo poner dos veces el mismo dato porque estoy violando la primary key

SELECT * FROM game;

INSERT INTO game (id_game, name, description, id_level, id_class)
VALUES (101, 'Super mario bros', 'super mario bros' ,15, 137);

