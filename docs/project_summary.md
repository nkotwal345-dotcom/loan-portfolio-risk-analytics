# Project Summary

## Project Name

Loan Portfolio Risk Analytics

## Project Overview

This project demonstrates a loan portfolio risk analytics workflow using a public loan risk prediction dataset. The goal is to analyze loan applications, identify risk patterns, calculate key metrics, and prepare the dataset for dashboard reporting.

## Business Problem

Financial teams need accurate and timely reporting to monitor loan applications, approval trends, credit risk, loan exposure, and early warning signals. Manual reporting can create delays, inconsistent calculations, and data quality issues.

## Objective

The objective of this project is to build a structured analytics workflow that includes:

- Data profiling
- Data quality validation
- KPI calculation
- Risk segmentation
- Source-to-target mapping
- Data dictionary documentation
- Data lineage documentation
- Dashboard-ready reporting logic

## Tools Used

| Tool | Purpose |
|---|---|
| SQL | Data profiling, validation checks, KPI calculations, and risk analysis |
| GitHub | Version control and project documentation |
| CSV Dataset | Source data for analysis |
| Power BI | Dashboard with KPI cards, risk analysis, segmentation, and drill-down table |
| Python | Data preparation, quality checks, and risk flagging automation |

## Key Metrics

- Total loan applications
- Total requested loan amount
- Average loan amount
- Average income
- Average credit score
- Approval rate
- High-risk application count
- Loan-to-income ratio
- Approval rate by employment type
- Risk band distribution

## Key SQL Files

| File | Purpose |
|---|---|
| 01_data_profiling.sql | Checks record count, nulls, duplicates, and distributions |
| 02_data_quality_checks.sql | Defines validation checks for invalid or missing data |
| 03_kpi_calculations.sql | Calculates business KPIs |
| 04_risk_analysis.sql | Creates risk bands and exposure flags |

## Key Documentation Files

| File | Purpose |
|---|---|
| data_dictionary.md | Defines each field in the dataset |
| data_quality_rules.md | Documents validation rules |
| source_to_target_mapping.md | Maps source fields to report fields |
| data_lineage.md | Tracks metric flow from source to report |
| project_summary.md | Summarizes the full project |

## Disclaimer

This project uses a public dataset for portfolio demonstration purposes only. It does not contain any confidential, company, customer, or proprietary data.