// Solución
//// Descripción de la solución y cómo se espera que la solución vaya a resolver el problema planteado
//// Justificación del diseño de la solución, y de los recursos usados
//// No es apropiado incluir código más allá de pequeños ejemplos; si es necesario poner código en un apéndice
//// Puede variar mucho dependiendo del tema
//// Puede ser dividido en varios capítulos (p. ej., un capítulo de Front-end, un capítulo de Back-end, etc.)

#let screenshot_width = 60%

El sistema desarrollado tiene como objetivo principal facilitar la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) de una empresa, siguiendo los estándares de la norma ISO 27001. Para lograr esto, se han definido varios módulos, cada uno con su conjunto de funcionalidades específicas. A continuación, se detalla la funcionalidad, historias de usuario y modelo de datos utilizado para cada uno de estos módulos: documentos, activos, riesgos y procesos.

== Tecnologías escogidas

La solución se adapta de manera efectiva para abordar desafíos relacionados con la escalabilidad, el rendimiento y la seguridad del sistema, incorporando consideraciones específicas en su diseño y arquitectura.

En términos de escalabilidad, si bien el proyecto no está inicialmente diseñado para manejar un gran flujo de usuarios, la implementación en contenedores Docker permite una fácil replicación y despliegue detrás de un balanceador de carga. Esto facilita la escalabilidad horizontal, permitiendo la adición de nuevos contenedores según sea necesario. Para la gestión de datos, la escalabilidad vertical de la base de datos PostgreSQL y la opción de utilizar réplicas para lectura proporcionan una respuesta eficiente a posibles aumentos en la carga de datos.

En cuanto al rendimiento, la elección de tecnologías robustas y bien probadas, como Django, PostgreSQL y Typescript, proporciona una base sólida. La experiencia previa con sistemas similares garantiza que el escalamiento de la aplicación sea un proceso manejable, respaldado por las mejores prácticas y lecciones aprendidas de implementaciones anteriores.

La interoperabilidad entre las tecnologías utilizadas se ve respaldada por la compatibilidad inherente de Django con PostgreSQL y la elección de Typescript como lenguaje en el frontend. Además, se planea seguir estándares y prácticas documentadas para asegurar una integración fluida, aprovechando la documentación existente como guía.

La elección de Django junto con HTML y CSS se justifica por la naturaleza estática de los datos, donde los cambios no son frecuentes. En este contexto, una biblioteca de frontend como React no aportaría un beneficio significativo, ya que la actualización dinámica de la interfaz de usuario no es una prioridad, lo que hace que la simplicidad y la eficiencia de HTML y CSS sean suficientes para cumplir con los requisitos del proyecto.

== Django Project Template (DPT)

=== Contexto General

Django Project Template™ (DPT) está diseñado para ser un punto de partida eficiente para el desarrollo de aplicaciones web en Django dentro de Magnet. La arquitectura de despliegue de DPT está bien definida para asegurar un entorno de desarrollo y producción robusto, especialmente útil para usuarios nuevos o aquellos que migran de versiones anteriores.

=== Tecnologías Utilizadas en DPT

Django Project Template™ incorpora una variedad de tecnologías para garantizar un desarrollo eficiente y un despliegue robusto. A continuación se describen algunas de las tecnologías clave:

- *Django*: El marco principal para el desarrollo de aplicaciones web. Ofrece una arquitectura robusta y escalable para el backend.
- *Python*: Lenguaje de programación utilizado para desarrollar aplicaciones Django.
- *Docker*: Plataforma para desarrollar, enviar y ejecutar aplicaciones dentro de contenedores, facilitando la gestión y la escalabilidad.
- *Docker Compose*: Herramienta para definir y ejecutar aplicaciones Docker multicontenedor, simplificando la configuración y el despliegue.
- *Nginx*: Servidor web y proxy inverso utilizado para manejar y redirigir las solicitudes HTTP/HTTPS.
- *Gunicorn*: Servidor WSGI que se utiliza para servir aplicaciones Django.
- *Redis*: Almacenamiento en memoria utilizado para la caché y como broker de mensajes para Celery.
- *Celery*: Librería de Python para ejecutar tareas en segundo plano y programadas.
- *PostgreSQL*: Sistema de gestión de bases de datos relacional utilizado para almacenar datos de la aplicación.
- *Amazon S3*: Servicio de almacenamiento en la nube utilizado para almacenar archivos estáticos y de medios.
- *TypeScript*: Un superconjunto de JavaScript que se utiliza para escribir código frontend más robusto y mantenible.
- *Bootstrap*: Framework de diseño frontend utilizado para crear interfaces de usuario responsivas y modernas.

=== Arquitectura de Infraestructura

La infraestructura de despliegue de DPT se basa en varios componentes containerizados que dependen entre sí. Esto facilita la escalabilidad, la mantenibilidad y el despliegue en entornos de nube. Los componentes principales son:

1. *Nginx*: Actúa como servidor web y proxy inverso, manejando las solicitudes del usuario y redirigiéndolas a la aplicación Django.
2. *Django*: Ejecuta la aplicación web a través del servidor WSGI de Gunicorn.
3. *Redis*: Proporciona servicios de caché y broker de mensajes.
4. *Celery*: Ejecuta tareas en segundo plano y programadas.
5. *PostgreSQL*: Servidor de base de datos.

Estos componentes se comunican a través de una red configurada por Docker Compose, lo que permite una configuración coherente y un despliegue sencillo.

==== Despliegue

Para proyectos basados en DPT, la arquitectura de despliegue en DigitalOcean consiste en ejecutar todos los servicios en una sola instancia de Droplet. Esto incluye los siguientes elementos:

- *Droplet de DigitalOcean*: Una instancia en la nube donde se ejecutan todos los servicios containerizados (Nginx, Django, Redis, Celery, PostgreSQL).
- *Amazon S3*: Utilizado para almacenar archivos estáticos y de medios, lo que facilita la gestión y el escalado del almacenamiento de archivos.

==== Flujo de Trabajo del Despliegue

1. *Usuario*: Los usuarios realizan solicitudes a la aplicación a través de HTTP/HTTPS.
2. *Nginx*: Recibe las solicitudes y las redirige al servidor Django.
3. *Django (Gunicorn)*: Procesa las solicitudes de la aplicación, interactuando con la base de datos PostgreSQL y utilizando Redis para el caché y la cola de tareas.
4. *Celery*: Ejecuta tareas en segundo plano, comunicándose con Redis para gestionar las colas de tareas.
5. *PostgreSQL*: Maneja las consultas de la base de datos provenientes de Django y Celery.
6. *Amazon S3*: Almacena archivos de medios y recursos estáticos, accesibles tanto por la aplicación Django como directamente por los usuarios.

==== Ventajas de esta Arquitectura

- *Simplicidad*: Ejecutar todos los servicios en un solo Droplet simplifica la gestión y el despliegue.
- *Escalabilidad*: Almacenar archivos en Amazon S3 permite escalar el almacenamiento independientemente de la capacidad del Droplet.
- *Mantenibilidad*: Utilizar Docker Compose facilita la configuración y la actualización de los servicios.
- *Costo-eficiencia*: Mantener una infraestructura sencilla reduce los costos operativos y facilita el monitoreo y la administración.

Esta configuración es ideal para aplicaciones con una carga de tráfico moderada, proporcionando un equilibrio entre simplicidad, eficiencia y escalabilidad.

== Perfiles de usuario del sistema

=== Colaborador

El perfil de colaborador está diseñado para los empleados de la empresa que deben seguir las directrices del SGSI. Los colaboradores tienen acceso para ver toda la información relevante en la aplicación, pero sus permisos de edición están limitados a ciertas acciones específicas como marcar como leídas las versiones de los documentos y participar en los procesos asignados.

1. *Acceso a la Información:* Los colaboradores pueden ver toda la información del SGSI, incluyendo documentos, activos, riesgos y procesos.
2. *Lectura de Documentos:* Los colaboradores pueden acceder y leer los documentos del SGSI. Pueden marcar las versiones de documentos como leídas, registrando que han revisado la información necesaria.
3. *Participación en Procesos:* Los colaboradores pueden participar en los procesos asignados, realizando las actividades correspondientes y generando evidencia según sea necesario.

En resumen, los colaboradores juegan un papel crucial en el cumplimiento del SGSI al mantenerse informados y participar activamente en los procesos, aunque sin permisos para editar o gestionar información del sistema.

=== Administrador

El perfil de administrador está destinado a los encargados de implementar, mantener y gestionar el SGSI. Los administradores tienen permisos completos dentro del sistema, lo que incluye la creación y edición de documentos, la gestión de activos y riesgos, y la generación de evidencia. Además, los administradores también actúan como colaboradores, siguiendo las mismas directrices y participando en los procesos necesarios.

1. *Gestión de Controles y Categorías:* Los administradores pueden crear y organizar controles de seguridad y sus respectivas categorías.
2. *Subir y Versionar Documentos:* Los administradores pueden subir nuevos documentos, versionar documentos existentes y mantener un registro de las modificaciones.
3. *Aprobar Documentos:* Los administradores tienen la capacidad de aprobar documentos, asegurando su validez y conformidad con los estándares del SGSI.
4. *Gestión de Activos y Riesgos:* Los administradores pueden registrar y clasificar activos, asignar riesgos y definir los controles necesarios para mitigarlos.
5. *Definir y Supervisar Procesos:* Los administradores pueden crear y gestionar procesos, asignar actividades a los colaboradores y supervisar el cumplimiento de los procesos definidos.
6. *Generación y Gestión de Evidencia:* Los administradores pueden crear, modificar y gestionar la evidencia necesaria para demostrar la implementación y efectividad de los controles de seguridad.
7. *Auditoría y Cumplimiento:* Los administradores pueden revisar la evidencia generada, asegurar la conformidad con las políticas de seguridad y preparar el SGSI para auditorías internas y externas.

En resumen, los administradores desempeñan un papel integral en la gestión del SGSI, asegurando que todos los aspectos del sistema sean implementados y mantenidos de acuerdo con los estándares de seguridad establecidos. Además de sus amplias capacidades de gestión, también participan activamente como colaboradores en los procesos definidos.

== Módulo de Usuarios

El módulo de usuarios es donde se guarda la información de los usuarios de la aplicación. Ya que el módulo de usuarios depende del módulo de autenticación proveído por Django, se agregan algunos modelos relacionados acá.

Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte el #link(label("erd-users"))[modelo entidad-relación para los usuarios] en el anexo.

=== Historias de Usuario

1. Como administrador, deseo tener la capacidad de asignar grupos a los usuarios y, de igual manera, asignar usuarios a grupos.
2. Como administrador, quiero poder crear, editar, ver y listar los usuarios de la plataforma.

=== Interfaz de usuario

==== Inicio de sesión

La aplicación presenta una interfaz de inicio de sesión diseñada para ser segura y accesible. Para Magnet, el inicio de sesión se realiza a través de Google Workspace, proporcionando una integración fluida con los servicios de Google. Esto simplifica el proceso para los usuarios que ya están familiarizados con el entorno de Google.

Sin embargo, la flexibilidad de la aplicación permite cambiar el método de autenticación mediante variables de entorno, permitiendo el uso de email y contraseña como alternativa. Esta configuración es útil en entornos donde el uso de Google Workspace no es adecuado o preferido.

Además, el registro de usuarios está estrictamente controlado. Solo los administradores de la aplicación pueden crear nuevas cuentas, lo que evita que usuarios externos se registren sin autorización. No obstante, el registro de usuarios externos también puede ser gestionado mediante variables de entorno, permitiendo configuraciones más abiertas si es necesario. Este enfoque garantiza un control preciso sobre quién puede acceder a la aplicación, mejorando la seguridad y la gestión de usuarios.

#figure(
    image("../imagenes/modulos/users/login.png", width: screenshot_width),
    caption: [Vista de inicio de sesión],
)

==== Listado de usuarios

La vista del listado de usuarios proporciona una tabla con información detallada sobre cada usuario, incluyendo su nombre, dirección de correo electrónico, grupos y estado de la cuenta. Esta vista está diseñada para ser intuitiva y fácil de navegar, permitiendo a los administradores realizar varias acciones importantes:

- Visualización y Búsqueda: Los administradores pueden ver todos los usuarios registrados y utilizar la barra de búsqueda para encontrar rápidamente usuarios específicos.
- Botones de Creación, Edición, Detalle y Eliminación: La interfaz incluye botones que permiten a los administradores crear nuevos usuarios, editar la información de los existentes, ver detalles específicos de cada usuario y eliminar usuarios cuando sea necesario.

#figure(
    image("../imagenes/modulos/users/list.png", width: screenshot_width),
    caption: [Vista de listado de usuarios],
)

==== Creación de usuarios

La vista de creación de usuarios permite a los administradores añadir nuevos usuarios al sistema. Esta interfaz incluye los siguientes campos y opciones:

- *Nombre (opcional)*: Ingrese el primer nombre del usuario.
- *Apellido (opcional)*: Ingrese el apellido del usuario.
- *Correo electrónico*: Ingrese la dirección de correo electrónico del usuario.
- *Activo*: Active o desactive la cuenta del usuario.
- *Grupos (opcional)*: Asigne uno o más grupos al usuario.

Botones de acción:
- *Guardar*: Guarda el nuevo usuario.
- *Cancelar*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/users/create.png", width: screenshot_width),
    caption: [Vista de creación de usuario],
)

==== Detalle de usuarios

La vista de detalle de usuario permite a los administradores ver y gestionar información específica de cada usuario. Esta vista incluye:

- *Información personal*: Muestra el primer nombre, apellido, correo electrónico y estado de actividad del usuario.
- *Grupos asignados*: Lista los grupos a los que pertenece el usuario, junto con el número de usuarios y permisos asociados a cada grupo.

Además, la interfaz ofrece los siguientes botones de acción:

- *Actualizar usuario*: Permite editar la información del usuario.
- *Eliminar usuario*: Permite eliminar al usuario de la aplicación.
- *Actualizar grupo*: Permite modificar los detalles del grupo asignado.
- *Eliminar grupo*: Permite eliminar al usuario de un grupo específico.

#figure(
    image("../imagenes/modulos/users/detail.png", width: screenshot_width),
    caption: [Vista de detalle de usuario],
)

==== Actualización de usuarios

La vista de actualización de usuario permite a los administradores editar la información de un usuario. Esta interfaz incluye:

- *Nombre (opcional)*: Editar el primer nombre del usuario.
- *Apellido (opcional)*: Editar el apellido del usuario.
- *Correo electrónico*: Editar la dirección de correo electrónico del usuario.
- *Activo*: Activar o desactivar la cuenta del usuario.
- *Grupos (opcional)*: Asignar o cambiar los grupos del usuario.

Botones de acción:
- *Guardar*: Guarda los cambios.
- *Cancelar*: Cancela la edición y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/users/update.png", width: screenshot_width),
    caption: [Vista de actualización de usuario],
)

==== Eliminación de Usuario

La vista de eliminación de usuario permite a los administradores borrar una cuenta de usuario existente del sistema. Esta acción es crítica y debe realizarse con precaución, ya que la eliminación de un usuario no puede deshacerse.

*Elementos de la vista:*
- *Confirmación de Eliminación:* Un mensaje de advertencia que solicita confirmación para eliminar la cuenta de usuario seleccionada. Este paso es esencial para prevenir eliminaciones accidentales.

_Acciones disponibles:_
- *Confirmar:* Permite proceder con la eliminación del usuario.
- *Cancelar:* Permite cancelar la operación de eliminación.

#figure(
    image("../imagenes/modulos/users/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de usuario],
)

==== Listado de grupos

La vista de listado de grupos permite a los administradores gestionar los grupos existentes en la aplicación. Esta vista incluye una tabla con la siguiente información:

- *Nombre*: El nombre del grupo.
- *Usuarios*: El número de usuarios en el grupo.
- *Permisos*: El número de permisos asociados al grupo.

La interfaz también proporciona botones de acción:
- *Añadir grupo*: Permite crear un nuevo grupo.
- *Actualizar grupo*: Permite editar un grupo existente.
- *Eliminar grupo*: Permite eliminar un grupo, con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/list.png", width: screenshot_width),
    caption: [Vista de listado de grupos],
)

==== Creación de grupo

La vista de creación de grupos permite a los administradores añadir nuevos grupos al sistema. Esta interfaz incluye los siguientes campos y opciones:

- *Nombre*: Ingrese el nombre del grupo.
- *Usuarios (opcional)*: Asigne uno o más usuarios al grupo.
- *Permisos (opcional)*: Asigne uno o más permisos al grupo.

Botones de acción:
- *Guardar*: Guarda el nuevo grupo.
- *Cancelar*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/groups/create.png", width: screenshot_width),
    caption: [Vista de creación de grupo],
)

==== Detalle de grupo

La vista de detalle de grupo muestra información detallada sobre un grupo específico. Incluye:

- *Usuarios*: Lista de usuarios que pertenecen al grupo, junto con su nombre y correo electrónico.
- *Permisos asignados*: Una lista detallada de los permisos asignados al grupo, incluyendo el nombre del permiso, el nombre de código y la aplicación/modelo asociado.

Botones de acción:
- *Actualizar grupo*: Permite editar la información del grupo.
- *Eliminar grupo*: Permite eliminar el grupo, con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/detail.png", width: screenshot_width),
    caption: [Vista de detalle de grupo],
)

==== Actualización de grupo

La vista de actualización de grupo permite a los administradores editar la información de un grupo existente. Incluye los siguientes campos y opciones:

- *Nombre*: Editar el nombre del grupo.
- *Ususarios (opcional)*: Asignar o cambiar los usuarios que pertenecen al grupo.
- *Permisos (opcional)*: Asignar o cambiar los permisos del grupo.

Botones de acción:
- *Guardar*: Guarda los cambios realizados en el grupo.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin guardar los cambios.

#figure(
    image("../imagenes/modulos/groups/update.png", width: screenshot_width),
    caption: [Vista de actualización de grupo],
)

==== Eliminación de Grupos

La vista de eliminación de grupos permite eliminar un grupo específico del sistema, garantizando que los usuarios y roles asociados se manejen adecuadamente antes de la eliminación final. Esta funcionalidad es esencial para mantener la estructura organizativa actualizada y precisa dentro del SGSI.

*Confirmación de Eliminación*: Se muestra un mensaje de confirmación para asegurar que la eliminación del grupo es intencional y evitar la eliminación accidental de datos importantes.

_Acciones disponibles:_
- *Confirmar*: Permite proceder con la eliminación del grupo seleccionado.
- *Cancelar*: Permite cancelar el proceso de eliminación y regresar a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/groups/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de grupo],
)

== Módulo de Documentos

El módulo de documentos es el repositorio central donde se guarda toda la información que define al SGSI. La información se puede dividir en controles, documentos y evidencia.

=== Controles

Los controles de seguridad son medidas implementadas para proteger datos e infraestructuras críticas para una organización. Cualquier tipo de salvaguarda o contramedida utilizada para evitar, detectar, contrarrestar o minimizar los riesgos de seguridad se considera un control de seguridad. Estos pueden incluir medidas técnicas como firewalls y antivirus, así como procedimientos y políticas como la formación de empleados y la gestión de accesos.

=== Categorías de Controles

Las categorías de controles son grupos de controles relacionados entre sí. Estas categorías permiten organizar y gestionar los controles de manera más efectiva, facilitando la identificación de áreas específicas de seguridad que necesitan ser abordadas. Ejemplos de categorías incluyen controles organizacionales, controles de personas, controles físicos y controles tecnológicos. Cada categoría abarca una serie de controles que cumplen con objetivos específicos dentro del SGSI.

=== Documentos

Los documentos son información registrada que respalda la implementación y gestión del SGSI. Pueden incluir políticas de seguridad, procedimientos operativos, registros de auditoría, planes de continuidad del negocio y cualquier otra información necesaria para mantener y mejorar la seguridad de la información dentro de la organización. La correcta gestión de estos documentos es crucial para asegurar la conformidad con normas y regulaciones y para facilitar la revisión y mejora continua del SGSI.

=== Tipos de Documentos

Los tipos de documentos son categorías utilizadas para organizar la información dentro del SGSI. Cada tipo cumple un propósito específico, facilitando la gestión y asegurando la conformidad con los estándares de seguridad. Ejemplos de tipos de documentos incluyen políticas, procedimientos, registros, informes y manuales. La correcta clasificación y gestión de estos documentos es crucial para la eficacia del SGSI y la conformidad con normas y regulaciones.

=== Evidencia

La evidencia se refiere a la documentación y pruebas tangibles que demuestran la implementación y efectividad de los controles de seguridad. Puede incluir registros de auditoría, informes de incidentes, resultados de pruebas de seguridad, registros de capacitación del personal, entre otros. La recopilación y gestión adecuada de la evidencia es esencial para demostrar la conformidad con los requisitos del SGSI y para proporcionar una base sólida para auditorías internas y externas.

=== Historias de Usuario

1. Como administrador, quiero poder crear categorías de controles para agrupar controles relacionados.
2. Como administrador, quiero poder crear controles para definir mi marco de SGSI.
3. Como administrador, quiero poder cargar todas las categorías y controles de ISO 27001 a partir de una plantilla, para tener una base al momento de implementar cada control.
4. Como administrador, quiero poder subir documentos a cada control, para definir mi implementación de dicho control.
5. Como administrador, quiero que los documentos queden versionados, para saber qué versiones han sido leídas por los usuarios y mantener un registro de modificaciones.
6. Como administrador, quiero poder aprobar documentos, para validar su contenido.
7. Como usuario, quiero poder ver el listado de controles.
8. Como usuario, quiero poder ver el detalle de cada control.
9. Como usuario, quiero poder ver el detalle de cada documento.
10. Como usuario, quiero poder marcar como leída una versión de un documento.
11. Como administrador, necesito poder generar enlaces de solo lectura para las versiones de documentos utilizando el código del documento y su número de versión.
12. Como usuario, quiero poder ver el listado de tipos de documentos.
13. Como administrador, quiero poder crear nuevos tipos de documentos.
14. Como administrador, quiero poder editar los tipos de documentos existentes.
15. Como administrador, quiero poder eliminar tipos de documentos que ya no son necesarios.

=== Interfaz de Usuario

==== Listado de Controles

La vista de listado de controles permite visualizar todos los controles de seguridad definidos en el SGSI. Esta vista es fundamental para mantener una organización clara y accesible de los controles, facilitando su gestión y revisión.

- *Nombre*: Identifica el nombre del control.
- *Categoría*: Indica la categoría a la que pertenece el control, permitiendo una mejor organización y agrupación de controles relacionados.
- *Actualizado en*: Muestra la fecha y hora de la última actualización del control.
- *Actualizado por*: Indica el nombre del usuario que realizó la última actualización.

_Acciones disponibles:_
- *Añadir Control*: Permite crear un nuevo control de seguridad.
- *Actualizar Control*: Permite modificar la información de un control existente.
- *Eliminar Control*: Permite eliminar un control de seguridad del sistema.

#figure(
    image("../imagenes/modulos/controls/list.png", width: screenshot_width),
    caption: [Vista de listado de controles],
)

==== Creación de Controles

La vista de creación de controles permite definir nuevos controles de seguridad dentro del SGSI. Esta función es fundamental para asegurar que todas las medidas necesarias para proteger la información de la organización estén claramente documentadas y gestionadas.

- *Categoría (opcional)*: Selección de la categoría a la que pertenece el control, lo que facilita su organización y gestión.
- *Título*: Nombre del control que identifica claramente su propósito.
- *Descripción (opcional)*: Detalle adicional sobre el control, describiendo su función y relevancia.

_Acciones disponibles:_
- *Guardar*: Permite crear el control con la información proporcionada.
- *Cancelar*: Permite cancelar la creación del control.

#figure(
    image("../imagenes/modulos/controls/create.png", width: screenshot_width),
    caption: [Vista de creación de controles],
)

==== Detalle de Controles

La vista de detalle de controles permite visualizar toda la información relevante sobre un control específico, incluyendo su categoría, título, descripción y su estado de creación y actualización. Esta vista es fundamental para entender el contexto y la aplicación de cada control dentro del SGSI.

- *Categoría*: Muestra la categoría a la que pertenece el control, facilitando su clasificación y organización.
- *Título*: Nombre del control que identifica su propósito específico.
- *Descripción*: Proporciona detalles adicionales sobre el control, describiendo su función y relevancia.
- *Creado el*: Fecha y hora en que el control fue creado.
- *Creado por*: Usuario que creó el control.
- *Actualizado el*: Fecha y hora de la última actualización del control.
- *Actualizado por*: Usuario que realizó la última actualización del control.

_Acciones disponibles:_
- *Actualizar control*: Permite modificar los detalles del control.
- *Eliminar control*: Permite eliminar el control del sistema si ya no es necesario.

Adicionalmente, la vista de detalle de controles incluye secciones para mostrar los documentos, riesgos relacionados y evidencias asociadas al control:

- *Documentado en*: Lista de documentos en los que se encuentra registrado el control, junto con la última versión aprobada y la fecha de actualización.
- *Riesgos relacionados*: Muestra los riesgos asociados al control, proporcionando información sobre la actualización y el responsable.
- *Evidencias*: Presenta las evidencias creadas que demuestran la implementación y efectividad del control.

#figure(
    image("../imagenes/modulos/controls/detail.png", width: screenshot_width),
    caption: [Vista de detalle de controles],
)

==== Actualización de Controles

La vista de actualización de controles permite a los administradores editar la información de un control existente. Esta interfaz incluye:

- *Categoría (opcional)*: Selección de la categoría a la que pertenece el control.
- *Título*: Campo para editar el título del control.
- *Descripción (opcional)*: Campo para agregar o modificar la descripción del control.

Botones de acción:
- *Guardar*: Guarda los cambios realizados en el control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/controls/update.png", width: screenshot_width),
    caption: [Vista de actualización de controles],
)

==== Eliminación de Controles

La vista de eliminación de controles permite a los administradores eliminar un control específico de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el control especificado, mostrando su nombre para asegurar que se está eliminando el control correcto.

Botones de acción:
- *Confirmar*: Elimina definitivamente el control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/controls/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de controles],
)

==== Listado de Categorías de Controles

La vista del listado de categorías de controles proporciona una tabla con información sobre cada categoría de control, incluyendo su nombre, fecha de actualización y el usuario que realizó la última actualización.

_Acciones disponibles:_
- *Añadir Categoría de Control*: Permite a los administradores añadir nuevas categorías de control.
- *Actualizar Categoría de Control*: Permite a los administradores editar la información de las categorías de control existentes.
- *Eliminar Categoría de Control*: Permite a los administradores eliminar categorías de control.

#figure(
    image("../imagenes/modulos/control-categories/list.png", width: screenshot_width),
    caption: [Vista de listado de categorías de controles],
)

==== Creación de Categorías de Controles

La vista de creación de categorías de controles permite a los administradores añadir nuevas categorías de control al sistema. Esta interfaz incluye:

- *Nombre*: Campo para ingresar el nombre de la categoría de control.

Botones de acción:
- *Guardar*: Guarda la nueva categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/create.png", width: screenshot_width),
    caption: [Vista de creación de categorías de controles],
)

==== Detalle de Categorías de Controles

La vista de detalle de categorías de controles permite a los administradores ver y gestionar información específica de cada categoría de control. Los campos más relevantes incluyen:

- *Nombre*: Nombre de la categoría de control.
- *Creado por*: Usuario que creó la categoría de control.
- *Actualizado por*: Usuario que realizó la última actualización.

Además, la vista muestra los controles relacionados con esta categoría.

Botones de acción:
- *Actualizar Categoría de Control*: Permite editar la información de la categoría de control.
- *Eliminar Categoría de Control*: Permite eliminar la categoría de control.

#figure(
    image("../imagenes/modulos/control-categories/detail.png", width: screenshot_width),
    caption: [Vista de detalle de categorías de controles],
)

==== Actualización de Categorías de Controles

La vista de actualización de categorías de controles permite a los administradores editar la información de una categoría de control existente. Esta interfaz incluye:

- *Nombre*: Campo para editar el nombre de la categoría de control.

Botones de acción:
- *Guardar*: Guarda los cambios realizados en la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/update.png", width: screenshot_width),
    caption: [Vista de actualización de categorías de controles],
)

==== Eliminación de Categorías de Controles

La vista de eliminación de categorías de controles permite a los administradores eliminar una categoría específica de control de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la categoría de control especificada, mostrando su nombre para asegurar que se está eliminando la categoría correcta.

Botones de acción:
- *Confirmar*: Elimina definitivamente la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de categorías de controles],
)

==== Listado de Documentos

La vista del listado de documentos proporciona una tabla con información sobre cada documento, incluyendo su nombre, la última versión aprobada, la última versión, la fecha de actualización y el usuario que realizó la última actualización.

_Acciones disponibles:_
- *Añadir Documento*: Permite a los administradores añadir nuevos documentos.
- *Editar Documento*: Permite a los administradores editar la información de los documentos existentes.
- *Eliminar Documento*: Permite a los administradores eliminar documentos.

#figure(
    image("../imagenes/modulos/documents/list.png", width: screenshot_width),
    caption: [Vista de listado de documentos],
)

==== Creación de Documentos

La vista de creación de documentos permite a los administradores añadir nuevos documentos al sistema. Esta interfaz incluye los siguientes campos:

- *Título*: El título del documento.
- *Código*: El código del documento.
- *Descripción (opcional)*: Una breve descripción del documento.
- *Controles documentados (opcional)*: Los controles que están documentados en el documento.

Botones de acción:
- *Guardar*: Guarda el nuevo documento.
- *Cancelar*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/documents/create.png", width: screenshot_width),
    caption: [Vista de creación de documentos],
)

==== Detalle de Documentos

La vista de detalle de documentos permite a los administradores ver y gestionar información específica de cada documento, incluyendo su título, código, descripción, fechas de creación y actualización, y los usuarios responsables.

_Acciones disponibles:_
- *Actualizar Documento*: Permite editar la información del documento.
- *Eliminar Documento*: Permite eliminar el documento.

La sección de versiones del documento proporciona información sobre cada versión, su estado de aprobación, y las fechas y usuarios de actualización.

_Acciones en versiones:_
- *Actualizar Versión*: Editar la versión del documento.
- *Aprobar Versión*: Aprobar la versión del documento.
- *Eliminar Versión*: Eliminar la versión del documento.

#figure(
    image("../imagenes/modulos/documents/detail.png", width: screenshot_width),
    caption: [Vista de detalle de documentos],
)

==== Eliminación de Documentos

La vista de eliminación de documentos permite a los administradores eliminar un documento específico de la aplicación de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el documento especificado, mostrando su nombre para asegurar que se está eliminando el documento correcto.

Botones de acción:
- *Confirmar*: Elimina definitivamente el documento de la aplicación.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de documentos],
)

==== Creación de Versión de Documentos

La vista de creación de versiones de documentos permite a los administradores añadir una nueva versión a un documento existente. Esta interfaz incluye:

- *Archivo*: Campo para subir el archivo de la nueva versión.
- *Comentario (opcional)*: Campo para agregar comentarios sobre la nueva versión.

Botones de acción:
- *Guardar*: Guarda la nueva versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_create.png", width: screenshot_width),
    caption: [Vista de creación de versiones de documentos],
)

==== Detalle de Versión de Documentos

La vista de detalle de versión de documentos permite a los administradores ver y gestionar información específica de cada versión de un documento. Los campos más relevantes incluyen:

- *Documento*: Documento al cual pertenece la versión.
- *Versión*: Número de la versión.
- *Archivo*: Enlace al archivo de la versión.
- *Aprobado*: Indica si la versión está aprobada.
- *Creado por*: Usuario que creó la versión.
- *Actualizado por*: Usuario que realizó la última actualización.

Botones de acción:
- *Marcar como leído*: Permite a los usuarios marcar la versión como leída.

#figure(
    image("../imagenes/modulos/documents/version_detail.png", width: screenshot_width),
    caption: [Vista de detalle de versión de documentos],
)

==== Aprobación de Versión de Documentos

La vista de aprobación de versiones de documentos permite a los administradores aprobar una versión específica de un documento. Esta interfaz incluye los siguientes campos opcionales:

- *Archivo de evidencia*: Archivo con la evidencia de la aprobación.
- *URL de evidencia*: Enlace a la evidencia de la aprobación.

Botones de acción:
- *Aprobar*: Aprueba la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_approve.png", width: screenshot_width),
    caption: [Vista de aprobación de versiones de documentos],
)

==== Actualización de Versión de Documentos

La vista de actualización de versiones de documentos permite a los administradores actualizar una versión específica de un documento. Esta interfaz incluye:

- *Archivo actual*: Enlace al archivo de la versión actual.
- *Cambiar archivo*: Opción para subir un nuevo archivo.
- *Comentario (opcional)*: Campo para agregar comentarios sobre la actualización.

Botones de acción:
- *Guardar*: Guarda los cambios realizados en la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_update.png", width: screenshot_width),
    caption: [Vista de actualización de versiones de documentos],
)

==== Eliminación de Versión de Documentos

La vista de eliminación de versiones de documentos permite a los administradores eliminar una versión específica de un documento de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la versión especificada del documento, mostrando su nombre para asegurar que se está eliminando la versión correcta.

Botones de acción:
- *Confirmar*: Elimina definitivamente la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_delete.png", width: screenshot_width),
    caption: [Vista de eliminación de versiones de documentos],
)

==== Listado de Tipos de Documentos

La vista de listado de tipos de documentos muestra una tabla con los tipos de documentos existentes en el sistema. Los campos más relevantes incluyen:

- *Nombre*: El nombre del tipo de documento.
- *Documentos relacionados*: La cantidad de documentos asociados a este tipo de documento.

_Acciones disponibles:_
- *Añadir Tipo de Documento*: Permite agregar un nuevo tipo de documento.
- *Actualizar Tipo de Documento*: Permite editar la información de un tipo de documento existente.
- *Eliminar Tipo de Documento*: Permite eliminar un tipo de documento existente.

#figure(
    image("../imagenes/modulos/document-types/list.png", width: screenshot_width),
    caption: [Vista de listado de tipos de documentos],
)

==== Creación de Tipos de Documentos

La vista de creación de tipos de documentos permite agregar un nuevo tipo de documento al sistema. Los campos más relevantes incluyen:

- *Nombre*: El nombre del tipo de documento.

_Acciones disponibles:_
- *Guardar*: Permite guardar el nuevo tipo de documento.
- *Cancelar*: Permite cancelar la creación del tipo de documento.

#figure(
    image("../imagenes/modulos/document-types/create.png", width: screenshot_width),
    caption: [Vista de creación de tipos de documentos],
)

==== Detalle de Tipos de Documentos

La vista de detalle de un tipo de documento muestra información específica sobre un tipo de documento en particular. Esta vista incluye los campos más relevantes:

- *Nombre*: El nombre del tipo de documento.

_Acciones disponibles:_
- *Actualizar Tipo de Documento*: Permite editar la información del tipo de documento.
- *Eliminar Tipo de Documento*: Permite eliminar el tipo de documento.

#figure(
    image("../imagenes/modulos/document-types/detail.png", width: screenshot_width),
    caption: [Vista de detalle de tipos de documentos],
)

==== Actualización de Tipos de Documentos

La vista de actualización de un tipo de documento permite editar la información del tipo de documento seleccionado. Esta vista incluye los campos más relevantes:

- *Nombre*: Permite modificar el nombre del tipo de documento.

_Acciones disponibles:_
- *Guardar*: Permite guardar los cambios realizados.
- *Cancelar*: Permite cancelar la actualización y volver a la vista anterior sin guardar los cambios.

#figure(
    image("../imagenes/modulos/document-types/update.png", width: screenshot_width),
    caption: [Vista de actualización de tipos de documentos],
)

==== Eliminación de Tipos de Documentos

La vista de eliminación de un tipo de documento permite confirmar la eliminación del tipo de documento seleccionado. Esta vista incluye la siguiente información relevante:

- *Confirmación*: Se solicita la confirmación del usuario para eliminar el tipo de documento seleccionado.

_Acciones disponibles:_
- *Confirmar*: Permite confirmar la eliminación del tipo de documento.
- *Cancelar*: Permite cancelar la eliminación y volver a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/document-types/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de tipos de documentos],
)

== Módulo de Activos

El módulo de activos es donde se preserva un inventario con todos los activos de la empresa pertinentes a la seguridad de la información. Su principal componente son los activos y los tipos de activos.

=== Tipos de activos

Los tipos de activos son para poder clasificar a los activos por su tipo, por ejemplo, aplicaciones, equipos informáticos, oficinas, entre otros.

=== Activos

Los activos son cualquier recurso que sea valioso para la organización y que necesite protección. Pueden incluir hardware, software, datos, personas, instalaciones y cualquier otro elemento que pueda tener un impacto en la seguridad de la información.

=== Roles de Activos

Los roles de activos son asignaciones específicas que definen las responsabilidades y permisos de los usuarios en relación con un activo particular. Este concepto permite una gestión granular y detallada de quién puede acceder y manejar cada activo, asegurando que solo las personas autorizadas tengan los permisos necesarios para interactuar con ellos.

=== Historias de Usuario

1. Como administrador, quiero poder registrar activos de la empresa, para luego definir su riesgo asociado.
2. Como usuario, quiero poder ver el listado de activos.
3. Como usuario, quiero poder ver el detalle de cada activo.

=== Interfaz de usuario

==== Listado de Tipos de Activos

La vista del listado de tipos de activos proporciona una tabla con información sobre cada tipo de activo, incluyendo su nombre, fecha de actualización y el usuario que realizó la última actualización.

_Acciones disponibles:_
- *Añadir Tipo de Activo*: Permite a los administradores añadir nuevos tipos de activos.
- *Actualizar Tipo de Activo*: Permite a los administradores editar la información de los tipos de activos existentes.
- *Eliminar Tipo de Activo*: Permite a los administradores eliminar tipos de activos.

#figure(
    image("../imagenes/modulos/asset-types/list.png", width: screenshot_width),
    caption: [Vista de listado de tipos de activos],
)

==== Creación de Tipos de Activos

La vista de creación de tipos de activos permite a los administradores añadir nuevos tipos de activos al sistema. Esta interfaz incluye:

- *Nombre*: Campo para ingresar el nombre del tipo de activo.

Botones de acción:
- *Guardar*: Guarda el nuevo tipo de activo.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/asset-types/create.png", width: screenshot_width),
    caption: [Vista de creación de tipos de activos],
)

==== Detalle de Tipos de Activos

La vista de detalle de un tipo de activo muestra información específica sobre un tipo de activo en particular. Esta vista incluye los campos más relevantes:

- *Nombre*: El nombre del tipo de activo.
- *Creado el*: La fecha y hora en que se creó el tipo de activo.
- *Creado por*: El usuario que creó el tipo de activo.
- *Actualizado el*: La fecha y hora de la última actualización del tipo de activo.
- *Actualizado por*: El usuario que realizó la última actualización del tipo de activo.

_Acciones disponibles:_
- *Actualizar Tipo de Activo*: Permite editar la información del tipo de activo.
- *Eliminar Tipo de Activo*: Permite eliminar el tipo de activo.

#figure(
    image("../imagenes/modulos/asset-types/detail.png", width: screenshot_width),
    caption: [Vista de detalle de tipos de activos],
)

==== Modificación de Tipos de Activos

La vista de modificación de un tipo de activo permite al usuario actualizar la información existente sobre un tipo de activo específico. Esta vista incluye los siguientes campos:

- *Nombre*: El nombre del tipo de activo.

_Acciones disponibles:_
- *Guardar*: Guarda los cambios realizados en el tipo de activo.
- *Cancelar*: Cancela los cambios y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/asset-types/update.png", width: screenshot_width),
    caption: [Vista de modificación de tipos de activos],
)

==== Eliminación de Tipos de Activos

La vista de eliminación de un tipo de activo confirma la eliminación del tipo de activo seleccionado. Esta vista presenta un mensaje de confirmación para asegurar que el usuario desea proceder con la acción de eliminación. Los elementos incluidos son:

- *Mensaje de confirmación*: Pregunta al usuario si está seguro de querer eliminar el tipo de activo.
- *Botón Confirmar*: Procede con la eliminación del tipo de activo.
- *Botón Cancelar*: Cancela la acción de eliminación y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/asset-types/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de tipos de activos],
)

==== Listado de Activos

La vista de listado de activos muestra todos los activos registrados en el sistema. Los campos más relevantes que se presentan en esta vista incluyen:

- *Código*: Identificador único del activo.
- *Nombre*: Nombre del activo.
- *Propietario*: Persona responsable del activo.
- *Tipo*: Categoría o tipo de activo.
- *Criticidad*: Nivel de importancia del activo.
- *Clasificación*: Clasificación interna del activo.
- *Archivado*: Indica si el activo está archivado o no.
- *Actualizado en*: Fecha y hora de la última actualización del activo.
- *Actualizado por*: Usuario que realizó la última actualización.

Además, se proporcionan opciones para añadir un nuevo activo, actualizar un activo existente o archivar un activo.

#figure(
    image("../imagenes/modulos/assets/list.png", width: screenshot_width),
    caption: [Vista de listado de activos],
)

==== Listado de Roles de Activos

La vista de listado de roles de activos permite visualizar y gestionar los diferentes roles asignados a los activos dentro del sistema. Esta vista es crucial para administrar adecuadamente las responsabilidades y permisos relacionados con cada activo, asegurando que las tareas y accesos estén claramente definidos y organizados.

- *Nombre*: Muestra el nombre del rol asignado al activo.
- *Activo*: Indica el activo al que está asociado el rol.

_Acciones disponibles:_
- *Agregar rol de activo*: Permite crear un nuevo rol y asignarlo a un activo.
- *Actualizar rol de activo*: Permite modificar la información de un rol existente.
- *Eliminar rol de activo*: Permite eliminar un rol asignado a un activo.

#figure(
    image("../imagenes/modulos/asset-roles/list.png", width: screenshot_width),
    caption: [Vista de listado de roles de activos],
)

==== Creación de Roles de Activos

La vista de creación de roles de activos permite definir y asignar roles específicos a los activos dentro del sistema. Esta funcionalidad es esencial para establecer las responsabilidades y permisos adecuados para cada activo, asegurando que solo los usuarios autorizados puedan gestionarlos.

- *Activo*: Permite seleccionar el activo al cual se asignará el rol.
- *Nombre*: Campo para ingresar el nombre del rol que se está creando.
- *Grupos (opcional)*: Campo opcional para asignar grupos de usuarios que estarán relacionados con este rol.

_Acciones disponibles:_
- *Guardar*: Permite crear el rol de activo con la información proporcionada.
- *Cancelar*: Permite cancelar la creación del rol de activo.

#figure(
    image("../imagenes/modulos/asset-roles/create.png", width: screenshot_width),
    caption: [Vista de creación de roles de activos],
)

==== Detalle de Roles de Activos

La vista de detalle de roles de activos proporciona información detallada sobre un rol específico asignado a un activo, incluyendo los usuarios que tienen asignado dicho rol. Esta vista es esencial para gestionar y verificar las responsabilidades y permisos relacionados con cada activo en el sistema.

- *Activo*: Muestra el activo al cual está asignado el rol.
- *Nombre*: Muestra el nombre del rol asignado.
- *Usuarios*: Lista de usuarios que tienen asignado este rol, incluyendo sus nombres y correos electrónicos.

_Acciones disponibles:_
- *Actualizar Rol de Activo*: Permite modificar los detalles del rol de activo.
- *Eliminar Rol de Activo*: Permite eliminar el rol de activo del sistema.

#figure(
    image("../imagenes/modulos/asset-roles/detail.png", width: screenshot_width),
    caption: [Vista de detalle de roles de activos],
)

==== Actualización de Roles de Activos

La vista de actualización de roles de activos permite modificar la información y los usuarios asignados a un rol específico de un activo. Esta funcionalidad es crucial para mantener los permisos y responsabilidades actualizados en el sistema.

- *Nombre*: Campo para modificar el nombre del rol de activo.
- *Usuarios*: Lista de usuarios asignados al rol, permitiendo agregar o eliminar usuarios según sea necesario.

_Acciones disponibles:_
- *Guardar*: Permite guardar los cambios realizados en el rol de activo.
- *Cancelar*: Permite cancelar la actualización y volver a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/asset-roles/update.png", width: screenshot_width),
    caption: [Vista de actualización de roles de activos],
)

==== Eliminación de Roles de Activos

La vista de eliminación de roles de activos permite eliminar un rol específico asignado a un activo. Esta funcionalidad es crucial para mantener la seguridad y la precisión en la asignación de responsabilidades dentro del sistema.

- *Confirmación*: La vista solicita una confirmación para proceder con la eliminación del rol de activo, asegurando que no se realicen eliminaciones accidentales.

_Acciones disponibles:_
- *Confirmar*: Permite confirmar la eliminación del rol de activo.
- *Cancelar*: Permite cancelar la eliminación y volver a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/asset-roles/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de roles de activos],
)

==== Creación de Activos

La vista de creación de un activo permite ingresar la información necesaria para registrar un nuevo activo en el sistema. Los campos requeridos son los siguientes:

- *Nombre*: El nombre del activo.
- *Código*: Un identificador único para el activo.
- *Propietario*: El usuario responsable del activo.
- *Descripción (opcional)*: Una descripción detallada del activo.
- *Tipo*: El tipo al que pertenece el activo.
- *Criticidad*: El nivel de criticidad del activo.
- *Clasificación*: La clasificación del activo según su sensibilidad.

_Acciones disponibles:_
- *Guardar*: Permite guardar el nuevo activo en el sistema.
- *Cancelar*: Permite cancelar la creación del activo y regresar a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/create.png", width: screenshot_width),
    caption: [Vista de creación de activos],
)

==== Detalle de Activos

La vista de detalle de un activo muestra información específica sobre un activo en particular. Esta vista incluye los campos más relevantes:

- *Código*: El identificador único del activo.
- *Nombre*: El nombre del activo.
- *Propietario*: El usuario responsable del activo.
- *Tipo*: El tipo al que pertenece el activo.
- *Criticidad*: El nivel de criticidad del activo.
- *Clasificación*: La clasificación del activo según su sensibilidad.

_Acciones disponibles:_
- *Archivar*: Permite archivar el activo.
- *Actualizar Activo*: Permite editar la información del activo.

#figure(
    image("../imagenes/modulos/assets/detail.png", width: screenshot_width),
    caption: [Vista de detalle de activos],
)

==== Modificación de Activos

La vista de modificación de un activo permite editar la información existente de un activo registrado en el sistema. Los campos disponibles para la edición son los siguientes:

- *Nombre*: El nombre del activo.
- *Código*: Un identificador único para el activo.
- *Propietario*: El usuario responsable del activo.
- *Descripción (opcional)*: Una descripción detallada del activo.
- *Tipo*: El tipo al que pertenece el activo.
- *Criticidad*: El nivel de criticidad del activo.
- *Clasificación*: La clasificación del activo según su sensibilidad.

_Acciones disponibles:_
- *Guardar*: Permite guardar los cambios realizados en el activo.
- *Cancelar*: Permite cancelar la edición y regresar a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/update.png", width: screenshot_width),
    caption: [Vista de modificación de activos],
)

==== Archivado de Activos

La vista de archivado de un activo permite confirmar la acción de archivar un activo específico. Los campos más relevantes y acciones disponibles son los siguientes:

- *Mensaje de confirmación*: Indica si el usuario está seguro de querer archivar el activo seleccionado.
- *Nombre del Activo*: Se muestra el nombre del activo a archivar.

_Acciones disponibles:_
- *Archivar*: Confirma la acción de archivar el activo.
- *Cancelar*: Cancela la acción de archivado y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/archive.png", width: screenshot_width),
    caption: [Vista de archivado de activos],
)

== Módulo de Riesgos

El módulo de riesgos es donde se gestiona y asigna un riesgo a cada uno de los activos, evaluando su gravedad y probabilidad. Su único componente es el riesgo.

=== Riesgos

Los riesgos sirven para relacionar a los activos con los controles. En los controles se definen los posibles riesgos y acá se relacionan con un activo real, detallando más a fondo cuál es el riesgo en sí y como este afecta a la información de la empresa.

=== Historias de Usuario

1. Como administrador, quiero poder asignar un riesgo a cada uno de los activos.
2. Como administrador, quiero poder ver el listado de riesgos.
3. Como administrador, quiero poder ver el detalle de cada riesgo.

=== Interfaz de usuario

==== Listado de Riesgos

La vista de listado de riesgos muestra una tabla con los riesgos existentes en el sistema. Los campos más relevantes y las acciones disponibles en esta vista son:

- *Nombre*: El nombre del riesgo.
- *Actualizado el*: La fecha y hora de la última actualización del riesgo.
- *Actualizado por*: El usuario que realizó la última actualización del riesgo.

_Acciones disponibles:_
- *Añadir Riesgo*: Permite agregar un nuevo riesgo al sistema.
- *Actualizar Riesgo*: Permite editar la información de un riesgo existente.
- *Eliminar Riesgo*: Permite eliminar un riesgo del sistema.

#figure(
    image("../imagenes/modulos/risks/list.png", width: screenshot_width),
    caption: [Vista de listado de riesgos],
)

==== Crear Riesgo

La vista para crear un nuevo riesgo permite ingresar los detalles necesarios para registrar un riesgo en el sistema. Los campos más relevantes incluyen:

- *Activo*: Selección del activo asociado al riesgo.
- *Control*: Selección del control asociado al riesgo.
- *Título*: Nombre del riesgo.
- *Responsable*: Usuario responsable del riesgo.
- *Severidad*: Nivel de severidad del riesgo.
- *Probabilidad*: Probabilidad de que ocurra el riesgo.
- *Tratamiento*: Tratamiento asignado al riesgo.

_Acciones disponibles:_
- *Guardar*: Permite registrar el nuevo riesgo en el sistema.
- *Cancelar*: Permite cancelar la creación del riesgo.

#figure(
    image("../imagenes/modulos/risks/create.png", width: screenshot_width),
    caption: [Vista de creación de riesgos],
)

==== Detalle de Riesgos

La vista de detalle de un riesgo muestra información específica sobre un riesgo en particular. Esta vista incluye los campos más relevantes:

- *Título*: El nombre del riesgo.
- *Responsable*: El usuario responsable del riesgo.
- *Severidad*: La severidad del riesgo.
- *Probabilidad*: La probabilidad de que ocurra el riesgo.
- *Tratamiento*: El tratamiento asignado al riesgo.
- *Creado el*: La fecha y hora en que se creó el riesgo.
- *Actualizado el*: La fecha y hora de la última actualización del riesgo.

Además, se listan los activos, controles y riesgos residuales relacionados con el riesgo.

_Acciones disponibles:_
- *Actualizar Riesgo*: Permite editar la información del riesgo.
- *Eliminar Riesgo*: Permite eliminar el riesgo del sistema.

#figure(
    image("../imagenes/modulos/risks/detail.png", width: screenshot_width),
    caption: [Vista de detalle de riesgos],
)

==== Modificar Riesgo

La vista para modificar un riesgo existente permite editar los detalles del riesgo registrado en el sistema. Los campos más relevantes incluyen:

- *Activo*: Selección del activo asociado al riesgo.
- *Control*: Selección del control asociado al riesgo.
- *Título*: Nombre del riesgo.
- *Responsable*: Usuario responsable del riesgo.
- *Severidad*: Nivel de severidad del riesgo.
- *Probabilidad*: Probabilidad de que ocurra el riesgo.
- *Tratamiento*: Tratamiento asignado al riesgo.

_Acciones disponibles:_
- *Guardar*: Permite registrar los cambios realizados en el riesgo.
- *Cancelar*: Permite cancelar la modificación del riesgo.

#figure(
    image("../imagenes/modulos/risks/update.png", width: screenshot_width),
    caption: [Vista de modificación de riesgos],
)

==== Eliminar Riesgo

La vista para eliminar un riesgo permite confirmar la eliminación de un riesgo específico del sistema. Esta vista muestra un mensaje de confirmación con el nombre del riesgo a eliminar.

_Acciones disponibles:_
- *Confirmar*: Permite proceder con la eliminación del riesgo.
- *Cancelar*: Permite cancelar la eliminación del riesgo.

#figure(
    image("../imagenes/modulos/risks/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de riesgos],
)

== Módulo de Procesos

El módulo de procesos es donde se definen y gestionan los procesos. El principal propósito de los procesos es generar evidencia de que los procesos definidos en los controles del SGSI se están cumpliendo y así poder cumplir con leyes u obtener certificaciones, al momento de ser auditados.

=== Procesos

Los procesos son

=== Actividades

Las actividades son

=== Historias de Usuario

1. Como administrador, quiero poder definir procesos manuales para generar evidencia de cierto control.
2. Como administrador, quiero poder definir procesos recurrentes para generar evidencia de cierto control de manera periódica.
3. Como administrador, quiero poder asignar procesos a los usuarios directamente o indirectamente a través de grupos para generar evidencia de los controles.
4. Como usuario, quiero ser notificado al tener un nuevo proceso asignado para poder completarlo rápidamente.

=== Interfaz de usuario

==== Listado de Procesos

La vista de listado de procesos muestra una lista de todos los procesos existentes en el sistema. Los campos más relevantes presentados son:

- *Nombre*: El nombre del proceso.
- *Última versión publicada*: La versión más reciente del proceso que ha sido publicada.
- *Última versión*: La última versión del proceso, independientemente de si ha sido publicada o no.
- *Actualizado el*: La fecha y hora de la última actualización del proceso.
- *Actualizado por*: El usuario que realizó la última actualización del proceso.

_Acciones disponibles:_
- *Iniciar Proceso*: Permite iniciar un nuevo proceso.
- *Añadir Versión del Proceso*: Permite añadir una nueva versión del proceso.
- *Actualizar Proceso*: Permite editar la información del proceso.
- *Eliminar Proceso*: Permite eliminar el proceso.

#figure(
    image("../imagenes/modulos/processes/list.png", width: screenshot_width),
    caption: [Vista de listado de procesos],
)

==== Crear Proceso

La vista de creación de un proceso permite a los usuarios añadir un nuevo proceso al sistema. Esta vista incluye los siguientes campos:

- *Nombre*: El nombre del proceso.

_Acciones disponibles:_
- *Guardar*: Permite guardar el nuevo proceso.
- *Cancelar*: Permite cancelar la creación del proceso.

#figure(
    image("../imagenes/modulos/processes/create.png", width: screenshot_width),
    caption: [Vista de creación de proceso],
)

==== Detalle de Proceso

La vista de detalle de un proceso muestra información específica sobre un proceso en particular. Esta vista incluye los campos más relevantes:

- *Nombre*: El nombre del proceso.
- *Creado el*: La fecha y hora en que se creó el proceso.
- *Creado por*: El usuario que creó el proceso.
- *Actualizado el*: La fecha y hora de la última actualización del proceso.
- *Actualizado por*: El usuario que realizó la última actualización del proceso.

_Acciones disponibles:_
- *Iniciar Proceso*: Permite iniciar el proceso.
- *Actualizar Proceso*: Permite editar la información del proceso.
- *Eliminar Proceso*: Permite eliminar el proceso.

#figure(
    image("../imagenes/modulos/processes/detail.png", width: screenshot_width),
    caption: [Vista de detalle de proceso],
)

==== Actualización de Proceso

La vista de actualización de un proceso permite modificar la información existente de un proceso. Los campos más importantes disponibles para la actualización son:

- *Nombre*: Permite editar el nombre del proceso.

_Acciones disponibles:_
- *Guardar*: Guarda los cambios realizados en el proceso.
- *Cancelar*: Cancela la actualización y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/update.png", width: screenshot_width),
    caption: [Vista de actualización de proceso],
)

=== Eliminación de Proceso

La vista de eliminación de un proceso permite confirmar la eliminación de un proceso existente. Los campos más importantes disponibles para esta acción son:

- *Confirmación de eliminación*: Se muestra un mensaje de confirmación preguntando si realmente desea eliminar el proceso.

_Acciones disponibles:_
- *Confirmar*: Confirma y procede con la eliminación del proceso.
- *Cancelar*: Cancela la eliminación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de proceso],
)

==== Creación de Versión de Proceso

La vista de creación de una versión de proceso permite definir una nueva versión de un proceso existente. Los campos más importantes disponibles para esta acción son:

- *Definido en*: Seleccione el documento en el que se define esta versión del proceso.
- *Controles*: Asigne controles relevantes para esta versión del proceso.
- *Etiqueta de comentarios (opcional)*: Proporcione una etiqueta para los comentarios relacionados con esta versión del proceso.
- *Recurrencia (opcional)*: Defina la recurrencia para la ejecución del proceso.
- *Correo para notificación de finalización (opcional)*: Ingrese una dirección de correo electrónico para recibir notificaciones de finalización.

_Acciones disponibles:_
- *Guardar*: Guarda la nueva versión del proceso.
- *Cancelar*: Cancela la acción y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/version_create.png", width: screenshot_width),
    caption: [Vista de creación de versión de proceso],
)

==== Detalle de Versión de Proceso

La vista de detalle de una versión de proceso muestra la información específica de una versión particular del proceso. Esta vista incluye los campos más relevantes:

- *Proceso*: Nombre del proceso al que pertenece esta versión.
- *Definido en*: Documento en el que se define esta versión del proceso.
- *Publicado*: Indica si la versión está publicada.
- *Recurrencia*: Frecuencia de la ejecución del proceso.
- *Correo para notificación de finalización*: Dirección de correo para notificaciones de finalización.
- *Creado el*: Fecha y hora de creación de esta versión.
- *Creado por*: Usuario que creó esta versión.
- *Actualizado el*: Fecha y hora de la última actualización.
- *Actualizado por*: Usuario que realizó la última actualización.

_Acciones disponibles:_
- *Publicar*: Permite publicar la versión del proceso.
- *Agregar actividad del proceso*: Añadir nuevas actividades a esta versión del proceso.
- *Actualizar versión del proceso*: Permite editar la información de esta versión del proceso.
- *Eliminar versión del proceso*: Permite eliminar esta versión del proceso.

#figure(
    image("../imagenes/modulos/processes/version_detail.png", width: screenshot_width),
    caption: [Vista de detalle de versión de proceso],
)

==== Actualización de Versión de Proceso

La vista de actualización de una versión de proceso permite editar la información específica de una versión particular del proceso. Los campos más relevantes que se pueden actualizar incluyen:

- *Definido en*: Documento en el que se define esta versión del proceso.
- *Controles*: Controles asociados a esta versión del proceso.
- *Etiqueta de comentario (opcional)*: Etiqueta para comentarios adicionales.
- *Recurrencia (opcional)*: Frecuencia de ejecución del proceso.
- *Correo para notificación de finalización (opcional)*: Dirección de correo para notificaciones de finalización.

_Acciones disponibles:_
- *Guardar*: Guarda los cambios realizados en la versión del proceso.
- *Cancelar*: Cancela la operación de actualización y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/version_update.png", width: screenshot_width),
    caption: [Vista de actualización de versión de proceso],
)

==== Publicación de una Versión de Proceso

La vista de publicación de una versión de proceso permite confirmar la publicación de una versión específica de un proceso. Esta vista muestra un mensaje de confirmación para asegurar que realmente se desea publicar la versión del proceso.

_Acciones disponibles:_
- *Publicar*: Confirma la publicación de la versión del proceso.
- *Cancelar*: Cancela la acción de publicación y vuelve a la vista de detalle de la versión del proceso.

#figure(
    image("../imagenes/modulos/processes/version_publish.png", width: screenshot_width),
    caption: [Vista de publicación de versión de proceso],
)

==== Eliminación de Versión de Proceso

La vista de eliminación de una versión de proceso permite confirmar la acción de eliminar una versión específica de un proceso. Esta vista incluye:

- *Mensaje de confirmación*: Pregunta si está seguro de que desea eliminar la versión seleccionada del proceso.

_Acciones disponibles:_
- *Confirmar*: Elimina definitivamente la versión del proceso.
- *Cancelar*: Cancela la operación de eliminación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/version_delete.png", width: screenshot_width),
    caption: [Vista de eliminación de versión de proceso],
)

==== Creación de Actividad de Versión de Proceso

La vista de creación de una actividad de versión de proceso permite definir una nueva actividad dentro de una versión específica de un proceso. Los campos más relevantes son:

- *Título*: El nombre de la actividad.
- *Descripción*: Una descripción detallada de la actividad.
- *Entregables (opcional)*: Lista de entregables asociados a la actividad.
- *Grupos asignados*: Grupos responsables de la actividad.
- *Correo electrónico para notificaciones (opcional)*: Correo electrónico para recibir notificaciones de finalización.

_Acciones disponibles:_
- *Guardar*: Guarda la nueva actividad de la versión del proceso.
- *Cancelar*: Cancela la creación de la actividad y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/processes/activity_create.png", width: screenshot_width),
    caption: [Vista de creación de actividad de versión de proceso],
)

==== Detalle de Actividad de Versión de Proceso

La vista de detalle de una actividad de versión de proceso muestra la información más relevante sobre una actividad específica dentro de una versión de un proceso. Los campos más importantes son:

- *Versión del proceso*: La versión del proceso a la que pertenece la actividad.
- *Descripción*: Una descripción detallada de la actividad.
- *Entregables*: Elementos que deben ser entregados como resultado de la actividad.
- *Grupos asignados*: Grupos responsables de ejecutar la actividad.
- *Correo electrónico para notificaciones*: Correo electrónico para recibir notificaciones de finalización de la actividad.
- *Creado el*: Fecha y hora en que se creó la actividad.
- *Creado por*: Usuario que creó la actividad.
- *Actualizado el*: Fecha y hora de la última actualización de la actividad.
- *Actualizado por*: Usuario que realizó la última actualización de la actividad.

_Acciones disponibles:_
- *Actualizar actividad del proceso*: Permite editar la información de la actividad.
- *Eliminar actividad del proceso*: Permite eliminar la actividad del proceso.

#figure(
    image("../imagenes/modulos/processes/activity_detail.png", width: screenshot_width),
    caption: [Vista de detalle de actividad de versión de proceso],
)

==== Actualización de Actividad de Versión de Proceso

La vista de actualización de una actividad de versión de proceso permite editar la información de una actividad específica dentro de una versión de un proceso. Los campos más importantes que se pueden modificar son:

- *Título*: El título de la actividad.
- *Descripción*: Una descripción detallada de la actividad.
- *Entregables*: Elementos que deben ser entregados como resultado de la actividad (opcional).
- *Grupos asignados*: Grupos responsables de ejecutar la actividad.
- *Correo electrónico para notificaciones*: Correo electrónico para recibir notificaciones de finalización de la actividad (opcional).

_Acciones disponibles:_
- *Guardar*: Guarda los cambios realizados en la actividad.
- *Cancelar*: Cancela la edición y vuelve a la vista de detalle de la actividad.

#figure(
    image("../imagenes/modulos/processes/activity_update.png", width: screenshot_width),
    caption: [Vista de actualización de actividad de versión de proceso],
)

==== Eliminación de Actividad de Versión de Proceso

La vista de eliminación de una actividad de versión de proceso permite confirmar la eliminación de una actividad específica dentro de una versión de un proceso. Esta vista muestra un mensaje de confirmación para asegurar que realmente se desea eliminar la actividad.

_Acciones disponibles:_
- *Confirmar*: Confirma la eliminación de la actividad.
- *Cancelar*: Cancela la acción de eliminación y vuelve a la vista de detalle de la actividad.

#figure(
    image("../imagenes/modulos/processes/activity_delete.png", width: screenshot_width),
    caption: [Vista de eliminación de actividad de versión de proceso],
)

==== Listado de Instancias de Procesos

La vista de listado de instancias de procesos muestra una tabla con las instancias de los procesos que han sido creadas. Los puntos más importantes de esta vista son:

- *Nombre*: El nombre de la instancia del proceso.
- *Comentario*: Comentarios opcionales sobre la instancia del proceso.
- *Actualizado el*: Fecha y hora de la última actualización de la instancia del proceso.
- *Actualizado por*: El usuario que realizó la última actualización.
- *Completado*: Indica si la instancia del proceso está completada.
- *Completado el*: Fecha y hora en que se completó la instancia del proceso, si aplica.

_Acciones disponibles:_
- *Iniciar proceso*: Permite crear una nueva instancia de un proceso.
- *Eliminar instancia de proceso*: Permite eliminar una instancia específica de un proceso.

#figure(
    image("../imagenes/modulos/process-instances/list.png", width: screenshot_width),
    caption: [Vista de listado de instancias de procesos],
)

==== Creación de Instancia de Proceso

La vista de creación de una instancia de proceso permite iniciar una nueva instancia de un proceso existente. Los puntos más importantes de esta vista son:

- *Proceso*: Selección del proceso del cual se va a crear una instancia.
- *Comentario (opcional)*: Campo opcional para añadir comentarios relacionados con la instancia del proceso.

_Acciones disponibles:_
- *Guardar*: Permite crear la instancia de proceso con la información proporcionada.
- *Cancelar*: Permite cancelar la creación de la instancia de proceso.

#figure(
    image("../imagenes/modulos/process-instances/create.png", width: screenshot_width),
    caption: [Vista de creación de instancia de proceso],
)

==== Detalle de la Instancia de un Proceso

La vista de detalle de la instancia de un proceso muestra la información relevante sobre una instancia específica de un proceso y sus actividades. Los puntos más importantes de esta vista son:

- *Versión del Proceso*: Muestra la versión del proceso de la cual se ha creado la instancia.
- *Comentario*: Comentario opcional añadido al crear la instancia.
- *Creado en*: Fecha y hora de creación de la instancia.
- *Creado por*: Usuario que creó la instancia.
- *Actualizado en*: Fecha y hora de la última actualización de la instancia.
- *Actualizado por*: Usuario que realizó la última actualización de la instancia.
- *Completado*: Indica si la instancia del proceso ha sido completada.
- *Completado en*: Fecha y hora de la finalización del proceso, si ha sido completado.
- *Actividades*: Lista de actividades asociadas a la instancia del proceso, incluyendo:
  - *Título*: Nombre de la actividad.
  - *Descripción*: Descripción de la actividad.
  - *Asignado a*: Usuario al que se le ha asignado la actividad.
  - *Completado*: Indica si la actividad ha sido completada.
  - *Completado en*: Fecha y hora de la finalización de la actividad, si ha sido completada.

_Acciones disponibles:_
- *Eliminar Instancia del Proceso*: Permite eliminar la instancia del proceso.
- *Completar Actividad*: Permite marcar una actividad como completada.

#figure(
    image("../imagenes/modulos/process-instances/detail.png", width: screenshot_width),
    caption: [Vista de detalle de instancia de proceso],
)

==== Eliminación de la Instancia de un Proceso

La vista de eliminación de la instancia de un proceso permite al usuario confirmar la eliminación de una instancia específica de un proceso. Los puntos más importantes de esta vista son:

- *Confirmación de Eliminación*: Mensaje de confirmación para asegurar que el usuario realmente desea eliminar la instancia del proceso seleccionada.

_Acciones disponibles:_
- *Confirmar*: Permite eliminar la instancia de proceso seleccionada.
- *Cancelar*: Permite cancelar la eliminación de la instancia de proceso.

#figure(
    image("../imagenes/modulos/process-instances/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de instancia de proceso],
)

==== Detalle de la Actividad de una Instancia de Proceso

La vista de detalle de la actividad de una instancia de proceso muestra la información relevante de una actividad específica dentro de una instancia de proceso. Los puntos más importantes de esta vista son:

- *Proceso Instancia*: Muestra la instancia de proceso a la que pertenece la actividad.
- *Actividad*: Nombre de la actividad.
- *Responsable*: Persona asignada para realizar la actividad.
- *Descripción*: Detalles y descripción de la actividad.
- *Entregables*: Lista de entregables relacionados con la actividad (si los hay).
- *Completado*: Estado de la actividad, indicando si está completada o no.
- *Completado en*: Fecha y hora en que se completó la actividad (si está completada).

_Acciones disponibles:_
- *Completar Actividad*: Permite marcar la actividad como completada.
- *Eliminar Actividad*: Permite eliminar la actividad de la instancia de proceso.

#figure(
    image("../imagenes/modulos/process-instances/activity_detail.png", width: screenshot_width),
    caption: [Vista de detalle de la actividad de una instancia de proceso],
)

==== Finalización de Actividad de una Instancia de Proceso

La vista de finalización de la actividad de una instancia de proceso permite registrar la evidencia de la finalización de una actividad específica. Los puntos más importantes de esta vista son:

- *Archivo de evidencia (opcional)*: Permite subir un archivo como evidencia de la finalización de la actividad.
- *URL de evidencia (opcional)*: Permite ingresar una URL que sirva como evidencia de la finalización de la actividad.
- *Texto (opcional)*: Campo para ingresar un texto que sirva como evidencia de la finalización de la actividad.
- *Correo electrónico para notificar (opcional)*: Permite ingresar un correo electrónico al cual se notificará una vez completada la actividad.

_Acciones disponibles:_
- *Guardar*: Permite registrar la finalización de la actividad con la evidencia proporcionada.
- *Cancelar*: Permite cancelar la operación de registro de finalización de la actividad.

#figure(
    image("../imagenes/modulos/process-instances/activity_complete.png", width: screenshot_width),
    caption: [Vista de finalización de actividad de una instancia de proceso],
)
