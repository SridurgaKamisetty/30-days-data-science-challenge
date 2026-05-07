## Day 3 — Python Data Cleaning (Titanic Dataset)

**Dataset:** Titanic (891 rows, 12 columns)
**Question:** How much bad data was hiding in the dataset?

**Dirty data found:**
- Age: 177 missing (19.87%) → Fixed with median (28.0)
- Cabin: 687 missing (77.09%) → Dropped entire column
- Embarked: 2 missing (0.22%) → Fixed with mode (S)

**Total bad data fixed:** 866 values
**Missing values remaining:** 0

**Tool:** Python (Pandas)
**Key functions:** isnull(), fillna(), drop(), mode(), median()
