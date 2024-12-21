-- PRIMERA ENTREGA 

CREATE DATABASE DBResto;
USE DBResto;

CREATE TABLE Zonas (
    ZonaID INT PRIMARY KEY AUTO_INCREMENT,
    NombreZona VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(200)
);

CREATE TABLE CategoriaPlato (
    CategoriaID INT PRIMARY KEY AUTO_INCREMENT,
    NombreCategoria VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255)
);

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(20) NOT NULL,
    TipoCliente VARCHAR(50) NOT NULL,
    CantPedidosPasados INT DEFAULT 0
);

--

CREATE TABLE Restaurante (
    RestauranteID INT PRIMARY KEY AUTO_INCREMENT,
    NombreRestaurante VARCHAR(100) NOT NULL,
    UbicacionRestaurante VARCHAR(200) NOT NULL,
    HorarioApertura TIME NOT NULL,
    TipoDeCocina VARCHAR(50) NOT NULL,
    ZonaID INT,
    FOREIGN KEY (ZonaID) REFERENCES Zonas(ZonaID)
);

CREATE TABLE Mesas (
    MesaID INT PRIMARY KEY AUTO_INCREMENT,
    RestauranteID INT NOT NULL,
    NumeroMesa INT NOT NULL,
    Capacidad INT NOT NULL,
    Estado VARCHAR(50),
    Ubicacion VARCHAR(255),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID)
);

CREATE TABLE Platos (
    PlatoID INT PRIMARY KEY AUTO_INCREMENT,
    RestauranteID INT NOT NULL,
    NombrePlato VARCHAR(100) NOT NULL,
    PrecioPlato DECIMAL(10,2) NOT NULL,
    AptoCeliacos BOOLEAN DEFAULT FALSE,
    AptoVegetariano BOOLEAN DEFAULT FALSE,
    CategoriaID INT NOT NULL,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID),
    FOREIGN KEY (CategoriaID) REFERENCES CategoriaPlato(CategoriaID)
);

---

CREATE TABLE Promociones (
    PromocionID INT PRIMARY KEY AUTO_INCREMENT,
    RestauranteID INT NOT NULL,
    Descripcion VARCHAR(250) NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID)
);

CREATE TABLE Proveedores (
    ProveedorID INT PRIMARY KEY AUTO_INCREMENT,
    NombreProveedor VARCHAR(100) NOT NULL,
    Contacto VARCHAR(100),
    Direccion VARCHAR(200),
    RestauranteID INT,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID)
);

CREATE TABLE Reservas (
    ReservaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    RestauranteID INT NOT NULL,
    MesaID INT NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID),
    FOREIGN KEY (MesaID) REFERENCES Mesas(MesaID)
);

CREATE TABLE Opiniones (
    OpinionID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    RestauranteID INT NOT NULL,
    PlatoID INT,
    Calificacion INT NOT NULL,
    Comentario VARCHAR(250),
    Fecha DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID),
    FOREIGN KEY (PlatoID) REFERENCES Platos(PlatoID)
);

CREATE TABLE Inventario (
    InventarioID INT PRIMARY KEY AUTO_INCREMENT,
    RestauranteID INT NOT NULL,
    Producto VARCHAR(100) NOT NULL,
    Cantidad INT DEFAULT 0 NOT NULL,
    FechaActualizacion DATE DEFAULT NULL,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID)
);

CREATE TABLE Empleados (
    EmpleadoID INT PRIMARY KEY AUTO_INCREMENT,
    RestauranteID INT NOT NULL,
    NombreEmpleado VARCHAR(100) NOT NULL,
    Telefono VARCHAR(100),
    Rol VARCHAR(50) NOT NULL,
    Estado VARCHAR(50),
    Salario DECIMAL(10,2) DEFAULT 0 NOT NULL,
    Asistencias INT DEFAULT 0,
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID)
);

CREATE TABLE Ingredientes (
    IngredienteID INT PRIMARY KEY AUTO_INCREMENT,
    NombreIngrediente VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(50),
    CantidadUsada INT DEFAULT 0 NOT NULL,
    PlatoID INT NOT NULL,
    FOREIGN KEY (PlatoID) REFERENCES Platos(PlatoID)
);

CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT NOT NULL,
    RestauranteID INT NOT NULL,
    PlatoID INT NOT NULL,
    Monto DECIMAL(10,2) DEFAULT 0 NOT NULL,
    EstadoPedido VARCHAR(50),
    FechaPedido DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (RestauranteID) REFERENCES Restaurante(RestauranteID),
    FOREIGN KEY (PlatoID) REFERENCES Platos(PlatoID)
);

CREATE TABLE Pagos (
    PagoID INT PRIMARY KEY AUTO_INCREMENT,
    PedidoID INT NOT NULL,
    Monto DECIMAL(10,2) DEFAULT 0 NOT NULL,
    MetodoPago VARCHAR(50) NOT NULL,
    FechaPago DATE NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);










