-- Define a stored procedure named AddBonus that adds a new correction for a student.

DELIMITER $$ ;
CREATE PROCEDURE AddBonus(
    IN user_id INTEGER,
    IN project_name VARCHAR(255),
    IN score INTEGER
)
BEGIN
    -- Check if the project exists, if not, insert it into the 'projects' table.
    IF NOT EXISTS(SELECT name FROM projects WHERE name = project_name) THEN
        INSERT INTO projects (name) VALUES (project_name);
    END IF;
    
    -- Insert the correction into the 'corrections' table.
    INSERT INTO corrections (user_id, project_id, score)
    VALUES (user_id, (SELECT id FROM projects WHERE name = project_name), score);
END;
$$
DELIMITER ;
