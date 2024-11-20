# Average Work Life Balance Rating by region

SELECT 
    loc.Region,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    location loc
        JOIN
    indicators i ON loc.Employee_ID = i.Employee_ID
GROUP BY loc.Region
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating of the remote employees by region:

SELECT 
    loc.Region,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    location loc
        JOIN
    indicators i ON loc.Employee_ID = i.Employee_ID
        JOIN
    work_details wd ON wd.Employee_ID = i.Employee_ID
WHERE
    wd.Work_location = 'Remote'
GROUP BY loc.Region
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by industry:

SELECT 
    wi.Industry,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    work_info wi
        JOIN
    indicators i ON wi.Employee_ID = i.Employee_ID
GROUP BY wi.Industry
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by job role:

SELECT 
    wi.Job_Role,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    work_info wi
        JOIN
    indicators i ON wi.Employee_ID = i.Employee_ID
GROUP BY wi.Job_Role
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by work location:

SELECT 
    wd.Work_location,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    work_details wd
        JOIN
    indicators i ON wd.Employee_ID = i.Employee_ID
GROUP BY wd.Work_location
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by work location and job role:

SELECT 
    wd.Work_location, wi.Job_Role,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    work_info wi
        JOIN
    indicators i ON wi.Employee_ID = i.Employee_ID
    JOIN
    work_details wd ON wi.Employee_ID = wd.Employee_ID
GROUP BY wd.Work_location, wi.Job_Role
ORDER BY wd.Work_location, avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by age group:

SELECT 
    (CASE
        WHEN ei.Age <= 30 THEN '<30'
        WHEN ei.Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN ei.Age BETWEEN 41 AND 50 THEN '41-50'
        ELSE '>51'
    END) AS age_range,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    employee_info ei
        JOIN
    indicators i ON ei.Employee_ID = i.Employee_ID
GROUP BY age_range
ORDER BY avg_work_life_balance_rating DESC;


# Average Work Life Balance Rating by number of years of work experience:

SELECT 
    (CASE
        WHEN wi.Years_of_Experience <= 5 THEN '<5'
        WHEN wi.Years_of_Experience BETWEEN 6 AND 10 THEN '6-10'
        WHEN wi.Years_of_Experience BETWEEN 11 AND 20 THEN '11-20'
        WHEN wi.Years_of_Experience BETWEEN 21 AND 30 THEN '21-30'
        ELSE '>31'
    END) AS years_of_experience_range,
    AVG(i.Work_Life_Balance_Rating) AS avg_work_life_balance_rating
FROM
    work_info wi
        JOIN
    indicators i ON wi.Employee_ID = i.Employee_ID
GROUP BY years_of_experience_range
ORDER BY avg_work_life_balance_rating DESC;