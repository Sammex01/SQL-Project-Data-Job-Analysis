
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


/*

[
  {
    "skills": "svn",
    "avg_salary": "400000"
  },
  {
    "skills": "solidity",
    "avg_salary": "179000"
  },
  {
    "skills": "couchbase",
    "avg_salary": "160515"
  },
  {
    "skills": "datarobot",
    "avg_salary": "155486"
  },
  {
    "skills": "golang",
    "avg_salary": "155000"
  },
  {
    "skills": "mxnet",
    "avg_salary": "149000"
  },
  {
    "skills": "dplyr",
    "avg_salary": "147633"
  },
  {
    "skills": "vmware",
    "avg_salary": "147500"
  },
  {
    "skills": "terraform",
    "avg_salary": "146734"
  },
  {
    "skills": "twilio",
    "avg_salary": "138500"
  },
  {
    "skills": "gitlab",
    "avg_salary": "134126"
  },
  {
    "skills": "kafka",
    "avg_salary": "129999"
  },
  {
    "skills": "puppet",
    "avg_salary": "129820"
  },
  {
    "skills": "keras",
    "avg_salary": "127013"
  },
  {
    "skills": "pytorch",
    "avg_salary": "125226"
  },
  {
    "skills": "perl",
    "avg_salary": "124686"
  },
  {
    "skills": "ansible",
    "avg_salary": "124370"
  },
  {
    "skills": "hugging face",
    "avg_salary": "123950"
  },
  {
    "skills": "tensorflow",
    "avg_salary": "120647"
  },
  {
    "skills": "cassandra",
    "avg_salary": "118407"
  },
  {
    "skills": "notion",
    "avg_salary": "118092"
  },
  {
    "skills": "atlassian",
    "avg_salary": "117966"
  },
  {
    "skills": "bitbucket",
    "avg_salary": "116712"
  },
  {
    "skills": "airflow",
    "avg_salary": "116387"
  },
  {
    "skills": "scala",
    "avg_salary": "115480"
  }
]

Salary Distribution Insights

-The highest-paying skill is SVN, with an average salary of 400,000. That’s a huge outlier, much higher than the rest, which ranges mostly from ~115,000–180,000.
-Most other top-paying skills cluster around 120,000–160,000, which gives a sense of the market standard for high-paying technical skills in this field.
  
  Observation: A single skill (SVN) seems anomalous—this could be due to a very small sample size in job postings or specialized senior-level roles requiring that skill.



TRENDS by Skill Type
| Category                                | Skills                                                     | Notes                                                                                                                |
| --------------------------------------- | ---------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Programming Languages**               | Solidity, GoLang, Scala, Perl                              | Emerging or backend-focused languages command high pay; Solidity hints at demand in blockchain/crypto projects.      |
| **Data Science / Machine Learning**     | MXNet, Datarobot, Keras, PyTorch, TensorFlow, Hugging Face | Machine learning and AI frameworks are in demand for analytics-heavy roles.                                          |
| **Data Engineering / Big Data**         | Kafka, Cassandra, Airflow, Couchbase                       | Skills in handling big data pipelines, ETL, and distributed databases are rewarded.                                  |
| **DevOps / Cloud / Infrastructure**     | Terraform, Ansible, VMware, Puppet, GitLab, Bitbucket      | Knowledge of cloud infrastructure and deployment tools increases pay.                                                |
| **Data Manipulation / Analytics Tools** | Dplyr, Notion, Atlassian                                   | Analytics and workflow management tools are valuable, though pay is slightly lower than heavy programming/ML skills. |
| **Communication / API Tools**           | Twilio                                                     | Specialized tools for integration/communication can command high salaries.                                           |
