-- Model Name: dim_sales_orders_reasons
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_sales_orders_reasons AS (
    SELECT * FROM {{ ref("stg_sales_orders_reasons") }}
),

final AS (
    SELECT
        ssor.int_sales_reason_id,
        ssor.int_sales_order_id,
        ssor.str_sales_reason_name,
        LOWER(REPLACE(ssor.str_sales_reason_name, ' ', '_')) AS str_sales_reason_name_cd,
        ssor.str_sales_reason_type,
        ssor.dte_sales_reason_modied_Date,
        ssor.dte_sales_order_header_reason_modified_date
    FROM stg_sales_orders_reasons AS ssor
)

SELECT * FROM final