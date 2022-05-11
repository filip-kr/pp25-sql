# Doktorska ordinacija

DROP DATABASE IF EXISTS ordinacija;
CREATE DATABASE ordinacija;
USE ordinacija;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    oib CHAR(11),
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL
);

CREATE TABLE doktor(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    hzzo BOOLEAN,
    pacijent INT,
    broj_pacijenata INT,
    datum_zaposlenja DATETIME,
    placa_bruto DEC(18,2),
    placa_neto DEC(18,2)
);

CREATE TABLE pacijent(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    doktor INT,
    broj_hzzo INT,
    dijagnoza VARCHAR(50)
);

CREATE TABLE tehnicar(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    doktor INT,
    strucna_sprema VARCHAR(50),
    datum_zaposlenja DATETIME,
    placa_bruto DEC(18,2),
    placa_neto DEC(18,2)
);

ALTER TABLE doktor ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE doktor ADD FOREIGN KEY (pacijent) REFERENCES pacijent(sifra);

ALTER TABLE pacijent ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE pacijent ADD FOREIGN KEY (doktor) REFERENCES doktor(sifra);

ALTER TABLE tehnicar ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE tehnicar ADD FOREIGN KEY (doktor) REFERENCES doktor(sifra);