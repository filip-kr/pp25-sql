# Osnovna škola

DROP DATABASE IF EXISTS osnovna_skola;
CREATE DATABASE osnovna_skola default charset utf8mb4;
USE osnovna_skola;

CREATE TABLE dijete(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME NOT NULL,
    radionica INT
);

CREATE TABLE uciteljica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11) NOT NULL,
    datum_zaposlenja DATETIME NOT NULL,
    placa_bruto DECIMAL(18,2),
    placa_neto DECIMAL(18,2),
    radionica INT
);

CREATE TABLE radionica(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50),
    voditelj INT NOT NULL,
    dijete INT
);

ALTER TABLE dijete ADD FOREIGN KEY (radionica) REFERENCES radionica(sifra);

ALTER TABLE uciteljica ADD FOREIGN KEY (radionica) REFERENCES radionica(sifra);

ALTER TABLE radionica ADD FOREIGN KEY (voditelj) REFERENCES uciteljica(sifra);
ALTER TABLE radionica ADD FOREIGN KEY (dijete) REFERENCES dijete(sifra);