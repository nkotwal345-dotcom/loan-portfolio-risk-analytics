# 02_data_quality_report.py
# Data quality checks for loan risk prediction dataset

import csv

file_path = "data/loan_risk_prediction_dataset.csv"

with open(file_path, "r", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    rows = list(reader)

columns = reader.fieldnames

print("Data Quality Report")
print("-------------------")

# Missing value check
print("\nMissing Values:")
for column in columns:
    missing_count = sum(1 for row in rows if row[column] is None or row[column].strip() == "")
    print(f"{column}: {missing_count}")

# Invalid value checks
invalid_age = []
invalid_income = []
invalid_loan_amount = []
invalid_credit_score = []
invalid_experience = []

for row in rows:
    try:
        if float(row["Age"]) < 18 or float(row["Age"]) > 100:
            invalid_age.append(row)
        if float(row["Income"]) < 0:
            invalid_income.append(row)
        if float(row["LoanAmount"]) <= 0:
            invalid_loan_amount.append(row)
        if float(row["CreditScore"]) < 300 or float(row["CreditScore"]) > 850:
            invalid_credit_score.append(row)
        if float(row["YearsExperience"]) < 0 or float(row["YearsExperience"]) > 60:
            invalid_experience.append(row)
    except ValueError:
        continue

print("\nInvalid Value Checks:")
print(f"Invalid Age Records: {len(invalid_age)}")
print(f"Invalid Income Records: {len(invalid_income)}")
print(f"Invalid Loan Amount Records: {len(invalid_loan_amount)}")
print(f"Invalid Credit Score Records: {len(invalid_credit_score)}")
print(f"Invalid Years Experience Records: {len(invalid_experience)}")