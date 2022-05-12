# Regija

DROP DATABASE IF EXISTS regija;
CREATE DATABASE regija default charset utf8mb4;
USE regija;

CREATE TABLE zupanija(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    zupan INT NOT NULL
);

CREATE TABLE zupan(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
);

CREATE TABLE opcina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    zupanija INT NOT NULL,
    naziv VARCHAR(50) NOT NULL
);

CREATE TABLE mjesto(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    opcina INT NOT NULL,
    naziv VARCHAR(50) NOT NULL
);

ALTER TABLE zupanija ADD FOREIGN KEY (zupan) REFERENCES zupan(sifra);

ALTER TABLE opcina ADD FOREIGN KEY (zupanija) REFERENCES zupanija(sifra);

ALTER TABLE mjesto ADD FOREIGN KEY (opcina) REFERENCES opcina(sifra);