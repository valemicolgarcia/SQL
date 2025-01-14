# Sublenguaje tcl

### fundamentos del tcl

- COMMIT: Este comando confirma una transacción, haciendo permanentes los cambios realizados en la base de datos. Una vez ejecutado, los cambios quedan disponibles para otros usuarios y aplicaciones.

- ROLLBACK: Deshace los cambios realizados por las transacciones no confirmadas. Es similar a una función de "deshacer" (UNDO) y se utiliza cuando se desea revertir los efectos de una transacción debido a errores o situaciones inesperadas. ROLLBACK solo puede utilizarse antes de ejecutar un COMMIT; después de la confirmación, los cambios son permanentes.

- SAVEPOINT: Permite definir puntos de restauración dentro de una transacción. Esto es útil para deshacer partes específicas de una transacción sin tener que revertir la transacción completa. Utilizando SAVEPOINT en modificaciones masivas, es posible gestionar cambios por bloques, ofreciendo mayor control sobre la lógica operativa.

- Para iniciar una transacción en SQL, se utiliza el comando START TRANSACTION. Una vez iniciada, las operaciones DML se ejecutan bajo esta transacción hasta que se aplica un COMMIT o ROLLBACK.