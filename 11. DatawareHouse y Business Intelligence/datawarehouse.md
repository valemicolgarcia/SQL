# Datawarehouse

Es un sistema de almacenamiento de datos para organizar informacion proveniente de diferentes fuentes dentro de una empresa.
- Diseñado para el analisis y consulta de grandes volumenes de datos historicos

### Definicion y proposito

- repositorio central donde se integran datos de diversos sistemas empresariales
- centralizar e integrar datos de manera uniforme

___

# ETL (Extract, Transform, Load)

El proceso de ETL se encarga de transferir datos desde múltiples fuentes hacia el datawarehouse, asegurando que la información esté limpia, transformada y lista para su análisis

1. EXTRACCION: datos son recolectados desde diversas fuentes. Estas fuentes pueden incluir bases de datos SQL y NoSQL,
2. TRANSFORMACION: los datos extraídos son limpiados, transformados y organizados para cumplir con las reglas de negocio y los estándares de calidad de la empresa.
- _limpieza_
- _estandarizacion_
- _agregacion y calculos_
- _mapeo y fusionl_
3. CARGA: datos transformados son cargados en el datawarehouse. En esta fase, los datos se almacenan de manera estructurada, listos para ser consultados y analizados mediante herramientas de Business Intelligence.
- carga completa
- carga incremental
- carga en tiempo real

____

# Business Intelligence

- conjunto de tecnologías, procesos y metodologías que permiten a las organizaciones transformar datos en información útil para la toma de decisiones empresariales. BI se centra en analizar datos empresariales y presentarlos de manera comprensible para los tomadores de decisiones, facilitando la identificación de tendencias, patrones y oportunidades que mejoren los procesos y estrategias de una empresa.

### Principales herramientas de BI

1. Consultas e informes: reportes personalizados y filtrar informacion
2. Cubos OLAP (Online analytical processing): analisis multidimensional
3. Data mining: algoritmos avanzados para identificar patrones ocultos y relaciones en grandes conjuntos de datos
4. Tableros de control (Dashboards): representacion visual de mtricas claves a traves de graficos interactivos y tacometros

