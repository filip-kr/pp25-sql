# FOP primjer2
# Ukupno vrijeme: 23:43/45:00
# Komentar: Smanjiti referiranje na primjer1; nastaviti vježbati

# 0. Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS primjer2;
CREATE DATABASE primjer2;
USE primjer2;

CREATE TABLE muskarac(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    eura DECIMAL(15,7) NOT NULL,
    haljina VARCHAR(41) NOT NULL,
    hlace VARCHAR(34) NOT NULL,
    bojakose VARCHAR(42) NOT NULL,
    narukvica INT(11),
    prijatelj INT(11) NOT NULL
);

CREATE TABLE prijatelj(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    gustoca DECIMAL(16,5),
    suknja VARCHAR(41) NOT NULL,
    asocijalno TINYINT(1) NOT NULL,
    majica VARCHAR(48),
    prstena INT(11) NOT NULL
);

CREATE TABLE becar(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    maraka DECIMAL(12,10),
    treciputa DATETIME NOT NULL,
    ekstroventno TINYINT(1) NOT NULL,
    nausnica INT(11)
);

CREATE TABLE ostavljen(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ekstroventno TINYINT(1) NOT NULL,
    bojaociju VARCHAR(38) NOT NULL,
    nausnica INT(11) NOT NULL,
    gustoca DECIMAL(16,7),
    narukvica INT(11)
);

CREATE TABLE zarucnik(
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kratkamajica VARCHAR(44),
    lipa DECIMAL(15,8),
    ekstroventno TINYINT(1) NOT NULL,
    ogrlica INT(11) NOT NULL,
    narukvica INT(11)
);

ALTER TABLE muskarac ADD FOREIGN KEY (prijatelj) REFERENCES prijatelj(id);

# 1. Kreirati funkciju zadatak1 koja osigurava kako cjelobrojni tipovi podataka moraju biti između 1076 i 4697. 
# Primjeniti funkciju u minimalno jednom upitu u proceduri ili okidaču.

DELIMITER $$
CREATE FUNCTION zadatak1(cijeliBroj INT) RETURNS INT
BEGIN
    IF (cijeliBroj > 1076 AND cijeliBroj < 4697) THEN
    RETURN cijeliBroj;
    ELSE
    RETURN NULL;
    END IF;
END
$$
DELIMITER ;

INSERT INTO prijatelj
(id, suknja, asocijalno, prstena)
VALUES
(NULL, 'Nema', 3, zadatak1(1100));

# 2. Kreirajte proceduru zadatak2 koja unosi 24064 zapisa u tablicu becar. Izvesti proceduru jednom tako
# da u tablici bude točno 24064 zapisa.

DELIMITER $$
CREATE PROCEDURE zadatak2()
BEGIN
    DECLARE a INT DEFAULT 0;
    WHILE (a < 24064) DO
    INSERT INTO becar
    (id, treciputa, ekstroventno)
    VALUES
    (NULL, NOW(), 1);
    SET a = a + 1;
    END WHILE;
END
$$
DELIMITER ;

CALL zadatak2();

# 3. Kreirajte okidač zadatak3 nakon insert-a u tablicu becar tako da za svaki unos u tablicu becar napravi po
# dva unosa u tablicu ostavljen. Okidač je u funkciji, tablica ostavljen ima dvostruko više zapisa od tablice
# becar.

DELIMITER $$
CREATE TRIGGER zadatak3 AFTER INSERT ON becar FOR EACH ROW
BEGIN
    INSERT INTO ostavljen
    (id, ekstroventno, bojaociju, nausnica)
    VALUES
    (NULL, 1, 'Smeđa', zadatak1(2000)),
    (NULL, 1, 'Plava', zadatak1(2500));
END
$$
DELIMITER ;

# 4. Kreirajte proceduru zadatak4 koja iz tablice becar zbraja svaku 8 vrijednost id-a (1,8,16,...). U tablicu
# muskarac se unosi broj zapisa koji odgovaraju izračunatoj sumi. Izvesti proceduru jednom tako da u
# tablici muskarac bude točan broj zapisa koji odgovaraju sumi odabranih brojeva.

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
    INSERT INTO muskarac
    (id, eura, haljina, hlace, bojakose, prijatelj)
    VALUES
    (NULL, 12.3, 'Nema', 'Plave', 'Smeđa', 1);
    SET d = d + 1;
    END WHILE;
    END IF;
END
$$
DELIMITER ;

# CALL zadatak4(24065);