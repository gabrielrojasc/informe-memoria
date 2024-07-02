// Solución
//// Descripción de la solución y cómo se espera que la solución vaya a resolver el problema planteado
//// Justificación del diseño de la solución, y de los recursos usados
//// No es apropiado incluir código más allá de pequeños ejemplos; si es necesario poner código en un apéndice
//// Puede variar mucho dependiendo del tema
//// Puede ser dividido en varios capítulos (p. ej., un capítulo de Front-end, un capítulo de Back-end, etc.)

#let screenshot_width = 60%

El sistema desarrollado tiene como objetivo principal facilitar la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) de una empresa. Para lograr esto, se han definido varios módulos, cada uno con su conjunto de funcionalidades específicas.

== Tecnologías escogidas

La solución se adapta de manera efectiva para abordar desafíos relacionados con la escalabilidad, el rendimiento y la seguridad del sistema, incorporando consideraciones específicas en su diseño y arquitectura.

En términos de escalabilidad, si bien el proyecto no está inicialmente diseñado para manejar un gran flujo de usuarios, la implementación en contenedores Docker permite una fácil replicación y despliegue detrás de un balanceador de carga. Esto facilita la escalabilidad horizontal, permitiendo la adición de nuevos contenedores según sea necesario. Para la gestión de datos, la escalabilidad vertical de la base de datos PostgreSQL y la opción de utilizar réplicas para lectura proporcionan una respuesta eficiente a posibles aumentos en la carga de datos.

En cuanto al rendimiento, la elección de tecnologías robustas y bien probadas, como Django, PostgreSQL y Typescript, proporciona una base sólida. La experiencia previa con sistemas similares garantiza que el escalamiento de la aplicación sea un proceso manejable, respaldado por las mejores prácticas y lecciones aprendidas de implementaciones anteriores.

La interoperabilidad entre las tecnologías utilizadas se ve respaldada por la compatibilidad inherente de Django con PostgreSQL y la elección de Typescript como lenguaje en el frontend. Además, se planea seguir estándares y prácticas documentadas para asegurar una integración fluida, aprovechando la documentación existente como guía.

La elección de Django junto con HTML y CSS se justifica por la naturaleza estática de los datos, donde los cambios no son frecuentes. En este contexto, una biblioteca de frontend como React no aportaría un beneficio significativo, ya que la actualización dinámica de la interfaz de usuario no es una prioridad, lo que hace que la simplicidad y la eficiencia de HTML y CSS sean suficientes para cumplir con los requisitos del proyecto.

== Django Project Template (DPT)
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

+ *Nginx*: Actúa como servidor web y proxy inverso, manejando las solicitudes del usuario y redirigiéndolas a la aplicación Django.
+ *Django*: Ejecuta la aplicación web a través del servidor WSGI de Gunicorn.
+ *Redis*: Proporciona servicios de caché y broker de mensajes.
+ *Celery*: Ejecuta tareas en segundo plano y programadas.
+ *PostgreSQL*: Servidor de base de datos.

Estos componentes se comunican a través de una red configurada por Docker Compose, lo que permite una configuración coherente y un despliegue sencillo.

La siguiente figura muestra un diagrama detallado de la arquitectura de despliegue utilizando Docker Compose. En ella se puede observar cómo interactúan entre sí los diferentes componentes, proporcionando una visión clara de cómo se gestionan las solicitudes y tareas dentro del sistema.

#figure(image("../imagenes/dpt/compose.png", width: 100%), caption: "Diagrama de la arquitectura utilizando Docker Compose")

==== Despliegue

Para proyectos basados en DPT, la arquitectura de despliegue en DigitalOcean consiste en ejecutar todos los servicios en una sola instancia de Droplet. Además, de ser necesario se puede tener un servicio de almacenamiento de datos en la nube. En este caso se tienen los siguientes elementos:

- *Droplet de DigitalOcean*: Una instancia en la nube donde se ejecutan todos los servicios containerizados (Nginx, Django, Redis, Celery, PostgreSQL).
- *Amazon S3*: Utilizado para almacenar archivos estáticos y de medios, lo que facilita la gestión y el escalado del almacenamiento de archivos.

==== Ventajas de esta Arquitectura

- *Simplicidad*: Ejecutar todos los servicios en un solo Droplet simplifica la gestión y el despliegue.
- *Escalabilidad*: Almacenar archivos en Amazon S3 permite escalar el almacenamiento independientemente de la capacidad del Droplet.
- *Mantenibilidad*: Utilizar Docker Compose facilita la configuración y la actualización de los servicios.
- *Costo-eficiencia*: Mantener una infraestructura sencilla reduce los costos operativos y facilita el monitoreo y la administración.

Esta configuración es ideal para aplicaciones con una carga de tráfico moderada, proporcionando un equilibrio entre simplicidad, eficiencia y escalabilidad.

== Perfiles de usuario del sistema
La plataforma desarrollada para la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) está diseñada para ser utilizada por diferentes perfiles de usuario, cada uno con roles y responsabilidades específicas. Esta organización en perfiles asegura que cada usuario tenga acceso a la información y las funcionalidades que necesita para desempeñar sus tareas, mientras se mantiene la seguridad y la integridad del sistema. Los dos perfiles principales de usuario en el sistema son el perfil de colaborador y el perfil de administrador.

=== Colaborador

El perfil de colaborador está diseñado para los empleados de la empresa que deben seguir las directrices del SGSI. Los colaboradores tienen acceso para ver toda la información relevante en la aplicación, pero sus permisos de edición están limitados a ciertas acciones específicas como marcar como leídas las versiones de los documentos y participar en los procesos asignados.

+ *Acceso a la Información:* Los colaboradores pueden ver toda la información del SGSI, incluyendo documentos, activos, riesgos y procesos.
+ *Lectura de Documentos:* Los colaboradores pueden acceder y leer los documentos del SGSI. Pueden marcar las versiones de documentos como leídas, registrando que han revisado la información necesaria.
+ *Participación en Procesos:* Los colaboradores pueden participar en los procesos asignados, realizando las actividades correspondientes y generando evidencia según sea necesario.

En resumen, los colaboradores juegan un papel crucial en el cumplimiento del SGSI al mantenerse informados y participar activamente en los procesos, aunque sin permisos para editar o gestionar información del sistema.

=== Administrador

El perfil de administrador está destinado a los encargados de implementar, mantener y gestionar el SGSI. Los administradores tienen permisos completos dentro del sistema, lo que incluye la creación y edición de documentos, la gestión de activos y riesgos, y la generación de evidencia. Además, los administradores también actúan como colaboradores, siguiendo las mismas directrices y participando en los procesos necesarios.

+ *Gestión de Controles y Categorías:* Los administradores pueden crear y organizar controles de seguridad y sus respectivas categorías.
+ *Subir y Versionar Documentos:* Los administradores pueden subir nuevos documentos, versionar documentos existentes y mantener un registro de las modificaciones.
+ *Aprobar Documentos:* Los administradores tienen la capacidad de aprobar documentos, asegurando su validez y conformidad con los estándares del SGSI.
+ *Gestión de Activos y Riesgos:* Los administradores pueden registrar y clasificar activos, asignar riesgos y definir los controles necesarios para mitigarlos.
+ *Definir y Supervisar Procesos:* Los administradores pueden crear y gestionar procesos, asignar actividades a los colaboradores y supervisar el cumplimiento de los procesos definidos.
+ *Generación y Gestión de Evidencia:* Los administradores pueden crear, modificar y gestionar la evidencia necesaria para demostrar la implementación y efectividad de los controles de seguridad.
+ *Auditoría y Cumplimiento:* Los administradores pueden revisar la evidencia generada, asegurar la conformidad con las políticas de seguridad y preparar el SGSI para auditorías internas y externas.

En resumen, los administradores desempeñan un papel integral en la gestión del SGSI, asegurando que todos los aspectos del sistema sean implementados y mantenidos de acuerdo con los estándares de seguridad establecidos. Además de sus amplias capacidades de gestión, también participan activamente como colaboradores en los procesos definidos.

== Módulo de Usuarios

El módulo de usuarios es donde se guarda la información de los usuarios de la aplicación. Ya que el módulo de usuarios depende del módulo de autenticación proveído por Django, se agregan algunos modelos relacionados acá. Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte la @erd-users del anexo.

=== Historias de Usuario

+ Como administrador, quiero poder crear, editar, ver y listar los usuarios de la plataforma.
+ Como administrador, quiero poder crear, editar, ver y listar los grupos de la plataforma.
+ Como administrador, deseo tener la capacidad de asignar grupos a los usuarios y, de igual manera, asignar usuarios a grupos.

=== Interfaz de usuario
La interfaz de usuario del módulo de usuarios está diseñada para ser intuitiva y facilitar la gestión de usuarios y grupos dentro de la aplicación. A continuación, se presenta una descripción del flujo típico que un administrador seguiría al utilizar las vistas más importantes del módulo de usuarios.

El primer paso en el uso de la aplicación es el inicio de sesión. La aplicación presenta una interfaz de inicio de sesión diseñada para ser segura y accesible. Para Magnet, el inicio de sesión se realiza a través de Google Workspace, proporcionando una integración fluida con los servicios de Google. Esto simplifica el proceso para los usuarios que ya están familiarizados con el entorno de Google. Sin embargo, la flexibilidad de la aplicación permite cambiar el método de autenticación mediante variables de entorno, permitiendo el uso de email y contraseña como alternativa. Esta configuración es útil en entornos donde el uso de Google Workspace no es adecuado o preferido. Además, el registro de usuarios está estrictamente controlado. Solo los administradores de la aplicación pueden crear nuevas cuentas, lo que evita que usuarios externos se registren sin autorización. No obstante, el registro de usuarios externos también puede ser gestionado mediante variables de entorno, permitiendo configuraciones más abiertas si es necesario. Este enfoque garantiza un control preciso sobre quién puede acceder a la aplicación, mejorando la seguridad y la gestión de usuarios.

#figure(
    image("../imagenes/modulos/users/login.png", width: screenshot_width),
    caption: "Vista de inicio de sesión"
)

Una vez autenticado, el administrador accede a la vista de listado de usuarios. Esta vista proporciona una tabla con información detallada sobre cada usuario, incluyendo su nombre, dirección de correo electrónico, grupos y estado de la cuenta. Esta vista está diseñada para ser intuitiva y fácil de navegar, permitiendo a los administradores realizar varias acciones importantes: visualización y búsqueda, creación, edición, visualización de detalles y eliminación de usuarios.

#figure(
    image("../imagenes/modulos/users/list.png", width: screenshot_width),
    caption: "Vista de listado de usuarios"
)

Al crear un nuevo usuario, el administrador accede a la vista de creación de usuarios. Esta interfaz incluye campos para ingresar el nombre, apellido, dirección de correo electrónico, estado de actividad y asignación de grupos al usuario. Los botones de acción permiten guardar el nuevo usuario o cancelar la creación y volver a la vista anterior.

#figure(
    image("../imagenes/modulos/users/create.png", width: screenshot_width),
    caption: "Vista de creación de usuario"
)

La vista de actualización de usuario permite a los administradores editar la información de un usuario existente, como el nombre, apellido, dirección de correo electrónico, estado de actividad y grupos asignados. Los botones de acción permiten guardar los cambios realizados o cancelar la edición y volver a la vista anterior.

#figure(
    image("../imagenes/modulos/users/update.png", width: screenshot_width),
    caption: "Vista de actualización de usuario"
)

Para ver y gestionar información específica de cada usuario, el administrador accede a la vista de detalle de usuario. Esta vista muestra información personal del usuario, como nombre, apellido, correo electrónico y estado de actividad, así como los grupos asignados al usuario. Los botones de acción permiten actualizar la información del usuario, eliminar al usuario de la aplicación, modificar los detalles del grupo asignado o eliminar el grupo de la aplicación.

#figure(
    image("../imagenes/modulos/users/detail.png", width: screenshot_width),
    caption: "Vista de detalle de usuario"
)

Además de gestionar usuarios, los administradores también pueden gestionar los grupos dentro de la aplicación. La vista de listado de grupos permite a los administradores ver y gestionar todos los grupos existentes, incluyendo información sobre el nombre del grupo, el número de usuarios y el número de permisos asociados al grupo. Los botones de acción permiten añadir nuevos grupos, actualizar grupos existentes y eliminar grupos con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/list.png", width: screenshot_width),
    caption: "Vista de listado de grupos"
)

Para más detalles sobre las demás vistas del módulo de usuarios consulte la @user-views del anexo.

== Módulo de Documentos

El módulo de documentos es el repositorio central donde se guarda toda la información que define al SGSI. La información se puede dividir en controles, documentos y evidencia. Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte la @erd-documents del anexo.

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

+ Como administrador, quiero poder crear categorías de controles para agrupar controles relacionados.
+ Como administrador, quiero poder crear controles para definir mi marco de SGSI.
+ Como administrador, quiero poder cargar todas las categorías y controles de ISO 27001 a partir de una plantilla, para tener una base al momento de implementar cada control.
+ Como administrador, quiero poder subir documentos a cada control, para definir mi implementación de dicho control.
+ Como administrador, quiero que los documentos queden versionados, para saber qué versiones han sido leídas por los usuarios y mantener un registro de modificaciones.
+ Como administrador, quiero poder aprobar documentos, para validar su contenido.
+ Como usuario, quiero poder ver el listado de documentos.
+ Como usuario, quiero poder ver el detalle de cada documento.
+ Como usuario, quiero poder ver el listado de controles.
+ Como usuario, quiero poder ver el detalle de cada control.
+ Como usuario, quiero poder ver el detalle de cada documento.
+ Como usuario, quiero poder marcar como leída una versión de un documento.
+ Como administrador, necesito poder generar enlaces de solo lectura para las versiones de documentos utilizando el código del documento y su número de versión.
+ Como usuario, quiero poder ver el listado de tipos de documentos.
+ Como usuario, quiero poder ver el detalle de cada tipo de documento.
+ Como administrador, quiero poder crear nuevos tipos de documentos.
+ Como administrador, quiero poder editar los tipos de documentos existentes.
+ Como administrador, quiero poder eliminar tipos de documentos que ya no son necesarios.

=== Interfaz de Usuario
El flujo típico de un usuario en el módulo de documentos comienza con la vista de listado de controles, donde puede visualizar todos los controles de seguridad definidos en el SGSI. Esta vista es fundamental para mantener una organización clara y accesible de los controles, facilitando su gestión y revisión.

#figure(
    image("../imagenes/modulos/controls/list.png", width: screenshot_width),
    caption: "Vista de listado de controles"
)

Desde aquí, un administrador puede acceder a la vista de creación de controles, donde puede definir nuevos controles de seguridad dentro del SGSI. Esta función es fundamental para asegurar que todas las medidas necesarias para proteger la información de la organización estén claramente documentadas y gestionadas.

#figure(
    image("../imagenes/modulos/controls/create.png", width: screenshot_width),
    caption: "Vista de creación de controles"
)

Una vez creado un control, los usuarios pueden ver toda la información relevante sobre un control específico en la vista de detalle de controles. Esta vista incluye secciones para mostrar los documentos, riesgos relacionados y evidencias asociadas al control.

#figure(
    image("../imagenes/modulos/controls/detail.png", width: screenshot_width),
    caption: "Vista de detalle de controles"
)

Si es necesario actualizar la información de un control existente, el administrador puede acceder a la vista de actualización de controles, donde puede editar los detalles del control.

#figure(
    image("../imagenes/modulos/controls/update.png", width: screenshot_width),
    caption: "Vista de actualización de controles"
)

Para gestionar las categorías de controles, el administrador puede utilizar la vista del listado de categorías de controles, que proporciona una tabla con información sobre cada categoría de control.

#figure(
    image("../imagenes/modulos/control-categories/list.png", width: screenshot_width),
    caption: "Vista de listado de categorías de controles"
)

Desde esta vista, puede acceder a la creación de nuevas categorías de controles o editar las existentes, facilitando la organización y gestión de los controles.

#figure(
    image("../imagenes/modulos/control-categories/create.png", width: screenshot_width),
    caption: "Vista de creación de categorías de controles"
)

La gestión de documentos es otro aspecto crucial del SGSI. Los usuarios pueden comenzar con la vista del listado de documentos, que proporciona una tabla con información sobre cada documento, incluyendo su nombre, la última versión aprobada, la última versión, la fecha de actualización y el usuario que realizó la última actualización.

#figure(
    image("../imagenes/modulos/documents/list.png", width: screenshot_width),
    caption: "Vista de listado de documentos"
)

Para añadir nuevos documentos, el administrador puede acceder a la vista de creación de documentos, donde se pueden ingresar detalles como el título, código, tipo de documento, descripción, carpeta en Drive y controles documentados.

#figure(
    image("../imagenes/modulos/documents/create.png", width: screenshot_width),
    caption: "Vista de creación de documentos"
)

Una vez creado un documento, los usuarios pueden ver y el administrador gestionar toda la información específica del documento en la vista de detalle de documentos, asegurando que esté actualizado y correctamente gestionado.

#figure(
    image("../imagenes/modulos/documents/detail.png", width: screenshot_width),
    caption: "Vista de detalle de documentos"
)

Para mantener un registro actualizado y detallado de todas las versiones de los documentos, el administrador puede utilizar la vista de creación de versiones de documentos, donde se pueden añadir nuevas versiones a un documento existente.

#figure(
    image("../imagenes/modulos/documents/version_create.png", width: screenshot_width),
    caption: "Vista de creación de versiones de documentos"
)

El detalle de cada versión del documento también puede ser gestionado en la vista de detalle de versión de documentos, proporcionando información específica sobre cada versión, como el autor, comentarios, estado de aprobación y usuarios que han leído la versión.

#figure(
    image("../imagenes/modulos/documents/version_detail.png", width: screenshot_width),
    caption: "Vista de detalle de versión de documentos"
)

Para aprobar una versión específica de un documento, el administrador puede acceder a la vista de aprobación de versiones de documentos, donde puede subir un archivo de evidencia, ingresar una URL o un texto como evidencia de la aprobación.

#figure(
    image("../imagenes/modulos/documents/version_approve.png", width: screenshot_width),
    caption: "Vista de aprobación de versión de documentos"
)

Adicionalmente, la vista del listado de tipos de documentos muestra una tabla con los tipos de documentos existentes en el sistema. Los campos más relevantes incluyen el nombre del tipo de documento y la cantidad de documentos asociados a este tipo.

#figure(
    image("../imagenes/modulos/document-types/list.png", width: screenshot_width),
    caption: "Vista de listado de tipos de documentos"
)

Para agregar un nuevo tipo de documento, el administrador puede acceder a la vista de creación de tipos de documentos, donde se puede ingresar el nombre del tipo de documento.

#figure(
    image("../imagenes/modulos/document-types/create.png", width: screenshot_width),
    caption: "Vista de creación de tipos de documentos"
)

La vista de detalle de un tipo de documento muestra información específica sobre un tipo de documento en particular, facilitando la gestión de estos.

#figure(
    image("../imagenes/modulos/document-types/detail.png", width: screenshot_width),
    caption: "Vista de detalle de tipos de documentos"
)

Para editar un tipo de documento existente, el administrador puede utilizar la vista de actualización de tipos de documentos, donde puede modificar el nombre del tipo de documento seleccionado.

#figure(
    image("../imagenes/modulos/document-types/update.png", width: screenshot_width),
    caption: "Vista de actualización de tipos de documentos"
)

Finalmente, para gestionar la evidencia, los usuarios pueden acceder a la vista de detalle de evidencia, donde se muestra toda la información relevante de una evidencia.

#figure(
    image("../imagenes/modulos/evidence/detail.png", width: screenshot_width),
    caption: "Vista de detalle de evidencia"
)

Este flujo de trabajo asegura que todos los documentos, controles y evidencias del SGSI estén organizados y gestionados de manera eficiente, facilitando la conformidad con las normas y regulaciones de seguridad de la información.

Para más detalles sobre otras vistas del módulo de documentos consulte la @document-views del anexo.

== Módulo de Activos

El módulo de activos es donde se preserva un inventario con todos los activos de la empresa pertinentes a la seguridad de la información. Su principal componente son los activos y los roles de los activos. Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte la @erd-assets del anexo.

=== Activos

Los activos son cualquier recurso que sea valioso para la organización y que necesite protección. Pueden incluir hardware, software, datos, personas, instalaciones y cualquier otro elemento que pueda tener un impacto en la seguridad de la información.

=== Tipos de activos

Los tipos de activos son para poder clasificar a los activos por su tipo, por ejemplo, aplicaciones, equipos informáticos, oficinas, entre otros.

=== Roles de Activos

Los roles de activos son asignaciones específicas que definen las responsabilidades y permisos de los usuarios en relación con un activo particular. Este concepto permite una gestión granular y detallada de quién puede acceder y manejar cada activo, asegurando que solo las personas autorizadas tengan los permisos necesarios para interactuar con ellos.

=== Historias de Usuario

+ Como administrador, quiero poder registrar activos de la empresa, para luego definir su riesgo asociado.
+ Como administrador, quiero poder editar activos.
+ Como usuario, quiero poder ver el listado de activos.
+ Como usuario, quiero poder ver el detalle de cada activo.
+ Como administrador, quiero poder crear tipos de activos.
+ Como administrador, quiero poder editar tipos de activos.
+ Como usuario, quiero poder ver el listado de tipos de activos.
+ Como usuario, quiero poder ver el detalle de cada tipo de activo.
+ Como administrador, quiero poder crear roles de activos.
+ Como administrador, quiero poder editar roles de activos.
+ Como usuario, quiero poder ver el listado de roles de activos.
+ Como usuario, quiero poder ver el detalle de cada rol de activo.

=== Interfaz de usuario
El flujo típico de un usuario comienza con la vista de listado de activos, donde se pueden visualizar todos los activos registrados en el sistema. Esta vista es fundamental para mantener una organización clara y accesible de los activos, facilitando su gestión y revisión. Desde aquí, los administradores pueden agregar nuevos activos, actualizar los existentes o archivar aquellos que ya no son relevantes.

#figure(
    image("../imagenes/modulos/assets/list.png", width: screenshot_width),
    caption: "Vista de listado de activos"
)

Al agregar un nuevo activo, el administrador ingresa información detallada como el nombre, código, propietario, tipo, criticidad y clasificación del activo. Esta información es esencial para mantener un registro completo y detallado de todos los activos de la organización.

#figure(
    image("../imagenes/modulos/assets/create.png", width: screenshot_width),
    caption: "Vista de creación de activos"
)

Una vez registrado, los usuarios pueden ver toda la información relevante sobre el activo en la vista de detalle de activos. Esta vista proporciona un desglose completo del activo, incluyendo su código, nombre, propietario, tipo, criticidad y clasificación.

#figure(
    image("../imagenes/modulos/assets/detail.png", width: screenshot_width),
    caption: "Vista de detalle de activos"
)

Si es necesario actualizar la información de un activo, el administrador accede a la vista de modificación de activos, donde puede editar los detalles existentes. Esta funcionalidad es crucial para asegurar que la información de los activos esté siempre actualizada y precisa.

#figure(
    image("../imagenes/modulos/assets/update.png", width: screenshot_width),
    caption: "Vista de modificación de activos"
)

Para gestionar los tipos de activos, los usuarios pueden utilizar la vista de listado de tipos de activos, que proporciona una tabla con información sobre cada tipo de activo. Desde esta vista, el administrador puede acceder a la creación de nuevos tipos de activos o a la edición de los existentes, facilitando la organización y clasificación de los activos.

#figure(
    image("../imagenes/modulos/asset-types/list.png", width: screenshot_width),
    caption: "Vista de listado de tipos de activos"
)

Al agregar un nuevo tipo de activo, el administrador ingresa el nombre del tipo de activo. Esta clasificación ayuda a organizar y gestionar los activos de manera más eficiente.

#figure(
    image("../imagenes/modulos/asset-types/create.png", width: screenshot_width),
    caption: "Vista de creación de tipos de activos"
)

La vista de detalle de tipos de activos proporciona información específica sobre un tipo de activo en particular, permitiendo al administrador ver y gestionar todos los aspectos relacionados con ese tipo.

#figure(
    image("../imagenes/modulos/asset-types/detail.png", width: screenshot_width),
    caption: "Vista de detalle de tipos de activos"
)

Para actualizar un tipo de activo existente, el administrador accede a la vista de modificación de tipos de activos, donde puede cambiar el nombre del tipo de activo según sea necesario.

#figure(
    image("../imagenes/modulos/asset-types/update.png", width: screenshot_width),
    caption: "Vista de modificación de tipos de activos"
)

La vista de roles de activos permite definir y asignar roles específicos a los activos dentro del sistema, lo que es esencial para establecer las responsabilidades y permisos adecuados para cada activo. Esta funcionalidad asegura que solo los usuarios autorizados puedan gestionar los activos.

#figure(
    image("../imagenes/modulos/asset-roles/list.png", width: screenshot_width),
    caption: "Vista de listado de roles de activos"
)

Al agregar un nuevo rol de activo, el administrador selecciona el activo al cual se asignará el rol, ingresa el nombre del rol y, opcionalmente, asigna grupos de usuarios relacionados con este rol.

#figure(
    image("../imagenes/modulos/asset-roles/create.png", width: screenshot_width),
    caption: "Vista de creación de roles de activos"
)

La vista de detalle de roles de activos proporciona información detallada sobre un rol específico asignado a un activo, incluyendo los usuarios que tienen asignado dicho rol, lo que facilita la gestión de las responsabilidades y permisos.

#figure(
    image("../imagenes/modulos/asset-roles/detail.png", width: screenshot_width),
    caption: "Vista de detalle de roles de activos"
)

Si es necesario modificar la información de un rol de activo, el administrador accede a la vista de actualización de roles de activos, donde puede cambiar el nombre del rol y actualizar la lista de usuarios asignados.

#figure(
    image("../imagenes/modulos/asset-roles/update.png", width: screenshot_width),
    caption: "Vista de actualización de roles de activos"
)

Para eliminar un rol de activo, la vista de eliminación de roles de activos permite confirmar la acción, asegurando que solo se realicen eliminaciones intencionales y evitando así errores.

#figure(
    image("../imagenes/modulos/asset-roles/delete.png", width: screenshot_width),
    caption: "Vista de eliminación de roles de activos"
)

Este flujo de trabajo asegura que todos los activos, sus tipos y roles estén organizados y gestionados de manera eficiente, facilitando la conformidad con las normas y regulaciones de seguridad de la información.

Para más detalles sobre otras vistas del módulo de activos, consulte la @asset-views del anexo.

== Módulo de Riesgos

El módulo de riesgos es donde se gestiona y asigna un riesgo a cada uno de los activos, evaluando su gravedad y probabilidad. Su único componente es el riesgo. Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte la @erd-risks del anexo.

=== Riesgos

Los riesgos sirven para relacionar a los activos con los controles. En los controles se definen los posibles riesgos y acá se relacionan con un activo real, detallando más a fondo cuál es el riesgo en sí y como este afecta a la información de la empresa.

=== Historias de Usuario

+ Como administrador, quiero poder asignar un riesgo a cada uno de los activos.
+ Como administrador, quiero poder editar un riesgo.
+ Como usuario, quiero poder ver el listado de riesgos.
+ Como usuario, quiero poder ver el detalle de cada riesgo.

=== Interfaz de usuario
El flujo de trabajo de un usuario en el módulo de riesgos comienza con la vista de listado de riesgos. Aquí, el usuario puede ver todos los riesgos registrados en el sistema, con detalles como el nombre del riesgo, la fecha y hora de la última actualización, y el usuario que realizó la última actualización. Desde esta vista, los administradores pueden agregar nuevos riesgos, actualizar los existentes o eliminar aquellos que ya no son relevantes.

#figure(
    image("../imagenes/modulos/risks/list.png", width: screenshot_width),
    caption: "Vista de listado de riesgos"
)

Cuando se necesita agregar un nuevo riesgo, el administrador accede a la vista de creación de riesgos. En esta interfaz, se ingresan los detalles necesarios para registrar el riesgo, como el activo y el control asociados, el título del riesgo, el responsable, la severidad, la probabilidad y el tratamiento del riesgo. Esta información es crucial para asegurar una gestión detallada y precisa de los riesgos en la organización.

#figure(
    image("../imagenes/modulos/risks/create.png", width: screenshot_width),
    caption: "Vista de creación de riesgos"
)

Una vez que el riesgo está registrado, se puede acceder a la vista de detalle de riesgos para ver toda la información relevante sobre un riesgo en particular. Esta vista muestra un desglose completo del riesgo, incluyendo el título, el responsable, la severidad, la probabilidad, el tratamiento, la fecha de creación y la última actualización. Además, se listan los activos, controles y riesgos residuales relacionados con el riesgo.

#figure(
    image("../imagenes/modulos/risks/detail.png", width: screenshot_width),
    caption: "Vista de detalle de riesgos"
)

Si es necesario actualizar la información de un riesgo, el administrador accede a la vista de modificación de riesgos. Aquí, puede editar los detalles existentes del riesgo registrado en el sistema, asegurando que la información esté siempre actualizada y precisa.

#figure(
    image("../imagenes/modulos/risks/update.png", width: screenshot_width),
    caption: "Vista de modificación de riesgos"
)

Para eliminar un riesgo, la vista de eliminación de riesgos permite confirmar la acción de eliminar un riesgo específico del sistema. Esta vista muestra un mensaje de confirmación con el nombre del riesgo a eliminar, asegurando que solo se realicen eliminaciones intencionales y evitando así errores.

#figure(
    image("../imagenes/modulos/risks/delete.png", width: screenshot_width),
    caption: "Vista de eliminación de riesgos"
)

Este flujo de trabajo asegura que todos los riesgos estén organizados y gestionados de manera eficiente, facilitando la conformidad con las normas y regulaciones de seguridad de la información.

== Módulo de Procesos

El módulo de procesos es donde se definen y gestionan los procesos. El principal propósito de los procesos es generar evidencia de que los procesos definidos en los controles del SGSI se están cumpliendo y así poder cumplir con leyes u obtener certificaciones, al momento de ser auditados. Para más detalles sobre la estructura de la base de datos y la relación entre las entidades, consulte la @erd-processes del anexo.

=== Procesos

Los procesos son conjuntos de actividades que se deben realizar para cumplir con los controles del SGSI. Cada proceso puede tener varias versiones, y cada versión puede definir una serie de actividades específicas. Los procesos son fundamentales para estructurar y organizar el cumplimiento de los requisitos del SGSI.

=== Actividades

Las actividades son acciones específicas que deben llevarse a cabo como parte de un proceso. Cada actividad tiene un objetivo claro y puede requerir la generación de entregables o evidencia de su cumplimiento. Las actividades están asignadas a grupos y sus instancias a usuarios específicos y pueden tener una recurrencia definida, es decir, pueden ser actividades recurrentes que se deben realizar periódicamente.

=== Historias de Usuario

+ Como administrador, quiero poder definir procesos, para generar evidencia de cierto control.
+ Como administrador, necesito la capacidad de versionar los procesos y establecer un flujo de publicación para gestionar adecuadamente las actualizaciones y revisiones.
+ Como usuario, quiero poder crear instancias de procesos en los cuales alguno de mis grupos esta como asignado a la primera actividad.
+ Como usuario, quiero que se me notifique al tener una actividad de una instancia de un proceso asignado.
+ Como usuario, quiero que en la página principal se muestren los procesos en los cuales estoy asignado a la primera actividad.
+ Como usuario, quiero que en la página principal se muestren los procesos en los cuales alguno de mis grupos este asignado a la primera actividad.
+ Como usuario, deseo que en la página principal se muestren las instancias de proceso en las cuales estoy asignado a al menos una instancia de actividad.

=== Interfaz de usuario

El flujo de trabajo de un usuario en el módulo de procesos comienza con la vista de listado de procesos, que presenta una lista completa de todos los procesos existentes en el sistema. Aquí, los usuarios pueden ver información relevante como el nombre del proceso, la última versión publicada, la última versión en general, la fecha y hora de la última actualización, y el usuario que realizó dicha actualización. Desde esta vista, los administradores tienen la opción de iniciar un nuevo proceso, añadir una nueva versión del proceso, actualizar la información del proceso existente o eliminarlo si ya no es necesario.

#figure(
    image("../imagenes/modulos/processes/list.png", width: screenshot_width),
    caption: "Vista de listado de procesos"
)

Cuando un administrador necesita crear un nuevo proceso, accede a la vista de creación de procesos. En esta interfaz, el administrador ingresa el nombre del nuevo proceso y guarda la información para registrarlo en el sistema.

#figure(
    image("../imagenes/modulos/processes/create.png", width: screenshot_width),
    caption: "Vista de creación de proceso"
)

Una vez que un proceso ha sido creado, se puede acceder a su vista de detalle. Esta vista proporciona información detallada sobre el proceso, como su nombre, la fecha y hora de creación, el usuario que lo creó, la fecha y hora de la última actualización, y el usuario que realizó la última actualización. Además, desde esta vista, los usuarios pueden iniciar el proceso, actualizar su información o eliminarlo.

#figure(
    image("../imagenes/modulos/processes/detail.png", width: screenshot_width),
    caption: "Vista de detalle de proceso"
)

Si es necesario actualizar un proceso, la vista de actualización permite modificar su nombre y guardar los cambios realizados.

#figure(
    image("../imagenes/modulos/processes/update.png", width: screenshot_width),
    caption: "Vista de actualización de proceso"
)

Para eliminar un proceso, la vista de eliminación presenta un mensaje de confirmación para asegurar que la acción es intencional. El administrador puede confirmar o cancelar la eliminación según sea necesario.

#figure(
    image("../imagenes/modulos/processes/delete.png", width: screenshot_width),
    caption: "Vista de eliminación de proceso"
)

Cuando se requiere crear una nueva versión de un proceso, los administradores acceden a la vista de creación de versiones de proceso. Aquí, se definen detalles como el documento en el que se basa la versión, los controles asociados, la recurrencia y el correo para notificaciones de finalización. Esta funcionalidad permite mantener el proceso actualizado y alineado con las políticas de la organización.

#figure(
    image("../imagenes/modulos/processes/version_create.png", width: screenshot_width),
    caption: "Vista de creación de versión de proceso"
)

Una vez creada, la versión de un proceso se puede ver en detalle, mostrando información relevante como el proceso al que pertenece, el documento que la define, el estado de publicación, la recurrencia y el correo de notificación. Además, desde esta vista, los administradores pueden publicar la versión, agregar actividades, actualizar la información o eliminar la versión si es necesario.

#figure(
    image("../imagenes/modulos/processes/version_detail.png", width: screenshot_width),
    caption: "Vista de detalle de versión de proceso"
)

Para mantener la versión del proceso actualizada, la vista de actualización permite modificar detalles específicos como el documento definido, los controles asociados y la recurrencia.

#figure(
    image("../imagenes/modulos/processes/version_update.png", width: screenshot_width),
    caption: "Vista de actualización de versión de proceso"
)

La publicación de una versión de proceso se confirma a través de una vista de publicación que asegura que el administrador desea proceder con la acción.

#figure(
    image("../imagenes/modulos/processes/version_publish.png", width: screenshot_width),
    caption: "Vista de publicación de versión de proceso"
)

La eliminación de una versión de proceso también se confirma mediante una vista que pregunta si realmente se desea eliminar la versión especificada, asegurando así que no se realicen eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/processes/version_delete.png", width: screenshot_width),
    caption: "Vista de eliminación de versión de proceso"
)

La creación de actividades dentro de una versión de proceso es un paso crucial. En la vista de creación de actividades, se definen los detalles necesarios como el título, la descripción, los entregables, los grupos asignados y el correo para notificaciones.

#figure(
    image("../imagenes/modulos/processes/activity_create.png", width: screenshot_width),
    caption: "Vista de creación de actividad de versión de proceso"
)

La vista de detalle de una actividad proporciona una visión completa de una actividad específica, incluyendo su título, descripción, entregables, grupos asignados y estado de finalización. Además, los administradores pueden actualizar o eliminar la actividad desde esta vista.

#figure(
    image("../imagenes/modulos/processes/activity_detail.png", width: screenshot_width),
    caption: "Vista de detalle de actividad de versión de proceso"
)

Si es necesario actualizar una actividad, la vista de actualización permite modificar la información existente, asegurando que todos los detalles sean precisos y estén actualizados.

#figure(
    image("../imagenes/modulos/processes/activity_update.png", width: screenshot_width),
    caption: "Vista de actualización de actividad de versión de proceso"
)

La eliminación de una actividad se confirma mediante una vista que pregunta si se desea eliminar la actividad seleccionada, proporcionando una capa adicional de seguridad para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/processes/activity_delete.png", width: screenshot_width),
    caption: "Vista de eliminación de actividad de versión de proceso"
)

Finalmente, la vista de listado de instancias de procesos muestra todas las instancias creadas, permitiendo a los usuarios ver detalles como el nombre, comentarios, fecha de actualización y estado de finalización. Desde esta vista, se pueden iniciar nuevas instancias o eliminar las existentes.

#figure(
    image("../imagenes/modulos/process-instances/list.png", width: screenshot_width),
    caption: "Vista de listado de instancias de procesos"
)

La creación de una nueva instancia de proceso se realiza en una vista donde se selecciona el proceso y se añaden comentarios opcionales.

#figure(
    image("../imagenes/modulos/process-instances/create.png", width: screenshot_width),
    caption: "Vista de creación de instancia de proceso"
)

La vista de detalle de la instancia de un proceso proporciona una visión completa de una instancia específica, mostrando detalles sobre la versión del proceso, comentarios, fecha de creación, actividades y su estado de finalización. Desde aquí, los administradores pueden eliminar la instancia o completar actividades.

#figure(
    image("../imagenes/modulos/process-instances/detail.png", width: screenshot_width),
    caption: "Vista de detalle de instancia de proceso"
)

Para completar una actividad dentro de una instancia de proceso, la vista de finalización permite registrar la evidencia necesaria, asegurando que todas las actividades se cumplan según los requisitos establecidos.

#figure(
    image("../imagenes/modulos/process-instances/activity_complete.png", width: screenshot_width),
    caption: "Vista de finalización de actividad de una instancia de proceso"
)

Con este flujo de trabajo, se asegura que todos los procesos y actividades estén organizados, gestionados y cumplidos de manera eficiente, facilitando la conformidad con las normas y regulaciones de seguridad de la información.

Para más detalles sobre otras vistas del módulo de procesos, consulte la @process-views del anexo.
