# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/taksi_sluzba.sql

# Taksi služba
DROP DATABASE IF EXISTS taksi_sluzba;
CREATE DATABASE taksi_sluzba;
USE taksi_sluzba;

CREATE TABLE vozilo(
    id INT,
    marka VARCHAR(50),
    model VARCHAR(50),
    id_vozaca INT
);

CREATE TABLE vozac(
    id INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib INT,
    datum_zaposljenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC,
    id_vozila INT
);

CREATE TABLE putnik(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    km DEC,
    cijena DEC
);

CREATE TABLE voznja(
    id_vozila INT,
    id_vozaca INT,
    broj_putnika INT,
    ukupno_km DEC,
    ukupno_kn DEC
);