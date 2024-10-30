SELECT
DATE (EXTRACT (YEAR from date_date), EXTRACT (MONTH from date_date), 01) as datemonth,
SUM(f.operational_margin-c.ads_cost) as ads_margin,
ROUND((SUM (f.average_basket)),1) as average_basket,
SUM(f.operational_margin) as operational_margin,
SUM(c.ads_cost) as ads_cost,
SUM(c.ads_impression) as ads_impression,
SUM(c.ads_click) as ads_click,
SUM(f.quantity) as quantity,
SUM(f.revenue) as revenue,
SUM(f.purchase_cost) as purchase_cost,
SUM(f.margin) as margin,
SUM(f.shipping_fee) as shipping_fee,
SUM(f.logcost) as logcost,
SUM(f.ship_cost) as ship_cost

 FROM {{ref("finance_days")}} f
 LEFT JOIN {{ref("int_campaigns_day")}} c
     USING(date_date)
GROUP BY datemonth
ORDER BY datemonth DESC