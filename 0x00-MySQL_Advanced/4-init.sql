-- Initialize the database by dropping existing tables if they exist and creating new ones.
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS orders;

-- Create a table named 'items' to store item information.
CREATE TABLE IF NOT EXISTS items (
    name VARCHAR(255) NOT NULL, -- Name of the item, cannot be null.
    quantity int NOT NULL DEFAULT 10 -- Quantity of the item, default value is 10.
);

-- Create a table named 'orders' to store order information.
CREATE TABLE IF NOT EXISTS orders (
    item_name VARCHAR(255) NOT NULL, -- Name of the item ordered, cannot be null.
    number int NOT NULL -- Number of items ordered, cannot be null.
);

-- Insert sample data into the 'items' table.
INSERT INTO items (name) VALUES 
("apple"),
("pineapple"),
("pear");
