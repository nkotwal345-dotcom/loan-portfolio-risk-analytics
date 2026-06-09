Paste this:

# Data Lineage

This document explains how data moves from the source dataset to final reporting outputs.

## Data Flow

```text
Public Kaggle Dataset
        ↓
CSV file stored in /data
        ↓
SQL profiling and validation checks
        ↓
Risk segmentation and KPI calculations
        ↓
Power BI dashboard / reporting layer
        ↓
Business insights and portfolio monitoring
Source
Layer	Description
Source Dataset	Public loan risk prediction dataset
Storage Layer	CSV file stored in the GitHub /data folder
Validation Layer	SQL data profiling and data quality checks
Transformation Layer	SQL KPI and risk segmentation logic
Reporting Layer	Power BI dashboard / visual report
Documentation Layer	Data dictionary, data quality rules, and mapping files
Metric Lineage Examples
Metric	Source Field	Logic	Final Output
Total Applications	Full dataset	COUNT(*)	KPI card
Total Requested Loan Amount	LoanAmount	SUM(LoanAmount)	Portfolio exposure KPI
Average Credit Score	CreditScore	AVG(CreditScore)	Risk profile KPI
Approval Rate	LoanApproved	Approved / Total Applications	Approval performance KPI
Credit Risk Band	CreditScore	CASE score ranges	Risk segmentation chart
Loan-to-Income Ratio	LoanAmount, Income	LoanAmount / Income	Exposure risk flag
Purpose

Data lineage helps users understand where each metric comes from, how it is calculated, and how it reaches the final report.


Save and close.

Push it:

```cmd
git add docs/data_lineage.md
git commit -m "Add data lineage documentation"
git push origin main