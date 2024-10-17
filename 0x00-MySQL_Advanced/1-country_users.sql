-- Create a table named 'users' if it doesn't exist already, adhering to the specified requirements:
-- id: an integer field that cannot be null, serves as the primary key, and auto-increments with each new entry.
-- email: a string field of maximum length 255 characters, cannot be null, and must be unique across all entries.
-- name: a string field of maximum length 255 characters.
-- country: an enumerated field allowing values 'US', 'CO', or 'TN', with default value 'US' and cannot be null.
CREATE TABLE IF NOT EXISTS users(
    id int NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    name varchar(255),
    country ENUM('US', 'CO', 'TN') DEFAULT 'US' NOT NULL
);
