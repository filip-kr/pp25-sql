# Srednja škola

DROP DATABASE IF EXISTS srednja_skola;
CREATE DATABASE srednja_skola default charset utf8mb4;
USE srednja_skola;

CREATE TABLE ucenik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME NOT NULL,
    razred INT NOT NULL
);

CREATE TABLE profesor(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11) NOT NULL,
    datum_zaposlenja DATETIME NOT NULL,
    placa_neto DECIMAL(18,2),
    placa_bruto DECIMAL(18,2),
    razred INT NOT NULL
);

CREATE TABLE razred(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    godina INT NOT NULL,
    naziv CHAR(1) NOT NULL,
    profesor INT NOT NULL,
    ucenik INT NOT NULL
);

ALTER TABLE ucenik ADD FOREIGN KEY (razred) REFERENCES razred(sifra);

ALTER TABLE profesor ADD FOREIGN KEY (razred) REFERENCES razred(sifra);

ALTER TABLE razred ADD FOREIGN KEY (profesor) REFERENCES profesor(sifra);
ALTER TABLE razred ADD FOREIGN KEY (ucenik) REFERENCES ucenik(sifra);