# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/urar.sql

# Urar
DROP DATABASE IF EXISTS urar;
CREATE DATABASE urar;
USE urar;

CREATE TABLE sat(
    id INT,
    marka VARCHAR(50),
    vrsta VARCHAR(50),
    datum_zaprimanja DATETIME,
    broj_popravka INT
);

CREATE TABLE korisnik(
    id INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    id_sata INT
);

CREATE TABLE popravak(
    id_sata INT,
    id_korisnika INT,
    datum_zavrsetka DATETIME,
    kn DEC
);

CREATE TABLE segrt(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    id_sata INT
);
