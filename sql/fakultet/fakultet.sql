# Fakultet

DROP DATABASE IF EXISTS fakultet;
CREATE DATABASE fakultet default charset utf8mb4;
USE fakultet;

CREATE TABLE student(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME NOT NULL,
    oib CHAR(11) NOT NULL,
    jmbag CHAR(10) NOT NULL,
    kolegij INT NOT NULL
);

CREATE TABLE kolegij(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    ects INT NOT NULL,
    rok INT
);

CREATE TABLE rok(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kolegij INT NOT NULL,
    vrijeme DATETIME,
    lokacija VARCHAR(20),
    student INT,
    ukupno_studenata INT
);

ALTER TABLE student ADD FOREIGN KEY (kolegij) REFERENCES kolegij(sifra);

ALTER TABLE kolegij ADD FOREIGN KEY (rok) REFERENCES rok(sifra);

ALTER TABLE rok ADD FOREIGN KEY (kolegij) REFERENCES kolegij(sifra);
ALTER TABLE rok ADD FOREIGN KEY (student) REFERENCES student(sifra);