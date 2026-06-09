-- 03_kpi_calculations.sql
-- KPI calculations for loan risk analytics project

-- 1. Total loan applications
SELECT
    COUNT(*) AS total_applications
FROM loan_risk_prediction_dataset;

-- 2. Total requested loan amount
SELECT
    SUM(LoanAmount) AS total_requested_loan_amount
FROM loan_risk_prediction_dataset;

-- 3. Average loan amount
SELECT
    AVG(LoanAmount) AS average_loan_amount
FROM loan_risk_prediction_dataset;

-- 4. Average income
SELECT
    AVG(Income) AS average_income
FROM loan_risk_prediction_dataset;

-- 5. Average credit score
SELECT
    AVG(CreditScore) AS average_credit_score
FROM loan_risk_prediction_dataset;

-- 6. Approval count and approval rate
SELECT
    LoanApproved,
    COUNT(*) AS application_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_share
FROM loan_risk_prediction_dataset
GROUP BY LoanApproved;

-- 7. Loan approval rate by employment type
SELECT
    EmploymentType,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) AS approved_applications,
    ROUND(
        SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate_percentage
FROM loan_risk_prediction_dataset
GROUP BY EmploymentType
ORDER BY approval_rate_percentage DESC;

-- 8. Average loan amount by education
SELECT
    Education,
    COUNT(*) AS total_applications,
    AVG(LoanAmount) AS average_loan_amount,
    AVG(CreditScore) AS average_credit_score
FROM loan_risk_prediction_dataset
GROUP BY Education
ORDER BY average_loan_amount DESC;

-- 9. High-risk applications based on low credit score
SELECT
    COUNT(*) AS high_risk_applications
FROM loan_risk_prediction_dataset
WHERE CreditScore < 600;

-- 10. Loan-to-income ratio
SELECT
    Age,
    Income,
    LoanAmount,
    CreditScore,
    ROUND(LoanAmount * 1.0 / Income, 2) AS loan_to_income_ratio,
    LoanApproved
FROM loan_risk_prediction_dataset
WHERE Income > 0;