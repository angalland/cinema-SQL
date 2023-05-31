CREATE TABLE IF NOT EXISTS Realisateur(
   id_realisateur INT AUTO_INCREMENT,
   nom_realisateur VARCHAR(25) NOT NULL,
   prenom VARCHAR(25) NOT NULL,
   date_naissance_realisateur DATE NOT NULL,
   sexe_realisateur VARCHAR(1) NOT NULL,
   PRIMARY KEY(id_realisateur)
);

CREATE TABLE IF NOT EXISTS Genre(
   id_genre INT AUTO_INCREMENT,
   nom_genre VARCHAR(25) NOT NULL,
   PRIMARY KEY(id_genre)
);

CREATE TABLE IF NOT EXISTS Acteur(
   id_acteur INT AUTO_INCREMENT,
   nom_acteur VARCHAR(25) NOT NULL,
   prenom_acteur VARCHAR(25) NOT NULL,
   sexe_acteur VARCHAR(1) NOT NULL,
   date_naissance_acteur DATE NOT NULL,
   PRIMARY KEY(id_acteur)
);

CREATE TABLE IF NOT EXISTS Film(
   id_film INT AUTO_INCREMENT,
   titre VARCHAR(25) NOT NULL,
   date_sortie DATE NOT NULL,
   duree_film TIME NOT NULL,
   synopsis TEXT(500),
   note INT,
   affiche VARCHAR(50),
   id_realisateur INT NOT NULL,
   PRIMARY KEY(id_film),
   FOREIGN KEY(id_realisateur) REFERENCES Realisateur(id_realisateur)
);

CREATE TABLE IF NOT EXISTS posseder_genre(
   id_film INT,
   id_genre INT,
   PRIMARY KEY(id_film, id_genre),
   FOREIGN KEY(id_film) REFERENCES Film(id_film),
   FOREIGN KEY(id_genre) REFERENCES Genre(id_genre)
);

CREATE TABLE IF NOT EXISTS jouer(
   id_film INT,
   id_acteur INT,
   role VARCHAR(25),
   PRIMARY KEY(id_film, id_acteur),
   FOREIGN KEY(id_film) REFERENCES Film(id_film),
   FOREIGN KEY(id_acteur) REFERENCES Acteur(id_acteur)
);
