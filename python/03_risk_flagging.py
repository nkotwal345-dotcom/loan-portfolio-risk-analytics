# 03_risk_flagging.py
# Create risk bands and exposure flags for loan risk dataset

import csv

input_file = "data/loan_risk_prediction_dataset.csv"
output_file = "data/loan_risk_flagged_output.csv"

def get_credit_risk_band(credit_score):
    if credit_score < 580:
        return "High Risk"
    elif credit_score <= 669:
        return "Medium Risk"
    elif credit_score <= 739:
        return "Low Risk"
    else:
        return "Very Low Risk"

def get_exposure_flag(loan_amount, income):
    if income <= 0:
        return "Review"
    ratio = loan_amount / income

    if ratio > 0.50:
        return "High Exposure"
    elif ratio >= 0.30:
        return "Medium Exposure"
    else:
        return "Low Exposure"

with open(input_file, "r", encoding="utf-8") as file:
    reader = csv.DictReader(file)
    rows = list(reader)
    fieldnames = reader.fieldnames + ["CreditRiskBand", "LoanToIncomeRatio", "ExposureFlag"]

output_rows = []

for row in rows:
    try:
        credit_score = float(row["CreditScore"])
        loan_amount = float(row["LoanAmount"])
        income = float(row["Income"])

        row["CreditRiskBand"] = get_credit_risk_band(credit_score)
        row["LoanToIncomeRatio"] = round(loan_amount / income, 2) if income > 0 else None
        row["ExposureFlag"] = get_exposure_flag(loan_amount, income)

        output_rows.append(row)
    except ValueError:
        continue

with open(output_file, "w", encoding="utf-8", newline="") as file:
    writer = csv.DictWriter(file, fieldnames=fieldnames)
    writer.writeheader()
    writer.writerows(output_rows)

print("Risk flagging completed.")
print(f"Output file created: {output_file}")