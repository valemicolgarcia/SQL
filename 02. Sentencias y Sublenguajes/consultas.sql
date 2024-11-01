SELECT id_venta, cantidad FROM ventas WHERE id_producto;
SELECT * FROM ventas; 
SELECT * FROM productos;

-- SELECT tabla FROM columna WHERE condicion (filtro)
SELECT cantidad FROM ventas WHERE id_producto = 1;

-- FUNCIONES Y AGREGACIONES EN SQL
SELECT count(*) FROM productos; 
SELECT count(*) FROM productos WHERE precio = 50;
SELECT count(*), sum(stock), avg(precio) FROM productos; -- cuento la cantidad de prpductos, sumo el stock total y calculo el promedio de los precios

SELECT nombre, count(*), sum(stock), avg(precio) FROM productos
GROUP BY nombre; 

-- TIPOS DE UNIONES EN SQL

SELECT * FROM productos p;
SELECT * FROM ventas v;

-- el INNER JOIN va a devolver las filas cuando hay coincidencia en ambas tablas
SELECT * FROM productos p 
	INNER JOIN ventas v on (v.id_producto = p.id_producto);

-- el LEFT JOIN nos muestra todas las filas de la tabla izq + coincidencias de la derecha 
SELECT * FROM productos p 
	LEFT JOIN ventas v on (v.id_producto = p.id_producto);

-- El RIGHT JOIN nos muestra todas las filas de la tabla derecha + coincidencias con la tabla izq
SELECT * FROM productos p 
	RIGHT JOIN ventas v on (v.id_producto = p.id_producto);

-- el FULL JOIN combina todas las filas de ambas tablas
-- SELECT * FROM productos p 
-- 	full join ventas v on (v.id_producto = p.id_producto);
-- !! me tira error el full join
