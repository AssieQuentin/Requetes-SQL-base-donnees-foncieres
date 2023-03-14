	SELECT 
	(SELECT count(*) 
		- (SELECT count(*) FROM vente WHERE date_vente BETWEEN "2020-01-01" AND "2020-03-31")
	FROM vente WHERE date_vente BETWEEN "2020-04-01" AND "2020-06-30")
    / (SELECT count(*) FROM vente WHERE date_vente BETWEEN "2020-01-01" AND "2020-03-31")
    * 100
    AS "tx de variation %"