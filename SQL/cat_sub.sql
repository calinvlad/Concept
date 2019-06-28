DROP TABLE IF EXISTS custom.Category;
DROP TABLE IF EXISTS custom.Subcategory;

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