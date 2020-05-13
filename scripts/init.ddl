/* This script creates database and all its initial tables */

DROP DATABASE IF EXISTS MED_DEPARTMENT_DB;
CREATE DATABASE MED_DEPARTMENT_DB;
\connect MED_DEPARTMENT_DB

CREATE TABLE PATIENT
(
    patient_id SERIAL PRIMARY KEY,
    patient_nm VARCHAR(255) NOT NULL,
    birth_dt DATE NOT NULL,
    sex_code SMALLINT NOT NULL,
    citizenship_code SMALLINT NOT NULL
);

CREATE TABLE EMPLOYEE
(
    employee_id SERIAL PRIMARY KEY,
    employee_nm VARCHAR(255) NOT NULL,
    birth_dt DATE NOT NULL,
    sex_code SMALLINT NOT NULL,
    status_txt VARCHAR(32) DEFAULT 'Working'
);

CREATE TABLE POSITION
(
    employee_id SERIAL NOT NULL,
    position_title VARCHAR(255),
    begin_dt DATE CHECK (begin_dt > '1/1/1970'),
    end_dt DATE CHECK (end_dt >= begin_dt) DEFAULT '1/1/9999',
    PRIMARY KEY(employee_id, begin_dt),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE MEDFILE
(
    medfile_id SERIAL PRIMARY KEY,
    patient_id SERIAL NOT NULL,
    doctor_id SERIAL,
    register_dt DATE CHECK (register_dt > '1/1/1970'),
    FOREIGN KEY(patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY(doctor_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE CLINICAL_SUMMARY
(
    medfile_id SERIAL PRIMARY KEY,
    diagnosis_txt TEXT NOT NULL,
    treatment_txt TEXT NOT NULL,
    conclusion_txt TEXT NOT NULL,
    FOREIGN KEY(medfile_id) REFERENCES MEDFILE(medfile_id)
);

CREATE TABLE DUTY
(
    duty_id SERIAL PRIMARY KEY,
    begin_dttm TIMESTAMP NOT NULL,
    end_dttm TIMESTAMP NOT NULL,
    office_no VARCHAR(16)
);

CREATE TABLE CLINICAL_RECORD
(
    record_id SERIAL PRIMARY KEY,
    service_id VARCHAR(32) NOT NULL,
    medfile_id SERIAL,
    record_dt DATE NOT NULL,
    providing_dt DATE CHECK (record_dt <= providing_dt),
    employee_id SERIAL,
    FOREIGN KEY(medfile_id) REFERENCES MEDFILE(medfile_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE SPECIALIST_ADVICE
(
    check_code VARCHAR(64) PRIMARY KEY,
    employee_id SERIAL,
    medfile_id SERIAL,
    advice_dt DATE NOT NULL,
    subject_txt TEXT,
    conclusion_txt TEXT,
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY(medfile_id) REFERENCES MEDFILE(medfile_id)
);

CREATE TABLE MEDICINE_DISPERSING
(
    dispersing_id SERIAL PRIMARY KEY,
    patient_id SERIAL,
    employee_id SERIAL,
    FOREIGN KEY(patient_id) REFERENCES PATIENT(patient_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE MEDICINE
(
    dispersing_id SERIAL PRIMARY KEY,
    medicine_title VARCHAR(96) NOT NULL,
    FOREIGN KEY(dispersing_id) REFERENCES MEDICINE_DISPERSING(dispersing_id)
);

CREATE TABLE ARTICLE
(
    doi_code VARCHAR(48),
    employee_id SERIAL,
    PRIMARY KEY(doi_code, employee_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE CONFERENCE
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

CREATE TABLE CONF_X_EMPLOYEE
(
    conf_id SERIAL,
    employee_id SERIAL,
    PRIMARY KEY(conf_id, employee_id),
    FOREIGN KEY(conf_id) REFERENCES CONFERENCE(conf_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE COUNCIL_X_EMPLOYEE
(
    meeting_id SERIAL,
    employee_id SERIAL,
    PRIMARY KEY(meeting_id, employee_id),
    FOREIGN KEY(meeting_id) REFERENCES SCIENTIFIC_COUNCIL(meeting_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id)
);

CREATE TABLE DUTY_X_EMPLOYEE
(
    employee_id SERIAL,
    duty_id SERIAL,
    PRIMARY KEY(employee_id, duty_id),
    FOREIGN KEY(employee_id) REFERENCES EMPLOYEE(employee_id),
    FOREIGN KEY(duty_id) REFERENCES DUTY(duty_id)
);
