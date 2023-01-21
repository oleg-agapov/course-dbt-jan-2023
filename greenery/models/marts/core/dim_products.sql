with products as (
    select *
    from {{ ref ('stg_postgres__products') }}
)
, product_sales as (
    select
        product_id,
        sum(quantity) as purchased
    from {{ ref ('stg_postgres__order_items') }}
    group by 1
)

select
    p.product_id
	, p.product_name
	, p.product_price
	, p.left_in_stock
    , purchased
from products p
left join product_sales ps
    on ps.product_id = p.product_id
