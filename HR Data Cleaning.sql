CREATE DATABASE projects;

USE projects; 

SELECT * FROM hr;

ALTER TABLE hr
CHANGE COLUMN ï»¿id empl_id VARCHAR(20) NULL;

DESCRIBE hr;

SELECT termdate FROM hr; 

SET sql_safe_updates = 0;

UPDATE hr
SET birthdate = CASE
	WHEN birthdate LIKE '%/%' THEN date_format(str_to_date(birthdate, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN birthdate LIKE '%-%' THEN date_format(str_to_date(birthdate, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr 
MODIFY COLUMN birthdate DATE;

UPDATE hr
SET hire_date = CASE
	WHEN hire_date LIKE '%/%' THEN date_format(str_to_date(hire_date, '%m/%d/%Y'), '%Y-%m-%d')
    WHEN hire_date LIKE '%-%' THEN date_format(str_to_date(hire_date, '%m-%d-%Y'), '%Y-%m-%d')
    ELSE NULL
END;

ALTER TABLE hr 
MODIFY COLUMN hire_date DATE;

UPDATE hr
SET termdate = 
    CASE 
        WHEN termdate = '' THEN NULL  
        ELSE DATE(STR_TO_DATE(termdate, '%Y-%m-%d %H:%i:%s UTC'))  
    END
WHERE termdate IS NOT NULL;


ALTER TABLE hr 
MODIFY COLUMN termdate DATE;

ALTER TABLE hr ADD COLUMN age INT; 

UPDATE hr 
SET age = timestampdiff(YEAR, birthdate, CURDATE());

SELECT birthdate, age FROM hr; 

SELECT
	MIN(age) AS youngest, -- -44
    MAX(age) AS oldest -- 59
FROM hr; 

SELECT COUNT(*) FROM hr WHERE age < 18; -- 967