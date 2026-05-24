## Day 12 — ML Customer Churn Prediction

**Dataset:** Telco Customer Churn (7043 rows, 21 columns)
**Question:** What is the top churn risk factor?

**Cleaning steps:**
- Converted TotalCharges from text to numeric
- Filled 11 missing values with median
- Dropped customerID column
- Encoded Churn Yes/No to 1/0
- Label encoded 16 categorical columns

**Model:** Logistic Regression
**Accuracy:** 81.69%

**Top 5 Churn Risk Factors:**
1. PhoneService — 1.02 impact
2. Contract type — 0.72 impact
3. PaperlessBilling — 0.36 impact
4. OnlineSecurity — 0.29 impact
5. TechSupport — 0.26 impact

**Final Insight:** Month-to-month contract customers 
without phone service and online security are most 
likely to churn.

**Tool:** Python (Pandas, Scikit-learn, Matplotlib)
**Key functions:** LabelEncoder, LogisticRegression,
train_test_split, accuracy_score
