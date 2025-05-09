-- Aridni Mariana Yañez Sanchez 4J T/V

--Ejercicio 1

CREATE TABLE puntuaciones (
    Id_jugador INT,
    Marcador INT
);

INSERT INTO puntuaciones (Id_jugador, Marcador) VALUES
(1001, 2343),
(2002, 9432),
(3003, 6548),
(4004, 1054),
(5005, 6832);


SELECT 
NTILE(2) OVER (ORDER BY Marcador DESC) AS Categoria,
Id_jugador,
Marcador
FROM puntuaciones;

--Ejercicio 2

CREATE TABLE paginacion (
    Id_orden INT,
    Id_cliente INT,
    Fecha DATE,
    Cantidad VARCHAR (30),
    Estado VARCHAR (30)
    );


INSERT INTO paginacion (Id_orden, Id_cliente, Fecha, Cantidad, Estado) VALUES
(1, 1001, '2025-01-01', '$100', 'JAL'),
(2, 3003, '2025-01-01', '$100', 'COL'),
(3, 1001, '2025-01-03', '$100', 'JAL'),
(4, 2002, '2025-01-02', '$150', 'JAL'),
(5, 1001, '2025-01-02', '$100', 'JAL'),
(6, 4004, '2025-01-05', '$50', 'COL'),
(7, 1001, '2025-01-01', '$150', 'JAL'),
(8, 3003, '2025-01-03', '$100', 'COL'),
(9, 4004, '2025-01-04', '$100', 'COL'),
(10, 1001, '2025-01-01', '$75', 'JAL'),
(11, 2002, '2025-01-02', '$75', 'JAL'),
(12, 3003, '2025-01-02', '$100', 'COL'),
(13, 4004, '2025-01-05', '$100', 'COL');


SELECT * 
FROM paginacion
ORDER BY Id_orden
LIMIT 5 OFFSET 4;


--Ejercicio 3

CREATE TABLE ordenes (
Id_orden INT,
Id_cliente INT,
Cantidad INT,
Proveedor VARCHAR(20)
);


INSERT INTO ordenes (Id_orden, Id_cliente, Cantidad, Proveedor) VALUES
(1, 1001, 12, 'IBM'),
(2, 1001, 54, 'IBM'),
(3, 1001, 32, 'Amazon'),
(4, 2002, 7, 'Amazon'),
(5, 2002, 16, 'Amazon'),
(6, 2002, 5, 'IBM');


SELECT Id_cliente, Proveedor
FROM (
SELECT
Id_cliente,
Proveedor,
SUM(Cantidad) AS Total,
ROW_NUMBER() OVER (PARTITION BY Id_cliente ORDER BY SUM(Cantidad) DESC) AS rnk
FROM ordenes
GROUP BY Id_cliente, Proveedor
) AS sub
WHERE rnk = 1;
