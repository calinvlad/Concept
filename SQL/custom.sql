DROP DATABASE IF EXISTS custom;
CREATE DATABASE custom;

DROP TABLE IF EXISTS custom.Images;
DROP TABLE IF EXISTS custom.Orders;
DROP TABLE IF EXISTS custom.Details;
DROP TABLE IF EXISTS custom.Specs;
DROP TABLE IF EXISTS custom.Address;
DROP TABLE IF EXISTS custom.Products;
DROP TABLE IF EXISTS custom.Users;


CREATE TABLE custom.Users (
  user_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(60) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE,
  pass  VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE custom.Addresses (
  address_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  address1 TEXT,
  address2 TEXT,
  city VARCHAR(60) NOT NULL,
  user_id INT UNIQUE NOT NULL,
  FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE custom.Products (
  product_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price VARCHAR(20) NOT NULL,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
) Engine=InnoDB;

CREATE TABLE custom.Images (
    image_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
        ON DELETE CASCADE
) Engine=InnoDB

CREATE TABLE custom.Details (
  detail_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Specs (
  spec_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Orders (
    order_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    products TEXT NOT NULL,
    user_id INT NOT NULL,
    total VARCHAR(255),
    address TEXT,
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
) Engine=InnoDB;
