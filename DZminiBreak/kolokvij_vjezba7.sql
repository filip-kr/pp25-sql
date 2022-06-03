# kolokvij_vjezba7
# Ukupno vrijeme: 21:16/45:00

-- 0. Kreirajte tablice (16) i veze između tablica.
DROP DATABASE IF EXISTS kolokvij_vjezba7;
CREATE DATABASE kolokvij_vjezba7;
USE kolokvij_vjezba7;

CREATE TABLE zarucnik_mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zarucnik INT NOT NULL,
    mladic INT NOT NULL
);

CREATE TABLE mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    prstena INT,
    lipa DECIMAL(14,5) NOT NULL,
    narukvica INT NOT NULL,
    drugiputa DATETIME NOT NULL
);

CREATE TABLE zarucnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vesta VARCHAR(34),
    asocijalno BOOLEAN NOT NULL,
    modelnaocala VARCHAR(43),
    narukvica INT NOT NULL,
    novcica DECIMAL(15,5) NOT NULL
);

CREATE TABLE ostavljen(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lipa DECIMAL(14,6),
    introvertno BOOLEAN NOT NULL,
    kratkamajica VARCHAR(38) NOT NULL,
    prstena INT NOT NULL,
    zarucnik INT
);

CREATE TABLE sestra(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bojakose VARCHAR(34) NOT NULL,
    hlace VARCHAR(36) NOT NULL,
    lipa DECIMAL(15,6),
    stilfrizura VARCHAR(40) NOT NULL,
    maraka DECIMAL(12,8) NOT NULL,
    prijateljica INT
);

CREATE TABLE prijateljica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    haljina VARCHAR(45),
    gustoca DECIMAL(15,10) NOT NULL,
    ogrlica INT,
    novcica DECIMAL(12,5),
    ostavljen INT
);

CREATE TABLE punica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    majica VARCHAR(40),
    eura DECIMAL(12,6) NOT NULL,
    prstena INT,
    cura INT NOT NULL
);

CREATE TABLE cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    lipa DECIMAL(12,9) NOT NULL,
    introvertno BOOLEAN,
    modelnaocala VARCHAR(40),
    narukvica INT,
    treciputa DATETIME,
    kuna DECIMAL(14,9)
);

ALTER TABLE zarucnik_mladic ADD FOREIGN KEY (zarucnik) REFERENCES zarucnik(sifra);
ALTER TABLE zarucnik_mladic ADD FOREIGN KEY (mladic) REFERENCES mladic(sifra);

ALTER TABLE ostavljen ADD FOREIGN KEY (zarucnik) REFERENCES zarucnik(sifra);

ALTER TABLE sestra ADD FOREIGN KEY (prijateljica) REFERENCES prijateljica(sifra);

ALTER TABLE prijateljica ADD FOREIGN KEY (ostavljen) REFERENCES ostavljen(sifra);

ALTER TABLE punica ADD FOREIGN KEY (cura) REFERENCES cura(sifra);

-- 1. U tablice prijateljica, ostavljen i zarucnik_mladic unesite po 3
-- retka.
INSERT INTO zarucnik
(sifra, asocijalno, narukvica, novcica)
VALUES
(null, true, 1, 63),
(null, false, 2, 23),
(null, true, 1, 68);

INSERT INTO mladic
(sifra, lipa, narukvica, drugiputa)
VALUES
(null, 51254, 3, '2022-06-20'),
(null, 262, 1, '2022-05-20'),
(null, 24232, 2, '2022-04-20');

INSERT INTO zarucnik_mladic
(sifra, zarucnik, mladic)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

INSERT INTO prijateljica
(sifra, gustoca)
VALUES
(null, 412),
(null, 322),
(null, 122);

INSERT INTO ostavljen
(sifra, introvertno, kratkamajica, prstena)
VALUES
(null, true, 'Adidas', 2),
(null, false, 'Nike', 3),
(null, true, 'Fruit of the Loom', 1);

-- 2. U tablici punica postavite svim zapisima kolonu eura na vrijednost
-- 15,77.
UPDATE punica
SET eura = 15.77;

-- 3. U tablici sestra obrišite sve zapise čija je vrijednost kolone hlace
-- manje od AB.
DELETE FROM sestra
WHERE hlace < 'AB';

-- 4. Izlistajte kratkamajica iz tablice ostavljen uz uvjet da vrijednost
-- kolone introvertno nepoznate.
SELECT kratkamajica
FROM ostavljen
WHERE introvertno IS NULL;

-- 5. Prikažite narukvica iz tablice mladic, stilfrizura iz tablice sestra te
-- gustoca iz tablice prijateljica uz uvjet da su vrijednosti kolone
-- introvertno iz tablice ostavljen poznate te da su vrijednosti kolone
-- asocijalno iz tablice zarucnik poznate. Podatke posložite po gustoca iz
-- tablice prijateljica silazno.
SELECT a.narukvica, f.stilfrizura, e.gustoca
FROM mladic a INNER JOIN zarucnik_mladic b
ON a.sifra = b.mladic
INNER JOIN zarucnik c ON b.zarucnik = c.sifra
INNER JOIN ostavljen d ON d.zarucnik = c.sifra
INNER JOIN prijateljica e ON e.ostavljen = d.sifra
INNER JOIN sestra f ON f.prijateljica = e.sifra
WHERE d.introvertno IS NOT NULL AND c.asocijalno IS NOT NULL
ORDER BY e.gustoca DESC;

-- 6. Prikažite kolone asocijalno i modelnaocala iz tablice zarucnik čiji se
-- primarni ključ ne nalaze u tablici zarucnik_mladic.
SELECT b.asocijalno, b.modelnaocala
FROM zarucnik_mladic a RIGHT JOIN zarucnik b ON a.zarucnik = b.sifra
WHERE a.zarucnik IS NULL;