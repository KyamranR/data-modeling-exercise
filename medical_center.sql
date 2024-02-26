

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    age INT NOT NULL
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE patient_visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES doctors(id),
    patient_id INT REFERENCES patients(id),
    disease_id INT REFERENCES diseases(id)
);

INSERT INTO doctors (name)
VALUES ('Dr. DoLittle');

INSERT INTO doctors (name)
VALUES ('Dr. DoAlot');

INSERT INTO patients (name, age)
VALUES ('Tiger', 25);

INSERT INTO patients (name, age)
VALUES ('Monkey', 50);

INSERT INTO diseases (disease_name)
VALUES ('Heart Diseases');

INSERT INTO diseases (disease_name)
VALUES ('Kidney Diseases');

INSERT INTO patient_visits (doctor_id, patient_id, disease_id)
VALUES (1, 1, 1); -- Dr. DoLittle sees Tiger for Heart Diseases

INSERT INTO patient_visits (doctor_id, patient_id, disease_id)
VALUES (2, 2, 2); -- Dr. DoAlot sees Monkey for Kidney Diseases