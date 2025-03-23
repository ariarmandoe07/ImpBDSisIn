--Ejercicio 1

CREATE TABLE EJERCICIO2 (
DESARROLLO VARCHAR(50) NOT NULL,
ETAPA INT,
FINALIZADO INT
);

INSERT INTO EJERCICIO2 (DESARROLLO,ETAPA,FINALIZADO) VALUES
('RestAPI', 1, '01/02/2024'),
('RestAPI', 2, '30/05/2024'),
('RestAPI', 3, '29/06/2024'),
('Web', 1, '28/10/2024'),
('Web', 2, '20/11/2024'),
('Web', 3, ''),
('App', 1, '30/01/2025'),
('App', 2, '');

SELECT DESARROLLO FROM EJERCICIO2 WHERE FINALIZADO= '';


--Ejercicio 2


CREATE TABLE customers (
    customer_id INT,
    type_phone TEXT,
    number TEXT
);

INSERT INTO customers ( customer_id, type_phone, number) VALUES
	(1001, 'Celular', 3338975421),
	(1001, 'Trabajo', 3338976542),
	(1001, 'Casa', 3336989874),
	(2002, 'Celular', 3339636544),
	(2002, 'Trabajo', 3338129856),
	(3003, 'Celular', 3339876541);

SELECT 
    customer_id,
    SUM(CASE WHEN type_phone = 'Celular' THEN number ELSE NULL END) AS Celular,
    SUM(CASE WHEN type_phone = 'Trabajo' THEN number ELSE NULL END) AS Trabajo,
    SUM(CASE WHEN type_phone = 'Casa' THEN number ELSE NULL END) AS Casa
FROM customers
GROUP BY customer_id;

--Ejercicio 3

CREATE TABLE candidato (
    id_candidatos INT,
    descripcion VARCHAR (30)
);

CREATE TABLE Descripciones (
    descripcion VARCHAR (30)
);


INSERT INTO  candidato ( id_candidatos, descripcion) VALUES
	(1001, 'Geólogo'),
	(1001, 'Astrónomo'),
	(1001, 'Bioquímico'),
	(1001, 'Técnico'),
	(2002, 'Cirujano'),
	(2002, 'Mecánico'),
	(2002, 'Geólogo'),
	(3003, 'Geólogo'),
	(3003, 'Astrónomo'),
            (4004, 'Ingeniero');


INSERT INTO Descripciones (descripcion) VALUES
             ('Geólogo'),
	('Astrónomo'),
	('Bioquímico'),
	('Técnico');





SELECT id_candidatos
FROM candidato
WHERE descripcion IN ( SELECT * FROM Descripciones)
GROUP BY id_candidatos
HAVING COUNT(DISTINCT descripcion) = (SELECT COUNT(*) FROM Descripciones);