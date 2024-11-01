use gamersmodel;

SELECT * 
FROM examenes
WHERE Id_Alumno = 2;

-- cuenta la cantidad de apariciones de cada nombre
SELECT nombre_alumno, count(*)
FROM examenes
GROUP BY nombre_alumno;

-- cuenta el total de alumnos
SELECT count(*)
FROM examenes;

-- otras funciones por agrupacion
SELECT nombre_alumno, count(*), min(nota), max(nota), avg(nota)
FROM examenes
GROUP BY nombre_alumno;

-- quiero agrupar a los alumnos que tengan promedio mayor a 5
SELECT nombre_alumno, count(*), min(nota), max(nota), avg(nota)
FROM examenes
GROUP BY nombre_alumno
HAVING avg(nota) > 5 -- el having es como el where pero para agrupamientos
ORDER BY avg(nota) DESC
LIMIT 1;

-- agryupar juego, promedio, ordenarlos, quedcrame con primeros 5
-- todos los que tuvieron voto 0 descartamos
SELECT id_game, avg(value), count(*)
FROM vote
WHERE value > 0
GROUP BY id_game
HAVING count(*)>5
ORDER BY avg(value) DESC
LIMIT 5;




