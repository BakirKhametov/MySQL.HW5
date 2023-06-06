CREATE DATABASE home_work5;
USE home_work5;
 
 CREATE TABLE Cars
(
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30) NULL,
    cost  INT NULL
);

INSERT INTO Cars (name, cost) VALUES ('Audi', 55000);
INSERT INTO Cars (name, cost) VALUES ('Mercedes', 57000);
INSERT INTO Cars (name, cost) VALUES ('Lada', 9000);
INSERT INTO Cars (name, cost) VALUES ('Toyota', 32000);
INSERT INTO Cars (name, cost) VALUES ('Ferrari', 400000);
INSERT INTO Cars (name, cost) VALUES ('Renault', 11000);
INSERT INTO Cars (name, cost) VALUES ('BMW', 58000);
INSERT INTO Cars (name, cost) VALUES ('KIA', 23000);	

SELECT * FROM Cars;

-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов

CREATE VIEW CheapCars AS SELECT Name FROM Cars WHERE Cost<25000;
SELECT * FROM CheapCars;

-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 35 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW CheapCars AS SELECT Name FROM Cars WHERE cost < 35000;
SELECT * FROM CheapCars;

-- 3. Создайте представление, в котором будут только автомобили марки “BMW” и “Audi”

ALTER VIEW CheapCars AS SELECT Name FROM Cars WHERE name IN ( 'BMW', 'Audi');
SELECT * FROM CheapCars;

-- 4. Вывести название и цену для всех анализов, которые продавались 5 февраля 2020 и всю следующую неделю.

CREATE TABLE Analysis
(
    an_id  INT AUTO_INCREMENT PRIMARY KEY,
    an_name VARCHAR(30) NOT NULL,
    an_cost INT,
	an_price INT,
	an_group INT
);
SELECT * FROM Analysis;

CREATE TABLE Groups1
(
    gr_id  INT AUTO_INCREMENT PRIMARY KEY,
    gr_name VARCHAR(30) NOT NULL,
	gr_temp INT
);
SELECT * FROM Groups1;

CREATE TABLE Orders
(
    ord_id  INT AUTO_INCREMENT PRIMARY KEY,
    ord_datetime DATE NOT NULL,
    ord_an INT,
    FOREIGN KEY (ord_an)
    REFERENCES Analysis(an_id)
);
SELECT * FROM Orders;

SELECT an_name, an_price
FROM Analysis
JOIN Orders
ON Analysis.an_id = Orders.ord_an
AND Orders.ord_datetime >= '2020-02-05'
AND Orders.ord_datetime <= '2020-02-12';
