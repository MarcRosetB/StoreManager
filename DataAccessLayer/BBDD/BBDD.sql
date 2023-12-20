DROP DATABASE IF EXISTS StoreManager;
CREATE DATABASE StoreManager;
USE StoreManager;

CREATE TABLE Poblacion (
    IdPoblacion INT AUTO_INCREMENT PRIMARY KEY,
    NombrePoblacion VARCHAR (30)
);

CREATE TABLE Tienda (
    IdTienda INT AUTO_INCREMENT PRIMARY KEY,
    NombreTienda VARCHAR (30) UNIQUE,
    FkPoblacion INT,
    FOREING KEY (FkPoblacion) REFERENCES Poblacion(IdPoblacion)
);

CREATE TABLE Departamento (
    IdDepartamento INT AUTO_INCREMENT PRIMARY KEY,
    NombreDepartamento VARCHAR (30)
);

CREATE TABLE Empleado (
    IdEmpleado INT AUTO_INCREMENT PRIMARY KEY,
    NombreEmpleado VARCHAR (50),
    DNIEmpleado CHAR(9) UNIQUE,
    EmailEmpleado VARCHAR(30) UNIQUE,
    Pwd VARCHAR(265),
    TelefonoEmpleado CHAR(9) UNIQUE,
    Salario INT,
    FkDepartamento INT,
    FOREING KEY (FkDepartamento) REFERENCES Departamento(IdDepartamento)
);

CREATE TABLE Cliente (
    IdCliente INT AUTO_INCREMENT PRIMARY KEY,
    NombreCliente VARCHAR (50) UNIQUE,
    CIFCliente CHAR(9) UNIQUE,
    TelefonoCliente CHAR(9) UNIQUE,
    EmailCliente CHAR(9) UNIQUE,
    DireccionCliente VARCHAR(50),
    FkPoblacion INT,
    FOREING KEY(FkPoblacion) REFERENCES Poblacion(IdPoblacion)
);

CREATE TABLE Contacto (
    IdContacto INT AUTO_INCREMENT PRIMARY KEY,
    NombreContacto VARCHAR(20),
    TelefonoContacto CHAR(9),
    EmailContacto VARCHAR(50),
    FkCliente INT,
    FOREING KEY(FkCliente) REFERENCES Cliente(IdCliente)
);

CREATE TABLE DireccionEntrega (
    IdDireccion INT AUTO_INCREMENT PRIMARY KEY,
    Direccion VARCHAR(50),
    FkPoblacion INT,
    FkCliente INT,
    FOREING KEY(FkPoblacion) REFERENCES Poblacion(IdPoblacion),
    FOREING KEY(FkCliente) REFERENCES Cliente(IdCliente)
);

CREATE TABLE Articulo (
    IdArticulo INT AUTO_INCREMENT PRIMARY KEY,
    Referencia VARCHAR(30) UNIQUE,
    Descripcion VARCHAR(50),
    Precio INT,
    Stock INT
);

CREATE TABLE Presupuesto (
    IdPresupuesto INT AUTO_INCREMENT PRIMARY KEY,
    ReferenciaPresupuesto VARCHAR(50),
    FechaPresupuesto DATE,
    FkEmpleado INT,
    FkDireccionEntrega INT,
    FkContacto INT,
    FOREIGN KEY (FkEmpleado) REFERENCES Empleado(IdEmpleado),
    FOREIGN KEY (FkDireccionEntrega) REFERENCES DireccionEntrega (IdDireccion),
    FOREIGN KEY (FkContacto) REFERENCES Contacto(IdContacto)
);

CREATE TABLE Contenido (
    IdContenido INT AUTO_INCREMENT PRIMARY KEY,
    FkPresupuesto INT,
    FkArticulo INT,
    Cantidad INT,
    FOREIGN KEY(FkPresupuesto) REFERENCES Presupuesto(IdPresupuesto),
    FOREIGN KEY(FkArticulo) REFERENCES Articulo(IdArticulo)
);

CREATE TABLE Pedido (
    IdPedido INT AUTO_INCREMENT PRIMARY KEY,
    ReferenciaPedido VARCHAR(50),
    FechaPedido DATE,
    FkPresupuesto INT,
    FOREIGN KEY (FkPresupuesto) REFERENCES Presupuesto(IdPresupuesto)
);

CREATE TABLE Entrega (
    IdEntrega INT AUTO_INCREMENT PRIMARY KEY,
    ReferenciaEntrega VARCHAR(50),
    FechaEntrega DATE,
    FkEquipo INT,
    PagoPendiente INT,
    FOREIGN KEY (FkEquipo) REFERENCES Equipo(IdEquipo)
);