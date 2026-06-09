-- 04_risk_analysis.sql
-- Risk segmentation and early warning signal analysis

-- 1. Create basic risk bands based on credit score
SELECT
    Age,
    Income,
    LoanAmount,
    CreditScore,
    EmploymentType,
    Education,
    City,
    LoanApproved,
    CASE
        WHEN CreditScore < 580 THEN 'High Risk'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Medium Risk'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Low Risk'
        ELSE 'Very Low Risk'
    END AS credit_risk_band
FROM loan_risk_prediction_dataset;

-- 2. Count applications by risk band
SELECT
    CASE
        WHEN CreditScore < 580 THEN 'High Risk'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Medium Risk'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Low Risk'
        ELSE 'Very Low Risk'
    END AS credit_risk_band,
    COUNT(*) AS application_count
FROM loan_risk_prediction_dataset
GROUP BY
    CASE
        WHEN CreditScore < 580 THEN 'High Risk'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Medium Risk'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Low Risk'
        ELSE 'Very Low Risk'
    END
ORDER BY application_count DESC;

-- 3. Approval rate by risk band
SELECT
    CASE
        WHEN CreditScore < 580 THEN 'High Risk'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Medium Risk'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Low Risk'
        ELSE 'Very Low Risk'
    END AS credit_risk_band,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) AS approved_count,
    ROUND(
        SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate_percentage
FROM loan_risk_prediction_dataset
GROUP BY
    CASE
        WHEN CreditScore < 580 THEN 'High Risk'
        WHEN CreditScore BETWEEN 580 AND 669 THEN 'Medium Risk'
        WHEN CreditScore BETWEEN 670 AND 739 THEN 'Low Risk'
        ELSE 'Very Low Risk'
    END
ORDER BY approval_rate_percentage DESC;

-- 4. Loan-to-income risk flag
SELECT
    Age,
    Income,
    LoanAmount,
    CreditScore,
    ROUND(LoanAmount * 1.0 / Income, 2) AS loan_to_income_ratio,
    CASE
        WHEN Income = 0 THEN 'Review'
        WHEN LoanAmount * 1.0 / Income > 0.5 THEN 'High Exposure'
        WHEN LoanAmount * 1.0 / Income BETWEEN 0.3 AND 0.5 THEN 'Medium Exposure'
        ELSE 'Low Exposure'
    END AS exposure_risk_flag,
    LoanApproved
FROM loan_risk_prediction_dataset
WHERE Income > 0;

-- 5. High-risk applications for review
SELECT
    *
FROM loan_risk_prediction_dataset
WHERE CreditScore < 600
   OR LoanAmount * 1.0 / Income > 0.5;

-- 6. Average loan amount by city
SELECT
    City,
    COUNT(*) AS total_applications,
    AVG(LoanAmount) AS average_loan_amount,
    AVG(CreditScore) AS average_credit_score
FROM loan_risk_prediction_dataset
GROUP BY City
ORDER BY average_loan_amount DESC;

-- 7. Approval pattern by education and employment type
SELECT
    Education,
    EmploymentType,
    COUNT(*) AS total_applications,
    SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) AS approved_applications,
    ROUND(
        SUM(CASE WHEN LoanApproved = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS approval_rate_percentage
FROM loan_risk_prediction_dataset
GROUP BY Education, EmploymentType
ORDER BY approval_rate_percentage DESC;