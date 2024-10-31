-- DROP DATABASE
DROP DATABASE IF EXISTS ecommerce_db;

-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

-- Use the newly created database
\c ecommerce_db;

-- Create table for categories
CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

-- Create table for products
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  product_name VARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
  stock INT NOT NULL DEFAULT 10,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Create table for tags
CREATE TABLE tags (
  id SERIAL PRIMARY KEY,
  tag_name VARCHAR(100)
);

-- Create junction table for many-to-many relationship between products and tags
CREATE TABLE product_tag (
  id SERIAL PRIMARY KEY,
  product_id INT,
  tag_id INT,
  FOREIGN KEY (product_id) REFERENCES products(id),
  FOREIGN KEY (tag_id) REFERENCES tags(id)
);