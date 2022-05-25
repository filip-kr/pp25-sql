# kolokvij_vjezba2
# Ukupno vrijeme: 32:39/45:00

# 0. Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS kolokvij_vjezba2;
CREATE DATABASE kolokvij_vjezba2;
USE kolokvij_vjezba2;

CREATE TABLE decko(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    indiferentno BOOLEAN,
    vesta VARCHAR(34),
    asocijalno BOOLEAN NOT NULL
);

CREATE TABLE prijatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    modelnaocala VARCHAR(37),
    treciputa DATETIME NOT NULL,
    ekstrovertno BOOLEAN NOT NULL,
    prviputa DATETIME,
    svekar INT NOT NULL
);

CREATE TABLE cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    haljina VARCHAR(33) NOT NULL,
    drugiputa DATETIME NOT NULL,
    suknja VARCHAR(38),
    narukvica INT,
    introvertno BOOLEAN,
    majica VARCHAR(40) NOT NULL,
    decko INT
);

CREATE TABLE decko_zarucnica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    decko INT NOT NULL,
    zarucnica INT NOT NULL
);

CREATE TABLE svekar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    stilfrizura VARCHAR(48),
    ogrlica INT NOT NULL,
    asocijalno BOOLEAN NOT NULL
);

CREATE TABLE zarucnica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    narukvica INT,
    bojakose VARCHAR(37) NOT NULL,
    novcica DECIMAL(15,9),
    lipa DECIMAL(15,8) NOT NULL,
    indiferentno BOOLEAN NOT NULL
);

CREATE TABLE brat(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    suknja VARCHAR(47),
    ogrlica INT NOT NULL,
    asocijalno BOOLEAN NOT NULL,
    neprijatelj INT NOT NULL
);

CREATE TABLE neprijatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    majica VARCHAR(32),
    haljina VARCHAR(43) NOT NULL,
    lipa DECIMAL(16,8),
    modelnaocala VARCHAR(49) NOT NULL,
    kuna DECIMAL(12,6) NOT NULL,
    jmbag CHAR(11),
    cura INT
);

ALTER TABLE prijatelj ADD FOREIGN KEY (svekar) REFERENCES svekar(sifra);

ALTER TABLE decko_zarucnica ADD FOREIGN KEY (decko) REFERENCES decko(sifra);
ALTER TABLE decko_zarucnica ADD FOREIGN KEY (zarucnica) REFERENCES zarucnica(sifra);

ALTER TABLE cura ADD FOREIGN KEY (decko) REFERENCES decko(sifra);

ALTER TABLE brat ADD FOREIGN KEY (neprijatelj) REFERENCES neprijatelj(sifra);

ALTER TABLE neprijatelj ADD FOREIGN KEY (cura) REFERENCES cura(sifra);

# 1. U tablice neprijatelj, cura i decko_zarucnica unesite po 3 retka.
INSERT INTO neprijatelj
(sifra, majica, haljina, lipa, modelnaocala, kuna, jmbag, cura)
VALUES
(null, null, 'Čipkasta', null, 'Ray Ban', 192.18, null, null),
(null, null, 'Roza', null, 'Police', 200.28, null, null),
(null, null, 'Karirana', null, 'Ray Ban', 392.12, null, null);

INSERT INTO cura
(sifra, haljina, drugiputa, suknja, narukvica, introvertno, majica, decko)
VALUES
(null, 'Skupa', '1998-12-09', null, null, null, 'Fruit of the Loom', null),
(null, 'Skupa', '1999-08-01', null, null, null, 'Nike', null),
(null, 'Skupa', '1992-06-05', null, null, null, 'Reklamna', null);

INSERT INTO decko
(sifra, indiferentno, vesta, asocijalno)
VALUES
(null, null, null, false),
(null, null, null, false),
(null, null, null, true);

INSERT INTO zarucnica
(sifra, narukvica, bojakose, novcica, lipa, indiferentno)
VALUES
(null, null, 'Smeđa', null, 12.3, false),
(null, null, 'Zelena', null, 16.23, true),
(null, null, 'Plava', null, 11.11, false);

INSERT INTO decko_zarucnica
(sifra, decko, zarucnica)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

# 2. U tablici prijatelj postavite svim zapisima kolonu treciputa na
# vrijednost 30. travnja 2020.

UPDATE prijatelj
SET treciputa = '2020-04-30';

# 3. U tablici brat obrišite sve zapise čija je vrijednost kolone ogrlica
# različito od 14.

DELETE FROM brat 
WHERE ogrlica != 14;

# 4. Izlistajte suknja iz tablice cura uz uvjet da vrijednost kolone
# drugiputa nepoznate.

SELECT suknja
FROM cura
WHERE drugiputa IS NULL;


# 5. Prikažite novcica iz tablice zarucnica, neprijatelj iz tablice brat te
# haljina iz tablice neprijatelj uz uvjet da su vrijednosti kolone
# drugiputa iz tablice cura poznate te da su vrijednosti kolone vesta iz
# tablice decko sadrže niz znakova ba. Podatke posložite po haljina iz
# tablice neprijatelj silazno.

SELECT a.novcica , b.neprijatelj, c.haljina 
FROM zarucnica a, brat b, neprijatelj c, cura d, decko e
WHERE d.drugiputa IS NOT NULL AND e.vesta LIKE '%ba%'
ORDER BY c.haljina DESC;


# 6. Prikažite kolone vesta i asocijalno iz tablice decko čiji se primarni
# ključ ne nalaze u tablici decko_zarucnica.

SELECT a.vesta, a.asocijalno 
FROM decko a RIGHT JOIN decko_zarucnica b
ON b.decko = a.sifra
WHERE b.decko IS NULL;