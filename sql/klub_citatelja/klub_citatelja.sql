# Klub čitatelja

DROP DATABASE IF EXISTS klub_citatelja;
CREATE DATABASE klub_citatelja default charset utf8mb4;
USE klub_citatelja;

CREATE TABLE citatelj(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11) NOT NULL,
    knjiga INT
);

CREATE TABLE knjiga(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naslov VARCHAR(50) NOT NULL,
    ime_autora VARCHAR(50) NOT NULL,
    prezime_autora VARCHAR(50) NOT NULL,
    nakladnik VARCHAR(50) NOT NULL,
    godina VARCHAR(50) NOT NULL,
    vlasnik INT NOT NULL
);

CREATE TABLE vlasnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    citatelj INT NOT NULL,
    knjiga INT NOT NULL
);

ALTER TABLE citatelj ADD FOREIGN KEY (knjiga) REFERENCES knjiga(sifra);

ALTER TABLE knjiga ADD FOREIGN KEY (vlasnik) REFERENCES vlasnik(sifra);

ALTER TABLE vlasnik ADD FOREIGN KEY (citatelj) REFERENCES citatelj(sifra);
ALTER TABLE vlasnik ADD FOREIGN KEY (knjiga) REFERENCES knjiga(sifra);