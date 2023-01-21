with _src as (
    select * 
    from {{ source('postgres', 'users') }}
)

select
    user_id
	, first_name
	, last_name
	, email
	, phone_number
	, created_at::timestamp_ntz as created_ts_utc
	, updated_at::timestamp_ntz as updated_at_utc
	, address_id
from _src
