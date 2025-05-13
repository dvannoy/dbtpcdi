{{
    config(
        materialized = 'table'
    )
}}
SELECT
    *
FROM read_files(
    "{{ var('tpcdi_directory') }}sf={{ var('benchmark') }}/Batch1",
    format => "csv",
    inferSchema => False,
    header => False,
    sep => "|",
    fileNamePattern => "CashTransaction.txt",
    schema => "ct_ca_id BIGINT, ct_dts TIMESTAMP, ct_amt DOUBLE, ct_name STRING"
  )
