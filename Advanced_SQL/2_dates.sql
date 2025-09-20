-- :: is used to convert from one data type to another
SELECT *
FROM job_postings_fact
LIMIT 100

SELECT job_posted_date
FROM job_postings_fact
LIMIT 10

SELECT
   job_title_short AS title,
   job_location AS locations,
   job_posted_date  AS DATE
FROM 
   job_postings_fact
LIMIT 5;

SELECT
   job_title_short AS title,
   job_location AS locations,
   job_posted_date :: DATE as date
FROM 
   job_postings_fact
LIMIT 5;

SELECT
   job_title_short AS title,
   job_location AS locations,
   job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST'
FROM 
   job_postings_fact
LIMIT 5;

SELECT
   job_title_short AS title,
   job_location AS locations,
   job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'IST',
   EXTRACT(MONTH FROM job_posted_date) AS date_year,
   EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM 
   job_postings_fact
LIMIT 5;


/*Create Tables from Other Tables
? Question:
• Create three tables:
• Jan 2023 jobs
• Feb 2023 jobs
• Mar 2023 jobs
• Foreshadowing: This will be used in another practice problem below.
• Hints:
• Use CREATE TABLE table_name AS syntax to create your table
• Look at a way to filter out only specific months (EXTRACT)*/

-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs  