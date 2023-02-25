-- Model Name: fct_sales
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_sales_orders AS (
    SELECT * FROM {{ ref("stg_sales_orders") }}
    {% if is_incremental() %}
        WHERE dte_order_date > (SELECT MAX(dte_order_date) FROM {{ this }})
    {% endif %}
    
),

final AS (
    SELECT
        sso.int_sales_order_detail_id,
        sso.str_carrier_trabking_number,
        sso.int_order_qty,
        sso.int_product_id,
        sso.int_special_offer_id,
        sso.flt_unit_price,
        sso.flt_unit_price_discount,
        sso.int_order_qty * sso.flt_unit_price AS flt_total_unit_price,
        sso.int_order_qty * sso.flt_unit_price_discount AS flt_total_unit_price_discount,
        sso.int_sales_order_id,
        sso.int_revision_number,
        sso.dte_order_date,
        sso.dte_due_date,
        sso.dte_ship_date,
        sso.int_order_status,
        sso.str_order_status_name,
        sso.bol_online_order_flag,
        sso.str_purchase_order_number,
        sso.str_account_number,
        sso.int_customer_id,
        sso.int_people_id,
        sso.int_territory_id,
        sso.int_bill_to_address_id,
        sso.int_ship_to_address_id,
        sso.int_ship_method_id,
        sso.int_credit_card_id,
        sso.int_credit_card_approval_code,
        sso.int_currency_rate_id,
        sso.flt_tax_amt,
        sso.flt_freight,
        sso.flt_total_due,
        sso.int_comment,
        sso.str_card_type,
        sso.int_card_number,
        sso.int_exp_month,
        sso.int_exp_year,
        sso.dte_credit_card_modified_date,
        sso.dte_sales_order_detail_modified_date,
        sso.dte_sales_order_header_modified_date
    FROM stg_sales_orders AS sso
)

SELECT * FROM final
