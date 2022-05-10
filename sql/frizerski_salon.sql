# Frizerski salon

DROP DATABASE IF EXISTS frizerski_salon;
CREATE DATABASE frizerski_salon;
USE frizerski_salon;

CREATE TABLE djelatnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_zaposljenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC
);

CREATE TABLE korisnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_narucivanja DATETIME,
    usluga INT
);

CREATE TABLE usluga(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR NOT NULL(50),
    djelatnik INT,
    korisnik INT,
    trajanje INT,
    cijena DEC(18,2)
);

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR NOT NULL(50),
    prezime VARCHAR NOT NULL(50),
    oib CHAR(11),
    broj_telefona INT
);

ALTER TABLE djelatnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE usluga ADD FOREIGN KEY (djelatnik) REFERENCES djelatnik(sifra);
ALTER TABLE usluga ADD FOREIGN KEY (korisnik) REFERENCES korisnik(sifra);