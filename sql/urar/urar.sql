# Urar

DROP DATABASE IF EXISTS urar;
CREATE DATABASE urar default charset utf8mb4;
USE urar;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
);

CREATE TABLE sat(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marka VARCHAR(50),
    vrsta VARCHAR(50),
    datum_zaprimanja DATETIME
);

CREATE TABLE korisnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    sat INT NOT NULL
);

CREATE TABLE popravak(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    korisnik INT NOT NULL,
    sat INT NOT NULL,
    datum_zavrsetka DATETIME,
    kn DECIMAL(18,2)
);

CREATE TABLE segrt(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    popravak INT
);

ALTER TABLE korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE korisnik ADD FOREIGN KEY (sat) REFERENCES sat(sifra);

ALTER TABLE popravak ADD FOREIGN KEY (korisnik) REFERENCES korisnik(sifra);
ALTER TABLE popravak ADD FOREIGN KEY (sat) REFERENCES sat(sifra);

ALTER TABLE segrt ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE segrt ADD FOREIGN KEY (popravak) REFERENCES popravak(sifra);