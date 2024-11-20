# Percentage of employees with available access to mental health resources by region:

WITH employee_data AS (
    SELECT 
        loc.Region, 
        COUNT(i.Employee_ID) AS all_employee_count,
        SUM(CASE WHEN i.Access_to_Mental_Health_Resources = 'Yes' THEN 1 ELSE 0 END) AS employee_count_with_resources
    FROM 
        location loc 
    JOIN 
        indicators i ON loc.Employee_ID = i.Employee_ID
    GROUP BY 
        loc.Region
)
SELECT 
    Region, 
    ROUND((employee_count_with_resources / all_employee_count) * 100, 2) AS percentage_of_employees
FROM 
    employee_data
ORDER BY 
    percentage_of_employees DESC;


# Share of surveyed employees experiencing mental health problems such as depression, burnout and anxiety (by work location):

WITH employees_health AS (
    SELECT 
        wd.Work_location, 
        SUM(CASE 
            WHEN i.Mental_Health_Condition = 'Anxiety' 
              OR i.Mental_Health_Condition = 'Depression' 
              OR i.Mental_Health_Condition = 'Burnout' 
            THEN 1 ELSE 0 END) AS empl_with_health_problems,
        COUNT(wd.Employee_ID) AS all_employees
    FROM 
        work_details wd
    JOIN 
        indicators i ON i.Employee_ID = wd.Employee_ID
    GROUP BY 
        wd.Work_location
)
SELECT
    wd.Work_location, 
    ROUND(empl_with_health_problems / all_employees * 100, 2) AS percentage_of_employees_with_mental_health_problems
FROM 
    employees_health eh
JOIN 
    work_details wd ON eh.Work_location = wd.Work_location
GROUP BY 
    wd.Work_location
ORDER BY 
    percentage_of_employees_with_mental_health_problems DESC;
    
    
# Share of surveyed employees experiencing mental health problems such as depression, burnout and anxiety (by region):

WITH employees_health AS (
    SELECT 
        l.Region, 
        SUM(CASE 
            WHEN i.Mental_Health_Condition = 'Anxiety' 
              OR i.Mental_Health_Condition = 'Depression' 
              OR i.Mental_Health_Condition = 'Burnout' 
            THEN 1 ELSE 0 END) AS empl_with_health_problems,
        COUNT(l.Employee_ID) AS all_employees
    FROM 
        location l
    JOIN 
        indicators i ON i.Employee_ID = l.Employee_ID
    GROUP BY 
        l.Region
)
SELECT
    l.Region, 
    ROUND(empl_with_health_problems / all_employees * 100, 2) AS percentage_of_employees_with_mental_health_problems
FROM 
    employees_health eh
JOIN 
    location l ON eh.Region = l.Region
GROUP BY 
    l.Region
ORDER BY 
    percentage_of_employees_with_mental_health_problems DESC;
    
    
# Share of surveyed employees experiencing mental health problems such as depression, burnout and anxiety (by job role):

WITH employees_health AS (
    SELECT 
        wi.Job_Role, 
        SUM(CASE 
            WHEN i.Mental_Health_Condition = 'Anxiety' 
              OR i.Mental_Health_Condition = 'Depression' 
              OR i.Mental_Health_Condition = 'Burnout' 
            THEN 1 ELSE 0 END) AS empl_with_health_problems,
        COUNT(wi.Employee_ID) AS all_employees
    FROM 
        work_info wi
    JOIN 
        indicators i ON i.Employee_ID = wi.Employee_ID
    GROUP BY 
        wi.Job_Role
)
SELECT
    wi.Job_Role, 
    ROUND(empl_with_health_problems / all_employees * 100, 2) AS percentage_of_employees_with_mental_health_problems
FROM 
    employees_health eh
JOIN 
    work_info wi ON eh.Job_Role = wi.Job_Role
GROUP BY 
    wi.Job_Role
ORDER BY 
    percentage_of_employees_with_mental_health_problems DESC;
    
    
# Share of surveyed employees experiencing mental health problems such as depression, burnout and anxiety (by job role and work location):

WITH employees_health AS (
    SELECT 
        wi.Job_Role,
        wd.Work_location,
        SUM(CASE 
            WHEN i.Mental_Health_Condition IN ('Anxiety', 'Depression', 'Burnout') 
            THEN 1 ELSE 0 END) AS empl_with_health_problems,
        COUNT(wi.Employee_ID) AS all_employees
    FROM 
        work_info wi
    JOIN 
        indicators i ON i.Employee_ID = wi.Employee_ID
    JOIN 
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    GROUP BY 
        wi.Job_Role, wd.Work_location
)
SELECT
    Job_Role,
    Work_location,
    ROUND(empl_with_health_problems / all_employees * 100, 2) AS percentage_of_employees_with_mental_health_problems
FROM 
    employees_health
ORDER BY 
    Job_Role, percentage_of_employees_with_mental_health_problems DESC;
    
    
# Share of surveyed employees experiencing mental health problems such as depression, burnout and anxiety (by gender):

WITH employees_health AS (
    SELECT 
        ei.Gender,
        SUM(CASE 
            WHEN i.Mental_Health_Condition IN ('Anxiety', 'Depression', 'Burnout') 
            THEN 1 ELSE 0 END) AS empl_with_health_problems,
        COUNT(ei.Employee_ID) AS all_employees
    FROM 
        employee_info ei
    JOIN 
        indicators i ON i.Employee_ID = ei.Employee_ID
GROUP BY 
        ei.Gender
)
SELECT
    Gender,
    ROUND(empl_with_health_problems / all_employees * 100, 2) AS percentage_of_employees_with_mental_health_problems
FROM 
    employees_health
ORDER BY 
    percentage_of_employees_with_mental_health_problems DESC;
    

# Does access to mental health resources affect health outcomes?

WITH employees_health AS (
    SELECT 
        wd.Work_location, 
        SUM(CASE 
            WHEN i.Access_to_Mental_Health_Resources = 'Yes' 
                 AND (i.Mental_Health_Condition = 'Anxiety' 
                      OR i.Mental_Health_Condition = 'Depression' 
                      OR i.Mental_Health_Condition = 'Burnout') 
            THEN 1 ELSE 0 END) AS empl_with_health_problems_with_MHR,
        SUM(CASE 
            WHEN i.Access_to_Mental_Health_Resources = 'No' 
                 AND (i.Mental_Health_Condition = 'Anxiety' 
                      OR i.Mental_Health_Condition = 'Depression' 
                      OR i.Mental_Health_Condition = 'Burnout') 
            THEN 1 ELSE 0 END) AS empl_with_health_problems_without_MHR,
        SUM(CASE 
            WHEN i.Mental_Health_Condition = 'Anxiety' 
                 OR i.Mental_Health_Condition = 'Depression' 
                 OR i.Mental_Health_Condition = 'Burnout' 
            THEN 1 ELSE 0 END) AS empl_with_health_problems
    FROM 
        work_details wd
    JOIN 
        indicators i ON i.Employee_ID = wd.Employee_ID
    GROUP BY 
        wd.Work_location
)
SELECT
    wd.Work_location, 
    ROUND(empl_with_health_problems_with_MHR / empl_with_health_problems * 100, 2) AS percentage_of_employees_with_mental_health_problems_with_MHR,
    ROUND(empl_with_health_problems_without_MHR / empl_with_health_problems * 100, 2) AS percentage_of_employees_with_mental_health_problems_without_MHR
FROM 
    employees_health eh
JOIN 
    work_details wd ON eh.Work_location = wd.Work_location
GROUP BY 
    wd.Work_location;
