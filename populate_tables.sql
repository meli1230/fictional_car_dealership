-- POPULATE

-- Populate departments table
INSERT INTO departments VALUES (10, 'Aube');
INSERT INTO departments VALUES (51, 'Marne');
INSERT INTO departments VALUES (8, 'Ardennes');
INSERT INTO departments VALUES (55, 'Meuse'); 
INSERT INTO departments VALUES (52, 'Haute-Marne');
INSERT INTO departments VALUES (54, 'Meurthe-et-Moselle');
INSERT INTO departments VALUES (57, 'Moselle');
INSERT INTO departments VALUES (88, 'Vosges');  
INSERT INTO departments VALUES (67, 'Haut-Rhin');
INSERT INTO departments VALUES (68, 'Bas-Rhin');  
SELECT * FROM departments; 
    

-- Populate cities table
INSERT INTO cities VALUES ('TRO', 'Troyes', 10);
INSERT INTO cities VALUES ('CHAL', 'Chalons-en-Champagne', 51);
INSERT INTO cities VALUES ('CHARL', 'Charleville Mezieres', 8);
INSERT INTO cities VALUES ('VOUZ', 'Vouziers', 8);
INSERT INTO cities VALUES ('BAR', 'Bar-le-Duc', 55);
INSERT INTO cities VALUES ('CHAU', 'Chaumont', 52);
INSERT INTO cities VALUES ('NAN', 'Nancy', 54);
INSERT INTO cities VALUES ('MTZ', 'Metz', 57);
INSERT INTO cities VALUES ('EPIN', 'Epinal', 88);
INSERT INTO cities VALUES ('COL', 'Colmar', 67);
INSERT INTO cities VALUES ('MLH', 'Mulhouse', 67);
INSERT INTO cities VALUES ('STRAS', 'Strasbourg', 68);
SELECT * FROM cities;


-- Populate clients table
INSERT INTO clients VALUES (57962, 'naturalPerson', 'Dubois', 'Camille', 'camille.dubois@yahoo.fr', '16 Rue de la Monnaie', '+33654321098', 10000, 'TRO'); 
INSERT INTO clients VALUES (12567, 'legalPerson', 'Martin', 'Lea', 'martin.lea83@gmail.com', '1 Place de la Cathedrale', '+33187654321', 68000, 'COL'); 
INSERT INTO clients VALUES (56324, 'legalPerson', 'Leroy', 'Antoine', 'leroyantoine@yahoo.fr', '2 Rue des Hallebardes', '+33921436587', 67000, 'STRAS'); 
INSERT INTO clients VALUES (59135, 'naturalPerson', 'Dubois', 'Charlotte', 'charl_dubois_94@outlook.com', '26 Place Ducale', '+33298765432', 80000, 'EPIN');
INSERT INTO clients VALUES (68523, 'naturalPerson', 'Rousseau', 'Manon', 'manonr.ouss@mail.com', '9 Rue des Etats-Unis', '+33164857925', 88000, 'EPIN');
INSERT INTO clients VALUES (48756, 'legalPerson', 'Lefevre', 'Louis', 'louis-lefevre@gmail.com', '1 Rue des Francs-Burgeois', '+33659421875', 68100, 'MLH');
SELECT * FROM clients;


-- Populate dealers table
INSERT INTO dealers VALUES ('ATA', 'Aube Toyota', '98 Rue de la Contrefacon', 10000, '+33354956283');
INSERT INTO dealers VALUES ('MAO', 'Marne Auto', '12 Rue des Fleurs', 54000, '+33356985402');
INSERT INTO dealers VALUES ('ADS', 'Ardennes Motors', '46 Avenue des Champs', 08000, '+33356854261');
INSERT INTO dealers VALUES ('MAS', 'Meuse Automobiles', '78 Rue des Chenes', 55000, '+33326512403');
INSERT INTO dealers VALUES ('HMR', 'Haute-Marne Cars', '101 Place des Etoiles', 52000, '+33326150142');
INSERT INTO dealers VALUES ('MMR', 'Meurthe Motors', '21 Boulevard des Lilas', 52000, '+33365210524');
INSERT INTO dealers VALUES ('MAR', 'Moselle Auto Center', '34 Rue des Roses', 57000, '+33362542102');
INSERT INTO dealers VALUES ('VTA', 'Vosges Toyota', '42 Rue des Sapins', 88000, '+33312015640');
INSERT INTO dealers VALUES ('HRR', 'Haut Rhin Motors', '5 Avenue des Vignes', 68000, '+33312504652');
INSERT INTO dealers VALUES ('BRS', 'Bas Rhin Autohaus', '98 Place des Ormes', 67000, '+33325162482');
INSERT INTO dealers VALUES ('HRA', 'Haut Rhin Toyota', '1 Rue des Oliviers', 68000, '+33125015632');
SELECT * FROM dealers;


-- Populate vehicles table
-- Hybrid
INSERT INTO vehicles VALUES ('ASDW5496825643520', 'Yaris', TO_DATE('2020', 'YYYY'), 'Dynamic', 22500, 'Ruby Flare Pearl', 'A', 116, 120, '195/50 R16', 'Hatchback', 800, TO_DATE('11/09/2025', 'DD/MM/YYYY'), 1.5, 4, 1.5, 6, 'Petrol', 'ADS');
INSERT INTO vehicles VALUES ('ODUE4592635978421', 'RAV4', TO_DATE('2021', 'YYYY'), 'Active', 35000, 'Lunar Rock', 'A', 218, 221, '235/55 R19', 'SUV', 1000, TO_DATE('11/09/2024', 'DD/MM/YYYY'), 2.5, 5, 2.5, 6, 'Petrol', 'MMR');
INSERT INTO vehicles VALUES ('ADDE5468259536521', 'C-HR', TO_DATE('2023', 'YYYY'), 'Exclusive', 35000, 'Black', 'A', 220, 142, '225/60 R17', 'Crossover', 800, TO_DATE('15/07/2026', 'DD/MM/YYYY'), 5, 4.5, 2, 6, 'Petrol', 'HMR');
INSERT INTO vehicles VALUES ('PGIR4582165982365', 'Camry', TO_DATE('2022', 'YYYY'), 'Dynamic', 42000, 'Super White', 'A', 230, 220, '235/45 R18', 'Sedan', 700, TO_DATE('20/08/2025', 'DD/MM/YYYY'), 6.5, 4.9, 2, 6, 'Petrol', 'BRS'); 
INSERT INTO vehicles VALUES ('OVGD5489602135012', 'C-HR', TO_DATE('2023', 'YYYY'), 'Exclusive', 45000, 'Midnight Black Metallic', 'A', 202, 215, '235/60 R18', 'Crossover', 750, TO_DATE('05/04/2025', 'DD/MM/YYYY'), 8, 5.1, 2, 6, 'Petrol', 'HRR');
INSERT INTO vehicles VALUES ('PIII8549652365022', 'RAV4', TO_DATE('2024', 'YYYY'), 'Active', 48000, 'Blueprint', 'A', 176, 220, '235/65 R17', 'SUV', 800, TO_DATE('06/04/2026', 'DD/MM/YYYY'), 6.5, 5, 1.8, 6, 'Petrol', 'HRR');
-- Fuel
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, fuel_efficiency, powertrain, euro_rating, type_carburant, id_rpa)
VALUES ('JSHA4582163542546', 'Corolla', TO_DATE('2019', 'YYYY'), 'Exclusive', 25000, 'Blueprint', 'M', 132, 160, '205/55 R16', 'Sedan', 520, TO_DATE('01/01/2025', 'DD/MM/YYYY'), 6.5, 1.6, 6, 'Petrol', 'ADS');
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, fuel_efficiency, powertrain, euro_rating, type_carburant, id_rpa)
VALUES ('AORJ5246358154692', 'C-HR', TO_DATE('2023', 'YYYY'), 'Active', 33000, 'Supersonic Red', 'M', 120, 250, '215/60 R17', 'Crossover', 700, TO_DATE('20/04/2026', 'DD/MM/YYYY'), 5, 1.4, 6, 'Diesel', 'MAR');
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, fuel_efficiency, powertrain, euro_rating, type_carburant, id_rpa)
VALUES ('OVUY4857962352501', 'RAV4', TO_DATE('2022', 'YYYY'), 'Dynamic', 40000, 'Black', 'M', 203, 243, '235/60 R18', 'SUV', 550, TO_DATE('05/05/2026', 'DD/MM/YYYY'), 8.2, 1.6, 6, 'Diesel', 'HRA');
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, fuel_efficiency, powertrain, euro_rating, type_carburant, id_rpa)
VALUES ('FISH4859645236502', 'Yaris', TO_DATE('2021', 'YYYY'), 'Active', 25000, 'Supersonic Red', 'A', 95, 190, '185/60 R15', 'Hatchback', 800, TO_DATE('06/10/2026', 'DD/MM/YYYY'), 4, 1.2, 6, 'Diesel', 'ATA');
-- Electric
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, battery_size, id_rpa)
VALUES ('AOSD1245649865320', 'bZ4X', TO_DATE('2023', 'YYYY'), 'Exclusive', 45000, 'Super White', 'A', 201, 220, '225/60 R17', 'SUV', 300, TO_DATE('05/01/2026', 'DD/MM/YYYY'), 71.4, 'MAS');
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, battery_size, id_rpa)
VALUES ('NMTD5485936482514', 'RAV4 EV', TO_DATE('2022', 'YYYY'), 'Dynamic', 48000, 'Midnight Black Metallic', 'A', 218, 221, '235/65 R17', 'SUV', 320, TO_DATE('10/02/2026', 'DD/MM/YYYY'), 78, 'VTA');
INSERT INTO vehicles (chassis_nb, vehicle_model, production_year, equipment, price, color, transmission, power, torque, tire_size, type, range, launch_date, battery_size, id_rpa)
VALUES ('CURB5682549685214', 'Prius', TO_DATE('2024', 'YYYY'), 'Active', 42000, 'Super White', 'A', 150, 200, '195/65 R15', 'Hatchback', 250, TO_DATE('15/03/2024', 'DD/MM/YYYY'), 60, 'HRR');
SELECT * FROM vehicles;


-- Populate sales table
INSERT INTO sales VALUES (5246, TO_DATE('30/04/2024 15:34', 'DD/MM/YYYY HH24:MI'), 'Integral', NULL, 57962, 'JSHA4582163542546');
INSERT INTO sales VALUES (9863, TO_DATE('29/04/2024 13:45', 'DD/MM/YYYY HH24:MI'), 'Rate', NULL, 12567, 'ASDW5496825643520');
INSERT INTO sales VALUES (7852, TO_DATE('15/07/2023 14:08', 'DD/MM/YYYY HH24:MI'), 'Rate', 0.1, 56324, 'ODUE4592635978421');
INSERT INTO sales VALUES (9052, TO_DATE('14/03/2023 15:09', 'DD/MM/YYYY HH24:MI'), 'Integral', NULL, 59135, 'AOSD1245649865320');
INSERT INTO sales VALUES (1002, TO_DATE('21/12/2023 18:00', 'DD/MM/YYYY HH24:MI'), 'Rate', 0.05, 68523, 'AORJ5246358154692');
INSERT INTO sales VALUES (9053, TO_DATE('23/02/2024 16:02', 'DD/MM/YYYY HH24:MI'), 'Integral', NULL, 48756, 'OVUY4857962352501');
INSERT INTO sales VALUES (5982, TO_DATE('14/09/2022 15:51', 'DD/MM/YYYY HH24:MI'), 'Rate', NULL, 12567, 'NMTD5485936482514');
INSERT INTO sales VALUES (5000, TO_DATE('13/05/2023 16:01', 'DD/MM/YYYY HH24:MI'), 'Integral', 0.15, 59135, 'PIII8549652365022');
INSERT INTO sales VALUES (9782, TO_DATE('04/12/2023 09:54', 'DD/MM/YYYY HH24:MI'), 'Rate', NULL, 12567, 'PGIR4582165982365'); 

SELECT invoice_nb, TO_CHAR(date_time, 'DD/MM/YYYY HH24:MI:SS') AS date_time_completa, type_plata, promo, id_cet, chassis_nb_aul FROM sales;


-- Populate employees table
INSERT INTO employees VALUES (3515, 'Zimmermann', 'Lucas', 2500, TO_DATE('20/04/2023', 'DD/MM/YYYY'), 'Parttime', NULL, 'CHARL', 'MAO', NULL);
INSERT INTO employees VALUES (2514, 'Lemoine', 'Emilie', 7500, TO_DATE('15/04/2017', 'DD/MM/YYYY'), 'Fulltime', 1500, 'CHAL', 'MAO', NULL);
INSERT INTO employees VALUES (6951, 'Fischer', 'Lara', 8600, TO_DATE('16/05/2014', 'DD/MM/YYYY'), 'Fulltime', NULL, 'CHARL', 'ADS', NULL);
INSERT INTO employees VALUES (5481, 'Berger', 'Mathieu', 9000, TO_DATE('15/07/2018', 'DD/MM/YYYY'), 'Fulltime', 2500, 'BAR', 'MAS', NULL);
INSERT INTO employees VALUES (5483, 'Wagner', 'Charlotte', 12000, TO_DATE('21/07/2012', 'DD/MM/YYYY'), 'Fulltime', NULL, 'CHAU', 'HMR', NULL);
INSERT INTO employees VALUES (524, 'Leclerc', 'Sophie', 5000, TO_DATE('15/06/2015', 'DD/MM/YYYY'), 'Fulltime', 700, 'TRO', 'ATA', 3515);
INSERT INTO employees VALUES (625, 'Muller', 'Thomas', 4800, TO_DATE('20/09/2013', 'DD/MM/YYYY'), 'Fulltime', 600, 'CHAL', 'MAO', 3515);
INSERT INTO employees VALUES (152, 'Dupont', 'Elise', 1500, TO_DATE('01/10/2024', 'DD/MM/YYYY'), 'Parttime', NULL, 'CHARL', 'ADS', 2514);
INSERT INTO employees VALUES (854, 'Wagner', 'Julia', 5200, TO_DATE('11/05/2020', 'DD/MM/YYYY'), 'Fulltime', 800, 'BAR', 'MAS', 6951);
INSERT INTO employees VALUES (325, 'Schmitt', 'Antoine', 4900, TO_DATE('01/03/2019', 'DD/MM/YYYY'), 'Fulltime', NULL, 'CHAU', 'HMR', 6951);
INSERT INTO employees VALUES (521, 'Lefevre', 'Charlotte', 4700, TO_DATE('12/08/2016', 'DD/MM/YYYY'), 'Fulltime', 600, 'NAN', 'MMR', 5481);
INSERT INTO employees VALUES (458, 'Dubois', 'Alexandre', 4500, TO_DATE('20/05/2020', 'DD/MM/YYYY'), 'Fulltime', 200, 'MTZ', 'MAR', 5481);
INSERT INTO employees VALUES (523, 'Meier', 'Klaus', 3500, TO_DATE('07/10/2017', 'DD/MM/YYYY'), 'Fulltime', NULL, 'EPIN', 'VTA', 5483);
INSERT INTO employees VALUES (515, 'Berger', 'Marie', 4500, TO_DATE('15/10/2023', 'DD/MM/YYYY'), 'Fulltime', NULL, 'COL', 'HRR', 5483);
INSERT INTO employees VALUES (658, 'Schmidt', 'Lucas', 4000, TO_DATE('25/01/2013', 'DD/MM/YYYY'), 'Fulltime', 1000, 'STRAS', 'BRS', 6951);
INSERT INTO employees VALUES (254, 'Bernard', 'Margot', 1200, TO_DATE('20/01/2024', 'DD/MM/YYYY'), 'Parttime', NULL, 'MLH', 'HRA', 3515);
SELECT * FROM employees;



-- CONTENT UPDATES

-- 1. Chnage department of Dubois Charlotte from EPIN to CHARL
UPDATE clients SET id_ors = 'CHARL' WHERE id = 59135;
SELECT id, id_ors FROM clients;

-- 2. Change the color of the car with chassis number PGIR4582165982365 from Super White to Lunar Rock
UPDATE vehicles SET color = 'Lunar Rock' WHERE chassis_nb = 'PGIR4582165982365';
SELECT chassis_nb, color FROM vehicles;

-- 3. After Marin Lea's car arrived with a small production defect, the client gets a 7% promotion. As a result, the invoice must be modified
UPDATE sales SET promo = 0.07 WHERE invoice_nb = 9782;
SELECT invoice_nb, promo FROM sales;
