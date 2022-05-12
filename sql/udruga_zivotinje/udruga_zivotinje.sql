# Udruga za zaštitu životinja

DROP DATABASE IF EXISTS udruga_zivotinje;
CREATE DATABASE udruga_zivotinje default charset utf8mb4;
USE udruga_zivotinje;

CREATE TABLE radnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11),
    datum_zaposljenja DATETIME,
    placa_bruto DECIMAL(18,2),
    placa_neto DECIMAL(18,2)
);

CREATE TABLE zivotinja(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vrsta VARCHAR(50) NOT NULL,
    ukupno_sticenika INT,
    prostor INT NOT NULL
);

CREATE TABLE sticenik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zivotinja INT NOT NULL,
    ime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    datum_prihvata DATETIME,
    cijepljen BOOLEAN,
    prostor INT NOT NULL
);

CREATE TABLE prostor(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zivotinja INT NOT NULL,
    kvadratura INT,
    trenutna_popunjenost INT,
    maks_kapacitet INT NOT NULL
);

ALTER TABLE zivotinja ADD FOREIGN KEY (prostor) REFERENCES prostor(sifra);

ALTER TABLE sticenik ADD FOREIGN KEY (zivotinja) REFERENCES zivotinja(sifra);
ALTER TABLE sticenik ADD FOREIGN KEY (prostor) REFERENCES prostor(sifra);

ALTER TABLE prostor ADD FOREIGN KEY (zivotinja) REFERENCES zivotinja(sifra);