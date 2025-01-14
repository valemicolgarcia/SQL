USE DBResto;

CREATE TABLE InventarioHistorial (
    HistorialID INT PRIMARY KEY AUTO_INCREMENT,
    InventarioID INT NOT NULL,
    Producto VARCHAR(100),
    CantidadAnterior INT,
    CantidadNueva INT,
    FechaModificacion DATETIME,
    FOREIGN KEY (InventarioID) REFERENCES Inventario(InventarioID)
);

DELIMITER $$

--  TRIGGER 1: Registrar cambios en el inventario
-- proposito: guardar un historial cd vez que se actualice la cantidad de un producto en el inventario

CREATE TRIGGER tr_inventario_actualizado
AFTER UPDATE ON Inventario
FOR EACH ROW
BEGIN
    IF NEW.Cantidad <> OLD.Cantidad THEN
        INSERT INTO InventarioHistorial (InventarioID, Producto, CantidadAnterior, CantidadNueva, FechaModificacion)
        VALUES (NEW.InventarioID, NEW.Producto, OLD.Cantidad, NEW.Cantidad, NOW());
    END IF;
END$$

DELIMITER ;

-- PRUEBA:
-- consulta inicial
SELECT * FROM InventarioHistorial;

-- actualizo la cantidad en el inventario
UPDATE Inventario
SET Cantidad = Cantidad + 10
WHERE InventarioID = 1;

SELECT * FROM InventarioHistorial;


-- TRIGGER 2: Prevenir eliminar restaurantes con reservas activas
-- proposito: impedir que un restaurante sea eliminado si tiene reservas activas

DELIMITER $$

CREATE TRIGGER tr_prevent_delete_restaurante
BEFORE DELETE ON Restaurante
FOR EACH ROW
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Reservas
        WHERE RestauranteID = OLD.RestauranteID
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el restaurante porque tiene reservas activas.';
    END IF;
END$$

DELIMITER ;

SELECT * FROM Restaurante;

INSERT INTO Restaurante (NombreRestaurante, UbicacionRestaurante, HorarioApertura, TipoDeCocina, ZonaID)
VALUES ('Restaurante Prueba', 'Ubicación Prueba', '12:00:00', 'Internacional', 1);

INSERT INTO Reservas (ClienteID, RestauranteID, MesaID, Fecha, Hora)
VALUES (1, LAST_INSERT_ID(), 1, '2025-01-14', '20:00:00');

SET @maxRestauranteID = (SELECT MAX(RestauranteID) FROM Restaurante);
DELETE FROM Restaurante WHERE RestauranteID = @maxRestauranteID;



