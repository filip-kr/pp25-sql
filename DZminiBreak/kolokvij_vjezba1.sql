# kolokvij_vjezba1
# Ukupno vrijeme: 59:35/45:00

# 0. Kreirajte tablice i veze između tablica.

DROP DATABASE IF EXISTS kolokvij_vjezba1;
CREATE DATABASE kolokvij_vjezba1;
USE kolokvij_vjezba1;

CREATE TABLE sestra(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    introvertno BOOLEAN,
    haljina VARCHAR(31) NOT NULL,
    maraka DECIMAL(16,6),
    hlace VARCHAR(46) NOT NULL,
    narukvica INT NOT NULL
);

CREATE TABLE punac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ogrlica INT,
    gustoca DECIMAL(14,9),
    hlace VARCHAR(41) NOT NULL
);

CREATE TABLE zena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    treciputa DATETIME,
    hlace VARCHAR(46),
    kratkamajica VARCHAR(31) NOT NULL,
    jmbag CHAR(11) NOT NULL,
    bojaociju VARCHAR(39) NOT NULL,
    haljina VARCHAR(44),
    sestra INT NOT NULL
);

CREATE TABLE cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    novcica DECIMAL(16,5) NOT NULL,
    gustoca DECIMAL(18,6) NOT NULL,
    lipa DECIMAL(13,10),
    ogrlica INT NOT NULL,
    bojakose VARCHAR(38),
    suknja VARCHAR(36),
    punac INT
);

CREATE TABLE sestra_svekar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    sestra INT NOT NULL,
    svekar INT NOT NULL
);

CREATE TABLE muskarac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bojaociju VARCHAR(50) NOT NULL,
    hlace VARCHAR(30),
    modelnaocala VARCHAR(43),
    maraka DECIMAL(14,5) NOT NULL,
    zena INT NOT NULL
);

CREATE TABLE svekar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bojaociju VARCHAR(40) NOT NULL,
    prstena INT,
    dukserica VARCHAR(41),
    lipa DECIMAL(13,8),
    eura DECIMAL(12,7),
    majica VARCHAR(35)
);

CREATE TABLE mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    suknja VARCHAR(50) NOT NULL,
    kuna DECIMAL(16,8) NOT NULL,
    drugiputa DATETIME,
    asocijalno BOOLEAN,
    ekstrovertno BOOLEAN NOT NULL,
    dukserica VARCHAR(48) NOT NULL,
    muskarac INT
);

ALTER TABLE zena ADD FOREIGN KEY (sestra) REFERENCES sestra(sifra);

ALTER TABLE cura ADD FOREIGN KEY (punac) REFERENCES punac(sifra);

ALTER TABLE sestra_svekar ADD FOREIGN KEY (sestra) REFERENCES sestra(sifra);
ALTER TABLE sestra_svekar ADD FOREIGN KEY (svekar) REFERENCES svekar(sifra);

ALTER TABLE muskarac ADD FOREIGN KEY (zena) REFERENCES zena(sifra);

ALTER TABLE mladic ADD FOREIGN KEY (muskarac) REFERENCES muskarac(sifra);

# 1. U tablice muskarac, zena i sestra_svekar unesite po 3 retka.

INSERT INTO svekar
(sifra, bojaociju, prstena, dukserica, lipa, eura, majica)
VALUES
(null, 'Smeđa', null, null, null, null, null),
(null, 'Plava', null, null, null, null, null),
(null, 'Zelena', null, null, null, null, null);

INSERT INTO sestra
(sifra, introvertno, haljina, maraka, hlace, narukvica)
VALUES
(null, null, 'Čipkasta', null, 'Traperice', 18),
(null, null, 'Plava', null, 'Bijele', 18),
(null, null, 'Roza', null, 'Kratke', 18);

INSERT INTO sestra_svekar
(sifra, sestra, svekar)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

INSERT INTO zena
(sifra, treciputa, hlace, kratkamajica, jmbag, bojaociju, haljina, sestra)
VALUES
(null, null, null, 'Adidas', '59638463213', 'Zelena', null, 1),
(null, null, null, 'Nike', '59875789433', 'Zelena', null, 2),
(null, null, null, 'Puma', '96854463213', 'Zelena', null, 3);

INSERT INTO muskarac
(sifra, bojaociju, hlace, modelnaocala, maraka, zena)
VALUES
(null, 'Plava', null, null, 18.55, 1),
(null, 'Zelena', null, null, 20, 2),
(null, 'Smeđa', null, null, 300.95, 3);

# 2. U tablici cura postavite svim zapisima kolonu gustoca na vrijednost
# 15,77.

ALTER TABLE cura
MODIFY gustoca DECIMAL(15,7);

# 3. U tablici mladic obrišite sve zapise čija je vrijednost kolone kuna
# veće od 15,78.

INSERT INTO mladic
(sifra, suknja, kuna, drugiputa, asocijalno, ekstrovertno, dukserica, muskarac)
VALUES
(null, 'Nema', 1255.1244, null, null, true, 'Plava', 1),
(null, 'Nema', 1855.1244, null, null, true, 'Zelena', 2),
(null, 'Nema', 1955.1244, null, null, false, 'Smeđa', 3);

DELETE FROM mladic
WHERE kuna > 15.78;

# 4. Izlistajte kratkamajica iz tablice zena uz uvjet da vrijednost kolone
# hlace sadrže slova ana.

SELECT kratkamajica FROM zena
WHERE hlace LIKE '%ana%';

# 5. Prikažite dukserica iz tablice svekar, asocijalno iz tablice mladic te
# hlace iz tablice muskarac uz uvjet da su vrijednosti kolone hlace iz
# tablice zena počinju slovom a te da su vrijednosti kolone haljina iz
# tablice sestra sadrže niz znakova ba. Podatke posložite po hlace iz
# tablice muskarac silazno.

SELECT a.dukserica, b.asocijalno, c.hlace
FROM svekar a, mladic b, muskarac c, zena d, sestra e
WHERE d.hlace LIKE 'a%' AND e.haljina LIKE '%ba%'
ORDER BY c.hlace DESC;

# 6. Prikažite kolone haljina i maraka iz tablice sestra čiji se primarni
# ključ ne nalaze u tablici sestra_svekar

SELECT a.haljina, a. maraka
FROM sestra a RIGHT JOIN sestra_svekar b
ON a.sifra = b.sestra
WHERE b.sestra IS NULL;