SELECT DISTINCT * FROM
(
    SELECT
    d.license_plate,
    latitude,
    longitude,
    rank() over (partition by d.license_plate order by ts desc) as rnk
    FROM fleet_mgmt_data
) WHERE rnk = 1