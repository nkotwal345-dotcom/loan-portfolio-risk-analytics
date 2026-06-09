# 01_data_summary.py
# Basic data summary for loan risk prediction dataset

import csv

file_path = "data/loan_risk_prediction_dataset.csv"

with open(file_path, "r", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    rows = list(reader)

print("Loan Risk Dataset Summary")
print("-------------------------")
print(f"Total Records: {len(rows)}")
print(f"Total Columns: {len(reader.fieldnames)}")
print("Columns:")
for column in reader.fieldnames:
    print(f"- {column}")

# Convert numeric fields safely
loan_amounts = []
credit_scores = []
incomes = []

for row in rows:
    try:
        loan_amounts.append(float(row["LoanAmount"]))
        credit_scores.append(float(row["CreditScore"]))
        incomes.append(float(row["Income"]))
    except ValueError:
        continue

print("\nKey Metrics")
print("-----------")
print(f"Average Loan Amount: {sum(loan_amounts) / len(loan_amounts):.2f}")
print(f"Average Credit Score: {sum(credit_scores) / len(credit_scores):.2f}")
print(f"Average Income: {sum(incomes) / len(incomes):.2f}")