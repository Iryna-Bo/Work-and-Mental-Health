# Detailed Conclusions📜  

First of all, it is worth noting that I analyzed the survey sample to assess the distribution of key variables using pivot tables, charts, and statistical tests (Chi-square, Kolmogorov-Smirnov, and Coefficient of Variation) in Excel and Python.  

*Methodology and Preliminary Analysis*  
Histogram provided a visual representation of the data distribution.  
Chi-square Test helped identify significant differences between observed and expected distributions for categorical variables.  
Kolmogorov-Smirnov Test was used to check the normality of numerical data (e.g., Age).  
Coefficient of Variation offered a way to measure relative variability in the data.  

⚠️The analysis revealed an **uneven distribution of interviewed employees only by age**, with a certain preference for people older than middle age.  
The category of employees **aged 22-30** was the least represented in the survey.  
This imbalance could introduce slight errors in the following analysis.  
However, given that this analysis is for educational purposes, the quality of the survey data is not critical.  

*🔍Below is a Histogram (created in Python) illustrating the age distribution and highlighting the imbalance*  

<img src="images/Distribution%20of%20Employees%20by%20Age%20Groups.png" alt="Bar chart showing age distribution of employees, highlighting an uneven distribution with fewer younger employees" width="600"/>  

📌 For more details:  
🐍Python: *"Distribution Uniformity of Variables in the Survey Data"*  
🗄️SQL: *"Distribution of Surveyed Employees"*  
📈Excel: *"Distribution of Surveyed Employees"*  

💡 *Suggestions:* In the future, ensuring a more balanced sample, particularly across underrepresented groups (e.g., younger employees), would enhance the validity of the results.

## Key Insights from the Analysis  

### 1. Satisfaction with Remote Work  

*Satisfaction Levels by Gender:*  
-Women: **33.33%**  
-Men: **32.02%**  
-Non-binary/Prefer not to say: **27.93%** and **27.51%** respectively  

*General Trends:*  
-Satisfied Employees: **30.28%**  
-Dissatisfied Employees: **34.54%**  

*🔍The Stacked Horizontal Bar Chart "Employee Satisfaction with Remote Work by Job Role" (created in Tableau) below illustrates the proportion of Satisfaction Levels across different Job Roles, highlighting slight differences and general trends.*  

<img src="images/Employee%20Satisfaction%20with%20Remote%20Work%20by%20Job%20Role.png" alt="Employee Satisfaction with Remote Work by Job Role" width="1000" high="700"/>    


📌 For more details:  
📊Tableau: *"Satisfaction with Remote Work"*  
🗄️SQL: *"Satisfaction with Remote Work"*    


### 2. Work Life Balance  

*The best work-life balance was reported by:*  
-Employees **aged 51+** working in hybrid locations in Retail, IT, and Education.  
-Regionally, **Asia** showed the highest balance.  
⚠️However, these conclusions should be interpreted with caution due to **potential sampling errors**.    

*🔍Below is a square plot (created in Tableau) showing the Work Life Balance Rating by Work Location*    

<img src="images/Work%20Life%20Balance%20Rating%20by%20Work%20Location.png" alt="Work Life Balance Rating by Work Location" width="500"/>  

📌 For more details:  
📊Tableau: *"Work Life Balance"*    
🗄️SQL: *"Work Life Balance"*  

### 3. Working Hours  

*Highest Workload overall:*  
-Manufacturing: **40.24 hours/week**  
-Healthcare: **40.07 hours/week**  

*Lowest Workload overall:*  
-Trade: **39.15 hours/week**  

*Regional Trends:*  
-Africa: Healthcare  
-Asia: Education  
-Europe: IT  
-North America: IT  
-Oceania: Consulting  
-South America: Manufacturing  

*🔍Below is a Bubble Chart (created in Tableau) showing the Industries with highest average Working Hours per week by Region*  

<img src="images/Industries%20with%20the%20Highest%20Average%20Weekly%20Working%20Hours.png" alt="Industries with highest average working hours per week by region" width="500"/>  

📌 For more details:    
📊Tableau: *"Working Hours"*  
🗄️SQL: *"Working Hours"*  

### 4. Physical Activity  

Employees in Remote Work Locations are the most physically active, with **34.19%** exercising daily.  

💡A **weak negative correlation between physical activity and stress levels** was identified.  
*The code below calculates the Pearson Correlation Coefficient to assess the relationship between Physical Activity and Stress Levels:*  

```python
import pandas as pd
data = pd.read_excel('excel/Correlation.xlsx')
#x(Physical_Activity): 1-None, 2-Weekly, 3-Daily
x = data['column_x'].values
#y(Stress_Level): 1-Low, 2-Medium, 3-High 
y = data['column_y'].values
 
import numpy as np
correlation = np.corrcoef(x, y)[0, 1]
print("Pearson Сorrelation Сoefficient:", correlation)
Sample Output:
Pearson Сorrelation Сoefficient: -0.004530262491804627
```  

📌 For more details:  
🗄️SQL: *"Physical Activity and Sleep Quality"*  
🐍Python: *"Correlation between the variables of Physical Activity and the Level of Stress"*.  


### 5. Work and Mental Health  

*Notable patterns:*  
-On average, **76.08%** of respondents experience psychological issues.  
-Highest prevalence by work location: Onsite (**77.03%**); lowest: Remote (**75.5%**).  
-Professions most affected: Data Scientists (remote, **84.65%**); least affected: Marketers (remote, **68.42%**).  
-Gender: Men report the highest levels (**78.17%**); least affected are those who did not specify gender (**75.2%**).  
-No significant correlation was found between access to mental health resources and psychological problems. This might be because the availability of resources does not guarantee their usage.  

*🔍Below is a Butterfly Chart (created in Tableau) illustrating the relationship between Mental Health Resources and Mental Health Problems*  

<img src="images/Mental%20Health%20Resources%20and%20Mental%20Health%20Problems.png" alt="Mental Health Resources and Mental Health Problems" width="1000" high="700"/>    

📌 For more details:  
🐍Python: *"Correlation between Mental Health Condition and Access to Mental Health Resources"*  
🗄️SQL: *"Mental Health Problems and Mental Health Resources"*  
📊Tableau: *"Work and Mental Health"*  


### 6. Impact of Work Location

An analysis of work location (remote, onsite, hybrid) showed no statistically significant correlation with six key indicators: work-life balance, stress level, productivity change, social isolation, physical activity, and sleep quality.  
For this purpose I used pd.crosstab and sns.heatmap in Python.

*Notable patterns:*    
-Remote workers were more likely than hybrid and office workers to report the lowest work-life balance scores (**"1"**).  

-Hybrid workers had a higher likelihood of reporting decreased productivity. However, remote workers are not so far also.    
*🔍Below is a Heatmap (created in Python) illustrating the relationship between Work Location and Productivity Change*  

<img src="images/Work%20Location%20and%20Productivity%20Change.png" alt="Work Location and Productivity Change" width="600"/>      

📌 For more details:    
🐍Python: *"Work Location Impact Analysis"*  


## Educational Context and Future Directions    

*This project was conducted for educational purposes, demonstrating practical data analysis skills rather than striving for perfect accuracy. Despite some limitations in the data, the project successfully applied various analytical methods and visualization tools to explore survey data related to work environments and employee well-being. Key insights include varied satisfaction levels with remote work, significant differences in work-life balance across age groups and work locations, and the prevalence of psychological issues among employees. Notably, no substantial correlation was found between access to mental health resources and psychological problems, indicating that availability does not necessarily equate to utilization. Patterns observed, such as the impact of work location on reported work-life balance and productivity changes, offer interesting points for further exploration.*  

💡 Future Directions:  

**To improve the reliability and depth of future research, several considerations could be made:**  

-**Enhanced Survey Design:** Incorporate more specific questions that explore job satisfaction drivers, reasons for dissatisfaction (e.g., work environment, pay), and the use of workplace resources.  

-**Balanced Sampling:** Aim for a more diverse and representative sample to better reflect various demographic groups, particularly those underrepresented in current data.  

-**Additional Data Analysis:** Apply advanced statistical methods and machine learning algorithms to further explore complex relationships and potential causal factors within the data.  

These improvements could provide more accurate insights and make future studies more robust, contributing valuable findings for better understanding work conditions and employee well-being.
