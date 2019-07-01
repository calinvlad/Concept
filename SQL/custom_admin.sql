DROP DATABASE IF EXISTS custom;
CREATE DATABASE custom;

DROP TABLE IF EXISTS custom.Category;
DROP TABLE IF EXISTS custom.Subcategory;
DROP TABLE IF EXISTS custom.View;
DROP TABLE IF EXISTS custom.Image;
DROP TABLE IF EXISTS custom.Order;
DROP TABLE IF EXISTS custom.Detail;
DROP TABLE IF EXISTS custom.Spec;
DROP TABLE IF EXISTS Cart;
DROP TABLE IF EXISTS custom.Address;
DROP TABLE IF EXISTS custom.Product;
DROP TABLE IF EXISTS custom.User;
DROP TABLE IF EXISTS custom.Admin;

CREATE TABLE custom.Admin (
    admin_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    fname VARCHAR(60) NOT NULL,
    lname VARCHAR(60) NOT NULL,
    email VARCHAR(60) NOT NULL UNIQUE,
    phone VARCHAR(20) UNIQUE,
    pass  VARCHAR(60) NOT NULL
) Engine=InnoDB;


CREATE TABLE custom.User (
  user_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(60) NOT NULL,
  lname VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL UNIQUE,
  phone VARCHAR(20) NOT NULL UNIQUE,
  pass  VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE custom.Address (
  address_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  address1 TEXT,
  address2 TEXT,
  city VARCHAR(60) NOT NULL,
  user_id INT UNIQUE NOT NULL,
  FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Cart (
    cart_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    products TEXT,
    user_id INT UNIQUE NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE custom.Product (
  product_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(60) NOT NULL,
  category VARCHAR(60) NOT NULL,
  price VARCHAR(20) NOT NULL,
  admin_id INT NOT NULL,
  created DATETIME NOT NULL,
  updated DATETIME NOT NULL,
  FOREIGN KEY (admin_id)
    REFERENCES Admin(admin_id)
) Engine=InnoDB;

CREATE TABLE custom.Image (
    image_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(255) NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Detail (
  detail_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Product(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Spec (
  spec_id INT(8) PRIMARY KEY AUTO_INCREMENT,
  text TEXT,
  product_id INT,
  FOREIGN KEY (product_id)
    REFERENCES Product(product_id)
    ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Order (
    order_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    products TEXT NOT NULL,
    user_id INT NOT NULL,
    total VARCHAR(255),
    address TEXT,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    FOREIGN KEY (user_id)
        REFERENCES User(user_id)
) Engine=InnoDB;

CREATE TABLE custom.Quantity (
    quantity_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL DEFAULT 0.00,
    created DATETIME NOT NULL,
    updated DATETIME NOT NULL,
    product_id INT(8) UNIQUE NOT NULL,
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.View (
    view_id INT(8) PRIMARY KEY AUTO_INCREMENT,
    ip VARCHAR(255) NOT NULL,
    view INT NOT NULL,
    created DATETIME NOT NULL,
    product_id INT,
    FOREIGN KEY (product_id)
        REFERENCES Product(product_id)
        ON DELETE CASCADE
) Engine=InnoDB;

CREATE TABLE custom.Category (
    category_id int(8) UNIQUE AUTO_INCREMENT,
    name varchar(150) PRIMARY KEY NOT NULL
) ENGINE=InnoDB;

CREATE TABLE custom.Subcategory (
    subcategory_id INT(8) UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category_name VARCHAR(150) NOT NULL,
    FOREIGN KEY (category_name)
        REFERENCES Category(name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=InnoDB;
