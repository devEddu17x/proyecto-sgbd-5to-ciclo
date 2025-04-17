const { faker } = require('@faker-js/faker');
const mysql = require('mysql2/promise');

(async () => {
  const connection = await mysql.createConnection({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASS,
    database: process.env.MYSQL_DB,
  });

  const valores = [];
  const cantidad = 1000;

  for (let i = 0; i < cantidad; i++) {
    const nombre = faker.person.firstName();
    const apellidoMaterno = faker.person.lastName();
    const apellidoPaterno = faker.person.lastName();
    const telefono = parseInt('9' + faker.string.numeric(8));
    valores.push([nombre, apellidoMaterno, apellidoPaterno, telefono]);
  }

  const sql = 'INSERT INTO cliente (nombre, apellido_paterno, apellido_materno, telefono) VALUES ?';

  await connection.query(sql, [valores]);
  await connection.end();

  console.log(`${cantidad} registros insertados.`);
})();
