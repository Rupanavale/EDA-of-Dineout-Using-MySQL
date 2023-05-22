USE portfolioproject;
-- View table:
SELECT * FROM restaurants;

-- Any missing values in the restaurant table:
SELECT *
FROM restaurants
WHERE Name IS NULL OR Location IS NULL OR Locality IS NULL OR City IS NULL OR Cuisine IS NULL OR Rating IS NULL OR Votes IS NULL OR Cost IS NULL;


-- Highest nuber of restaurants in a city:
SELECT city, COUNT(*) AS restaurant_count
FROM restaurants
GROUP BY city
ORDER BY restaurant_count DESC
LIMIT 1;

--  Top 3 highest-rated restaurants in each city:
SELECT city, Name, rating
FROM (
  SELECT city, Name, rating,
    ROW_NUMBER() OVER (PARTITION BY city ORDER BY rating DESC) AS row_num
  FROM restaurants
) AS subquery
WHERE row_num <= 3;

-- Top 3 most affordable restaurants in respective cities having rating more than 4:
SELECT city, Name, rating, cost
FROM (
  SELECT city, Name, rating, cost,
    ROW_NUMBER() OVER (PARTITION BY city ORDER BY cost ASC) AS row_num
  FROM restaurants
  WHERE rating > 4
) AS subquery
WHERE row_num <= 3;

-- Most common cuisine among the restaurants:
SELECT Cuisine, COUNT(*) AS cuisine_count
FROM restaurants
GROUP BY Cuisine
ORDER BY cuisine_count DESC
LIMIT 1;

-- Average rating of the restaurants:
SELECT AVG(Rating) AS average_rating
FROM restaurants;

-- Maximum and minimum cost of dining in the restaurants:
SELECT MAX(Cost) AS maximum_cost, MIN(Cost) AS minimum_cost
FROM restaurants;

-- Correlation between the restaurant rating and the cost of dining:
SELECT
    (SUM((Rating - avg_rating) * (Cost - avg_cost)) / ((COUNT(*)-1) * STDDEV(Rating) * STDDEV(Cost))) AS correlation
FROM (
    SELECT
        Rating, Cost,
        (SELECT AVG(Rating) FROM restaurants) AS avg_rating,
        (SELECT AVG(Cost) FROM restaurants) AS avg_cost
    FROM restaurants
) AS subquery;

-- Identifying any outliers in the restaurant ratings:
SELECT Name, Rating
FROM restaurants
WHERE ABS((Rating - (SELECT AVG(Rating) FROM restaurants)) / (SELECT STDDEV(Rating) FROM restaurants)) > 3;

-- Distribution of restaurant ratings:
SELECT Rating, COUNT(*) AS rating_count
FROM restaurants
GROUP BY Rating
ORDER BY Rating;

-- Median cost of dining in the restaurants:
SELECT AVG(Cost) AS median_cost
FROM (
  SELECT Cost, ROW_NUMBER() OVER (ORDER BY Cost) AS RowNum, (SELECT COUNT(*) FROM restaurants) AS TotalCount
  FROM restaurants
) AS subquery
WHERE RowNum IN (FLOOR((TotalCount + 1) / 2), CEIL((TotalCount + 1) / 2));

-- Percentage distribution of restaurants across different cost ranges:
SELECT 
  CASE 
    WHEN Cost <= 100 THEN '0-100'
    WHEN Cost <= 200 THEN '101-200'
    WHEN Cost <= 300 THEN '201-300'
    ELSE '301+'
  END AS cost_range,
  COUNT(*) AS restaurant_count,
  COUNT(*) / (SELECT COUNT(*) FROM restaurants) * 100 AS percentage
FROM restaurants
GROUP BY cost_range;

-- Average rating varies across different cost ranges:
SELECT 
  CASE 
    WHEN Cost <= 100 THEN '0-100'
    WHEN Cost <= 200 THEN '101-200'
    WHEN Cost <= 300 THEN '201-300'
    ELSE '301+'
  END AS cost_range,
  AVG(Rating) AS average_rating
FROM restaurants
GROUP BY cost_range
ORDER BY cost_range;

-- Average rating for Pune:
DELIMITER //

CREATE PROCEDURE CalculateAverageRating(IN cityName VARCHAR(100), OUT avgRating DECIMAL(5,2))
BEGIN
    SELECT AVG(Rating) INTO avgRating
    FROM restaurants
    WHERE City = cityName;
END //

DELIMITER ;


CALL CalculateAverageRating('pune', @averageRating);
SELECT @averageRating;


