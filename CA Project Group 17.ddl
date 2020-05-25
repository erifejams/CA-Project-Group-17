-- Generated by Oracle SQL Developer Data Modeler 19.2.0.182.1216
--   at:        2019-12-15 20:50:12 GMT
--   site:      Oracle Database 12c
--   type:      Oracle Database 12c



DROP TABLE branch CASCADE CONSTRAINTS;

DROP TABLE car CASCADE CONSTRAINTS;

DROP TABLE contract CASCADE CONSTRAINTS;

DROP TABLE customer CASCADE CONSTRAINTS;

DROP TABLE employee CASCADE CONSTRAINTS;

DROP TABLE final_bill CASCADE CONSTRAINTS;

DROP TABLE online_sales CASCADE CONSTRAINTS;

DROP TABLE sale CASCADE CONSTRAINTS;

CREATE TABLE branch (
    branch_id             NUMBER(7) NOT NULL,
    branch_address        NVARCHAR2(320),
    branch_phone_number   INTEGER,
    booking_status        VARCHAR2(50) NOT NULL
)
LOGGING;

ALTER TABLE branch ADD CONSTRAINT branch_pk PRIMARY KEY ( branch_id );

CREATE TABLE car (
    registration_number       INTEGER NOT NULL,
    daily_cost                NVARCHAR2(320),
    details_of_manufacturer   VARCHAR2(50),
    model_id                  NUMBER(7),
    car_category              VARCHAR2(50),
    type_of_fuel              VARCHAR2(50),
    mileage_after             NUMBER(7, 2),
    mileage_before            NUMBER(7, 2)
)
LOGGING;

ALTER TABLE car ADD CONSTRAINT car_pk PRIMARY KEY ( registration_number );

CREATE TABLE contract (
    contract_id               NUMBER(7) NOT NULL,
    rental_period             INTEGER,
    fuel_amount               VARCHAR2(50),
    booking_status            VARCHAR2(50),
    pickup_date               DATE NOT NULL,
    pickup_time               DATE NOT NULL,
    return_date               DATE NOT NULL,
    return_time               DATE NOT NULL,
    pickup_location           NVARCHAR2(320) NOT NULL,
    dropoff_location          NVARCHAR2(320) NOT NULL,
    customer_customer_id      NUMBER(7),
    mileage_before            NUMBER(7, 2),
    mileage_after             NUMBER(7, 2),
    car_registration_number   INTEGER NOT NULL,
    branch_branch_id          NUMBER(7) NOT NULL,
    sale_sale_id              NUMBER(7) NOT NULL,
    final_bill_amount_owed    NUMBER(7, 2) NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX contract__idx ON
    contract (
        sale_sale_id
    ASC )
        LOGGING;

CREATE UNIQUE INDEX contract__idxv1 ON
    contract (
        final_bill_amount_owed
    ASC )
        LOGGING;

ALTER TABLE contract ADD CONSTRAINT contract_pk PRIMARY KEY ( contract_id );

CREATE TABLE customer (
    customer_id        NUMBER(7) NOT NULL,
    customer_name      VARCHAR2(50) NOT NULL,
    customer_age       INTEGER NOT NULL,
    customer_email     NVARCHAR2(320) NOT NULL,
    customer_address   NVARCHAR2(320) NOT NULL
)
LOGGING;

ALTER TABLE customer ADD CONSTRAINT customer_ck_1 CHECK ( customer_age >= 18 );

ALTER TABLE customer ADD CONSTRAINT customer_ck_2 CHECK ( customer_email LIKE '%@%.com' );

ALTER TABLE customer ADD CONSTRAINT customer_pk PRIMARY KEY ( customer_id );

CREATE TABLE employee (
    employee_id              NUMBER(7) NOT NULL,
    employee_address         NVARCHAR2(320) NOT NULL,
    employee_date_of_birth   DATE NOT NULL,
    employee_start_date      DATE NOT NULL,
    location_of_employment   NVARCHAR2(320) NOT NULL,
    branch_branch_id         NUMBER(7),
    employee_email_address   NVARCHAR2(320) NOT NULL,
    employee_name            VARCHAR2(50) NOT NULL
)
LOGGING;

COMMENT ON COLUMN employee.location_of_employment IS
    'head office or branch';

ALTER TABLE employee ADD CONSTRAINT employee_ck_1 CHECK ( employee_email_address LIKE '@speedyrentals.com' );

ALTER TABLE employee ADD CONSTRAINT employee_pk PRIMARY KEY ( employee_id );

CREATE TABLE final_bill (
    amount_owed NUMBER(7, 2) NOT NULL
)
LOGGING;

ALTER TABLE final_bill ADD CONSTRAINT final_bill_pk PRIMARY KEY ( amount_owed );

CREATE TABLE online_sales (
    transaction_state   VARCHAR2(50) NOT NULL,
    sale_sale_id        NUMBER(7) NOT NULL
)
LOGGING;

CREATE UNIQUE INDEX online_sales__idx ON
    online_sales (
        sale_sale_id
    ASC )
        LOGGING;

ALTER TABLE online_sales ADD CONSTRAINT online_sales_pk PRIMARY KEY ( transaction_state );

CREATE TABLE sale (
    sale_id                NUMBER(7) NOT NULL,
    employee_employee_id   NUMBER(7) NOT NULL
)
LOGGING;

ALTER TABLE sale ADD CONSTRAINT sale_pk PRIMARY KEY ( sale_id );

ALTER TABLE contract
    ADD CONSTRAINT contract_branch_fk FOREIGN KEY ( branch_branch_id )
        REFERENCES branch ( branch_id )
    NOT DEFERRABLE;

ALTER TABLE contract
    ADD CONSTRAINT contract_car_fk FOREIGN KEY ( car_registration_number )
        REFERENCES car ( registration_number )
    NOT DEFERRABLE;

ALTER TABLE contract
    ADD CONSTRAINT contract_customer_fk FOREIGN KEY ( customer_customer_id )
        REFERENCES customer ( customer_id )
    NOT DEFERRABLE;

ALTER TABLE contract
    ADD CONSTRAINT contract_final_bill_fk FOREIGN KEY ( final_bill_amount_owed )
        REFERENCES final_bill ( amount_owed )
    NOT DEFERRABLE;

ALTER TABLE contract
    ADD CONSTRAINT contract_sale_fk FOREIGN KEY ( sale_sale_id )
        REFERENCES sale ( sale_id )
    NOT DEFERRABLE;

ALTER TABLE employee
    ADD CONSTRAINT employee_branch_fk FOREIGN KEY ( branch_branch_id )
        REFERENCES branch ( branch_id )
    NOT DEFERRABLE;

ALTER TABLE online_sales
    ADD CONSTRAINT online_sales_sale_fk FOREIGN KEY ( sale_sale_id )
        REFERENCES sale ( sale_id )
    NOT DEFERRABLE;

ALTER TABLE sale
    ADD CONSTRAINT sale_employee_fk FOREIGN KEY ( employee_employee_id )
        REFERENCES employee ( employee_id )
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                             8
-- CREATE INDEX                             3
-- ALTER TABLE                             19
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- TSDP POLICY                              0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
