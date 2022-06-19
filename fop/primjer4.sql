# FOP primjer4
# Ukupno vrijeme: 17;16/45:00
# Komentar: Zadovoljavajuće

# 0. Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS primjer4;
CREATE DATABASE primjer4;
USE primjer4;

CREATE TABLE ostavljen(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kratkamajica VARCHAR(39) NOT NULL,
    narukvica INT(11) NOT NULL,
    prstena INT(11),
    nausnica INT(11) NOT NULL,
    sestra INT(11)
);

CREATE TABLE sestra(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    indiferentno TINYINT(1),
    eura DECIMAL(15,9) NOT NULL,
    ogrlica INT(11) NOT NULL,
    narukvica INT(11)
);

CREATE TABLE punac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    narukvica INT(11),
    eura DECIMAL(15,8) NOT NULL,
    indiferentno TINYINT(1) NOT NULL,
    prstena INT(11)
);

CREATE TABLE svekrva(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kuna DECIMAL(14,8) NOT NULL,
    dukserica VARCHAR(32) NOT NULL,
    maraka DECIMAL(14,7) NOT NULL,
    narukvica INT(11) NOT NULL
);

CREATE TABLE svekar(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kuna DECIMAL(12,6),
    kratkamajica VARCHAR(45),
    novcica DECIMAL(12,8),
    indiferentno TINYINT(1),
    narukvica INT(11) NOT NULL
);

ALTER TABLE ostavljen ADD FOREIGN KEY (sestra) REFERENCES sestra(id);

# 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1275 i 5317. 
# Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču.

DELIMITER $$
CREATE FUNCTION zadatak1(cijeliBroj INT) RETURNS INT
BEGIN
    IF (cijeliBroj > 1275 AND cijeliBroj < 5317) THEN
    RETURN cijeliBroj;
    ELSE
    RETURN NULL;
    END IF;
END
$$
DELIMITER ;

INSERT INTO sestra
(id, eura, ogrlica)
VALUES
(NULL, 12.2, zadatak1(1300));

# 2. Kreirajte proceduru zadatak2 koja unosi 49888 zapisa u tablicu svekrva. Izvesti proceduru jednom
# tako da u tablici bude točno 49888 zapisa.

DELIMITER $$
CREATE PROCEDURE zadatak2()
BEGIN
    DECLARE a INT DEFAULT 0;
    WHILE (a < 49888) DO
    INSERT INTO svekrva
    (id, kuna, dukserica, maraka, narukvica)
    VALUES
    (NULL, 12.3, 'Crvena', 13.4, zadatak1(1400));
    SET a = a + 1;
    END WHILE;
END
$$
DELIMITER ;

# CALL zadatak2();

# 3. Kreirajte okidač zadatak3 nakon insert-a u tablicu svekrva tako da za svaki unos u tablicu svekrva napravi
# po dva unosa u tablicu svekar. Okidač je u funkciji, tablica svekar ima dvostruko više zapisa od tablice
# svekrva.

DELIMITER $$
CREATE TRIGGER zadatak3 AFTER INSERT ON svekrva FOR EACH ROW
BEGIN
    INSERT INTO svekar
    (id, kuna, kratkamajica, novcica, indiferentno, narukvica)
    VALUES
    (NULL, 17.5, 'Crvena', 42.3, 3, zadatak1(2000)),
    (NULL, 17.5, 'Crvena', 42.3, 3, zadatak1(2000));
END
$$
DELIMITER ;

# 4. Kreirajte proceduru zadatak4 koja iz tablice svekrva zbraja svaku 5 vrijednost id-a (1,5,10,...). U tablicu
# ostavljen se unosi broj zapisa koji odgovaraju izračunatoj sumi. Izvesti proceduru jednom tako da u
# tablici ostavljen bude točan broj zapisa koji odgovaraju sumi odabranih brojeva.

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
    IF (b = 5) THEN
    SET b = 0;
    SET c = c + a;
    END IF;
    END WHILE;
    IF (a = brojRedova) THEN
    WHILE (d < c) DO
    INSERT INTO ostavljen
    (id, kratkamajica, narukvica, nausnica)
    VALUES
    (NULL, 'Fruit of the Loom', 1, zadatak1(3500));
    SET d = d + 1;
    END WHILE;
    END IF;
END
$$
DELIMITER ;

# CALL zadatak4(49888)