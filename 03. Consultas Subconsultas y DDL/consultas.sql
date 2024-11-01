SELECT nombre, salario
FROM empleados a
WHERE a.salario > (SELECT avg(b.salario) FROM empleados b WHERE b.departamento = a.departamento);

-- estamos comparando el salario de cada empleado con el salario promedio de su departamento
-- obtenemos todos los empleados cuyo salario sea mayor al promedio en su departamento

SELECT e.departamento
FROM empleados e
GROUP BY departamento
HAVING count(*) > 10;

-- obtenemos los departamentos que tienen mas de 10 empleados

SELECT avg(salario) 
FROM empleados b
WHERE b.departamento IN ( SELECT e.departamento
							FROM empleados e
							GROUP BY departamento
							HAVING count(*) > 10);

-- promedio de salarios de los empleados de los departamentos que tienen mas de 10 empleados

SELECT a.nombre, a.salario
FROM empleados a
WHERE a.salario > ( SELECT avg(salario) 
					FROM empleados b
					WHERE b.departamento IN ( SELECT e.departamento
												FROM empleados e
												GROUP BY departamento
												HAVING count(*) > 10) );

-- obtenemos los nombres de los empleados cuyo salario es mayor al salario promedio en departamentos que tienen mas de 10 empleados


SELECT a.nombre, a.salario, (SELECT avg(b.salario)
							FROM empleados b
							WHERE b.departamento = a.departamento) as prom_depto
FROM empleados ;

-- selecciona el nombre, salario de cada empleado y salario promedio de su departamento

-- -----------------------------------------------------------------------------

SELECT CAST ('123' AS SIGNED); -- convierte la cadena en un entero
SELECT STR_TO_DATE ('01/08/2024' , ' %d/%m/%Y' ); -- convierte cadena a fecha

SELECT LOWER ('SQL Tutorial');
SELECT UPPER ('SQL Tutorial');
SELECT SUBSTRING('SQL Tutorial' , 5,7); -- extrae 7 letras a partir del 5to caracter Tutoria

SELECT ROUND (123.4567, 2); -- redondea un nro a un nro especifico de decimales

SELECT NOW(); -- dice la frhca y hora actual

SELECT DATE_FORMAT(now(), '%d/%m/%Y'); -- formateo de fecha actual

-- ------------------------------------------------------

-- DDL

CREATE TABLE empleados (
id INT AUTO_INCREMENT, -- autoincremental: se incrementa automaticamante en cada insercion, ayuda a q cd fila tenga indentificador unico
nombre VARCHAR (50),
salario DECIMAL (10,2),
PRIMARY KEY (id));

ALTER TABLE empleados ADD COLUMN fecha_contratacion DATE; -- agregamos una nueva columna

DROP TABLE empleados; -- eliminamos la tabla completamente, irreversible




