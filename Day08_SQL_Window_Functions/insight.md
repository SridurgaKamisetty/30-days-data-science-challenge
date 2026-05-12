## Day 8 — SQL Window Functions

**Dataset:** Customer Orders (100 rows)
**Question:** How does revenue accumulate month by month?

**Window Functions learned:**
- ROW_NUMBER() — unique rank for each row
- RANK() — same rank for ties, skips next ranks
- DENSE_RANK() — same rank for ties, no skipping

**Final Insight:**
- January: ₹2,78,500 → Cumulative: ₹2,78,500
- February: ₹3,46,500 → Cumulative: ₹6,25,000
- March: ₹3,47,000 → Cumulative: ₹9,72,000
- April: ₹3,47,500 → Cumulative: ₹13,19,500

Revenue grows consistently — stable business performance!

**Tool:** SQL (MySQL)
**Key concepts:** ROW_NUMBER, RANK, DENSE_RANK, 
SUM() OVER(), running totals
