DROP IF NOT EXISTS DATABASE custom;
CREATE DATABASE IF NOT EXISTS custom;

DROP TABLE details;
DROP TABLE specs;
DROP TABLE address;
DROP TABLE products;
DROP TABLE users;


CREATE TABLE Users (
  user_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(60) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  phone VARCHAR(20) UNIQUE,
  pass  VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Address (
  address_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  address1 TEXT,
  address2 TEXT,
  city VARCHAR(60) NOT NULL,
  street TEXT,
  building VARCHAR(60) NOT NULL,
  user_id INT UNIQUE NOT NULL,
  FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Products (
  product_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price VARCHAR(20) NOT NULL,
  images TEXT,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id)
    REFERENCES Users(user_id)
) Engine=InnoDB;

CREATE TABLE Details (
  detail_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE Specs (
  spec_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE Orders (
    order_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    products TEXT NOT NULL,
    user_id INT NOT NULL,
    total VARCHAR(255),
    address TEXT,
    FOREIGN KEY (user_id)
        REFERENCES Users(user_id)
) Engine=InnoDB;
