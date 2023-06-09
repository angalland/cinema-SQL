CREATE TABLE Genre(
   id_genre INT AUTO_INCREMENT,
   nom_genre VARCHAR(25) NOT NULL,
   PRIMARY KEY(id_genre)
);

CREATE TABLE personne(
   id_personne INT AUTO_INCREMENT,
   nom VARCHAR(25) NOT NULL,
   prenom VARCHAR(25) NOT NULL,
   date_naissance DATE NOT NULL,
   sexe VARCHAR(1) NOT NULL,
   PRIMARY KEY(id_personne)
);

CREATE TABLE personnage(
   id_personnage INT AUTO_INCREMENT,
   nom_personnage VARCHAR(25) NOT NULL,
   PRIMARY KEY(id_personnage)
);

CREATE TABLE Realisateur(
   id_realisateur INT AUTO_INCREMENT,
   id_personne INT NOT NULL,
   PRIMARY KEY(id_realisateur),
   UNIQUE(id_personne),
   FOREIGN KEY(id_personne) REFERENCES personne(id_personne)
);

CREATE TABLE Acteur(
   id_acteur INT AUTO_INCREMENT,
   id_personne INT NOT NULL,
   PRIMARY KEY(id_acteur),
   UNIQUE(id_personne),
   FOREIGN KEY(id_personne) REFERENCES personne(id_personne)
);

CREATE TABLE Film(
   id_film INT AUTO_INCREMENT,
   duree_film INT NOT NULL,
   titre VARCHAR(25) NOT NULL,
   date_sortie DATE NOT NULL,
   synopsis TEXT,
   note INT,
   affiche VARCHAR(50),
   id_realisateur INT NOT NULL,
   PRIMARY KEY(id_film),
   FOREIGN KEY(id_realisateur) REFERENCES Realisateur(id_realisateur)
);

CREATE TABLE posseder_genre(
   id_film INT,
   id_genre INT,
   PRIMARY KEY(id_film, id_genre),
   FOREIGN KEY(id_film) REFERENCES Film(id_film),
   FOREIGN KEY(id_genre) REFERENCES Genre(id_genre)
);

CREATE TABLE jouer(
   id_film INT,
   id_acteur INT,
   id_personnage INT,
   PRIMARY KEY(id_film, id_acteur, id_personnage),
   FOREIGN KEY(id_film) REFERENCES Film(id_film),
   FOREIGN KEY(id_acteur) REFERENCES Acteur(id_acteur),
   FOREIGN KEY(id_personnage) REFERENCES personnage(id_personnage)
);

