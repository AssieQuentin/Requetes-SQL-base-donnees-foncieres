CREATE TEMPORARY TABLE ventes_t_un AS (SELECT c.id_comm, nom_comm, count(*) AS vtun FROM commune c 
										INNER JOIN bien b ON b.id_comm = c.id_comm INNER JOIN vente v ON v.id_bien = b.id_bien
                                        WHERE date_vente BETWEEN "2020-01-01" AND "2020-03-31" GROUP BY c.id_comm) ;

CREATE TEMPORARY TABLE ventes_t_deux AS (SELECT c.id_comm, nom_comm, count(*) AS vtdeux FROM commune c 
										INNER JOIN bien b ON b.id_comm = c.id_comm INNER JOIN vente v ON v.id_bien = b.id_bien
                                        WHERE date_vente BETWEEN "2020-04-01" AND "2020-06-30" GROUP BY c.id_comm) ;
						
CREATE TEMPORARY TABLE recap_vente AS (SELECT c.id_comm, c.nom_comm, vtun, vtdeux FROM commune c INNER JOIN ventes_t_un ON c.id_comm = ventes_t_un.id_comm
										INNER JOIN ventes_t_deux ON ventes_t_un.id_comm = ventes_t_deux.id_comm) ;


SELECT id_comm, nom_comm, (vtdeux - vtun) / vtun * 100 AS "tx_var" FROM recap_vente
WHERE (vtdeux - vtun) / vtun * 100 >= 20
ORDER BY (vtdeux - vtun) / vtun * 100 DESC
