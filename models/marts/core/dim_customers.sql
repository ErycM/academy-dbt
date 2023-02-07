-- Model Name: dim_customers
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_customers AS (
    SELECT * FROM {{ ref("stg_customers") }}
),

stg_stores AS (
    SELECT * FROM {{ ref("stg_stores") }}
),

stg_people AS (
    SELECT * FROM {{ ref("stg_people") }}
),

final AS (
    SELECT
        cu.int_customer_id,
        cu.int_store_id,
        cu.int_territory_id,
        sp.int_people_id,
        sp.str_people_type,
        sp.bol_name_style,
        sp.str_title,
        sp.str_first_name,
        sp.str_middle_name,
        sp.str_last_name,
        sp.str_suffix,
        sp.int_email_promotion,
        sp.str_additional_contact_info,
        sp.str_demographics,
        cu.dte_customer_modified_date,
        sp.dte_people_modified_date,
        st.str_store_name,
        st.int_sales_people_id
    FROM stg_customers AS cu
    LEFT JOiN stg_people AS sp ON sp.int_people_id = cu.int_people_id
    LEFT JOiN stg_stores AS st ON st.int_store_id = cu.int_store_id
)

SELECT * FROM final
