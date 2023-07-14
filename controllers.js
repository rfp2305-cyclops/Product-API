const db = require("./connection.js");

module.exports = {
  products: async (req, res) => {
    const qrystr = `SELECT * FROM products WHERE product_id = 1`;
    try {
      const client = await db.pool.connect();
      const products = await client.query(qrystr);
      client.release();
      res.status(200).send(products);
    } catch (err) {
      console.log(err);
    }
  },

  // product: (req, res) => {

  // },

  // styles: (req, res) => {

  // },

  // related: (req, res) => {

  // },


};