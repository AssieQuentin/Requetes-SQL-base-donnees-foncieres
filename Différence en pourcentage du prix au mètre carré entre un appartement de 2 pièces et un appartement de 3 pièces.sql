SELECT ROUND(
			(SELECT AVG(valeur/surf_carrez) - (SELECT AVG(valeur/surf_carrez) FROM bien b INNER JOIN vente v ON b.id_bien = v.id_bien
												WHERE type_local = "Appartement" AND nb_pieces = 2) 
				FROM bien b INNER JOIN vente v ON b.id_bien = v.id_bien WHERE type_local = "Appartement" AND nb_pieces = 3) 
			/ (SELECT AVG(valeur/surf_carrez) FROM bien b INNER JOIN vente v ON b.id_bien = v.id_bien
					WHERE type_local = "Appartement" AND nb_pieces = 2) 
			* 100, 2) AS "Difference en % entre le prix/m2 des appart. de 2 pieces et de 3 pieces"