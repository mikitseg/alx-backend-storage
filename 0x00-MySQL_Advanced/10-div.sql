-- Define a function named SafeDiv that calculates the division of two numbers and returns the result,
-- or returns 0 if the second number is equal to 0.
DELIMITER $$ ;
CREATE FUNCTION SafeDiv(
	a INT,
	b INT
)
RETURNS FLOAT
DETERMINISTIC
BEGIN
	DECLARE result FLOAT;
	IF b = 0 THEN
		RETURN 0;
        END IF;
        SET result = (a * 1.0) / b; -- Ensuring decimal division by multiplying 'a' with 1.0
        RETURN result;
END;$$
DELIMITER ;
