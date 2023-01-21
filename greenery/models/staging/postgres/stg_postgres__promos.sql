with _src as (
    select * 
    from {{ source('postgres', 'promos') }}
)

select
    promo_id
	, discount as discount_usd
	, status as promo_status
from _src
