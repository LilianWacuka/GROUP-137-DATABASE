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
