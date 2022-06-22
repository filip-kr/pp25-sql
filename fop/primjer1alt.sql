# FOP primjer1
# Alternativna rješenja

# 0. Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS primjer1;
CREATE DATABASE primjer1;
USE primjer1;

CREATE TABLE muskarac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    maraka DECIMAL(17,7) NOT NULL,
    hlace VARCHAR(45) NOT NULL,
    prstena INT(11) NOT NULL,
    nausnica INT(11),
    neprijateljica INT(11) NOT NULL
);

CREATE TABLE neprijateljica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    indiferentno TINYINT(1) NOT NULL,
    modelnaocala VARCHAR(39) NOT NULL,
    maraka DECIMAL(12,10) NOT NULL,
    kratkamajica VARCHAR(32) NOT NULL,
    ogrlica INT(11)
);

CREATE TABLE sestra(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    introvertno TINYINT(1) NOT NULL,
    carape VARCHAR(41),
    suknja VARCHAR(40),
    narukvica INT(11) NOT NULL
);

CREATE TABLE punac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    modelnaocala VARCHAR(39),
    treciputa DATETIME,
    drugiputa DATETIME,
    novcica DECIMAL(14,6) NOT NULL,
    narukvica INT(11)
);

CREATE TABLE zarucnica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    stilfrizura VARCHAR(40),
    prstena INT(11) NOT NULL,
    gustoca DECIMAL(14,5),
    modelnaocala VARCHAR(35) NOT NULL,
    nausnica INT(11) NOT NULL
);

ALTER TABLE muskarac ADD FOREIGN KEY (neprijateljica) REFERENCES neprijateljica(id);

# 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 980 i 5098. 
# Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču.

DELIMITER //

CREATE FUNCTION zadatak1( broj INT )
RETURNS BOOLEAN
DETERMINISTIC
BEGIN
    
    RETURN broj >= 980 AND broj <= 5098;

END; //
DELIMITER ;

# 2. Kreirajte proceduru zadatak2 koja unosi 56872 zapisa u tablicu zarucnica. Izvesti proceduru jednom
# tako da u tablici bude točno 56872 zapisa.

DELIMITER //

CREATE PROCEDURE zadatak2 ()
BEGIN

    DECLARE i INT DEFAULT 1;
    
    WHILE i <= 56872 DO
        
        INSERT INTO zarucnica (stilfrizura, prstena, gustoca)
        VALUES ("neki stil", 3, 2.5);
        
        SET i = i + 1;
            
    END WHILE;

END; //
DELIMITER ;

# 3. Kreirajte okidač zadatak3 nakon insert-a u tablicu zarucnica tako da za svaki unos u tablicu zarucnica
# napravi po dva unosa u tablicu punac. Okidač je u funkciji, tablica punac ima dvostruko više zapisa od
# tablice zarucnica.

DELIMITER //
CREATE FUNCTION onInsertTrigger()
RETURNS BIT
DETERMINISTIC
BEGIN

    INSERT INTO punac (modelnaocala, treciputa)
    VALUES ("neki model", NOW());
    
    INSERT INTO punac (modelnaocala, treciputa)
    VALUES ("neki drugi model", NOW());
    
    RETURN 0;

END; //
DELIMITER ;

# 4. Kreirajte proceduru zadatak4 koja iz tablice zarucnica zbraja svaku 7 vrijednost id-a (1,7,14,...). U tablicu
# muskarac se unosi broj zapisa koji odgovaraju izračunatoj sumi. Izvesti proceduru jednom tako da u
# tablici muskarac bude točan broj zapisa koji odgovaraju sumi odabranih brojeva.

DELIMITER //

CREATE PROCEDURE zadatak4()
BEGIN
    DECLARE i INT DEFAULT 0;
    
    SELECT @sumaSvakogSedmog := IFNULL(SUM(id), 0) FROM zarucnica WHERE MOD(id, 7) = 0;
    
    WHILE i < @sumaSvakogSedmog DO
    
        SET i = i + 1;
        
        INSERT INTO muskarac (maraka, hlace)
        VALUES (10.5, "neke hlace");
    
    END WHILE;

END; //
DELIMITER ;