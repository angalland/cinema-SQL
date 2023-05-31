-- a. Informations d’un film (id_film) : titre, année, durée (au format HH:MM) et réalisateur 
SELECT film.titre, YEAR(film.date_sortie) AS 'année de sortie', TIME_FORMAT(SEC_TO_TIME(film.duree_film * 60), '%H:%i') AS duree, personne.nom AS realisateur
FROM film
INNER JOIN realisateur
	ON film.id_realisateur = realisateur.id_realisateur
INNER JOIN personne
	ON realisateur.id_personne = personne.id_personne;