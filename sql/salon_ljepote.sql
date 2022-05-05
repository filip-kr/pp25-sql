# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/salon_ljepote.sql

# Salon ljepote
DROP DATABASE IF EXISTS salon_ljepote;
CREATE DATABASE salon_ljepote;
USE salon_ljepote;

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