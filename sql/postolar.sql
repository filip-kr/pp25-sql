# Postolar

DROP DATABASE IF EXISTS postolar;
CREATE DATABASE postolar;
USE postolar;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
);

CREATE TABLE obuca(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marka VARCHAR(50),
    vrsta VARCHAR(50),
    materijal VARCHAR(50),
    velicina INT,
    datum_zaprimanja DATETIME
);

CREATE TABLE korisnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    obuca INT NOT NULL
);

CREATE TABLE popravak(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    korisnik INT NOT NULL,
    obuca INT NOT NULL,
    datum_zavrsetka DATETIME,
    kn DEC(18,2)
);

CREATE TABLE segrt(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    popravak INT
);

ALTER TABLE korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE korisnik ADD FOREIGN KEY (obuca) REFERENCES obuca(sifra);

ALTER TABLE popravak ADD FOREIGN KEY (korisnik) REFERENCES korisnik(sifra);
ALTER TABLE popravak ADD FOREIGN KEY (obuca) REFERENCES obuca(sifra);

ALTER TABLE segrt ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE segrt ADD FOREIGN KEY (popravak) REFERENCES popravak(sifra);