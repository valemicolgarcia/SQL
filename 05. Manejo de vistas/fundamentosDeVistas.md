# Fundamentos de vistas

### Introduccion a las vistas
- estructuras virtuales que se generan a partir de la ejecución de consultas sobre una o más tablas de la base de datos.
- tablas virtuales
- combinan datos de multiples tablas
- cd vez que se accede a la vista, la consulta se ejecuta de nuevo --> siempre esta actualizada


### Ventajas de usar vistas

1. seguridad: proteger datos sensibles
2. simplicidad - simplificacion de consultas
3. consistencia y mantenimiento
4. rendimiento (reutilizar consultas SQL complejas)
5. politicas de privacidad

### Creacion de una vista

CREATE VIEW nombrevista AS SELECT nombre,apellido FROM clientes JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente WHERE fecha_pedido >= 5

### Modificacion y eliminacion de vistas

- PARA MODIFICAR
- DROP VIEW IF EXISTS nombrevista
- CREATE VIEW nombrevista IF EXISTS nombre, apellido FROM clientes JOIN pedidos ON clientes.id_cliente WHERE fehca > 5
- PARA ELIMINAR
- DROP VIEW

### Gestion y mantenimiento de vistas

- CREATE OR REPLACE VIEW

___

# Tipos y Usos de vistas

### Tipos de vistas

1. Vistas simples : unica consulta a una tabla
- CREATE VIEW nomVista AS SELECT nombre, direccion FROM clientes;

- la vista se utiliza como cualquier otra tabla en consultas SQL pero sin la capacidad de afectar directamente a los datos subyacentes


2. Vistas complejas : subconsultas, uniones de tablas, funciones de agregacion
- CREATE VIEW nomVista AS SELECT producto, sum(cantidad) AS totalvend FROM ventas GROUP BY producto_id;

3. Vistas materializadas: almacenan el resultado de la consulta en el disco, mejora en caso de consultas que accedes repetidamente. consumen mas espaacio de almacenamiento
- CREATE MATERIALIZED VIEW nomVista AS SELECT * FROM productos WHERE stock < 10
4. Vistas actualizables: permiten opciones de insercion, actualizacion y borrado sobre los datos que muestran (consultas a una sola tabla, incluyendo todas las columnas de la clave primaria subyacente)

- CREATE VIEW nomVista AS SELECT id, nomb FROM clientes;

### Contextos de uso

- Vistas simples y complejas: prioridad en informacion y simplificacion de datos
- Vistas materializadas: alto volumen de lecturas y analisis de datos
- vistas actualizables: capa de abstraccion


___

# Seguridad y control de acceso con vistas

### Mejora de la seguridad

1. filtrado de datos: ciertos campos de las tablas
2. restriccion de acceso: permisos
3. minimizacion de exposicion: vistas, estructura y logica de negocio ocultas

### Vistas como capa de asbtraccion

Simplifica las operaciones de los usuarios finales

- simplificacion de consultas: interfaz simple y facil de entener
- uniformidad de datos

