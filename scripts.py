# script_generar_datos_corregido.py

import mysql.connector
from faker import Faker
import random
from datetime import datetime, timedelta

# Configuración de la conexión (ajusta según tu entorno)
DB_CONFIG = {
    'user': 'root',
    'password': 'dev',
    'host': '127.0.0.1',
    'database': 'sgbd',
    'raise_on_warnings': True
}

# Cantidades a generar
NUM_CLIENTES = 50000
NUM_MOZOS = 100
NUM_FAMILIAS = 20
NUM_PRODUCTOS = 200
NUM_MESAS = 50
NUM_PEDIDOS = 50000

faker = Faker()

def batch_insert(cursor, sql, data, batch_size=1000):
    for i in range(0, len(data), batch_size):
        cursor.executemany(sql, data[i:i+batch_size])

def main():
    conn = mysql.connector.connect(**DB_CONFIG)
    cursor = conn.cursor()

    # Limpiar tablas para evitar duplicados si se ejecuta varias veces
    cursor.execute("SET FOREIGN_KEY_CHECKS = 0;")
    for tbl in ['producto_pedido', 'pedido_mesa', 'venta', 'reserva',
                'pedido', 'mesa', 'cliente', 'mozo', 'producto', 'familia']: 
        cursor.execute(f"TRUNCATE TABLE {tbl};")
    cursor.execute("SET FOREIGN_KEY_CHECKS = 1;")
    conn.commit()

    # 1. Generar familias
    familias = [(faker.unique.word(),) for _ in range(NUM_FAMILIAS)]
    sql_fam = "INSERT INTO familia (nombre) VALUES (%s)"
    batch_insert(cursor, sql_fam, familias)
    conn.commit()

    cursor.execute("SELECT id FROM familia")
    familia_ids = [row[0] for row in cursor.fetchall()]

    # 2. Generar productos
    productos = []
    for _ in range(NUM_PRODUCTOS):
        nombre = faker.unique.word().capitalize()
        familia_id = random.choice(familia_ids)
        descripcion = faker.sentence(nb_words=6)
        precio = round(random.uniform(1, 100), 2)
        productos.append((nombre, familia_id, descripcion, precio))
    sql_prod = """
        INSERT INTO producto (nombre, familia_id, descripcion, precio)
        VALUES (%s, %s, %s, %s)
    """
    batch_insert(cursor, sql_prod, productos)
    conn.commit()

    cursor.execute("SELECT id FROM producto")
    producto_ids = [row[0] for row in cursor.fetchall()]

    # 3. Generar mozos
    mozos = [(faker.first_name(), faker.last_name(), faker.last_name()) for _ in range(NUM_MOZOS)]
    sql_mozo = """
        INSERT INTO mozo (nombre, apellido_paterno, apellido_materno)
        VALUES (%s, %s, %s)
    """
    batch_insert(cursor, sql_mozo, mozos)
    conn.commit()

    cursor.execute("SELECT id FROM mozo")
    mozo_ids = [row[0] for row in cursor.fetchall()]

    # 4. Generar clientes
    clientes = [(faker.first_name(), faker.last_name(), faker.last_name(),
                 str(faker.random_number(digits=9, fix_len=True)).zfill(9))
                for _ in range(NUM_CLIENTES)]
    sql_cliente = """
        INSERT INTO cliente (nombre, apellido_paterno, apellido_materno, telefono)
        VALUES (%s, %s, %s, %s)
    """
    batch_insert(cursor, sql_cliente, clientes)
    conn.commit()

    cursor.execute("SELECT id FROM cliente")
    cliente_ids = [row[0] for row in cursor.fetchall()]

    # 5. Generar mesas
    estados = ['LIBRE', 'RESERVADA', 'OCUPADA', 'INACTIVA']
    mesas = [(random.choice(estados),) for _ in range(NUM_MESAS)]
    sql_mesa = "INSERT INTO mesa (estado) VALUES (%s)"
    batch_insert(cursor, sql_mesa, mesas)
    conn.commit()

    cursor.execute("SELECT id FROM mesa")
    mesa_ids = [row[0] for row in cursor.fetchall()]

    # 6. Generar pedidos
    pedidos = []
    now = datetime.now()
    for _ in range(NUM_PEDIDOS):
        fecha = now - timedelta(days=random.randint(0, 365), seconds=random.randint(0, 86400))
        pedidos.append(('PENDIENTE', fecha, random.choice(mozo_ids)))
    sql_ped = "INSERT INTO pedido (estado, fecha, mozo_id) VALUES (%s, %s, %s)"
    batch_insert(cursor, sql_ped, pedidos)
    conn.commit()

    cursor.execute("SELECT id FROM pedido")
    pedido_ids = [row[0] for row in cursor.fetchall()]

    # 7. Asociar pedidos a mesas
    ped_mesa = [(pid, random.choice(mesa_ids)) for pid in pedido_ids]
    sql_ped_mesa = "INSERT INTO pedido_mesa (pedido_id, mesa_id) VALUES (%s, %s)"
    batch_insert(cursor, sql_ped_mesa, ped_mesa)
    conn.commit()

    # 8. Generar producto_pedido sin duplicar (pedido_id, producto_id)
    prod_ped = []
    for pid in pedido_ids:
        # Elegir n productos únicos para cada pedido
        selected = random.sample(producto_ids, k=random.randint(1, 5))
        for prod_id in selected:
            prod_ped.append((pid, prod_id, random.randint(1, 5)))
    sql_prod_ped = """
        INSERT INTO producto_pedido (pedido_id, producto_id, cantidad)
        VALUES (%s, %s, %s)
    """
    batch_insert(cursor, sql_prod_ped, prod_ped)
    conn.commit()

    print("Datos generados correctamente, sin duplicados en producto_pedido.")
    cursor.close()
    conn.close()

if __name__ == "__main__":
    main()