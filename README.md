# Work and Mental Health

📑 Project Overview  
This project analyzes the results of a survey of 5,000 employees from diverse regions, industries, ages, genders, and work experiences. The survey data, sourced from open platforms, investigates the relationships between various factors affecting work and mental health. The goal is to uncover correlations or prove their absence, visualize trends, and showcase different analytical tools and methods. 

💡Motivation
This project was inspired by the growing recognition of the connection between work environment, workload, and mental health. With many workers shifting to remote or hybrid setups, understanding how different work conditions affect psychological well-being has never been more important.

💾 Data Sources
Excel folder: "Impact_of_Remote_Work_on_Mental_Health"
SQL folder: "Creating Tables"

📝 Goals  
1. Analyze the impact of work location, age, gender, work experience, region, and profession on psychological health and job satisfaction.
2. Study the effect of access to health resources on mental health.
3. Examine the influence of physical activity on psychological well-being.
4. Identify and interpret significant relationships based on survey data.  
3. Visualize data and trends using SQL, Python, Excel and Tableau.

🛠️ Tools Used
SQL:
  - Aggregation Functions
  - Joins
  - Subqueries
  - Window Functions
  - CASE Statements
  - CTEs
Python:
  - Pandas, NumPy
  - Statsmodels (scipy.stats)
  - Seaborn, Matplotlib
Tableau:
  - Quick Table Calculations
  - Parameters and Calculated Fields
  - Dashboards and Stories
Excel:
  - Pivot Tables
  - Charts

📂 Files and Folders  
 🗄️ [SQL Queries](sql/README.md): Scripts for data aggregation.  
 🐍 [Python Analysis](python/README.md): Statistical analysis and visualizations.  
 📊 [Tableau Dashboards](tableau/README.md): Interactive data visualizations.  
 📈 [Excel Data](excel/README.md): Raw data, pivot tables and charts.  

🔬 Key Findings  
- **Remote Work Satisfaction:**
Remote work slightly improves satisfaction for women but shows no major impact on overall satisfaction.
Women: 33.33% satisfied with remote work; Men: 32.02%; Non-binary/Prefer not to say: ~28%.  
General satisfaction: 30.28%, dissatisfaction: 34.54%.
Details:  
📊 [Interactive Tableau Visualization](https://public.tableau.com/app/profile/iryna.boiko/viz/SatisfactionwithRemoteWork/LevelofSatisfactionbyparameters)  
📁 [Download Tableau Workbook](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/tableau/Satisfaction with Remote Work.twbx)  
🗄️ [SQL File](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/sql/Satisfaction with Remote Work.sql)
- **Work Life Balance:**
Best balance: Age 51+ in hybrid work, in retail, IT, and education (best region: Asia).
Potential bias due to sample representation.
Details:  
📊 [Interactive Tableau Visualization](https://public.tableau.com/app/profile/iryna.boiko/viz/WorkLifeBalance_17298477708680/WLB)  
📁 [Download Tableau Workbook](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/tableau/Work Life Balance.twbx)  
🗄️ [SQL File](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/sql/Work Life Balance.sql)
- **Work and Mental Health:**
76.08% of respondents reported psychological issues, with onsite employees slightly more affected (77.03%).
Access to mental health resources showed no direct correlation with mental health conditions.
Details:  
📊 [Interactive Tableau Visualization](https://public.tableau.com/app/profile/iryna.boiko/viz/WorkandMentalHealth/WorkandMentalHealth)  
📁 [Download Tableau Workbook](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/tableau/Work and Mental Health.twbx)  
🗄️ [SQL File](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/sql/Mental Health Problems and Mental Health Resources.sql)
🐍 [Python](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/python/Correlation between the variables ​​of Mental Health Condition and Access to Mental Health Resources.ipynb)
- **Working Hours:**
- Workers in healthcare report the highest working hours in Africa, while IT professionals work the most in Europe and North America. The manufacturing sector has the highest global average of weekly working hours (40.24), with South America leading at 41.82 hours. In contrast, Europe’s IT sector has the lowest average (40.20), emphasizing work-life balance and efficiency.
- Details:  
📊 [Interactive Tableau Visualization](https://public.tableau.com/app/profile/iryna.boiko/viz/WorkingHours_17316627781430/avg_work_h)  
📁 [Download Tableau Workbook](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/tableau/Working Hours.twbx)  
🗄️ [SQL File](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/sql/Working Hours.sql)
- **Physical Activity:**
Remote workers are the most active: 34.19% exercise daily.
Weak negative correlation between physical activity and stress levels.
Details:  
🗄️ [SQL File](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/sql/Physical Activity and Sleep Quality.sql)
🐍 [Python](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/python/Correlation between the variables ​​of Physical Activity and the Level of Stress.ipynb)
- **Impact of Work Location:** 
No significant correlation between work location and indicators like work-life balance rating, stress level, productivity change, social isolation, physical activity, and sleep quality.
Details:  
🐍 [Python](https://github.com/Iryna-Bo/Work-and-Mental-Health/tree/main/python/Work Location Impact Analysis.ipynb)

🧮 For the full report, read the [Detailed Conclusions](Conclusions.md).  

🌍 Broader Implications
This research, while limited in scope, provides actionable insights for employers and policymakers:
Workplace Policies: Use the findings to shape flexible work arrangements, mental health support programs, and workload planning tailored to regional and sector-specific needs.
Future Research: Address gaps such as the underrepresentation of certain demographic groups to obtain more accurate results.
For a detailed view of the methodology and analysis, refer to the respective files in the Python, SQL, Excel and Tableau folders:
## How to Access
📂 [GitHub Repository](https://github.com/Iryna-Bo/Work-and-Mental-Health)
🌐 [Tableau Visualization](https://public.tableau.com/app/profile/iryna.boiko/vizzes)
