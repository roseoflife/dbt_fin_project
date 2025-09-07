-- Staging model: Lightly transform raw transaction data
{{ config(materialized="view") }}

select
    transaction_id,
    customer_id,
    transaction_date::date as transaction_date,
    amount::float as transaction_amount,
    currency as transaction_currency
        -- Add USD conversion rate lookup
    case 
        when currency = 'USD' then amount::float
        when currency = 'EUR' then amount::float * 1.1
        when currency = 'GBP' then amount::float * 1.3
        else amount::float
    end as transaction_amount_usd
from {{ source("raw", "transactions") }} 
where amount is not null 
    and transaction_date >= '2023-01-01'
