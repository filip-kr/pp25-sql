# FOP primjer3
# Ukupno vrijeme: 22:29/45:00
# Komentar: Vježbati zadatak 4 bez referiranja

# 0. Kreirajte tablice i veze između tablica.
DROP DATABASE IF EXISTS primjer3;
CREATE DATABASE primjer3;
USE primjer3;

CREATE TABLE neprijatelj(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gustoca DECIMAL(13,6) NOT NULL,
    treciputa DATETIME NOT NULL,
    novcica DECIMAL(12,8),
    narukvica INT(11) NOT NULL,
    prijateljica INT(11)
);

CREATE TABLE prijateljica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gustoca DECIMAL(12,7),
    maraka DECIMAL(14,9) NOT NULL,
    treciputa DATETIME,
    narukvica INT(11) NOT NULL
);

CREATE TABLE ostavljen(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ekstroventno TINYINT(1),
    haljina VARCHAR(42),
    nausnica INT(11),
    narukvica INT(11)
);

CREATE TABLE djevojka(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lipa DECIMAL(13,5),
    majica VARCHAR(35) NOT NULL,
    indiferentno TINYINT(1) NOT NULL,
    kuna DECIMAL(14,8),
    narukvica INT(11) NOT NULL
);

CREATE TABLE punica(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bojaociju VARCHAR(40) NOT NULL,
    modelnaocala VARCHAR(42) NOT NULL,
    ekstroventno TINYINT(1),
    asocijalno TINYINT(1),
    prstena INT(11)
);

ALTER TABLE neprijatelj ADD FOREIGN KEY (prijateljica) REFERENCES prijateljica(id);

# 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1346 i 5367. 
# Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču.

DELIMITER $$
CREATE FUNCTION zadatak1(cijeliBroj INT) RETURNS INT
BEGIN
    IF (cijeliBroj > 1346 AND cijeliBroj < 5367) THEN
    RETURN cijeliBroj;
    ELSE
    RETURN NULL;
    END IF;
END
$$
DELIMITER ;

INSERT INTO prijateljica
(id, maraka, narukvica)
VALUES
(NULL, 12.3, zadatak1(1400));


# 2. Kreirajte proceduru zadatak2 koja unosi 33501 zapisa u tablicu ostavljen. Izvesti proceduru jednom
# tako da u tablici bude točno 33501 zapisa.

DELIMITER $$
CREATE PROCEDURE zadatak2()
BEGIN
    DECLARE a INT DEFAULT 0;
    WHILE (a < 33501) DO
    INSERT INTO ostavljen
    (id)
    VALUES
    (NULL);
    SET a = a + 1;
    END WHILE;
END
$$
DELIMITER ;

CALL zadatak2();

# 3. Kreirajte okidač zadatak3 nakon insert-a u tablicu ostavljen tako da za svaki unos u tablicu ostavljen
# napravi po dva unosa u tablicu djevojka. Okidač je u funkciji, tablica djevojka ima dvostruko više zapisa
# od tablice ostavljen.

DELIMITER $$
CREATE TRIGGER zadatak3 AFTER INSERT ON ostavljen FOR EACH ROW
BEGIN
    INSERT INTO djevojka
    (id, majica, indiferentno, narukvica)
    VALUES
    (NULL, 'Plava', 2, zadatak1(2800)),
    (NULL, 'Smeđa', 2, zadatak1(3000));
END
$$
DELIMITER ;

INSERT INTO ostavljen
(id)
VALUES
(NULL);

# 4. Kreirajte proceduru zadatak4 koja iz tablice ostavljen zbraja svaku 8 vrijednost id-a (1,8,16,...). U tablicu
# neprijatelj se unosi broj zapisa koji odgovaraju izračunatoj sumi. Izvesti proceduru jednom tako da u
# tablici neprijatelj bude točan broj zapisa koji odgovaraju sumi odabranih brojeva.

DELIMITER $$
CREATE PROCEDURE zadatak4(IN brojRedova INT)
BEGIN
    DECLARE a INT DEFAULT 0;
    DECLARE b INT DEFAULT 0;
    DECLARE c INT DEFAULT 1;
    DECLARE d INT DEFAULT 0;
    WHILE (a < brojRedova) DO
    SET a = a + 1;
    SET b = b + 1;
    IF (b = 8) THEN
    SET b = 0;
    SET c = c + a;
    END IF;
    END WHILE;
    IF (a = brojRedova) THEN
    WHILE (d < c) DO
    INSERT INTO neprijatelj
    (id, gustoca, treciputa, narukvica)
    VALUES
    (NULL, 12,2, NOW(), zadatak1(3100));
    SET d = d + 1;
    END WHILE;
    END IF;
END
$$
DELIMITER ;

# CALL zadatak4(33502)