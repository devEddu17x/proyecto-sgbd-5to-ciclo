-- Asegúrate de estar usando la base de datos correcta
USE rcep;

-- #####################################################
-- ## PASO 1: Crear 10 Reservas (con Pedido y 2 Mesas) ##
-- #####################################################

-- Reserva 1 (Pedido 1, Mesas 1, 2)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW());
SET @pedido1_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido1_id, 1), (@pedido1_id, 2);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido1_id, 5, 1),  -- RONDA PIURANA (ID 5 OK)
    (@pedido1_id, 140, 2); -- Gaseosa 1 L (ID 122 OK, asumiendo corrección de conteo anterior, Gaseosa 1L es 122)
                          -- Ajustado de 140 (Gordita) a 122 (1L) para asegurar ID valido y coherente.
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 1 DAY, NOW() + INTERVAL 1 DAY + INTERVAL 2 HOUR, 10.00, 'CLI00001', @pedido1_id);

-- Reserva 2 (Pedido 2, Mesas 3, 4)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW());
SET @pedido2_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido2_id, 3), (@pedido2_id, 4);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido2_id, 21, 2), -- Ceviche Simple (ID 21 OK)
    (@pedido2_id, 35, 1), -- Chaufa de Mariscos (ID 35 OK)
    (@pedido2_id, 132, 1); -- Jarra Chicha Piurana 1 L (ID 132 OK) (Ajustado desde 146)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 2 DAY, NOW() + INTERVAL 2 DAY + INTERVAL 3 HOUR, 0.00, 'CLI00002', @pedido2_id);

-- Reserva 3 (Pedido 3, Mesas 5, 6)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW());
SET @pedido3_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido3_id, 5), (@pedido3_id, 6);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido3_id, 60, 1), -- Tríos Marinos (ID 60 OK)
    (@pedido3_id, 7, 1),  -- SECO DE CHABELO (ID 7 OK)
    (@pedido3_id, 126, 4); -- Cerveza Pilsen Trujillo (ID 126 OK) (Ajustado desde 141)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 1 DAY + INTERVAL 12 HOUR, NOW() + INTERVAL 1 DAY + INTERVAL 15 HOUR, 5.00, 'CLI00003', @pedido3_id);

-- Reserva 4 (Pedido 4, Mesas 7, 8)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW());
SET @pedido4_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido4_id, 7), (@pedido4_id, 8);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido4_id, 80, 1), -- Chupe de Cangrejos (ID 80 OK)
    (@pedido4_id, 41, 1), -- Chicharrón Simple (ID 41 OK)
    (@pedido4_id, 151, 1); -- Pisco Sour (ID 142 OK) (Ajustado desde 151 que era Anís)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 3 DAY, NOW() + INTERVAL 3 DAY + INTERVAL 2 HOUR, 0.00, 'CLI00004', @pedido4_id);

-- Reserva 5 (Pedido 5, Mesas 9, 10)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW());
SET @pedido5_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido5_id, 9), (@pedido5_id, 10);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido5_id, 50, 1), -- Chita Frita (ID 50 OK)
    (@pedido5_id, 93, 1), -- Arroz con Mariscos (ID 93 OK)
    (@pedido5_id, 120, 2), -- Gaseosa Personal (ID 120 OK) (Ajustado desde 138)
    (@pedido5_id, 143, 1); -- Vino Tinto Tabernero (ID 143 OK) (Ajustado desde 157)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 4 DAY, NOW() + INTERVAL 4 DAY + INTERVAL 4 HOUR, 15.00, 'CLI00005', @pedido5_id);

-- Reserva 6 (Pedido 6, Mesas 11, 12)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW());
SET @pedido6_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido6_id, 11), (@pedido6_id, 12);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido6_id, 67, 1), -- Lomo Saltado (ID 67 OK)
    (@pedido6_id, 68, 1), -- Pollo a la Plancha (ID 68 OK)
    (@pedido6_id, 122, 1); -- Gaseosa 1 L (ID 122 OK) (Ajustado desde 139)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 5 DAY, NOW() + INTERVAL 5 DAY + INTERVAL 2 HOUR, 0.00, 'CLI00006', @pedido6_id);

-- Reserva 7 (Pedido 7, Mesas 13, 14)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW());
SET @pedido7_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido7_id, 13), (@pedido7_id, 14);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido7_id, 103, 2), -- Parihuela Mixta (ID 103 OK) (Ajustado desde 113)
    (@pedido7_id, 71, 2);  -- Chifles (ID 71 OK)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 6 DAY, NOW() + INTERVAL 6 DAY + INTERVAL 2 HOUR, 0.00, 'CLI00007', @pedido7_id);

-- Reserva 8 (Pedido 8, Mesas 15, 16)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW());
SET @pedido8_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido8_id, 15), (@pedido8_id, 16);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido8_id, 154, 1), -- Sudado de Tollo (ID 154 OK) (Ajustado desde 167)
    (@pedido8_id, 73, 1),  -- Arroz blanco (ID 73 OK)
    (@pedido8_id, 127, 3); -- Cerveza Pilsen Callao (ID 127 OK) (Ajustado desde 142)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 7 DAY, NOW() + INTERVAL 7 DAY + INTERVAL 3 HOUR, 8.00, 'CLI00008', @pedido8_id);

-- Reserva 9 (Pedido 9, Mesas 17, 18)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW());
SET @pedido9_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido9_id, 17), (@pedido9_id, 18);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido9_id, 89, 1), -- Tortilla de Pescado (ID 89 OK)
    (@pedido9_id, 2, 1),  -- Chilcano Económico (ID 2 OK)
    (@pedido9_id, 152, 2); -- Café (ID 152 OK) (Ajustado desde 163)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 8 DAY, NOW() + INTERVAL 8 DAY + INTERVAL 1 HOUR, 0.00, 'CLI00009', @pedido9_id);

-- Reserva 10 (Pedido 10, Mesas 19, 20)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW());
SET @pedido10_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido10_id, 19), (@pedido10_id, 20);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido10_id, 117, 2), -- Anticucho Mixto (ID 117 OK) (Ajustado desde 129)
    (@pedido10_id, 139, 2); -- Mojito (ID 139 OK) (Ajustado desde 149)
INSERT INTO reserva (fecha_inicio, fecha_fin, precio_adicional, cliente_id, pedido_id) VALUES
    (NOW() + INTERVAL 9 DAY, NOW() + INTERVAL 9 DAY + INTERVAL 2 HOUR, 20.00, 'CLI00010', @pedido10_id);


-- ########################################################
-- ## PASO 2: Crear 20 Pedidos (con 1 Mesa cada uno)     ##
-- ##         Mesas 21 a 40                              ##
-- ########################################################

-- Pedidos 11-30 (Mesas 21-40) - IDs de producto revisados y ajustados <= 155
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW()); SET @pedido11_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido11_id, 21);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido11_id, 22, 1), (@pedido11_id, 120, 1); -- Ceviche Mixto(22), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW()); SET @pedido12_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido12_id, 22);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido12_id, 41, 1), (@pedido12_id, 120, 1); -- Chicharrón Simple(41), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW()); SET @pedido13_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido13_id, 23);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido13_id, 93, 1), (@pedido13_id, 126, 1); -- Arroz con Mariscos(93), Cerveza Pilsen Trujillo(126)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW()); SET @pedido14_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido14_id, 24);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido14_id, 67, 1), (@pedido14_id, 120, 1); -- Lomo Saltado(67), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW()); SET @pedido15_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido15_id, 25);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido15_id, 79, 1), (@pedido15_id, 132, 1); -- Chupe de Pescado(79), Jarra Chicha Piurana 1 L(132)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW()); SET @pedido16_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido16_id, 26);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido16_id, 1, 1), (@pedido16_id, 152, 1); -- Pescado Frito + Café + Yuca(1), Café(152)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW()); SET @pedido17_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido17_id, 27);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido17_id, 31, 1), (@pedido17_id, 119, 1); -- Ceviche de Caballa(31), Agua Personal(119)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW()); SET @pedido18_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido18_id, 28);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido18_id, 40, 1), (@pedido18_id, 120, 1); -- Chaufa de Pollo(40), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW()); SET @pedido19_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido19_id, 29);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido19_id, 56, 1), (@pedido19_id, 127, 2); -- Escabeche de Pescado(56), Cerveza Pilsen Callao(127)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW()); SET @pedido20_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido20_id, 30);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido20_id, 70, 1), (@pedido20_id, 120, 1); -- Cabrito(70), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW()); SET @pedido21_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido21_id, 31);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido21_id, 100, 1), (@pedido21_id, 126, 1); -- Chilcano de Cabrilla(100), Cerveza Pilsen Trujillo(126)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW()); SET @pedido22_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido22_id, 32);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido22_id, 103, 1), (@pedido22_id, 71, 1); -- Parihuela Mixta(103), Chifles(71)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW()); SET @pedido23_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido23_id, 33);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido23_id, 154, 1), (@pedido23_id, 73, 1); -- Sudado de Tollo(154), Arroz blanco(73)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW()); SET @pedido24_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido24_id, 34);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido24_id, 113, 1), (@pedido24_id, 142, 1); -- Tamalitos Verdes(113), Pisco Sour(142)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW()); SET @pedido25_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido25_id, 35);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido25_id, 34, 1), (@pedido25_id, 131, 1); -- Leche de Tigre(34), Jarra Frozen 500 ml(131)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW()); SET @pedido26_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido26_id, 36);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido26_id, 42, 1), (@pedido26_id, 120, 1); -- Chicharrón Mixto(42), Gaseosa Personal(120)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW()); SET @pedido27_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido27_id, 37);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido27_id, 60, 1), (@pedido27_id, 119, 2); -- Tríos Marinos(60), Agua Personal(119)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW()); SET @pedido28_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido28_id, 38);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido28_id, 69, 1), (@pedido28_id, 126, 1); -- Pato Guisado(69), Cerveza Pilsen Trujillo(126)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW()); SET @pedido29_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido29_id, 39);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido29_id, 84, 1), (@pedido29_id, 152, 1); -- Chupe de Corvina(84), Café(152)

INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW()); SET @pedido30_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido30_id, 40);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES (@pedido30_id, 109, 1), (@pedido30_id, 139, 1); -- Sopa de Novios con Gallina(109), Mojito(139)


-- ########################################################
-- ## PASO 3: Crear 5 Pedidos (con 2 Mesas cada uno)     ##
-- ##         Mesas 41 a 50                              ##
-- ########################################################

-- Pedido 31 (Mesas 41, 42)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW());
SET @pedido31_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido31_id, 41), (@pedido31_id, 42);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido31_id, 6, 1),  -- ESPECIAL "PIURANO"(6)
    (@pedido31_id, 132, 1), -- Jarra Chicha Piurana 1 L(132)
    (@pedido31_id, 71, 2);  -- Chifles(71)

-- Pedido 32 (Mesas 43, 44)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0004', NOW());
SET @pedido32_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido32_id, 43), (@pedido32_id, 44);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido32_id, 5, 1),  -- RONDA PIURANA(5)
    (@pedido32_id, 131, 2), -- Jarra Frozen 500 ml(131)
    (@pedido32_id, 126, 4); -- Cerveza Pilsen Trujillo(126)

-- Pedido 33 (Mesas 45, 46)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0001', NOW());
SET @pedido33_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido33_id, 45), (@pedido33_id, 46);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido33_id, 57, 2), -- Pescado a lo Macho(57)
    (@pedido33_id, 143, 1), -- Vino Tinto Tabernero(143)
    (@pedido33_id, 119, 2); -- Agua Personal(119)

-- Pedido 34 (Mesas 47, 48)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0002', NOW());
SET @pedido34_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido34_id, 47), (@pedido34_id, 48);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido34_id, 76, 1), -- Fuente Ceviches(76)
    (@pedido34_id, 77, 1), -- Fuente Chicharrones(77)
    (@pedido34_id, 121, 2); -- Gaseosa Gordita(121)

-- Pedido 35 (Mesas 49, 50)
INSERT INTO pedido (mozo_id, fecha) VALUES ('MOZO0003', NOW());
SET @pedido35_id = LAST_INSERT_ID();
INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (@pedido35_id, 49), (@pedido35_id, 50);
INSERT INTO producto_pedido (pedido_id, producto_id, cantidad) VALUES
    (@pedido35_id, 13, 1), -- CANGREJO REVENTADO(13)
    (@pedido35_id, 26, 1), -- Ceviche Corvina(26)
    (@pedido35_id, 127, 3); -- Cerveza Pilsen Callao(127)


-- ########################################################
-- ## PASO 4: Crear Ventas (Boletas y Facturas)          ##
-- ## Nota: Los totales son ejemplos y deben calcularse  ##
-- ## correctamente para que el trigger funcione bien.   ##
-- ########################################################

-- 20 Ventas con Boleta (10 con cliente, 10 sin cliente)

-- Pedidos 1-10 con Boleta y Cliente (Totales ejemplo)
SET @venta1_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta1_id, 96.00, 'CLI00001', 1); INSERT INTO boleta (venta_id, dni) VALUES (@venta1_id, '12345671');
SET @venta2_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta2_id, 98.00, 'CLI00002', 2); INSERT INTO boleta (venta_id, dni) VALUES (@venta2_id, '12345672');
SET @venta3_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta3_id, 78.00, 'CLI00003', 3); INSERT INTO boleta (venta_id, dni) VALUES (@venta3_id, '12345673');
SET @venta4_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta4_id, 86.00, 'CLI00004', 4); INSERT INTO boleta (venta_id, dni) VALUES (@venta4_id, '12345674');
SET @venta5_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta5_id, 114.00, 'CLI00005', 5); INSERT INTO boleta (venta_id, dni) VALUES (@venta5_id, '12345675');
SET @venta6_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta6_id, 63.00, 'CLI00006', 6); INSERT INTO boleta (venta_id, dni) VALUES (@venta6_id, '12345676');
SET @venta7_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta7_id, 86.00, 'CLI00007', 7); INSERT INTO boleta (venta_id, dni) VALUES (@venta7_id, '12345677');
SET @venta8_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta8_id, 70.00, 'CLI00008', 8); INSERT INTO boleta (venta_id, dni) VALUES (@venta8_id, '12345678');
SET @venta9_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta9_id, 41.00, 'CLI00009', 9); INSERT INTO boleta (venta_id, dni) VALUES (@venta9_id, '12345679');
SET @venta10_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta10_id, 64.00, 'CLI00010', 10); INSERT INTO boleta (venta_id, dni) VALUES (@venta10_id, '12345670');

-- Pedidos 11-20 con Boleta sin Cliente (Totales ejemplo)
SET @venta11_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta11_id, 35.00, NULL, 11); INSERT INTO boleta (venta_id, dni) VALUES (@venta11_id, '23456781');
SET @venta12_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta12_id, 33.00, NULL, 12); INSERT INTO boleta (venta_id, dni) VALUES (@venta12_id, '23456782');
SET @venta13_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta13_id, 37.00, NULL, 13); INSERT INTO boleta (venta_id, dni) VALUES (@venta13_id, '23456783');
SET @venta14_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta14_id, 33.00, NULL, 14); INSERT INTO boleta (venta_id, dni) VALUES (@venta14_id, '23456784');
SET @venta15_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta15_id, 31.00, NULL, 15); INSERT INTO boleta (venta_id, dni) VALUES (@venta15_id, '23456785');
SET @venta16_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta16_id, 20.00, NULL, 16); INSERT INTO boleta (venta_id, dni) VALUES (@venta16_id, '23456786');
SET @venta17_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta17_id, 28.00, NULL, 17); INSERT INTO boleta (venta_id, dni) VALUES (@venta17_id, '23456787');
SET @venta18_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta18_id, 31.00, NULL, 18); INSERT INTO boleta (venta_id, dni) VALUES (@venta18_id, '23456788');
SET @venta19_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta19_id, 45.00, NULL, 19); INSERT INTO boleta (venta_id, dni) VALUES (@venta19_id, '23456789');
SET @venta20_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta20_id, 33.00, NULL, 20); INSERT INTO boleta (venta_id, dni) VALUES (@venta20_id, '23456780');

-- 10 Ventas con Factura (5 con cliente, 5 sin cliente en Venta)

-- Pedidos 21-25 con Factura y Cliente en Venta (Totales ejemplo)
SET @venta21_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta21_id, 37.00, 'CLI00011', 21); INSERT INTO factura (venta_id, ruc) VALUES (@venta21_id, '10123456781');
SET @venta22_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta22_id, 42.00, 'CLI00012', 22); INSERT INTO factura (venta_id, ruc) VALUES (@venta22_id, '10123456782');
SET @venta23_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta23_id, 35.00, 'CLI00013', 23); INSERT INTO factura (venta_id, ruc) VALUES (@venta23_id, '10123456783');
SET @venta24_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta24_id, 21.00, 'CLI00014', 24); INSERT INTO factura (venta_id, ruc) VALUES (@venta24_id, '10123456784');
SET @venta25_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta25_id, 24.00, 'CLI00015', 25); INSERT INTO factura (venta_id, ruc) VALUES (@venta25_id, '10123456785');

-- Pedidos 26-30 con Factura sin Cliente en Venta (Totales ejemplo)
SET @venta26_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta26_id, 35.00, NULL, 26); INSERT INTO factura (venta_id, ruc) VALUES (@venta26_id, '20123456781');
SET @venta27_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta27_id, 36.00, NULL, 27); INSERT INTO factura (venta_id, ruc) VALUES (@venta27_id, '20123456782');
SET @venta28_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta28_id, 39.00, NULL, 28); INSERT INTO factura (venta_id, ruc) VALUES (@venta28_id, '20123456783');
SET @venta29_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta29_id, 45.00, NULL, 29); INSERT INTO factura (venta_id, ruc) VALUES (@venta29_id, '20123456784');
SET @venta30_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta30_id, 30.00, NULL, 30); INSERT INTO factura (venta_id, ruc) VALUES (@venta30_id, '20123456785');

-- 5 Ventas sin Boleta ni Factura (2 con cliente, 3 sin cliente)

-- Pedidos 31-32 con Venta y Cliente (Totales ejemplo)
SET @venta31_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta31_id, 86.00, 'CLI00001', 31); -- Cliente repetido, posible
SET @venta32_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta32_id, 134.00, 'CLI00002', 32); -- Cliente repetido, posible

-- Pedidos 33-35 con Venta sin Cliente (Totales ejemplo)
SET @venta33_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta33_id, 155.00, NULL, 33);
SET @venta34_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta34_id, 202.00, NULL, 34);
SET @venta35_id = LEFT(UUID(),8); INSERT INTO venta (id, total, cliente_id, pedido_id) VALUES (@venta35_id, 97.00, NULL, 35);

-- Fin del script