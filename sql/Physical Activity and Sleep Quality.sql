# Physical activity by gender on the remote work:

SELECT 
    ei.Gender,
    f.Physical_Activity,
    COUNT(wd.Employee_ID) AS employee_count
FROM
    other_factors f
        JOIN
    work_details wd ON f.Employee_ID = wd.Employee_ID
        JOIN
    employee_info ei ON wd.Employee_ID = ei.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY ei.Gender , f.Physical_Activity
ORDER BY ei.Gender , employee_count DESC;


# In which work location is the highest physical activity?

SELECT 
    wd.Work_location,
    ROUND(SUM(CASE
                WHEN f.Physical_Activity = 'Daily' THEN 1
                ELSE 0
            END) / COUNT(wd.Employee_ID) * 100,
            2) AS employee_daily_activ_percentage
FROM
    other_factors f
        JOIN
    work_details wd ON f.Employee_ID = wd.Employee_ID
GROUP BY wd.Work_location
ORDER BY employee_daily_activ_percentage DESC
limit 1;


# Sleep quality by work location:

SELECT 
    wd.Work_location,
    f.Sleep_Quality,
    COUNT(f.Employee_ID) AS employee_count
FROM
    other_factors f
        JOIN
    work_details wd ON f.Employee_ID = wd.Employee_ID
GROUP BY wd.Work_location , f.Sleep_Quality
ORDER BY wd.Work_location , employee_count DESC;


# Sleep quality by gender on the remote work:

SELECT 
    ei.Gender,
    f.Sleep_Quality,
    COUNT(f.Employee_ID) AS employee_count
FROM
    other_factors f
        JOIN
    work_details wd ON f.Employee_ID = wd.Employee_ID
        JOIN
    employee_info ei ON wd.Employee_ID = ei.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY ei.Gender , f.Sleep_Quality
ORDER BY ei.Gender;


# Does physical activity affect stress levels?

select 
f.Physical_Activity, i.Stress_Level, count(f.Employee_ID) as number_of_employees
from
other_factors f
join
indicators i on f.Employee_ID=i.Employee_ID
group by f.Physical_Activity, i.Stress_Level
order by f.Physical_Activity, number_of_employees desc;
