-- Define a view named 'need_meeting' that lists all students who have a score below 80 (strict) 
-- and either have no last_meeting date recorded or have a last_meeting date older than 1 month.

CREATE VIEW need_meeting AS 
SELECT name 
FROM students 
WHERE score < 80 
AND (last_meeting IS NULL OR last_meeting < DATE(CURDATE() - INTERVAL 1 MONTH));
