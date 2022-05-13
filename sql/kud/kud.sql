# Kulturno umjetničko društvo

DROP DATABASE IF EXISTS kud;
CREATE DATABASE kud default charset utf8mb4;
USE kud;

CREATE TABLE nastup(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    mjesto INT,
    clan INT
);

CREATE TABLE mjesto(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    drzava VARCHAR(50) NOT NULL,
    naziv VARCHAR(50) NOT NULL,
    adresa VARCHAR(100),
    nastup INT
);

CREATE TABLE clan(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_uclanjenja DATETIME,
    nastup INT
);

ALTER TABLE nastup ADD FOREIGN KEY (mjesto) REFERENCES mjesto(sifra);
ALTER TABLE nastup ADD FOREIGN KEY (clan) REFERENCES clan(sifra);

ALTER TABLE mjesto ADD FOREIGN KEY (nastup) REFERENCES nastup(sifra);

ALTER TABLE clan ADD FOREIGN KEY (nastup) REFERENCES nastup(sifra);