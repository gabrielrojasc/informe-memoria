= Situación Actual
// Discutir las soluciones o recursos existentes relacionados con el problema. Justificar por qué es necesario un trabajo novedoso.
// [1-2 páginas]

Hoy en día existen programas capaces de manejar la auditoria para SGSI, la mayoría de estos programas son soluciones de software como servicio (SaaS, por sus siglas en inglés), pero también existen algunas soluciones de código abierto. En esta sección hablaremos de principalmente 2 aplicaciones, MyLenio y Gapps.

== MyLenio
Entre las opciones SaaS, se encuentra MyLenio, una plataforma la cual se compone de 3 principales módulos, "organización del equipo", "recursos humanos" y "cumplimiento y seguridad".

=== Organización del equipo #footnote(link("https://www.mylenio.com/team-organization"))
El módulo de organización del equipo permite asignar a cada empleado a los equipos a los cuales pertenece. Los equipos son la unidad básica de organización de MyLenio, estos también permiten asignar roles a cada empleado, para obtener mayor granularidad. Al tener organizado a cada empleado dentro de un equipo, esto permite tener mayor visibilidad de como se componen estos mismos dentro de la empresa, incluso ofreciendo un organigrama de los roles de cada proyecto.

==== Manejo de permisos
Dentro de cada equipo se puede se pueden crear, editar y remover permisos a distintos SaaS. Estos permisos se pueden asignar tanto a nivel de equipo, rol o empleado, pudiendo así manejar todos los permisos de diferentes SaaS desde un único lugar. Cuando se agregan nuevos integrantes a estos equipos, también se le asignan todos los permisos a las aplicaciones SaaS configuradas, haciendo más facil el proceso de incorporación de nuevos miembros a los equipos. Entre los SaaS se encuentran Bitbucket, DocuSign, GitHub, GitLab, Google G-Suite, Jira, Keeper password, Office 365, Slack y Trello.

==== Documentos, capacitaciones y tareas
A cada uno de los miembros de un equipo se les puede asignar documentos, capacitaciones o tareas. Asignar documentos por este medio permite el cumplimiento del sistema de seguridad de la información y le facilita a los empleados firmar, de ser necesario. Asimismo, permite asignar capacitaciones y mostrar el progreso de estas, pudiendo notificar a los empleados que aún no la han completado. Análogamente, se le pueden asignar tareas a los empleados y notificarlos para que las terminen.

=== Recursos Humano #footnote(link("https://www.mylenio.com/human-resources-hr"))
El módulo de recursos humanos proporciona ayuda en varios temas relacionados con esto. Entre estos temas se encuentran:
- Reclutamiento
- Incorporación de nuevos empleados
- Compromiso de los empleados
- Información de los empleados
- Modelar procesos de recursos humanos

=== Cumplimiento y Seguridad #footnote(link("https://www.mylenio.com/compliance-and-security"))
El módulo de cumplimiento y seguridad se puede separar en varios submódulos.

==== Reporte de cumplimiento en tiempo real
Este módulo proporciona la habilidad para saber quién firmo los documentos, el progreso de las formaciones y por último el estado en que se encuentran las tareas y flujos asignados al equipo.

==== Manejo de inventario
Este submódulo permite manejar el inventario de la empresa. Los elementos del inventario luego se le pueden asignar a los miembros del equipo.

==== Modelamiento de procesos
Este módulo permite modelar flujos existentes y monitorear su progreso.

==== Eventos recurrentes y automatización de cumplimiento
Este módulo permite asignar flujos, documentos, tareas y formación al equipo de manera automatizada. Estos puede ser fechas o acciones que se deban realizar cada cierto tiempo.

==== Manejo de riesgos
Este módulo permite hacer un seguimiento de todos los riesgos de la empresa, por medio del establecimiento de activos, amenazas y vulnerabilidades.

== Gapps
Gapps es una plataforma de cumplimiento de seguridad que facilita el seguimiento de su progreso frente a varios marcos de seguridad. Actualmente, el principal contribuidor al proyecto desincentiva su uso en ambientes de producción #footnote(link("https://github.com/bmarsh9/gapps")).

Al momento de la lectura, Gapps cuenta con soporte para más de 10 marcos de cumplimiento de seguridad, entre ellos ISO27001. Además, cuenta con más de 2000 controles y 30 políticas, permitiendo recolectar la evidencia para luego poder visualizarla en un dashboard #footnote(link("https://web-gapps.pages.dev/")).

== Necesidad de un trabajo novedoso
Esta necesidad surge debido a la falta de un software que se adecue a las necesidades de Magnet. Principalmente, el depender de un software de un externo, teniendo que pagar mensualidades y sin tener la certeza de que el software se seguirá manteniendo y no se tenga que migrar la información entre distintos proveedores.