-- Model Name: dim_products
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_products AS (
    SELECT * FROM {{ ref("stg_products") }}
),

final AS (
    SELECT
        pd.int_product_id,
        pd.str_product_name,
        pd.str_product_number,
        pd.bol_product_make_flag,
        pd.bol_product_finished_goods_flag,
        pd.str_product_color,
        pd.int_safety_product_stock_level,
        pd.int_product_reorder_point,
        pd.flt_standard_cost,
        pd.flt_list_price,
        pd.str_product_size,
        pd.str_product_size_unit_measure_code,
        pd.str_product_weight_unit_measure_code,
        pd.flt_product_weight,
        pd.int_product_days_to_manufacture,
        pd.str_product_line,
        pd.str_product_class,
        pd.str_product_style,
        pd.int_product_sub_category_id,
        pd.str_product_sub_category_name,
        pd.int_product_category_id,
        pd.str_product_category_name,
        pd.int_product_model_id,
        pd.dte_product_sell_start_date,
        pd.dte_product_sell_end_date,
        pd.int_product_discontinue_date,
        pd.dte_product_modified_date
    FROM stg_products AS pd
)

SELECT * FROM final
