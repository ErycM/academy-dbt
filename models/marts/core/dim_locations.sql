-- Model Name: dim_locations
-- Name: Eryc Masselli
-- Created_at: 2023-02-07

WITH stg_locations AS (
    SELECT * FROM {{ ref("stg_locations") }}
),

final AS (
    SELECT
        sl.int_address_id,
        sl.str_address_line1,
        sl.str_address_line2,
        sl.str_city,
        sl.int_state_provice_id,
        sl.str_state_province_code,
        sl.bol_is_only_state_province_flag,
        sl.str_state_province_name,
        sl.int_territory_id,
        sl.str_postal_code,
        sl.str_spatial_location,
        sl.str_contry_region_code,
        sl.str_country_region_name,
        sl.dte_country_region_modified_date,
        sl.dte_state_province_modified_date,
        sl.dte_modified_date
    FROM stg_locations AS sl
)

SELECT * FROM final