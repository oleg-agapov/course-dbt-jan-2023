with _src as (
    select * 
    from {{ source('postgres', 'order_items') }}
)

select
    order_id
	, product_id
	, quantity
from _src
