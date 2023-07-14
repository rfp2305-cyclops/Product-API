// const controller = require("./controllers.js");
const router = require("express").Router();
const db = require("./connection.js");

router.get("/", async (req, res) => {
  const qrystr = `SELECT * FROM products WHERE id = 1`;
  try {
    const client = await db.pool.connect();
    const products = await client.query(qrystr);
    client.release();
    res.status(200).send(products);
  } catch (err) {
    console.log(err);
  }
});

// router.get("/:product_id", controller.product);

// router.get("/:product_id/styles", controller.styles);

// router.get("/:product_id/related", controller.related);

module.exports = router;
