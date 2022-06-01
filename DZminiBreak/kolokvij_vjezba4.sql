# kolokvij_vjezba4
# Ukupno vrijeme: 25:00/45:00

-- 0. Kreirajte tablice (16) i veze između tablica.
DROP DATABASE IF EXISTS kolokvij_vjezba4;
CREATE DATABASE kolokvij_vjezba4;
USE kolokvij_vjezba4;

CREATE TABLE punac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    treciputa DATETIME,
    majica VARCHAR(46),
    jmbag CHAR(11) NOT NULL,
    novcica DECIMAL(18,7) NOT NULL,
    maraka DECIMAL(12,6) NOT NULL,
    ostavljen INT NOT NULL
);

CREATE TABLE ostavljen(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    modelnaocala VARCHAR(43),
    introvertno BOOLEAN,
    kuna DECIMAL(14,10)
);

CREATE TABLE zena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    suknja VARCHAR(39) NOT NULL,
    lipa DECIMAL(18,7),
    prstena INT NOT NULL
);

CREATE TABLE snasa(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    introvertno BOOLEAN,
    treciputa DATETIME,
    haljina VARCHAR(44) NOT NULL,
    zena INT NOT NULL
);

CREATE TABLE zena_mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zena INT NOT NULL,
    mladic INT NOT NULL
);

CREATE TABLE becar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    novcica DECIMAL(14,8),
    kratkamajica VARCHAR(48) NOT NULL,
    bojaociju VARCHAR(36) NOT NULL,
    snasa INT NOT NULL
);

CREATE TABLE mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kuna DECIMAL(15,9),
    lipa DECIMAL(18,5),
    nausnica INT,
    stilfrizura VARCHAR(49),
    vesta VARCHAR(34) NOT NULL
);

CREATE TABLE prijatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    eura DECIMAL(16,9),
    prstena INT NOT NULL,
    gustoca DECIMAL(16,5),
    jmbag CHAR(11) NOT NULL,
    suknja VARCHAR(47) NOT NULL,
    becar INT NOT NULL
);


ALTER TABLE punac ADD FOREIGN KEY (ostavljen) REFERENCES ostavljen(sifra);

ALTER TABLE prijatelj ADD FOREIGN KEY (becar) REFERENCES becar(sifra);

ALTER TABLE becar ADD FOREIGN KEY (snasa) REFERENCES snasa(sifra);

ALTER TABLE snasa ADD FOREIGN KEY (zena) REFERENCES zena(sifra);

ALTER TABLE zena_mladic ADD FOREIGN KEY (zena) REFERENCES zena(sifra);
ALTER TABLE zena_mladic ADD FOREIGN KEY (mladic) REFERENCES mladic(sifra);




-- 1. U tablice becar, snasa i zena_mladic unesite po 3 retka.
INSERT INTO zena
(sifra, suknja, prstena)
VALUES
(null, 'Kratka', 2),
(null, 'Dugačka', 3),
(null, 'Nema', 1);

INSERT INTO snasa
(sifra, haljina, zena)
VALUES
(null, 'Plava', 1),
(null, 'Crvena', 1),
(null, 'Zelena', 1);

INSERT INTO becar
(sifra, kratkamajica, bojaociju, snasa)
VALUES
(null, 'Plava', 'Smeđa', 1),
(null, 'Zelena', 'Smeđa', 2),
(null, 'Bijela', 'Smeđa', 3);

INSERT INTO mladic
(sifra, vesta)
VALUES
(null, 'Skupa'),
(null, 'Jeftina'),
(null, 'Poderana');

INSERT INTO zena_mladic
(sifra, zena, mladic)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);



-- 2. U tablici punac postavite svim zapisima kolonu majica na
-- vrijednost Osijek.

UPDATE punac
SET majica = 'Osijek'
WHERE sifra IS NOT NULL;

-- 3. U tablici prijatelj obrišite sve zapise čija je vrijednost kolone
-- prstena veće od 17.

DELETE FROM prijatelj
WHERE prstena > 17;



-- 4. Izlistajte haljina iz tablice snasa uz uvjet da vrijednost kolone
-- treciputa nepoznate.

SELECT haljina
FROM snasa 
WHERE treciputa IS NULL;




-- 5. Prikažite nausnica iz tablice mladic, jmbag iz tablice prijatelj te
-- kratkamajica iz tablice becar uz uvjet da su vrijednosti kolone
-- treciputa iz tablice snasa poznate te da su vrijednosti kolone lipa iz
-- tablice zena različite od 29. Podatke posložite po kratkamajica iz
-- tablice becar silazno. 

SELECT a.nausnica, b.jmbag, c.kratkamajica
FROM mladic a, prijatelj b, becar c, snasa d, zena e
WHERE d.treciputa IS NOT NULL AND e.lipa != 29
ORDER BY c.kratkamajica DESC;




-- 6. Prikažite kolone lipa i prstena iz tablice zena čiji se primarni ključ
-- ne nalaze u tablici zena_mladic.


SELECT a.lipa, a.prstena
FROM zena a INNER JOIN zena_mladic b
ON a.sifra = b.zena
WHERE b.zena IS NULL;