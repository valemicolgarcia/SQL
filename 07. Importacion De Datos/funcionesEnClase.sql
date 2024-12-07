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
    DROP FUNCTION IF EXISTS f_calcular_area;
    
    CREATE FUNCTION f_calcular_area(par_ancho INT, par_alto INT)
		RETURNS INT DETERMINISTIC -- con s al final
    BEGIN
		
        DECLARE ln_area INT; -- declaramos la variable
        SET ln_area = 12*15;
        
		RETURN ln_area; -- sin s (solo retorna un valor)
    END
    %%
    
    
    
    
    