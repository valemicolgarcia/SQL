

# Funciones

### Fundamentos de las funciones
Las funciones personalizadas son bloques de código que permiten procesar y manipular datos de manera eficiente, retornando un único resultado basado en parámetros de entrada. Estas funciones:
- Mejoran la integridad y seguridad de los datos.
- Optimizan el rendimiento de la base de datos.
- Facilitan la lectura del código.

### Tipos de funciones
1. Funciones simples.
2. Funciones con parámetros.
3. Funciones con parámetros y retorno (usadas comúnmente en SQL).


### Sintaxis Básica
```sql
CREATE FUNCTION `nombre_de_la_funcion` (param1 INT, param2 INT) RETURNS tipoDeDato
BEGIN
    DECLARE resultado tipoDeDato;
    SET resultado = (operaciones);
    RETURN resultado;
END
```

### Sintaxis basica de una funcion con parametros

```SQL
DELIMITER //

CREATE FUNCTION nombre_de_la_funcion (param1 TipoDato, param2 TipoDato)
RETURNS TipoRetorno
[DETERMINISTIC|NOT DETERMINISTIC]
[CONTAINS SQL|NO SQL|READS SQL DATA|MODIFIES SQL DATA]
BEGIN
    -- Lógica de la función
    RETURN valor_de_retorno;
END;

//

```

### Determinismo:
- DETERMINISTIC: Indica que la función siempre devolverá el mismo resultado para los mismos valores de entrada.

- NOT DETERMINISTIC: Indica que la función puede devolver diferentes resultados para los mismos valores de entrada.

### Clausulas SQL


1. CONTAINS SQL: La función contiene sentencias SQL pero no modifica datos.
2. NO SQL: La función no ejecuta sentencias SQL.
3. READS SQL DATA: La función lee datos de la base de datos.
4. MODIFIES SQL DATA: La función modifica datos en la base de datos.

### Buenas practicas
- Usar EXPLAIN para optimizar consultas.
- Evitar funciones sobre columnas indexadas para no perder el propósito del índice.
- Reducir el uso de funciones en cláusulas WHERE para mejorar el rendimiento.

# Stored Procedures

### Fundamentos de los stored procedures

Los Stored Procedures son conjuntos de sentencias SQL almacenadas en la base de datos, diseñados para realizar tareas específicas, desde operaciones simples hasta complejas. Sus beneficios incluyen:

- Control del motor de la base de datos sobre las operaciones.
- Reducción del tráfico y sobrecarga en la red.
- Minimización de errores al centralizar la lógica del lado del servidor.

### Tipos de Stored Procedures 

1. Básicos.
2. Con parámetros de entrada (IN).
3. Con parámetros de salida (OUT).
4. Con parámetros de entrada y salida.

### Sintaxis basica

```SQL
DELIMITER //
CREATE PROCEDURE `nombre_del_sp` (IN param1 tipoDeDato, OUT param2 tipoDeDato)
BEGIN
    -- Código del procedimiento
END //

```

### Sintaxis basica de un stored procedure

```SQL

DELIMITER //

CREATE PROCEDURE nombre_del_procedimiento
(
    [IN|OUT|INOUT] parametro1 TipoDato,
    [IN|OUT|INOUT] parametro2 TipoDato
)
BEGIN
    -- Lógica del procedimiento
END //

DELIMITER ;
```

### Elementos claves de la sintaxis

1. **DELIMITER:** permite definir un delimitador diferente para separar instrucciones SQL dentro de un procedimiento. Esto es necesario porque los stored procedures pueden contener múltiples sentencias SQL, y el delimitador por defecto (punto y coma) no es suficiente para distinguir el final del procedimiento.

2. **PARAMETROS DE ENTRADA Y SALIDA:** Los stored procedures pueden aceptar parámetros de entrada (IN), parámetros de salida (OUT), o ambos (INOUT). Estos parámetros permiten que los procedimientos sean dinámicos y adaptables a diferentes condiciones.

### Uso de variables

las variables se declaran para almacenar datos temporales que se utilizarán durante la ejecución. Una vez que las variables internas están definidas, se pueden asignar valores a ellas usando la cláusula SET. Esta cláusula permite inicializar la variable con un valor específico o resultado de una operación.

```SQL
DECLARE nombre_variable INT;
SET nombre_variable = expresión;
```


### Implementacion de consultas dinamicas

Mediante PREPARE, EXECUTE, y DEALLOCATE, los SP pueden construir y ejecutar consultas dinámicas.

```SQL
CREATE PROCEDURE `sp_get_games_order` (IN field CHAR(20))
BEGIN
    SET @clausula = CONCAT('SELECT * FROM game ORDER BY ', field);
    PREPARE runSQL FROM @clausula;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END

```