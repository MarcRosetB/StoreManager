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