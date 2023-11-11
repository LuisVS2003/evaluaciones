-- USUARIO LUIS VS
-- PREGUNTAS
CALL spu_preguntas_registrar(15, '¿Cuál es la capital de Francia?');
CALL spu_preguntas_registrar(15, '¿Quién escribió el libro "1984"?');
CALL spu_preguntas_registrar(15, '¿En qué año se descubrió América?');
CALL spu_preguntas_registrar(15, '¿Cuál es el símbolo químico del oro?');
CALL spu_preguntas_registrar(15, '¿Cuál es el océano más grande del mundo?');

CALL spu_preguntas_registrar(16, '¿Cuál es el autor de la pintura "La última cena"?');
CALL spu_preguntas_registrar(16, '¿En qué año se fundó la ciudad de Roma?');
CALL spu_preguntas_registrar(16, '¿Cuál es el río más largo del mundo?');
CALL spu_preguntas_registrar(16, '¿Quién escribió el libro "Don Quijote de la Mancha"?');
CALL spu_preguntas_registrar(16, '¿Cuál es el país más poblado del mundo?');

CALL spu_preguntas_registrar(17, '¿En qué año se firmó la Declaración de Independencia de Estados Unidos?');
CALL spu_preguntas_registrar(17, '¿Cuál es el lago más profundo del mundo?');
CALL spu_preguntas_registrar(17, '¿Quién pintó la obra "La Noche Estrellada"?');
CALL spu_preguntas_registrar(17, '¿Cuál es el planeta más grande del sistema solar?');
CALL spu_preguntas_registrar(17, '¿Cuál es el autor de la canción "Imagine"?');


-- ALTERNATIVAS
CALL spu_alternativas_registrar(13, 'París', '1');
CALL spu_alternativas_registrar(13, 'Londres', '0');
CALL spu_alternativas_registrar(13, 'Madrid', '0');

CALL spu_alternativas_registrar(14, 'George Orwell', '1');
CALL spu_alternativas_registrar(14, 'J.K. Rowling', '0');
CALL spu_alternativas_registrar(14, 'Stephen King', '0');

CALL spu_alternativas_registrar(15, '1492', '1');
CALL spu_alternativas_registrar(15, '1776', '0');
CALL spu_alternativas_registrar(15, '1812', '0');

CALL spu_alternativas_registrar(16, 'Au', '1');
CALL spu_alternativas_registrar(16, 'Ag', '0');
CALL spu_alternativas_registrar(16, 'Fe', '0');

CALL spu_alternativas_registrar(17, 'Océano Pacífico', '1');
CALL spu_alternativas_registrar(17, 'Océano Atlántico', '0');
CALL spu_alternativas_registrar(17, 'Océano Índico', '0');