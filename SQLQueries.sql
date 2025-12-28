CREATE DATABASE PakistanJobMarket;
GO
USE PakistanJobMarket;
GO
-- Table Creation

CREATE TABLE jobs (
    job_id INT IDENTITY(1,1) PRIMARY KEY,
    job_title VARCHAR(255),
    domain VARCHAR(100),
    city VARCHAR(100),
    employment_type VARCHAR(50),
    career_level VARCHAR(50),
    min_experience INT,
    experience_level VARCHAR(50),
    salary_min INT,
    salary_max INT,
    min_education VARCHAR(100),
    gender VARCHAR(20),
    age INT,
    skills VARCHAR(MAX),
    apply_deadline DATE
);

DROP TABLE jobs;



SELECT COUNT(*) FROM jobs;

SELECT TOP 10 * FROM jobs;


-- 1?? Job Demand by Domain

SELECT domain, COUNT(*) AS total_jobs
FROM jobs
GROUP BY domain
ORDER BY total_jobs DESC;


-- 2?? City-wise Job Market

--3?? Experience Level Demand

SELECT experience_level, COUNT(*) AS total_jobs
FROM jobs
GROUP BY experience_level;

-- 4?? Salary Trends

SELECT domain,
       AVG(salary_min) AS avg_min_salary,
       AVG(salary_max) AS avg_max_salary
FROM jobs
WHERE salary_min IS NOT NULL
GROUP BY domain
ORDER BY avg_max_salary DESC;

-- 5 Jobs by Employment Type

SELECT employment_type, COUNT(*) AS total_jobs
FROM jobs
GROUP BY employment_type;

-- 6?? Average Experience Required by Domain

SELECT domain, AVG(min_experience) AS avg_experience
FROM jobs
WHERE min_experience IS NOT NULL
GROUP BY domain
ORDER BY avg_experience DESC;

-- 7?? Senior vs Junior Jobs

SELECT experience_level, COUNT(*) AS jobs
FROM jobs
WHERE experience_level IN ('Junior','Senior')
GROUP BY experience_level;

-- 8 Highest Paying Cities

SELECT city,
       AVG(salary_max) AS avg_salary
FROM jobs
WHERE salary_max IS NOT NULL
GROUP BY city
ORDER BY avg_salary DESC;

-- Most Common Skills

SELECT skills, COUNT(*) AS mentions
FROM jobs
WHERE skills IS NOT NULL
GROUP BY skills
ORDER BY mentions DESC;

-- Gender-Based Jobs

SELECT gender, COUNT(*) AS total_jobs
FROM jobs
GROUP BY gender;

-- Age-Limited Jobs

SELECT COUNT(*) AS age_restricted_jobs
FROM jobs
WHERE age IS NOT NULL;

-- Jobs by Apply Deadline

SELECT apply_deadline, COUNT(*) AS jobs
FROM jobs
GROUP BY apply_deadline
ORDER BY apply_deadline;

-- Top 5 Domains by Salary

SELECT TOP 5 domain,
       AVG(salary_max) AS avg_salary
FROM jobs
WHERE salary_max IS NOT NULL
GROUP BY domain
ORDER BY avg_salary DESC;


