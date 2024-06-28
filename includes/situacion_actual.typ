// Estado del Arte
//// Conceptos involucrados
////// Tecnologías consideradas
////// Metodologías de desarrollo
////// Algoritmos existentes
////// Arquitecturas estándar
////// Soluciones existentes (y sus limitaciones)
//// Concentra la mayor parte de las citas
//// Alguien que conoce del tema podría saltearse este capítulo e igual comprender la memoria
//// Alguien que ha tomado todos los cursos obligatorios del DCC (como uds.) podría leer el capítulo y luego comprender la memoria
//
// Situación Actual
//// Describe en más detalle el contexto del trabajo que se va a desarrollar para entender la situación antes de empezar a desarrollar la solución
//// En comparación con el Estado del Arte, puede involucrar trabajo original para diagnosticar problemas, requisitos, etc., por ejemplo, usando encuestas con usuarios, ingeniería reversa para entender un sistema actual, etc.
//// También puede hablar de posibles tecnologías aplicables, compararlas, etc.
//// En casos donde, por ejemplo, no se necesitan técnicas de la literatura, etc., puede reemplazar el Estado del Arte.

#let mylenio_image_width = 55%
#let gapps_image_width = 65%

Hoy en día existen programas capaces de manejar la auditoría para SGSI, la mayoría de estos programas son soluciones de software como servicio (SaaS, por sus siglas en inglés), pero también existen algunas soluciones de código abierto. En esta sección hablaremos de principalmente 2 aplicaciones, MyLenio, una solución de software como servicio, y Gapps, una solución de código abierto.

== MyLenio
Entre las opciones SaaS, se encuentra MyLenio #footnote[https://www.mylenio.com/], una plataforma que se compone de 3 principales módulos, "organización del equipo", "recursos humanos" y "cumplimiento y seguridad".

=== Organización del equipo
El módulo de organización del equipo permite asignar a cada empleado a los equipos a los cuales pertenece. Los equipos son la unidad básica de organización de MyLenio, estos también permiten asignar roles a cada empleado, para obtener mayor granularidad. Al tener organizado a cada empleado dentro de un equipo, esto permite tener mayor visibilidad de como se componen estos mismos dentro de la empresa, incluso ofreciendo un organigrama de los roles de cada proyecto.

#figure(image("../imagenes/mylenio/team-organization.png", width: mylenio_image_width), caption: "Organización de equipos en MyLenio")

==== Manejo de permisos
Dentro de cada equipo se puede se pueden crear, editar y remover permisos a distintos SaaS. Estos permisos se pueden asignar tanto a nivel de equipo, rol o empleado, pudiendo así manejar todos los permisos de diferentes SaaS desde un único lugar. Cuando se agregan nuevos integrantes a estos equipos, también se le asignan todos los permisos a las aplicaciones SaaS configuradas, haciendo más fácil el proceso de incorporación de nuevos miembros a los equipos. Entre los SaaS se encuentran Bitbucket, DocuSign, GitHub, GitLab, Google Google Workspace, Jira, Keeper password, Office 365, Slack y Trello @mylenio-team-organization.

#figure(image("../imagenes/mylenio/permissions.png", width: mylenio_image_width), caption: "Manejo de permisos en MyLenio")

==== Documentos, capacitaciones y tareas
A cada uno de los miembros de un equipo se les puede asignar documentos, capacitaciones o tareas. Asignar documentos por este medio permite el cumplimiento del sistema de seguridad de la información y le facilita a los empleados firmar, de ser necesario. Asimismo, permite asignar capacitaciones y mostrar el progreso de estas, pudiendo notificar a los empleados que aún no la han completado. Análogamente, se le pueden asignar tareas a los empleados y notificarlos para que las terminen @mylenio-team-organization.

#figure(
    grid(
        columns: 2, row-gutter: 2mm, column-gutter: 1mm,
        image("../imagenes/mylenio/assignments.png"),
        image("../imagenes/mylenio/training.png")
    ),
    caption: "Documentos, capacitaciones y tareas en MyLenio"
)

=== Recursos humanos
El módulo de recursos humanos proporciona herramientas para realizar las actividades diarias de forma organizada, ayudando al área de recursos humanos, valga la redundancia.

==== Incorporación de empleados
La integración con Google Workspace y Office 365 permite incorporar a empleados con mayor facilidad al crearle cuentas, poder asignarlo a sus futuros equipos, pedirle la firma en documentos, asignarle capacitaciones o tareas a realizar @mylenio-human-resources.

#figure(image("../imagenes/mylenio/onboarding.png", width: mylenio_image_width), caption: "Incorporación de empleados en MyLenio")

==== Participación y eficiencia del equipo
MyLenio proporciona la habilidad de entregar reconocimientos a sus empleados mediante la plataforma, también permite manejar los anuncios, beneficios, vacaciones y otros tipos de solicitudes. Esto ayuda a ahorrar tiempo, al estar todo en una única aplicación @mylenio-human-resources.

#figure(image("../imagenes/mylenio/engament.png", width: mylenio_image_width), caption: "Participación y eficiencia del equipo en MyLenio")

==== Reclutamiento
Dentro del área de recursos humanos se entrega una herramienta para darle seguimiento a las posiciones abiertas, los candidatos y en qué parte del proceso se encuentra actualmente cada candidato @mylenio-human-resources.

#figure(image("../imagenes/mylenio/recruitment.png", width: mylenio_image_width), caption: "Reclutamiento en MyLenio")

==== Información de los empleados
La información de cada empleado es guardad en Google Workspace u Office 365, así facilitando su visualización, además se puede manejar la edición de esta información desde la aplicación. De ser necesario también se tiene una vista con toda la información del empleado, sus documentos, tareas, capacitaciones, etc @mylenio-human-resources.

#figure(image("../imagenes/mylenio/employees.png", width: mylenio_image_width), caption: "Información de los empleados en MyLenio")

=== Cumplimiento y seguridad
El módulo de cumplimiento y seguridad de MyLenio puede ser dividido en varios submódulos, cada uno con su propia funcionalidad y propósito.

==== Reporte de cumplimiento en tiempo real
Este submódulo proporciona una visión completa de la empresa con múltiples paneles que muestran todo lo que está sucediendo en la compañía. Permite saber exactamente quién ha firmado los documentos, cómo está progresando la formación y ver todas las tareas y flujos pendientes @mylenio-compliance-and-security.

#figure(image("../imagenes/mylenio/compliance.png", width: mylenio_image_width), caption: "Reporte de cumplimiento en tiempo real en MyLenio")

==== Manejo de Inventario
Este submódulo permite manejar el inventario de la empresa en un solo lugar. Se pueden crear elementos como computadores, monitores, etc., y asignar esos activos a los empleados. De esta manera, se puede hacer un seguimiento de quién está en posesión de los activos y saber exactamente dónde se encuentra todo en este momento @mylenio-compliance-and-security.

#figure(image("../imagenes/mylenio/inventory.png", width: mylenio_image_width), caption: "Manejo de Inventario en MyLenio")

==== Modelamiento de procesos
El módulo de Flujos permite modelar los procesos existentes en un sistema robusto donde se puede hacer un seguimiento del progreso, ver quién tiene algo pendiente y cómo avanzan los procesos en tiempo real. Al modelar los flujos, se puede poner el conocimiento sobre cómo se hacen las cosas en el departamento en un sistema, facilitando el crecimiento del equipo @mylenio-compliance-and-security.

#figure(image("../imagenes/mylenio/processes.png", width: mylenio_image_width), caption: "Modelamiento de procesos en MyLenio")

==== Eventos recurrentes y automatización de cumplimiento
MyLenio permite programar Flujos, Documentos, Tareas y Formaciones en un sistema que permite establecer cosas recurrentes que suceden en la empresa, como la firma de documentos cada año, asignar formación cada 6 meses a los empleados, etc. De esta manera, se pueden automatizar los procesos, ahorrar tiempo y dinero, y encaminarse hacia el cumplimiento de diversas certificaciones @mylenio-compliance-and-security.

#figure(image("../imagenes/mylenio/automate-compliance.png", width: mylenio_image_width), caption: "Eventos recurrentes y automatización de cumplimiento en MyLenio")

==== Manejo de riesgos
Este módulo permite hacer un seguimiento de todos los riesgos de la empresa, estableciendo los activos, amenazas y vulnerabilidades. También permite gestionar los proveedores y establecer el personal de BCDR (Business Continuity and Disaster Recovery) @mylenio-compliance-and-security.

#figure(image("../imagenes/mylenio/risk-management.png", width: mylenio_image_width), caption: "Manejo de riesgos en MyLenio")

== Gapps
Gapps #footnote[https://github.com/bmarsh9/gapps] es una plataforma de cumplimiento de seguridad que facilita el seguimiento de su progreso en relación con varios marcos de seguridad. Actualmente, el proyecto se encuentra en modo Alfa, lo que significa que, aunque funciona bien, puede haber algunos cambios importantes a medida que evoluciona. El principal contribuyente al proyecto, Brendan Marshall, desaconseja su uso en entornos de producción @gapps-github.

#figure(image("../imagenes/gapps/summary.png", width: gapps_image_width), caption: "Vista de resumen en Gapps")

Gapps ofrece soporte para más de 10 marcos de cumplimiento de seguridad, incluyendo SOC2, CMMC, ASVS, ISO27001, HIPAA, NIST CSF, NIST CSF, NIST 800-53, CSC CIS 18, PCI DSS. Además, cuenta con más de 1500 controles y más de 25 políticas, lo que permite recopilar evidencia para luego visualizarla en un panel de control @gapps-github.

#figure(image("../imagenes/gapps/controls.png", width: gapps_image_width), caption: "Controles en Gapps")

Una característica destacada de Gapps es su capacidad para agregar controles y políticas personalizados. También ofrece un editor de contenido WYSIWYG (What You See Is What You Get, lo que ves es lo que obtienes) y cuestionarios para proveedores. Además, Gapps ha introducido recientemente la capacidad de añadir evidencia directamente a la plataforma @gapps-github.

#figure(image("../imagenes/gapps/control.png", width: gapps_image_width), caption: "Control en Gapps")

Es importante destacar que, aunque Gapps es una herramienta poderosa para el seguimiento del cumplimiento de seguridad, su uso debe ser considerado cuidadosamente, especialmente en entornos de producción. Esto se debe a que el principal contribuyente al proyecto ha expresado su preocupación sobre su uso en tales entornos @gapps-github.

En resumen, Gapps es una plataforma de cumplimiento de seguridad que ofrece una amplia gama de herramientas para ayudar a las organizaciones a seguir su progreso en el cumplimiento de la seguridad. Sin embargo, su uso debe ser considerado cuidadosamente, especialmente en entornos de producción.

== Necesidad de un trabajo novedoso
La urgencia de desarrollar un software innovador se fundamenta en la carencia de una solución que se ajuste a las especificidades de Magnet. Actualmente, Magnet gestiona sus propios sistemas para abordar múltiples módulos de MyLenio, como la información de los empleados, anuncios y periodos de vacaciones, entre otros. La utilización simultánea de una plataforma externa como MyLenio podría generar confusión y redundancia en los procesos internos de la organización.

Además, la dependencia de un software externo implica la asunción de pagos mensuales sujetos a cambios imprevistos, sin la certeza de que el proveedor mantendrá la continuidad del servicio a largo plazo. La posibilidad de tener que migrar información entre distintos proveedores presenta un riesgo considerable, especialmente en el contexto de la necesidad de mantener certificaciones específicas.

Una consideración adicional radica en la viabilidad de comercializar esta aplicación a una amplia gama de clientes, tanto dentro de la misma industria como en otros sectores e incluso entre la competencia. La concepción de un software que no solo satisfaga las necesidades internas de Magnet, sino que también tenga potencial para ser implementado por otras organizaciones, amplía significativamente el alcance y la relevancia del proyecto.

Es imperativo abordar estas problemáticas de manera estratégica, asegurando que el desarrollo del software no solo satisfaga las necesidades actuales de Magnet, sino que también tenga una proyección a largo plazo. La consideración de la escalabilidad y la capacidad de adaptación a diferentes contextos se torna esencial para garantizar la eficacia y la sostenibilidad del software propuesto.

En resumen, el impulso de crear un trabajo novedoso no solo se basa en subsanar las deficiencias actuales, sino también en explorar oportunidades de expansión y comercialización, consolidando así un proyecto que no solo beneficie internamente a Magnet, sino que también tenga un impacto positivo en el panorama empresarial más amplio.