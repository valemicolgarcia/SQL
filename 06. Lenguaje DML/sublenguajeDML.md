# Sublenguaje DML

- Podemos insertar, eliminar y actualizar registros en las tablas
- **DML : Data Manipulation Language**
___

### INSERT

- Agregar uno o mas registros a una tabla

- INSERT INTO nombre_de_la_tabla (campo1, campo2, campo3, ...)
- VALUES (dato1, dato2, dato3, ...);

- si un campo esta definido como AUTO_INCREMENT se puede omitir en la lista de campos 

1. _inserto un solo registro:_

INSERT INTO pay (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game)
VALUES (NULL, 300, 'U$S', '2021-07-22', 'PayPal', 501, 13);

2. _inserto varios registros_

INSERT INTO pay (id_pay, amount, currency, date_pay, pay_type, id_system_user, id_game)
VALUES
(NULL, 250, 'U$S', '2021-07-22', 'Paypal', 850, 77),
(NULL, 3700, 'Pesos Arg', '2021-07-22', 'Visa', 38, 31),
(NULL, 180, 'Libras', '2021-07-22', 'Transfer', 175, 16);


- **ejemplo de uso de subconsulta en una insercion:**

- INSERT INTO class (id_level, id_class, description)
- SELECT id_level, 999, 'New Class'
- FROM level_game
- WHERE id_level NOT IN (SELECT id_level FROM class);
 
- **ejemplo de insercion con clave foranea**: conviene usar transacciones (aseguran que ambos insertos se realicen con éxito o se deshagan en caso de error.)

- START TRANSACTION;

- INSERT INTO orders (order_id, customer_id, order_date)
- VALUES (1001, 203, '2024-08-05');
- INSERT INTO order_details (order_id, product_id, quantity, price)
- VALUES (1001, 45, 3, 19.99);
- COMMIT;


### UPDATE

- Modificar registros existentes en una tabla

- UPDATE nombre_de_la_tabla
- SET campo1 = valor1, campo2 = valor2, ...
- WHERE condición; (_esencial where para limitar que registros se actualizaran_)

- **Actualizaciones condicionadas por subconsultas**

- UPDATE class
- SET nivel = 20
- WHERE id_level IN (SELECT id_level FROM new_level_game);

- **CONSIDERACIONES para actualizaciones masivas** : es importante considerar:
1. indices: asegurarse que las columnas esten indexadas para optimizar el rendimiento
2. seguridad de actualizacion: deshabilitar el modo seguro en entornos de desarrollo cuando sea necesario

- SET SQL_SAFE_UPDATES = 0; (_desactivo el modo seguro_)


### DELETE

- eliminar registros en una tabla

- DELETE FROM nombre_de_la_tabla
- WHERE condición; (_sin where todos los registros serian eliminados_)

- INTEGRIDAD REFERENCIAL:  Si un registro a eliminar está referenciado por una clave foránea en otra tabla, la operación fallará a menos que la clave referenciada se elimine o se actualice primero.


- **ejemplo de eliminacion con subconsultas**

- DELETE FROM class
- WHERE id_level NOT IN (SELECT id_level FROM new_level_game);

- **gestion de restricciones de clave foranea** : antes de eliminar un registro padre en una tabla, se debe eliminar o actualizar cualq refrencia en tablas secundarias

- DELETE FROM class
- WHERE id_level = 5 AND id_class = 999;


# Optimizacion y manejo de datos

### Uso de indices

- Actúan como puntos de acceso rápido para localizar registros específicos sin tener que escanear toda la tabla. 

- Beneficios
1. Busqueda Rapida
2. Eficiencia en JOIN
3. Condiciones WHERE

### Consideraciones al usar indices
1. costo de mantenimiento
2. seleccion de columnas
3. tipos de indices

- CREATE INDEX idx_customer_id ON orders (customer_id);

