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