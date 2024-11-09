# Objetos de la base de datos

### Tablas

Estructuras que almacenan datos en **filas (registros)** y **columnas (campos)**
- almacenar informacion de manera organizada
- las tablas se relacionan entre si a traves de claves primarias y foraneas para mantener la integridad de los datos

### Vistas

Tablas virtuaes creadas a partir de consultas sobre una o mas tablas
- muestra datos de una o varias tablas pero no almacena
- simplificar consultas complejas
- existen vistas actualizables y no actualizables

### Procedimientos almacenados

Conjunto de instrucciones SQL que se ejecutan en la base de datos
- conjunto de comandos SQL precompilados que se almacena y se ejecuta en la base de datos. Pueden tener instrucciones de control de flujo, operaciones condicionales y transacciones completas. 
- no pueden ser llamados directamente dentro de una consulta SELECT, pero pueden ser ejecutados desde un cliente o dentro de otros procedimientos almacenados. (_a diferencia de las funciones_)
- USO: encapsular la lógica de negocios, realizar operaciones complejas, aplicar reglas de negocio, y gestionar transacciones --> mejorar seguridad al controlar el acceso a los datos, aumentar eficiencia al minimizar trafico

### Funciones

Conjunto de instrucciones SQL que se ejecutan en la base de datos y estan diseñadas para devolver un valor especifico.
- devuelve valor de salida o retorno
- estandarizar consultas, encapsular logica

### Triggers (Disparadores)

Conjuntos de instrucciones SQL que se ejecutan automaticamente en rta a eventos (_como insercion, actualizacion o eliminacion de registros_)
- Vinculados a eventos en tablas o vistas, pueden ser configurados para activarse antes o despues de que el evento ocurra
- automatizar tareas repetitivas

### Claves
1.  **clave primaria (primary key)** : Unico campo que identifica cada fila de una tabla (_asegura que no existan duplicados y facilita una busqueda rapida_)
- funcionalidad: unicidad de registros
- normalizacion: 1NF
- optimizacion: velocidad de las operaciones

2.  **clave foranea (foreign key)** : Campo que identifica la relacion entre dos tablas. (_la clave foranea de una tabla es la clave primaria de otra, formando relacion entre ambas_) --> _es crucial para mantener la INTEGRIDAD REFERENCIAL_

- funcionalidad: integridad referencial
- normalizacion: 2NF, 3NF
- optimizacion: integridad de los datos

3.  **Indices**: Estructuras adicionales que mejoran la velocidad de recuperacion de los datos --> optimizar consultas (_optimizar recuperaciones de datos, mejorar velocidad de acceso a los datos_)


4. **Claves Candidatas (candidate keys)**: son un conjunto de atributos que podrían ser claves primarias porque identifican de manera única cada fila en una tabla.

- funcionalidad: cd clave candidata potencial a ser primaria, ofreciendo alternativas para el diseño del esquema
- normalizacion: cd elemento se datos se almacena una sola vez
- optimizacion: seleccion adecuada de clav candiadta como clave primaria puede afectar positivamente al rendimiento de la base de datos

5. **Claves Concatenadas (composite keys)**: conocidas como _CLAVES COMPUESTAS_, formadas por dos o mas columnas, que identifican de forma unica cada fila en una tabla

- funcionalidad: ninguna col individual es suficientemente unica por si sola
- normalizacion: integridad de los datos
- optimizacion: consultas complejas y lentas, pero indispensables paraa ciertos tipos de relaciones de datos


___

# Fundamentos de Tablas SQL

### Tipos de tablas

1. **Tablas Transaccionales** : usadas en aplicaciones donde la integridad y consistencia de los datos es critica

2. **Tablas de hechos**: capturan eventos o transacciones del negocio, donde cada fila representa un evento y las columnas contienen datos cuantitativos y descriptivos. 

Tipos de columnas en tablas de hechos: 
- Aditivas: se pueden sumar a traves de dimensiones (_como ventas totales_)
- Semi-aditivas: se pueden sumar para algunas dimensiones (_como inventario al final del dia_)
- No-aditivas: No se pueden sumar (_como precios unitarios_)


### Tipos de relaciones

1. Relacion uno a uno: Cada registro, en cada tabla, aparece solo una vez, y tienen una relación unívoca.
2. Relacion uno a muchos: Un registro en una tabla puede tener relación con varios elementos de otra tabla.
3. Relacion muchos a muchos:Uno o más registros en una tabla pueden tener relación con uno o más elementos de otra tabla. (_En la práctica no se puede implementar con base de datos la relación muchos a muchos, es por eso que se requiere de una tabla adicional (o tabla puente) que establezca una relación Uno-A-Muchos con cada tabla por separado y de esa forma dejar conformada la relación._) 

___

# Diseño y Normalizacion de tablas

Normalizacion: tecnica para diseñar esquemas de base de datos que organiza las tablas de acuerdo a ciertas reglas para minimizar la duplicación de datos y evitar anomalías de datos.

### Formas Normales

1. **Primera Forma Normal (1NF):** Asegura que en cada tabla, cada columna debe contener valores atómicos, y cada registro debe ser único.
2. **Segunda Forma Normal (2NF):** Se logra cuando la tabla está en 1NF y todos los atributos no clave dependen completamente de la clave primaria. En otras palabras, no debe haber dependencia parcial de la clave primaria en ningún atributo no clave, eliminando así cualquier redundancia funcional.
3. **Tercera Forma Normal (3NF):** Una tabla se considera 3NF si está en 2NF y todos los atributos no clave son mutuamente independientes
4. **Forma Normal de Boyce-Codd (BCNF):** Es una versión más estricta de la 3NF, que se aplica cuando una tabla tiene más de una clave candidata. Una tabla está en BCNF si, para **cada una de sus dependencias funcionales**, el lado izquierdo de la dependencia es una superclave.
5. **Cuarta Forma Normal (4NF):** Se logra cuando la tabla está en BCNF y no contiene dependencias multivaluadas, es decir, un atributo no clave no debe depender de más de un atributo no clave, evitando así que un registro contenga múltiples valores en un solo campo relacionado con diferentes aspectos de la entidad.
6. **Quinta Forma Normal (5NF):** Una tabla está en 5NF si está en 4NF y no tiene ninguna dependencia de unión. Esto asegura que los datos no pueden descomponerse en otras tablas sin pérdida de información.


### Diseño de esquemas eficientes

- reducir redundancia
- aumentar la integridad de los datos
- mejorar el rendimiento
- escalabilidad y mantenimiento

### Tecnicas de diseño

1. Identificación de entidades y atributos clave
2. Uso de claves foráneas para integridad referencial
3. Índices para mejorar el rendimiento de las consultas

_Las bases de datos altamente normalizadas pueden a veces requerir más operaciones de unión (joins), lo que puede ralentizar el rendimiento en consultas complejas. La denormalización, aunque aumenta la redundancia, puede ser útil en casos donde se necesita mejorar la velocidad de acceso a los datos._


