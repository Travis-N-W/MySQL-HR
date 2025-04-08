# HR Data Analysis Project – MySQL & Power BI

## 📸 Project Screenshots
Click [here](https://github.com/Travis-N-W/MySQL-HR/tree/main/screenshots) to view all screenshots.

## Brief Objective 

Conducted end-to-end data analysis on a sample HR dataset using MySQL and Power BI. The project involved comprehensive data cleaning and preprocessing, including standardizing date formats, converting text fields to appropriate data types, and resolving data inconsistencies. Developed SQL queries based on a set of business-related questions to extract actionable insights. Designed and built an interactive Power BI dashboard to visualize key HR metrics such as employee distribution, tenure, attrition rates, and departmental performance, enabling data-driven decision-making.

## Skills Learned

- Data cleaning and preprocessing  
- SQL querying and data extraction  
- Converting and formatting data types  
- Problem-solving using data-driven questions  
- Data visualization in Power BI  

## Data Used

- Data - HR Data with over 22000 rows from the year 2000 to 2020  
- MySQL Workbench - Data Cleaning & Analysis  
- Power BI - Data Visualization  

## Questions

- What is the gender breakdown of employees in the company?  
- What is the race/ethnicity breakdown of employees in the company?  
- What is the age distribution of employees in the company?  
- How many employees work at headquarters versus remote locations?  
- What is the average length of employment for employees who have been terminated?  
- How does the gender distribution vary across departments and job titles?  
- What is the distribution of job titles across the company?  
- Which department has the highest turnover rate?  
- What is the distribution of employees across locations by state?  
- How has the company's employee count changed over time based on hire and term dates?  
- What is the tenure distribution for each department?  

## HR Dashboard
![Screenshot 2025-04-07 204242](https://github.com/user-attachments/assets/328f9be3-2fdc-4739-a033-c698450397bd)

![Screenshot 2025-04-07 205913](https://github.com/user-attachments/assets/2b7d2cc8-384c-4967-a086-f942c17aa0b1)

## Summary of Findings

- The workforce has a higher representation of male employees.  
- The majority of employees identify as White, while Native Hawaiian and American Indian groups are the least represented.  
- Employee ages range from 22 to 59 years old.  
- Employees were categorized into five age groups (18–24, 25–34, 35–44, 45–54, 55–64); the 25–34 and 35–44 groups represent the largest segments, while the 55–64 group is the smallest.  
- A significant portion of the workforce is based at the headquarters, with fewer employees working remotely.  
- The average tenure of terminated employees is approximately 8 years.  
- Gender distribution is relatively balanced across departments, though males slightly outnumber females overall.  
- The Auditing department exhibits the highest turnover rate, followed by the Legal department. Departments such as Marketing, Business Development, and Product Management have the lowest turnover rates.  
- The highest concentration of employees is located in the state of Ohio.  
- Net employee count has shown a positive trend, with an overall increase over recent years.  
- The average tenure across departments is around 8 years, with Marketing and Sales showing the highest tenure, and Legal and Product Management reflecting the lowest.  

## Data Limitations

- Records with negative age values (967 entries) were excluded from the analysis; only data for individuals aged 18 and above were considered.  
- Termination dates that were unrealistically far in the future (1599 entries) were omitted; only termination dates up to the current date were included in the analysis.  
