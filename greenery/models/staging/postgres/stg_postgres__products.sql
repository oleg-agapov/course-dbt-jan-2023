with _src as (
    select * 
    from {{ source('postgres', 'products') }}
)

select
    product_id
	, name
	, price
	, inventory
from _src