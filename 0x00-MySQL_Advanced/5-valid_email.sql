-- Create a trigger named 'validate' that fires before updating a row in the 'users' table.
-- This trigger resets the 'valid_email' attribute only when the email has been changed.

DELIMITER $$ ;
CREATE TRIGGER validate BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email != OLD.email THEN
		SET NEW.valid_email = 0;
	END IF;
END;$$
DELIMITER ;
