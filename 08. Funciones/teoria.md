

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