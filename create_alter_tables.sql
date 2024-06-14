-- create tables

CREATE TABLE p_departamente
(
    numar NUMBER(2) PRIMARY KEY, 
    denumire VARCHAR2(30) NOT NULL UNIQUE
);
DESCRIBE p_departamente;

CREATE TABLE p_orase
(
    cod VARCHAR2(5) PRIMARY KEY, 
    denumire VARCHAR2(25) NOT NULL UNIQUE, 
    numar_dpt NUMBER(2) NOT NULL REFERENCES p_departamente(numar)
);
DESCRIBE p_orase;

CREATE TABLE p_clienti
(
    cod NUMBER(5) PRIMARY KEY,
    persoana VARCHAR2(8) NOT NULL CHECK(persoana IN ('juridica', 'fizica')),
    nume VARCHAR2(20) NOT NULL,
    prenume VARCHAR2(20) NOT NULL,
    email VARCHAR2(35) NOT NULL,
    adresa VARCHAR2(35) NOT NULL,
    nr_telefon CHAR(12) NOT NULL,
    cod_postal NUMBER(5) NOT NULL,
    cod_ors VARCHAR2(5) NOT NULL REFERENCES p_orase(cod)
);
DESCRIBE p_clienti;

CREATE TABLE p_reprezentante
(
    cod CHAR(3) PRIMARY KEY,
    denumire VARCHAR2(15) NOT NULL,
    adresa VARCHAR2(35) NOT NULL,
    cod_postal NUMBER(5) NOT NULL,
    nr_telefon VARCHAR2(12) NOT NULL
);
DESCRIBE p_reprezentante;

CREATE TABLE p_autovehicule
(
    serie_sasiu VARCHAR2(17) PRIMARY KEY,
    model_auto VARCHAR2(10) NOT NULL,
    an_productie DATE NOT NULL,
    echipare VARCHAR2(9) NOT NULL,
    pret_vanzare NUMBER(6) NOT NULL,
    culoare VARCHAR2(25) NOT NULL,
    transmisie CHAR(1) NOT NULL CHECK (transmisie IN ('A', 'M')),
    putere_motor NUMBER(3) NOT NULL,
    cuplu NUMBER(3) NOT NULL,
    dim_anvelope VARCHAR2(15) NOT NULL,
    tip VARCHAR2(10) NOT NULL CHECK (tip IN('SUV', 'Hatchback', 'Sedan', 'Crossover')),
    autonomie NUMBER(3) NOT NULL,
    data_disponibilitate DATE NOT NULL, 
    capacitate_baterie NUMBER(2,1),
    consum_mediu NUMBER(2,1),
    motorizare NUMBER(2,1),
    indice_euro NUMBER(1),
    tip_carburant VARCHAR2(10), 
    cod_rpa CHAR(3) NOT NULL REFERENCES p_reprezentante(cod)
);
DESCRIBE p_autovehicule;

CREATE TABLE p_vanzari
(
    nr_factura NUMBER(4),
    data_ora DATE,
    tip_plata CHAR(8) NOT NULL CHECK (tip_plata IN ('Integral', 'Rate')),
    reducere NUMBER(4,2),
    cod_cet NUMBER(5) NOT NULL REFERENCES p_clienti(cod),
    serie_sasiu_aul VARCHAR2(17) NOT NULL REFERENCES p_autovehicule(serie_sasiu),
    PRIMARY KEY (nr_factura, data_ora)
);
DESCRIBE p_vanzari;

CREATE TABLE p_angajati
(
    cod NUMBER(4) PRIMARY KEY,
    nume VARCHAR2(20) NOT NULL,
    prenume VARCHAR2(20) NOT NULL,
    salar NUMBER(5) NOT NULL,
    data_ang DATE NOT NULL,
    tip_ang CHAR(8) NOT NULL,
    bonus NUMBER(4),
    cod_ors VARCHAR2(5) NOT NULL REFERENCES p_orase(cod), 
    cod_rpa CHAR(3) NOT NULL REFERENCES p_reprezentante(cod),
    cod_drr NUMBER(4) REFERENCES p_angajati(cod)
);
DESCRIBE p_angajati;


-- structure alterations

-- 1. Alter "p_departamente" table so that its number can only be between 8 and 88
ALTER TABLE p_departamente MODIFY numar NUMBER(2) CHECK (numar BETWEEN 8 AND 88);


-- 2. Alter "p_autovehicule" table so that "indice_euro" is between 1 and 6
ALTER TABLE p_autovehicule MODIFY indice_euro NUMBER(1) CHECK (indice_euro BETWEEN 1 AND 6);

-- 3. Modific tabela reprezentante astfel incat denumire sa fie de lungime 20 in loc de 15, pentru a putea incapea nume mai lungi de reprezentante
ALTER TABLE p_reprezentante MODIFY denumire VARCHAR2(20);
DESCRIBE p_reprezentante;

-- 4. Modific tabela autovehicule astfel incat echiparea sa fie Dynamic, Exclusive sau Active
ALTER TABLE p_autovehicule MODIFY echipare VARCHAR2(9) CHECK (echipare IN ('Active', 'Dynamic', 'Exclusive'));

-- 5. Modific tabela autovehicule astfel incat autonomia sa poata depasi 999 
ALTER TABLE p_autovehicule MODIFY autonomie NUMBER(4);  

-- 6. Modific tabela autovehicule astfel incat atributul putere_motor sa fie redenumit in putere, pentru a se alinia mai bine cu specificatiile unei masini electrice
ALTER TABLE p_autovehicule RENAME COLUMN putere_motor TO putere;

-- 7. Modific tabela autovehicule astfel incat capacitate baterie sa poată fi de forma xx.x
ALTER TABLE p_autovehicule MODIFY capacitate_baterie NUMBER(3,1);
DESCRIBE p_autovehicule;
