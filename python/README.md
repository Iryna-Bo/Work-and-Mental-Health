# Python Analysis

Insights into Work Patterns and Well-being.  
This section contains Jupyter Notebooks that provide detailed analysis and visualizations using Python. The analyses explore relationships between physical activity, sleep quality, stress levels, and mental health, examining their correlation with work locations and demographics.

## Files  
- `Correlation between the variables of Mental Health Condition and Access to Mental Health Resources.ipynb`: Investigates the correlation between mental health conditions and access to mental health resources among employees.  
- `Correlation between the variables of Physical Activity and the Level of Stress.ipynb`: Examines the relationship between physical activity levels and stress levels, identifying potential patterns in the data.   
- `Distribution Uniformity of Variables in the survey data.ipynb`: Analyzes the distribution of survey data variables, assessing uniformity and potential biases within the dataset.  
- `Work Location Impact Analysis.ipynb`: Analyzes the impact of work location (remote, onsite, hybrid) on various indicators, such as work-life balance, productivity, and stress levels.  

## Example   
*A Box-plot of Employee Age and Kolmogorov-Smirnov test (Age Distribution)*
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
file_path='C:/Users/oneli/Portfolio/Impact_of_Remote_Work_on_Mental_Health.xlsx'
data=pd.read_excel(file_path)
sns.boxplot(x=data['Age'])
plt.title('Boxplot of Employee Age')
plt.xlabel('Age')
plt.figure(figsize=(1, 1))
plt.show()

from scipy.stats import kstest
import numpy as np
age_values = data['Age']
uniform_dist = np.random.uniform(min(age_values), max(age_values), size=len(age_values))
ks_stat, p_value = kstest(age_values, uniform_dist)

print(f"KS statistic: {ks_stat}, p-value: {p_value}")
if p_value < 0.05:
    print("We reject the null hypothesis, indicating that the data do not follow a uniform distribution.")
else:
    print("We cannot reject the null hypothesis, suggesting that the data may follow a uniform distribution.")
