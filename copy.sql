COPY products(id, name, slogan, description, category, default_price)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/product.csv'
DELIMITER ','
CSV HEADER;

ANALYZE products;

COPY styles(id, product_id, name, sale_price, original_price, default_style)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/styles.csv'
DELIMITER ','
CSV HEADER;

ANALYZE styles;

CREATE INDEX indx_styles_product_id ON styles(produt_id);

COPY skus(id, style_id, size, quantity)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/skus.csv'
DELIMITER ','
CSV HEADER;

ANALYZE skus;

CREATE INDEX indx_skus_style_id ON skus(style_id);

COPY photos(id, style_id, url, thumbnail_url)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/photos.csv'
DELIMITER ','
CSV HEADER;

ANALYZE photos;

CREATE INDEX indx_photos_style_id ON photos(style_id);

COPY features(id, product_id, feature, value)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/features.csv'
DELIMITER ','
CSV HEADER;

ANALYZE features;

CREATE INDEX indx_features_product_id ON features(product_id);

COPY related(id, current_product_id, related_product_id)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/related.csv'
DELIMITER ','
CSV HEADER;

ANALYZE related;

CREATE INDEX indx_related_current_product_id ON related(current_product_id);