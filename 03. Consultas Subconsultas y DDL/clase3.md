# Consultas y Subconsultas

### Uniendo dos consultas en SQL con clausula UNION

- CLAUSULA UNION: Se usa para combinar los resultados de dos o mas consultas SELECT. 

- _crucial que cada consulta tenga el mismo numero de columnas en sus resultados, y tipos de datos compatibles ==_

- ORDEN DE LAS COLUMNAS: el orden en el que se seleccionan las columnas debe ser el mismo, para que los datos de cd columna se alineen correctamente en los resultados combinados

- NOMBRE DE LAS COLUMNAS: si las columnas no tienen el mismo nombre en las distintas consultas, el motor va a adoptar el nombre que contienen las columnas en la primer consulta.

- ORDER BY: Luego al realizar orderby se aplica sobre la totalidad de los resultados

- CONSIDERACION DE CASOS DE USO: UNION es util para cuando necesitas una lista combinada de elementos de diferentes fuentes que comparten una estructura similar, como podria ser combinar listas de elementos de diferentes categorias que estan en tablas separadas

- Datos Duplicados

1.  UNION: por defecto elimina las filas duplicadas
2. UNION ALL: es rapido, no verifica duplicados


### Tipos de datos en SQL

- TIPOS NUMERICOS : INT - DECIMAL, NUMERIC - FLOAT , DOUBLE
- TIPOS TEXTO: CHAR (_long fija_) , VARCHAR (_long variable_) - TEXT (_textos largos como descripciones o comentarios_)
- TIPOS FECHA Y HORA : DATE (_solo fechas_) - TIME (_solo tiempos_) - DATETIME (_fecha y hora_) - TIMESTAMP (_fecha y hora, ajusta automaticamente zonas horarias_)
- OTROS: BOOLEAN - BINARY , VARBINARY (_binarios como imagenes o archivos_)

### Consideraciones para la eleccion del tipo de datos

- ESPACIO DE ALMACENAMIENTO
- RENDIMIENTO
- INTEGRIDAD DE LOS DATOS: precision y coherencia evitando errores de formato
- DIMENSIONAMIENTO: char o varchar debe indicarse longitud ; a los decimales hay que indicar cant de dig y cant de decimales

# Profundizando el uso del operador LIKE

### Uso del operador LIKE en SQL

- El operador LIKE se usa para realizar busquedas de patrones dentro de cadenas de textos, encontrando coincidencias parciales o completas en los registros

### Comodines en LIKE

- **% porcentaje** : sustituye a cualq numero de caracteres y es util para busquedas generales en cualq posicion de la cadena.
1. _SELECT * FROM clientes WHERE nombre LIKE 'AI%'_ --> nombres q empiezan con AI
2. _SELECT * FROM clientes WHERE descripcion LIKE '%libro%'_ --> descripciones que contienen libro
3. _SELECT * FROM clientes WHERE descripcion LIKE '%son'_ --> apellidos que terminan en son

- **_(Guion Bajo)**: representa un unico caracter y es util cuando se conoce la posicion exacta del caracter en la cadena.

4. _SELECT * FROM usuarios WHERE email LIKE '_a%o@dominio.com';_ --> formato especifico 

- _ la segunda letra tiene q ser una 'a'
- % debe empezar con a y terminar con o
- debe terminar con @dominio.com
- ejemplo: paolo@dominio.com - maestro@dominio.com

### Consideraciones de comodines

- Sensibilidad al caso: depende del motor de bd
- Rendimiento: El uso de comodines al inicio del patron (%algo) puede afectar el rendimiento al impedir el uso eficiente de indices

___

# Sublenguaje DDL : lenguaje de definicion de datos

- DDL: fundamental en SQL para la gestión de estructuras de base de datos. Proporciona las sentencias necesarias para crear, modificar, y eliminar objetos dentro de una base de datos, como tablas, índices, vistas, funciones, procedimientos, triggers y otros tipos de estructuras.

### Funciones Principales

1. CREATE: Crear nuevos objetos en la bd _(create table)_
2. DROP: Eliminar objetos existentes en la bd  _(drop table)_
3. ALTER: Modificar estructura de objetos existentes _(agrgar, elim, o modif columnas en una tabla)_

### Aplicaciones de DDL

1. **CREATE TABLE** : Se especifican las columnas de la tabla, sus tipos de datos y posibles restricciones como claves primarias o valores por defecto
- _**CREATE TABLE** employees ( ID **INT PRIMARY KEY**, Name **VARCHAR(100)**, HireDate **DATE** )_

2. **ALTER TABLE** : Se pueden hacer cambios como agregar nuevas columnas, cambiar tipos de datos de col existentes, o eliminar columnas 
- _ALTER TABLE employees **ADD** Email **VARCHAR(255)**_

3. **DROP TABLE** : Eliminar tablas

4. **DROP DATABASE** : Eliminar bases de datos completas

### Consideraciones DDL
- Impacto permanente
- Seguridad y Control de Acceso
- Planificacion y pruebas

