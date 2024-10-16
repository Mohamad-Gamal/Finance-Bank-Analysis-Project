/*Total_Loan_Applications*/
select count(id) as Total_Loan_Applications from Bank_Load_Data
go
select count(id) as MTD_Total_Loan_Applications from Bank_Load_Data
where MONTH(issue_date)=12 and Year(issue_date)=2021
go
select count(id) as PMTD_Total_Loan_Applications from Bank_Load_Data
where MONTH(issue_date)=11 and Year(issue_date)=2021
go
/*Total_Funded_Amount*/
select sum(loan_amount) as Total_Funded_Amount from Bank_Load_Data
go
select sum(loan_amount) as MTD_Total_Funded_Amount from Bank_Load_Data
where MONTH(issue_date)=12 and Year(issue_date)=2021
go
select sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_Load_Data
where MONTH(issue_date)=11 and Year(issue_date)=2021
go
/*Total_Amount_Received*/
select sum(total_payment) as Total_Amount_Received from Bank_Load_Data
go
select sum(total_payment) as MTD_Total_Amount_Received from Bank_Load_Data
where MONTH(issue_date)=12 and Year(issue_date)=2021
go
select sum(total_payment) as PMTD_Total_Amount_Received from Bank_Load_Data
where MONTH(issue_date)=11 and Year(issue_date)=2021
go
/*Average_Interest_Rate*/
select round(AVG(int_rate)*100,2) as Average_Interest_Rate from Bank_Load_Data
go
select round(AVG(int_rate)*100,2) as MTD_Average_Interest_Rate from Bank_Load_Data
where MONTH(issue_date)=12 and Year(issue_date)=2021
go
select round(AVG(int_rate)*100,2) as PMTD_Average_Interest_Rate from Bank_Load_Data
where MONTH(issue_date)=11 and Year(issue_date)=2021
go
/*Average Debt-to-Income Ratio (DTI)*/
select round(AVG(dti)*100,2) as AVG_DTI from Bank_Load_Data
go
select round(AVG(dti)*100,2) as MTD_AVG_DTI from Bank_Load_Data
where MONTH(issue_date)=12 and Year(issue_date)=2021
go
select round(AVG(dti)*100,2) as PMTD_AVG_DTI from Bank_Load_Data
where MONTH(issue_date)=11 and Year(issue_date)=2021
go
/*GOOD LOAN ISSUED*/
/*Good Loan Percentage*/
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM Bank_Load_Data
go
/*Good Loan Applications*/
SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)) 
	as Good_Loan_Applications
FROM Bank_Load_Data
go
/*Good Loan Funded Amount*/
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM Bank_Load_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
go
/*Good Loan Amount Received*/
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM Bank_Load_Data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'
go
/*BAD LOAN ISSUED*/
/*Bad Loan Percentage*/
SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM Bank_Load_Data
go
/*Bad Loan Applications*/
SELECT COUNT(id) AS Bad_Loan_Applications FROM Bank_Load_Data
WHERE loan_status = 'Charged Off'
go
/*Bad Loan Funded Amount*/
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM Bank_Load_Data
WHERE loan_status = 'Charged Off'
go
/*Bad Loan Amount Received*/
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM Bank_Load_Data
WHERE loan_status = 'Charged Off'
go
/*LOAN STATUS*/
SELECT
    loan_status,
    COUNT(id) AS LoanCount,
    SUM(total_payment) AS Total_Amount_Received,
    SUM(loan_amount) AS Total_Funded_Amount,
    AVG(int_rate * 100) AS Interest_Rate,
    AVG(dti * 100) AS DTI
FROM
    Bank_Load_Data
GROUP BY
    loan_status
go
/*MTD Total Funded and Received Amount*/
SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM Bank_Load_Data
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status
go
/*BANK LOAN REPORT | OVERVIEW MONTH*/
SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)
go
/*STATE*/
SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY address_state
ORDER BY address_state
go
/*TERM*/
SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY term
ORDER BY term
go
/*EMPLOYEE LENGTH*/
SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY emp_length
ORDER BY emp_length
go
/*PURPOSE*/
SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY purpose
ORDER BY purpose
go
/*HOME OWNERSHIP*/
SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM Bank_Load_Data
GROUP BY home_ownership
ORDER BY home_ownership








