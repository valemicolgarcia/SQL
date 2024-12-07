DELIMITER %%

DROP FUNCTION IF EXISTS f_get_jugadas;
%%

CREATE FUNCTION f_get_jugadas(par_id_game INT)
	RETURNS INT READS SQL DATA
BEGIN

	DECLARE ln_cnt_jugadas INT;
    
    SET ln_cnt_jugadas = (SELECT count(*)
						 FROM play
						 WHERE id_game = par_id_game);
                         
	RETURN ln_cnt_jugadas;

END

%%

DELIMITER %%

DROP FUNCTION IF EXISTS f_get_jugadas;
%%

CREATE FUNCTION f_get_jugadas(par_id_game INT)
	RETURNS INT READS SQL DATA
BEGIN

	DECLARE ln_cnt_jugadas INT;
    DECLARE ln_completed INT;
    
    SELECT count(*), sum(completed)
     INTO ln_cnt_jugadas, ln_completed
	 FROM play
	 WHERE id_game = par_id_game;
    
                         
	RETURN (ln_completed/ln_cnt_jugadas)*100;

END

%%


