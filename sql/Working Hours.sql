# How many hours per week employees work by industry in average?

SELECT 
    wi.Industry,
    AVG(wd.Hours_Worked_Per_Week) AS working_hours_per_week
FROM
    work_info wi
    JOIN
    work_details wd ON wi.Employee_ID = wd.Employee_ID
GROUP BY wi.Industry
ORDER BY working_hours_per_week desc;


# How many hours per week employees work by industry and by work location in average?

SELECT 
    wi.Industry,
    wd.Work_Location,
    AVG(wd.Hours_Worked_Per_Week) AS working_hours_per_week
FROM
    work_info wi
        JOIN
    work_details wd ON wi.Employee_ID = wd.Employee_ID
GROUP BY wi.Industry , wd.Work_Location
ORDER BY wi.Industry;


# In which industries and what exactly is the maximum average number of working hours per week by region?

WITH industry_hours AS (
    SELECT 
        l.Region, 
        wi.Industry, 
        ROUND(AVG(wd.Hours_Worked_Per_Week),2) AS avg_working_hours_per_week
    FROM
        work_info wi
    JOIN
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    JOIN
        location l ON l.Employee_ID = wd.Employee_ID
    GROUP BY l.Region, wi.Industry
)
SELECT 
    ih.Region, 
    ih.Industry, 
    ih.avg_working_hours_per_week
FROM (
    SELECT 
        ih.Region, 
        ih.Industry, 
        ih.avg_working_hours_per_week, 
        ROW_NUMBER() OVER (PARTITION BY ih.Region ORDER BY ih.avg_working_hours_per_week DESC) AS rn
    FROM industry_hours ih
) ih
WHERE ih.rn = 1
ORDER BY ih.Region;


# In which industries and what exactly is the maximum average number of working hours per week by region (+ in Total)?

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



