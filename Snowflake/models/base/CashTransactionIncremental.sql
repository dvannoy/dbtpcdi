{{
    config(
        materialized = 'incremental',
        materialized_strategy = 'append'
    )
}}

select
    cast(null AS VARCHAR) as cdc_flag,
    cast(null AS VARCHAR) as cdc_dsn,
    *,
    1 as batchid,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  year(cast(ct_dts as date))
        end as yr,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  month(cast(ct_dts as date)) 
        end as mnth

from
    {{ source('tpcdi', 'CashTransactionHistory') }}

 UNION ALL
select
    *,
    2 as batchid,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  year(cast(ct_dts as date))
        end as yr,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  month(cast(ct_dts as date))
        end as mnth
from
    {{ source('tpcdi', 'CashTransactionIncrementaldos') }}

 UNION ALL

 select
    *,
    3 as batchid,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  year(cast(ct_dts as date))
        end as yr,
    case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
        then NULL
        else  month(cast(ct_dts as date)) 
        end as mnth
from
    {{ source('tpcdi', 'CashTransactionIncrementaltres') }}

--  UNION ALL

--  select
--     *,
--     3 as batchid,
--     case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
--         then NULL
--         else  year(cast(ct_dts as date))
--         end as yr,
--     case when cast(ct_dts as date) in ('2012-07-09', '2017-07-09') 
--         then NULL
--         else  month(cast(ct_dts as date)) 
--         end as mnth
-- from
--     {{ source('tpcdi', 'CashTransactionIncrementalcuatro') }}
