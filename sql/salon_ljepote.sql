# Salon ljepote

DROP DATABASE IF EXISTS salon_ljepote;
CREATE DATABASE salon_ljepote;
USE salon_ljepote;

CREATE TABLE djelatnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_zaposljenja DATETIME,
    placa_bruto DEC(18,2),
    placa_neto DEC(18,2)
);

CREATE TABLE korisnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_narucivanja DATETIME,
    usluga INT
);

CREATE TABLE usluga(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    djelatnik INT,
    korisnik INT,
    trajanje INT,
    cijena DEC(18,2)
);

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11),
    broj_telefona INT
);

ALTER TABLE djelatnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE korisnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE usluga ADD FOREIGN KEY (djelatnik) REFERENCES djelatnik(sifra);
ALTER TABLE usluga ADD FOREIGN KEY (korisnik) REFERENCES korisnik(sifra);