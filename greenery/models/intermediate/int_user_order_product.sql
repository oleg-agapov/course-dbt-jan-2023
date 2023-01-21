with order_items as (
    select *
    from {{ ref('stg_postgres__order_items') }}
)
, orders as (
    select *
    from {{ ref('stg_postgres__orders') }}
)

select
    o.user_id
    , o.order_id
    , o.order_ts_utc
    , oi.product_id
    , oi.quantity
from order_items oi
left join orders o
    on o.order_id = oi.order_id
