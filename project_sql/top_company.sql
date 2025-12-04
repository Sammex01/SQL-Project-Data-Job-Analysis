WITH companies AS(
    SELECT 
    company_dim.name AS company_name,
    job_title,
    salary_year_avg AS avg_salary
FROM
    job_postings_fact
LEFT JOIN
    company_dim USING (company_id)
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
)
SELECT
    company_name,
    ROUND(AVG(avg_salary), 0) AS avg_salary
FROM
    companies
GROUP BY
    company_name
ORDER BY
    avg_salary DESC
LIMIT 10
