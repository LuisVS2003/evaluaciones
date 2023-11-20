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

-- EVALUACIONES
CALL spu_evaluaciones_registrar(1, 2,'Fundamentos Eléctricos Industriales',  NULL, NULL);
CALL spu_evaluaciones_registrar(2, 3,'Mantenimiento Automotriz',  NULL, NULL);
CALL spu_evaluaciones_registrar(3, 4,'Desarrollo de Software con Inteligencia Artificial',  NULL, NULL);
CALL spu_evaluaciones_registrar(4, 5,'Técnicas Avanzadas de Soldadura',  NULL, NULL);
CALL spu_evaluaciones_registrar(5, 5,'Gestión Avanzada de Proyectos',  NULL, NULL);

select * from usuarios;
-- INSCRITOS
CALL spu_inscritos_registrar(2, 1, '2023-11-12 10:00:00', '2023-11-15 18:00:00');
CALL spu_inscritos_registrar(3, 1, '2023-11-13 11:30:00', '2023-11-16 20:30:00');
CALL spu_inscritos_registrar(4, 2, '2023-11-14 09:45:00', '2023-11-17 17:45:00');
CALL spu_inscritos_registrar(5, 3, '2023-11-15 13:15:00', '2023-11-18 22:15:00');

-- PREGUNTAS Electricidad Industrial
CALL spu_preguntas_registrar(1, '¿Cuáles son los principios fundamentales de la electricidad industrial?');
CALL spu_preguntas_registrar(1, '¿Cómo se generan y distribuyen energía en entornos industriales?');
CALL spu_preguntas_registrar(1, 'Explique la ley de Ohm y su aplicación en sistemas eléctricos industriales.');
CALL spu_preguntas_registrar(1, '¿Cuáles son los principales componentes de un panel eléctrico industrial?');
CALL spu_preguntas_registrar(1, '¿Cómo se calcula la potencia en un sistema eléctrico industrial?');

-- PREGUNTAS Mecánica Automotriz
CALL spu_preguntas_registrar(2, '¿Cuáles son los componentes clave de un sistema de frenos automotrices?');
CALL spu_preguntas_registrar(2, 'Explique el ciclo de trabajo de un motor de combustión interna.');
CALL spu_preguntas_registrar(2, '¿Cuáles son los métodos de diagnóstico de fallas en sistemas de suspensión automotriz?');
CALL spu_preguntas_registrar(2, 'Describa el proceso de cambio de aceite y su importancia en el mantenimiento automotriz.');
CALL spu_preguntas_registrar(2, '¿Cómo se realiza la alineación de ruedas en vehículos?');

-- PREGUNTAS Ing. de Software con IA
CALL spu_preguntas_registrar(3, '¿Qué papel juega la inteligencia artificial en el desarrollo de software?');
CALL spu_preguntas_registrar(3, 'Explique el concepto de aprendizaje automático y su aplicación en la ingeniería de software.');
CALL spu_preguntas_registrar(3, '¿Cuáles son los desafíos éticos asociados con el uso de la inteligencia artificial en el desarrollo de software?');
CALL spu_preguntas_registrar(3, 'Describa el ciclo de vida típico de un proyecto de desarrollo de software.');
CALL spu_preguntas_registrar(3, '¿Cómo se implementan los algoritmos de inteligencia artificial en aplicaciones de software?');

-- PREGUNTAS Soldadura Avanzada
CALL spu_preguntas_registrar(4, '¿Cuáles son los diferentes tipos de soldadura utilizados en aplicaciones industriales avanzadas?');
CALL spu_preguntas_registrar(4, 'Explique los principios detrás de la soldadura por arco eléctrico.');
CALL spu_preguntas_registrar(4, '¿Cuáles son las precauciones de seguridad clave en el proceso de soldadura?');
CALL spu_preguntas_registrar(4, 'Describa las aplicaciones de la soldadura láser en la industria.');
CALL spu_preguntas_registrar(4, '¿Cómo se realiza la inspección de soldaduras para garantizar la calidad?');

-- PREGUNTAS Gestión de Proyectos
CALL spu_preguntas_registrar(5, '¿Cuáles son las fases clave en el ciclo de vida de un proyecto?');
CALL spu_preguntas_registrar(5, 'Explique la importancia de la identificación y gestión de riesgos en la gestión de proyectos.');
CALL spu_preguntas_registrar(5, '¿Cómo se determina el camino crítico en un diagrama de Gantt?');
CALL spu_preguntas_registrar(5, 'Describa las características de un buen líder de proyecto.');
CALL spu_preguntas_registrar(5, '¿Cuál es la diferencia entre gestión de proyectos tradicional y ágil?');

-- ALTERNATIVAS Electricidad Industrial
CALL spu_alternativas_registrar(1, 'Ley de Newton', 'N');
CALL spu_alternativas_registrar(1, 'Ley de Ohm', 'S');
CALL spu_alternativas_registrar(1, 'Principio de Arquímedes', 'N');
CALL spu_alternativas_registrar(2, 'Generadores solares', 'N');
CALL spu_alternativas_registrar(2, 'Centrales nucleares', 'N');
CALL spu_alternativas_registrar(2, 'Centrales eléctricas', 'S');
CALL spu_alternativas_registrar(3, 'Relación entre masa y energía', 'N');
CALL spu_alternativas_registrar(3, 'Relación entre masa y energía', 'S');
CALL spu_alternativas_registrar(3, 'Principio de conservación de la carga', 'N');
CALL spu_alternativas_registrar(4, 'Tubos de vacío', 'N');
CALL spu_alternativas_registrar(4, 'Relés térmicos', 'N');
CALL spu_alternativas_registrar(4, 'Conectores USB', 'S');
CALL spu_alternativas_registrar(5, 'Potencia = Tensión × Resistencia', 'N');
CALL spu_alternativas_registrar(5, 'Potencia = Corriente × Voltaje', 'S');
CALL spu_alternativas_registrar(5, 'Potencia = Masa × Aceleración', 'N');

-- ALTERNATIVAS Mecánica Automotriz
CALL spu_alternativas_registrar(6, 'Frenos de disco y pastillas de freno', 'S');
CALL spu_alternativas_registrar(6, 'Cinturones de seguridad', 'N');
CALL spu_alternativas_registrar(6, 'Sistema de escape', 'N');
CALL spu_alternativas_registrar(7, 'Proceso de combustión en el motor', 'S');
CALL spu_alternativas_registrar(7, 'Ciclo lunar', 'N');
CALL spu_alternativas_registrar(7, 'Mecanismos de dirección', 'N');
CALL spu_alternativas_registrar(8, 'Análisis de vibraciones', 'S');
CALL spu_alternativas_registrar(8, 'Pruebas de velocidad máxima', 'N');
CALL spu_alternativas_registrar(8, 'Lectura de hoja de vida del vehículo', 'N');
CALL spu_alternativas_registrar(9, 'Drenaje de aceite usado y reemplazo de filtro', 'S');
CALL spu_alternativas_registrar(9, 'Cambio de neumáticos', 'N');
CALL spu_alternativas_registrar(9, 'Pintura exterior', 'N');
CALL spu_alternativas_registrar(10, 'Equipos de alineación láser', 'S');
CALL spu_alternativas_registrar(10, 'Martillo y destornillador', 'N');
CALL spu_alternativas_registrar(10, 'Herramientas de jardín', 'N');

-- ALTERNATIVAS Ing. de Software con IA
CALL spu_alternativas_registrar(11, 'Automatización de tareas de desarrollo', 'S');
CALL spu_alternativas_registrar(11, 'Gestión de recursos humanos', 'N');
CALL spu_alternativas_registrar(11, 'Diseño gráfico', 'N');
CALL spu_alternativas_registrar(12, 'Proceso de enseñanza-aprendizaje automático', 'S');
CALL spu_alternativas_registrar(12, 'Estudio de mercado', 'N');
CALL spu_alternativas_registrar(12, 'Reclutamiento de personal', 'N');
CALL spu_alternativas_registrar(13, 'Ética en el uso de datos de usuario', 'S');
CALL spu_alternativas_registrar(13, 'Publicidad agresiva', 'N');
CALL spu_alternativas_registrar(13, 'Desarrollo de productos de belleza', 'N');
CALL spu_alternativas_registrar(14, 'Fases de iniciación, planificación, ejecución, monitoreo y cierre', 'S');
CALL spu_alternativas_registrar(14, 'Ciclo de vida de una mariposa', 'N');
CALL spu_alternativas_registrar(14, 'Pasos para hacer un pastel', 'N');
CALL spu_alternativas_registrar(15, 'Experiencia en tecnologías específicas', 'S');
CALL spu_alternativas_registrar(15, 'Habilidades culinarias', 'N');
CALL spu_alternativas_registrar(15, 'Conocimiento de pintura abstracta', 'N');

-- ALTERNATIVAS Soldadura Avanzada
CALL spu_alternativas_registrar(16, 'Soldadura MIG y TIG', 'S');
CALL spu_alternativas_registrar(16, 'Soldadura por puntos', 'N');
CALL spu_alternativas_registrar(16, 'Soldadura de plástico', 'N');
CALL spu_alternativas_registrar(17, 'Principio de arco eléctrico', 'S');
CALL spu_alternativas_registrar(17, 'Principio de gravedad', 'N');
CALL spu_alternativas_registrar(17, 'Principio de levitación magnética', 'N');
CALL spu_alternativas_registrar(18, 'Uso de equipo de protección personal', 'S');
CALL spu_alternativas_registrar(18, 'Realizar la soldadura sin protección', 'N');
CALL spu_alternativas_registrar(18, 'Cargar materiales sin precauciones', 'N');
CALL spu_alternativas_registrar(19, 'Industria automotriz', 'S');
CALL spu_alternativas_registrar(19, 'Industria alimentaria', 'N');
CALL spu_alternativas_registrar(19, 'Industria textil', 'N');
CALL spu_alternativas_registrar(20, 'Inspección radiográfica', 'S');
CALL spu_alternativas_registrar(20, 'Inspección visual con ojos cerrados', 'N');
CALL spu_alternativas_registrar(20, 'Inspección por olfato', 'N');

-- ALTERNATIVAS Gestión de Proyectos
CALL spu_alternativas_registrar(21, 'Definición clara de objetivos', 'S');
CALL spu_alternativas_registrar(21, 'Inclusión de objetivos ambiguos', 'N');
CALL spu_alternativas_registrar(21, 'Exclusión de objetivos', 'N');
CALL spu_alternativas_registrar(22, 'Identificación y clasificación de riesgos', 'S');
CALL spu_alternativas_registrar(22, 'Ignorar la identificación de riesgos', 'N');
CALL spu_alternativas_registrar(22, 'Celebrar riesgos', 'N');
CALL spu_alternativas_registrar(23, 'Adaptabilidad y flexibilidad', 'S');
CALL spu_alternativas_registrar(23, 'Resistencia al cambio', 'N');
CALL spu_alternativas_registrar(23, 'Igualdad de enfoque', 'N');
CALL spu_alternativas_registrar(24, 'Pruebas A/B en desarrollo de software', 'S');
CALL spu_alternativas_registrar(24, 'Pruebas de resistencia física', 'N');
CALL spu_alternativas_registrar(24, 'Pruebas de velocidad de carrera', 'N');
CALL spu_alternativas_registrar(25, 'Evaluación continua del rendimiento', 'S');
CALL spu_alternativas_registrar(25, 'Ignorar el rendimiento del equipo', 'N');
CALL spu_alternativas_registrar(25, 'Recompensas aleatorias', 'N');


select * from evaluaciones;
DELETE FROM roles;
ALTER TABLE roles AUTO_INCREMENT 1;

DELETE FROM usuarios;
ALTER TABLE usuarios AUTO_INCREMENT 1;
DELETE FROM evaluaciones;
ALTER TABLE evaluaciones AUTO_INCREMENT 1;
DELETE FROM preguntas;
ALTER TABLE preguntas AUTO_INCREMENT 1;
DELETE FROM alternativas;
ALTER TABLE alternativas AUTO_INCREMENT 1;
DELETE FROM respuestas;
ALTER TABLE respuestas AUTO_INCREMENT 1;
DELETE FROM inscritos;
ALTER TABLE inscritos AUTO_INCREMENT 1;
DELETE FROM cursos;
ALTER TABLE  cursos AUTO_INCREMENT 1;

-- Volver a activar la restricción de clave externa
SET foreign_key_checks = 1;


