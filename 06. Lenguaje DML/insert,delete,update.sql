INSERT INTO empleados (nombre, puesto, salario)
VALUES ('Juan Perez Prueba' , 'Desarrollador', 50000);

SELECT * FROM empleados ORDER BY id DESC;

UPDATE empleados
SET salario = 55000
WHERE id=151;

DELETE FROM empleados 
WHERE id=151;


SELECT * FROM empleados
WHERE puesto IN (SELECT nombre_puesto
				FROM puestos
                WHERE CATEGORIA = 'IT');
                
-- actualizarles el salario en un 10%

UPDATE empleados 
SET salario = salario * 1.1
WHERE puesto IN (SELECT nombre_puesto
				FROM puestos
                WHERE CATEGORIA = 'IT');
                
DELETE FROM vents
WHERE producto NOT IN (SELECT nombre_producto FROM productos_activos);


