const express = require("express");
// const morgan = require("morgan");
const app = express();
const router = require("./server/routes.js");

app.use(express.json());
// app.use(morgan("dev"));

const PORT = 3000 || process.env.PORT;

app.get("/healthcheck", (req, res) => {
  res.send("you are connected");
});

app.use("/products", router);

app.listen(PORT, () => {
  console.log(`Server listening on port: ${PORT}`);
});
