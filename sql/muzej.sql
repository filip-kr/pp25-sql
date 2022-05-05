# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/muzej.sql

# Muzej
DROP DATABASE IF EXISTS muzej;
CREATE DATABASE muzej;
USE muzej;

CREATE TABLE izlozba(
    id INT,
    naziv VARCHAR(50),
    broj_eksponata INT,
    datum_pocetka DATETIME,
    datum_zavrsetka DATETIME,
    id_kustosa INT,
    id_sponzora INT
);

CREATE TABLE kustos(
    id INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    placa DEC,
    id_izlozbe INT
);

CREATE TABLE sponzor(
    id INT,
    ime VARCHAR(50),
    id_izlozbe INT,
    kn DEC
);
