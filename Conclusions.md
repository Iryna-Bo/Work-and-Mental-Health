# Detailed Conclusions📜  

First of all, it is worth noting that I first analyzed the sample to understand whether the distribution of surveyed employees by age, gender, region, work location, industry, and profession is even. To do this, I used charting (Histogram), as well as statistical functions (Chi-square Test, Kolmogorov-Smirnov Test for numerical data (Age), and Coefficient of Variation) in Python.

*Methodology and Preliminary Analysis*
Histogram provided a visual representation of the data distribution.
Chi-square Test helped identify significant differences between observed and expected distributions for categorical variables.
Kolmogorov-Smirnov Test was used to check the normality of numerical data (e.g., Age).
Coefficient of Variation offered a way to measure relative variability in the data.

⚠️The analysis revealed an **uneven distribution of interviewed employees only by age**, with a certain preference for people older than middle age. The category of employees aged 22-30 was the least represented in the survey. This imbalance could introduce slight errors in the following analysis. However, given that this analysis is for educational purposes, the quality of the survey data is not critical.  

*🔍A Histogram (created in Python) showing the age distribution to highlight this imbalance is below*  

<img src="images/Distribution%20of%20Employees%20by%20Age%20Groups.png" alt="Employee Distribution by Age Group" width="600"/>  

📌 For more details:  
🐍Python: "Distribution Uniformity of Variables in the Survey Data"  
🗄️SQL: "Distribution of Surveyed Employees"  
📈Excel: "Distribution of Surveyed Employees"  

💡 *Suggestions:* In the future, ensuring a more balanced sample, particularly across underrepresented groups (e.g., younger employees), would enhance the validity of the results.

## Key Insights from the Analysis  

### 1. Working Hours  

*Highest Workload overall:*  
-Manufacturing: 40.24 hours/week
-Healthcare: 40.07 hours/week  

*Lowest Workload overall:*  
-Trade: 39.15 hours/week  

*Regional Trends:*
-Africa: Healthcare
-Asia: Education
-Europe: IT
-North America: IT
-Oceania: Consulting
-South America: Manufacturing  

*🔍A Bubble Chart "Industries with highest average working hours per week by region" (created in Tableau) is below*  

<img src="images/Industries%20with%20the%20Highest%20Average%20Weekly%20Working%20Hours.png" alt="Industries with highest average working hours per week by region" width="500"/>  

📌 For more details:    
📊Tableau: "Working Hours"  
🗄️SQL: "Working Hours"  


### 2. Satisfaction with Remote Work  

*Satisfaction Levels by Gender:*  

-Women: 33.33%  
-Men: 32.02%  
-Non-binary/Prefer not to say: 27.93% and 27.51% respectively  

*General Trends:*

-Satisfied Employees: 30.28%  
-Dissatisfied Employees: 34.54%  

*🔍A Stacked Horizontal Bar Chart "Employee Satisfaction with Remote Work by Job Role" (created in Tableau) is below*  

<img src="images/Employee%20Satisfaction%20with%20Remote%20Work%20by%20Job%20Role.png" alt="Employee Satisfaction with Remote Work by Job Role" width="600" high="400"/>    


📌 For more details:  
📊Tableau: "Satisfaction with Remote Work"  
🗄️SQL: "Satisfaction with Remote Work"    


### 3. Work-Life Balance  

*The best work-life balance was reported by:*  
-Employees aged 51+ working in hybrid locations in retail, IT, and education.  
-Regionally, Asia showed the highest balance.  
⚠️However, these conclusions should be interpreted with caution due to **potential sampling errors**.    

*🔍A Square Plot "Work Life Balance Rating by Work Location" (created in Tableau) is below*    

<img src="images/Work%20Life%20Balance%20Rating%20by%20Work%20Location.png" alt="Work Life Balance Rating by Work Location" width="500"/>  

📌 For more details:  
📊Tableau: "Work Life Balance"    
🗄️SQL: "Work Life Balance"  


### 4. Physical Activity  

Employees in remote work locations are the most physically active, with 34.19% exercising daily.  

A **weak negative correlation between physical activity and stress levels** was identified (Pearson Сorrelation Сoefficient: -0.004530262491804627).  
*To check the correlation between the values ​​of physical activity and the level of stress, I used the Pearson Correlation Coefficient.*:  
The Code (created using Python Programming Language) is below  
```python
import pandas as pd
data = pd.read_excel('excel/Correlation.xlsx')
x = data['column_x'].values #x(Physical_Activity): 1-None, 2-Weekly, 3-Daily
y = data['column_y'].values #y(Stress_Level): 1-Low, 2-Medium, 3-High
import numpy as np
correlation = np.corrcoef(x, y)[0, 1]
print("Pearson Сorrelation Сoefficient:", correlation)  

📌 For more details:
🗄️SQL: "Physical Activity and Sleep Quality"  
🐍Python: "Correlation between the variables of Physical Activity and the Level of Stress".  


### 5. Mental Health  

*Notable patterns:*  
-On average, 76.08% of respondents experience psychological issues.  
-Highest prevalence by work location: Onsite (77.03%); lowest: Remote (75.5%).  
-Professions most affected: Data Scientists (remote, 84.65%); least affected: Marketers (remote, 68.42%).  
-Gender: Men report the highest levels (78.17%); least affected are those who did not specify gender (75.2%).  
-No significant correlation was found between access to mental health resources and psychological problems. This might be because the availability of resources does not guarantee their usage.  

*🔍A Butterfly Chart "Mental Health Resources and Mental Health Problems" (created in Tableau) is below*  

<img src="images/Mental%20Health%20Resources%20and%20Mental%20Health%20Problems.png" alt="Mental Health Resources and Mental Health Problems" width="1000" high="400"/>    

📌 For more details:  
🐍Python: "Correlation between Mental Health Condition and Access to Mental Health Resources"  
🗄️SQL: "Mental Health Problems and Mental Health Resources"  
📊Tableau: "Work and Mental Health"  


### 6. Impact of Work Location

An analysis of work location (remote, onsite, hybrid) showed no statistically significant correlation with six key indicators: work-life balance, stress level, productivity change, social isolation, physical activity, and sleep quality.

*Notable patterns:*    
-Remote workers were more likely than hybrid and office workers to report the lowest work-life balance scores ("1").

-Hybrid workers had a higher likelihood of reporting decreased productivity. However, remote workers are not so far also.    
*🔍A Hit Map "Work Location and Productivity Change" (created in Python) is below*  

<img src="images/Work%20Location%20and%20Productivity%20Change.png" alt="Work Location and Productivity Change" width="600"/>      

📌 For more details:    
🐍Python: "Work Location Impact Analysis"  


## Educational Context and Future Directions    

*This project was conducted for educational purposes, demonstrating practical data analysis skills rather than striving for perfect accuracy. Despite some limitations in the data, the project successfully applied various analytical methods and visualization tools.*  

💡 Improvements for Future Research:  

**Enhanced survey design: Include questions about:**  
-Factors influencing motivation and satisfaction.  
-Specific reasons for dissatisfaction (e.g., work environment, pay).  
-Access to and utilization of workplace resources.  
-Balanced sampling: Target a more diverse and representative sample across all demographics.
