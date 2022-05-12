# Muzej

DROP DATABASE IF EXISTS muzej;
CREATE DATABASE muzej default charset utf8mb4;
USE muzej;

CREATE TABLE izlozba(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50),
    broj_eksponata INT,
    datum_pocetka DATETIME,
    datum_zavrsetka DATETIME,
    kustos INT,
    sponzor INT
);

CREATE TABLE kustos(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    izlozba INT
);

CREATE TABLE sponzor(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50),
    izlozba INT,
    kn DECIMAL(18,2)
);

ALTER TABLE izlozba ADD FOREIGN KEY (kustos) REFERENCES kustos(sifra);
ALTER TABLE izlozba ADD FOREIGN KEY (sponzor) REFERENCES sponzor(sifra);

ALTER TABLE kustos ADD FOREIGN KEY (izlozba) REFERENCES izlozba(sifra);

ALTER TABLE sponzor ADD FOREIGN KEY (izlozba) REFERENCES izlozba(sifra);