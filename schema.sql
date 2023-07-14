
CREATE TABLE products
(
	id INT NOT NULL,
	name TEXT,
	slogan TEXT,
	description TEXT,
	category TEXT,
	default_price TEXT,
	created_at DATE DEFAULT CURRENT_TIMESTAMP,
	updated_at DATE DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
);

	CREATE TABLE styles
(
	id INT NOT NULL,
	default_style BOOLEAN,
	name TEXT,
	original_price TEXT,
	sale_price TEXT,
	product_id INT,
	FOREIGN KEY (product_id)
		REFERENCES products(id),
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

CREATE TABLE related (
	id INT,
	current_product_id INT,
	related_product_id INT,
	PRIMARY KEY (id)
);