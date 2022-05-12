# Restoran

DROP DATABASE IF EXISTS restoran;
CREATE DATABASE restoran default charset utf8mb4;
USE restoran;

CREATE TABLE jelovnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    kategorija INT NOT NULL
);

CREATE TABLE kategorija(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    jelo INT NOT NULL
);

CREATE TABLE jelo(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    cijena DECIMAL(18,2),
    pice INT
);

CREATE TABLE pice(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    vrsta VARCHAR(50),
    alkohol BOOLEAN NOT NULL,
    gazirano BOOLEAN NOT NULL,
    cijena DECIMAL(18,2),
    jelo INT
);

ALTER TABLE jelovnik ADD FOREIGN KEY (kategorija) REFERENCES kategorija(sifra);

ALTER TABLE kategorija ADD FOREIGN KEY (jelo) REFERENCES jelo(sifra);

ALTER TABLE jelo ADD FOREIGN KEY (pice) REFERENCES pice(sifra);

ALTER TABLE pice ADD FOREIGN KEY (jelo) REFERENCES jelo(sifra);