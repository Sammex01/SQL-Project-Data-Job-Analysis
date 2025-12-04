 # Introduction
 📊Explore the world of data careers! 
This project takes a closer look at data analyst roles—highlighting top-paying🫰 positions, the most in-demand📈 skills, and where strong demand meets high salaries in the data analytics field. 🚀

🔎Searching for SQL Queries, find them here: [project_sql folder](/project_sql/)
 # Background
 With the data industry growing so quickly, I’ve always been curious about what truly shapes the job market for data analysts. Everywhere you look, companies are relying on data to guide major decisions, but the roles, required skills, and salaries seem to vary a lot.

This project is my way of exploring that landscape—digging into job postings to find out which data analyst roles pay the most, what skills employers are asking for, and where strong demand meets great opportunities. It’s a simple, focused look at what it really takes to thrive in today’s data analytics field.

## The Five Questions This Analysis Aims To Solve
1. What are the top-paying Data Analyst jobs?
2. What skills are required for these top-paying jobs?
3. What sills are most in demand for data analysts?
4. Whish Skills Are Associated with higher  salaries?
5. What are the most optimal skills to learn

 # Tools I Used
During my analysis of the data Analyst  job market, I made use of several tools such as
- **SQL**: The backbone of the analysis, allowing me to query the database and find critial insights
- **PostgreSQL**: This is the chosen database management where all the queries where run
- **Visual Studio Code** - My favorite database management and ececution of SQL queries
- **Git and Github** - Ver essential for version control and sahring my SQL scripts and Analysis, ensuring smooth collaboration and proper project tracking


 # The Analysis
 ### 1. Top-Paying Data Analyst Jobs
 This analysis explores the top-paying **Data Analyst** roles to highlight where the strongest career opportunities exist. 
 By examining salaries, skills, and job demand, the goal is to reveal which positions offer the best value in today’s competitive data job market.

 ```sql
 SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN
    company_dim USING (company_id)
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
```
### 2. Skills Required for the Top Paying Data Analyst Roles
Understanding the skills required for the top-paying **Data Analyst** roles helps identify what employers value most in today’s job market. By highlighting the technical and analytical capabilities linked to higher salaries, this section clarifies which competencies are essential for maximizing career opportunities.

```sql
WITH top_paying_jobs AS (
SELECT
    job_id,
    job_title,
    salary_year_avg,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim USING (company_id)
WHERE
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
ORDER BY
    salary_year_avg DESC
    
```

### 3. Top Paying Skills

This section focuses on the skills that command the highest salaries in data analyst roles. By comparing compensation patterns across different tools and technologies, it highlights which technical competencies provide the strongest earning potential in the current job market.

```sql

SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) as avg_salary
    FROM job_postings_fact
INNER JOIN skills_job_dim USING (job_id)
INNER JOIN skills_dim USING (skill_id)
WHERE job_title_short = 'Data Analyst' AND
    salary_year_avg IS NOT NULL
GROUP BY skills
ORDER BY avg_salary DESC
LIMIT 25
```