# Samostan

DROP DATABASE IF EXISTS samostan;
CREATE DATABASE samostan;
USE samostan;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11)
);

CREATE TABLE svecenik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    duznost INT,
    nadredeni INT
);

CREATE TABLE nadredeni(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    podredeni INT NOT NULL
);

CREATE TABLE duznost(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50),
    izvrsitelj INT,
    nadredeni INT
);

ALTER TABLE svecenik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE svecenik ADD FOREIGN KEY (duznost) REFERENCES duznost(sifra);
ALTER TABLE svecenik ADD FOREIGN KEY (nadredeni) REFERENCES nadredeni(sifra);

ALTER TABLE nadredeni ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE nadredeni ADD FOREIGN KEY (podredeni) REFERENCES svecenik(sifra);

ALTER TABLE duznost ADD FOREIGN KEY (izvrsitelj) REFERENCES svecenik(sifra);
ALTER TABLE duznost ADD FOREIGN KEY (nadredeni) REFERENCES nadredeni(sifra);