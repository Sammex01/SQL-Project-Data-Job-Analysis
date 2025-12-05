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



/*
Rank,Skill,Demand Count,Average Salary,Color
1,go,27,"$115,320",Vibrant Red
2,confluence,11,"$114,210",Bright Orange
3,hadoop,22,"$113,193",Golden Yellow
4,snowflake,37,"$112,948",Chartreuse Green
5,azure,34,"$111,225",Lime Green
6,bigquery,13,"$109,654",Emerald Green
7,aws,32,"$108,317",Deep Cyan
8,java,17,"$106,906",Sky Blue
9,ssis,12,"$106,683",Medium Blue
10,jira,20,"$104,918",Indigo
11,oracle,37,"$104,534",Dark Violet
12,looker,49,"$103,795",Purple
13,nosql,13,"$101,414",Magenta
14,python,236,"$101,397",Hot Pink
15,r,148,"$100,499",Rose Pink
16,redshift,16,"$99,936",Crimson
17,qlik,13,"$99,631",Ruby Red
18,tableau,230,"$99,288",Maroon
19,ssrs,14,"$99,171",Brown-Red
20,spark,13,"$99,077",Olive Drab
21,c++,11,"$98,958",Forest Green
22,sas,63,"$98,902",Teal
23,sql server,35,"$97,786",Dark Blue-Green
24,javascript,20,"$97,587",Deep Purple-Red