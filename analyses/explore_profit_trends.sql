 -- Analysis to explore profit trends for companies over time
   SELECT
       Company,
       Year,
       Revenue,
       GrossProfit,
       OperatingProfit,
       NetProfitMargin,
       AVG(NetProfitMargin) OVER (
           PARTITION BY Company
           ORDER BY Year
           ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
       ) AS AvgNetProfitMarginLastTwoYears
   FROM {{ ref('finance_metrics') }}
   ORDER BY Company, Year;