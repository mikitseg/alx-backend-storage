-- Retrieve the ranking of country origins of bands based on the total number of fans,
-- ordered in descending order of fan count.

SELECT origin, SUM(fans) AS nb_fans 
FROM metal_bands
GROUP BY origin 
ORDER BY nb_fans DESC;
