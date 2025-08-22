
SELECT
    m.manager_name,
    SUM(l.rent_amount) AS total_active_rent_value,
    (SUM(l.rent_amount) * 0.05) AS potential_commission  
FROM
    manager m
JOIN
    property p ON m.property_number = p.property_id
JOIN
    lease_file l ON p.property_id = l.property_id
JOIN
    payment pm ON p.property_id = pm.property_number
WHERE
    DATE_TRUNC('month', pm.payment_date) = DATE_TRUNC('month', CURRENT_DATE)
GROUP BY
     m.manager_name;