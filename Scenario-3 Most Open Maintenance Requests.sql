
SELECT 
    p.property_id,
    p.property_name,
    o.owner_name,
    t.tenant_name,
    COUNT(sr.sr_id) AS total_requests
FROM 
    property p
JOIN 
    service_request sr ON sr.property_number = p.property_id
JOIN 
    owner o ON o.property_number = p.property_id
JOIN 
    tenant t ON t.property_number = p.property_id
GROUP BY 
    p.property_id, p.property_name, o.owner_name, t.tenant_name
ORDER BY 
    total_requests DESC
LIMIT 5;

