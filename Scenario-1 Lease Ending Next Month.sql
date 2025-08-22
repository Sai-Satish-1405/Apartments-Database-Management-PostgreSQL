
SELECT
    p.property_name ,
    l.lease_end_date,
    t.tenant_name ,
    t.tenant_email ,
    m.manager_name ,
    m.manager_email ,
    (l.lease_end_date - CURRENT_DATE) AS days_left

FROM
    lease_file l
JOIN
    property p ON l.property_id = p.property_id
JOIN
    tenant t ON p.property_id = t.property_number
JOIN
    manager m ON p.property_id = m.property_number
WHERE
    l.lease_end_date >= date_trunc('month', CURRENT_DATE + INTERVAL '1 month')
    AND l.lease_end_date < date_trunc('month', CURRENT_DATE + INTERVAL '2 months');
