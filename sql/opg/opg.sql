# Obiteljsko poljoprivredno gospodarstvo

DROP DATABASE IF EXISTS opg;
CREATE DATABASE opg default charset utf8mb4;
USE opg;

CREATE TABLE proizvod(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    sirovina INT NOT NULL,
    djelatnik INT NOT NULL,
    cijena DECIMAL(18,2)
);

CREATE TABLE sirovina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    proizvod INT
);

CREATE TABLE djelatnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    oib CHAR(11),
    placa_bruto DECIMAL(18,2),
    placa_neto DECIMAL(18,2),
    proizvod INT NOT NULL
);

ALTER TABLE proizvod ADD FOREIGN KEY (sirovina) REFERENCES sirovina(sifra);
ALTER TABLE proizvod ADD FOREIGN KEY (djelatnik) REFERENCES djelatnik(sifra);

ALTER TABLE sirovina ADD FOREIGN KEY (proizvod) REFERENCES proizvod(sifra);

ALTER TABLE djelatnik ADD FOREIGN KEY (proizvod) REFERENCES proizvod(sifra);