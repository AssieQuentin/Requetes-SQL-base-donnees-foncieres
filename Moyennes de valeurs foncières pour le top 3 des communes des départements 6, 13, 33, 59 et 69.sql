CREATE TEMPORARY TABLE top_valeur AS 
	(SELECT code_dep, c.id_comm, nom_comm, 
		round(AVG(valeur)) AS "valeur moyenne", 
		rank() over(partition by code_dep order by avg(valeur) desc) AS TOP
	FROM commune c INNER JOIN bien b ON c.id_comm = b.id_comm INNER JOIN vente v ON v.id_bien = b.id_bien WHERE code_dep IN ("6", "13", "33", "59", "69") 
	GROUP BY id_comm
	ORDER BY TOP, AVG(valeur) DESC 
	LIMIT 15) ;

SELECT * FROM top_valeur ORDER BY code_dep