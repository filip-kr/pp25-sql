# Regija

DROP DATABASE IF EXISTS regija;
CREATE DATABASE regija default charset utf8mb4;
USE regija;

CREATE TABLE zupanija(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    zupan INT NOT NULL
);

CREATE TABLE zupan(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
);

CREATE TABLE opcina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zupanija INT NOT NULL,
    naziv VARCHAR(50) NOT NULL
);

CREATE TABLE mjesto(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    opcina INT NOT NULL,
    naziv VARCHAR(50) NOT NULL
);

ALTER TABLE zupanija ADD FOREIGN KEY (zupan) REFERENCES zupan(sifra);

ALTER TABLE opcina ADD FOREIGN KEY (zupanija) REFERENCES zupanija(sifra);

ALTER TABLE mjesto ADD FOREIGN KEY (opcina) REFERENCES opcina(sifra) ON DELETE CASCADE;

# Unos podataka
# Tri župana
INSERT INTO zupan(ime, prezime)
VALUES ('Ivan', 'Anušić');

INSERT INTO zupan(ime, prezime)
VALUES ('Fabrizio', 'Radin');

INSERT INTO zupan(ime, prezime)
VALUES ('Božidar', 'Longin');

# Tri županije
INSERT INTO zupanija(naziv, zupan)
VALUES ('Osječko-baranjska', 1);

INSERT INTO zupanija(naziv, zupan)
VALUES ('Istarska', 2);

INSERT INTO zupanija(naziv, zupan)
VALUES ('Zadarska', 3);

# Šest općina
INSERT INTO opcina(zupanija, naziv)
VALUES (1, 'Antunovac');
INSERT INTO opcina(zupanija, naziv)
VALUES (1, 'Bilje');

INSERT INTO opcina(zupanija, naziv)
VALUES (2, 'Medulin');
INSERT INTO opcina(zupanija, naziv)
VALUES (2, 'Fažana');

INSERT INTO opcina(zupanija, naziv)
VALUES (3, 'Bibinje');
INSERT INTO opcina(zupanija, naziv)
VALUES (3, 'Škabrnja');

# Dvanaest mjesta
INSERT INTO mjesto(opcina, naziv)
VALUES (1, 'Antunovac');
INSERT INTO mjesto(opcina, naziv)
VALUES (1, 'Ivanovac');

INSERT INTO mjesto(opcina, naziv)
VALUES (2, 'Kopačevo');
INSERT INTO mjesto(opcina, naziv)
VALUES (2, 'Kozjak');
INSERT INTO mjesto(opcina, naziv)
VALUES (2, 'Tikveš');

INSERT INTO mjesto(opcina, naziv)
VALUES (3, 'Banjolje');
INSERT INTO mjesto(opcina, naziv)
VALUES (3, 'Pješčana Uvala');
INSERT INTO mjesto(opcina, naziv)
VALUES (3, 'Pomer');

INSERT INTO mjesto(opcina, naziv)
VALUES (4, 'Fažana');
INSERT INTO mjesto(opcina, naziv)
VALUES (4, 'Valbandon');

INSERT INTO mjesto(opcina, naziv)
VALUES (5, 'Bibinje');

INSERT INTO mjesto(opcina, naziv)
VALUES (6, 'Škabrnja');

# Promjena
UPDATE mjesto
SET naziv = 'Lug'
WHERE sifra = 3;

UPDATE mjesto
SET naziv = 'Podunavlje'
WHERE sifra = 4;

UPDATE mjesto
SET naziv = 'Vinkuran'
WHERE sifra = 6;

UPDATE mjesto
SET naziv = 'Valbonaša'
WHERE sifra = 7;

UPDATE mjesto
SET naziv = 'Premantura'
WHERE sifra = 8;

# Brisanje (CASCADE)
-- DELETE FROM opcina
-- WHERE sifra = 5;

-- DELETE FROM opcina
-- WHERE sifra = 6;