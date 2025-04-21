Use e_commercedb;

--Creating table Product_category Referencing from Product_ID---
CREATE TABLE product_category (
  category_ID INT NOT NULL AUTO_INCREMENT,
  category_NAME VARCHAR(100),
  product_ID INT,
  PRIMARY KEY (category_ID),
  FOREIGN KEY (product_ID) REFERENCES product(product_ID)
);
---Inserting value into Product_category
INSERT INTO product_category(category_NAME, product_ID)
VALUES
  ('Smartphones', 10),
  ('Tablets', 11),
  ('Laptops', 12),
  ('Smartwatches', 13),
  ('Accessories', 14);

    --Creating table Attribute_category--
  CREATE TABLE attribute_category (
  attribute_category_ID INT NOT NULL AUTO_INCREMENT,
  attribute_category_name VARCHAR(100),
  PRIMARY KEY (attribute_category_ID)
);
--Inserting values into Attribute_category
INSERT INTO attribute_category (attribute_category_name)
VALUES ('PHYSICAL'), ('TECHNICAL');

--Creating table Attribute_type
CREATE TABLE attribute_type (
  attribute_type_ID INT NOT NULL AUTO_INCREMENT,
  attribute_type_name VARCHAR(100),
  PRIMARY KEY (attribute_type_ID)
);

--Inserting values into Attribute_type
INSERT INTO attribute_type (attribute_type_name)
VALUES ('TEXT'), ('NUMBER'), ('BOOLEAN');

--Creating table Product_attribute Referencing --
--from Product_ID,Attribute_type and Attribute_category--
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

--Inserting values into Product_attribute---
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