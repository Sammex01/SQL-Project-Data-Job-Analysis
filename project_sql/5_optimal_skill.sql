WITH skills_demand AS (
SELECT 
    skill_id,
    skills,
    COUNT(job_id) AS demand_count,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
    FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home IS TRUE
GROUP BY skill_id,
         skills
)
SELECT
    skill_id,
    skills,
    demand_count,
    avg_salary
FROM
    skills_demand
WHERE
    demand_count>10
ORDER BY
        avg_salary DESC,
        demand_count DESC
LIMIT 25
