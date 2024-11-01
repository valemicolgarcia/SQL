SELECT * 
FROM productos
WHERE id_producto = 1;

SELECT sum(cantidad)
FROM ventas
WHERE id_producto = 1;