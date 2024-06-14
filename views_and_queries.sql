-- VIEWS

-- 1. View cu 2 tabele care afiseaza seria de sasiu, modelul auto si pretul autovehiculelor impreuna cu reprezentantele care le-au vandut

CREATE VIEW cars_sold_by_dealer AS
SELECT 
    vehicles.chassis_nb, 
    vehicles.vehicle_model, 
    vehicles.price, 
    dealers.name AS dealer
FROM vehicles 
LEFT JOIN dealers ON vehicles.id_rpa = dealers.id;
SELECT * FROM cars_sold_by_dealer;

-- Interogare care afiseaza instantele din view-ul de mai sus cu un pret de vanzare mai mare decat un number introdus de la tastatura
SELECT * FROM cars_sold_by_dealer WHERE price > :pret_introdus;



-- 2. View cu 2 tabele care afseaza clientii si departamentele din care provin
CREATE VIEW dealers_clients AS
SELECT 
    clients.name,
    clients.surname,
    cities.id AS id_oras,
    cities.name AS name_oras
FROM clients
JOIN cities ON clients.id_ors = cities.id;
SELECT * FROM dealers_clients;

-- Interogare care afiseaza view-ul de mai sus in ordine alfabetica a clientilor
SELECT * FROM dealers_clients ORDER BY name ASC, surname ASC;



-- 3. View cu 3 tabele care afiseaza atat autovehiculele vandute, cat si cele nevandute. 
-- In cazul autovehiculelor vandute, se va afisa numberul facturii, data si ora facturii, name si surname client, iar pentru toate autovehiculele se va afisa model autovehicul si pretul de vanzare.
CREATE VIEW sale_details AS 
SELECT 
    sales.invoice_nb, 
    TO_CHAR(sales.date_time, 'DD/MM/YYYY HH24:MI:SS') AS date_time_completa, 
    clients.name AS name_client, 
    clients.surname AS surname_client, 
    vehicles.vehicle_model, 
    vehicles.price
FROM sales 
FULL JOIN clients ON sales.id_cet = clients.id
FULL JOIN vehicles ON sales.chassis_nb_aul = vehicles.chassis_nb;
SELECT * FROM sale_details;

-- Interogare care afiseaza doar autovehiculele vandute din view-ul de mai sus
SELECT * FROM sale_details WHERE invoice_nb IS NOT NULL;



-- 4. View cu 3 tabele care afiseaza reprezentantele si valoarea autovehiculelor vandute de ei pana in prezent
CREATE VIEW dealer_total_sales AS
SELECT 
    dealers.id,
    dealers.name,
    dealers.address,
    SUM(vehicles.price * (1 - NVL(sales.promo, 0))) AS valoare_vanzari
FROM dealers
JOIN vehicles ON dealers.id = vehicles.id_rpa
JOIN sales ON vehicles.chassis_nb = sales.chassis_nb_aul
GROUP BY dealers.id, dealers.name, dealers.address; 
SELECT * FROM dealer_total_sales;

-- Interogare care afiseaza reprezentantele din view-ul de mai sus in ordinea valorii vanzarilor efectuate
SELECT * FROM dealer_total_sales ORDER BY valoare_vanzari DESC;
