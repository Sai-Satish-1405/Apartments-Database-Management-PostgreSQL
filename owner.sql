SELECT * FROM public.owner
CREATE SEQUENCE owner_owner_id_seq 
     START WITH 10000 
     INCREMENT BY 25 
     MINVALUE 10000 
     MAXVALUE 99999 
     CACHE 1; 

CREATE TABLE public.owner (
    owner_id INTEGER PRIMARY KEY DEFAULT nextval('owner_owner_id_seq'),
    owner_name VARCHAR(255) NOT NULL,
    owner_email VARCHAR(255) UNIQUE NOT NULL,
    property_number INT NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_owner_property FOREIGN KEY (property_number) 
        REFERENCES public.property (property_id) 
        ON DELETE CASCADE
);
INSERT INTO public.owner (owner_name, owner_email, property_number, joined_at) VALUES
('Matthew Green', 'matthew.green@modernhousehub.com', 1001, CURRENT_TIMESTAMP),
('Abigail Adams', 'abigail.adams@realtyconnect.com', 1011, CURRENT_TIMESTAMP),
('Sebastian Baker', 'sebastian.baker@openkeygroup.com', 1021, CURRENT_TIMESTAMP),
('Ella Nelson', 'ella.nelson@secureholdings.com', 1031, CURRENT_TIMESTAMP),
('Jackson Carter', 'jackson.carter@zenhomes.com', 1041, CURRENT_TIMESTAMP),
('Scarlett Mitchell', 'scarlett.mitchell@nextkeyliving.com', 1051, CURRENT_TIMESTAMP),
('David Perez', 'david.perez@easylivingmail.com', 1061, CURRENT_TIMESTAMP),
('Emily Roberts', 'emily.roberts@primeowners.com', 1071, CURRENT_TIMESTAMP),
('Joseph Turner', 'joseph.turner@houselaunch.com', 1081, CURRENT_TIMESTAMP),
('Grace Phillips', 'grace.phillips@valuehomes.com', 1091, CURRENT_TIMESTAMP),
('Samuel Campbell', 'samuel.campbell@trustrealty.com', 1101, CURRENT_TIMESTAMP),
('Emma Thompson', 'emma.thompson@realestatehub.com', 1171, CURRENT_TIMESTAMP),
('Liam Johnson', 'liam.johnson@homesdirect.com', 1181, CURRENT_TIMESTAMP),
('Olivia Davis', 'olivia.davis@propertymail.com', 1191, CURRENT_TIMESTAMP),
('Noah Wilson', 'noah.wilson@urbanhomes.com', 1201, CURRENT_TIMESTAMP),
('Ava Martinez', 'ava.martinez@ownitnow.com', 1211, CURRENT_TIMESTAMP),
('Elijah Anderson', 'elijah.anderson@keyholdings.com', 1221, CURRENT_TIMESTAMP),
('Sophia Lee', 'sophia.lee@estatecloud.com', 1231, CURRENT_TIMESTAMP),
('James Taylor', 'james.taylor@dreamresidences.com', 1241, CURRENT_TIMESTAMP),
('Isabella Moore', 'isabella.moore@housenet.com', 1251, CURRENT_TIMESTAMP),
('Benjamin Harris', 'benjamin.harris@domoholdings.com', 1261, CURRENT_TIMESTAMP),
('Mia Clark', 'mia.clark@premierprops.com', 1271, CURRENT_TIMESTAMP),
('Lucas Lewis', 'lucas.lewis@residex.com', 1281, CURRENT_TIMESTAMP),
('Charlotte Walker', 'charlotte.walker@myvilla.com', 1291, CURRENT_TIMESTAMP),
('Henry Young', 'henry.young@homelandmail.com', 1301, CURRENT_TIMESTAMP),
('Amelia Hall', 'amelia.hall@urbanestates.com', 1311, CURRENT_TIMESTAMP),
('Alexander Allen', 'alexander.allen@yourspace.com', 1321, CURRENT_TIMESTAMP),
('Harper King', 'harper.king@truehomeowners.com', 1331, CURRENT_TIMESTAMP),
('Daniel Wright', 'daniel.wright@estatexpress.com', 1341, CURRENT_TIMESTAMP),
('Evelyn Scott', 'evelyn.scott@greenkeyhomes.com', 1351, CURRENT_TIMESTAMP);
