{{
    config(
        materialized = 'streaming_table'
    )
}}
select
    *,
    1 as batchid
from STREAM read_files(
  "{{ var('tpcdi_directory') }}sf={{ var('benchmark') }}/Batch1",
    format => "csv",
    inferSchema => False,
    header => False,
    sep => "|",
    fileNamePattern => "TradeHistory.txt",
    schema => "th_t_id BIGINT, th_dts TIMESTAMP, th_st_id STRING"
  )
