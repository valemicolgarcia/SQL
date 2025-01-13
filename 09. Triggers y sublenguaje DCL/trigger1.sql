DELIMITER &&

CREATE TRIGGER tr_before_insert_game BEFORE INSERT ON game
	for each row
BEGIN 
-- BEFORE INSERT ON: especifica que el trigger se ejecuta antes de cada insercion en la tabla game
-- for each row: indica que el trigger se aplicara a cd fila nueva que se intente insertar en la tabla game

-- new: tiene el registro que estamos modificando, o insertando
-- old: registro anterior

	DECLARE ln_nuevo_id INT;
	SELECT max(id_game)+1 -- obtengo el maximo id del campo id_game de la tabla game, lo incremento y lo guardo en ln_nuevo_id
		INTO ln_nuevo_id
        FROM game;
	SET new.id_game = ln_nuevo_id;


END

&&



DELIMITER &&

CREATE TRIGGER tr_after_delete_game AFTER DELETE ON game
	for each row
BEGIN 
-- BEFORE INSERT ON: especifica que el trigger se ejecuta antes de cada insercion en la tabla game
-- for each row: indica que el trigger se aplicara a cd fila nueva que se intente insertar en la tabla game

-- new: tiene el registro que estamos modificando, o insertando
-- old: registro anterior

	INSERT INTO game_hist (id_game, name, description, fecha_evento, tipo_evento)
    VALUES (old.id_game, old.name, old.description, current_timestamp(), 'AFTER DELETE');

END

&&

DELIMITER &&

CREATE TRIGGER tr_before_delete_game BEFORE DELETE ON game
	for each row
BEGIN 

	DELETE FROM play
    WHERE id_game = old.id_game;

END

&&