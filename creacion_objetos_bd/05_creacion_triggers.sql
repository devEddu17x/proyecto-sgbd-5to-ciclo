-- Actualizar el estado de la mesa ascociada a un pedido a 'OCUPADA'
DELIMITER //
CREATE TRIGGER trg_actualizar_estado_mesa_ocupada
AFTER INSERT ON pedido_mesa
FOR EACH ROW
BEGIN
    UPDATE mesa
    SET estado = 'OCUPADA'
    WHERE id = NEW.mesa_id;
END //
DELIMITER ;


    
DELIMITER //

CREATE TRIGGER trg_actualizar_estado_pedido_completado
AFTER INSERT ON venta 
FOR EACH ROW 
BEGIN
    DECLARE v_pedido_id INT;
    DECLARE v_total_pedido DECIMAL(10, 2);
    DECLARE v_total_pagado DECIMAL(10, 2);

    SET v_pedido_id = NEW.pedido_id;

    SELECT SUM(p.precio * pp.cantidad) INTO v_total_pedido
    FROM producto_pedido pp
    JOIN producto p ON pp.producto_id = p.id
    WHERE pp.pedido_id = v_pedido_id;

    SELECT SUM(total) INTO v_total_pagado
    FROM venta
    WHERE pedido_id = v_pedido_id;

    IF v_total_pagado >= v_total_pedido THEN
        UPDATE mesa
        SET estado = 'LIBRE'
        WHERE id IN (SELECT mesa_id FROM pedido_mesa WHERE pedido_id = v_pedido_id);

        UPDATE pedido
        SET estado = 'COMPLETADO'
        WHERE id = v_pedido_id;
    END IF;

END //

DELIMITER ;
