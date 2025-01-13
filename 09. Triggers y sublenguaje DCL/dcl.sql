USE mysql;
SELECT * FROM user;
CREATE USER 'santiago'@'localhost' IDENTIFIED BY 'password1';

-- SELECT, INSERT, UPDATE, DELETE, ALL
GRANT SELECT ON gamers.game TO usuario
-- le aisgno al usuario el permiso de hacer select en la tabla game

-- grant: permite asignar permisos a un usuario o rol para realizar ciertas acciones
-- revoke: retira permisos previamente otorgados a un usuario o rol


-- schema.tabla
-- baseDeDatos.tabla
-- gamers.game: asi le damos acceso solo a la tabla game
-- *.* : asi le damos acceso a todas las tablas

SHOW GRANTS FOR 'santiago'@'localhost' ; -- muestro los privilegios que tiene santiago

REVOKE ALL ON gamers.* FROM 'santiago'@'localhost';


