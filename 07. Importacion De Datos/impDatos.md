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


