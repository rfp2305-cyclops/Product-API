const db = require("./connection.js");

module.exports = {
  products: async (req, res) => {
    const qrystr = `SELECT * FROM products`;
    try {
      const client = await db.pool.connect();
      const products = await client.query(qrystr);
      client.release();
      res.status(200).send(products);
    } catch (err) {
      console.log(err);
    }
  },

  product: async (req, res) => {
    const productId = req.params.product_id;
    const qrystr = `SELECT jsonb_build_object('id', id, 'name', name, 'slogan', slogan, 'description', description, 'category', category, 'default_price', default_price,
      'features', (SELECT jsonb_agg(jsonb_build_object('feature', feature, 'value', value))
      FROM features WHERE product_id=$1))
    FROM productS WHERE id=$1`;
    try {
      const client = await db.pool.connect();
      const product = await client.query(qrystr, [productId]);
      client.release();
      res.status(200).send(product);
    } catch (err) {
      console.log(err);
    }
  },

  styles: async (req, res) => {
    const productId = req.params.product_id;
    const qrystr = `SELECT jsonb_agg(jsonb_build_object('style_id', id, 'name', name, 'original_price', original_price, 'sale_price', sale_price, 'default?', default_style,
      'photos', (SELECT jsonb_agg(jsonb_build_object('thumbnail_url', thumbnail_url, 'url', url))
      FROM photos WHERE photos.style_id=styles.id),
      'skus', (SELECT jsonb_object_agg(id, jsonb_build_object('quantity', quantity, 'size', size))
      FROM skus WHERE skus.style_id=styles.id)))
    FROM styles WHERE product_id=${productId}`;
    try {
      const client = await db.pool.connect();
      const product = await client.query(qrystr);
      client.release();
      res.status(200).send(product);
    } catch (err) {
      console.log(err);
    }
  },

  related: async (req, res) => {
    const productId = req.params.product_id;
    const qrystr = `SELECT jsonb_agg((related_product_id)) FROM related WHERE current_product_id=${productId}`;
    try {
      const client = await db.pool.connect();
      const product = await client.query(qrystr);
      client.release();
      res.status(200).send(product);
    } catch (err) {
      console.log(err);
    }
  },
};
