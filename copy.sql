COPY products(id, name, slogan, description, category, default_price)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/product.csv'
DELIMITER ','
CSV HEADER;

COPY styles(id, product_id, name, sale_price, original_price, default_style)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/styles.csv'
DELIMITER ','
CSV HEADER;

COPY skus(id, style_id, size, quantity)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/skus.csv'
DELIMITER ','
CSV HEADER;

COPY photos(id, style_id, url, thumbnail_url)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/photos.csv'
DELIMITER ','
CSV HEADER;

COPY features(id, product_id, feature, value)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/features.csv'
DELIMITER ','
CSV HEADER;

COPY related(id, current_product_id, related_product_id)
FROM '/Users/hollystefan/Desktop/Hackreactor/Course/SDC/Product-API/seedData/related.csv'
DELIMITER ','
CSV HEADER;