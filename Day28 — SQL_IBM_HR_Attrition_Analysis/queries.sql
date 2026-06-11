select * from hr;
select round(sum(case when Attrition='Yes' then 1 else 0 end)*100/count(*),2) as attrition_rate from hr;
select Department,round(sum(case when Attrition='Yes' then 1 else 0 end)*100/count(*),2)
 as attrition_rate,round(avg(YearsAtCompany),2) as avg_years,round(avg(YearsSinceLastPromotion),2) 
 as avg_years_from_lastpromotion,round(avg(MonthlyIncome),2) as avg_income,sum(case when Attrition='Yes' then 1 else 0 end)as 
 total_left,count(*) as total_employees from hr
group by Department order by attrition_rate desc;
select JobRole, round(avg(MonthlyIncome),2) as avg_income,round(sum(case when Attrition='Yes' then 1 else 0 end)*100/count(*),2) 
as attrition_rate,round(avg(YearsAtCompany),2) as avg_years from hr group by JobRole order by attrition_rate desc;
select gender,sum(case when Attrition='Yes' then 1 else 0 end)as 
 total_left from hr group by gender order by total_left;
WITH Dept_Avg AS
(
SELECT
Department,
AVG(MonthlyIncome) AS Avg_Salary
FROM hr
GROUP BY Department
)
SELECT
h.EmployeeNumber,
h.Department,
h.MonthlyIncome,
dense_rank() over(order by h.MonthlyIncome desc) as emp_rank
FROM hr h
JOIN Dept_Avg d
ON h.Department = d.Department
WHERE h.MonthlyIncome > d.Avg_Salary;
