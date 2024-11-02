 -- clase 3 en vivo 
 -- integridad referencial
 use gamersmodel;
 SELECT * FROM game g;
 SELECT * FROM level_game;
 SELECT * FROM class;
 
 SELECT g.id_game, g.name, g.description, g.id_level, g.id_class FROM game as g;
 
 -- queremos unir la tabla game con level game a traves de id_level
 
  SELECT g.id_game, g.name, g.description, g.id_level, g.id_class, lg.description as level_game_description
  FROM game as g
  INNER JOIN level_game as lg ON (lg.id_level = g.id_level);
  -- aseguramos que nos va a devolver los 100 registros debido a la clave foranea
  -- FOREIGN KEY: enlace que conecta los datos de una tabla con los datos de otra, garantizando la INTEGRIDAD REFERRENCIAL
  
SELECT g.id_game, g.name, g.description, g.id_level, g.id_class, c.description as description_class
  FROM game as g
  INNER JOIN class as c ON (c.id_class = g.id_class AND c.id_level = g.id_level);
  
  -- esto nos va a devolver 100 porque tiene una clave foranea en cada campo
 
 SELECT g.id_game, g.name, g.description, g.id_level, g.id_class, c.description as description_class
  FROM game as g
  INNER JOIN class as c ON (c.id_class = g.id_class AND c.id_level = g.id_level)
  INNER JOIN level_game as lg ON (lg.id_level = c.id_level);
  
  -- 
  
  SELECT g.id_game, g.name, g.description, g.id_level, g.id_class, 
	c.description as description_class, lg.description description_level
 FROM game as g
	INNER JOIN class as c ON (c.id_class = g.id_class AND c.id_level = g.id_level)
    INNER JOIN level_game as lg ON (lg.id_level = c.id_level);
    
    -- ejercicio: unir las dos tablas
    SELECT * FROM system_user su; -- no nulo + integridad referencial garantizan que tenes el 100%de los casos
    SELECT * FROM user_type;
  
  SELECT * FROM system_user as su 
  INNER JOIN user_type as ut ON (su.id_user_type = ut.id_user_type);
  -- asi se repite id_user_type dos veces
  
  SELECT su.id_user_type, su.first_name, su.last_name, ut.id_user_type, ut.description
  FROM system_user as su 
  INNER JOIN user_type as ut ON (su.id_user_type = ut.id_user_type);
  -- esta seria la manera correcta para que no se repita el id dos veces
  
  
  -- modificaciones agregando nulos, ahora el inner join no me trae los 1000 registros, sino que me trae muchos menos
  
ALTER TABLE system_user
MODIFY COLUMN id_user_type INT DEFAULT NULL;

UPDATE system_user
set id_user_type = null
WHERE id_system_user BETWEEN 10 and 30;

UPDATE system_user
set id_user_type = null
WHERE id_system_user BETWEEN 80 and 120;

UPDATE system_user
set id_user_type = null
WHERE id_system_user BETWEEN 200 and 400;

-- me trae los 1000 registros, la que siempre esta no nula es la tabla de la izquierda
 SELECT su.id_user_type, su.first_name, su.last_name, ut.id_user_type, ut.description
  FROM system_user as su 
  LEFT OUTER JOIN user_type as ut ON (su.id_user_type = ut.id_user_type);
  
  
  -- quiero unificar las dos consultas
  -- 1er consulta
  SELECT id_user_type, first_name, last_name FROM system_user su
  WHERE id_user_type BETWEEN 10 and 20;
  -- 2da consulta
  SELECT id_system_user, first_name, last_name FROM system_user su
  WHERE id_user_type > 480;
  
  -- usando UNION
  
SELECT id_user_type, first_name, last_name FROM system_user su
WHERE id_user_type BETWEEN 10 and 20
UNION
SELECT id_system_user, first_name, last_name FROM system_user su
WHERE id_user_type > 480
ORDER BY first_name;
  
-- UPPER, lower, reverse

SELECT id_system_user, UPPER(first_name), lower(last_name)
FROM system_user su
WHERE id_user_type BETWEEN 10 and 20;
  
-- calculos matematicos

SELECT FLOOR ((199*12+5)/54);
SELECT CEIL((199*12+5)/54); -- redondea para arriba

SELECT now(); -- fecha y hora actual
SELECT sysdate();

-- concatenando
SELECT id_system_user, concat(first_name, ' ' , last_name) as nombreCompleto
FROM system_user su
WHERE id_user_type BETWEEN 10 and 20;

-- concatenando
SELECT id_game, concat(upper(name), ' tiene  ' , LENGTH(name), 'caracteres'), 'JUEGOS' as tipo 
FROM game
WHERE id_game < 10;

-- union de consultas
SELECT id_system_user, concat(first_name, ' ' , last_name) as nombre, 'USUARIO' as tipo
FROM system_user su
WHERE id_user_type BETWEEN 10 and 20
UNION
SELECT id_game as id, concat(upper(name), ' tiene  ' , LENGTH(name), 'caracteres') as nombre , 'JUEGOS' as tipo 
FROM game
WHERE id_game < 10
ORDER BY nombre;

-- algunas filas se solapan pero el union saca los duplicados
SELECT id_system_user, first_name, last_name
FROM system_user su
WHERE id_user_type BETWEEN 10 and 20
UNION
SELECT id_system_user, first_name, last_name
FROM system_user su
WHERE id_user_type BETWEEN 20 and 40;


SELECT id_system_user, first_name, last_name
FROM system_user su
WHERE id_user_type BETWEEN 10 and 30
UNION ALL
SELECT id_system_user, first_name, last_name
FROM system_user su
WHERE id_user_type BETWEEN 20 and 40
ORDER BY first_name;

-- comodines

SELECT * 
FROM system_user 
WHERE email LIKE '%@cbc.ca';

SELECT * 
FROM play
WHERE id_system_user IN (4,94);


SELECT p.* -- me trae todo lo de la tabla play
FROM play as p
INNER JOIN system_user su on (p.id_system_user = su.id_system_user)
WHERE su.email LIKE '%umn.edu';

-- SUBCONSULTAS (consultas dentro de otras consultas)

SELECT *
FROM play
WHERE id_system_user IN (SELECT id_system_user
						FROM system_user
                        WHERE email LIKE '%@umn.edu');


-- SELECT * 
-- FROM play
-- WHERE id_system_user IN ( ... ); la subconsulta esta dentro del IN

