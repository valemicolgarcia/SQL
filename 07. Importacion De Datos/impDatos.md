# Importacion de datos

___

- Importacion de archivos JSON o CSV

### Proceso de Importacion con interfaz

1. Import/Export
2. Importar (csv o json)
3. Browse
4. Next
5. Finish

### Consola MYsql

1. Abrir Mysql shell
2. Seleccionar la base de datos ( USE nombre_de_tu_base_de_datos; )

- archivos csv

3. preparar el archivo csv (primera linea como encabezado que coincida con los nombres de las columnas de la tabla)
4. Importar csv --> 


 - LOAD DATA LOCAL INFILE '/ruta/completa/del/archivo.csv'
 - INTO TABLE nombre_de_la_tabla (_indica el delimitador de campos_)
 - FIELDS TERMINATED BY ',' ENCLOSED BY '"' (_especifica el caracter que encierra los campos_)
 - LINES TERMINATED BY '\\n' (_indica caracter de finalizacion :\\n para nuevas lineas_)
 - IGNORE 1 LINES; (_omite la primera linea si contiene encabezados de columnas_)

 5. validacion:  SELECT * FROM nombre_de_la_tabla;

- archivs JSON

3. Comando para Importar JSON: A diferencia de los archivos CSV, MySQL no ofrece un comando directo para importar JSON. Sin embargo, se puede lograr utilizando un lenguaje de programación como Python o un script para transformar JSON en comandos SQL INSERT o convertirlo a CSV primero.

4. Conversión de JSON a CSV (Opcional): Si necesitas convertir JSON a CSV, puedes usar herramientas de línea de comandos o scripts personalizados para hacer esta conversión antes de la importación.

### Comandos
- show databases; (para mostrar bases de datos que tenemos en el motor)
- use nombredatabase;

___
# Integridad referencial

- Asegurar que las relaciones entre tablas permanezcan precisas y consistentes. Garantiza que las referencias entre tablas sean válidas y estén sincronizadas, previniendo así errores y anomalías en la base de datos.

1. Prevencion de datos huerfanos
2. Mantenimiento de consistencia de datos
3. Simplificacion del mantenimiento

### Tipos de integridad referencial

1. Debil: Si todos los valores de los atributos de una tupla en la tabla R no son nulos, entonces debe existir una tupla en la tabla S que coincida con esos valores en los atributos correspondientes.
2. Parcial: Si algún atributo de una tupla en la tabla R cambia a un valor nulo, debe existir una tupla en la tabla S que coincida con los valores nulos de los atributos de R.
3. Completa: En una tupla de R, todos los atributos deben ser nulos o todos deben tener valores no nulos, asegurando que exista una tupla en S que coincida con estos valores.

- CLAVES EXTERNAS: vinculos que conectan tablas relacionadas y garantizan que las relaciones se mantengan consistentes a lo largo del tiempo

- Acciones de restriccion de integridad
1. CASCADE: Al eliminar o actualizar un registro en la tabla padre, los registros relacionados en la tabla hija se eliminan o actualizan automáticamente.
2. SET NULL: Al eliminar un registro en la tabla padre, los valores de las claves externas en la tabla hija se establecen en NULL. 
3. NO ACTION: La base de datos rechaza la eliminación o actualización de un registro en la tabla padre si existen referencias en la tabla hija. Esto previene acciones que podrían romper la coherencia de los datos.
4. RESTRICT: impide cambios que violarían la integridad referencial, pero se evalúa en un momento diferente del proceso de ejecución.

### Beneficios de las claves externas

1. consistencia
2. reduccion de errores
3. optimizacion de consultas

# Delete y update cascade 

- DELETE CASCADE: accion que se define en una clave externa para automatizar la eliminacion de registros relacionados en tablas secundarias. cuando un registro en la tabla principal es eliminado. Esto asegura que no queden datos huérfanos en la base de datos.

- La eliminacion en cascada debe utilizarse con precaucion, ya que puede llevar a eliminaciones masivas

- UPDATE CASCADE: actualizar automáticamente las claves externas en las tablas secundarias cuando la clave primaria en la tabla principal cambia. Esto mantiene las relaciones correctas entre las tablas cuando las claves primarias son modificadas.


