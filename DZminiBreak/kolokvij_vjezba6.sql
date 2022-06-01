# kolokvij_vjezba6
# Ukupno vrijeme: 19:26/45:00

-- 0. Kreirajte tablice (16) i veze između tablica.
DROP DATABASE IF EXISTS kolokvij_vjezba6;
CREATE DATABASE kolokvij_vjezba6;
USE kolokvij_vjezba6;

CREATE TABLE decko(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prviputa DATETIME,
    modelnaocala VARCHAR(41),
    nausnica INT,
    zena INT NOT NULL
);

CREATE TABLE zena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    novcica DECIMAL(14,8) NOT NULL,
    narukvica INT NOT NULL,
    dukserica VARCHAR(40),
    haljina VARCHAR(30),
    hlace VARCHAR(32),
    brat INT NOT NULL
);

CREATE TABLE brat(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nausnica INT NOT NULL,
    treciputa DATETIME NOT NULL,
    narukvica INT NOT NULL,
    hlace VARCHAR(31),
    prijatelj INT
);

CREATE TABLE prijatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    haljina VARCHAR(35),
    prstena INT NOT NULL,
    introvertno BOOLEAN,
    stilfrizura VARCHAR(36) NOT NULL
);

CREATE TABLE ostavljena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prviputa DATETIME NOT NULL,
    kratkamajica VARCHAR(39) NOT NULL,
    drugiputa DATETIME,
    maraka DECIMAL(14,10)
);

CREATE TABLE prijatelj_ostavljena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prijatelj INT NOT NULL,
    ostavljena INT NOT NULL
);

CREATE TABLE svekrva(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    hlace VARCHAR(48) NOT NULL,
    suknja VARCHAR(42) NOT NULL,
    ogrlica INT NOT NULL,
    treciputa DATETIME NOT NULL,
    dukserica VARCHAR(32) NOT NULL,
    narukvica INT NOT NULL,
    punac INT
);

CREATE TABLE punac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ekstroventno BOOLEAN NOT NULL,
    suknja VARCHAR(30) NOT NULL,
    majica VARCHAR(44) NOT NULL,
    prviputa DATETIME NOT NULL
);

ALTER TABLE decko ADD FOREIGN KEY (zena) REFERENCES zena(sifra);

ALTER TABLE zena ADD FOREIGN KEY (brat) REFERENCES brat(sifra);

ALTER TABLE brat ADD FOREIGN KEY (prijatelj) REFERENCES prijatelj(sifra);

ALTER TABLE prijatelj_ostavljena ADD FOREIGN KEY (prijatelj) REFERENCES prijatelj(sifra);
ALTER TABLE prijatelj_ostavljena ADD FOREIGN KEY (ostavljena) REFERENCES ostavljena(sifra);

ALTER TABLE svekrva ADD FOREIGN KEY (punac) REFERENCES punac(sifra);




-- 1. U tablice zena, brat i prijatelj_ostavljena unesite po 3 retka.

INSERT INTO brat
(sifra, nausnica, treciputa, narukvica)
VALUES
(null, 1, '2022-02-06', 0),
(null, 2, '2001-02-12', 1),
(null, 2, '2020-06-08', 2);

INSERT INTO zena
(sifra, novcica, narukvica, dukserica, brat)
VALUES
(null, 32, 1, 'Bordeaux', 1),
(null, 300, 2, 'Plava', 2),
(null, 153141, 3, 'Retro', 3);

INSERT INTO prijatelj
(sifra, prstena, stilfrizura)
VALUES
(null, 2, 'Irokeza'),
(null, 3, 'Zalizan'),
(null, 0, 'Jež');

INSERT INTO ostavljena
(sifra, prviputa, kratkamajica)
VALUES
(null, '1986-07-24', 'Fruit of the Loom'),
(null, '1996-06-20', 'Nike'),
(null, '1980-01-01', 'Polo majica');

INSERT INTO prijatelj_ostavljena
(sifra, prijatelj, ostavljena)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);



-- 2. U tablici svekrva postavite svim zapisima kolonu suknja na
-- vrijednost Osijek.

UPDATE svekrva
SET suknja = 'Osijek';


-- 3. U tablici decko obrišite sve zapise čija je vrijednost kolone
-- modelnaocala manje od AB.

DELETE FROM decko
WHERE modelnaocala < 'AB';


-- 4. Izlistajte narukvica iz tablice brat uz uvjet da vrijednost kolone
-- treciputa nepoznate.

SELECT narukvica
FROM brat
WHERE treciputa IS NULL;



-- 5. Prikažite drugiputa iz tablice ostavljena, zena iz tablice decko te
-- narukvica iz tablice zena uz uvjet da su vrijednosti kolone treciputa iz
-- tablice brat poznate te da su vrijednosti kolone prstena iz tablice
-- prijatelj jednake broju 219. Podatke posložite po narukvica iz tablice
-- zena silazno.

SELECT a.drugiputa, f.zena, e.narukvica
FROM ostavljena a INNER JOIN prijatelj_ostavljena b
ON a.sifra = b.ostavljena
INNER JOIN prijatelj c ON b.prijatelj = c.sifra
INNER JOIN brat d ON d.prijatelj = c.sifra
INNER JOIN zena e ON e.brat = d.sifra
INNER JOIN decko f ON f.zena = e.sifra
WHERE d.treciputa IS NOT NULL AND c.prstena = 219
ORDER BY e.narukvica DESC;






-- 6. Prikažite kolone prstena i introvertno iz tablice prijatelj čiji se
-- primarni ključ ne nalaze u tablici prijatelj_ostavljena

SELECT a.prstena, a.introvertno
FROM prijatelj a INNER JOIN prijatelj_ostavljena b
ON a.sifra = b.prijatelj
WHERE b.prijatelj IS NULL;