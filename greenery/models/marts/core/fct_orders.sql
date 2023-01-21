with orders as (
    select *
    from {{ ref ('stg_postgres__orders') }}
)
, addresses as (
    select *
    from {{ ref ('stg_postgres__addresses') }}
)
, promos as (
    select *
    from {{ ref ('stg_postgres__promos') }}
)

select
	o.order_id
	, o.user_id
	, o.promo_id
	, p.discount_usd
	, p.promo_status
	, o.address_id
	, a.address
	, a.zipcode
	, a.state
	, a.country
	, o.order_ts_utc
	, o.order_cost_usd
	, o.shipping_cost_usd
	, o.order_total_usd
	, o.tracking_id
	, o.shipping_service
	, o.estimated_delivery_ts_utc
	, o.delivered_ts_utc
	, o.order_status
from orders o
left join addresses a
    on a.address_id = o.address_id
left join promos p
    on p.promo_id = o.promo_id
