-- funciones

DELIMITER $$

CREATE FUNCTION CalcularTotalPedidosCliente(ClienteID INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE TotalGastado DECIMAL(10,2);

    SELECT SUM(Monto) INTO TotalGastado
    FROM Pedidos
    WHERE ClienteID = ClienteID;

    RETURN COALESCE(TotalGastado, 0); -- Si no tiene pedidos, devuelve 0
END$$

DELIMITER ;

SELECT CalcularTotalPedidosCliente(4) AS TotalGastado; -- le mando el cliente 4

DELIMITER $$

CREATE FUNCTION ObtenerPromocionesActivas(RestauranteID INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE CantidadPromociones INT;

    SELECT COUNT(*) INTO CantidadPromociones
    FROM Promociones
    WHERE RestauranteID = RestauranteID
      AND CURDATE() BETWEEN FechaInicio AND FechaFin;

    RETURN CantidadPromociones;
END$$

DELIMITER ;

SELECT ObtenerPromocionesActivas(1) AS PromocionesActivas;

DELIMITER $$

CREATE FUNCTION CalcularCantidadDisponible(ProductoNombre VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE CantidadTotal INT;

    SELECT SUM(Cantidad) INTO CantidadTotal
    FROM Inventario
    WHERE Producto = ProductoNombre;

    RETURN COALESCE(CantidadTotal, 0); -- Si no hay stock, devuelve 0
END$$

DELIMITER ;

SELECT CalcularCantidadDisponible('Tomates') AS TotalCantidad;



