create database village;
use village;
-- Step 1: Create the table
CREATE TABLE village_population (
    familyid VARCHAR(10),
    total_population INT,
    Male INT,
    Female INT,
    literate INT,
    illiterate INT,
    income_of_family INT
);

-- Step 2: Insert data into the table
INSERT INTO village_population (familyid, total_population, Male, Female, literate, illiterate, income_of_family) VALUES
('f001', 8, 4, 4, 6, 2, 10000),
('f002', 6, 3, 3, 4, 2, 12000),
('f003', 5, 2, 3, 3, 2, 11000),
('f004', 7, 4, 3, 5, 2, 15000),
('f005', 4, 2, 2, 3, 1, 8000),
('f006', 6, 3, 3, 4, 2, 13000),
('f007', 7, 4, 3, 5, 2, 14000),
('f008', 5, 2, 3, 3, 2, 9500),
('f009', 4, 1, 3, 2, 2, 9000),
('f010', 8, 5, 3, 6, 2, 16000),
('f011', 6, 3, 3, 4, 2, 12500),
('f012', 7, 4, 3, 5, 2, 13500),
('f013', 5, 2, 3, 3, 2, 10500),
('f014', 6, 3, 3, 4, 2, 14000),
('f015', 4, 2, 2, 2, 2, 7500),
('f016', 7, 4, 3, 5, 2, 15000),
('f017', 5, 2, 3, 3, 2, 10000),
('f018', 6, 3, 3, 4, 2, 12000),
('f019', 8, 5, 3, 6, 2, 17000),
('f020', 7, 4, 3, 5, 2, 14500),
('f021', 6, 3, 3, 4, 2, 12500),
('f022', 5, 2, 3, 3, 2, 9500),
('f023', 4, 2, 2, 2, 2, 8000),
('f024', 8, 4, 4, 6, 2, 16000),
('f025', 7, 4, 3, 5, 2, 15500),
('f026', 6, 3, 3, 4, 2, 13000),
('f027', 5, 2, 3, 3, 2, 10000),
('f028', 6, 3, 3, 4, 2, 14000),
('f029', 7, 4, 3, 5, 2, 15000),
('f030', 5, 2, 3, 3, 2, 11000),
('f031', 6, 3, 3, 4, 2, 13500),
('f032', 8, 5, 3, 6, 2, 17500),
('f033', 7, 4, 3, 5, 2, 14500),
('f034', 6, 3, 3, 4, 2, 12000),
('f035', 5, 2, 3, 3, 2, 9000),
('f036', 6, 3, 3, 4, 2, 13000),
('f037', 7, 4, 3, 5, 2, 14000),
('f038', 8, 5, 3, 6, 2, 16000),
('f039', 5, 2, 3, 3, 2, 9500),
('f040', 6, 3, 3, 4, 2, 12500),
('f041', 7, 4, 3, 5, 2, 15000),
('f042', 8, 4, 4, 6, 2, 17000),
('f043', 5, 2, 3, 3, 2, 10000),
('f044', 6, 3, 3, 4, 2, 14000),
('f045', 7, 4, 3, 5, 2, 15500),
('f046', 8, 5, 3, 6, 2, 18000),
('f047', 6, 3, 3, 4, 2, 12500),
('f048', 7, 4, 3, 5, 2, 15000),
('f049', 5, 2, 3, 3, 2, 9500),
('f050', 6, 3, 3, 4, 2, 13000);

-- Step 3: Perform various analyses

-- 1. Top 7 families with the highest income

SELECT familyid, income_of_family
FROM village_population
ORDER BY income_of_family DESC
LIMIT 7;

-- 2. Average income per family member
SELECT AVG(income_of_family / total_population) AS avg_income_per_member
FROM village_population;

-- 3. Total population
SELECT SUM(total_population) AS total_population
FROM village_population;

-- 4. Total literate persons
SELECT SUM(literate) AS total_literate
FROM village_population;

-- 5. Total illiterate persons
SELECT  SUM(literate) AS total_literate
FROM village_population;

-- 6. Total number of males and females
SELECT 
    SUM(Male) AS total_males,
    SUM(Female) AS total_females
FROM village_population;

-- 7. Percentage of males relative to total population
SELECT 
    (SUM(Male) / SUM(total_population)) * 100 AS percentage_male
FROM village_population;

-- 8. Percentage of females relative to total population
SELECT 
    (SUM(Female) / SUM(total_population)) * 100 AS percentage_female
FROM village_population;

-- 9. Percentage of literate persons relative to total population
SELECT 
    (SUM(literate) / SUM(total_population)) * 100 AS percentage_literate
FROM village_population;

-- 10. Percentage of illiterate persons relative to total population
SELECT 
    (SUM(illiterate) / SUM(total_population)) * 100 AS percentage_illiterate
FROM village_population;



-- 11. Family with the maximum number of members
SELECT familyid, total_population
FROM village_population
ORDER BY total_population DESC
LIMIT 1;

-- 12. Family with the minimum number of members
SELECT familyid, total_population
FROM village_population
ORDER BY total_population ASC
LIMIT 1;

-- 13. Average number of literate and illiterate people per family
SELECT 
    AVG(literate) AS avg_literate_per_family,
    AVG(illiterate) AS avg_illiterate_per_family
FROM village_population;

-- 14. Families with income above average
SELECT familyid, income_of_family
FROM village_population
WHERE income_of_family > (SELECT AVG(income_of_family) FROM village_population);

-- 15. Income distribution by population size
SELECT total_population, 
       AVG(income_of_family) AS avg_income
FROM village_population
GROUP BY total_population
ORDER BY total_population;

-- 16. percentage wise of literate and illiterate
SELECT 
    (SUM(literate) / SUM(total_population)) * 100 AS percentage_literate, (SUM(illiterate) / SUM(total_population)) * 100 AS percentage_illiterate
FROM village_population;

-- 17. total literate person and illiterate
SELECT  SUM(literate) AS total_literate, SUM(illiterate) AS total_illiterate
FROM village_population;

-- 18.percentage wise total male and female
SELECT 
    (SUM(Male) / SUM(total_population)) * 100 AS percentage_male,  (SUM(Female) / SUM(total_population)) * 100 AS percentage_female
FROM village_population;
 
 -- 19.per person income of village
 SELECT
 (SUM(income_of_family) / SUM(total_population)) AS Per_person_income , 
 SUM(income_of_family) AS total_income ,SUM(total_population) AS total_Population
 FROM village_population;
 
 -- 20.Query to count the number of families in each income class
SELECT 
    CASE
        WHEN income_of_family < 9000 THEN 'Poverty Class'
        WHEN income_of_family BETWEEN 9000 AND 11000 THEN 'Lower Middle Class'
        WHEN income_of_family BETWEEN 12000 AND 14000 THEN 'Middle Class'
        WHEN income_of_family BETWEEN 15000 AND 16500 THEN 'Upper Middle Class'
        WHEN income_of_family BETWEEN 16501 AND 19000 THEN 'Rich Class'
        ELSE 'Unclassified'
    END AS income_class,
    COUNT(familyid) AS number_of_families
FROM village_population
GROUP BY
    CASE
         WHEN income_of_family < 9000 THEN 'Poverty Class'
        WHEN income_of_family BETWEEN 9000 AND 11000 THEN 'Lower Middle Class'
        WHEN income_of_family BETWEEN 12000 AND 14000 THEN 'Middle Class'
        WHEN income_of_family BETWEEN 15000 AND 16500 THEN 'Upper Middle Class'
        WHEN income_of_family BETWEEN 16501 AND 19000 THEN 'Rich Class'
        ELSE 'Unclassified'
    END;

 
