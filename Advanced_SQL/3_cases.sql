/*
A CASE expression in SQL is a way to apply conditional logic within your SQL queries.

SELECT``
   CASE
       WHEN columnname = "Valuel' THEN 'Description for Valuel'
       WHEN column_name = "Value' THEN 'Description for Value2'
       ELSE 'Other'
    END AS column_description
FROM table_name;

• CASE - begins the expression
• WHEN - specifies the condition(s) to look at
• THEN - what to do when the condition is TRUE
• ELSE (optional) - provides output if none of the WHEN
• END - concludes the CASE expression                 
*/
   /* 
Label new column as follows based on job_location:
- 'Anywhere' jobs as 'Remote'
- 'New York, NY' jobs as  'Local'
- Otherwise 'Onsite'
*/
SELECT 
	COUNT(job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM 
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category
ORDER BY    
    number_of_jobs DESC;