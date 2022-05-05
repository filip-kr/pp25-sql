# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/frizerski_salon.sql

# Frizerski salon
DROP DATABASE IF EXISTS frizerski_salon;
CREATE DATABASE frizerski_salon;
USE frizerski_salon;

CREATE TABLE djelatnik(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib INT(11),
    datum_zaposljenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC
);

CREATE TABLE korisnik(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    datum_narucivanja DATETIME,
    broj_telefona VARCHAR(50),
    usluga VARCHAR(50)
);

CREATE TABLE usluga(
    naziv VARCHAR(50),
    cijena INT,
    trajanje INT
);