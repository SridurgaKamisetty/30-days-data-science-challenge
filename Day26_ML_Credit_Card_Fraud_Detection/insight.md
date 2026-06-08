Day 26 — ML Credit Card Fraud Detection
Dataset: Kaggle Credit Card Fraud (284,807 transactions)
Question: Can we detect fraudulent transactions accurately?
Answer:

Only 0.17% fraud — severe class imbalance detected
Without balancing — Recall 72%, Precision 87%
With class_weight='balanced' — Recall 92%, Precision 4%
High Recall preferred in banking — missing fraud costs more than false alarms
Tool: Python — Logistic Regression
Key concept: Class Imbalance, Precision-Recall Tradeoff, SMOTE, stratify
