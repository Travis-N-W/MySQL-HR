-- QUESTIONS

-- What is the gender breakdown of employees in the company?
SELECT gender, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL 
GROUP BY gender; 

-- What is the race/ethnicity breakdown of employees in the company?
SELECT race, COUNT(*) AS count
FROM hr
WHERE age >= 18 AND termdate IS NULL 
GROUP BY race 
ORDER BY COUNT(*) DESC;

-- What is the age distribution of employees in the company?
SELECT
	MIN(age) AS youngest, 
    MAX(age) AS oldest 
FROM hr
WHERE age >= 18 AND termdate IS NULL; 

SELECT
	CASE
		WHEN age >= 18 AND age <=24 THEN '18-24'
        WHEN age >= 25 AND age <=34 THEN '25-34'
        WHEN age >= 35 AND age <=44 THEN '35-44'
        WHEN age >= 45 AND age <=54 THEN '45-54'
        WHEN age >= 55 AND age <=64 THEN '55-64'
        ELSE '65+'
	END AS age_group, gender,
    COUNT(*) AS count
FROM hr 
WHERE age >= 18 AND termdate IS NULL
GROUP BY age_group, gender 
ORDER BY age_group, gender; 

-- How many employees work at headquarters versus remote locations?
SELECT location, COUNT(*) AS count 
FROM hr 
WHERE age >= 18 AND termdate IS NULL
GROUP BY location; 

-- What is the average length of employment for employees who have been terminated?
SELECT 
	round(AVG(datediff(termdate, hire_date))/365,0) AS avg_length_employment
FROM hr 
WHERE termdate <= curdate() AND termdate IS NOT NULL AND age >= 18;

-- How does the gender distribution vary across departments and job titles?
SELECT department, gender, COUNT(*) AS count
FROM hr 
WHERE age >= 18 AND termdate IS NULL
GROUP BY department, gender
ORDER BY department;
 
-- What is the distribution of job titles across the company?
SELECT jobtitle, COUNT(*) AS count 
FROM hr 
WHERE age >= 18 AND termdate IS NULL
GROUP BY jobtitle
ORDER BY jobtitle DESC; 

-- Which department has the highest turnover rate?
SELECT department, 
	total_count,
	terminated_count,
    CASE
		WHEN total_count = 0 THEN 0
        ELSE terminated_count / total_count
	END AS termination_rate
FROM (
	SELECT department,
    COUNT(*) AS total_count,
    SUM(CASE WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminated_count
    FROM hr 
    WHERE age >= 18 
    GROUP BY department
    ) AS subquery 
ORDER BY termination_rate DESC;

-- What is the distribution of employees across locations by state?
SELECT location_state, COUNT(*) AS count 
FROM hr
WHERE age >= 18 AND termdate IS NULL
GROUP BY location_state
ORDER BY count DESC;

-- How has the company's employee count changed over time based on hire and term dates?
SELECT
	year,
    hires,
    terminations,
    hires - terminations AS net_change,
    round((hires - terminations)/hires * 100, 2) AS net_change_percent
FROM(
	SELECT 
		YEAR(hire_date) AS year,
        COUNT(*) AS hires,
        SUM(CASE WHEN termdate IS NOT NULL AND termdate <= curdate() THEN 1 ELSE 0 END) AS terminations
        FROM hr 
        WHERE age >= 18
        GROUP BY YEAR(hire_date)
		) AS subquery
ORDER BY year ASC;

-- What is the tenure distribution for each department?
SELECT department, round(avg(datediff(termdate, hire_date)/365),0) AS avg_tenure
FROM hr 
WHERE termdate <= curdate() AND termdate IS NOT NULL AND age >= 18
GROUP BY department;
