SELECT * FROM public.manager
CREATE SEQUENCE manager_manager_id_seq
    START WITH 10001
    INCREMENT BY 100
    MINVALUE 10001
    MAXVALUE 99999
    CACHE 1;

CREATE TABLE public.manager (
    manager_id INTEGER PRIMARY KEY DEFAULT nextval('manager_manager_id_seq'),
    manager_name VARCHAR(255) NOT NULL,
    manager_email VARCHAR(255) NOT NULL,
    property_number INT,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_manager_house FOREIGN KEY (property_number) 
        REFERENCES public.property (property_id) 
        ON DELETE CASCADE
);
INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) VALUES ('Emma Stewart', 'emma.stewart@dpapartments.com', 1171, CURRENT_TIMESTAMP), ('Emma Stewart', 'emma.stewart@dpapartments.com', 1181, CURRENT_TIMESTAMP), ('Emma Stewart', 'emma.stewart@dpapartments.com', 1191, CURRENT_TIMESTAMP), ('Emma Stewart', 'emma.stewart@dpapartments.com', 1201, CURRENT_TIMESTAMP); 

INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) VALUES ('Daniel Cruz', 'daniel.cruz@dpapartments.com', 1211, CURRENT_TIMESTAMP), ('Daniel Cruz', 'daniel.cruz@dpapartments.com', 1221, CURRENT_TIMESTAMP), ('Daniel Cruz', 'daniel.cruz@dpapartments.com', 1231, CURRENT_TIMESTAMP), ('Daniel Cruz', 'daniel.cruz@dpapartments.com', 1241, CURRENT_TIMESTAMP); 

INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) VALUES ('Olivia Morgan', 'olivia.morgan@dpapartments.com', 1251, CURRENT_TIMESTAMP), ('Olivia Morgan', 'olivia.morgan@dpapartments.com', 1261, CURRENT_TIMESTAMP), ('Olivia Morgan', 'olivia.morgan@dpapartments.com', 1271, CURRENT_TIMESTAMP), ('Olivia Morgan', 'olivia.morgan@dpapartments.com', 1281, CURRENT_TIMESTAMP); 

INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) VALUES ('Ethan James', 'ethan.james@dpapartments.com', 1291, CURRENT_TIMESTAMP), ('Ethan James', 'ethan.james@dpapartments.com', 1301, CURRENT_TIMESTAMP), ('Ethan James', 'ethan.james@dpapartments.com', 1311, CURRENT_TIMESTAMP), ('Ethan James', 'ethan.james@dpapartments.com', 1321, CURRENT_TIMESTAMP); 


INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) 
VALUES 
('Sophia Allen', 'sophia.allen@dpapartments.com', 1001, CURRENT_TIMESTAMP),
('Sophia Allen', 'sophia.allen@dpapartments.com', 1011, CURRENT_TIMESTAMP),
('Sophia Allen', 'sophia.allen@dpapartments.com', 1021, CURRENT_TIMESTAMP),
('Sophia Allen', 'sophia.allen@dpapartments.com', 1031, CURRENT_TIMESTAMP);


INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) 
VALUES 
('Liam Rivera', 'liam.rivera@dpapartments.com', 1041, CURRENT_TIMESTAMP),
('Liam Rivera', 'liam.rivera@dpapartments.com', 1051, CURRENT_TIMESTAMP),
('Liam Rivera', 'liam.rivera@dpapartments.com', 1061, CURRENT_TIMESTAMP),
('Liam Rivera', 'liam.rivera@dpapartments.com', 1071, CURRENT_TIMESTAMP);


INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) 
VALUES 
('Ava Bennett', 'ava.bennett@dpapartments.com', 1081, CURRENT_TIMESTAMP),
('Ava Bennett', 'ava.bennett@dpapartments.com', 1091, CURRENT_TIMESTAMP),
('Ava Bennett', 'ava.bennett@dpapartments.com', 1101, CURRENT_TIMESTAMP),
('Ava Bennett', 'ava.bennett@dpapartments.com', 1111, CURRENT_TIMESTAMP);


INSERT INTO public.manager (manager_name, manager_email, property_number, joined_at) 
VALUES 
('Noah Coleman', 'noah.coleman@dpapartments.com', 1121, CURRENT_TIMESTAMP),
('Noah Coleman', 'noah.coleman@dpapartments.com', 1131, CURRENT_TIMESTAMP);

