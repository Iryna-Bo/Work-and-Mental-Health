# Distribution of surveyed employees by region:
    
    SELECT 
    loc.Region,
    COUNT(loc.Employee_ID) AS number_of_employees
FROM
    location loc
GROUP BY loc.Region
ORDER BY loc.Region;
    
    # Distribution of surveyed employees by region and work location:

SELECT 
    loc.Region,
    wd.Work_location,
    COUNT(loc.Employee_ID) AS number_of_employees
FROM
    location loc
        JOIN
    work_details wd ON loc.Employee_ID = wd.Employee_ID
GROUP BY loc.Region , wd.Work_location
ORDER BY loc.Region;


    # Distribution of surveyed employees by age:

SELECT 
    Age, count(Employee_ID) AS number_of_employees
FROM
    employee_info
GROUP BY Age
ORDER BY number_of_employees desc;

# Distribution of surveyed employees by age group:

SELECT 
    (CASE
        WHEN Age < 31 THEN '<31'
        WHEN Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '>51'
    END) AS age_group,
    COUNT(Employee_ID) AS number_of_employees
FROM
    employee_info
GROUP BY age_group
ORDER BY number_of_employees DESC;

# Distribution of surveyed employees by age group and region:

SELECT 
    l.Region,
    (CASE
        WHEN ei.Age < 31 THEN '<31'
        WHEN ei.Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN ei.Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '>51'
    END) AS age_group,
    COUNT(ei.Employee_ID) AS number_of_employees
FROM
    employee_info ei
        JOIN
    location l ON ei.Employee_ID = l.Employee_ID
GROUP BY l.Region , age_group
ORDER BY number_of_employees DESC;


# Distribution of surveyed employees by gender and region:

SELECT 
    l.Region,
    ei.Gender,
    COUNT(ei.Employee_ID) AS number_of_employees
FROM
    employee_info ei
        JOIN
    location l ON ei.Employee_ID = l.Employee_ID
GROUP BY l.Region , ei.Gender
ORDER BY number_of_employees DESC;


# Percentage of employees with remote work by region:

WITH employees_data AS (
    SELECT 
        loc.Region, 
        COUNT(wd.Employee_ID) AS total_employees,
        SUM(CASE 
            WHEN wd.Work_location = 'Remote' THEN 1 
            ELSE 0 
        END) AS remote_employees
    FROM 
        location loc
    JOIN 
        work_details wd 
        ON loc.Employee_ID = wd.Employee_ID
    GROUP BY 
        loc.Region
)
SELECT 
    Region, 
    ROUND((remote_employees / total_employees) * 100, 2) AS remote_work_employees_percentage
FROM 
    employees_data
ORDER BY 
    remote_work_employees_percentage DESC;


# Percentage of employees with remote work by industry:

WITH employees_data AS (
    SELECT 
        wi.Industry, 
        COUNT(wd.Employee_ID) AS total_employees,
        SUM(CASE 
            WHEN wd.Work_location = 'Remote' THEN 1 
            ELSE 0 
        END) AS remote_employees
    FROM 
        work_info wi
    JOIN 
        work_details wd 
        ON wi.Employee_ID = wd.Employee_ID
    GROUP BY 
        wi.Industry
)
SELECT 
    Industry, 
    ROUND((remote_employees / total_employees) * 100, 2) AS remote_work_employees_percentage
FROM 
    employees_data
ORDER BY 
    remote_work_employees_percentage DESC;


# Percentage of employees with remote work by region and industry:

WITH industry_data AS (
    SELECT 
        l.Region,
        SUM(CASE 
            WHEN wi.Industry = 'IT' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS IT_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'IT' THEN 1 ELSE 0 END) AS IT_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Consulting' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Consulting_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Consulting' THEN 1 ELSE 0 END) AS Consulting_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Education' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Education_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Education' THEN 1 ELSE 0 END) AS Education_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Finance' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Finance_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Finance' THEN 1 ELSE 0 END) AS Finance_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Healthcare' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Healthcare_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Healthcare' THEN 1 ELSE 0 END) AS Healthcare_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Manufacturing' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Manufacturing_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Manufacturing' THEN 1 ELSE 0 END) AS Manufacturing_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Retail' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Retail_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'Retail' THEN 1 ELSE 0 END) AS Retail_employees
    FROM 
        work_info wi
    JOIN 
        location l ON wi.Employee_ID = l.Employee_ID
    JOIN 
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    GROUP BY 
        l.Region
)
SELECT 
    Region,
    ROUND((IT_remote_employees / NULLIF(IT_employees, 0)) * 100, 2) AS IT_remote_employees_percentage,
    ROUND((Consulting_remote_employees / NULLIF(Consulting_employees, 0)) * 100, 2) AS Consulting_remote_employees_percentage,
    ROUND((Education_remote_employees / NULLIF(Education_employees, 0)) * 100, 2) AS Education_remote_employees_percentage,
    ROUND((Finance_remote_employees / NULLIF(Finance_employees, 0)) * 100, 2) AS Finance_remote_employees_percentage,
    ROUND((Healthcare_remote_employees / NULLIF(Healthcare_employees, 0)) * 100, 2) AS Healthcare_remote_employees_percentage,
    ROUND((Manufacturing_remote_employees / NULLIF(Manufacturing_employees, 0)) * 100, 2) AS Manufacturing_remote_employees_percentage,
    ROUND((Retail_remote_employees / NULLIF(Retail_employees, 0)) * 100, 2) AS Retail_remote_employees_percentage
FROM 
    industry_data
ORDER BY 
    Region;
    
    
 # Percentage of IT-employees, who work remotely, by region:

WITH IT_data AS (
    SELECT 
        l.Region, 
        SUM(CASE 
            WHEN wi.Industry = 'IT' AND wd.Work_Location = 'Remote' THEN 1 
            ELSE 0 
        END) AS IT_remote_employees,
        SUM(CASE 
            WHEN wi.Industry = 'IT' THEN 1 
            ELSE 0 
        END) AS IT_employees
    FROM 
        work_info wi
    JOIN 
        location l 
        ON wi.Employee_ID = l.Employee_ID
    JOIN 
        work_details wd 
        ON wi.Employee_ID = wd.Employee_ID
    GROUP BY 
        l.Region
)
SELECT 
    l.Region, 
    ROUND((id.IT_remote_employees / id.IT_employees) * 100, 2) AS IT_remote_employees_percentage
FROM 
    IT_data id
JOIN 
    location l 
    ON id.Region = l.Region
GROUP BY 
    l.Region
ORDER BY 
    IT_remote_employees_percentage DESC;
    
    
    # Percentage of employees by region, work location and industry:
    
    WITH industry_data AS (
    SELECT 
        l.Region,
        -- IT Industry
        SUM(CASE WHEN wi.Industry = 'IT' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS IT_remote_employees,
        SUM(CASE WHEN wi.Industry = 'IT' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS IT_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'IT' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS IT_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'IT' THEN 1 ELSE 0 END) AS IT_employees,
        
        -- Consulting Industry
        SUM(CASE WHEN wi.Industry = 'Consulting' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Consulting_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Consulting' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Consulting_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Consulting' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Consulting_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Consulting' THEN 1 ELSE 0 END) AS Consulting_employees,

        -- Education Industry
        SUM(CASE WHEN wi.Industry = 'Education' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Education_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Education' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Education_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Education' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Education_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Education' THEN 1 ELSE 0 END) AS Education_employees,

        -- Finance Industry
        SUM(CASE WHEN wi.Industry = 'Finance' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Finance_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Finance' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Finance_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Finance' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Finance_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Finance' THEN 1 ELSE 0 END) AS Finance_employees,

        -- Healthcare Industry
        SUM(CASE WHEN wi.Industry = 'Healthcare' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Healthcare_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Healthcare' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Healthcare_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Healthcare' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Healthcare_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Healthcare' THEN 1 ELSE 0 END) AS Healthcare_employees,

        -- Manufacturing Industry
        SUM(CASE WHEN wi.Industry = 'Manufacturing' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Manufacturing_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Manufacturing' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Manufacturing_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Manufacturing' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Manufacturing_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Manufacturing' THEN 1 ELSE 0 END) AS Manufacturing_employees,

        -- Retail Industry
        SUM(CASE WHEN wi.Industry = 'Retail' AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS Retail_remote_employees,
        SUM(CASE WHEN wi.Industry = 'Retail' AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS Retail_onsite_employees,
        SUM(CASE WHEN wi.Industry = 'Retail' AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS Retail_hybrid_employees,
        SUM(CASE WHEN wi.Industry = 'Retail' THEN 1 ELSE 0 END) AS Retail_employees
    FROM 
        work_info wi
    JOIN 
        location l ON wi.Employee_ID = l.Employee_ID
    JOIN 
        work_details wd ON wi.Employee_ID = wd.Employee_ID
    GROUP BY 
        l.Region
)
SELECT 
    Region,
    -- IT Industry Percentages
    ROUND((IT_remote_employees / NULLIF(IT_employees, 0)) * 100, 2) AS IT_remote_percentage,
    ROUND((IT_onsite_employees / NULLIF(IT_employees, 0)) * 100, 2) AS IT_onsite_percentage,
    ROUND((IT_hybrid_employees / NULLIF(IT_employees, 0)) * 100, 2) AS IT_hybrid_percentage,

    -- Consulting Industry Percentages
    ROUND((Consulting_remote_employees / NULLIF(Consulting_employees, 0)) * 100, 2) AS Consulting_remote_percentage,
    ROUND((Consulting_onsite_employees / NULLIF(Consulting_employees, 0)) * 100, 2) AS Consulting_onsite_percentage,
    ROUND((Consulting_hybrid_employees / NULLIF(Consulting_employees, 0)) * 100, 2) AS Consulting_hybrid_percentage,

    -- Education Industry Percentages
    ROUND((Education_remote_employees / NULLIF(Education_employees, 0)) * 100, 2) AS Education_remote_percentage,
    ROUND((Education_onsite_employees / NULLIF(Education_employees, 0)) * 100, 2) AS Education_onsite_percentage,
    ROUND((Education_hybrid_employees / NULLIF(Education_employees, 0)) * 100, 2) AS Education_hybrid_percentage,

    -- Finance Industry Percentages
    ROUND((Finance_remote_employees / NULLIF(Finance_employees, 0)) * 100, 2) AS Finance_remote_percentage,
    ROUND((Finance_onsite_employees / NULLIF(Finance_employees, 0)) * 100, 2) AS Finance_onsite_percentage,
    ROUND((Finance_hybrid_employees / NULLIF(Finance_employees, 0)) * 100, 2) AS Finance_hybrid_percentage,

    -- Healthcare Industry Percentages
    ROUND((Healthcare_remote_employees / NULLIF(Healthcare_employees, 0)) * 100, 2) AS Healthcare_remote_percentage,
    ROUND((Healthcare_onsite_employees / NULLIF(Healthcare_employees, 0)) * 100, 2) AS Healthcare_onsite_percentage,
    ROUND((Healthcare_hybrid_employees / NULLIF(Healthcare_employees, 0)) * 100, 2) AS Healthcare_hybrid_percentage,

    -- Manufacturing Industry Percentages
    ROUND((Manufacturing_remote_employees / NULLIF(Manufacturing_employees, 0)) * 100, 2) AS Manufacturing_remote_percentage,
    ROUND((Manufacturing_onsite_employees / NULLIF(Manufacturing_employees, 0)) * 100, 2) AS Manufacturing_onsite_percentage,
    ROUND((Manufacturing_hybrid_employees / NULLIF(Manufacturing_employees, 0)) * 100, 2) AS Manufacturing_hybrid_percentage,

    -- Retail Industry Percentages
    ROUND((Retail_remote_employees / NULLIF(Retail_employees, 0)) * 100, 2) AS Retail_remote_percentage,
    ROUND((Retail_onsite_employees / NULLIF(Retail_employees, 0)) * 100, 2) AS Retail_onsite_percentage,
    ROUND((Retail_hybrid_employees / NULLIF(Retail_employees, 0)) * 100, 2) AS Retail_hybrid_percentage

FROM 
    industry_data
ORDER BY 
    Region;
    
    # Percentage of employees by region, work location and age group:

WITH industry_data AS (
    SELECT 
        l.Region,
        -- Age under 30 years
        SUM(CASE WHEN ei.Age <= 30 AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS remote_employees_under_30,
        SUM(CASE WHEN ei.Age <= 30 AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS onsite_employees_under_30,
        SUM(CASE WHEN ei.Age <= 30 AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS hybrid_employees_under_30,
        SUM(CASE WHEN ei.Age <= 30 THEN 1 ELSE 0 END) AS employees_under_30,
        
        -- Age 31 to 40
        SUM(CASE WHEN ei.Age BETWEEN 31 AND 40 AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS remote_employees_31_to_40,
        SUM(CASE WHEN ei.Age BETWEEN 31 AND 40 AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS onsite_employees_31_to_40,
        SUM(CASE WHEN ei.Age BETWEEN 31 AND 40 AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS hybrid_employees_31_to_40,
        SUM(CASE WHEN ei.Age BETWEEN 31 AND 40 THEN 1 ELSE 0 END) AS employees_31_to_40,

        -- Age 41 to 50
        SUM(CASE WHEN ei.Age BETWEEN 41 AND 50 AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS remote_employees_41_to_50,
        SUM(CASE WHEN ei.Age BETWEEN 41 AND 50 AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS onsite_employees_41_to_50,
        SUM(CASE WHEN ei.Age BETWEEN 41 AND 50 AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS hybrid_employees_41_to_50,
        SUM(CASE WHEN ei.Age BETWEEN 41 AND 50 THEN 1 ELSE 0 END) AS employees_41_to_50,

        -- Age 51 plus
        SUM(CASE WHEN ei.Age > 51 AND wd.Work_Location = 'Remote' THEN 1 ELSE 0 END) AS remote_employees_51_plus,
        SUM(CASE WHEN ei.Age > 51 AND wd.Work_Location = 'Onsite' THEN 1 ELSE 0 END) AS onsite_employees_51_plus,
        SUM(CASE WHEN ei.Age > 51 AND wd.Work_Location = 'Hybrid' THEN 1 ELSE 0 END) AS hybrid_employees_51_plus,
        SUM(CASE WHEN ei.Age > 51 THEN 1 ELSE 0 END) AS employees_51_plus
    FROM 
        employee_info ei
    JOIN 
        location l ON ei.Employee_ID = l.Employee_ID
    JOIN 
        work_details wd ON ei.Employee_ID = wd.Employee_ID
    GROUP BY 
        l.Region
)
SELECT 
    Region,
    -- Age under 30 years Percentages
    ROUND((remote_employees_under_30 / NULLIF(employees_under_30, 0)) * 100, 2) AS remote_percentage_under_30,
    ROUND((onsite_employees_under_30 / NULLIF(employees_under_30, 0)) * 100, 2) AS onsite_percentage_under_30,
    ROUND((hybrid_employees_under_30 / NULLIF(employees_under_30, 0)) * 100, 2) AS hybrid_percentage_under_30,

    -- Age 31 to 40 Percentages
    ROUND((remote_employees_31_to_40 / NULLIF(employees_31_to_40, 0)) * 100, 2) AS remote_percentage_31_to_40,
    ROUND((onsite_employees_31_to_40 / NULLIF(employees_31_to_40, 0)) * 100, 2) AS onsite_percentage_31_to_40,
    ROUND((hybrid_employees_31_to_40 / NULLIF(employees_31_to_40, 0)) * 100, 2) AS hybrid_percentage_31_to_40,

    -- Age 41 to 50 Percentages
    ROUND((remote_employees_41_to_50 / NULLIF(employees_41_to_50, 0)) * 100, 2) AS remote_percentage_41_to_50,
    ROUND((onsite_employees_41_to_50 / NULLIF(employees_41_to_50, 0)) * 100, 2) AS onsite_percentage_41_to_50,
    ROUND((hybrid_employees_41_to_50 / NULLIF(employees_41_to_50, 0)) * 100, 2) AS hybrid_percentage_41_to_50,

    -- Age 51 plus Percentages
    ROUND((remote_employees_51_plus / NULLIF(employees_51_plus, 0)) * 100, 2) AS remote_percentage_51_plus,
    ROUND((onsite_employees_51_plus / NULLIF(employees_51_plus, 0)) * 100, 2) AS onsite_percentage_51_plus,
    ROUND((hybrid_employees_51_plus / NULLIF(employees_51_plus, 0)) * 100, 2) AS hybrid_percentage_51_plus

FROM 
    industry_data
ORDER BY 
    Region;