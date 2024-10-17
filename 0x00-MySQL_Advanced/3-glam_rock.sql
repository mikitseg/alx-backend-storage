-- Retrieve all bands with Glam rock as their main style, ranking them by their longevity,
-- where the lifespan is computed as the difference between the split year and the formed year.
-- The column names are 'band_name' and 'lifespan' (in years).

SELECT band_name,
    (IFNULL(split, 2022) - formed) AS lifespan
FROM metal_bands
WHERE style LIKE '%Glam rock%'
ORDER BY lifespan DESC;
