# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/djecji_vrtic.sql

# Dječji vrtić
DROP DATABASE IF EXISTS djecji_vrtic;
CREATE DATABASE djecji_vrtic;
USE djecji_vrtic;

CREATE TABLE odgajatelj(
    id INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib INT(11),
    datum_zaposljenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC,
    strucna_sprema VARCHAR(50)
);

CREATE TABLE skupina(
    naziv VARCHAR(50),
    id_voditelja INT,
    broj_djece INT
);

CREATE TABLE dijete(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    spol VARCHAR(50),
    datum_rodenja DATETIME,
    skupina VARCHAR(50)
);
