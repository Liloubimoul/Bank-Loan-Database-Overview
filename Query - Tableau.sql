SELECT * 
FROM financial_loan

-- 1) Total Loan Applications

SELECT COUNT(ID) AS Total_Loan_Applications
FROM financial_loan

--2) MTD Loan Applications

SELECT COUNT(ID) AS MTD_Total_Loan_Applications
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

--3) PMTD Loan Applications

SELECT COUNT(id) AS PMTD_Total_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11

--4) Total Funded Amount

SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan

--5) MTD Total Funded Amount 

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021 

--6) PMTD Total Funded Amount

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

--7) Total Amount Received 

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan

--8) MTD Total Amount Received

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 12

--9) PMTD Total Amount Received

SELECT SUM(total_payment) AS Total_Amount_Collected FROM financial_loan
WHERE MONTH(issue_date) = 11

--10) Average Interest 

SELECT AVG(int_rate)*100 AS Avg_Int_Rate FROM financial_loan

--11) MTD Average Interest 

SELECT AVG(int_rate)*100 AS MTD_Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date) = 12

--12) PMTD Average Interest

SELECT AVG(int_rate)*100 AS PMTD_Avg_Int_Rate FROM financial_loan
WHERE MONTH(issue_date) = 11

--13) AVG DTI 

SELECT AVG(dti)*100 AS Avg_DTI FROM financial_loan

--14) MTD AVG DTI

SELECT AVG(dti)*100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12

--15) PMTD avg DTI

SELECT AVG(dti)*100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11

--16) Good Loan Percentage 

SELECT
    (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100.0) / 
	COUNT(id) AS Good_Loan_Percentage
FROM financial_loan

--17) Good Loan Application

SELECT COUNT(id) AS Good_Loan_Applications FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--18) Good Loan Funded Amount

SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--19) Good Loan Amount Received 

SELECT SUM(total_payment) AS Good_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

--20) Bad Loan Percentage

SELECT
    (COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage
FROM financial_loan

--21) Bad Loan Applications

SELECT COUNT(id) AS Bad_Loan_Applications FROM financial_loan
WHERE loan_status = 'Charged Off'

--22) Bad Loan Funded Amount

SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM financial_loan
WHERE loan_status = 'Charged Off'

--23) Bad Loan Amount Received 

SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM financial_loan
WHERE loan_status = 'Charged Off'

--25) LOAN STATUS

SELECT
        loan_status,
        COUNT(id) AS LoanCount,
        SUM(total_payment) AS Total_Amount_Received,
        SUM(loan_amount) AS Total_Funded_Amount,
        AVG(int_rate * 100) AS Interest_Rate,
        AVG(dti * 100) AS DTI
    FROM
        financial_loan
    GROUP BY
        loan_status

--26) LOAN STATUS

SELECT 
	loan_status, 
	SUM(total_payment) AS MTD_Total_Amount_Received, 
	SUM(loan_amount) AS MTD_Total_Funded_Amount 
FROM financial_loan
WHERE MONTH(issue_date) = 12 
GROUP BY loan_status

--27) Bank Loan Report - Overview - Month

SELECT 
	MONTH(issue_date) AS Month_Munber, 
	DATENAME(MONTH, issue_date) AS Month_name, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH(issue_date)

--28) Bank Loan Report - State 

SELECT 
	address_state AS State, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY address_state
ORDER BY address_state

--29) Bank Loan Report - Term 

SELECT 
	term AS Term, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY term
ORDER BY term

--30) Bank Report - Employee Lenght 

SELECT 
	emp_length AS Employee_Length, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

--31) Bank Report - Purpose

SELECT 
	purpose AS PURPOSE, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

--32) Bank Report - Home Ownership 

SELECT 
	home_ownership AS Home_Ownership, 
	COUNT(id) AS Total_Loan_Applications,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Amount_Received
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership




