-- VIEWS

-- 1. View with 2 tables that display the chassis number, the vehicle model and the vehicle price, alongside with the dealerships that sold them
CREATE VIEW cars_sold_by_dealer AS
SELECT 
    vehicles.chassis_nb, 
    vehicles.vehicle_model, 
    vehicles.price, 
    dealers.name AS dealer
FROM vehicles 
LEFT JOIN dealers ON vehicles.id_rpa = dealers.id;
SELECT * FROM cars_sold_by_dealer;

-- Query that displays the delerships from the created view, that have a total sum greater than a an input number
Interogare care afiseaza instantele din view-ul de mai sus cu un pret de vanzare mai mare decat un number introdus de la tastatura
SELECT * FROM cars_sold_by_dealer WHERE price > :total_sum;



-- 2. View with 2 tables that display the clients and their departments
CREATE VIEW dealers_clients AS
SELECT 
    clients.name,
    clients.surname,
    cities.id AS id_oras,
    cities.name AS name_oras
FROM clients
JOIN cities ON clients.id_ors = cities.id;
SELECT * FROM dealers_clients;

-- Query that displayes the data in the created view in alphabetical order of the clients' names
SELECT * FROM dealers_clients ORDER BY name ASC, surname ASC;



-- 3. View with 3 tables that displays the sold vehicles, as well as the ones that were not sold yet.
-- In the case of the sold vehicles, we will also display the invoic number, the date and time of the purchase, the name of the client.
-- We will also display the vehicle model and the selling price.
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

-- Query that displays the sold vehicles only, using the view above.
SELECT * FROM sale_details WHERE invoice_nb IS NOT NULL;



-- 4. View with 3 tables that displays the dealerships and the value of vehicles that each one of them sold
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

-- Query that displays the dealerships from the created viewm, sorting them by the value of their sells, starting with the biggest value
SELECT * FROM dealer_total_sales ORDER BY valoare_vanzari DESC;
