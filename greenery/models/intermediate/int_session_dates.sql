with events as (
    select *
    from {{ ref('stg_postgres__events')}}
)
, session_dates as (
    select 
        session_id
        , min(event_ts_utc) AS session_started_ts_utc
        , max(event_ts_utc) AS session_ended_ts_utc
    from events
    group by 1
)

select
    session_id
    , session_started_ts_utc
    , session_ended_ts_utc
from session_dates
