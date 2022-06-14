SELECT NOW();

SELECT LOWER(ime) FROM osoba;

SELECT LOWER(LEFT(ime,1)) FROM osoba;

SELECT CONCAT (LOWER(LEFT(ime,1)), 
LOWER(prezime), '@gmail.com') FROM osoba;

SELECT POW(2,3);
SELECT SQRT(9);
SELECT ABS(-1);

DELIMITER $$
CREATE FUNCTION email(ime VARCHAR(50), prezime varchar(50))
RETURNS VARCHAR(255)
BEGIN
	RETURN CONCAT(ime,prezime,'@gmail.com');
END;
$$
DELIMITER ;

CREATE TABLE logiranje(
    tko VARCHAR(255),
    sto VARCHAR(255),
    kada DATETIME DEFAULT NOW()
);
SELECT * FROM logiranje;
INSERT INTO osoba (ime, prezime, email)
VALUES
('Pero', 'Perić', 'peroperic@gmail.com');