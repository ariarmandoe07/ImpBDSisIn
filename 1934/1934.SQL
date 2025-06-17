---- Aridni Mariana Yañez Sanchez 4J

SELECT
s.user_id,
ROUND(AVG(IF(c.action = 'Confirmed', 1,0)), 2) AS confirmation_rate
FROM Confirmations as c
RIGHT JOIN Signups as s
USING(user_id)
GROUP BY 1;