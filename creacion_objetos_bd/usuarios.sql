CREATE ROLE admin;
CREATE ROLE mozo;
CREATE ROLE lectura_escritura;
CREATE ROLE solo_lectura;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT ALL PRIVILEGES ON sgbd.* TO 'admin'@'localhost';

CREATE USER 'mozo'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT SELECT ON sgbd.pedido TO 'mozo'@'localhost';
GRANT SELECT ON sgbd.producto TO 'mozo'@'localhost';
GRANT SELECT ON sgbd.mesa TO 'mozo'@'localhost';

CREATE USER 'lectura_escritura'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT SELECT, INSERT, UPDATE, DELETE ON sgbd.pedido TO 'lectura_escritura'@'localhost';
GRANT SELECT, INSERT, UPDATE, DELETE ON sgbd.producto TO 'lectura_escritura'@'localhost';

CREATE USER 'solo_lectura'@'localhost' IDENTIFIED BY 'contraseña_segura';
GRANT SELECT ON sgbd.pedido TO 'solo_lectura'@'localhost';
GRANT SELECT ON sgbd.producto TO 'solo_lectura'@'localhost';
GRANT SELECT ON sgbd.mesa TO 'solo_lectura'@'localhost';

FLUSH PRIVILEGES;