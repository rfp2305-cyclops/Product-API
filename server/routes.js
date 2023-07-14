const controller = require("./controllers.js");
const router = require("express").Router();
//const db = require("./connection.js");

router.get("/", controller.products);

router.get("/:product_id", controller.product);

router.get("/:product_id/styles", controller.styles);

router.get("/:product_id/related", controller.related);

module.exports = router;
