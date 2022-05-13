# Odvjetnik

DROP DATABASE IF EXISTS odvjetnik;
CREATE DATABASE odvjetnik default charset utf8mb4;
USE odvjetnik;

CREATE TABLE odvjetnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    oib CHAR(11),
    klijent INT,
    suradnik INT
);

CREATE TABLE klijent(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50),
    prezime VARCHAR(50),
    datum_rodenja DATETIME,
    odvjetnik INT NOT NULL,
    obrana INT NOT NULL
);

CREATE TABLE suradnik(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    ime VARCHAR(50) NOT NULL,
    prezime VARCHAR(50) NOT NULL,
    datum_rodenja DATETIME,
    oib CHAR(11),
    odvjetnik INT NOT NULL,
    obrana INT NOT NULL
);

CREATE TABLE obrana(
    sifra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    odvjetnik INT NOT NULL,
    klijent INT NOT NULL,
    suradnik INT
);

ALTER TABLE odvjetnik ADD FOREIGN KEY (klijent) REFERENCES klijent(sifra);
ALTER TABLE odvjetnik ADD FOREIGN KEY (suradnik) REFERENCES suradnik(sifra);

ALTER TABLE klijent ADD FOREIGN KEY (odvjetnik) REFERENCES odvjetnik(sifra);
ALTER TABLE klijent ADD FOREIGN KEY (obrana) REFERENCES obrana(sifra);

ALTER TABLE suradnik ADD FOREIGN KEY (odvjetnik) REFERENCES odvjetnik(sifra);
ALTER TABLE suradnik ADD FOREIGN KEY (obrana) REFERENCES obrana(sifra);

ALTER TABLE obrana ADD FOREIGN KEY (odvjetnik) REFERENCES odvjetnik(sifra);
ALTER TABLE obrana ADD FOREIGN KEY (klijent) REFERENCES klijent(sifra);
ALTER TABLE obrana ADD FOREIGN KEY (suradnik) REFERENCES suradnik(sifra);