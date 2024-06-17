// Introducción
//// Motiva y resume el tema
////// Contexto
//////// En el caso de una Práctica Extendida, describe la organización, equipo, rol del supervisor, formas de trabajar dentro de la organización, etc.
////// Problema y Relevancia
////// Objetivos
////// Opcional: Descripción general de la solución
////// Opcional: Resumen de los resultados
////// Opcional: Estructura de la memoria

== Contexto

En el vertiginoso panorama actual, caracterizado por la revolución digital y la saturación de datos e información, la seguridad de la información emerge como un baluarte fundamental para asegurar la continuidad y la confianza en las operaciones empresariales. En este contexto, la constante evolución de las amenazas cibernéticas y la creciente interconexión de sistemas han convertido la salvaguarda de la confidencialidad, integridad y disponibilidad de la información en una prioridad crítica, desafiando a las organizaciones a mantenerse a la vanguardia de la seguridad informática.

Las organizaciones, en este desafío constante, se ven compelidas a garantizar que sus sistemas no solo cumplan con los estándares de seguridad, sino que también sigan las mejores prácticas establecidas. Es en este contexto que el Sistema de Gestión de Seguridad de la Información (SGSI), especialmente dentro del marco de la norma ISO 27001, emerge como una guía esencial para diseñar, implementar y mantener sistemas de seguridad robustos. La certificación ISO 27001, por ende, no solo proporciona un marco sólido para la gestión de la seguridad de la información, sino que también otorga a las empresas un distintivo reconocido internacionalmente, validando su compromiso inquebrantable con la seguridad.

En el epicentro de este escenario complejo se halla la empresa Magnet, una entidad con una sólida trayectoria de más de una década en la provisión de soluciones tecnológicas a medida. Para Magnet, la necesidad imperante de asegurar la integridad y confidencialidad de su información y la de sus clientes, especialmente en el contexto de la certificación ISO 27001, adquiere una importancia estratégica.

=== Magnet

Magnet es una empresa con una fuerte presencia en el mercado de software y tecnología, ofreciendo una amplia gama de servicios y productos. Entre los principales se encuentran:

- *Desarrollo a medida*: Magnet desarrolla código para brindar valor, simplificar procesos y establecer la trazabilidad de los proyectos.
- *Proyectos del Estado*: Trabaja con instituciones del gobierno, con un Acuerdo Marco vigente, y una sólida experiencia en la colaboración con el Estado de Chile.
- *Aumento de equipo en EE. UU.*: Proporciona desarrolladores y diseñadores para fortalecer los equipos de sus clientes.
- *Transformación Digital*: Implementa, mantiene y mejora continuamente los servicios relacionados con la transformación digital.
- *Integraciones*: Facilita la integración de Django con diversas aplicaciones y servicios en la nube para aumentar la eficiencia y productividad.
- *Proceso UX*: Entrega soluciones innovadoras alineadas con los objetivos empresariales mediante un diseño centrado en el usuario.
- *E-commerce*: Provee plataformas personalizadas para aplicaciones móviles de comercio electrónico.
- *Infraestructura*: Ofrece servicios en la nube seguros, escalables y flexibles para optimizar el crecimiento empresarial.

Magnet cuenta con un equipo compuesto por entre 30 y 40 empleados. El área de operaciones está estructurada en diversos roles y departamentos que incluyen Jefes de Proyectos (PM), Technical Leads (TL), desarrolladores frontend y backend, analistas TI, y diseñadores UX.

=== Equipo de Proyecto

Para este trabajo de título, el equipo involucrado se compone principalmente de tres personas:

- *Gerente de Operaciones*: Mauricio Casto, quien toma un rol de apoyo técnico y supervisión, actuando como un Senior Advisor.
- *Gerente General*: Ignacio Munizaga, desempeñando el rol de Product Owner, proporcionando orientación y visión para el proyecto.
- *Jefe de Proyecto y Desarrollador*: El autor de este trabajo, responsable de la planificación, ejecución y desarrollo del proyecto.

=== Rol del Supervisor

El supervisor del autor, Mauricio Casto, es uno de los socios de Magnet y el Gerente de Operaciones. Su rol principal es estandarizar los procesos, herramientas y prácticas del área de Operaciones y coordinar los recursos entre proyectos. En el contexto de este trabajo de título, su responsabilidad principal ha sido asegurar que lo que se está desarrollando sea de utilidad para la empresa, proporcionando apoyo y supervisión técnica.

La interacción con el supervisor ha sido positiva, especialmente al principio del proyecto, donde se recibió un considerable apoyo en la planificación de la idea principal. Posteriormente, el Gerente General también ha proporcionado apoyo significativo en el refinamiento de la plataforma.

=== Formas de Trabajar en Magnet

Magnet utiliza una metodología ágil basada en Scrum, adaptada a las siguientes consideraciones:

- El producto se desarrolla fuera de la organización que será dueña del producto, usualmente con un Product Owner externo.
- Los incentivos de la organización pueden ser, en algunos casos, opuestos a los de Magnet.
- Existen contratos y compromisos de buen servicio que norman el proyecto más allá del óptimo para el desarrollo del producto.

La gestión de proyectos y la comunicación dentro del equipo se realiza principalmente a través de Slack para la comunicación asíncrona, y mediante reuniones semanales (weeklys) y reuniones de avances. Los weeklys se enfocan en el desarrollo y en resolver trabas, mientras que las reuniones de avances se centran en mostrar avances concretos de la aplicación.

Las herramientas utilizadas incluyen Jira para la gestión de proyectos, Google Workspace para videoconferencias y almacenamiento, y Slack para la comunicación. Magnet fomenta un ambiente de trabajo colaborativo y una cultura abierta, promoviendo la participación de todos en la toma de decisiones y manteniendo un flujo constante de feedback para mejorar continuamente.

== Problema y Relevancia

La creciente sofisticación de las amenazas cibernéticas y la diversificación de los vectores de ataque subrayan la relevancia y la urgencia de contar con un sistema de gestión de seguridad de la información robusto para proteger los activos digitales y salvaguardar la reputación de la empresa en el escenario empresarial actual.

No obstante, en medio de esta búsqueda de seguridad, las organizaciones enfrentan limitaciones al depender de soluciones externas para manejar la implementación y el almacenamiento de evidencia, piezas cruciales al momento de ser auditados para obtener certificaciones o demostrar el cumplimiento de leyes. Es en este punto crítico que surge la motivación para el desarrollo de una solución interna y personalizada, impulsada por las tendencias actuales hacia la autonomía y la adaptabilidad en el dinámico panorama de la seguridad de la información.

Las empresas, ahora más que nunca, buscan soluciones que no solo cumplan con los requisitos regulatorios, como la ISO 27001, sino que también ofrezcan flexibilidad y capacidad de adaptación a las cambiantes condiciones del entorno digital. La ausencia de un sistema interno eficiente para la gestión de SGSI puede resultar en desafíos operativos, costos adicionales y riesgos incrementados de no conformidad con las normas establecidas, lo que podría tener consecuencias significativas en términos de sanciones y pérdida de confianza de los clientes.

== Objetivos

En respuesta a este desafío, el proyecto propuesto tiene como objetivo la creación de una "Plataforma para Auditoría de Cumplimiento del Sistema de Gestión de Seguridad de la Información", abordando de manera específica los desafíos que enfrenta Magnet y otras organizaciones en este ámbito crucial. Esta plataforma no solo aspira a cumplir con los requisitos de auditoría; se concibe como un habilitador estratégico que otorga a Magnet autonomía en la gestión de su certificación ISO 27001.

Los objetivos específicos del proyecto incluyen:

- *Desarrollar una plataforma que permita la gestión eficiente de documentos, activos, riesgos y procesos asociados a los controles de ISO 27001*: Esto incluye la implementación de módulos especializados para cada uno de estos aspectos, asegurando una integración fluida y una fácil usabilidad.
- *Garantizar la escalabilidad y la adaptabilidad de la solución*: Utilizando tecnologías robustas como Django, PostgreSQL y TypeScript, se busca crear una base sólida que permita la evolución de la plataforma a medida que cambian las necesidades y los desafíos de seguridad.
- *Facilitar la certificación ISO 27001 para Magnet y otras organizaciones*: Proporcionando una herramienta que simplifica la gestión de la seguridad de la información y el cumplimiento normativo, se busca reducir los costos y el tiempo asociados con estos procesos.
- *Contribuir al fortalecimiento de la postura de seguridad informática de Magnet*: Al desarrollar una solución interna que se adapta específicamente a las necesidades de la empresa, se busca mejorar la protección de los activos digitales y la resiliencia ante amenazas cibernéticas.

En última instancia, este trabajo de título no se limita a resolver un problema específico de auditoría de cumplimiento del SGSI para Magnet; va más allá al buscar contribuir al panorama más amplio de la seguridad de la información. La plataforma propuesta no solo será una herramienta para alcanzar la certificación; será un activo estratégico que impulsa la seguridad, la adaptabilidad y la autonomía en un entorno empresarial digital en constante evolución. A medida que el proyecto avance, se espera que sus resultados no solo beneficien a Magnet, sino que también sirvan como un referente valioso para otras organizaciones que buscan fortalecer su postura en seguridad informática en un mundo cada vez más interconectado.

== Descripción general de la solución

La solución desarrollada para la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) de Magnet se centra en la implementación de una plataforma integral que sigue los estándares de la norma ISO 27001. Esta plataforma está compuesta por varios módulos, cada uno encargado de un aspecto crucial del SGSI: documentos, activos, riesgos y procesos.

=== Tecnologías Utilizadas

Para abordar los desafíos de escalabilidad, rendimiento y seguridad, la plataforma se ha desarrollado utilizando tecnologías robustas y bien probadas, como Django, PostgreSQL, Docker y TypeScript. Estas tecnologías garantizan una integración fluida y un alto rendimiento, permitiendo que la solución se adapte a las necesidades cambiantes de la organización.

=== Módulos del Sistema

1. *Módulo de Documentos*: Facilita la gestión de la documentación necesaria para el SGSI, incluyendo la creación, actualización y versionado de documentos. También permite la aprobación de documentos y la generación de evidencia de su revisión y lectura.

2. *Módulo de Activos*: Permite llevar un inventario detallado de todos los activos de la empresa, clasificándolos por tipo y criticidad. Este módulo asegura que cada activo esté adecuadamente registrado y gestionado dentro del SGSI.

3. *Módulo de Riesgos*: Ayuda en la identificación, evaluación y gestión de los riesgos asociados a los activos. Los riesgos se pueden clasificar y tratar según su severidad y probabilidad, asegurando un enfoque proactivo en la mitigación de amenazas.

4. *Módulo de Procesos*: Define y gestiona los procesos necesarios para la implementación y mantenimiento del SGSI. Este módulo permite la asignación de actividades a los usuarios, garantizando que se sigan los procedimientos establecidos y se genere la evidencia necesaria para las auditorías.

=== Infraestructura y Despliegue

La plataforma se despliega en un entorno containerizado utilizando Docker, lo que facilita su replicación y escalabilidad. Los servicios se ejecutan en contenedores separados, gestionados por Docker Compose, y se pueden desplegar en servicios en la nube como DigitalOcean. La arquitectura incluye componentes como Nginx, Gunicorn y Redis, que aseguran un rendimiento óptimo y una gestión eficiente de las tareas en segundo plano.

=== Beneficios

La implementación de esta solución no solo asegura el cumplimiento de los requisitos de la ISO 27001, sino que también proporciona a Magnet una herramienta estratégica para la gestión continua de la seguridad de la información. La plataforma es escalable y adaptable, lo que permite su uso y personalización para otras organizaciones con necesidades similares, contribuyendo así al fortalecimiento de la seguridad informática en un entorno empresarial cada vez más digitalizado.

Esta solución integral, basada en prácticas y tecnologías modernas, posiciona a Magnet a la vanguardia de la gestión de la seguridad de la información, asegurando la confidencialidad, integridad y disponibilidad de sus activos digitales.
