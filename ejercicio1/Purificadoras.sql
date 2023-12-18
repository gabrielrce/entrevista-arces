-- Tabla para Purificadoras
CREATE TABLE Purificadora (
    id_purificadora INT PRIMARY KEY,
    nombre_representante VARCHAR(255),
    apellidos_representante VARCHAR(255),
    direccion VARCHAR(255),
    telefono_1 VARCHAR(15),
    telefono_2 VARCHAR(15),
    correo VARCHAR(255),
    observaciones TEXT,
    fecha_creacion DATE, -- Valor predeterminado con la marca de tiempo actual
    costo DECIMAL(10,2),
    latitud DECIMAL(9, 6),  -- Coordenadas ubicacion
    longitud DECIMAL(9, 6) -- Coordenadas ubicacion
);

-- Tabla para Mantenimiento
CREATE TABLE Mantenimiento (
    id_mantenimiento INT PRIMARY KEY,
    id_purificadora INT,
    fecha_mantenimiento DATE,
    encargado VARCHAR(255),
    observaciones TEXT,
    estado VARCHAR(10),
    FOREIGN KEY (id_purificadora) REFERENCES Purificadora(id_purificadora)
);

-- Tabla para Cotizacion
CREATE TABLE Cotizacion (
    id_cotizacion INT PRIMARY KEY,
    id_purificadora INT,
    area_construccion DECIMAL(8,2),
    num_bombas INT,
    num_dispensadores INT,
    costo_total DECIMAL(10,2),
    observaciones TEXT,
    FOREIGN KEY (id_purificadora) REFERENCES Purificadora(id_purificadora)
);

-- Tabla para PersonaCotizacion. Nota: Podría haber más de una persona asociada a una cotizacion
CREATE TABLE PersonaCotizacion (
    id_persona_cotizacion INT PRIMARY KEY,
    id_cotizacion INT,
    nombre_completo VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    correo VARCHAR(255),
    FOREIGN KEY (id_cotizacion) REFERENCES Cotizacion(id_cotizacion)
);
