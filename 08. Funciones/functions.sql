	DELIMITER %%
    -- todo lo que esta antes del delimitador lo va a tomat como lo que tiene que crear
    DROP FUNCTION IF EXISTS f_calcular_area;
    
    CREATE FUNCTION f_calcular_area(par_ancho INT, par_alto INT)
		RETURNS INT DETERMINISTIC -- con s al final
    BEGIN
		
        DECLARE ln_area INT; -- declaramos la variable
        SET ln_area = 12*15;
        
		RETURN ln_area; -- sin s (solo retorna un valor)
    END
    %%
    -- ADENTRO de la funcion no se puede ni insert, ni update, ni delete
    -- DETERMINISTIC: mismo parametros de entrada, mismos de salida (memoria cache)
    
       -- todo lo que esta antes del delimitador lo va a tomat como lo que tiene que crear
    DROP FUNCTION IF EXISTS f_get_jugadas;
    
    CREATE FUNCTION f_get_jugadas(par_id_game INT)
		RETURNS INT DETERMINISTIC -- con s al final
    BEGIN
		
        DECLARE ln_cnt_jugadas INT; -- declaramos la variable
        SET ln_cnt_jugadas = (SELECT count(*)
								FROM play
                                WHERE id_game = par_id_game);
        
		RETURN ln_cnt_jugadas; -- sin s (solo retorna un valor)
    END
    %%
    
    
    
    -- si es un juego, probablemnte si ejecuto muchas veces el resultado no va a ser el mismo ya que depende la jugada
    