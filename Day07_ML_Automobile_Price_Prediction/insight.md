## Day 7 — ML Automobile Price Prediction

**Dataset:** UCI Automobile Dataset (205 rows, 26 columns)
**Question:** What features matter most for car price?

**Cleaning steps:**
- Replaced ? with NaN
- Dropped normalized-losses (20% missing)
- Dropped 4 rows where price was missing
- Filled num-of-doors with mode
- Converted bore, stroke, horsepower, peak-rpm to numeric
- Filled numerical columns with median
- Label encoded 10 categorical columns

**Model:** Linear Regression
**Accuracy:** R² = 0.86 (86%)

**Top 5 features driving car price:**
1. Engine-location — 11,155 impact
2. Fuel-type — 8,963 impact
3. Stroke — 2,338 impact
4. Aspiration — 1,898 impact
5. Num-of-doors — 1,360 impact

**Final Insight:** Engine location and fuel type are 
the top 2 features driving automobile prices.

**Tool:** Python (Pandas, Scikit-learn, Matplotlib)
**Key functions:** LabelEncoder, train_test_split, 
LinearRegression, r2_score
