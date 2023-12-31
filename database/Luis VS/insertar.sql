USE evaluaciones;
-- ROLES
INSERT INTO roles(rol) VALUES ('Docente'),('Estudiante');

-- CALL spu_roles_listar();

-- ##########################################################################################################################
-- CURSOS
CALL spu_cursos_registrar('Electricidad Industrial');
CALL spu_cursos_registrar('Mecánica Automotriz');
CALL spu_cursos_registrar('Ing. de Software con IA');
CALL spu_cursos_registrar('Soldadura Avanzada');
CALL spu_cursos_registrar('Gestión de Empresas');

-- CALL spu_cursos_listar();

-- ##########################################################################################################################
-- USUARIOS - CLAVE: senati123
CALL spu_usuario_registrar(1, 'González', 'Juan', 'juan.gonzalez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK');
CALL spu_usuario_registrar(2, 'Martínez', 'Ana', 'ana.martinez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK');
CALL spu_usuario_registrar(2, 'Rodríguez', 'Pedro', 'pedro.rodriguez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK');
CALL spu_usuario_registrar(2, 'Sánchez', 'Laura', 'laura.sanchez@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK');
CALL spu_usuario_registrar(2, 'Díaz', 'Carlos', 'carlos.diaz@example.com', '$2y$10$052NLfLkVPtuY1L/L2vO..lO0yQMGegGYTAsydOePeE014wYUCPAK');

-- CALL spu_usuario_listar();

-- ##########################################################################################################################
-- EVALUACIONES
-- Electricidad Industrial
CALL spu_evaluaciones_registrar(1, 1, 'Prueba Diagnóstica', NULL, NULL);
CALL spu_evaluaciones_registrar(1, 2, 'Examen Teórico', NULL, NULL);
CALL spu_evaluaciones_registrar(1, 3, 'Proyecto Práctico', NULL, NULL);

-- Mecánica Automotriz
CALL spu_evaluaciones_registrar(2, 1, 'Prueba de Habilidades', NULL, NULL);
CALL spu_evaluaciones_registrar(2, 2, 'Evaluación de Desempeño', NULL, NULL);
CALL spu_evaluaciones_registrar(2, 3, 'Informe Técnico', NULL, NULL);

-- Ing. de Software con IA
CALL spu_evaluaciones_registrar(3, 1, 'Desarrollo de Proyecto', NULL, NULL);
CALL spu_evaluaciones_registrar(3, 2, 'Revisión de Código', NULL, NULL);
CALL spu_evaluaciones_registrar(3, 3, 'Presentación de IA', NULL, NULL);

-- Soldadura Avanzada
CALL spu_evaluaciones_registrar(4, 1, 'Soldadura de Precisión', NULL, NULL);
CALL spu_evaluaciones_registrar(4, 2, 'Prueba de Resistencia', NULL, NULL);
CALL spu_evaluaciones_registrar(4, 3, 'Proyecto de Soldadura', NULL, NULL);

-- Gestión de Empresas
CALL spu_evaluaciones_registrar(5, 1, 'Análisis Financiero', NULL, NULL);
CALL spu_evaluaciones_registrar(5, 2, 'Presentación Ejecutiva', NULL, NULL);
CALL spu_evaluaciones_registrar(5, 3, 'Estudio de Caso', NULL, NULL);


-- CALL spu_evaluaciones_listar();

-- ##########################################################################################################################
-- INSCRITO
CALL spu_inscritos_registrar(1, 1, '2023-11-12 10:00:00', '2023-11-15 18:00:00');
CALL spu_inscritos_registrar(2, 1, '2023-11-13 11:30:00', '2023-11-16 20:30:00');
CALL spu_inscritos_registrar(3, 2, '2023-11-14 09:45:00', '2023-11-17 17:45:00');
CALL spu_inscritos_registrar(1, 3, '2023-11-15 13:15:00', '2023-11-18 22:15:00');
CALL spu_inscritos_registrar(2, 3, '2023-11-16 14:45:00', '2023-11-19 23:45:00');

-- CALL spu_inscritos_listar();

-- ##########################################################################################################################
-- PREGUNTAS
CALL spu_preguntas_registrar(1, '¿Cuál es el concepto clave en Electricidad Industrial?');
CALL spu_preguntas_registrar(1, '¿Cómo se llama el componente que almacena energía en un circuito eléctrico?');
CALL spu_preguntas_registrar(1, '¿Cuál es la unidad de medida de la corriente eléctrica?');
CALL spu_preguntas_registrar(2, '¿Cuáles son los componentes esenciales de un sistema de escape en un automóvil?');
CALL spu_preguntas_registrar(2, '¿Qué tipo de combustible utiliza un motor diésel?');
CALL spu_preguntas_registrar(2, '¿Cuál es la función principal del sistema de frenos en un automóvil?');
CALL spu_preguntas_registrar(3, '¿Cuáles son los principios de la programación orientada a objetos?');
CALL spu_preguntas_registrar(3, '¿Qué significa JVM en el contexto de Java?');
CALL spu_preguntas_registrar(3, '¿Cómo se declara una variable en Java?');

-- CALL spu_preguntas_listar();

-- ##########################################################################################################################
-- ALTERNATIVAS
CALL spu_alternativas_registrar(1, 'Corriente', 'N');
CALL spu_alternativas_registrar(1, 'Resistencia', 'N');
CALL spu_alternativas_registrar(1, 'Voltaje', 'S');
CALL spu_alternativas_registrar(2, 'Condensador', 'N');
CALL spu_alternativas_registrar(2, 'Resistor', 'S');
CALL spu_alternativas_registrar(2, 'Inductor', 'N');
CALL spu_alternativas_registrar(3, 'Amperio', 'S');
CALL spu_alternativas_registrar(3, 'Ohmio', 'N');
CALL spu_alternativas_registrar(3, 'Voltio', 'N');
CALL spu_alternativas_registrar(4, 'Gasolina', 'N');
CALL spu_alternativas_registrar(4, 'Diesel', 'S');
CALL spu_alternativas_registrar(4, 'Etanol', 'N');
CALL spu_alternativas_registrar(5, 'Propulsor', 'N');
CALL spu_alternativas_registrar(5, 'Frenos', 'N');
CALL spu_alternativas_registrar(5, 'Escape', 'S');
CALL spu_alternativas_registrar(6, 'Herencia', 'S');
CALL spu_alternativas_registrar(6, 'Polimorfismo', 'N');
CALL spu_alternativas_registrar(6, 'Encapsulamiento', 'N');
CALL spu_alternativas_registrar(7, 'Java Virtual Machine', 'S');
CALL spu_alternativas_registrar(7, 'Java Virtual Memory', 'N');
CALL spu_alternativas_registrar(7, 'Java Variable Method', 'N');
CALL spu_alternativas_registrar(8, 'int x = 10;', 'S');
CALL spu_alternativas_registrar(8, 'String name = "John";', 'N');
CALL spu_alternativas_registrar(8, 'boolean flag = true;', 'N');
CALL spu_alternativas_registrar(9, 'True', 'N');
CALL spu_alternativas_registrar(9, 'False', 'S');
CALL spu_alternativas_registrar(9, 'Null', 'N');

-- CALL spu_alternativas_listar();

