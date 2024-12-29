# Introducción al Sublenguaje DCL en MySQL

## Concepto General
El **Lenguaje de Control de Datos (DCL)** en MySQL es esencial para la administración de usuarios y permisos en una base de datos. Permite definir quién puede acceder y manipular los datos, asegurando la seguridad y la integridad de los mismos. Los comandos de DCL son utilizados para gestionar usuarios y controlar los permisos sobre los objetos de la base de datos.

---

## Gestión de Usuarios

DCL permite:
- Crear y modificar usuarios.
- Cambiar contraseñas.
- Definir niveles de acceso para los usuarios.

### Comandos Principales para la Gestión de Usuarios

-  **CREATE USER**
Crea un nuevo usuario en la base de datos, definiendo su nombre, host de conexión y contraseña.

```sql
CREATE USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'contraseña';
```

- **ALTER USER**
Modifica las propiedades de un usuario existente, como su contraseña.

```SQL
 ALTER USER 'nombre_usuario'@'localhost' IDENTIFIED BY 'nueva_contraseña';
```

- **RENAME USER**
```SQL
 RENAME USER 'nombre_usuario'@'localhost' TO 'nuevo_nombre'@'localhost';
```

- **DROP USER**
```SQL
DROP USER 'nombre_usuario'@'localhost';
```

### Permisos

- DCL permite otorgar o revocar permisos sobre los objetos de la base de datos, incluye tablas, vistas, procedimientos almacenados y mas

- **GRANT**: otorgar permisos a un usuario. Los permisos se otorgan a nivel base de datos o tabla individual

```SQL
  GRANT SELECT, INSERT ON nombre_base_datos.nombre_tabla TO 'nombre_usuario'@'localhost';
```

- **REVOKE** : quitar permisos previamente otorgados a un usuario
```SQL
  REVOKE SELECT ON nombre_base_datos.nombre_tabla FROM 'nombre_usuario'@'localhost';

```
Revoca el permiso de lectura sobre la tabla especificada.

### Crear y gestionar usuarios en MySQL

1. **CREATE USER**: Se utiliza para agregar un nuevo usuario a la base de datos .
- permite definir el nombre del usuario y el host desde el cual podrá acceder a la base de datos. Además, es posible establecer una contraseña para el usuario.

```SQL
CREATE USER 'nombre_usuario'@'host' IDENTIFIED BY 'contraseña';
```

2. **RENAME USER**: permite cambiar el nombre de un usuario existente

```SQL
RENAME USER 'nombre_actual'@'host' TO 'nuevo_nombre'@'host';
```

3. **DROP USER**: eliminar un usuario de la base de datos. Al eliminar un usuario, se revocan todos los permisos asociados y se elimina cualquier referencia al usuario en el sistema.

```SQL
DROP USER 'nombre_usuario'@'host';
```

___
# Asignacion de permisos con DCL

1. GRANT: Permite al usuario consultar y visualizar datos en tablas y vistas

```SQL
GRANT SELECT ON base_datos.tabla TO 'usuario'@'host';
```

2. GRANT: modificacion de datos (INSERT, UPDATE, DELETE)

```SQL
GRANT INSERT, UPDATE, DELETE ON base_datos.tabla TO 'usuario'@'host';
```

3. GRANT: gestion de objetos (create, alter, drop)

```SQL
GRANT CREATE, ALTER, DROP ON base_datos.* TO 'usuario'@'host';
```

4. GRANT: otorgar todos los permisos

```SQL
GRANT ALL ON *.* TO 'usuario'@'host';
```

5. REVOKE: quitar permisos especificos

```SQL
REVOKE SELECT, INSERT ON base_datos.tabla FROM 'usuario'@'host';
```

6. REVOKE: quitar todos los permisos

```SQL
REVOKE ALL ON *.* FROM 'usuario'@'host';
```

7. GRANT: solo actualizar columnas especificas

```SQL
GRANT UPDATE (precio, stock) ON comercio.productos TO 'editor'@'localhost';
```