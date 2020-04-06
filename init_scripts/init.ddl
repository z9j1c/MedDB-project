/* This script creates database and all its initial tables */

CREATE DATABASE MED_DEPARTMENT_DB;

CREATE TABLE PATIENTS
(
    patient_id SERIAL PRIMARY KEY,
    patient_nm VARCHAR(255) NOT NULL,
    birth_dt DATE NOT NULL,
    sex_dk SMALLINT NOT NULL,
    citizenship_dk SMALLINT NOT NULL
);

CREATE TABLE EMPLOYEES
(
    employee_id SERIAL PRIMARY KEY,
    employee_nm VARCHAR(255) NOT NULL,
    position_title VARCHAR(255) NOT NULL,
    birth_dt DATE NOT NULL,
    sex_dk SMALLINT NOT NULL,
    accept_dt DATE CHECK (accept_dt > birth_dt)
);

CREATE TABLE FILES
(
    medfile_id SERIAL PRIMARY KEY,
    patient_id SERIAL NOT NULL,
    doctor_id SERIAL,
    register_dt DATE CHECK (register_dt > '1/1/1970'),
    FOREIGN KEY(patient_id) REFERENCES PATIENTS(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE CLINICAL_SUMMARIES
(
    medfile_id SERIAL PRIMARY KEY,
    diagnosis_txt TEXT NOT NULL,
    treatment_txt TEXT NOT NULL,
    conclusion_txt TEXT NOT NULL,
    FOREIGN KEY(medfile_id) REFERENCES FILES(medfile_id)
);

CREATE TABLE DUTIES
(
    duty_id SERIAL PRIMARY KEY,
    begin_dttm TIMESTAMP NOT NULL,
    end_dttm TIMESTAMP NOT NULL,
    office_no VARCHAR(16)
);

CREATE TABLE CLINICAL_RECORDS
(
    record_id SERIAL PRIMARY KEY,
    service_id VARCHAR(32) NOT NULL,
    medfile_id SERIAL,
    record_dt DATE NOT NULL,
    providing_dt DATE CHECK (record_dt >= providing_dt),
    employee_id SERIAL,
    FOREIGN KEY(medfile_id) REFERENCES FILES(medfile_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE SPECIALIST_ADVICES
(
    check_code VARCHAR(64) PRIMARY KEY,
    employee_id SERIAL,
    medfile_id SERIAL,
    advice_dt DATE NOT NULL,
    subject_txt TEXT,
    conclusion_txt TEXT,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id),
    FOREIGN KEY(medfile_id) REFERENCES FILES(medfile_id)
);

CREATE TABLE MEDICINE_DISPERSING
(
    dispersing_id SERIAL PRIMARY KEY,
    patient_id SERIAL,
    employee_id SERIAL,
    FOREIGN KEY(patient_id) REFERENCES PATIENTS(patient_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE MEDICINE
(
    dispersing_id SERIAL PRIMARY KEY,
    medicine_title VARCHAR(96) NOT NULL,
    FOREIGN KEY(dispersing_id) REFERENCES MEDICINE_DISPERSING(dispersing_id)
);

CREATE TABLE ARTICLES
(
    doi_code VARCHAR(48) PRIMARY KEY,
    employee_id SERIAL,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE CONFERENCES
(
    conf_id SERIAL PRIMARY KEY,
    conf_title TEXT NOT NULL,
    country_code SMALLINT
);

CREATE TABLE SCIENTIFIC_COUNCIL
(
    meeting_id SERIAL PRIMARY KEY,
    meeting_dt DATE NOT NULL,
    conclusion_txt TEXT
);

CREATE TABLE CONF_X_EMPLOYEES
(
    conf_id SERIAL,
    employee_id SERIAL,
    PRIMARY KEY(conf_id, employee_id),
    FOREIGN KEY(conf_id) REFERENCES CONFEERENCES(conf_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE COUNCIL_X_EMPLOYEES
(
    meeting_id SERIAL,
    employee_id SERIAL,
    PRIMARY KEY(meeting_id, employee_id),
    FOREIGN KEY(meeting_id) REFERENCES SCIENTIFIC_COUNCIL(meeting_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id)
);

CREATE TABLE DUTIES_X_EMPLOYEES
(
    employee_id SERIAL,
    duty_id SERIAL,
    PRIMARY KEY(employee_id, duty_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEES(employee_id),
    FOREIGN KEY(duty_id) REFERENCES DUTIES(duty_id)
);