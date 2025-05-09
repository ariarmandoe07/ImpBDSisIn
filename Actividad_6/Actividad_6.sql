-- Aridni Mariana Yañez Sanchez 4J T/V

--Ejercicio 1

CREATE TABLE materiales (
    Producto varchar(30),
    Cantidad int
);

INSERT INTO materiales ( Producto, Cantidad) VALUES
	('Lapíz', 3 ),
    ('Borrador', 4 ),
    ('Cuaderno', 2 );

WITH RECURSIVE numeros AS (
  SELECT 1 AS n
  UNION ALL
  SELECT n + 1 FROM numeros WHERE n < 100
)
SELECT t.producto, 1 AS cantidad
FROM materiales t
JOIN numeros n ON n.n <= t.cantidad;

--Ejercicio 2

CREATE TABLE Asientos (
    num_asiento INTEGER
);


INSERT INTO Asientos (num_asiento) VALUES
(7), (13), (14), (15),
(27), (28), (29), (30),
(31), (32), (33), (34), (35),
(52), (53), (54);



WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numeros WHERE n + 1 <= 54
),
libres AS (
    SELECT n AS espacio
    FROM numeros
    WHERE n NOT IN (SELECT num_asiento FROM Asientos)
),
agrupados AS (
    SELECT 
        espacio,
        espacio - ROW_NUMBER() OVER (ORDER BY espacio) AS grupo
    FROM libres
)
SELECT 
    MIN(espacio) AS espacio_inicio,
    MAX(espacio) AS espacio_final
FROM agrupados
GROUP BY grupo
ORDER BY espacio_inicio;


WITH RECURSIVE numeros AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM numeros WHERE n + 1 <= 54
)
SELECT COUNT(*) AS disponibles
FROM numeros
WHERE n NOT IN (SELECT num_asiento FROM Asientos);


SELECT 
    CASE WHEN MOD(num_asiento, 2) = 0 THEN 'pares' ELSE 'impares' END AS tipo,
    COUNT(*) AS total
FROM Asientos
GROUP BY tipo;

--Ejercicio 3

CREATE TABLE Periodos (
    Inicio DATE,
    Final DATE
);

INSERT INTO Periodos (Inicio, Final)
VALUES
    ('2025-01-01', '2025-01-05'),
    ('2025-01-03', '2025-01-09'),
    ('2025-01-10', '2025-01-11'),
    ('2025-01-12', '2025-01-16'),
    ('2025-01-15', '2025-01-19');



WITH Ordenado AS (
    SELECT
        *,
        LAG(Final) OVER (ORDER BY Inicio) AS Final_Anterior,
        LAG(Inicio) OVER (ORDER BY Inicio) AS Inicio_Anterior
    FROM Periodos
),
Marcado AS (
    SELECT *,
        CASE
            WHEN Final_Anterior IS NULL OR Inicio > Final_Anterior THEN 1
            ELSE 0
        END AS NuevoGrupo
    FROM Ordenado
),
Grupos AS (
    SELECT *,
        SUM(NuevoGrupo) OVER (ORDER BY Inicio ROWS UNBOUNDED PRECEDING) AS Grupo
    FROM Marcado
)
SELECT
    MIN(Inicio) AS Inicio,
    MAX(Final) AS Final
FROM Grupos
GROUP BY Grupo
ORDER BY Inicio;
