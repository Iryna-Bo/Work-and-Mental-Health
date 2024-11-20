# Satisfaction with remote work in total:

SELECT 
    i.Satisfaction_with_Remote_Work,
    COUNT(i.Employee_ID) AS number_of_employees,
    ROUND((COUNT(i.Employee_ID) * 100) / total_employees.total_count,
            2) AS percentage_of_total
FROM
    indicators i
        JOIN
    work_details wd ON i.Employee_ID = wd.Employee_ID
        JOIN
    (SELECT 
        COUNT(i.Employee_ID) AS total_count
    FROM
        indicators i
    JOIN work_details wd ON i.Employee_ID = wd.Employee_ID
    WHERE
        wd.Work_location LIKE 'Remote') total_employees
WHERE
    wd.Work_location LIKE 'Remote'
GROUP BY i.Satisfaction_with_Remote_Work , total_employees.total_count
ORDER BY number_of_employees DESC;


# Level of satisfaction with remote work by gender:

SELECT 
    ei.Gender,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Satisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_satisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Unsatisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_unsatisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Neutral' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_neutral_percent
FROM
    indicators i
        JOIN
    employee_info ei ON i.Employee_ID = ei.Employee_ID
        JOIN
    work_details wd ON ei.Employee_ID = wd.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY ei.Gender
ORDER BY ei.Gender;


# Level of satisfaction with remote work by region:

SELECT 
    l.Region,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Satisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_satisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Unsatisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_unsatisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Neutral' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_neutral_percent
FROM
    indicators i
        JOIN
    location l ON i.Employee_ID = l.Employee_ID
        JOIN
    work_details wd ON l.Employee_ID = wd.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY l.Region
ORDER BY l.Region;


# Level of satisfaction with remote work by industry:

SELECT 
    wi.Industry,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Satisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_satisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Unsatisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_unsatisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Neutral' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_neutral_percent
FROM
    indicators i
        JOIN
    work_info wi ON i.Employee_ID = wi.Employee_ID
        JOIN
    work_details wd ON wi.Employee_ID = wd.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY wi.Industry
ORDER BY wi.Industry;


# Level of satisfaction with remote work by job role:

SELECT 
    wi.Job_Role,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Satisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_satisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Unsatisfied' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_unsatisfied_percent,
    ROUND(SUM(CASE
                WHEN i.Satisfaction_with_Remote_Work = 'Neutral' THEN 1
                ELSE 0
            END) / COUNT(i.Employee_ID) * 100,
            2) AS employees_neutral_percent
FROM
    indicators i
        JOIN
    work_info wi ON i.Employee_ID = wi.Employee_ID
        JOIN
    work_details wd ON wi.Employee_ID = wd.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY wi.Job_Role
ORDER BY wi.Job_Role;