-- 01_data_profiling.sql
-- Basic data profiling queries for loan risk dataset

-- 1. Total record count
SELECT COUNT(*) AS total_records
FROM loan_risk_prediction_dataset;

-- 2. Check sample records
SELECT *
FROM loan_risk_prediction_dataset
LIMIT 10;

-- 3. Check null values in important fields
SELECT
    SUM(CASE WHEN loan_amount IS NULL THEN 1 ELSE 0 END) AS missing_loan_amount,
    SUM(CASE WHEN income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN credit_score IS NULL THEN 1 ELSE 0 END) AS missing_credit_score,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS missing_loan_status
FROM loan_risk_prediction_dataset;

-- 4. Check duplicate records
SELECT
    loan_id,
    COUNT(*) AS duplicate_count
FROM loan_risk_prediction_dataset
GROUP BY loan_id
HAVING COUNT(*) > 1;

-- 5. Check loan amount range
SELECT
    MIN(loan_amount) AS min_loan_amount,
    MAX(loan_amount) AS max_loan_amount,
    AVG(loan_amount) AS avg_loan_amount
FROM loan_risk_prediction_dataset;

-- 6. Check loan status distribution
SELECT
    loan_status,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY loan_status
ORDER BY record_count DESC;

-- 7. Check risk category distribution
SELECT
    risk_rating,
    COUNT(*) AS record_count
FROM loan_risk_prediction_dataset
GROUP BY risk_rating
ORDER BY record_count DESC;