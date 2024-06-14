-- VIEWS

-- 1. View cu 2 tabele care afiseaza seria de sasiu, modelul auto si pretul autovehiculelor impreuna cu reprezentantele care le-au vandut

CREATE VIEW auto_vandute_de_reprez AS
SELECT 
    p_autovehicule.serie_sasiu, 
    p_autovehicule.model_auto, 
    p_autovehicule.pret_vanzare, 
    p_reprezentante.denumire AS reprezentanta
FROM p_autovehicule 
LEFT JOIN p_reprezentante ON p_autovehicule.cod_rpa = p_reprezentante.cod;
SELECT * FROM auto_vandute_de_reprez;

-- Interogare care afiseaza instantele din view-ul de mai sus cu un pret de vanzare mai mare decat un numar introdus de la tastatura
SELECT * FROM auto_vandute_de_reprez WHERE pret_vanzare > :pret_introdus;



-- 2. View cu 2 tabele care afseaza clientii si departamentele din care provin
CREATE VIEW departamente_clienti AS
SELECT 
    p_clienti.nume,
    p_clienti.prenume,
    p_orase.cod AS cod_oras,
    p_orase.denumire AS denumire_oras
FROM p_clienti
JOIN p_orase ON p_clienti.cod_ors = p_orase.cod;
SELECT * FROM departamente_clienti;

-- Interogare care afiseaza view-ul de mai sus in ordine alfabetica a clientilor
SELECT * FROM departamente_clienti ORDER BY nume ASC, prenume ASC;



-- 3. View cu 3 tabele care afiseaza atat autovehiculele vandute, cat si cele nevandute. 
-- In cazul autovehiculelor vandute, se va afisa numarul facturii, data si ora facturii, nume si prenume client, iar pentru toate autovehiculele se va afisa model autovehicul si pretul de vanzare.
CREATE VIEW detalii_vanzari AS 
SELECT 
    p_vanzari.nr_factura, 
    TO_CHAR(p_vanzari.data_ora, 'DD/MM/YYYY HH24:MI:SS') AS data_ora_completa, 
    p_clienti.nume AS nume_client, 
    p_clienti.prenume AS prenume_client, 
    p_autovehicule.modeL_auto, 
    p_autovehicule.pret_vanzare
FROM p_vanzari 
FULL JOIN p_clienti ON p_vanzari.cod_cet = p_clienti.cod
FULL JOIN p_autovehicule ON p_vanzari.serie_sasiu_aul = p_autovehicule.serie_sasiu;
SELECT * FROM detalii_vanzari;

-- Interogare care afiseaza doar autovehiculele vandute din view-ul de mai sus
SELECT * FROM detalii_vanzari WHERE nr_factura IS NOT NULL;



-- 4. View cu 3 tabele care afiseaza reprezentantele si valoarea autovehiculelor vandute de ei pana in prezent
CREATE VIEW valoare_vanzari_reprezentante AS
SELECT 
    p_reprezentante.cod,
    p_reprezentante.denumire,
    p_reprezentante.adresa,
    SUM(p_autovehicule.pret_vanzare * (1 - NVL(p_vanzari.reducere, 0))) AS valoare_vanzari
FROM p_reprezentante
JOIN p_autovehicule ON p_reprezentante.cod = p_autovehicule.cod_rpa
JOIN p_vanzari ON p_autovehicule.serie_sasiu = p_vanzari.serie_sasiu_aul
GROUP BY p_reprezentante.cod, p_reprezentante.denumire, p_reprezentante.adresa; 
SELECT * FROM valoare_vanzari_reprezentante;

-- Interogare care afiseaza reprezentantele din view-ul de mai sus in ordinea valorii vanzarilor efectuate
SELECT * FROM valoare_vanzari_reprezentante ORDER BY valoare_vanzari DESC;