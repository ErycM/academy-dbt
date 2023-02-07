-- Model Name: dim_stores
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_stores AS (
    SELECT * FROM {{ ref("stg_stores") }}
),

final AS (
    SELECT
        ss.int_store_id,
        ss.str_store_name,
        ss.int_sales_people_id,
        ss.str_demographics,
        ss.dte_modified_date
    FROM stg_stores AS ss
)

SELECT * FROM final