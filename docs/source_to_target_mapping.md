# Source-to-Target Mapping



This document explains how source fields are mapped to reporting fields and KPIs.



| Source Field | Target / Report Field | Transformation Logic | Business Purpose |

|---|---|---|---|

| Age | Applicant Age | Direct mapping | Applicant profile analysis |

| Income | Applicant Income | Direct mapping | Affordability and income segmentation |

| LoanAmount | Total Requested Loan Amount | SUM(LoanAmount) | Portfolio exposure analysis |

| LoanAmount | Average Loan Amount | AVG(LoanAmount) | Loan size analysis |

| CreditScore | Average Credit Score | AVG(CreditScore) | Credit risk analysis |

| CreditScore | Credit Risk Band | CASE logic based on score ranges | Risk segmentation |

| YearsExperience | Work Experience | Direct mapping | Applicant stability analysis |

| Gender | Gender Segment | Direct mapping | Demographic analysis |

| Education | Education Segment | Direct mapping | Approval pattern analysis |

| City | City / Region View | Direct mapping | Geographic analysis |

| EmploymentType | Employment Segment | Direct mapping | Employment-based approval analysis |

| LoanApproved | Approval Status | 1 = Approved, 0 = Not Approved | Loan decision analysis |

| LoanApproved | Approval Rate | Approved applications / Total applications | KPI reporting |

| LoanAmount, Income | Loan-to-Income Ratio | LoanAmount / Income | Exposure risk analysis |



## Notes



This mapping helps explain where each dashboard metric comes from and how it is calculated.

