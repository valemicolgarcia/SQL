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

 **INSERT INTO clientes (nombre, direccion) VALUES ('Ana Pérez', 'Calle Falsa 123');**

 - Añade un nuevo registro a la tabla de clientes (_INSERT INTO tabla_ + _VALUES nuevosdatos_)

 ### 3. Actualizacion de datos

 **UPDATE productos SET precio = precio * 1.10 WHERE categoria = 'Electrónica';**

 Aumenta el precio de los productos de electronica en un 10% (_update tabla_ + _set columna = valorNuevo_ + _WHERE condicionColumna_ )

### 4. Eliminacion de datos

**DELETE FROM pedidos WHERE fecha < '2021-01-01';**

- Elimina los registros de pedidos anteriores al año 2021 (_DELETE FROM tabla pedidos_ + _WHERE condicionColumna)

### 5. Agrupamiento de datos

**SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;**

- Agrupa los empleados por departamento y cuenta cuantos empleados hay en cada uno (_el GROUP BY se usa para agrupar filas que tienen los mismos valores en columnas especificas, a menudo se usa con count(), sum(), avg()_)

### 6. Filtrar Agrupamiento

**SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento HAVING COUNT(*) > 10;**

- Filtra los departamentos que tienen mas de 10 empleados. (_se usa HAVING para filtrar resultados luego de haber aplciado un group by_)

### 7. Ordenamiento 

**SELECT columna1, columna2 FROM tabla WHERE condición ORDER BY columna1 [ASC | DESC];**

- ORDER BY: ordena una columna siguiendo un criterio
- ASC ordena de manera ascendente
- DESC ordena de manera descendente


# Operadores en SQL

### Principales operadores de comparacion

1. **Igual (=):** Compara si dos valores son iguales.

2. **Distinto (!= o <>):** Verifica si dos valores son diferentes.

3. **Menor que (<):** Comprueba si un valor es menor que otro.

4. **Mayor que (>):** Evalúa si un valor es mayor que otro.

5. **Menor o igual que (<=):** Determina si un valor es menor o igual a otro.

6. **Mayor o igual que (>=):** Determina si un valor es mayor o igual a otro.

### Operadores para situaciones mas especificas

1. **BETWEEN:** Verifica si un valor está dentro de un rango.

2. **LIKE:** Se utiliza para buscar un patrón específico en una columna.

3. **IN:** Permite especificar múltiples valores posibles para una columna.

- Prefiere EXISTS sobre IN cuando realices comparaciones con subconsultas, ya que EXISTS detiene la búsqueda al encontrar la primera coincidencia.

- Utiliza LIMIT o TOP para restringir la cantidad de filas devueltas por la consulta, especialmente útil cuando sólo se necesita una muestra de los datos.w

- evitar funciones en WHERE

### Uso de operadores en comparacion con consultas SQL

- Son comunmente utilizados con la clausula WHERE

1. Seleccion simple : **SELECT * FROM empleados WHERE salario >= 3000;**
2. Uso de between: **SELECT * FROM productos WHERE precio BETWEEN 10 AND 50;**
3. Combinando LIKE e IN: **SELECT * FROM clientes WHERE nombre LIKE 'A%' AND ciudad IN ('Madrid', 'Barcelona');**
- Esta consulta selecciona todos los clientes cuyos nombres comienzan con la letra 'A' y están ubicados en Madrid o Barcelona.

### Clausulas para string

1. **%A :** terminan con la letra a
2. **A% :** empieza con la letra a y despues hay cualquier otra cosa 
3. **%A%:** la palabra contiene la letra A

# Consideraciones especiales

1. **NULL:** ausencia de dato --> operadores como **<>** o **=** no funcionan con NULL. En su lugar se usa **IS NULL** o **IS NOT NULL**

2. **CASE SENSITIVITY:** La sensibilidad en mayusculas o minusculas varia segun el servidor de la base de datos

# Sentencias Complementarias en SQL

1. **UPDATE:** se usa para modificar los datos existentes en una tabla (fundamental para especificar condicion de filtrado)

- UPDATE clientes SET nombre = 'Ana María', ciudad = 'Sevilla' WHERE id_cliente = 101;

2. **INSERT INTO:** permite agregar registros a la tabla (_hay que especificar la columna y el valor_)

- INSERT INTO clientes (id_cliente, nombre, ciudad) VALUES (102, 'Juan Martín', 'Madrid');

3. **DELETE:** eliminar registros en una tabla (_es crucial usar la clausula WHERE para limitar los registros afectados_)

- DELETE FROM clientes WHERE ciudad = 'Barcelona';

### Recomendaciones con UPDATE y DELETE: buenas practicas

- Realizar las operaciones usando las PK en las tablas (_para no eliminar datos que no queremos y por performance_)

- Realizar una consulta con select usando los registros a modificar para estar seguros de la operacion a realizar

- ejemplo: 
- Antes de realizar esta operación: **DELETE FROM clientes WHERE ciudad = 'Barcelona';**
- Es recomendable realizar esta consulta: **SELECT FROM clientes *WHERE ciudad = 'Barcelona';**

### Consideraciones de seguridad y mantenimiento

1. Backup regular
2. Transacciones (_revertir operaciones en caso de error_)
3. Limitar accesos (_permisos de usuario_)

- **ejemplo y sintaxis de transaccion:**
-  BEGIN TRANSACTION; (_esto indica el inicio de la transaccion_)
- UPDATE cuentas SET saldo = saldo - 100 WHERE id_cliente = 101; 
- UPDATE cuentas SET saldo = saldo + 100 WHERE id_cliente = 102; 
- COMMIT; (_confirma la transaccion_)

- **ROLLBACK**: es el comando para deshacer una transaccion en caso de error (_NO PUEDO usar rollback si ya hice commit)
- BEGIN TRANSACTION;
- UPDATE tabla.....
- UPDATE tabla....
- ROLLBACK; (_se revierten todos los cambios hechos desde el inicio de la transaccion)

### Uso de clausulas Complementarias

1. **RETURNING**: con _INSERT_ , _UPDATE_ Y _DELETE_ para obtener detalles sobre los registros afectados
2. **control de condiciones**: uso de _WHERE_ en _UPDATE_ y _DELETE_ para evitar afectar a registros no deseados


