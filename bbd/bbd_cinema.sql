-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour cinema
CREATE DATABASE IF NOT EXISTS `cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cinema`;

-- Listage de la structure de table cinema. acteur
CREATE TABLE IF NOT EXISTS `acteur` (
  `id_acteur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_acteur`),
  UNIQUE KEY `id_personne` (`id_personne`),
  CONSTRAINT `acteur_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.acteur : ~21 rows (environ)
INSERT INTO `acteur` (`id_acteur`, `id_personne`) VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 4),
	(5, 5),
	(6, 6),
	(7, 7),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 11),
	(12, 12),
	(13, 13),
	(14, 14),
	(15, 15),
	(16, 16),
	(17, 17),
	(18, 18),
	(19, 19),
	(20, 20),
	(21, 21);

-- Listage de la structure de table cinema. film
CREATE TABLE IF NOT EXISTS `film` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `duree_film` int NOT NULL,
  `titre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date_sortie` date NOT NULL,
  `synopsis` text,
  `note` float DEFAULT NULL,
  `affiche` varchar(50) DEFAULT NULL,
  `id_realisateur` int NOT NULL,
  PRIMARY KEY (`id_film`),
  KEY `id_realisateur` (`id_realisateur`),
  CONSTRAINT `film_ibfk_1` FOREIGN KEY (`id_realisateur`) REFERENCES `realisateur` (`id_realisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.film : ~13 rows (environ)
INSERT INTO `film` (`id_film`, `duree_film`, `titre`, `date_sortie`, `synopsis`, `note`, `affiche`, `id_realisateur`) VALUES
	(1, 115, 'Les aventuriers de l\'arche perdue', '1981-09-16', 'Professeur d\'archéologie, Indiana Jones parcourt le monde à la recherche de trésors. Son rival, le Français René Belloq, travaille pour les nazis qui rêvent de retrouver l\'Arche d\'alliance contenant les Tables de la Loi. Or, feu le professeur Ravenwood, père de Marion, l\'ex-petite amie d\'Indiana Jones, détenait une médaille permettant de localiser l\'arche. Jones part sur les traces de Marion au Népal.', 4, '../image/indiana.jpg', 2),
	(2, 121, 'stars-wars IV: un nouvel espoir', '1977-10-19', 'La guerre civile fait rage entre l\'Empire galactique et l\'Alliance rebelle. Capturée par les troupes de choc de l\'Empereur menées par le sombre et impitoyable Dark Vador, la princesse Leia Organa dissimule les plans de l\'Etoile Noire.', 4, NULL, 3),
	(3, 127, 'Polisse', '2011-10-19', 'À Paris, Melissa, une photographe, vient effectuer un reportage sur la Brigade de protection des mineurs, la BPM. Incestes et pédophilie, maltraitance, enlèvement, prostitution adolescente, misère ordinaire, mariage forcé. En contrepoint à ces tragédies quotidiennes s\'enchaînent aussi des événements personnels pour des flics sous tension, entre fous rires et coups de gueule. Fred et Melissa tombent amoureux ; Nadine divorce et puis regrette ; l\'anorexie et la solitude d\'Iris s\'aggravent.', 5, '../image/polisse.jpg', 1),
	(4, 95, 'Camping', '2006-04-26', NULL, 2.5, NULL, 4),
	(5, 96, 'Evil dead rise', '2023-04-19', NULL, 3, NULL, 5),
	(6, 92, 'Super mario brosh le film', '2023-04-06', 'Un plombier nommé Mario parcourt un labyrinthe souterrain avec son frère, Luigi, essayant de sauver une princesse capturée. Adaptation cinématographique du célèbre jeu vidéo.', 4.5, '../image/mario.jpg', 6),
	(7, 126, 'Batman', '1989-09-13', NULL, 3.25, NULL, 7),
	(8, 126, 'Batman : le defi', '1992-07-15', NULL, 3.5, NULL, 7),
	(9, 122, 'Batman forever', '1995-07-19', NULL, 2, NULL, 8),
	(10, 125, 'Batman et robin', '1997-06-20', NULL, 1, NULL, 8),
	(11, 140, 'Batman begins', '2005-06-15', 'Comment un homme seul peut-il changer le monde ? Telle est la question qui hante Bruce Wayne depuis cette nuit tragique où ses parents furent abattus sous ses yeux, dans une ruelle de Gotham City. Torturé par un profond sentiment de colère et de culpabilité, le jeune héritier de cette richissime famille fuit Gotham pour un long et discret voyage à travers le monde. Le but de ses pérégrinations : sublimer sa soif de vengeance en trouvant de nouveaux moyens de lutter contre l\'injustice.', 3.5, '../image/batman_begins.jpg', 9),
	(12, 152, 'The dark knight', '2008-08-13', 'Batman est plus que jamais déterminé à éradiquer le crime organisé qui sème la terreur en ville. Epaulé par le lieutenant Jim Gordon et par le procureur de Gotham City, Harvey Dent, Batman voit son champ d\'action s\'élargir. La collaboration des trois hommes s\'avère très efficace et ne tarde pas à porter ses fruits jusqu\'à ce qu\'un criminel redoutable vienne plonger la ville de Gotham City dans le chaos.', 4.5, '../image/the_dark_knight.jpg', 9),
	(13, 164, 'the dark knight rises', '2012-07-25', 'Il y a huit ans, Batman a disparu dans la nuit : lui qui était un héros est alors devenu un fugitif. L\'arrivée d\'une féline et fourbe cambrioleuse au mystérieux dessein chamboule l\'ordre établi. Bien plus dangereuse encore est l\'apparition de Bane, terroriste masqué dont l\'impitoyable projet pour Gotham pousse Bruce à sortir de l\'exil qu\'il s\'est imposé. Mais bien qu\'il reprenne cape et masque, Batman pourrait ne pas être un adversaire à la taille de Bane...', 3, '../image/the_dark_knight_rises.jpg', 9);

-- Listage de la structure de table cinema. genre
CREATE TABLE IF NOT EXISTS `genre` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `nom_genre` varchar(25) NOT NULL,
  PRIMARY KEY (`id_genre`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.genre : ~10 rows (environ)
INSERT INTO `genre` (`id_genre`, `nom_genre`) VALUES
	(1, 'science fiction'),
	(2, 'aventure'),
	(3, 'guerre'),
	(4, 'action'),
	(5, 'comedie'),
	(6, 'drame'),
	(7, 'animation'),
	(8, 'policier'),
	(9, 'fantastique'),
	(10, 'horreur');

-- Listage de la structure de table cinema. jouer
CREATE TABLE IF NOT EXISTS `jouer` (
  `id_film` int NOT NULL,
  `id_acteur` int NOT NULL,
  `id_personnage` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_acteur`,`id_personnage`),
  KEY `id_acteur` (`id_acteur`),
  KEY `id_personnage` (`id_personnage`),
  CONSTRAINT `jouer_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `jouer_ibfk_2` FOREIGN KEY (`id_acteur`) REFERENCES `acteur` (`id_acteur`),
  CONSTRAINT `jouer_ibfk_3` FOREIGN KEY (`id_personnage`) REFERENCES `personnage` (`id_personnage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.jouer : ~25 rows (environ)
INSERT INTO `jouer` (`id_film`, `id_acteur`, `id_personnage`) VALUES
	(1, 1, 1),
	(2, 1, 3),
	(1, 2, 2),
	(2, 3, 4),
	(2, 4, 5),
	(3, 5, 6),
	(3, 6, 7),
	(3, 7, 8),
	(3, 8, 9),
	(4, 9, 10),
	(4, 10, 11),
	(4, 11, 12),
	(5, 12, 13),
	(5, 13, 14),
	(6, 14, 15),
	(6, 15, 16),
	(6, 16, 17),
	(6, 17, 18),
	(11, 18, 19),
	(12, 18, 19),
	(13, 18, 19),
	(7, 19, 19),
	(8, 19, 19),
	(9, 20, 19),
	(10, 21, 19);

-- Listage de la structure de table cinema. personnage
CREATE TABLE IF NOT EXISTS `personnage` (
  `id_personnage` int NOT NULL AUTO_INCREMENT,
  `nom_personnage` varchar(25) NOT NULL,
  PRIMARY KEY (`id_personnage`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personnage : ~19 rows (environ)
INSERT INTO `personnage` (`id_personnage`, `nom_personnage`) VALUES
	(1, 'Indiana jones'),
	(2, 'Marion Ravenwood'),
	(3, 'Han solo'),
	(4, 'Luke Skywalker'),
	(5, 'Princess Leia Organa'),
	(6, 'Melissa'),
	(7, 'Nadine'),
	(8, 'Fred'),
	(9, 'Iris'),
	(10, 'Patrick Chirac'),
	(11, 'Michel Saint-Josse'),
	(12, 'Sophie Gatineau'),
	(13, 'Beth'),
	(14, 'Ellie'),
	(15, 'Mario'),
	(16, 'Luigi'),
	(17, 'Princesse Peach'),
	(18, 'Bowser'),
	(19, 'Batman');

-- Listage de la structure de table cinema. personne
CREATE TABLE IF NOT EXISTS `personne` (
  `id_personne` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `date_naissance` date NOT NULL,
  `sexe` varchar(1) NOT NULL,
  PRIMARY KEY (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.personne : ~29 rows (environ)
INSERT INTO `personne` (`id_personne`, `nom`, `prenom`, `date_naissance`, `sexe`) VALUES
	(1, 'Ford', 'Harrison', '1942-07-13', 'M'),
	(2, 'Allen', 'Karen', '1951-10-05', 'F'),
	(3, 'Hamil', 'Mark', '1951-09-25', 'M'),
	(4, 'Fisher', 'Carrie', '1956-10-21', 'F'),
	(5, 'Le Besco', 'Maïwenn', '1976-04-17', 'F'),
	(6, 'Viard', 'Karin', '1966-01-24', 'F'),
	(7, 'Starr', 'Joey', '1967-10-27', 'M'),
	(8, 'Foïs', 'Marina', '1970-01-21', 'F'),
	(9, 'Dubosc', 'Franck', '1963-11-07', 'M'),
	(10, 'Lanvain', 'Gérard', '1950-06-21', 'M'),
	(11, 'Seigner', 'Mathilde', '1968-01-17', 'F'),
	(12, 'Sullivan', 'Lily', '1994-09-08', 'F'),
	(13, 'Sutherland', 'Alyssa', '1982-06-23', 'F'),
	(14, 'Pratt', 'Cristopher', '1979-06-21', 'M'),
	(15, 'Day', 'Charlie', '1976-02-09', 'M'),
	(16, 'Taylor-Joy', 'Anya', '1996-04-16', 'F'),
	(17, 'Black', 'Jack', '1969-08-28', 'M'),
	(18, 'Bale', 'Christian', '1974-01-30', 'M'),
	(19, 'Keaton', 'Michael', '1971-09-05', 'M'),
	(20, 'Kilmer', 'Val', '1959-12-31', 'M'),
	(21, 'Clooney', 'George', '1961-05-06', 'M'),
	(22, 'Spielberg', 'Steven', '1946-12-18', 'M'),
	(23, 'Lucas', 'George', '1944-05-14', 'M'),
	(24, 'Onteniente', 'Fabien', '1958-04-27', 'M'),
	(25, 'Cronin', 'Lee', '1973-06-01', 'M'),
	(26, 'Horvath', 'Aaron', '1980-08-19', 'M'),
	(27, 'Burton', 'Tim', '1958-08-25', 'M'),
	(28, 'Schumacher', 'Joel', '1939-08-29', 'M'),
	(29, 'Nolan', 'Christopher', '1970-07-30', 'M');

-- Listage de la structure de table cinema. posseder_genre
CREATE TABLE IF NOT EXISTS `posseder_genre` (
  `id_film` int NOT NULL,
  `id_genre` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_genre`),
  KEY `id_genre` (`id_genre`),
  CONSTRAINT `posseder_genre_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `film` (`id_film`),
  CONSTRAINT `posseder_genre_ibfk_2` FOREIGN KEY (`id_genre`) REFERENCES `genre` (`id_genre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.posseder_genre : ~24 rows (environ)
INSERT INTO `posseder_genre` (`id_film`, `id_genre`) VALUES
	(2, 1),
	(1, 2),
	(1, 4),
	(5, 4),
	(7, 4),
	(8, 4),
	(9, 4),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 4),
	(4, 5),
	(3, 6),
	(6, 7),
	(3, 8),
	(11, 8),
	(12, 8),
	(13, 8),
	(2, 9),
	(7, 9),
	(8, 9),
	(9, 9),
	(5, 10),
	(10, 10);

-- Listage de la structure de table cinema. realisateur
CREATE TABLE IF NOT EXISTS `realisateur` (
  `id_realisateur` int NOT NULL AUTO_INCREMENT,
  `id_personne` int NOT NULL,
  PRIMARY KEY (`id_realisateur`),
  UNIQUE KEY `id_personne` (`id_personne`),
  CONSTRAINT `realisateur_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `personne` (`id_personne`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Listage des données de la table cinema.realisateur : ~9 rows (environ)
INSERT INTO `realisateur` (`id_realisateur`, `id_personne`) VALUES
	(1, 5),
	(2, 22),
	(3, 23),
	(4, 24),
	(5, 25),
	(6, 26),
	(7, 27),
	(8, 28),
	(9, 29);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
