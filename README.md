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


 #  Analysis of Data Analyst Roles
 ### 1. Top-Paying Remote Data Analyst Jobs
This analysis examines the top-paying remote **Data Analyst** roles in 2023 to identify where the strongest earning opportunities exist. The goal is to help professionals understand which positions and career paths offer the highest value in today’s competitive data job landscape. 
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

Here's the breakdown of the top Data Analyst Roles in 2023


---

**1. Top Leadership Roles**

* Salaries **$250K+**, led by **Data Analyst** at Mantys (650K USD) and **Director of Analytics** at Meta (336.5K USD).
* Insight: Seniority and leadership drive the highest pay.

 **2. Mid-Level & Specialized Roles**

* Salaries **$150K–$232K**, e.g., **Data Analyst, Marketing** at Pinterest (232K USD) and **Principal Data Analyst** at SmartAsset (205K USD).
* Insight: Specialization and remote flexibility boost earnings.

 **3. Standard Analyst Roles**

* Salaries **$138K–$165K**, common for general remote analysts.
* Insight: Competitive pay but more clustered unless senior or specialized.


![Top Jobs](project_sql\Assets\1_part.png)

Overall: **Leadership, specialization, and remote options are key factors for top pay in 2023.**

### 2. Skills Required for Top Paying Data Analyst Roles
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
![Top Demanded Skills](project_sql/Assets/2_path.png)

### 3. Top 10 Paying Companies
The average salary breakdown shows a clear gap led by **Mantys**, which pays far above all other companies. Close followers like **ЛАНИТ**, **Torc Robotics**, and **Illuminate Mission Solutions** also offer strong compensation, reflecting high demand for advanced data talent. Major tech names such as **Google**, **OpenAI**, and **Anthropic** remain competitive but fall below the premium salaries of more specialized firms. Overall, the chart highlights how industry focus and technical complexity strongly influence pay levels.


```sql

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
```
![Top Companies](project_sql\Assets\3_path.png)
### 4. Top 10 Paying Countries
Average salaries vary widely across countries, with Belarus ($400k) and Russia ($292k) leading, followed by high-paying islands like the Bahamas ($201k). Developed markets such as the US ($126k), Canada ($123k), and Australia ($118k) offer competitive and reliable salaries, while emerging markets like India ($114k) and Brazil ($119k) provide moderate pay with growth opportunities. Targeting developed countries or high-paying niche markets can maximize both career opportunity and compensation.

```sql
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

```
![Top Countries](project_sql\Assets\4_path.png)
### 5. Optimal Skills
This analysis highlights the most in-demand and highest-paying technical skills in today’s job market. **Python** and **Tableau** lead in demand, offering abundant opportunities, while **AWS**, **Azure**, **Snowflake**, and **Hadoop** provide a strong balance of high pay and solid demand. Niche skills like **Go** and **Confluence** offer top-tier salaries but appear less frequently. Overall, cloud platforms and big data tools are the most strategic choices for career growth, while popular languages remain reliable for plentiful roles.

```sql
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
```

**Labels**
--
#### **GO** - Vibrant Red | **Confluence** - Bright Orange | **Hadoop** - Golden Yellow  | **Snowflake** - Chartreuse Green | **Azure** - Lime Green | **Bigquery** - Emerald Green | **Aws** - Deep Cyan | **Java** - Sky Blue | **Ssis** - Medium Blue | **Jira** - Indigo | **Oracle** - Dark Violet | **Looker** - Purple | **Nosql** - Magenta | **Python** - Hot Pink | **R** - Rose Pink | **Redshift** - Crimson | **Qlik** - Ruby Red | **Tableau** - Maroon | **SSRS** - Brown-Red | **Spark** - Olive Drab | **C++** - Forest Green | **SAS** - Teal | **SQL server** - Dark Blue-Green | **Javascript** - Deep Purple-Red


# Conclusion
## Insights - 
## Closing Thoughts