# Naredba za izvođenje:
# /opt/lampp/bin/./mysql -uroot < /home/gradjaninf/Dokumenti/pp25-sql/sql/udruga_zivotinje.sql

# Udruga za zaštitu životinja
DROP DATABASE IF EXISTS udruga_zivotinje;
CREATE DATABASE udruga_zivotinje;
USE udruga_zivotinje;

CREATE TABLE radnik(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    oib INT(11),
    datum_zaposljenja DATETIME,
    placa_bruto DEC,
    placa_neto DEC
);

CREATE TABLE sticenik(
    vrsta VARCHAR(50),
    ime VARCHAR(50),
    datum_rodenja DATETIME,
    datum_prihvata DATETIME,
    cijepljen BIT
);

CREATE TABLE prostor(
    id INT,
    vrsta VARCHAR(50),
    kvadratura INT,
    trenutni_kapacitet INT,
    maks_kapacitet INT
);