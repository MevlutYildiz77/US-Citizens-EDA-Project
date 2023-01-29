use PythonFiles

SELECT * FROM adult_eda

--write all ? rows in workclass column
SELECT *
FROM adult_eda
WHERE workclass IN ('?')

--REPLACE '?' WITH 'Unknown' STATEMENT in workclass column
SELECT REPLACE(workclass, '?', 'Unknown') as workclass
FROM adult_eda

update adult_eda set workclass = replace(workclass, '?', 'Unknown');
commit;

select * from adult_eda

--Find rows of df["hours-per-week"] == 99)
SELECT *
FROM adult_eda
WHERE hours_per_week = 99

--How many of each race are represented in this dataset?
SELECT race, COUNT(race) as CountOfEachRace
FROM adult_eda
GROUP BY race
ORDER BY CountOfEachRace DESC

--What is the average age of men/women?
SELECT sex, AVG(age)as AverageOfEachSex
FROM adult_eda
GROUP BY sex
ORDER BY AverageOfEachSex DESC

--What is the percentage of people who have a Bachelor's degree?
SELECT education, COUNT(education) as CountsOfEducationKinds
FROM adult_eda
GROUP BY education
ORDER BY CountsOfEducationKinds DESC


--What percentage of people with advanced education (Bachelors, Masters, or Doctorate) make more than 50K? 
SELECT  salary,  COUNT(salary) as countofsalary
FROM adult_eda
WHERE education IN('Bachelors', 'Masters', 'Doctorates')
AND salary   IN('>50K')

GROUP BY salary
ORDER BY countofsalary



--????What country has the highest percentage of people that earn >50K?  --
SELECT native_country, COUNT(MAX(salary)) as MaxSalary
FROM adult_eda
WHERE salary IN('>50K')
GROUP BY native_country
ORDER BY MaxSalary

---Do education and education_num columns hold similar information? 
SELECT education, education_num, COUNT(education_num) as CountOfEducation
FROM adult_eda
GROUP BY education, education_num
ORDER BY CountOfEducation DESC

-- Impute missing values in relationship column with 'Unmarried'. Also replace 'Not-in-family','Other-relative' values in this column with 'Unmarried'?
update adult_eda set relationship = replace(relationship, 'NULL', 'Unmaried');
update adult_eda set relationship = replace(relationship, 'Other-relative', 'Unmarried');
update adult_eda set relationship = replace(relationship, 'Not-in-family', 'Unmarried');

select relationship, COUNT('NULL') as null_amount
from adult_eda
--where relationship = 'NULL'
GROUP BY relationship
ORDER BY null_amount

--Identify the most popular occupation for those who earn >50K in India.
SELECT native_country, occupation, COUNT(occupation) as most_occupation
FROM adult_eda
WHERE native_country IN('India')
AND salary IN('>50K')
GROUP BY native_country, occupation
ORDER BY most_occupation DESC






