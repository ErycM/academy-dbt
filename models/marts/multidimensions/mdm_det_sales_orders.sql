-- Model Name: mdm_det_sales_orders
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH fct_sales AS (
    SELECT * FROM {{ ref("fct_sales") }}    
),

dim_sales_orders_reasons AS (
    SELECT * FROM {{ ref("dim_sales_orders_reasons") }}    
),

dim_customers AS (
    SELECT * FROM {{ ref("dim_customers") }}    
),

dim_locations AS (
    SELECT * FROM {{ ref("dim_locations") }}    
),

final AS (
    SELECT
        fs.int_sales_order_detail_id,
        fs.int_order_qty,
        fs.int_unit_price,
        fs.flt_subtotal,
        fs.str_card_type,
        fs.dte_order_date,
        fs.int_status,
        dl.int_address_id,
        dl.str_address_line1,
        dl.str_address_line2,
        dl.str_city,
        dl.int_state_provice_id,
        dl.str_state_province_code,
        dl.bol_is_only_state_province_flag,
        dl.str_state_province_name,
        dl.str_postal_code,
        dl.str_spatial_location,
        dl.str_contry_region_code,
        dl.str_country_region_code,
        dc.int_people_id,
        dc.str_people_type,
        dc.int_customer_id,
        dc.str_first_name,
        dc.str_middle_name,
        dc.str_last_name,
        dc.int_store_id,
        dc.str_store_name,
        {{ dbt_utils.pivot(
            'str_sales_reason_type',
            dbt_utils.get_column_values(ref('dim_sales_orders_reasons'), 'str_sales_reason_type'),
            prefix = 'int_sales_reason_type_'
        ) }},
        {{ dbt_utils.pivot(
            'str_sales_reason_name_cd',
            dbt_utils.get_column_values(ref('dim_sales_orders_reasons'), 'str_sales_reason_name_cd'),
            prefix = 'int_sales_reason_name_'
        ) }}
    FROM fct_sales AS fs
    LEFT JOIN dim_sales_orders_reasons AS sor ON sor.int_sales_order_id = fs.int_sales_order_id
    LEFT JOIN dim_customers AS dc ON dc.int_customer_id = fs.int_customer_id
    LEFT JOIN dim_locations AS dl ON dl.int_address_id = fs.int_ship_to_address_id
    {{ dbt_utils.group_by(n=27) }}
)

SELECT * FROM final