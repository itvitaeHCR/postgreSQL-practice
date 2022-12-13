DROP TABLE IF EXISTS lidmaatschap;
DROP TABLE IF EXISTS inschrijving;
DROP TABLE IF EXISTS speler;
DROP TABLE IF EXISTS club;
DROP TABLE IF EXISTS toernooi;


CREATE TABLE speler (
	spelernummer INTEGER PRIMARY KEY UNIQUE NOT NULL,
	naam VARCHAR(255) NOT NULL,
	adres VARCHAR(255),
	woonplaats VARCHAR(255)
);

CREATE TABLE club (
	naam VARCHAR(255) PRIMARY KEY NOT NULL,
	logo bytea
);

CREATE TABLE toernooi (
	naam VARCHAR(255) PRIMARY KEY NOT NULL,
	winnaar INTEGER NOT NULL,
	deelnemers INTEGER NOT NULL,
	prijzengeld INTEGER NOT NULL,
	clubnaam VARCHAR(255) NOT NULL
);

CREATE TABLE lidmaatschap (
	ID SERIAL NOT NULL,
	begindatum DATE NOT NULL,
	einddatum DATE NOT NULL,
	spelerspelernummer INTEGER NOT NULL,
	clubnaam VARCHAR(255) NOT NULL
);

CREATE TABLE inschrijving (
	inschrijfnummer INTEGER PRIMARY KEY UNIQUE NOT NULL,
	spelernummer INTEGER UNIQUE NOT NULL,
	toernooinaam VARCHAR(255) UNIQUE NOT NULL
);

ALTER TABLE toernooi ADD CONSTRAINT winnaar_fk 
	FOREIGN KEY (winnaar) REFERENCES inschrijving(spelernummer);
	
ALTER TABLE lidmaatschap ADD CONSTRAINT spelernr_fk 
	FOREIGN KEY (spelerspelernummer) REFERENCES speler(spelernummer);
	
ALTER TABLE lidmaatschap ADD CONSTRAINT club_fk 
	FOREIGN KEY (clubnaam) REFERENCES club(naam);
	
ALTER TABLE inschrijving ADD CONSTRAINT spelernrinschrijving_fk 
	FOREIGN KEY (spelernummer) REFERENCES speler(spelernummer);
	
ALTER TABLE inschrijving ADD CONSTRAINT toernooi_fk 
	FOREIGN KEY (toernooinaam) REFERENCES toernooi(naam);