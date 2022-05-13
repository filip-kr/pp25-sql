# Dječja igraonica

DROP DATABASE IF EXISTS djecja_igraonica;
CREATE DATABASE djecja_igraonica default charset utf8mb4;
USE djecja_igraonica;

CREATE TABLE skupina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    voditelj INT NOT NULL,
    dijete INT
);

CREATE TABLE dijete(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    spol CHAR(1),
    skupina INT NOT NULL
);

CREATE TABLE teta(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    skupina INT NOT NULL
);

ALTER TABLE skupina ADD FOREIGN KEY (voditelj) REFERENCES teta(sifra);
ALTER TABLE skupina ADD FOREIGN KEY (dijete) REFERENCES dijete(sifra);

ALTER TABLE dijete ADD FOREIGN KEY (skupina) REFERENCES skupina(sifra);

ALTER TABLE teta ADD FOREIGN KEY (skupina) REFERENCES skupina(sifra);