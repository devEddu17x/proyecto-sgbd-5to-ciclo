-- admin
GRANT 'admin' TO 'rcep_admin'@'192.168.1.%';
SET DEFAULT ROLE 'admin' TO 'rcep_admin'@'192.168.1.%';
-- cajero
GRANT 'cajero' TO 'rcep_cajero'@'192.168.1.%';
SET DEFAULT ROLE 'cajero' TO 'rcep_cajero'@'192.168.1.%';
-- cocina
GRANT 'cocina' TO 'rcep_cocina'@'192.168.1.%';
SET DEFAULT ROLE 'cocina' TO 'rcep_cocina'@'192.168.1.%';
-- mozos
GRANT 'mozo' TO 'rcep_mozo1'@'192.168.1.%';
SET DEFAULT ROLE 'mozo' TO 'rcep_mozo1'@'192.168.1.%';
GRANT 'mozo' TO 'rcep_mozo2'@'192.168.1.%';
SET DEFAULT ROLE 'mozo' TO 'rcep_mozo2'@'192.168.1.%';
GRANT 'mozo' TO 'rcep_mozo3'@'192.168.1.%';
SET DEFAULT ROLE 'mozo' TO 'rcep_mozo3'@'192.168.1.%';
GRANT 'mozo' TO 'rcep_mozo4'@'192.168.1.%';
SET DEFAULT ROLE 'mozo' TO 'rcep_mozo4'@'192.168.1.%';