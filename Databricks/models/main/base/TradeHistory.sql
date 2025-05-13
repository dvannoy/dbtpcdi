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
    fileNamePattern => "Trade.txt",
    schema => "t_id BIGINT, t_dts TIMESTAMP, t_st_id STRING, t_tt_id STRING, t_is_cash TINYINT, t_s_symb STRING, t_qty INT, t_bid_price DOUBLE, t_ca_id BIGINT, t_exec_name STRING, t_trade_price DOUBLE, t_chrg DOUBLE, t_comm DOUBLE, t_tax DOUBLE"
  )
