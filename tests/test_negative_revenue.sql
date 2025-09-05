SELECT *
FROM {{ ref('finance_metrics') }}
WHERE Revenue < 0
