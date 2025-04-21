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