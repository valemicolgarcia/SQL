# Sintaxis basica de consultas SQL

### Consulta SQL tipica

**SELECT columna1, columna2 FROM nombre_tabla WHERE condicion;**

- SELECT: Define qué columnas de datos deseamos recuperar.

- FROM: Especifica de qué tabla se deben extraer los datos.

- WHERE: Filtra registros bajo condiciones específicas.

### 1. Consulta Simple

 **SELECT nombre, apellido FROM empleados WHERE departamento = 'Ventas';**

 - Este comando selecciona los nombres y apellidos de los empleados del departamento de ventas. 
 - La sentencia select sirve para seleccionar los datos de una o mas tablas

 ### 2. Insercion de Datos

 ** INSERT INTO clientes (nombre, direccion) VALUES ('Ana Pérez', 'Calle Falsa 123');**

 - Añade un nuevo registro a la tabla de clientes (_INSERT INTO tabla_ + _VALUES nuevosdatos_)

 ### 3. Actualizacion de datos

 **UPDATE productos SET precio = precio * 1.10 WHERE categoria = 'Electrónica';**

 Aumenta el precio de los productos de electronica en un 10% (_update tabla_ + _set columna = valorNuevo_ + _WHERE condicionColumna_ )

### 4. Eliminacion de datos

**DELETE FROM pedidos WHERE fecha < '2021-01-01';**

- Elimina los registros de pedidos anteriores al año 2021 (_DELETE FROM tabla pedidos_ + _WHERE condicionColumna)

