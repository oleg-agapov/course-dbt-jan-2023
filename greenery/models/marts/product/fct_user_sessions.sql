with events as (
    select *
    from {{ ref('stg_postgres__events')}}
)
, user_sessions as (
    select 
        user_id
        , session_id
        , sum(case when event_type = 'page_view' then 1 else 0 end) as page_view
        , sum(case when event_type = 'add_to_cart' then 1 else 0 end) as add_to_cart
        , sum(case when event_type = 'checkout' then 1 else 0 end) as checkout
        , sum(case when event_type = 'package_shipped' then 1 else 0 end) as package_shipped
        , min(event_ts_utc) AS session_started_ts_utc
        , max(event_ts_utc) AS session_ended_ts_utc
    from events
    group by 1, 2
)

select 
    user_id
    , session_id
    , session_started_ts_utc
    , session_ended_ts_utc
    , page_view
    , add_to_cart
    , checkout
    , package_shipped
from user_sessions
