# Loan Portfolio Risk Analytics



## Project Overview



This project demonstrates a loan portfolio risk analytics workflow using a public loan risk prediction dataset. The goal is to analyze loan applications, monitor credit risk, calculate portfolio KPIs, identify high-risk applications, and prepare reporting-ready outputs for dashboard development.



This project is built for portfolio demonstration purposes using public data. It does not contain confidential, company, customer, or proprietary information.



## Business Problem



Financial and risk teams need reliable reporting to monitor loan applications, approval trends, credit quality, exposure risk, and early warning signals. Manual reporting can create delays, inconsistent calculations, duplicate records, missing values, and data quality issues.



This project shows how SQL-based profiling, data quality validation, KPI calculations, and documentation can improve reporting reliability and make the data easier to use for business decisions.



## Objectives



- Profile loan application data for quality issues

- Identify missing values, duplicates, invalid values, and outliers

- Define data quality validation rules

- Calculate portfolio and approval KPIs

- Segment applicants by credit risk bands

- Create source-to-target mapping documentation

- Document data dictionary and data lineage

- Prepare a dashboard-ready reporting layer



## Dataset



The project uses a public loan risk prediction dataset downloaded from Kaggle.



Dataset file:



```text

data/loan\_risk\_prediction\_dataset.csv



Main fields include:



Age

Income

LoanAmount

CreditScore

YearsExperience

Gender

Education

City

EmploymentType

LoanApproved

Tech Stack

Tool / Technology	Purpose

SQL	Data profiling, validation checks, KPI calculations, and risk analysis

GitHub	Version control and project documentation

CSV Dataset	Source dataset for analysis

Power BI	Planned dashboard and reporting layer

Python	Planned data preparation and automation layer

Project Structure

loan-portfolio-risk-analytics/

│

├── data/

│   └── loan\_risk\_prediction\_dataset.csv

│

├── sql/

│   ├── 01\_data\_profiling.sql

│   ├── 02\_data\_quality\_checks.sql

│   ├── 03\_kpi\_calculations.sql

│   └── 04\_risk\_analysis.sql

│

├── docs/

│   ├── data\_dictionary.md

│   ├── data\_quality\_rules.md

│   ├── source\_to\_target\_mapping.md

│   ├── data\_lineage.md

│   └── project\_summary.md

│

├── dashboards/

│   └── dashboard\_notes.md

│

├── python/

│

└── README.md

SQL Analysis Files

File	Description

01\_data\_profiling.sql	Checks total records, sample records, null values, duplicates, and distributions

02\_data\_quality\_checks.sql	Validates data quality rules for age, income, loan amount, credit score, and duplicate records

03\_kpi\_calculations.sql	Calculates total applications, approval rate, average loan amount, average credit score, and loan-to-income ratio

04\_risk\_analysis.sql	Creates credit risk bands, exposure flags, high-risk application views, and approval pattern analysis

Documentation Files

File	Description

data\_dictionary.md	Defines each field in the dataset

data\_quality\_rules.md	Documents validation rules and data quality dimensions

source\_to\_target\_mapping.md	Maps source fields to final reporting fields and KPIs

data\_lineage.md	Explains how data flows from source to final reporting output

project\_summary.md	Summarizes the project goal, tools, metrics, and methodology

dashboard\_notes.md	Documents the planned Power BI dashboard layout and visuals

Key Metrics

Total loan applications

Total requested loan amount

Average loan amount

Average applicant income

Average credit score

Loan approval rate

High-risk application count

Loan-to-income ratio

Approval rate by employment type

Risk band distribution

Average loan amount by education

Average credit score by segment

Risk Logic Used



Credit score is used to create simple risk bands:



Credit Score Range	Risk Band

Below 580	High Risk

580–669	Medium Risk

670–739	Low Risk

740 and above	Very Low Risk



Loan-to-income ratio is used to flag exposure risk:



Loan-to-Income Ratio	Exposure Flag

Greater than 0.50	High Exposure

0.30 to 0.50	Medium Exposure

Less than 0.30	Low Exposure

Methodology

Collected public loan risk dataset.

Uploaded dataset into the GitHub project.

Created SQL profiling queries to understand data structure and quality.

Added validation checks for nulls, invalid values, duplicates, and inconsistent data.

Created KPI calculation queries for loan applications, approval rate, loan amount, and credit score.

Built risk analysis logic using credit score bands and loan-to-income ratio.

Documented data dictionary, data quality rules, source-to-target mapping, and data lineage.

Planned a Power BI dashboard layout for executive summary and drill-down analysis.

Planned Dashboard



The planned Power BI dashboard will include:



Executive KPI cards

Loan approval summary

Risk band distribution

Approval rate by employment type

Loan amount by education

Credit score segmentation

High-risk application table

Filters for city, gender, education, employment type, and approval status

Business Impact



This project demonstrates how structured analytics can help financial teams:



Reduce manual reporting effort

Improve data quality visibility

Standardize KPI definitions

Identify high-risk applications

Improve audit readiness through documentation

Support faster decision-making through dashboard-ready metrics

Disclaimer



This is a portfolio project built using a public dataset for learning and demonstration purposes only. It does not represent any employer, client, internal system, confidential report, or proprietary business process.

