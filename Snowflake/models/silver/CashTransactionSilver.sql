{{
    config(
        materialized = 'incremental',
        unique_key = ['yr','mnth'],
        incremental_strategy = 'insert_overwrite',
    )
}}

select *
from
    {{ ref('CashTransactionIncremental') }}
{% if is_incremental() %}
where
    (yr, mnth) > (select max(yr), max(mnth) from {{ this }})
{% endif %}
