
CREATE SEQUENCE service_request_sr_id_seq
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 999999
CACHE 1;



CREATE OR REPLACE FUNCTION generate_sr_id() 
RETURNS TRIGGER AS $$
DECLARE 
    date_part TEXT; 
    seq_part TEXT; 
BEGIN
    date_part := to_char(CURRENT_DATE, 'YYYYMMDD');
    seq_part := nextval('service_request_sr_id_seq')::TEXT;
    NEW.sr_id := 'SR' || date_part || NEW.property_number || seq_part;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION assign_available_technician() RETURNS TRIGGER AS $$ BEGIN SELECT technician_id INTO NEW.technician_id FROM technician WHERE availability_status = 'Available' ORDER BY RANDOM() LIMIT 1; 
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TABLE public.service_request ( sr_id TEXT PRIMARY KEY, description TEXT, img BYTEA,property_number INT NOT NULL, technician_id TEXT, status VARCHAR(50) DEFAULT 'Open', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);


CREATE TRIGGER set_sr_id 
BEFORE INSERT ON public.service_request 
FOR EACH ROW 
WHEN (NEW.sr_id IS NULL) 
EXECUTE FUNCTION generate_sr_id();

CREATE TRIGGER trigger_assign_technician BEFORE INSERT ON service_request FOR EACH ROW EXECUTE FUNCTION assign_available_technician(); 


INSERT INTO public.service_request (
    description, img, property_number, technician_id, status, created_at
) VALUES
('Leakyibg faucet in washroom', '\xDEADBEEF', 1171, 'SP8814', 'Open', CURRENT_TIMESTAMP),
('Leaky faucet in kitchen', '\xDEADBEEF', 1171, 'JD4863', 'Open', CURRENT_TIMESTAMP),
('Bathroom light flickering', '\xDEADBEEF', 1171, 'JS3547', 'In Progress', CURRENT_TIMESTAMP),
('Front door lock jammed', '\xDEADBEEF', 1171, 'RB1488', 'Open', CURRENT_TIMESTAMP),
('Kitchen sink drainage slow', '\xDEADBEEF', 1171, 'AG2500', 'Completed', CURRENT_TIMESTAMP),
('Ceiling paint bubbling', '\xDEADBEEF', 1171, 'DW1441', 'Open', CURRENT_TIMESTAMP),
('Window crack spreading', '\xDEADBEEF', 1181, 'EB1844', 'In Progress', CURRENT_TIMESTAMP),
('Bedroom heating issue', '\xDEADBEEF', 1181, 'SP8814', 'Completed', CURRENT_TIMESTAMP),
('Thermostat malfunction', '\xDEADBEEF', 1191, 'JD4863', 'Open', CURRENT_TIMESTAMP),
('Gutter clogged', '\xDEADBEEF', 1201, 'JS3547', 'Open', CURRENT_TIMESTAMP),
('Water pooling near AC unit', '\xDEADBEEF', 1211, 'RB1488', 'In Progress', CURRENT_TIMESTAMP),
('Squeaky garage door', '\xDEADBEEF', 1221, 'AG2500', 'Completed', CURRENT_TIMESTAMP),
('Bathtub faucet leaking', '\xDEADBEEF', 1231, 'DW1441', 'Open', CURRENT_TIMESTAMP),
('Leaky Tap by the Garden', '\xDEADBEEF', 1171, 'EB1844', 'Closed', CURRENT_TIMESTAMP),
('Leaky Tap by the Garden', '\xDEADBEEF', 1171, 'SP8814', 'Closed', CURRENT_TIMESTAMP),
('Leaky Tap by the Garden', '\xDEADBEEF', 1171, 'JD4863', 'Closed', CURRENT_TIMESTAMP),
('Leaky Tap by the Garden', '\xDEADBEEF', 1171, 'JS3547', 'Open', CURRENT_TIMESTAMP),
('Leaky faucet in kitchen', '\xDEADBEEF', 1171, 'RB1488', 'Open', CURRENT_TIMESTAMP),
('Broken window in bedroom', '\xDEADBEEF', 1181, 'AG2500', 'In Progress', CURRENT_TIMESTAMP),
('AC not cooling', '\xDEADBEEF', 1191, 'DW1441', 'Completed', CURRENT_TIMESTAMP),
('Electrical outlet malfunctioning', '\xDEADBEEF', 1201, 'EB1844', 'Open', CURRENT_TIMESTAMP),
('Water heater making noise', '\xDEADBEEF', 1211, 'SP8814', 'In Progress', CURRENT_TIMESTAMP),
('Garage door stuck', '\xDEADBEEF', 1221, 'JD4863', 'Completed', CURRENT_TIMESTAMP),
('Clogged drain in bathroom', '\xDEADBEEF', 1231, 'JS3547', 'Open', CURRENT_TIMESTAMP),
('Roof leakage during rain', '\xDEADBEEF', 1241, 'RB1488', 'In Progress', CURRENT_TIMESTAMP),
('Smoke detector malfunctioning', '\xDEADBEEF', 1251, 'AG2500', 'Completed', CURRENT_TIMESTAMP),
('Broken tiles in kitchen', '\xDEADBEEF', 1261, 'DW1441', 'Open', CURRENT_TIMESTAMP),
('Backyard fence repair', '\xDEADBEEF', 1271, 'EB1844', 'In Progress', CURRENT_TIMESTAMP),
('Pest control needed', '\xDEADBEEF', 1281, 'SP8814', 'Open', CURRENT_TIMESTAMP),
('Washer not draining', '\xDEADBEEF', 1291, 'JD4863', 'Completed', CURRENT_TIMESTAMP),
('Dishwasher error code', '\xDEADBEEF', 1301, 'JS3547', 'Open', CURRENT_TIMESTAMP),
('Paint peeling in hallway', '\xDEADBEEF', 1311, 'RB1488', 'In Progress', CURRENT_TIMESTAMP);

SELECT * FROM public.service_request

