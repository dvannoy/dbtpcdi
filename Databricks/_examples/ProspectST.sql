{{config(materialized = 'streaming_table')}}
SELECT *
FROM STREAM read_files(
    "/Volumes/tpcdi/tpcdi_raw_data/tpcdi_volume/sf=10/Batch*",
    format => "csv",
    fileNamePattern => "Prospect.csv",
    header => False,
    schema => "agencyid STRING, lastname STRING, firstname STRING, middleinitial STRING, gender STRING, addressline1 STRING, addressline2 STRING, postalcode STRING, city STRING, state STRING, country STRING, phone STRING, income STRING, numbercars INT, numberchildren INT, maritalstatus STRING, age INT, creditrating INT, ownorrentflag STRING, employer STRING, numbercreditcards INT, networth INT"
)

