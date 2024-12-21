-- SEGUNDA ENTREGA
USE DBResto;



-- VISTA 1: muestro las reservas realizadas por cada cliente, incluyendo fecha, restaurante y mesa asignada

CREATE VIEW ReservasPorCliente AS
SELECT 
    c.Nombre AS NombreCliente,
    r.Fecha AS FechaReserva,
    r.Hora AS HoraReserva,
    rest.NombreRestaurante AS NombreRestaurante,
    m.NumeroMesa AS NumeroMesa
FROM Reservas r
JOIN Clientes c ON r.ClienteID = c.ClienteID
JOIN Restaurante rest ON r.RestauranteID = rest.RestauranteID
JOIN Mesas m ON r.MesaID = m.MesaID;

-- consulta a la vista
SELECT * FROM ReservasPorCliente;


-- VISTA 2: Se muestran los platos mas vendidos con su ingreso total

CREATE VIEW PlatosMasVendidos AS
SELECT 
    p.NombrePlato AS NombrePlato,
    COUNT(ped.PedidoID) AS TotalPedidos,
    SUM(ped.Monto) AS IngresoTotal
FROM Pedidos ped
JOIN Platos p ON ped.PlatoID = p.PlatoID
GROUP BY p.NombrePlato
ORDER BY TotalPedidos DESC;

SELECT * FROM PlatosMasVendidos;


-- VISTA 3: Se listan todos los empleados activos en cd resturante
CREATE VIEW EmpleadosActivos AS
SELECT 
    e.NombreEmpleado AS NombreEmpleado,
    e.Rol AS Rol,
    rest.NombreRestaurante AS NombreRestaurante
FROM Empleados e
JOIN Restaurante rest ON e.RestauranteID = rest.RestauranteID
WHERE e.Estado = 'Activo';

SELECT * FROM EmpleadosActivos;


-- VISTA 3: Se muestran los productos con cantidades bajas en el inventario

CREATE VIEW InventariosBajos AS
SELECT 
    inv.Producto AS Producto,
    inv.Cantidad AS CantidadDisponible,
    rest.NombreRestaurante AS NombreRestaurante
FROM Inventario inv
JOIN Restaurante rest ON inv.RestauranteID = rest.RestauranteID
WHERE inv.Cantidad < 10;

SELECT * FROM InventariosBajos;


-- VISTA 5: Se muestran las promociones vigentes en cd restaurante

CREATE VIEW PromocionesActivas AS
SELECT 
    p.Descripcion AS DescripcionPromocion,
    p.FechaInicio AS FechaInicio,
    p.FechaFin AS FechaFin,
    rest.NombreRestaurante AS NombreRestaurante
FROM Promociones p
JOIN Restaurante rest ON p.RestauranteID = rest.RestauranteID
WHERE p.FechaFin >= CURDATE();

SELECT * FROM PromocionesActivas;








