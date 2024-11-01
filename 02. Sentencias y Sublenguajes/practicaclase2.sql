use gamersmodel;

-- obetener los juegos que sean de nivekl 1
SELECT * 
FROM game 
WHERE id_level = 1;

-- juegos que sean nivel 14 o superior
SELECT *
FROM game
WHERE id_level >= 14;

-- juegos de nombre Riders Republic o 'The Dark Pictures: House Of Ashes'.

SELECT * 
FROM game
WHERE name = 'Riders Republic' OR name = 'The Dark Pictures: House Of Ashes';

-- OTRA OOPCION

SELECT *
FROM game
WHERE name IN ('Riders Republic', 'The Dark Pictures: House Of Ashes');

-- quiero ordenar
-- por defecto es de forma ascendente
SELECT * 
FROM game
WHERE name = 'Riders Republic' OR name = 'The Dark Pictures: House Of Ashes'
ORDER BY name DESC;

-- le damos dos criterios de ordenacion
SELECT *
FROM system_user
ORDER BY first_name, id_system_user DESC; -- va con el primero, en caso que se repita va con la segunda condicion


SELECT * 
FROM game
ORDER BY id_game
-- LIMIT 10 -- TE trae los primeros 10
LIMIT 20, 10 ;-- a partir del registro 20 te trae 10 registros 