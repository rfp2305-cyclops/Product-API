const { Pool } = require("pg");
require("dotenv").config();

const pool = new Pool({
  user: process.env.USER,
  host: process.env.HOST,
  database: process.env.DB,
  password: process.env.PASSWORD,
  port: process.env.PROD_PORT,
});

const connectDB = async () => {
  await pool.connect();
};

module.exports.pool = pool;
module.exports.connect = connectDB;
