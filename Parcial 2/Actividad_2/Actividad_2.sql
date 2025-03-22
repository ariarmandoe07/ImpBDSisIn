-- Aridni Mariana Yañez Sanchez 4J  T/V  Compu Aula 3


--Ejercicio 1

CREATE TABLE articulosuno (
    Artículo varchar(30)
);

CREATE TABLE articulosdos (
    Articulo varchar(30)
);

INSERT INTO articulosuno ( Artículo ) VALUES
	('Azucar'),
    ('Pan'),
    ('jugo'),
    ('Refresco'),
    ('Harina');

INSERT INTO articulosdos ( Articulo ) VALUES
	('Azucar'),
    ('Pan'),
    ('Mantequilla'),
    ('Queso'),
    ('Manzana');

SELECT * from articulosuno left outer join articulosdos on articulosuno.Artículo = articulosdos.Articulo
union 
SELECT * from articulosuno right outer join articulosdos on articulosdos.Articulo = articulosuno.Artículo;

--Ejercicio 2

CREATE TABLE ejercicio2 (
id_empleado INT,
id_gerente INT,
puesto VARCHAR (30)
); 
  

INSERT INTO ejercicio2 (id_empleado,id_gerente,puesto) VALUES 
(1001, ' ' ,'Presidente'),
(2002, 1001 ,'Director'),
(3003, 1001 ,'Gerente'),
(4004, 2002 ,'Ingeniero'),
(5005, 2002 ,'Contador'),
(6006, 2002 ,'Administrador');


WITH RECURSIVE Jerarquia AS (
SELECT id_empleado, id_gerente ,puesto, 0 AS Nivel 
FROM ejercicio2
WHERE id_gerente IS NULL

UNION ALL

SELECT e.id_empleado, e.id_gerente, e.puesto, j.id_empleado +1
FROM ejercicio2 e
JOIN ejercicio2 j ON e.id_gerente = j.id_empleado 
) 

SELECT * FROM Jerarquia ORDER BY Nivel, id_empleado

--Ejercicio 3

CREATE TABLE ejercicio3 (
    id_cliente INT,
    id_orden INT,
    estado_destino VARCHAR (30),
    costo VARCHAR(10) 
);


INSERT INTO ejercicio3(id_cliente,id_orden,estado_destino,costo) VALUES 
(1001, 1, 'JAL', '$987'),
(1001, 2, 'CDMX', '$400'),
(1001, 3, 'CDMX', '$545'),
(1001, 4, 'CDMX', '$321'),
(2002, 5, 'MTY', '$324'),
(3003, 6, 'JAL', '$931'),
(4004, 7, 'JAL', '$876'),
(5005, 8, 'CDMX', '$567');


SELECT id_cliente,id_orden,estado_destino,costo
FROM ejercicio3
WHERE estado_destino = 'CDMX'
AND id_cliente IN (
    SELECT id_cliente FROM ejercicio3 WHERE estado_destino = 'JAL'
);