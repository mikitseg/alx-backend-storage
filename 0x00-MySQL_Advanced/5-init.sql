-- Initialize the 'users' table by dropping it if it exists and creating a new one.
DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT, -- Unique identifier for each user, automatically incremented.
    email varchar(255) not null, -- Email address of the user, cannot be null.
    name varchar(255), -- Name of the user.
    valid_email boolean not null default 0, -- Flag indicating whether the email is valid, default value is false.
    PRIMARY KEY (id) -- Primary key constraint on the 'id' column.
);

-- Insert sample data into the 'users' table.
INSERT INTO users (email, name) VALUES ("bob@dylan.com", "Bob");
INSERT INTO users (email, name, valid_email) VALUES ("sylvie@dylan.com", "Sylvie", 1);
INSERT INTO users (email, name, valid_email) VALUES ("jeanne@dylan.com", "Jeanne", 1);
