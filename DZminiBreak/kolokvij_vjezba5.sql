# kolokvij_vjezba5
# Ukupno vrijeme: 22:09/45:00

-- 0. Kreirajte tablice (16) i veze između tablica.
DROP DATABASE IF EXISTS kolokvij_vjezba5;
CREATE DATABASE kolokvij_vjezba5;
USE kolokvij_vjezba5;

CREATE TABLE mladic(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kratkamajica VARCHAR(48) NOT NULL,
    haljina VARCHAR(30) NOT NULL,
    asocijalno BOOLEAN,
    zarucnik INT
);

CREATE TABLE zarucnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    jmbag CHAR(11),
    lipa DECIMAL(12,8),
    indiferentno BOOLEAN NOT NULL
);

CREATE TABLE svekar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    bojakose VARCHAR(33),
    majica VARCHAR(31),
    carape VARCHAR(31) NOT NULL,
    haljina VARCHAR(43),
    narukvica INT,
    eura DECIMAL(14,5) NOT NULL
);

CREATE TABLE punac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    dukserica VARCHAR(33),
    prviputa DATETIME NOT NULL,
    majica VARCHAR(36),
    svekar INT NOT NULL
);

CREATE TABLE svekar_cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    svekar INT NOT NULL,
    cura INT NOT NULL
);

CREATE TABLE cura(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    carape VARCHAR(41) NOT NULL,
    maraka DECIMAL(17,10) NOT NULL,
    asocijalno BOOLEAN,
    vesta VARCHAR(47) NOT NULL
);

CREATE TABLE ostavljena(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    majica VARCHAR(33),
    ogrlica INT NOT NULL,
    carape VARCHAR(44),
    stilfrizura VARCHAR(42),
    punica INT NOT NULL
);

CREATE TABLE punica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    hlace VARCHAR(43) NOT NULL,
    nausnica INT NOT NULL,
    ogrlica INT,
    vesta VARCHAR(49) NOT NULL,
    modelnaocala VARCHAR(31),
    treciputa DATETIME NOT NULL,
    punac INT NOT NULL
);

ALTER TABLE mladic ADD FOREIGN KEY (zarucnik) REFERENCES zarucnik(sifra);

ALTER TABLE ostavljena ADD FOREIGN KEY (punica) REFERENCES punica(sifra);

ALTER TABLE punica ADD FOREIGN KEY (punac) REFERENCES punac(sifra);

ALTER TABLE punac ADD FOREIGN KEY (svekar) REFERENCES svekar(sifra);

ALTER TABLE svekar_cura ADD FOREIGN KEY (svekar) REFERENCES svekar(sifra);
ALTER TABLE svekar_cura ADD FOREIGN KEY (cura) REFERENCES cura(sifra);

-- 1. U tablice punica, punac i svekar_cura unesite po 3 retka.

INSERT INTO svekar
(sifra, carape, eura)
VALUES
(null, 'Staračke', 200),
(null, 'Moderne', 300),
(null, 'Retro', 400);

INSERT INTO punac
(sifra, prviputa, svekar)
VALUES
(null, '2022-06-01', 1),
(null, '2022-07-02', 1),
(null, '2022-08-03', 1);

INSERT INTO punica
(sifra, hlace, nausnica, vesta, modelnaocala, treciputa, punac)
VALUES
(null, 'Rifle', 2, 'Svilena', 'Ray Ban', '1995-11-12', 1),
(null, 'Rifle', 2, 'Pamučna', 'Socijalne', '2021-01-11', 2),
(null, 'Rifle', 2, 'Prekrasna', 'Ray Ban', '1996-08-18', 3);

INSERT INTO cura
(sifra, carape, maraka, vesta)
VALUES
(null, 'Bijele', 118, 'Uvozna'),
(null, 'Crne', 118, 'Nema'),
(null, 'Šarene', 118, 'Domaća');


INSERT INTO svekar_cura
(sifra, svekar, cura)
VALUES
(null, 1, 1),
(null, 2, 2),
(null, 3, 3);

-- 2. U tablici mladic postavite svim zapisima kolonu haljina na
-- vrijednost Osijek.

UPDATE mladic
SET haljina = 'Osijek';

-- 3. U tablici ostavljena obrišite sve zapise čija je vrijednost kolone
-- ogrlica jednako 17.

DELETE FROM ostavljena
WHERE ogrlica = 17;

-- 4. Izlistajte majica iz tablice punac uz uvjet da vrijednost kolone
-- prviputa nepoznate.

SELECT majica
FROM punac
WHERE prviputa IS NULL;



-- 5. Prikažite asocijalno iz tablice cura, stilfrizura iz tablice ostavljena te
-- nausnica iz tablice punica uz uvjet da su vrijednosti kolone prviputa iz
-- tablice punac poznate te da su vrijednosti kolone majica iz tablice
-- svekar sadrže niz znakova ba. Podatke posložite po nausnica iz tablice
-- punica silazno.

-- SELECT a.asocijalno, b.stilfrizura, c.nausnica
-- FROM cura a, ostavljena b, punica c, punac d, svekar e
-- WHERE d.prviputa IS NOT NULL AND e.majica LIKE '%ba%'
-- ORDER BY c.nausnica DESC;


SELECT a.asocijalno, f.stilfrizura, e.nausnica
FROM cura a INNER JOIN svekar_cura b
ON a.sifra = b.cura
INNER JOIN svekar c ON b.svekar = c.sifra
INNER JOIN punac d ON d.svekar = c.sifra
INNER JOIN punica e ON e.punac = d.sifra
INNER JOIN ostavljena f ON f.punica = e.sifra
WHERE d.prviputa IS NOT NULL AND c.majica LIKE '%ba%'
ORDER BY e.nausnica DESC;

-- 6. Prikažite kolone majica i carape iz tablice svekar čiji se primarni
-- ključ ne nalaze u tablici svekar_cura.

SELECT a.majica, a.carape
FROM svekar a INNER JOIN svekar_cura b
ON a.sifra = b.svekar
WHERE b.svekar IS NULL;