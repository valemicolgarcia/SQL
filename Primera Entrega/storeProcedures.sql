DELIMITER $$

CREATE PROCEDURE ActualizarEstadoMesa (
    IN p_MesaID INT,
    IN p_NuevoEstado VARCHAR(50)
)
BEGIN
    UPDATE Mesas
    SET Estado = p_NuevoEstado
    WHERE MesaID = p_MesaID;
END$$

DELIMITER ;

CALL ActualizarEstadoMesa(5, 'Reservada');


DELIMITER $$

CREATE PROCEDURE EliminarReserva (
    IN p_ReservaID INT
)
BEGIN
    DELETE FROM Reservas
    WHERE ReservaID = p_ReservaID;
END$$

DELIMITER ;

CALL EliminarReserva(3);

DELIMITER $$

CREATE PROCEDURE InsertarInventario (
    IN p_RestauranteID INT,
    IN p_Producto VARCHAR(100),
    IN p_Cantidad INT,
    IN p_FechaActualizacion DATE
)
BEGIN
    INSERT INTO Inventario (RestauranteID, Producto, Cantidad, FechaActualizacion)
    VALUES (p_RestauranteID, p_Producto, p_Cantidad, p_FechaActualizacion);
END$$

DELIMITER ;


CALL InsertarInventario(1, 'Manzanas', 20, '2024-12-26');




