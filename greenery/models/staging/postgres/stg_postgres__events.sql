with _src as (
    select * 
    from {{ source('postgres', 'events') }}
)

select
    event_id
	, session_id
	, user_id
	, page_url
	, created_at
	, event_type
	, order_id
	, product_id
from _src
