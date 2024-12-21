USE DBResto;

INSERT INTO Zonas (NombreZona, Descripcion)
VALUES
('Centro', 'Zona céntrica de la ciudad'),
('Norte', 'Zona residencial del norte'),
('Sur', 'Zona industrial');

SELECT * FROM Zonas;

INSERT INTO CategoriaPlato (NombreCategoria, Descripcion)
VALUES
('Entrada', 'Platos ligeros antes del plato principal'),
('Principal', 'Platos principales'),
('Postre', 'Platos dulces para el final de la comida');

SELECT * FROM Categoriaplato;

INSERT INTO Clientes (Nombre, Email, Telefono, TipoCliente, CantPedidosPasados)
VALUES
('Juan Pérez', 'juanperez@example.com', '123456789', 'Frecuente', 15),
('Ana Gómez', 'anagomez@example.com', '987654321', 'Ocasional', 5),
('Luis Martínez', 'luismartinez@example.com', '112233445', 'Nuevo', 0);

SELECT * FROM Clientes;

INSERT INTO Restaurante (NombreRestaurante, UbicacionRestaurante, HorarioApertura, TipoDeCocina, ZonaID)
VALUES
('Restaurante Central', 'Av. Principal 123', '10:00:00', 'Italiana', 1),
('Restaurante Norte', 'Calle Norte 456', '12:00:00', 'Parrilla', 2),
('Restaurante Sur', 'Calle Sur 789', '11:00:00', 'Mexicana', 3);



INSERT INTO Mesas (RestauranteID, NumeroMesa, Capacidad, Estado, Ubicacion)
VALUES
(1, 1, 4, 'Disponible', 'Planta Baja'),
(1, 2, 2, 'Reservada', 'Planta Alta'),
(2, 1, 6, 'Disponible', 'Terraza'),
(3, 3, 8, 'Ocupada', 'Patio Exterior');

INSERT INTO Platos (RestauranteID, NombrePlato, PrecioPlato, AptoCeliacos, AptoVegetariano, CategoriaID)
VALUES
(1, 'Pasta Alfredo', 850.00, TRUE, FALSE, 2),
(2, 'Asado Completo', 1200.00, FALSE, FALSE, 2),
(3, 'Tacos Vegetarianos', 500.00, TRUE, TRUE, 3);

INSERT INTO Promociones (RestauranteID, Descripcion, FechaInicio, FechaFin)
VALUES
(1, '2x1 en pastas los lunes', '2024-12-01', '2024-12-31'),
(2, 'Descuento del 20% en parrillas', '2024-12-10', '2024-12-20'),
(3, 'Happy Hour de tacos', '2024-12-15', '2024-12-25');

INSERT INTO Proveedores (NombreProveedor, Contacto, Direccion, RestauranteID)
VALUES
('Proveedor Centro', 'centro@example.com', 'Av. Principal 456', 1),
('Proveedor Norte', 'norte@example.com', 'Calle Norte 789', 2),
('Proveedor Sur', 'sur@example.com', 'Calle Sur 123', 3);

INSERT INTO Reservas (ClienteID, RestauranteID, MesaID, Fecha, Hora)
VALUES
(1, 1, 2, '2024-12-21', '20:00:00'),
(2, 2, 1, '2024-12-22', '19:00:00'),
(3, 3, 3, '2024-12-23', '18:00:00');

INSERT INTO Opiniones (ClienteID, RestauranteID, PlatoID, Calificacion, Comentario, Fecha)
VALUES
(1, 1, 1, 5, 'Excelente comida', '2024-12-18'),
(2, 2, 2, 4, 'Muy buen servicio', '2024-12-19'),
(3, 3, 3, 3, 'Podría mejorar', '2024-12-20');

INSERT INTO Inventario (RestauranteID, Producto, Cantidad, FechaActualizacion)
VALUES
(1, 'Tomates', 50, '2024-12-19'),
(2, 'Carne', 200, '2024-12-18'),
(3, 'Tortillas', 100, '2024-12-17');

INSERT INTO Empleados (RestauranteID, NombreEmpleado, Telefono, Rol, Estado, Salario, Asistencias)
VALUES
(1, 'Carlos López', '123456789', 'Cocinero', 'Activo', 50000.00, 20),
(2, 'María Torres', '987654321', 'Mesera', 'Activo', 30000.00, 15),
(3, 'Pedro Sánchez', '112233445', 'Administrador', 'Inactivo', 60000.00, 10);

INSERT INTO Ingredientes (NombreIngrediente, Descripcion, CantidadUsada, PlatoID)
VALUES
('Crema', 'Base para salsas', 5, 1),
('Carne de Res', 'Corte especial', 10, 2),
('Frijoles', 'Relleno de tacos', 3, 3);

INSERT INTO Pedidos (ClienteID, RestauranteID, PlatoID, Monto, EstadoPedido, FechaPedido)
VALUES
(1, 1, 1, 850.00, 'Entregado', '2024-12-19'),
(2, 2, 2, 1200.00, 'Pendiente', '2024-12-20'),
(3, 3, 3, 500.00, 'Cancelado', '2024-12-18');

INSERT INTO Pagos (PedidoID, Monto, MetodoPago, FechaPago)
VALUES
(1, 850.00, 'Tarjeta', '2024-12-19'),
(2, 1200.00, 'Efectivo', '2024-12-20'),
(3, 500.00, 'Tarjeta', '2024-12-18');

SELECT * FROM Inventario;

DELETE FROM Clientes;
INSERT INTO Clientes (ClienteID, Nombre, Email, Telefono, TipoCliente, CantPedidosPasados)
VALUES
(1, 'Juan Pérez', 'juanperez@example.com', '123456789', 'Frecuente', 15),
(2, 'Ana Gómez', 'anagomez@example.com', '987654321', 'Ocasional', 5),
(3, 'Luis Martínez', 'luismartinez@example.com', '112233445', 'Nuevo', 0);


INSERT INTO Mesas (MesaID, RestauranteID, NumeroMesa, Capacidad, Estado, Ubicacion)
VALUES
(1, 1, 1, 4, 'Disponible', 'Planta Baja'),
(2, 2, 2, 6, 'Disponible', 'Planta Alta'),
(3, 3, 3, 8, 'Ocupada', 'Terraza');


INSERT INTO Inventario (RestauranteID, Producto, Cantidad, FechaActualizacion)
VALUES
(1, 'Lechuga', 5, '2024-12-20'),
(2, 'Cebolla', 3, '2024-12-21'),
(3, 'Chiles', 7, '2024-12-22'),
(1, 'Ajo', 2, '2024-12-23'),
(2, 'Perejil', 1, '2024-12-24');
