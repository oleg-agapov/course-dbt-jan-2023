with _src as (
    select * 
    from {{ source('postgres', 'products') }}
)

select
    product_id
	, name as product_name
	, price as product_price
	, inventory as left_in_stock
from _src
