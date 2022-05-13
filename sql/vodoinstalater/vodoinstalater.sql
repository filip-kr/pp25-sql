# Vodoinstalater

DROP DATABASE IF EXISTS vodoinstalater;
CREATE DATABASE vodoinstalater default charset utf8mb4;
USE vodoinstalater;

CREATE TABLE kvar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    opis TEXT NOT NULL,
    popravak INT
);

CREATE TABLE popravak(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    adresa TEXT NOT NULL,
    kvar INT,
    cijena DECIMAL(18,2),
    segrt BOOLEAN
);

CREATE TABLE segrt(
    ime VARCHAR(50),
    prezime VARCHAR(50),
    datum_rodenja DATETIME,
    placa DECIMAL(18,2),
    popravak INT
);

ALTER TABLE kvar ADD FOREIGN KEY (popravak) REFERENCES popravak(sifra);

ALTER TABLE popravak ADD FOREIGN KEY (kvar) REFERENCES kvar(sifra);

ALTER TABLE segrt ADD FOREIGN KEY (popravak) REFERENCES popravak(sifra);
