
SELECT
    p.property_id,
    p.property_name,
    p.property_type,
    p.property_description,
    p.property_image,
	'Vacant' AS tenant_status
FROM
    property p
LEFT JOIN 
    tenant t ON t.property_number = p.property_id
WHERE
    t.tenant_name IS NULL
ORDER BY
    p.property_id DESC;
	