--Aridni Mariana Yañez Sanchez 4J


CREATE TABLE Registro (
    Flujo VARCHAR(100),
    Paso INT,
    Estado VARCHAR(100)
);

INSERT INTO Registro (Flujo, Paso, Estado)
VALUES
('Alpha', 1, 'Error'),
('Alpha', 2, 'Finalizado'),
('Alpha', 3, 'Corriendo'),
('Bravo', 1, 'Finalizado'),
('Bravo', 2, 'Finalizado'),
('Charlie', 1, 'Corriendo'),
('Charlie', 2, 'Corriendo'),
('Delta', 1, 'Error'),
('Delta', 2, 'Error'),
('Echo', 1, 'Corriendo'),
('Echo', 2, 'Finalizado');


SELECT
    Flujo,
    CASE
        WHEN COUNT(DISTINCT Estado) = 1 THEN MAX(Estado)
        WHEN SUM(Estado = 'Error') > 0 THEN 'Indeterminado'
        WHEN SUM(Estado = 'Corriendo') > 0 AND SUM(Estado = 'Finalizado') > 0 THEN 'Corriendo'
        ELSE MAX(Estado)
    END AS Estado_general
FROM
    Registro
GROUP BY
    Flujo;



 CREATE TABLE Grupos (
    Secuencia INT,
    Sintaxis VARCHAR(80)
);

INSERT INTO Grupos (Secuencia, Sintaxis)
VALUES
(1, 'SELECT'),
(2, 'Producto,'),
(3, 'Precio,'),
(4, 'Disponibilidad,'),
(5, 'FROM'),
(6, 'Productos'),
(7, 'WHERE'),
(8, 'Precio'),
(9, '>100');

SELECT
    GROUP_CONCAT(Sintaxis ORDER BY Secuencia SEPARATOR ' ') AS Sintaxiss
FROM
    Grupos;

SELECT
    STRING_AGG(Sintaxis, ' ' ORDER BY Secuencia) AS Grupo_concatenada
FROM
    Sintaxis;   

    CREATE TABLE MarcadoresG (
    JugadorA INT,
    JugadorB INT,
    Marcador INT
);

INSERT INTO MarcadoresG (JugadorA, JugadorB, Marcador)
VALUES
(1001, 2002, 150),
(3003, 4004, 15),
(4004, 3003, 125);


SELECT
    LEAST(JugadorA, JugadorB) AS JugadorA,
    GREATEST(JugadorA, JugadorB) AS JugadorB,
    SUM(Marcador) AS Marcador
FROM
    MarcadoresG
GROUP BY
    LEAST(JugadorA, JugadorB),
    GREATEST(JugadorA, JugadorB);
