# Detailed Conclusions📜  

First of all, it is worth noting that I first analyzed the sample to understand whether the distribution of surveyed employees by age, gender, region, work location, industry, and profession is even. To do this, I used charting (Histogram), as well as statistical functions (Chi-square Test, Kolmogorov-Smirnov Test for numerical data (Age), and Coefficient of Variation) in Python.

*Methodology and Preliminary Analysis*
Histogram provided a visual representation of the data distribution.
Chi-square Test helped identify significant differences between observed and expected distributions for categorical variables.
Kolmogorov-Smirnov Test was used to check the normality of numerical data (e.g., Age).
Coefficient of Variation offered a way to measure relative variability in the data.

⚠️The analysis revealed an <u>uneven distribution of interviewed employees only by age</u>, with a certain preference for people older than middle age. The category of employees aged 22-30 was the least represented in the survey. This imbalance could introduce slight errors in the following analysis. However, given that this analysis is for educational purposes, the quality of the survey data is not critical.  

*🔍A histogram (created in Python) showing the age distribution to highlight this imbalance is below*  
<img src="images/Distribution%20of%20Employees%20by%20Age%20Groups.png" alt="Employee Distribution by Age Group" width="600"/>  

📌 For more details:  
🐍Python: "Distribution Uniformity of Variables in the Survey Data"  
🗄️SQL: "Distribution of Surveyed Employees"  
📈Excel: "Distribution of Surveyed Employees"  

💡 Suggestions: In the future, ensuring a more balanced sample, particularly across underrepresented groups (e.g., younger employees), would enhance the validity of the results.

## Key Insights from the Analysis  

### <u>1. Working Hours</u>  

*Highest Workload:*  
Manufacturing: 40.24 hours/week
Healthcare: 40.07 hours/week  

*Lowest Workload:*
Trade: 39.15 hours/week  

*Regional Trends:*
-Africa: Healthcare
-Asia: Education
-Europe: IT
-North America: IT
-Oceania: Consulting
-South America: Manufacturing  

🔍A visualisation (created in Tableau) is below  
<img src="images/Industries%20with%20the%20Highest%20Average%20Weekly%20Working%20Hours.png" alt="Industries with highest average working hours per week by region" width="600"/>  

📌 For more details:  
📊Tableau: "Working Hours"  
🗄️SQL: "Working Hours"  

### 2. Satisfaction with Remote Work  

*Satisfaction Levels by Gender:*  

Women: 33.33%
Men: 32.02%
Non-binary/Prefer not to say: 27.93% and 27.51% respectively
General Trends:

Satisfied Employees: 30.28%  
Dissatisfied Employees: 34.54%  

📌 For more details:  
📊Tableau: "Satisfaction with Remote Work"  
🗄️SQL: "Satisfaction with Remote Work"    

### 3. Work-Life Balance
The best work-life balance was reported by:

Employees aged 51+ working in hybrid locations in retail, IT, and education.
Regionally, Asia showed the highest balance.
However, these conclusions should be interpreted with caution due to potential sampling errors.  

📌 For more details:

📊Tableau: "Work Life Balance"
🗄️SQL: "Work Life Balance"  

### 4. Physical Activity
Employees in remote work locations are the most physically active, with 34.19% exercising daily. A weak negative correlation between physical activity and stress levels was identified.  

📌 For more details:

🗄️SQL: "Physical Activity and Sleep Quality"
🐍Python: "Correlation between the variables of Physical Activity and the Level of Stress".  

### 5. Mental Health
On average, 76.08% of respondents experience psychological issues.
Highest prevalence by work location: Onsite (77.03%); lowest: Remote (75.5%).
Professions most affected: Data Scientists (remote, 84.65%); least affected: Marketers (remote, 68.42%).
Gender: Men report the highest levels (78.17%); least affected are those who did not specify gender (75.2%).
No significant correlation was found between access to mental health resources and psychological problems. This might be because the availability of resources does not guarantee their usage.  

📌 For more details:

🐍Python: "Correlation between Mental Health Condition and Access to Mental Health Resources"
🗄️SQL: "Mental Health Problems and Mental Health Resources"
📊Tableau: "Work and Mental Health"  

### 6. Impact of Work Location
An analysis of work location (remote, onsite, hybrid) showed no statistically significant correlation with six key indicators: work-life balance, stress level, productivity change, social isolation, physical activity, and sleep quality.

Notable patterns:

Remote workers reported the lowest work-life balance scores ('1').
Hybrid workers had a higher likelihood of reporting decreased productivity.  

📌 For more details:  
🐍Python: "Work Location Impact Analysis"

## Educational Context and Future Directions  

This project was conducted for educational purposes, demonstrating practical data analysis skills rather than striving for perfect accuracy. Despite some limitations in the data, the project successfully applied various analytical methods and visualization tools.

💡 Improvements for Future Research:

*Enhanced survey design: Include questions about:*
Factors influencing motivation and satisfaction.
Specific reasons for dissatisfaction (e.g., work environment, pay).
Access to and utilization of workplace resources.
Balanced sampling: Target a more diverse and representative sample across all demographics.
