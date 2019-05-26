DROP IF NOT EXISTS DATABASE custom;
CREATE DATABASE IF NOT EXISTS custom;

DROP TABLE details;
DROP TABLE specs;
DROP TABLE address;
DROP TABLE products;
DROP TABLE users;


CREATE TABLE users (
  user_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(60) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE,
  pass  VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE address (
  address_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  address1 TEXT,
  address2 TEXT,
  city VARCHAR(60) NOT NULL,
  street TEXT,
  building VARCHAR(60) NOT NULL,
  user_id INT UNIQUE,
  FOREIGN KEY (user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE products (
  product_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price INT NOT NULL,
  photo TEXT,
  user_id INT,
  FOREIGN KEY (user_id)
    REFERENCES users(user_id)
) Engine=InnoDB;

CREATE TABLE details (
  detail_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE specs (
  spec_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;