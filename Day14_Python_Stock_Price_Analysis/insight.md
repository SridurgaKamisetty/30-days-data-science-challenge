## Day 14 — Python Stock Price Time Series

**Dataset:** Tesla Stock Price (757 rows, 6 columns)
**Question:** Is there a weekly pattern in price movement?

**Date range:** 2014 to 2018
**Price range:** $14 to $387

**Weekly pattern found:**
- Best day to BUY: Friday (lowest avg price)
- Best day to SELL: Monday (highest avg price)
- Clear weekly pattern exists in Tesla stock!

**Final Insight:** Buy Tesla on Friday, 
sell on Monday for best returns!

**Tool:** Python (Pandas, Matplotlib)
**Key functions:** dt.day_name(), groupby(),
plot(), to_datetime(), dt.to_period()
