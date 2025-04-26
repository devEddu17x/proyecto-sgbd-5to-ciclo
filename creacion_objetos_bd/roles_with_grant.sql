CREATE ROLE admin;
GRANT ALL PRIVILEGES ON *.* TO admin WITH GRANT OPTION;

-- Rol para cajero
CREATE ROLE lectura_escritura;
-- Lectura
GRANT SELECT ON sgbd.producto TO lectura_escritura;
GRANT SELECT ON sgbd.cliente TO lectura_escritura;
GRANT SELECT ON sgbd.pedido TO lectura_escritura;
GRANT SELECT ON sgbd.mesa TO lectura_escritura;
-- Registro de ventas y comprobantes
GRANT SELECT, INSERT ON sgbd.venta TO lectura_escritura;
GRANT SELECT, INSERT ON sgbd.boleta TO lectura_escritura;
GRANT SELECT, INSERT ON sgbd.factura TO lectura_escritura;

-- Rol para mozo
CREATE ROLE lectura;
-- Solo lectura
GRANT SELECT ON sgbd.producto TO lectura;
GRANT SELECT ON sgbd.pedido TO lectura;
GRANT SELECT ON sgbd.mesa TO lectura;
