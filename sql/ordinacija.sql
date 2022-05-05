# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/ordinacija.sql

# Doktorska ordinacija
DROP DATABASE IF EXISTS ordinacija;
CREATE DATABASE ordinacija;
USE ordinacija;

CREATE TABLE doktor(
    oib INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    hzzo BIT,
    broj_pacijenata INT
);

CREATE TABLE pacijent(
    oib INT,
    broj_hzzo INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    dijagnoza VARCHAR(50)
);

CREATE TABLE med_tehnicar(
    oib INT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    strucna_sprema VARCHAR(50),
    datum_zaposlenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC
);