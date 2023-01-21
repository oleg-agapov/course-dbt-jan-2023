select 
    'Repeat rate for Greenery' as question
    , (sum(is_frequent_buyer::int) / sum(is_buyer::int))::varchar as answer
from {{ ref('fct_user_orders') }}

union all

select
    'Which orders changed from week 1 to week 2?' as question
    , order_id as answer
from {{ ref('orders_snapshot') }}
where dbt_valid_to is not null
