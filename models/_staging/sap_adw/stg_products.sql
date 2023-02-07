-- Model Name: stg_produts
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH product AS (
    SELECT * FROM {{ ref("product") }}
),

final AS (
    SELECT
        productid As int_product_id,
        name As str_product_name,
        productnumber AS str_product_number,
        makeflag AS bol_product_make_flag,
        finishedgoodsflag AS bol_product_finished_goods_flag,
        color AS str_product_color,
        safetystocklevel AS int_safety_product_stock_level,
        reorderpoint AS int_product_reorder_point,
        standardcost AS flt_standard_cost,
        listprice AS flt_list_price,
        size AS str_product_size,
        sizeunitmeasurecode AS str_product_size_unit_measure_code,
        weightunitmeasurecode AS str_product_weight_unit_measure_code,
        weight AS flt_product_weight,
        daystomanufacture AS int_product_days_to_manufacture,
        productline AS str_product_line,
        class AS str_product_class,
        style AS str_product_style,
        productsubcategoryid AS int_prouct_subscategory_id,
        productmodelid AS int_product_model_id,
        DATE(sellstartdate) AS dte_product_sell_start_date,
        DATE(sellenddate) AS dte_product_sell_end_date,
        discontinueddate AS int_product_discontinue_date,
        DATE(modifieddate) AS dte_product_modified_date
    FROM product
)

SELECT * FROM final