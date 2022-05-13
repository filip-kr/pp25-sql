# Nakladnik

DROP DATABASE IF EXISTS nakladnik;
CREATE DATABASE nakladnik default charset utf8mb4;
USE nakladnik;

CREATE TABLE mjesto(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    nakladnik INT
);

CREATE TABLE nakladnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    mjesto INT NOT NULL,
    djelo INT
);

CREATE TABLE djelo(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    naziv VARCHAR(50) NOT NULL,
    ime_autora VARCHAR(50) NOT NULL,
    prezime_autora VARCHAR(50) NOT NULL,
    nakladnik INT NOT NULL
);

CREATE TABLE izdanje(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nakladnik INT NOT NULL,
    djelo INT NOT NULL,
    mjesto INT NOT NULL,
    godina INT
);

ALTER TABLE mjesto ADD FOREIGN KEY (nakladnik) REFERENCES nakladnik(sifra);

ALTER TABLE nakladnik ADD FOREIGN KEY (mjesto) REFERENCES mjesto(sifra);
ALTER TABLE nakladnik ADD FOREIGN KEY (djelo) REFERENCES djelo(sifra);

ALTER TABLE djelo ADD FOREIGN KEY (nakladnik) REFERENCES nakladnik(sifra);

ALTER TABLE izdanje ADD FOREIGN KEY (nakladnik) REFERENCES nakladnik(sifra);
ALTER TABLE izdanje ADD FOREIGN KEY (djelo) REFERENCES djelo(sifra);
ALTER TABLE izdanje ADD FOREIGN KEY (mjesto) REFERENCES mjesto(sifra);