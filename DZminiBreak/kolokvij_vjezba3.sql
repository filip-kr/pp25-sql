# kolokvij_vjezba3
# Ukupno vrijeme: 31:52/45:00

# 0. Kreirajte tablice (16) i veze između tablica.

DROP DATABASE IF EXISTS kolokvij_vjezba3;
CREATE DATABASE kolokvij_vjezba3 default charset utf8mb4;
USE kolokvij_vjezba3;

CREATE TABLE svekar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    novcica DECIMAL(16,4) NOT NULL,
    suknja VARCHAR(44) NOT NULL,
    bojakose VARCHAR(36),
    prstena INT,
    narukvica INT NOT NULL,
    cura INT NOT NULL
);

CREATE TABLE cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dukserica VARCHAR(49),
    maraka DECIMAL(13,7),
    drugiputa DATETIME,
    majica VARCHAR(49),
    novcica DECIMAL(15,8),
    ogrlica INT NOT NULL
);

CREATE TABLE ostavljena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kuna DECIMAL(17,5),
    lipa DECIMAL(15,6),
    majica VARCHAR(36),
    modelnaocala VARCHAR(31) NOT NULL,
    prijatelj INT
);

CREATE TABLE prijatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kuna DECIMAL(16,10),
    haljina VARCHAR(37),
    lipa DECIMAL(13,10),
    dukserica VARCHAR(31),
    indiferentno BOOLEAN NOT NULL
);

CREATE TABLE snasa(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    introvertno BOOLEAN,
    kuna DECIMAL(15,6) NOT NULL,
    eura DECIMAL(12,6) NOT NULL,
    treciputa DATETIME,
    ostavljena INT NOT NULL
);

CREATE TABLE punica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    asocijalno BOOLEAN,
    kratkamajica VARCHAR(44),
    kuna DECIMAL(13,8) NOT NULL,
    vesta VARCHAR(32) NOT NULL,
    snasa INT
);

CREATE TABLE prijatelj_brat(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prijatelj INT NOT NULL,
    brat INT NOT NULL
);

CREATE TABLE brat(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    jmbag CHAR(11),
    ogrlica INT NOT NULL,
    ekstroventno BOOLEAN NOT NULL
);

ALTER TABLE svekar ADD FOREIGN KEY (cura) REFERENCES cura(sifra);

ALTER TABLE punica ADD FOREIGN KEY (snasa) REFERENCES snasa(sifra);

ALTER TABLE svekar ADD FOREIGN KEY (cura) REFERENCES cura(sifra);

ALTER TABLE snasa ADD FOREIGN KEY (ostavljena) REFERENCES ostavljena(sifra);

ALTER TABLE ostavljena ADD FOREIGN KEY (prijatelj) REFERENCES prijatelj(sifra);

ALTER TABLE prijatelj_brat ADD FOREIGN KEY (prijatelj) REFERENCES prijatelj(sifra);
ALTER TABLE prijatelj_brat ADD FOREIGN KEY (brat) REFERENCES brat(sifra);

# 1. U tablice snasa, ostavljena i prijatelj_brat unesite po 3 retka.

INSERT INTO ostavljena
(sifra, kuna, lipa, majica, modelnaocala, prijatelj)
VALUES
(null, null, null, null, 'Ray Ban', null),
(null, null, null, null, 'Police', null),
(null, null, null, null, 'Socijalne', null);

INSERT INTO snasa
(sifra, introvertno, kuna, eura, treciputa, ostavljena)
VALUES
(null, null, 1512, 12312, null, 1),
(null, null, 1512, 12312, null, 2),
(null, null, 1512, 12312, null, 3);

INSERT INTO prijatelj
(sifra, kuna, haljina, lipa, dukserica, indiferentno)
VALUES
(null, null, null, null, null, true),
(null, null, null, null, null, true),
(null, null, null, null, null, false);

INSERT INTO brat
(sifra, jmbag, ogrlica, ekstroventno)
VALUES
(null, null, 12, true),
(null, null, 13, false),
(null, null, 14, true);

INSERT INTO prijatelj_brat
(sifra, prijatelj, brat)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);


# 2. U tablici svekar postavite svim zapisima kolonu suknja na
# vrijednost Osijek.

UPDATE svekar
SET suknja = 'Osijek'
WHERE sifra IS NOT NULL;


# 3. U tablici punica obrišite sve zapise čija je vrijednost kolone
# kratkamajica jednako AB.

DELETE FROM punica
WHERE kratkamajica = 'AB';


# 4. Izlistajte majica iz tablice ostavljena uz uvjet da vrijednost kolone
# lipa nije 9,10,20,30 ili 35.

SELECT majica
FROM ostavljena
WHERE lipa NOT IN ('9','10','20','30','35');

# 5. Prikažite ekstroventno iz tablice brat, vesta iz tablice punica te
# kuna iz tablice snasa uz uvjet da su vrijednosti kolone lipa iz tablice
# ostavljena različito od 91 te da su vrijednosti kolone haljina iz tablice
# prijatelj sadrže niz znakova ba. Podatke posložite po kuna iz tablice
# snasa silazno.

SELECT a.ekstroventno, b.vesta, c.kuna
FROM brat a, punica b, snasa c, ostavljena d, prijatelj e
WHERE d.lipa != 91 AND e.haljina LIKE '%ba%'
ORDER BY c.kuna DESC;

# 6. Prikažite kolone haljina i lipa iz tablice prijatelj čiji se primarni ključ
# ne nalaze u tablici prijatelj_brat.

SELECT a.haljina, a.lipa
FROM prijatelj a RIGHT JOIN prijatelj_brat b
ON b.prijatelj = a.sifra
WHERE b.prijatelj IS NULL;