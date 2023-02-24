-- Model Name: stg_customers
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH customer AS (
    SELECT * FROM {{ ref("customer") }}
),

final AS (
    SELECT
        customerid AS int_customer_id,
        personid AS int_people_id,
        storeid AS int_store_id,
        territoryid AS int_territory_id,
        DATE(modifieddate) AS dte_customer_modified_date
    FROM customer
)

SELECT * FROM final
