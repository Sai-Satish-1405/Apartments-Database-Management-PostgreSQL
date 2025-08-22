SELECT * FROM public.technician
CREATE OR REPLACE FUNCTION generate_technician_id() RETURNS TRIGGER AS $$ DECLARE initials TEXT; random_part TEXT; BEGIN 
initials := upper( 
    substring(NEW.technician_name, 1, 1) ||   
    substring(split_part(NEW.technician_name, ' ', 2), 1, 1)   
); 
random_part := lpad((trunc(random() * 9000 + 1000)::int)::text, 4, '0'); 
NEW.technician_id := initials || random_part; 
RETURN NEW; 
END; $$ LANGUAGE plpgsql;

CREATE TABLE public.technician ( technician_id TEXT PRIMARY KEY, technician_name VARCHAR(255) NOT NULL, technician_email VARCHAR(255) UNIQUE NOT NULL, availability_status VARCHAR(50) DEFAULT 'Available', joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ); 
ALTER TABLE public.service_request ADD CONSTRAINT fk_service_request_technician FOREIGN KEY (technician_id) REFERENCES public.technician (technician_id) ON DELETE CASCADE; 

CREATE TRIGGER set_technician_id BEFORE INSERT ON public.technician FOR EACH ROW WHEN (NEW.technician_id IS NULL) EXECUTE FUNCTION generate_technician_id(); 

INSERT INTO public.technician (technician_name, technician_email, availability_status) VALUES ('Saint Peter', 'saint.peter@dpapartments.com', 'Available'), ('John Doe', 'john.doe@dpapartments.com', 'Unavailable'), ('Jane Smith', 'jane.smith@dpapartments.com', 'Available'), ('Robert Brown', 'robert.brown@dpapartments.com', 'Unavailable'), ('Alice Green', 'alice.green@dpapartments.com', 'Available'), ('David White', 'david.white@dpapartments.com', 'Unavailable'), ('Eva Black', 'eva.black@dpapartments.com', 'Available'); 