SELECT * FROM products
ORDER BY productLine DESC, productName;

SELECT * FROM products
ORDER BY 2 DESC, 3;

SELECT * FROM products
ORDER BY 2 DESC, 3 LIMIT 5;

SELECT * FROM products
ORDER BY 2 DESC, 3 LIMIT 10,5;

SELECT sum(buyprice),
min(buyPrice),
max(buyPrice),
avg(buyPrice)
FROM products
WHERE productLine = 'Trains';

SELECT productLine,
sum(buyPrice),
min(buyPrice),
max(buyPrice),
avg(buyPrice)
FROM products
WHERE productLine LIKE '%i%'
GROUP BY productLine HAVING sum(buyPrice) > 1000
ORDER BY 2 DESC LIMIT 1;

SELECT DISTINCT productLine FROM products;

# Postavite cijenu na 10 svim
# proizvodima koji u svom nazivu
# nemaju slovo i

UPDATE products
SET buyPrice = 10
WHERE productName NOT LIKE '%i%';

# Koliko ima proizvoda koji koštaju 10

SELECT sum(1) FROM products
WHERE buyPrice = 10;
# ili
SELECT count(*) FROM products
WHERE buyPrice = 10;

# Svim proizvodima koji imaju cijenu 10
# povećajte cijenu za 10%

UPDATE products
SET buyPrice = buyPrice * 1.1
WHERE buyPrice = 10;

# Unesite sebe kao glavnog šefa

INSERT INTO employees
(employeeNumber, lastName, firstName, extension, email, officeCode, jobTitle)
VALUES
(1003, 'Krnjakovic', 'Filip', 'x31000', 'f.krnja@gmail.com', '1', 'The Great Leader');

# Kolegu do sebe unesite kao svog podređenog
INSERT INTO employees
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES
(1004, 'Poljak', 'Dino', 'x31000', 'dpoljak@gmail.com', '1', 1003, 'The Great Leader''s Great Helper');

# Obrisati sve proizvode u kategoriji planes
SELECT * FROM orderdetails
WHERE productCode IN
(SELECT productCode
FROM products
WHERE productLine = 'Planes');

DELETE FROM orderdetails
WHERE productCode IN
(SELECT productCode
FROM products
WHERE productLine = 'Planes');

DELETE FROM products
WHERE productLine = 'Planes';

# Izlistajte sve jedinstvene nazive proizvoda 
# i njihove cijene koje su kupili
# kupci iz Las Vegasa
SELECT DISTINCT d.productName, d.buyPrice
FROM customers a INNER JOIN orders b ON a.customerNumber = b.customerNumber
INNER JOIN orderdetails c ON b.orderNumber = c.orderNumber
INNER JOIN products d ON c.productCode = d.productCode
WHERE a.city = 'Las Vegas'
ORDER BY 1;

# Koliko je proizvoda kupljeno u kojoj državi
SELECT a.state, count(d.productCode)
FROM customers a INNER JOIN orders b ON a.customerNumber = b.customerNumber
INNER JOIN orderdetails c ON b.orderNumber = c.orderNumber
INNER JOIN products d ON c.productCode = d.productCode
GROUP BY a.state;

# Svim proizvodima kupljenim u Las Vegasu 
# povećati cijenu za 10%

UPDATE products a
INNER JOIN orderdetails b ON a.productCode = b.productCode
INNER JOIN orders c ON b.orderNumber = c.orderNumber
INNER JOIN customers d ON c.customerNumber = d.customerNumber
SET a.buyPrice = a.buyPrice * 1.1
WHERE d.city = 'Las Vegas';

# Obrisati sve proizvode koje su kupili
# kupci koji dolaze iz Los Angelesa

CREATE TABLE zabrisanje
SELECT DISTINCT d.productCode, d.productName, d.buyPrice
FROM customers a
INNER JOIN orders b ON a.customerNumber = b.customerNumber
INNER JOIN orderdetails c ON b.orderNumber = c.orderNumber
INNER JOIN products d ON c.productCode = d.productCode
WHERE a.city = 'Los Angeles'
ORDER BY 1;

DELETE FROM orderdetails
WHERE productCode in
(SELECT productCode
FROM zabrisanje);

DELETE FROM products
WHERE productCode in
(SELECT productCode
FROM zabrisanje);

DROP TABLE zabrisanje;

# Tablici products dodati kolonu 
# aktivan logički tip podatka

ALTER TABLE products
ADD aktivan BOOLEAN;

# Izlistajte sve zaposlenike kojima je šefica
# Diane Murphy bez korištenja vrijednosti 
# primarnih i vanjskih ključeva (brojeva)

SELECT b.firstName, b.lastName
FROM employees a
INNER JOIN employees b ON a.employeeNumber = b.reportsTo
WHERE a.lastName = 'Murphy' AND a.firstName = 'Diane';

# Ispišite imena i prezimena djelatnika 
# ureda u Tokyo

SELECT a.firstName, a.lastName
FROM employees a
INNER JOIN offices b ON a.officeCode = b.officeCode
WHERE b.city = 'Tokyo';

# Otvorite novi ured u Osijeku

INSERT INTO offices
(officeCode, city, phone, addressLine1, state, country, postalCode, territory)
VALUES
('8', 'Osijek', '031', 'Vukovarska 100', 'Osjecko-baranjska', 'Croatia', '31000', 'Europe');
