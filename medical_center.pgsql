


DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;




-- Design the schema for a medical center.

-- A medical center employs several doctors
-- A doctors can see many patients
-- A patient can be seen by many doctors
-- During a visit, a patient may be diagnosed to have one or more diseases.


CREATE TABLE medical_center(

    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL

);


CREATE TABLE doctor (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    medical_center_id INTEGER NOT NULL REFERENCES medical_center
    -- FOREIGN KEY (medical_center_id) REFERENCES medical_center (id)

);

CREATE TABLE patient (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
    
    
);

CREATE TABLE doctor_patient (
    doctor_id INTEGER NOT NULL REFERENCES doctor,
    patient_id INTEGER NOT NULL REFERENCES patient
    -- CONSTRAINT doctor_patient_pk PRIMARY KEY (doctor_id, patient_id),
    -- CONSTRAINT FK_doctor FOREIGN KEY (doctor_id) REFERENCES doctor (doctor_id),
    -- CONSTRAINT FK_patient FOREIGN KEY (patient_id) REFERENCES patient (patient_id)



);



CREATE TABLE disease (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    patient_id  INTEGER NOT NULL REFERENCES patient
    -- FOREIGN KEY (patient_id) REFERENCES patient (id)
);

-- CREATE TABLE diagnose(
--     id SERIAL PRIMARY KEY,
--     visit_id INTEGER REFERENCES patients(patient_id),
--     disease_id INTEGER  REFERENCES disease,
--     notes TEXT
--     disease_id INTEGER NOT NULL, 
--     FOREIGN KEY (disease_id) REFERENCES disease (id)
-- );



INSERT INTO medical_center (name) VALUES ('Santos Hospital');
INSERT INTO doctor (name, medical_center_id) VALUES ('DR. SHEPARD',1), ('DR. MENDEZ',1), ('DR. GREY',1);
INSERT INTO patient (name) VALUES ('Kelly'), ( 'Genesis'), ('Mattie');
INSERT INTO disease (name,patient_id) VALUES ('Asthma',1), ('Corona Virus',2),('E.Coli',3);
-- -- INSERT INTO diagnose (visit_id, disease_id, notes) VALUES (11,1,'its tough for them'), (22,2,'lungs are weak'), (33,3,'feels unwell');