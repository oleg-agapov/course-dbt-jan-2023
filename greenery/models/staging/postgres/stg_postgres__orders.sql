with _src as (
    select * 
    from {{ source('postgres', 'orders') }}
)

select
    order_id
	, user_id
	, promo_id
	, address_id
	, created_at::timestamp_ntz as order_ts_utc
	, order_cost as order_cost_usd
	, shipping_cost as shipping_cost_usd
	, order_total as order_total_usd
	, tracking_id
	, shipping_service
	, estimated_delivery_at::timestamp_ntz as estimated_delivery_ts_utc
	, delivered_at::timestamp_ntz as delivered_ts_utc
	, status as order_status
from _src
