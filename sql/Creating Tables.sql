USE remoteworkandhealth;
SELECT 
    *
FROM
    rem_work_health;

# Creating 6 new tables (employee_info,work_info,work_details,other_factors,indicators,location):

CREATE TABLE employee_info AS SELECT Employee_ID, Age, Gender FROM
    rem_work_health;

CREATE TABLE work_info AS SELECT Employee_ID, Job_Role, Industry, Years_of_Experience FROM
    rem_work_health;
    
CREATE TABLE work_details AS SELECT Employee_ID,
    Work_location,
    Hours_Worked_Per_Week,
    Number_of_Virtual_Meetings FROM
    rem_work_health;
    
CREATE TABLE location AS SELECT Employee_ID, Region FROM
    rem_work_health;

CREATE TABLE other_factors AS SELECT Employee_ID, Physical_Activity, Sleep_Quality FROM
    rem_work_health;

CREATE TABLE indicators AS SELECT Employee_ID,
    Work_Life_Balance_Rating,
    Stress_Level,
    Mental_Health_Condition,
    Access_to_Mental_Health_Resources,
    Productivity_Change,
    Social_Isolation_Rating,
    Satisfaction_with_Remote_Work,
    Company_Support_for_Remote_Work FROM
    rem_work_health;