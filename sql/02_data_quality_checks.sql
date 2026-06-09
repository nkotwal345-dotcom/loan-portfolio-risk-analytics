-- 02_data_quality_checks.sql
-- Data quality validation checks for loan risk dataset

-- 1. Check missing values in important fields
SELECT
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS missing_age,
    SUM(CASE WHEN Income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN LoanAmount IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount,
    SUM(CASE WHEN CreditScore IS NULL THEN 1 ELSE 0 END) AS missing_credit_score,
    SUM(CASE WHEN YearsExperience IS NULL THEN 1 ELSE 0 END) AS missing_years_experience,
    SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS missing_gender,
    SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS missing_education,
    SUM(CASE WHEN City IS NULL THEN 1 ELSE 0 END) AS missing_city,
    SUM(CASE WHEN EmploymentType IS NULL THEN 1 ELSE 0 END) AS missing_employment_type,
    SUM(CASE WHEN LoanApproved IS NULL THEN 1 ELSE 0 END) AS missing_loan_approved
FROM loan_risk_prediction_dataset;

-- 2. Check invalid age values
SELECT *
FROM loan_risk_prediction_dataset
WHERE Age < 18 OR Age > 100;

-- 3. Check invalid income values
SELECT *
FROM loan_risk_prediction_dataset
WHERE Income < 0;

-- 4. Check invalid loan amount values
SELECT *
FROM loan_risk_prediction_dataset
WHERE LoanAmount <= 0;

-- 5. Check invalid credit score values
SELECT *
FROM loan_risk_prediction_dataset
WHERE CreditScore < 300 OR CreditScore > 850;

-- 6. Check invalid years of experience
SELECT *
FROM loan_risk_prediction_dataset
WHERE YearsExperience < 0 OR YearsExperience > 60;

-- 7. Check loan approval distribution
SELECT
    LoanApproved,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY LoanApproved
ORDER BY record_count DESC;

-- 8. Check gender distribution
SELECT
    Gender,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY Gender
ORDER BY record_count DESC;

-- 9. Check education distribution
SELECT
    Education,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY Education
ORDER BY record_count DESC;

-- 10. Check employment type distribution
SELECT
    EmploymentType,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY EmploymentType
ORDER BY record_count DESC;

-- 11. Check possible duplicate records
SELECT
    Age,
    Income,
    LoanAmount,
    CreditScore,
    YearsExperience,
    Gender,
    Education,
    City,
    EmploymentType,
    LoanApproved,
    COUNT(*) AS duplicate_count
FROM loan_risk_prediction_dataset
GROUP BY
    Age,
    Income,
    LoanAmount,
    CreditScore,
    YearsExperience,
    Gender,
    Education,
    City,
    EmploymentType,
    LoanApproved
HAVING COUNT(*) > 1;