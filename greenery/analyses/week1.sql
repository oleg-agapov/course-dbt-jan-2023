select
    'How many users do we have?' as metric
    , count(1) as metric_value
from {{ ref('stg_postgres__users') }}

union

select 
    'On average, how many orders do we receive per hour?'
    , avg(orders)
from (
    select 
        date_trunc(hour, created_at), 
        count(1) as orders
    from {{ ref('stg_postgres__orders') }}
    group by 1
)

union

select 
    'On average, how long does an order take from being placed to being delivered? (days)'
    , avg(datediff(day, created_at, delivered_at))
from {{ ref('stg_postgres__orders')}}
where delivered_at is not null

union

select * from (
    select
        case 
            when orders = 1 
                then 'How many users have only made 1 purchase?'
            when orders = 2 
                then 'How many users have only made 2 purchases?'
            else 'How many users have only made 3+ purchases?'
        end
        , count(user_id)
    from (
        select 
            user_id
            , count(order_id) as orders
        from {{ ref('stg_postgres__orders')}}
        group by 1
    )
    group by 1
    order by 1
)

union

select
    'On average, how many unique sessions do we have per hour?'
    , avg(sessions)
from (
    select
        date_trunc(hour, created_at), 
        count(distinct session_id) as sessions
    from dev_db.dbt_olegagapovpaltacom.stg_postgres__events
    group by 1
)
