USE E_commercedb;
-- creating table Brand
CREATE TABLE Brand(
brand_ID INT PRIMARY KEY AUTO_INCREMENT, 
brand_name VARCHAR (200)
);
-- creating table Product refencing Brand table
CREATE TABLE Product(
product_ID INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(200),
brand_ID INT,
FOREIGN KEY (brand_ID) REFERENCES Brand (brand_ID)
);
-- creating table Color referencing Product table
CREATE TABLE Color(
color_ID INT PRIMARY KEY AUTO_INCREMENT,
color_name VARCHAR(100),
product_ID INT,
FOREIGN KEY (product_ID) REFERENCES Product (product_ID)
);
-- creating table Size_option referencing Product table
CREATE TABLE Size_option(
size_option_ID INT PRIMARY KEY AUTO_INCREMENT,
size_option_name VARCHAR(100),
product_ID INT,
FOREIGN KEY (product_ID) REFERENCES Product (product_ID)
);
-- altering the auto increment value of Product table to 10
-- This is to ensure that the product_ID starts from 10 instead of 1
ALTER TABLE Product AUTO_INCREMENT = 10;

-- inserting values into the Brand table
INSERT INTO Brand(brand_name)
VALUES
('Apple'),
('Samsung'),
('Tecno'),
('Infinix'),
('Oppo');
-- inserting values into the Product table
INSERT INTO Product(brand_ID, product_name)
VALUES
(100, 'i_Phone 16'),
(102, 'S-24 Ultra'),
(103, 'Tecno Camon 40'),
(103, 'Infnix 40 Pro'),
(103, 'Oppo reno 13');
-- inserting values into the Color table
INSERT INTO Color (product_ID,color_name)
VALUES 
(10, 'Blue'),
(11, 'Grey'),
(12, 'Red_wine'),
(13, 'White'),
(14, 'Black');
-- inserting values into the Size_option table
INSERT INTO Size_option(product_ID, size_option_name)
VALUES
(10, 'S'),
(11, 'M'),
(12, 'L'),
(13, '42'),
(14, 'XL');

-- Faith's Section
-- creating table Product_item Referencing from Product_ID,Color_ID and Size_option_ID--
CREATE TABLE product_item (
    product_item_id INT AUTO_INCREMENT PRIMARY KEY, -- PK
    product_id INT NOT NULL,                        -- FK to product
    color_id INT NOT NULL,                          -- FK to color
    size_option_id INT NOT NULL,                    -- FK to size_option
    stock_quantity INT DEFAULT 0,
    price DECIMAL(10,2),

    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- product_variation
CREATE TABLE product_variation (
    variation_id INT AUTO_INCREMENT PRIMARY KEY,    -- PK
    product_id INT NOT NULL,                        -- FK to product
    color_id INT NOT NULL,                          -- FK to color
    size_option_id INT NOT NULL,                    -- FK to size_option

    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- size_category
CREATE TABLE size_category (
    size_category_id INT AUTO_INCREMENT PRIMARY KEY, -- PK
    category_name VARCHAR(100) NOT NULL
);

-- product_image
CREATE TABLE product_image (
    image_id INT AUTO_INCREMENT PRIMARY KEY,         -- PK
    product_id INT NOT NULL,                         -- FK to product
    image_url VARCHAR(255) NOT NULL,
    is_main BOOLEAN DEFAULT FALSE,                  

    FOREIGN KEY (product_id) REFERENCES product(product_id)
);


-- Creating table Product_category Referencing from Product_ID--
CREATE TABLE product_category (
  category_ID INT NOT NULL AUTO_INCREMENT,
  category_NAME VARCHAR(100),
  product_ID INT,
  PRIMARY KEY (category_ID),
  FOREIGN KEY (product_ID) REFERENCES product(product_ID)
);
-- Inserting value into Product_category--
INSERT INTO product_category(category_NAME, product_ID)
VALUES
  ('Smartphones', 10),
  ('Tablets', 11),
  ('Laptops', 12),
  ('Smartwatches', 13),
  ('Accessories', 14);

    -- Creating table Attribute_category--
  CREATE TABLE attribute_category (
  attribute_category_ID INT NOT NULL AUTO_INCREMENT,
  attribute_category_name VARCHAR(100),
  PRIMARY KEY (attribute_category_ID)
);
--Inserting values into Attribute_category
INSERT INTO attribute_category (attribute_category_name)
VALUES ('PHYSICAL'), ('TECHNICAL');

-- Creating table Attribute_type
CREATE TABLE attribute_type (
  attribute_type_ID INT NOT NULL AUTO_INCREMENT,
  attribute_type_name VARCHAR(100),
  PRIMARY KEY (attribute_type_ID)
);

-- Inserting values into Attribute_type
INSERT INTO attribute_type (attribute_type_name)
VALUES ('TEXT'), ('NUMBER'), ('BOOLEAN');

-- Creating table Product_attribute Referencing --
-- from Product_ID,Attribute_type and Attribute_category--
CREATE TABLE product_attribute (
  product_attribute_ID INT NOT NULL AUTO_INCREMENT,
  product_attribute_name VARCHAR(100),
  product_attribute_value VARCHAR(100),
  product_ID INT,
  attribute_type_ID INT,
  attribute_category_ID INT,
  PRIMARY KEY (product_attribute_ID),
  FOREIGN KEY (product_ID) REFERENCES product(product_ID),
  FOREIGN KEY (attribute_type_ID) REFERENCES attribute_type(attribute_type_ID),
  FOREIGN KEY (attribute_category_ID) REFERENCES attribute_category(attribute_category_ID)
);

-- Inserting values into Product_attribute---
INSERT INTO product_attribute (
  product_attribute_name, 
  product_attribute_value, 
  product_ID, 
  attribute_type_ID, 
  attribute_category_ID
) 
VALUES 
  ('Material', 'Aluminium', 10, 1, 1),      -- TEXT, PHYSICAL for iPhone
  ('Weight', '180g', 10, 1, 1),            -- TEXT, PHYSICAL for iPhone
  ('Material', 'Plastic', 11, 1, 1),       -- TEXT, PHYSICAL for S-24
  ('Weight', '200g', 11, 1, 1),            -- TEXT, PHYSICAL for S-24
  ('Waterproof', 'true', 10, 3, 2),        -- BOOLEAN, TECHNICAL for iPhone
  ('5G Support', 'true', 11, 3, 2);        -- BOOLEAN, TECHNICAL for S-24
