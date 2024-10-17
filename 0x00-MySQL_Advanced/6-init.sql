-- Initialize the database by dropping existing tables if they exist and creating new ones.

DROP TABLE IF EXISTS corrections;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS projects;

-- Create a table named 'users' to store user information.
CREATE TABLE IF NOT EXISTS users (
    id int not null AUTO_INCREMENT, -- Unique identifier for each user, automatically incremented.
    name varchar(255) not null, -- Name of the user, cannot be null.
    average_score float default 0, -- Default value of 0 for the average score.
    PRIMARY KEY (id) -- Primary key constraint on the 'id' column.
);

-- Create a table named 'projects' to store project information.
CREATE TABLE IF NOT EXISTS projects (
    id int not null AUTO_INCREMENT, -- Unique identifier for each project, automatically incremented.
    name varchar(255) not null, -- Name of the project, cannot be null.
    PRIMARY KEY (id) -- Primary key constraint on the 'id' column.
);

-- Create a table named 'corrections' to store correction information.
CREATE TABLE IF NOT EXISTS corrections (
    user_id int not null, -- Foreign key referencing 'id' in the 'users' table.
    project_id int not null, -- Foreign key referencing 'id' in the 'projects' table.
    score int default 0, -- Default value of 0 for the score.
    KEY `user_id` (`user_id`), -- Index on the 'user_id' column for faster retrieval.
    KEY `project_id` (`project_id`), -- Index on the 'project_id' column for faster retrieval.
    CONSTRAINT fk_user_id FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE, -- Foreign key constraint on 'user_id' referencing 'id' in 'users' table with cascade delete.
    CONSTRAINT fk_project_id FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE -- Foreign key constraint on 'project_id' referencing 'id' in 'projects' table with cascade delete.
);

-- Insert sample data into the 'users' table.
INSERT INTO users (name) VALUES ("Bob");
SET @user_bob = LAST_INSERT_ID(); -- Retrieve the last inserted user ID.

INSERT INTO users (name) VALUES ("Jeanne");
SET @user_jeanne = LAST_INSERT_ID(); -- Retrieve the last inserted user ID.

-- Insert sample data into the 'projects' table.
INSERT INTO projects (name) VALUES ("C is fun");
SET @project_c = LAST_INSERT_ID(); -- Retrieve the last inserted project ID.

INSERT INTO projects (name) VALUES ("Python is cool");
SET @project_py = LAST_INSERT_ID(); -- Retrieve the last inserted project ID.

-- Insert sample data into the 'corrections' table.
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_c, 80);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_bob, @project_py, 96);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_c, 91);
INSERT INTO corrections (user_id, project_id, score) VALUES (@user_jeanne, @project_py, 73);
