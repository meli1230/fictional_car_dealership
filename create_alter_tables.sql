-- CREATE TABLES

CREATE TABLE departments
(
    number NUMBER(2) PRIMARY KEY, 
    name VARCHAR2(30) NOT NULL UNIQUE
);
DESCRIBE departments;

CREATE TABLE cities
(
    id VARCHAR2(5) PRIMARY KEY, 
    name VARCHAR2(25) NOT NULL UNIQUE, 
    number_dpt NUMBER(2) NOT NULL REFERENCES departments(number)
);
DESCRIBE cities;

CREATE TABLE clients
(
    id NUMBER(5) PRIMARY KEY,
    person VARCHAR2(20) NOT NULL CHECK(person IN ('legalPerson', 'naturalPerson')),
    name VARCHAR2(20) NOT NULL,
    surname VARCHAR2(20) NOT NULL,
    email VARCHAR2(35) NOT NULL,
    address VARCHAR2(35) NOT NULL,
    phone_nb CHAR(12) NOT NULL,
    postal_ide NUMBER(5) NOT NULL,
    id_ors VARCHAR2(5) NOT NULL REFERENCES cities(id)
);
DESCRIBE clients;

CREATE TABLE dealers
(
    id CHAR(3) PRIMARY KEY,
    name VARCHAR2(15) NOT NULL,
    address VARCHAR2(35) NOT NULL,
    postal_ide NUMBER(5) NOT NULL,
    phone_nb VARCHAR2(12) NOT NULL
);
DESCRIBE dealers;

CREATE TABLE vehicles
(
    chassis_nb VARCHAR2(17) PRIMARY KEY,
    vehicle_model VARCHAR2(10) NOT NULL,
    production_year DATE NOT NULL,
    equipment VARCHAR2(9) NOT NULL,
    price NUMBER(6) NOT NULL,
    color VARCHAR2(25) NOT NULL,
    transmission CHAR(1) NOT NULL CHECK (transmission IN ('A', 'M')),
    motor_power NUMBER(3) NOT NULL,
    torque NUMBER(3) NOT NULL,
    tire_size VARCHAR2(15) NOT NULL,
    type VARCHAR2(10) NOT NULL CHECK (type IN('SUV', 'Hatchback', 'Sedan', 'Crossover')),
    range NUMBER(3) NOT NULL,
    launch_date DATE NOT NULL, 
    battery_size NUMBER(2,1),
    fuel_efficiency NUMBER(2,1),
    powertrain NUMBER(2,1),
    euro_rating NUMBER(1),
    type_carburant VARCHAR2(10), 
    id_rpa CHAR(3) NOT NULL REFERENCES dealers(id)
);
DESCRIBE vehicles;

CREATE TABLE sales
(
    invoice_nb NUMBER(4),
    date_time DATE,
    type_plata CHAR(8) NOT NULL CHECK (type_plata IN ('Integral', 'Rate')),
    promo NUMBER(4,2),
    id_cet NUMBER(5) NOT NULL REFERENCES clients(id),
    chassis_nb_aul VARCHAR2(17) NOT NULL REFERENCES vehicles(chassis_nb),
    PRIMARY KEY (invoice_nb, date_time)
);
DESCRIBE sales;

CREATE TABLE employees
(
    id NUMBER(4) PRIMARY KEY,
    name VARCHAR2(20) NOT NULL,
    surname VARCHAR2(20) NOT NULL,
    salary NUMBER(5) NOT NULL,
    employment_date DATE NOT NULL,
    type_ang CHAR(8) NOT NULL,
    bonus NUMBER(4),
    id_ors VARCHAR2(5) NOT NULL REFERENCES cities(id), 
    id_rpa CHAR(3) NOT NULL REFERENCES dealers(id),
    id_drr NUMBER(4) REFERENCES employees(id)
);
DESCRIBE employees;


-- STRUCTURE CHANGES

-- 1. Change departments table so that number must be between 8 and 88
ALTER TABLE departments MODIFY number NUMBER(2) CHECK (number BETWEEN 8 AND 88);


-- 2. Change vehicles so that euro_rating must be between 1 and 6
ALTER TABLE vehicles MODIFY euro_rating NUMBER(1) CHECK (euro_rating BETWEEN 1 AND 6);

-- 3. Change dealers table so that name must be of length 20 instead of 15
ALTER TABLE dealers MODIFY name VARCHAR2(20);
DESCRIBE dealers;

-- 4. Change vehicles so that equiment must be eiter Dynamic, Exclusive or Active
ALTER TABLE vehicles MODIFY equipment VARCHAR2(9) CHECK (equipment IN ('Active', 'Dynamic', 'Exclusive'));

-- 5. Change vehicles table so that range can go past 999
ALTER TABLE vehicles MODIFY range NUMBER(4);  

-- 6. Change the name of the motor_power attribute from the vehicles table into power, so that it better aligns with the specificities of an electric vehicle
ALTER TABLE vehicles RENAME COLUMN motor_power TO power;

-- 7. Change vehicles table so that battery_size can take the form of xx.x
ALTER TABLE vehicles MODIFY battery_size NUMBER(3,1);
DESCRIBE vehicles;
