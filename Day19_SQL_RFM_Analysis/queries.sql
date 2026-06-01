select * from onlineretail;
select CustomerID, Max(InvoiceDate) as latest_order,count(DISTinct InvoiceNo) as total_orders,sum(Quantity*UnitPrice) as total_spent
from onlineretail where CustomerID IS NOT NULL group by CustomerID;
select max(InvoiceDate) as reference_date from onlineretail;
select CustomerID,max(InvoiceDate_new) as recent_orders, datediff((select max(InvoiceDate_new) from onlineretail), 
max(InvoiceDate_new)) as recency from onlineretail where CustomerID IS NOT NULL group by CustomerID order by recency desc;

ALTER TABLE onlineretail
ADD COLUMN InvoiceDate_new DATETIME;
UPDATE onlineretail
SET InvoiceDate_new =
STR_TO_DATE(InvoiceDate, '%m/%d/%Y %H:%i');
SET SQL_SAFE_UPDATES = 1;
SELECT InvoiceDate, InvoiceDate_new
FROM onlineretail
LIMIT 5;

select CustomerID, datediff((select max(InvoiceDate_new) from onlineretail), max(InvoiceDate_new)) as recency,
count(distinct InvoiceNo) as frequency,round(sum(Quantity*UnitPrice)) as monetary from onlineretail 
where CustomerID IS NOT NULL group by CustomerID;

select 
    case 
        when recency<=4 and monetary>1000 and frequency>2
        then 'high_value'
        when recency>=5
        then  'at risk'
        else 'others'
    end as segment, count(*) as customer_count
    from (select CustomerID, datediff((select max(InvoiceDate_new) from onlineretail), max(InvoiceDate_new)) as recency,
count(distinct InvoiceNo) as frequency,round(sum(Quantity*UnitPrice)) as monetary from onlineretail 
where CustomerID IS NOT NULL group by CustomerID) as rfm group by segment;
