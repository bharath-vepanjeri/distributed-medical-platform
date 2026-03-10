-- V1__create_schema.sql
-- Schema matches entity classes exactly

USE medical_db;

CREATE TABLE IF NOT EXISTS symptom
(
    id      BIGINT AUTO_INCREMENT PRIMARY KEY,
    symptom VARCHAR(255) NOT NULL,
    UNIQUE KEY uk_symptom (symptom),
    INDEX idx_symptom (symptom)
);

CREATE TABLE IF NOT EXISTS disease
(
    id           BIGINT AUTO_INCREMENT PRIMARY KEY,
    disease_name VARCHAR(255) NOT NULL,
    UNIQUE KEY uk_disease_name (disease_name),
    INDEX idx_disease_name (disease_name)
);

CREATE TABLE IF NOT EXISTS medicine
(
    id       BIGINT AUTO_INCREMENT PRIMARY KEY,
    medicine VARCHAR(255) NOT NULL,
    UNIQUE KEY uk_medicine (medicine),
    INDEX idx_medicine (medicine)
);

CREATE TABLE IF NOT EXISTS medicine_safety_profile
(
    id                 BIGINT AUTO_INCREMENT PRIMARY KEY,
    usage_instructions VARCHAR(255) NOT NULL,
    dosage             VARCHAR(255),
    pregnancy_warning  VARCHAR(255),
    severity           VARCHAR(255),
    medicine_id        BIGINT       NOT NULL,
    UNIQUE KEY uk_medicine_id (medicine_id),
    CONSTRAINT fk_safety_medicine FOREIGN KEY (medicine_id) REFERENCES medicine (id)
);

CREATE TABLE IF NOT EXISTS symptom_diseases
(
    symptom_id BIGINT NOT NULL,
    disease_id BIGINT NOT NULL,
    PRIMARY KEY (symptom_id, disease_id),
    CONSTRAINT fk_sd_symptom FOREIGN KEY (symptom_id) REFERENCES symptom (id),
    CONSTRAINT fk_sd_disease FOREIGN KEY (disease_id) REFERENCES disease (id)
);

CREATE TABLE IF NOT EXISTS disease_medicine
(
    disease_id  BIGINT NOT NULL,
    medicine_id BIGINT NOT NULL,
    PRIMARY KEY (disease_id, medicine_id),
    CONSTRAINT fk_dm_disease  FOREIGN KEY (disease_id) REFERENCES disease (id),
    CONSTRAINT fk_dm_medicine FOREIGN KEY (medicine_id) REFERENCES medicine (id)
);

CREATE TABLE IF NOT EXISTS users
(
    id         BIGINT AUTO_INCREMENT PRIMARY KEY,
    active     BOOLEAN      NOT NULL DEFAULT TRUE,
    name       VARCHAR(255) NOT NULL,
    email      VARCHAR(255) NOT NULL,
    password   VARCHAR(255) NOT NULL,
    role       VARCHAR(50)  NOT NULL,
    created_at DATETIME     NOT NULL,
    UNIQUE KEY uk_email (email)
);

CREATE TABLE IF NOT EXISTS appointment
(
    id               BIGINT AUTO_INCREMENT PRIMARY KEY,
    patient_id       BIGINT,
    doctor_id        BIGINT,
    version          BIGINT,
    appointment_time DATETIME(6),
    status           VARCHAR(50),
    payment_id       VARCHAR(255),
    amount           BIGINT,
    notes            VARCHAR(255),
    UNIQUE KEY uq_doctor_time (doctor_id, appointment_time)
);
