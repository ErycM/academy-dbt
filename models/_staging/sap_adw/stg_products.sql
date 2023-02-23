-- Model Name: stg_produts
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH product AS (
    SELECT * FROM {{ ref("product") }}
),

productsubcategory AS (
    SELECT * FROM {{ ref("productsubcategory") }}
),

productcategory AS (
    SELECT * FROM {{ ref("productcategory") }}
),

final AS (
    SELECT
        pd.productid As int_product_id,
        pd.name As str_product_name,
        pd.productnumber AS str_product_number,
        pd.makeflag AS bol_product_make_flag,
        pd.finishedgoodsflag AS bol_product_finished_goods_flag,
        pd.color AS str_product_color,
        pd.safetystocklevel AS int_safety_product_stock_level,
        pd.reorderpoint AS int_product_reorder_point,
        pd.standardcost AS flt_standard_cost,
        pd.listprice AS flt_list_price,
        pd.size AS str_product_size,
        pd.sizeunitmeasurecode AS str_product_size_unit_measure_code,
        pd.weightunitmeasurecode AS str_product_weight_unit_measure_code,
        pd.weight AS flt_product_weight,
        pd.daystomanufacture AS int_product_days_to_manufacture,
        pd.productline AS str_product_line,
        pd.class AS str_product_class,
        pd.style AS str_product_style,
        pd.productsubcategoryid AS int_product_sub_category_id,
        sc.name AS str_product_sub_category_name,
        pc.productcategoryid AS int_product_category_id,
        pc.name AS str_product_category_name,
        pd.productmodelid AS int_product_model_id,
        DATE(pd.sellstartdate) AS dte_product_sell_start_date,
        DATE(pd.sellenddate) AS dte_product_sell_end_date,
        pd.discontinueddate AS int_product_discontinue_date,
        DATE(pd.modifieddate) AS dte_product_modified_date
    FROM product AS pd
    LEFT JOIN productsubcategory AS sc ON sc.productsubcategoryid = pd.productsubcategoryid
    LEFT JOIN productcategory  AS pc ON pc.productcategoryid = sc.productcategoryid 
)

SELECT * FROM final