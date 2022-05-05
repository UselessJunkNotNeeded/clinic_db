-- created patients table
CREATE TABLE patients (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL
);

-- created medical_histories table
CREATE TABLE medical_histories (
  id SERIAL PRIMARY KEY,
  patient_id INT NOT NULL,
  admitted_at TIME NOT NULL,
  status VARCHAR(255) NOT NULL,
  FOREIGN KEY (patient_id) 
    REFERENCES patients (id)
    
);

-- craeted treatments table
CREATE TABLE treatments (
  id SERIAL PRIMARY KEY,
  type VARCHAR(255) NOT NULL,
  name VARCHAR(50) NOT NULL
);

-- created join table for treatments and medical_histories
CREATE TABLE medical_histories_treatments (
  medical_history_id INT NOT NULL,
  treatment_id INT NOT NULL,
  FOREIGN KEY (medical_history_id) 
    REFERENCES medical_histories (id)
    
  FOREIGN KEY (treatment_id) 
    REFERENCES treatments (id)
    
);

-- created invoices table 
CREATE TABLE invoices (
  id SERIAL PRIMARY KEY,
  generated_at TIME NOT NULL,
  payed_at TIME NOT NULL,
  total_amount DECIMAL NOT NULL,
  medical_history_id INT,
  FOREIGN KEY (medical_history_id) 
    REFERENCES medical_histories (id)
    
);


-- created invoice_items table
CREATE TABLE invoice_items (
  id SERIAL PRIMARY KEY,
  quantity INT NOT NULL, 
  unit_price DECIMAL NOT NULL,
  invoice_id INT,
  treatment_id INT,
  total_price DECIMAL NOT NULL,
  FOREIGN KEY (invoice_id) 
    REFERENCES invoices (id)
    
  FOREIGN KEY (treatment_id) 
    REFERENCES treatments (id)
    
);