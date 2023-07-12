CREATE DATABASE products;

USE products;

CREATE TABLE product
(
	id: number,
	name: TEXT,
	slogan: TEXT,
	description: TEXT,
	category: TEXT,
	default_price: TEXT,
	features_id: INT FOREIGN KEY,
	created_at: DATE,
	updated_at: DATE
);

	CREATE TABLE styles
(
	default: boolean,
	name: TEXT,
	original_price: TEXT,
	photos_id: INT FOREIGN KEY,
	sale_price: TEXT,
	skus_id: INT FOREIGN KEY,
	style_id: INT,
);

CREATE TABLE photos
(
	photo_id: INT UNIQUE,
	thumbnail_url: TEXT,
	url: TEXT,
	style_id: INT FOREIGN KEY
);

CREATE TABLE features
(
	feature: TEXT,
	value: TEXT,
	product_id: INT FOREIGN KEY,
	feature_id: INT UNIQUE
);

CREATE TABLE skus
(
	sku: INT UNIQUE,
	quantity: INT,
	size: INT,
	style_id: INT FOREIGN KEY
);