SELECT
    job_country,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM
    job_postings_fact
WHERE
    salary_year_avg IS NOT NULL AND
    job_country IS NOT NULL
GROUP BY
    job_country
ORDER BY
    avg_salary DESC
LIMIT 10