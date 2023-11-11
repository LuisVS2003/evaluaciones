INSERT INTO roles (rol) VALUES
	('DOCENTE'),
    ('ESTUDIANTE');
    
    -- Aquí se asume que los IDs de usuario e inscrito son aleatorios
-- Se insertarán 10 conjuntos de datos de prueba con nombres de evaluación diferentes y fechas de inicio/fin diferentes

-- Llamadas al procedimiento para insertar 10 datos de prueba
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 1', '2023-11-09', '2023-11-10');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 2', '2023-11-10', '2023-11-11');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 3', '2023-11-11', '2023-11-12');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 4', '2023-11-12', '2023-11-13');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 5', '2023-11-13', '2023-11-14');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 6', '2023-11-14', '2023-11-15');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 7', '2023-11-15', '2023-11-16');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 8', '2023-11-16', '2023-11-17');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 9', '2023-11-17', '2023-11-18');
CALL spu_evaluaciones_registrar(2, 1, 'Evaluación 10', '2023-11-18', '2023-11-19');

-- Llamadas al procedimiento para insertar datos de preguntas
CALL spu_preguntas_registrar(3, '¿Cuál es la capital de Francia?');
CALL spu_preguntas_registrar(3, '¿Qué año comenzó la Primera Guerra Mundial?');
CALL spu_preguntas_registrar(3, '¿Quién pintó la Mona Lisa?');
CALL spu_preguntas_registrar(3, '¿En qué año se descubrió América?');
CALL spu_preguntas_registrar(3, '¿Cuál es el río más largo del mundo?');
CALL spu_preguntas_registrar(3, '¿Qué científico formuló la teoría de la relatividad?');
CALL spu_preguntas_registrar(3, '¿Quién escribió "El Quijote"?');
CALL spu_preguntas_registrar(3, '¿Cuál es el metal más abundante en la corteza terrestre?');
CALL spu_preguntas_registrar(3, '¿Cuál es la montaña más alta del mundo?');
CALL spu_preguntas_registrar(3, '¿Quién fue el primer presidente de los Estados Unidos?');


-- Llamadas al procedimiento para insertar datos de alternativas
-- Se asume que se tiene un id de pregunta generado anteriormente
-- Se agregan las alternativas con su respectiva validación ('V' para verdadera, 'F' para falsa)

CALL spu_alternativas_registrar(2, 'París', 'V');
CALL spu_alternativas_registrar(3, 'Londres', 'F');
CALL spu_alternativas_registrar(4, 'Madrid', 'F');
CALL spu_alternativas_registrar(5, 'Berlín', 'F');

CALL spu_alternativas_registrar(5, '1914', 'V');
CALL spu_alternativas_registrar(6, '1918', 'F');
CALL spu_alternativas_registrar(7, '1939', 'F');
CALL spu_alternativas_registrar(8, '1945', 'F');

CALL spu_alternativas_registrar(9, 'Leonardo da Vinci', 'V');
CALL spu_alternativas_registrar(10, 'Pablo Picasso', 'F');
CALL spu_alternativas_registrar(1, 'Vincent van Gogh', 'F');
CALL spu_alternativas_registrar(1, 'Claude Monet', 'F');


SELECT * FROM usuarios;
SELECT * FROM inscritos;
SELECT * FROM preguntas;
SELECT * FROM alternativas;
-- Continuarías con el patrón para el resto de preguntas
DELETE FROM usuarios;
ALTER TABLE usuarios AUTO_INCREMENT 1;
