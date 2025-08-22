SELECT * FROM public.tenant
CREATE SEQUENCE tenant_tenant_id_seq
    START WITH 11111
    INCREMENT BY 15
    MINVALUE 11111
    MAXVALUE 99999
    CACHE 1;
	
CREATE TABLE public.tenant (
    tenant_id INTEGER PRIMARY KEY DEFAULT nextval('tenant_tenant_id_seq'),
    tenant_name VARCHAR(255) NOT NULL,
    tenant_email VARCHAR(255) UNIQUE NOT NULL,
    property_number INT UNIQUE NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_tenant_property FOREIGN KEY (property_number) 
        REFERENCES public.property (property_id) 
        ON DELETE CASCADE
);
INSERT INTO public.tenant (tenant_name, tenant_email, property_number, joined_at)
VALUES 
('Ethan Blake', 'ethan.blake@hotmail.com', 1001, CURRENT_TIMESTAMP),
('Aria Foster', 'aria.foster@gmail.com', 1011, CURRENT_TIMESTAMP),
('Logan Hayes', 'logan.hayes@outlook.com', 1021, CURRENT_TIMESTAMP),
('Lily Parker', 'lily.parker@gmail.com', 1031, CURRENT_TIMESTAMP),
('Aiden Rivera', 'aiden.rivera@hotmail.com', 1041, CURRENT_TIMESTAMP),
('Chloe Murphy', 'chloe.murphy@outlook.com', 1051, CURRENT_TIMESTAMP),
('Mason Cooper', 'mason.cooper@gmail.com', 1061, CURRENT_TIMESTAMP),
('Zoe Brooks', 'zoe.brooks@hotmail.com', 1071, CURRENT_TIMESTAMP),
('Carter Reed', 'carter.reed@outlook.com', 1081, CURRENT_TIMESTAMP),
('Layla Bailey', 'layla.bailey@gmail.com', 1091, CURRENT_TIMESTAMP),
('Jayden Bell', 'jayden.bell@hotmail.com', 1101, CURRENT_TIMESTAMP),
('Nora Price', 'nora.price@outlook.com', 1111, CURRENT_TIMESTAMP),
('Levi Barnes', 'levi.barnes@gmail.com', 1121, CURRENT_TIMESTAMP),
('Hannah Ross', 'hannah.ross@hotmail.com', 1131, CURRENT_TIMESTAMP),
('Dylan Powell', 'dylan.powell@outlook.com', 1141, CURRENT_TIMESTAMP),
('Ella Jenkins', 'ella.jenkins@gmail.com', 1151, CURRENT_TIMESTAMP),
('Grayson Sanders', 'grayson.sanders@outlook.com', 1161, CURRENT_TIMESTAMP),
('Aubrey Patterson', 'aubrey.patterson@hotmail.com', 1171, CURRENT_TIMESTAMP),
('Gabriel Long', 'gabriel.long@gmail.com', 1181, CURRENT_TIMESTAMP),
('Addison Hughes', 'addison.hughes@outlook.com', 1191, CURRENT_TIMESTAMP),
('Lincoln Flores', 'lincoln.flores@hotmail.com', 1201, CURRENT_TIMESTAMP),
('Violet Bryant', 'violet.bryant@gmail.com', 1211, CURRENT_TIMESTAMP),
('Wyatt Simmons', 'wyatt.simmons@gmail.com', 1221, CURRENT_TIMESTAMP),
('Camila Alexander', 'camila.alexander@hotmail.com', 1231, CURRENT_TIMESTAMP),
('Julian Ward', 'julian.ward@gmail.com', 1241, CURRENT_TIMESTAMP),
('Penelope Griffin', 'penelope.griffin@outlook.com', 1251, CURRENT_TIMESTAMP),
('Luke Hayes', 'luke.hayes@hotmail.com', 1261, CURRENT_TIMESTAMP),
('Savannah Watson', 'savannah.watson@gmail.com', 1271, CURRENT_TIMESTAMP),
('Isaac West', 'isaac.west@outlook.com', 1281, CURRENT_TIMESTAMP),
('Aurora Fisher', 'aurora.fisher@gmail.com', 1291, CURRENT_TIMESTAMP);
