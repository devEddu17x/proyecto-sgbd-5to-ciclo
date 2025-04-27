CREATE ROLE 'admin';
GRANT ALL PRIVILEGES ON *.* TO 'admin';

CREATE ROLE 'mozo';
-- ver el menu
GRANT SELECT ON rcep.producto TO 'mozo';
-- crear y consultar pedidos propios
GRANT INSERT, SELECT ON rcep.pedido TO 'mozo';
-- ver las familias de productos
GRANT SELECT ON rcep.familia TO 'mozo';
-- asignar mesa a los pedidos y consultarlas
GRANT INSERT, SELECT ON rcep.pedido_mesa TO 'mozo';
-- asociar productos al pedido y consultarlos
GRANT INSERT, SELECT ON rcep.producto_pedido TO 'mozo';
-- ver el estado de las mesas
GRANT SELECT ON rcep.mesa TO 'mozo';

CREATE ROLE 'cajero';
-- consultar pedido a cobrar y generar pedido de reseva
GRANT SELECT ON rcep.pedido TO 'cajero';
-- registrar venta y consultar venta para boleta o factura
GRANT SELECT, INSERT ON rcep.venta TO 'cajero';
-- generar factura
GRANT INSERT ON rcep.factura TO 'cajero';
-- generar boleta
GRANT INSERT ON rcep.boleta TO 'cajero';
-- registrar y consultar cliente para asociarlo a venta
GRANT SELECT, INSERT ON rcep.cliente TO 'cajero';
-- ver reservas para realizar el cobro
GRANT SELECT ON rcep.reserva TO 'cajero';

CREATE ROLE 'cocina';
-- consultar pedidos
GRANT SELECT ON rcep.pedido TO 'cocina';
-- acceder a la asociacion de productos y pedidos
GRANT SELECT ON rcep.producto_pedido TO 'cocina';
-- poder consultar los productos
GRANT SELECT ON rcep.producto TO 'cocina';