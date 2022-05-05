# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/samostan.sql

# Samostan
DROP DATABASE IF EXISTS samostan;
CREATE DATABASE samostan;
USE samostan;

CREATE TABLE svecenik(
    id INT,
    oib INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    duznost VARCHAR(50),
    id_nadredenog INT
);

CREATE TABLE duznost(
    naziv VARCHAR(50),
    id_izvrsitelja INT,
    id_nadredenog INT
);
