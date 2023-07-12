DROP DATABASE products;
CREATE DATABASE products;

USE products;

CREATE TABLE products
(
	id INT NOT NULL,
	name TEXT,
	slogan TEXT,
	description TEXT,
	category TEXT,
	default_price TEXT,
 feature_id INT,
	created_at DATE,
	updated_at DATE,
	PRIMARY KEY (id)
 	FOREIGN KEY (feature_id)
	 	REFERENCES features(id)
);

	CREATE TABLE styles
(
	id INT NOT NULL,
	default1 BOOLEAN,
	name TEXT,
	original_price TEXT,
	photo_id INT,
	sale_price TEXT,
	skus_id INT,
	FOREIGN KEY (photo_id)
	 REFERENCES photos(id),
	FOREIGN KEY (skus_id)
		REFERENCES skus(id),
	PRIMARY KEY (id)
);

CREATE TABLE photos
(
	id INT NOT NULL,
	thumbnail_url TEXT,
	url TEXT,
	style_id INT,
	FOREIGN KEY (style_id)
		REFERENCES styles(id),
	PRIMARY KEY (id)
);

CREATE TABLE features
(
	id INT NOT NULL,
	feature TEXT,
	value TEXT,
	product_id INT,
	FOREIGN KEY (product_id)
		REFERENCES products(id),
	PRIMARY KEY (id)
);

CREATE TABLE skus
(
	id INT NOT NULL,
	quantity INT,
	size INT,
	style_id INT,
	FOREIGN KEY (style_id)
		REFERENCES styles(id),
	PRIMARY KEY (id)
);