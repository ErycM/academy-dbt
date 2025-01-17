-- Model Name: stg_sales_orders
-- Name: Eryc Masselli
-- Created_at: 2023-01-05

WITH salesorderdetail AS (
    SELECT * FROM {{ ref("salesorderdetail") }}
),

salesorderheader AS (
    SELECT * FROM {{ ref("salesorderheader") }}
),

creditcard AS (
    SELECT * FROM {{ ref("creditcard") }}
),

final AS (
    SELECT
        sod.salesorderdetailid AS int_sales_order_detail_id,
        sod.carriertrackingnumber AS str_carrier_trabking_number,
        sod.orderqty AS int_order_qty,
        sod.productid AS int_product_id,
        sod.specialofferid AS int_special_offer_id,
        -- Sum of unit_price = sub_total
        sod.unitprice AS flt_unit_price,
        sod.unitpricediscount AS flt_unit_price_discount,
        soh.salesorderid AS int_sales_order_id,
        soh.revisionnumber AS int_revision_number,
        DATE(soh.orderdate) AS dte_order_date,
        DATE(soh.duedate) AS dte_due_date,
        DATE(soh.shipdate) AS dte_ship_date,
        soh.status AS int_order_status,
        -- Description found here https://dataedo.com/samples/html/AdventureWorks/doc/AdventureWorks_2/tables/Sales_SalesOrderHeader_185.html
        CASE 
            WHEN soh.status = 1 THEN 'In_process'
            WHEN soh.status = 2 THEN 'Approved'
            WHEN soh.status = 3 THEN 'Backordered' 
            WHEN soh.status = 4 THEN 'Rejected' 
            WHEN soh.status = 5 THEN 'Shipped'
            WHEN soh.status = 6 THEN 'Cancelled' 
            ELSE 'N/A'
        end AS str_order_status_name,
        soh.onlineorderflag AS bol_online_order_flag,
        soh.purchaseordernumber AS str_purchase_order_number,
        soh.accountnumber AS str_account_number,
        soh.customerid AS int_customer_id,
        soh.salespersonid AS int_people_id,
        soh.territoryid AS int_territory_id,
        soh.billtoaddressid AS int_bill_to_address_id,
        soh.shiptoaddressid AS int_ship_to_address_id,
        soh.shipmethodid AS int_ship_method_id,
        soh.creditcardid AS int_credit_card_id,
        soh.creditcardapprovalcode AS int_credit_card_approval_code,
        soh.currencyrateid AS int_currency_rate_id,
        soh.taxamt AS flt_tax_amt,
        soh.freight AS flt_freight,
        soh.totaldue AS flt_total_due,
        soh.comment AS int_comment,
        soh.rowguid AS str_rowguid,
        cc.cardtype AS str_card_type,
        cc.cardnumber AS int_card_number,
        cc.expmonth AS int_exp_month,
        cc.expyear AS int_exp_year,
        DATE(cc.modifieddate) AS dte_credit_card_modified_date,
        DATE(sod.modifieddate) AS dte_sales_order_detail_modified_date,
        DATE(soh.modifieddate) AS dte_sales_order_header_modified_date
    FROM salesorderdetail AS sod
    LEFT JOIN salesorderheader AS soh ON soh.salesorderid = sod.salesorderid
    LEFT JOIN creditcard AS cc ON cc.creditcardid = soh.creditcardid    
)

SELECT * FROM final
