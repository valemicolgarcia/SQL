use empresa;
 
CREATE TABLE clientes (
id_cliente INT auto_increment primary key,
nombre varchar(100),
email varchar(100));

SELECT * FROM clientes;

CREATE TABLE pedidos (
id_pedido int auto_increment primary key,
id_cliente int,
fecha date,
foreign key(id_cliente) references clientes (id_cliente)); -- asegura que cd pedido esta vinculado a un cliente existente

INSERT INTO clientes (nombre, email)
values ('Ana Lopez', 'ana.lopez@gmail.com');

INSERT INTO pedidos (id_cliente, fecha)
VALUES (1, now());

SELECT * FROM pedidos;

-- sabemos que el ID 99 de cliente no existe, intentamos crear pedido

INSERT INTO pedidos (id_cliente, fecha) -- DA ERROR porque ya esta configurada la clave foranea y no hay relacion
VALUES (99, now());

