-- a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 
SELECT film.titre, YEAR(film.date_sortie) AS 'année de sortie', TIME_FORMAT(SEC_TO_TIME(film.duree_film * 60), '%H:%i') AS duree, personne.nom AS realisateur
FROM film
INNER JOIN realisateur
	ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne
	ON realisateur.id_personne = personne.id_personne;

-- b. Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)
SELECT film.titre, TIME_FORMAT(SEC_TO_TIME(film.duree_film*60), '%Hh%i') AS duree
FROM film
WHERE film.duree_film >= 135
ORDER BY duree DESC;

-- c. Liste des films d’un réalisateur (en précisant l’année de sortie) 
SELECT personne.prenom, personne.nom, film.titre, YEAR(film.date_sortie) AS 'annee de sortie'
FROM realisateur
LEFT JOIN personne
	ON realisateur.id_personne = personne.id_personne
LEFT JOIN film
	ON realisateur.id_realisateur = film.id_realisateur

-- d. Nombre de films par genre (classés dans l’ordre décroissant)
SELECT COUNT(posseder_genre.id_film) AS 'film', genre.nom_genre AS 'genre'
FROM posseder_genre
INNER JOIN genre
	ON posseder_genre.id_genre = genre.id_genre
GROUP BY posseder_genre.id_genre
ORDER BY film DESC;

-- e. Nombre de films par réalisateur (classés dans l’ordre décroissant)
SELECT personne.prenom, personne.nom, COUNT(film.id_realisateur) AS 'film'
FROM film
INNER JOIN realisateur
	ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne
	ON realisateur.id_personne = personne.id_personne
GROUP BY personne.nom, personne.prenom
ORDER BY film DESC;
