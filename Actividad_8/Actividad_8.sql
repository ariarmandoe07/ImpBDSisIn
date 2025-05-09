--- Aridni Mariana Yañez Sanchez 4J

--- EJERCICIO 1

CREATE TABLE precios (
    Id_producto INT,
    Fecha DATE,
    Precio VARCHAR (20)
);


INSERT INTO precios (Id_producto, Fecha, Precio) VALUES
(1001, '2025-01-01', '19.99'),
(1001, '2025-04-15', '59.99'),
(1001, '2025-08-06', '79.99'),
(2002, '2025-04-17', '39.99'),
(2002, '2025-05-19', '59.99');


SELECT Id_producto, MAX(precio) AS Precio 
FROM precios
WHERE Id_producto IN (1001, 2002)
GROUP BY Id_producto;

--- EJERCICIO 2

CREATE TABLE ventas (
Id_orden INT,
Id_cliente INT,
Fecha DATE,
Total DECIMAL(10, 2),
Estado VARCHAR(10)
);

INSERT INTO ventas (Id_orden, Id_cliente, Fecha, Total, Estado) VALUES
(1, 1001, '2025-01-01', 100, 'JAL'),
(2, 1001, '2025-01-01', 150, 'JAL'),
(3, 1001, '2025-01-01', 75, 'JAL'),
(4, 1001, '2025-02-01', 100, 'JAL'),
(5, 1001, '2025-03-01', 100, 'JAL'),
(6, 2002, '2025-02-01', 75, 'JAL'),
(7, 2002, '2025-02-01', 150, 'JAL'),
(8, 3003, '2025-01-01', 100, 'CDMX'),
(9, 3003, '2025-02-01', 100, 'CDMX'),
(10, 3003, '2025-03-01', 100, 'CDMX'),
(11, 4004, '2025-04-01', 100, 'CDMX'),
(12, 4004, '2025-05-01', 50, 'CDMX'),
(13, 4004, '2025-05-01', 100, 'CDMX');


SELECT Estado
FROM (
SELECT Estado, Id_cliente, DATE_FORMAT(Fecha, '%Y-%m') AS Mes, AVG(Total) AS PromedioMensual
FROM ventas
GROUP BY Estado, Id_cliente, Mes
) AS promedio_mensual
GROUP BY Estado, Id_cliente
HAVING MIN(PromedioMensual) > 100;

--- EJERCICIO 3

CREATE TABLE logs (
Proceso VARCHAR(20),
Mensaje VARCHAR(100),
Ocurrencia INT
);

INSERT INTO logs (Proceso, Mensaje, Ocurrencia) VALUES
('Web', 'Error: No se puede dividir por 0', 3),
('RestAPI', 'Error: Fallo la conversión', 5),
('App', 'Error: Fallo la conversión', 7),
('RestAPI', 'Error: Error sin identificar', 9),
('Web', 'Error: Error sin identificar', 1),
('App', 'Error: Error sin identificar', 10),
('Web', 'Estado Completado', 8),
('RestAPI', 'Estado Completado', 6);


SELECT Proceso, Mensaje, Ocurrencia
FROM logs l
WHERE (Mensaje, Ocurrencia) IN (
SELECT Mensaje, MAX(Ocurrencia)
FROM logs
GROUP BY Mensaje
);