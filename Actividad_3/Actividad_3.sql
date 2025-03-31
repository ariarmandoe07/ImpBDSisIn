--+Aridni Mariana Yañez Sanchez T/V 4J

---ejercicio 1
CREATE TABLE casos (
    Caso varchar(20)
);

INSERT INTO casos ( Caso ) VALUES
    ('A'),
    ('B'),
    ('C');

SELECT perm FROM (
    SELECT CONCAT(a.Caso, b.Caso, c.Caso) AS perm
    FROM casos a
    JOIN casos b ON a.Caso != b.Caso
    JOIN casos c ON a.Caso != c.Caso AND b.Caso != c.Caso
) AS subquery;

---ejercicio 2

CREATE TABLE iteraciones (
id INT AUTO_INCREMENT PRIMARY KEY,
desarrollo VARCHAR(20),
terminacion DATE
);


INSERT INTO iteraciones (desarrollo, terminacion)
VALUES
('RestAPI', '2024-06-01'),
('RestAPI', '2024-06-14'),
('Web', '2024-06-05'),
('Web', '2024-06-10'),
('Web', '2024-06-16'),
('App', '2024-05-29'),
('App', '2024-06-02'),
('App', '2024-06-30');


WITH cte AS (
SELECT
desarrollo,
terminacion,
LAG(terminacion) OVER (PARTITION BY desarrollo ORDER BY terminacion) AS terminacion_previa
FROM iteraciones
)
SELECT
desarrollo,
ROUND(AVG(DATEDIFF(terminacion, terminacion_previa)), 0) AS promedio
FROM cte
WHERE terminacion_previa IS NOT NULL
GROUP BY desarrollo;

---ejercicio 3

CREATE TABLE Inventario (
Fecha DATE PRIMARY KEY,
Ajuste INT
);

INSERT INTO Inventario (Fecha, Ajuste) VALUES
('2025-01-03', 100),
('2025-01-04', 75),
('2025-01-05', -150),
('2025-01-06', 50),
('2025-01-07', -70);


SELECT
Fecha,
Ajuste,
SUM(Ajuste) OVER (ORDER BY Fecha) AS Inventario
FROM Inventario;