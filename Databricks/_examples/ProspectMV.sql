{{config(materialized = 'materialized_view')}}
SELECT  city, state, count(1) records, sum(numbercars) total_cars
FROM {{ ref('ProspectST') }}
GROUP BY ALL

