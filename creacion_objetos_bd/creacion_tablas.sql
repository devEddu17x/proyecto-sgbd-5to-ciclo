DROP DATABASE IF EXISTS sgbd;
CREATE DATABASE sgbd;
USE sgbd;

CREATE TABLE cliente (
    id VARCHAR(8) PRIMARY KEY DEFAULT(LEFT(UUID(),8)),
    nombre VARCHAR(32) NOT NULL,
    apellido_paterno VARCHAR(32) NOT NULL,
    apellido_materno VARCHAR(32) NOT NULL,
    telefono VARCHAR(9)
);

CREATE TABLE mozo (
    id VARCHAR(8) PRIMARY KEY DEFAULT(LEFT(UUID(),8)),
    nombre VARCHAR(32) NOT NULL,
    apellido_paterno VARCHAR(32) NOT NULL,
    apellido_materno VARCHAR(32) NOT NULL
);
CREATE TABLE mesa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(9) NOT NULL DEFAULT 'LIBRE',
    inicio_reserva DATETIME NULL,
    fin_reserva DATETIME NULL,
    CONSTRAINT check_mesa_estado CHECK(estado IN ('RESERVADA', 'OCUPADA', 'LIBRE', 'INACTIVA'))
);
CREATE TABLE familia (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(14),
    CONSTRAINT unique_familia_nombre UNIQUE (nombre)
);
CREATE TABLE producto (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    familia_id INT,
    descripcion TEXT,
    precio DECIMAL(6,2) NOT NULL,
    CONSTRAINT fk_producto_familia_id FOREIGN KEY (familia_id) REFERENCES familia(id),
    CONSTRAINT check_producto_precio CHECK (precio > 0)
);

CREATE TABLE pedido (
    id INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(9) NOT NULL DEFAULT 'PENDIENTE',
    fecha DATETIME NOT NULL DEFAULT NOW(),
    mozo_id VARCHAR(8),
    CONSTRAINT fk_pedido__mozo_id FOREIGN KEY (mozo_id) REFERENCES mozo(id),
    CONSTRAINT check_pedido_estado CHECK(estado IN ('PENDIENTE', 'CANCELADO'))
);

CREATE TABLE pedido_mesa (
    pedido_id INT,
    mesa_id INT,
    PRIMARY KEY (pedido_id, mesa_id),
    CONSTRAINT fk_pedido_mesa_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    CONSTRAINT fk_pedido_mesa_mesa_id FOREIGN KEY (mesa_id) REFERENCES mesa(id)
);

CREATE TABLE producto_pedido (
    pedido_id INT,
    producto_id INT,
    PRIMARY KEY (pedido_id, producto_id),
    CONSTRAINT fk_producto_pedido_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    CONSTRAINT fk_producto_pedido_producto_id FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE reserva (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    precio_adicional DECIMAL(6,2),
    cliente_id VARCHAR(8),
    pedido_id INT,
    CONSTRAINT fk_reserva_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_reserva_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    CONSTRAINT check_reserva_precio_adicional CHECK (precio_adicional >= 0)
);

CREATE TABLE venta (
    id VARCHAR(8) PRIMARY KEY DEFAULT(LEFT(UUID(),8)),
    total DECIMAL(6,2) NOT NULL,
    fecha DATETIME NOT NULL DEFAULT NOW(),
    cliente_id VARCHAR(8) NULL,
    pedido_id INT,
    CONSTRAINT fk_venta_cliente_id FOREIGN KEY (cliente_id) REFERENCES cliente(id),
    CONSTRAINT fk_venta_pedido_id FOREIGN KEY (pedido_id) REFERENCES pedido(id),
    CONSTRAINT check_venta_total CHECK (total > 0)
);

CREATE TABLE factura (
    venta_id VARCHAR(8),
    ruc VARCHAR(11) NOT NULL,
    PRIMARY KEY (venta_id, ruc),
    CONSTRAINT fk_factura_venta_id FOREIGN KEY (venta_id) REFERENCES venta(id)
);

CREATE TABLE boleta (
    venta_id VARCHAR(8),
    dni VARCHAR(8) NOT NULL,
    PRIMARY KEY (venta_id, dni),
    CONSTRAINT fk_boleta_venta_id FOREIGN KEY (venta_id) REFERENCES venta(id)
);


	