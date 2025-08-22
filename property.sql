SELECT * FROM public.property
CREATE SEQUENCE property_property_id_seq
    START WITH 1001
    INCREMENT BY 10
    MINVALUE 1001
    MAXVALUE 9999
    CACHE 1;
CREATE TABLE public.property (
    property_id INTEGER PRIMARY KEY DEFAULT nextval('property_property_id_seq'),
    property_name VARCHAR(25) NOT NULL,
    property_description VARCHAR(255) NOT NULL,
    property_type VARCHAR(25) NOT NULL,
    property_size INT NOT NULL,
    property_image BYTEA NOT NULL,
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO public.property (
    property_name,
    property_description,
    property_type,
    property_size,
    property_image,
    joined_at
) VALUES
('1B/1B Urban Apartment', 'Cozy 1 bed, 1 bath apartment', 'Apartment', 1100, decode('', 'hex'), CURRENT_TIMESTAMP),
('1B/2B Guest-Ready Condo', '1 bed with extra bath, ideal for guests', 'Condo', 1200, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/1B Family Apartment', 'Spacious 2 bed, 1 bath flat', 'Apartment', 1500, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/2B Modern Condo', 'Comfortable 2 bed, 2 bath condo', 'Condo', 1600, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/3B Spacious House', 'Family home with 2 bed, 3 baths', 'House', 1900, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/1B Starter Home', 'Three bed, single bath home', 'House', 2000, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/2B Townhouse Retreat', 'Modern 3 bed, 2 bath townhouse', 'Townhouse', 2200, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/3B Elegant Duplex', 'Stylish 3 bed, 3 bath duplex', 'Duplex', 2500, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/4B Luxury Villa', 'Luxury 3 bed, 4 bath villa', 'Villa', 2800, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/1B Budget House', '4 bedrooms with shared bath', 'House', 3000, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/2B Suburban Home', 'Spacious 4 bed, 2 bath home', 'House', 3200, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/3B Family Residence', 'Family 4 bed, 3 bath residence', 'House', 3500, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/4B Executive Villa', 'Premium 4 bed, 4 bath house', 'Villa', 3700, decode('', 'hex'), CURRENT_TIMESTAMP),
('1B/1B Urban Apartment', '1 bed retreat with garden view', 'Apartment', 1050, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/2B Modern Condo', 'Corner unit with 2 bed and 2 bath', 'Condo', 1700, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/2B Townhouse Retreat', 'Stylish layout with 3 bed, 2 bath', 'Townhouse', 2400, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/1B Family Apartment', 'Minimalist 2 bed flat', 'Apartment', 1400, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/3B Elegant Duplex', 'Bright and airy 3 bed, 3 bath', 'House', 2700, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/4B Executive Villa', 'Elite 4 bed home with pool', 'Villa', 4000, decode('', 'hex'), CURRENT_TIMESTAMP),
('1B/2B Guest-Ready Condo', 'Unique 1 bed unit with dual baths', 'Condo', 1300, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/3B Spacious House', 'Entertainer’s dream home', 'Townhouse', 1850, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/1B Starter Home', 'Budget-friendly 3 bed flat', 'Apartment', 1950, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/1B Budget House', 'Roomy 4 bed with single bath', 'House', 3100, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/2B Townhouse Retreat', 'Open-plan 3 bed layout', 'Duplex', 2300, decode('', 'hex'), CURRENT_TIMESTAMP),
('1B/1B Urban Apartment', 'City studio with 1 bed and bath', 'Apartment', 1025, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/3B Family Residence', 'Three bath home, great for families', 'House', 3600, decode('', 'hex'), CURRENT_TIMESTAMP),
('2B/2B Modern Condo', 'Balanced living in 2 bed condo', 'Condo', 1750, decode('', 'hex'), CURRENT_TIMESTAMP),
('3B/4B Luxury Villa', 'Modern luxury with 4 baths', 'Villa', 2900, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/2B Suburban Home', 'Convenient 4 bed home near park', 'House', 3300, decode('', 'hex'), CURRENT_TIMESTAMP),
('4B/4B Executive Villa', 'Top-tier 4 bed luxury estate', 'Villa', 7000, decode('', 'hex'), CURRENT_TIMESTAMP),
('Studio Apartment', 'Modern studio, perfect for singles', 'Apartment', 850, decode('', 'hex'), CURRENT_TIMESTAMP),
('1 Bed Loft', 'Loft-style unit with open layout', 'Loft', 1050, decode('', 'hex'), CURRENT_TIMESTAMP),
('2 Bed Garden Flat', 'Garden-level 2 bed apartment', 'Flat', 1250, decode('', 'hex'), CURRENT_TIMESTAMP),
('2 Bed Penthouse', 'Luxury penthouse with 2 bedrooms', 'Penthouse', 1800, decode('', 'hex'), CURRENT_TIMESTAMP),
('3 Bed Bungalow', 'Charming 3 bed single-story home', 'Bungalow', 1950, decode('', 'hex'), CURRENT_TIMESTAMP),
('4 Bed Townhouse', 'Spacious townhouse with 4 bedrooms', 'Townhouse', 2200, decode('', 'hex'), CURRENT_TIMESTAMP);
