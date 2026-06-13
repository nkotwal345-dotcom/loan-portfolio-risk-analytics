# Data Quality Rules



This document defines validation checks used to ensure the loan risk dataset is clean and reliable.



| Rule ID | Field | Data Quality Rule | Purpose |

|---|---|---|---|

| DQ001 | Age | Age should not be null | Applicant age is required for profiling |

| DQ002 | Age | Age should be between 18 and 100 | Prevent invalid applicant age values |

| DQ003 | Income | Income should not be null or negative | Income is required for affordability analysis |

| DQ004 | LoanAmount | LoanAmount should be greater than 0 | Loan amount must be valid |

| DQ005 | CreditScore | CreditScore should be between 300 and 850 | Credit score should follow standard range |

| DQ006 | YearsExperience | YearsExperience should not be negative | Work experience cannot be below zero |

| DQ007 | Gender | Gender should not be blank | Required for demographic grouping |

| DQ008 | Education | Education should not be blank | Required for segmentation |

| DQ009 | City | City should not be blank | Required for geographic analysis |

| DQ010 | EmploymentType | EmploymentType should not be blank | Required for approval pattern analysis |

| DQ011 | LoanApproved | LoanApproved should only contain valid approval values | Used as target outcome field |

| DQ012 | Full Record | Duplicate records should be reviewed | Prevent double counting in reports |



## Data Quality Dimensions Covered



- Completeness

- Validity

- Consistency

- Uniqueness

- Accuracy

