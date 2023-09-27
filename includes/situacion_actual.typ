= Situación Actual
// Discutir las soluciones o recursos existentes relacionados con el problema. Justificar por qué es necesario un trabajo novedoso.
// [1-2 páginas]

Hoy en día existen programas capaces de manejar la auditoria para SGSI, la mayoría de estos programas son soluciones de software como servicio (SaaS, por sus siglas en inglés), pero también existen algunas soluciones de código abierto. En esta sección hablaremos de principalmente 2 aplicaciones, MyLenio y Gapps.

== MyLenio
Entre las opciones SaaS, se encuentra MyLenio, una plataforma la cual se compone de 3 principales módulos, "organización del equipo", "recursos humanos" y "cumplimiento y seguridad". El módulo de "cumplimiento y seguridad" es el de mayor interés, ya que, es el que proporciona ayuda para el cumplimiento de un SGSI.

=== Organización del equipo #footnote("https://www.mylenio.com/team-organization")
El módulo de organización del equipo permite organizar equipos en roles y grupos, permitiendo asignarles en la plataforma:
- Formación
- Documentos
- Tareas a realizar
- Permisos automáticos a otras aplicaciones SaaS

=== Recursos Humano #footnote("https://www.mylenio.com/human-resources-hr")
El módulo de recursos humanos proporciona ayuda en varios temas relacionados con esto. Entre estos temas se encuentran:
- Reclutamiento
- Incorporación de nuevos empleados
- Compromiso de los empleados
- Información de los empleados
- Modelar procesos de recursos humanos

=== Cumplimiento y Seguridad #footnote("https://www.mylenio.com/compliance-and-security")
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
Gapps es una plataforma de cumplimiento de seguridad que facilita el seguimiento de su progreso frente a varios marcos de seguridad. Actualmente, el principal contribuidor al proyecto desincentiva su uso en ambientes de producción #footnote("https://github.com/bmarsh9/gapps").

Al momento de la lectura, Gapps cuenta con soporte para más de 10 marcos de cumplimiento de seguridad, entre ellos ISO27001. Además, cuenta con más de 2000 controles y 30 políticas, permitiendo recolectar la evidencia para luego poder visualizarla en un dashboard #footnote("https://web-gapps.pages.dev/").

== Necesidad de un trabajo novedoso
Esta necesidad surge debido a la falta de un software que se adecue a las necesidades de Magnet. Principalmente, el depender de un software de un externo, teniendo que pagar mensualidades y sin tener la certeza de que el software se seguirá manteniendo y no se tenga que migrar la información entre distintos proveedores.