-- SQL script that creates a stored procedure ComputeAverageWeightedScoreForUser
-- That computes and store the average weighted score for a student
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;

DELIMITER |
CREATE PROCEDURE ComputeAverageWeightedScoreForUser (
    IN user_id INT
)
BEGIN
    DECLARE total_weight INT;
    DECLARE weighted_sum FLOAT;
    
    -- Calculate the total weight for the user's projects
    SELECT SUM(weight) INTO total_weight
    FROM projects
    WHERE id IN (SELECT project_id FROM corrections WHERE user_id = user_id);
    
    -- Calculate the weighted sum of scores for the user's projects
    SELECT SUM(score * weight) INTO weighted_sum
    FROM corrections AS c
    JOIN projects AS p ON c.project_id = p.id
    WHERE c.user_id = user_id;
    
    -- Update the user's average_score with the average weighted score
    UPDATE users
    SET average_score = weighted_sum / total_weight
    WHERE id = user_id;
END;
|
DELIMITER ;
