SELECT * FROM public.payment
CREATE OR REPLACE FUNCTION generate_payment_id() RETURNS TRIGGER AS $$ DECLARE random_part TEXT; suffix_part TEXT; BEGIN random_part := lpad((trunc(random() * 90000 + 10000)::int)::text, 5, '0'); suffix_part := (trunc(random() * 90 + 10)::int)::text; NEW.payment_id := random_part || '-' || suffix_part; RETURN NEW; END; $$ LANGUAGE plpgsql; 
CREATE OR REPLACE FUNCTION generate_transaction_reference() RETURNS TRIGGER AS $$ DECLARE yyyymm TEXT; random_suffix TEXT; BEGIN yyyymm := TO_CHAR(CURRENT_DATE, 'YYYYMM'); random_suffix := lpad((trunc(random() * 900 + 100)::int)::text, 3, '0'); NEW.transaction_reference := 'TX' || yyyymm || NEW.property_number || random_suffix; RETURN NEW; END; $$ LANGUAGE plpgsql;

CREATE TABLE public.payment (
    payment_id TEXT PRIMARY KEY,
    property_number INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(100) NOT NULL,
    transaction_reference VARCHAR(255) UNIQUE,
    payment_status VARCHAR(50) DEFAULT 'Pending',
    lastupdated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_property FOREIGN KEY (property_number) REFERENCES public.property (property_id) ON DELETE CASCADE
);

CREATE TRIGGER set_payment_id BEFORE INSERT ON public.payment FOR EACH ROW WHEN (NEW.payment_id IS NULL) EXECUTE FUNCTION generate_payment_id(); 
CREATE TRIGGER set_transaction_reference BEFORE INSERT ON public.payment FOR EACH ROW WHEN (NEW.transaction_reference IS NULL) EXECUTE FUNCTION generate_transaction_reference();

INSERT INTO public.payment (
    property_number, payment_date, payment_method, payment_status, lastupdated_at
) VALUES
(1001, CURRENT_TIMESTAMP, 'Credit Card', 'Completed', CURRENT_TIMESTAMP),
(1011, CURRENT_TIMESTAMP, 'Bank Transfer', 'Pending', CURRENT_TIMESTAMP),
(1021, CURRENT_TIMESTAMP, 'Online Portal', 'Completed', CURRENT_TIMESTAMP),
(1031, CURRENT_TIMESTAMP, 'Credit Card', 'Failed', CURRENT_TIMESTAMP),
(1041, CURRENT_TIMESTAMP, 'Cash', 'Pending', CURRENT_TIMESTAMP),
(1051, CURRENT_TIMESTAMP, 'Bank Transfer', 'Completed', CURRENT_TIMESTAMP),
(1061, CURRENT_TIMESTAMP, 'Online Portal', 'Completed', CURRENT_TIMESTAMP),
(1071, CURRENT_TIMESTAMP, 'Credit Card', 'Pending', CURRENT_TIMESTAMP),
(1081, CURRENT_TIMESTAMP, 'Bank Transfer', 'Completed', CURRENT_TIMESTAMP),
(1091, CURRENT_TIMESTAMP, 'Cash', 'Completed', CURRENT_TIMESTAMP),
(1101, CURRENT_TIMESTAMP, 'Online Portal', 'Failed', CURRENT_TIMESTAMP),
(1111, CURRENT_TIMESTAMP, 'Credit Card', 'Completed', CURRENT_TIMESTAMP),
(1121, CURRENT_TIMESTAMP, 'Bank Transfer', 'Completed', CURRENT_TIMESTAMP),
(1131, CURRENT_TIMESTAMP, 'Cash', 'Pending', CURRENT_TIMESTAMP),
(1141, CURRENT_TIMESTAMP, 'Online Portal', 'Completed', CURRENT_TIMESTAMP),
(1151, CURRENT_TIMESTAMP, 'Credit Card', 'Completed', CURRENT_TIMESTAMP),
(1161, CURRENT_TIMESTAMP, 'Bank Transfer', 'Pending', CURRENT_TIMESTAMP),
(1171, CURRENT_TIMESTAMP, 'Cash', 'Completed', CURRENT_TIMESTAMP),
(1181, CURRENT_TIMESTAMP, 'Online Portal', 'Failed', CURRENT_TIMESTAMP),
(1191, CURRENT_TIMESTAMP, 'Credit Card', 'Completed', CURRENT_TIMESTAMP),
(1201, CURRENT_TIMESTAMP, 'Cash', 'Completed', CURRENT_TIMESTAMP),
(1211, CURRENT_TIMESTAMP, 'Bank Transfer', 'Failed', CURRENT_TIMESTAMP),
(1221, CURRENT_TIMESTAMP, 'Online Portal', 'Completed', CURRENT_TIMESTAMP),
(1231, CURRENT_TIMESTAMP, 'Credit Card', 'Pending', CURRENT_TIMESTAMP),
(1241, CURRENT_TIMESTAMP, 'Cash', 'Completed', CURRENT_TIMESTAMP),
(1251, CURRENT_TIMESTAMP, 'Bank Transfer', 'Completed', CURRENT_TIMESTAMP),
(1261, CURRENT_TIMESTAMP, 'Online Portal', 'Pending', CURRENT_TIMESTAMP),
(1271, CURRENT_TIMESTAMP, 'Credit Card', 'Completed', CURRENT_TIMESTAMP),
(1281, CURRENT_TIMESTAMP, 'Bank Transfer', 'Completed', CURRENT_TIMESTAMP),
(1291, CURRENT_TIMESTAMP, 'Cash', 'Pending', CURRENT_TIMESTAMP),
(1001, NOW() - INTERVAL '40 days', 'Bank Transfer', 'Completed', NOW() - INTERVAL '40 days'),
(1011, NOW() - INTERVAL '35 days', 'Cash', 'Completed', NOW() - INTERVAL '35 days'),
(1021, NOW() - INTERVAL '33 days', 'Credit Card', 'Failed', NOW() - INTERVAL '33 days'),
(1031, NOW() - INTERVAL '28 days', 'Online Portal', 'Completed', NOW() - INTERVAL '28 days'),
(1041, NOW() - INTERVAL '25 days', 'Credit Card', 'Completed', NOW() - INTERVAL '25 days'),
(1051, NOW() - INTERVAL '22 days', 'Cash', 'Failed', NOW() - INTERVAL '22 days'),
(1061, NOW() - INTERVAL '20 days', 'Bank Transfer', 'Pending', NOW() - INTERVAL '20 days'),
(1071, NOW() - INTERVAL '18 days', 'Cash', 'Completed', NOW() - INTERVAL '18 days'),
(1081, NOW() - INTERVAL '16 days', 'Credit Card', 'Failed', NOW() - INTERVAL '16 days'),
(1091, NOW() - INTERVAL '14 days', 'Online Portal', 'Completed', NOW() - INTERVAL '14 days'),
(1101, NOW() - INTERVAL '12 days', 'Cash', 'Completed', NOW() - INTERVAL '12 days'),
(1111, NOW() - INTERVAL '10 days', 'Bank Transfer', 'Completed', NOW() - INTERVAL '10 days'),
(1121, NOW() - INTERVAL '9 days', 'Online Portal', 'Pending', NOW() - INTERVAL '9 days'),
(1131, NOW() - INTERVAL '8 days', 'Bank Transfer', 'Completed', NOW() - INTERVAL '8 days'),
(1141, NOW() - INTERVAL '7 days', 'Credit Card', 'Completed', NOW() - INTERVAL '7 days');
