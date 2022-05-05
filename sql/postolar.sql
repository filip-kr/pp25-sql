# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/postolar.sql

# Postolar
DROP DATABASE IF EXISTS postolar;
CREATE DATABASE postolar;
USE postolar;

CREATE TABLE obuca(
    id INT,
    marka VARCHAR(50),
    vrsta VARCHAR(50),
    materijal VARCHAR(50),
    velicina INT,
    datum_zaprimanja DATETIME,
    broj_popravka INT
);

CREATE TABLE korisnik(
    id INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    id_obuce INT
);

CREATE TABLE popravak(
    id_obuce INT,
    id_korisnika INT,
    datum_zavrsetka DATETIME,
    kn DEC
);

CREATE TABLE segrt(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    id_obuce INT
);
