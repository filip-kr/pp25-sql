# Trgovački centar

DROP DATABASE IF EXISTS trgovacki_centar;
CREATE DATABASE trgovacki_centar default charset utf8mb4;
USE trgovacki_centar;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    oib CHAR(11),
    broj_telefona INT,
    trgovina INT NOT NULL,
    placa DECIMAL(18,2)
);

CREATE TABLE sef(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    trgovina INT NOT NULL
);

CREATE TABLE trgovina(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50),
    osoba INT NOT NULL,
    sef INT NOT NULL
);

ALTER TABLE osoba ADD FOREIGN KEY (trgovina) REFERENCES trgovina(sifra);

ALTER TABLE sef ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE sef ADD FOREIGN KEY (trgovina) REFERENCES trgovina(sifra);

ALTER TABLE trgovina ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE trgovina ADD FOREIGN KEY (sef) REFERENCES sef(sifra);