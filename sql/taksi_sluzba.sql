# Taksi služba

DROP DATABASE IF EXISTS taksi_sluzba;
CREATE DATABASE taksi_sluzba;
USE taksi_sluzba;

CREATE TABLE osoba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    oib CHAR(11)
);

CREATE TABLE vozilo(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    marka VARCHAR(50),
    model VARCHAR(50),
    vozac INT
);

CREATE TABLE vozac(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    datum_zaposljenja DATETIME,
    placa_bruto DEC(18,2),
    placa_neto DEC(18,2),
    vozilo INT
);

CREATE TABLE putnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    osoba INT NOT NULL,
    km DEC(18,2),
    cijena DEC(18,2)
);

CREATE TABLE voznja(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    vozilo INT NOT NULL,
    vozac INT NOT NULL,
    putnik INT NOT NULL,
    ukupno_putnika INT,
    ukupno_km DEC(18,2),
    ukupno_kn DEC(18,2)
);

ALTER TABLE vozilo ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);

ALTER TABLE vozac ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);
ALTER TABLE vozac ADD FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);

ALTER TABLE putnik ADD FOREIGN KEY (osoba) REFERENCES osoba(sifra);

ALTER TABLE voznja ADD FOREIGN KEY (vozilo) REFERENCES vozilo(sifra);
ALTER TABLE voznja ADD FOREIGN KEY (vozac) REFERENCES vozac(sifra);
ALTER TABLE voznja ADD FOREIGN KEY (putnik) REFERENCES putnik(sifra);