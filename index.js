const express = require("express");
// const morgan = require("morgan");
const app = express();
const router = require("./routes.js");

app.use(express.json());
// app.use(morgan("dev"));

const PORT = 3000 || process.env.PORT;

app.get("/healthcheck", (req, res) => {
  res.send("you are connected");
});

app.use("/products", router);
//returns all products qrystr "SELECT * FROM products"

// app.use("/products/:product_id");
// //returns specific product qrystr "SELECT * FROM products WHERE product_id=req.product_id" "SELECT * FROM features WHERE product_id = product_id"

// app.use("/products/:product_id/styles");
// //return all styles for a product qrystr "SELECT * FROM styles WHERE product_id=req.product_id" "SELECT * FROM photos WHERE style_id=style_id" "SELECT * FROM skus WHERE style_id=style_id"

// app.use("/products/:product_id/related");
// // return all produtc and styles qrystr "SELECT * FROM related WHERE current_product_id = req.product_id"

app.listen(PORT, () => {
  console.log(`Server listening on port: ${PORT}`);
});
