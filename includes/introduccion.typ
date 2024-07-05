// Introducción
//// Motiva y resume el tema
////// Contexto
//////// En el caso de una Práctica Extendida, describe la organización, equipo, rol del supervisor, formas de trabajar dentro de la organización, etc.
////// Problema y Relevancia
////// Objetivos
////// Opcional: Descripción general de la solución
////// Opcional: Resumen de los resultados
////// Opcional: Estructura de la memoria

En el mundo actual, donde la información se ha convertido en uno de los activos más valiosos para las organizaciones, la seguridad de la información es crucial para la continuidad y la confianza en las operaciones empresariales. La presente introducción abordará el contexto general del proyecto, el problema y su relevancia, los objetivos planteados, y finalmente, una descripción general de la solución implementada.

== Contexto

En el vertiginoso panorama actual, caracterizado por la revolución digital y la saturación de datos e información, la seguridad de la información emerge como un baluarte fundamental para asegurar la continuidad y la confianza en las operaciones empresariales. En este contexto, la constante evolución de las amenazas cibernéticas y la creciente interconexión de sistemas han convertido la salvaguarda de la confidencialidad, integridad y disponibilidad de la información en una prioridad crítica, desafiando a las organizaciones a mantenerse a la vanguardia de la seguridad informática.

Las organizaciones, en este desafío constante, se ven compelidas a garantizar que sus sistemas no solo cumplan con los estándares de seguridad, sino que también sigan las mejores prácticas establecidas. Es en este contexto que el Sistema de Gestión de Seguridad de la Información (SGSI), especialmente dentro del marco del estándar ISO 27001, emerge como una guía esencial para diseñar, implementar y mantener sistemas de seguridad robustos. La certificación ISO 27001, por ende, no solo proporciona un marco sólido para la gestión de la seguridad de la información, sino que también otorga a las empresas un distintivo reconocido internacionalmente, validando su compromiso inquebrantable con la seguridad.

En el epicentro de este escenario complejo se halla la empresa Magnet, una entidad con una sólida trayectoria de más de una década en la provisión de soluciones tecnológicas a medida. Para Magnet, la necesidad imperante de asegurar la integridad y confidencialidad de su información y la de sus clientes, especialmente en el contexto de la certificación ISO 27001, adquiere una importancia estratégica.

=== Magnet

Magnet es una empresa con una fuerte presencia en el mercado de software y tecnología, ofreciendo una amplia gama de servicios y productos. Entre los principales se encuentran:

- _Desarrollo a medida_: Magnet desarrolla código para brindar valor, simplificar procesos y establecer la trazabilidad de los proyectos.
- _Proyectos del Estado_: Trabaja con instituciones del gobierno, con un Acuerdo Marco vigente, y una sólida experiencia en la colaboración con el Estado de Chile.
- _Aumento de equipo en EE. UU._: Proporciona desarrolladores y diseñadores para fortalecer los equipos de sus clientes.
- _Transformación Digital_: Implementa, mantiene y mejora continuamente los servicios relacionados con la transformación digital.
- _Integraciones_: Facilita la integración de Django con diversas aplicaciones y servicios en la nube para aumentar la eficiencia y productividad.
- _Proceso UX_: Entrega soluciones innovadoras alineadas con los objetivos empresariales mediante un diseño centrado en el usuario.
- _E-commerce_: Provee plataformas personalizadas para aplicaciones móviles de comercio electrónico.
- _Infraestructura_: Ofrece servicios en la nube seguros, escalables y flexibles para optimizar el crecimiento empresarial.

Magnet cuenta con un equipo compuesto por entre 30 y 40 empleados. El área de operaciones está estructurada en diversos roles y departamentos que incluyen Jefes de Proyectos (PM), Technical Leads (TL), desarrolladores frontend y backend, analistas TI, y diseñadores UX.

=== Equipo de Proyecto

Para este trabajo de título, el equipo involucrado se compone principalmente de tres personas:

- _Gerente de Operaciones_: Mauricio Casto, quien toma un rol de apoyo técnico y supervisión, actuando como un Senior Advisor.
- _Gerente General_: Ignacio Munizaga, desempeñando el rol de Product Owner, proporcionando orientación y visión para el proyecto.
- _Jefe de Proyecto y Desarrollador_: El autor de este trabajo, responsable de la planificación, ejecución y desarrollo del proyecto.

=== Rol del Supervisor

El supervisor del autor, Mauricio Casto, es uno de los socios de Magnet y el Gerente de Operaciones. Su rol principal es estandarizar los procesos, herramientas y prácticas del área de Operaciones y coordinar los recursos entre proyectos. En el contexto de este trabajo de título, su responsabilidad principal ha sido asegurar que lo que se está desarrollando sea de utilidad para la empresa, proporcionando apoyo y supervisión técnica.

La interacción con el supervisor ha sido positiva, especialmente al principio del proyecto, donde se recibió un considerable apoyo en la planificación de la idea principal. Posteriormente, el Gerente General también ha proporcionado apoyo significativo en el refinamiento de la plataforma.

=== Formas de Trabajar en Magnet

Magnet utiliza una metodología ágil basada en Scrum, adaptada a las siguientes consideraciones:

- El producto se desarrolla fuera de la organización que será dueña del producto, usualmente con un Product Owner externo.
- Los incentivos de la organización pueden no estar siempre alineados con los de Magnet.
- Existen contratos y compromisos de buen servicio que norman el proyecto más allá del óptimo para el desarrollo del producto.

La gestión de proyectos y la comunicación dentro del equipo se realiza principalmente a través de Slack para la comunicación asíncrona, y mediante reuniones semanales (weeklys) y reuniones de avances. Los weeklys se enfocan en el desarrollo y en resolver trabas, mientras que las reuniones de avances se centran en mostrar avances concretos de la aplicación.

Las herramientas utilizadas incluyen Jira para la gestión de proyectos, Google Workspace para videoconferencias y almacenamiento, y Slack para la comunicación. Magnet fomenta un ambiente de trabajo colaborativo y una cultura abierta, promoviendo la participación de todos en la toma de decisiones y manteniendo un flujo constante de feedback para mejorar continuamente.

== Problema y Relevancia

La creciente sofisticación de las amenazas cibernéticas y la diversificación de los vectores de ataque subrayan la relevancia y la urgencia de contar con un sistema de gestión de seguridad de la información robusto para proteger los activos digitales y salvaguardar la reputación de la empresa u organización en el escenario empresarial y regulatorio actual.

No obstante, en medio de esta búsqueda de seguridad, las organizaciones enfrentan limitaciones al depender de soluciones externas para manejar la implementación y el almacenamiento de evidencia, piezas cruciales al momento de ser auditados para obtener certificaciones o demostrar el cumplimiento de leyes. Es en este punto crítico que surge la motivación para el desarrollo de una solución interna y personalizada, impulsada por las tendencias actuales hacia la autonomía y la adaptabilidad en el dinámico panorama de la seguridad de la información.

Las empresas, ahora más que nunca, buscan soluciones que no solo cumplan con estándares reconocidos, como la ISO 27001, sino que también ofrezcan flexibilidad y capacidad de adaptación a las cambiantes condiciones del entorno digital. La ausencia de un sistema interno eficiente para la gestión de SGSI puede resultar en desafíos operativos, costos adicionales y riesgos incrementados de no conformidad con las normas establecidas, lo que podría tener consecuencias significativas en términos de sanciones y pérdida de confianza de los clientes.

== Objetivos

En respuesta a este desafío, el proyecto propuesto tiene como objetivo la creación de una "Plataforma para Auditoría de Cumplimiento del Sistema de Gestión de Seguridad de la Información", abordando de manera específica los desafíos que enfrenta Magnet y otras organizaciones en este ámbito crucial. Esta plataforma no solo aspira a cumplir con los requisitos de auditoría; se concibe como un habilitador estratégico que otorga a Magnet autonomía en la gestión de su certificación ISO 27001.

Los objetivos específicos del proyecto incluyen:

- _Desarrollar una plataforma que permita la gestión eficiente de documentos, activos, riesgos y procesos asociados a los controles de ISO 27001_: Esto incluye la implementación de módulos especializados para cada uno de estos aspectos, asegurando una integración fluida y una fácil usabilidad.
- _Garantizar la escalabilidad y la adaptabilidad de la solución_: Utilizando tecnologías robustas como Django, PostgreSQL y TypeScript, se busca crear una base sólida que permita la evolución de la plataforma a medida que cambian las necesidades y los desafíos de seguridad.
- _Facilitar la certificación ISO 27001 para Magnet y otras organizaciones_: Proporcionando una herramienta que simplifica la gestión de la seguridad de la información y el cumplimiento normativo, se busca reducir los costos y el tiempo asociados con estos procesos.
- _Contribuir al fortalecimiento de la postura de seguridad informática de Magnet_: Al desarrollar una solución interna que se adapta específicamente a las necesidades de la empresa, se busca mejorar la protección de los activos digitales y la resiliencia ante amenazas cibernéticas.

En última instancia, este trabajo de título no se limita a resolver un problema específico de auditoría de cumplimiento del SGSI para Magnet; va más allá al buscar contribuir al panorama más amplio de la seguridad de la información. La plataforma propuesta no solo será una herramienta para alcanzar la certificación; será un activo estratégico que impulsa la seguridad, la adaptabilidad y la autonomía en un entorno empresarial digital en constante evolución. A medida que el proyecto avance, se espera que sus resultados no solo beneficien a Magnet, sino que también sirvan como un referente valioso para otras organizaciones que buscan fortalecer su postura en seguridad informática en un mundo cada vez más interconectado.

== Descripción general de la solución

El sistema desarrollado tiene como objetivo principal facilitar la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) de una empresa, siguiendo las buenas prácticas definidas en los controles que fija el estándar ISO 27001. La solución está estructurada en varios módulos, cada uno diseñado para cubrir aspectos específicos del SGSI: documentos, activos, riesgos y procesos. A continuación se presenta una descripción general de cada módulo y sus funcionalidades clave:

=== Módulo de Documentos
Este módulo centraliza la gestión de todos los documentos relevantes para el SGSI. Los documentos pueden ser políticas, procedimientos, registros y otros tipos de documentación necesarios para demostrar la conformidad con el estándar ISO 27001. Las funcionalidades incluyen:
- Creación, edición y eliminación de documentos.
- Versionado de documentos para mantener un registro histórico.
- Aprobación de versiones de documentos.
- Vinculación de documentos con controles específicos del SGSI.
- Gestión de la evidencia asociada a los documentos.

=== Módulo de Activos
Este módulo permite registrar y gestionar todos los activos de la empresa que son críticos para la seguridad de la información. Los activos pueden ser hardware, software, datos, personas, entre otros. Las funcionalidades incluyen:
- Creación, edición y eliminación de activos.
- Clasificación de activos por tipo.
- Asignación de roles a los activos para definir responsabilidades.
- Evaluación y actualización del estado de los activos.

=== Módulo de Riesgos
Este módulo está diseñado para identificar, evaluar y gestionar los riesgos asociados a los activos de la empresa. Cada riesgo está relacionado con un control específico del SGSI. Las funcionalidades incluyen:
- Identificación y registro de riesgos.
- Evaluación de la severidad y probabilidad de los riesgos.
- Asignación de responsables y tratamientos para cada riesgo.
- Monitoreo y actualización del estado de los riesgos.

=== Módulo de Procesos
Este módulo define y gestiona los procesos necesarios para cumplir con los controles del SGSI. Un proceso está compuesto por una serie de actividades que deben realizarse para generar evidencia de cumplimiento. Las funcionalidades incluyen:
- Definición de procesos y sus versiones.
- Asignación de actividades a grupos y usuarios.
- Gestión de la recurrencia y notificaciones de actividades.
- Monitoreo del cumplimiento de las actividades y generación de evidencia.

=== Tecnologías Utilizadas
La solución utiliza una combinación de tecnologías robustas y escalables, incluyendo:
- _Django_: Framework principal para el desarrollo del backend.
- _PostgreSQL_: La gestión de la base de datos.
- _Docker_: La contenedorización y despliegue de la aplicación.
- _TypeScript_: El desarrollo del frontend, mejorando la mantenibilidad del código.
- _Redis y Celery_: La gestión de tareas en segundo plano.
- _Nginx y Gunicorn_: El manejo eficiente de solicitudes web.

=== Arquitectura de Despliegue
El despliegue de la solución se realiza en contenedores Docker, lo que facilita su escalabilidad y mantenimiento. La infraestructura incluye:
- _Nginx_: El manejo de solicitudes HTTP/HTTPS.
- _Gunicorn_: Servir la aplicación Django.
- _Redis_: La caché y gestión de colas de tareas.
- _PostgreSQL_: El almacenamiento de datos.
- _Amazon S3_: El almacenamiento de archivos estáticos y de medios.

=== Escalabilidad y Rendimiento
La solución está diseñada para ser escalable, permitiendo la replicación de contenedores detrás de un balanceador de carga según sea necesario. La base de datos PostgreSQL y su capacidad de escalabilidad vertical y uso de réplicas para lectura aseguran un rendimiento eficiente incluso con aumentos en la carga de datos.

=== Seguridad y Cumplimiento
La seguridad es una prioridad en el diseño de la solución, con medidas como la verificación SHA-256 para archivos y la gestión de permisos detallada para usuarios y roles. La solución facilita el cumplimiento con el estándar ISO 27001, proporcionando las herramientas necesarias para la gestión de la seguridad de la información y la generación de evidencia para auditorías.

En resumen, la solución desarrollada proporciona una plataforma integral para la gestión del SGSI, alineada con el estándar ISO 27001, y ofrece a Magnet una herramienta estratégica para asegurar la conformidad y fortalecer su postura de seguridad informática.