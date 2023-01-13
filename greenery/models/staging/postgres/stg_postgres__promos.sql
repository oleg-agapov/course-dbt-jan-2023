with _src as (
    select * 
    from {{ source('postgres', 'promos') }}
)

select
    promo_id
	, discount
	, status
from _src
