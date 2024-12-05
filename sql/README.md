# SQL Queries

This folder contains SQL queries used to analyze the survey data for the "Work and Mental Health" project. The queries cover tasks like data aggregation and advanced analysis.

## Files  
- `Creating Tables.sql`: Contains queries for data aggregation and table creation.  
- `Distribution of Surveyed Employees.sql`: Analyzes the distribution of surveyed employees by region, work location, age, gender, industry, and combinations of these factors.   
- `Mental Health Problems and Mental Health Resources.sql`: Examines the relationship between access to mental health resources and the prevalence of psychological issues.  
- `Physical Activity and Sleep Quality.sql`: Investigates levels of physical activity, sleep quality, and their connections to work locations.  
- `Satisfaction with Remote Work.sql`: Assesses job satisfaction across different demographics and work conditions.  
- `Work Life Balance.sql`: Evaluates work-life balance based on age, work location, and other relevant factors.  
- `Working Hours.sql`: Analyzes average working hours by region, industry, and work location, highlighting trends in workload.  

## Example Query  
*In which industries and what exactly is the maximum average number of working hours per week by region (+ in Total)?*
```sql
WITH industry_hours AS (
    SELECT 
        l.Region, 
        wi.Industry, 
        ROUND(AVG(wd.Hours_Worked_Per_Week), 2) AS avg_working_hours_per_week
    FROM
        work_info wi
    JOIN
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    JOIN
        location l ON l.Employee_ID = wd.Employee_ID
    GROUP BY l.Region, wi.Industry
),
region_max AS (
    SELECT 
        ih.Region, 
        ih.Industry, 
        ih.avg_working_hours_per_week,
        ROW_NUMBER() OVER (PARTITION BY ih.Region ORDER BY ih.avg_working_hours_per_week DESC) AS rn
    FROM industry_hours ih
),
global_avg AS (
    SELECT 
        wi.Industry,
        ROUND(AVG(wd.Hours_Worked_Per_Week), 2) AS avg_working_hours_per_week
    FROM 
        work_info wi
    JOIN 
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    GROUP BY wi.Industry
),
global_max AS (
    SELECT 
        'All Regions' AS Region,
        ga.Industry,
        ga.avg_working_hours_per_week
    FROM global_avg ga
    ORDER BY ga.avg_working_hours_per_week DESC
    LIMIT 1
)
SELECT 
    rm.Region, 
    rm.Industry, 
    rm.avg_working_hours_per_week
FROM region_max rm
WHERE rm.rn = 1

UNION ALL

SELECT 
    gm.Region,
    gm.Industry,
    gm.avg_working_hours_per_week
FROM global_max gm
ORDER BY Region;
