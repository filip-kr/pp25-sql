# Dječji vrtić

DROP DATABASE IF EXISTS djecji_vrtic;
CREATE DATABASE djecji_vrtic default charset utf8mb4;
USE djecji_vrtic;

CREATE TABLE odgajatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_zaposljenja DATETIME,
    placa_bruto DECIMAL(18,2),
    placa_neto DECIMAL(18,2),
    strucna_sprema VARCHAR(50)
);

CREATE TABLE skupina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    voditelj INT NOT NULL,
    ukupno_djece INT
);

CREATE TABLE dijete(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    skupina INT NOT NULL
);

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    spol VARCHAR(10) NOT NULL,
    datum_rodenja DATETIME,
    oib CHAR(11)
);

CREATE TABLE voditelj_skupine(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    odgajatelj INT NOT NULL,
    skupina INT NOT NULL
);

ALTER TABLE odgajatelj ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE skupina ADD FOREIGN KEY (voditelj) REFERENCES voditelj_skupine(sifra);

ALTER TABLE dijete ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE dijete ADD FOREIGN KEY (skupina) REFERENCES skupina(sifra);

ALTER TABLE voditelj_skupine ADD FOREIGN KEY (odgajatelj) REFERENCES odgajatelj(sifra);
ALTER TABLE voditelj_skupine ADD FOREIGN KEY (skupina) REFERENCES skupina(sifra);