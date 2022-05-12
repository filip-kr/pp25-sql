# Firma

DROP DATABASE IF EXISTS firma;
CREATE DATABASE firma default charset utf8mb4;
USE firma;

CREATE TABLE projekt(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50),
    cijena DECIMAL(18,2)
);

CREATE TABLE programer(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    datum_rodenja DATETIME,
    placa_bruto DECIMAL(18,2),
    placa_neto DECIMAL(18,2)
);

CREATE TABLE sudjeluje(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    projekt INT NOT NULL,
    programer INT NOT NULL,
    datum_pocetka DATETIME NOT NULL,
    datum_kraja DATETIME
);

ALTER TABLE sudjeluje ADD FOREIGN KEY (projekt) REFERENCES projekt(sifra);
ALTER TABLE sudjeluje ADD FOREIGN KEY (programer) REFERENCES programer(sifra);