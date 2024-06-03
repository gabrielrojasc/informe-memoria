= Solución

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

==== Despliegue en DigitalOcean

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

El perfil de colaborador está diseñado para los empleados de la empresa que deben seguir las directrices del SGSI. Los colaboradores tienen acceso para ver toda la información relevante en la aplicación, pero sus permisos de edición están limitados a marcar como leída las versiones de los documentos. No pueden editar información ni gestionar los datos del sistema.

1. *Acceso a la Información:* Los colaboradores pueden ver toda la información del SGSI, incluyendo documentos, activos, riesgos y procesos.
2. *Lectura de Documentos:* Los colaboradores pueden acceder y leer los documentos del SGSI. Pueden marcar las versiones de documentos como leídas, registrando que han revisado la información necesaria.
3. *Participación en Procesos:* Los colaboradores pueden participar en los procesos asignados, realizando las actividades correspondientes y generando evidencia según sea necesario.

=== Administrador

El perfil de administrador está destinado a los encargados de implementar, mantener y gestionar el SGSI. Los administradores tienen permisos completos dentro del sistema, lo que incluye la creación y edición de documentos, la gestión de activos y riesgos, y la generación de evidencia. Además, los administradores también actúan como colaboradores, siguiendo las mismas directrices y participando en los procesos necesarios.

1. *Gestión de Controles y Categorías:* Los administradores pueden crear y organizar controles de seguridad y sus respectivas categorías.
2. *Subir y Versionar Documentos:* Los administradores pueden subir nuevos documentos, versionar documentos existentes y mantener un registro de las modificaciones.
3. *Aprobar Documentos:* Los administradores tienen la capacidad de aprobar documentos, asegurando su validez y conformidad con los estándares del SGSI.
4. *Gestión de Activos y Riesgos:* Los administradores pueden registrar y clasificar activos, asignar riesgos y definir los controles necesarios para mitigarlos.
5. *Definir y Supervisar Procesos:* Los administradores pueden crear y gestionar procesos, asignar actividades a los colaboradores y supervisar el cumplimiento de los procesos definidos.
6. *Generación y Gestión de Evidencia:* Los administradores pueden crear, modificar y gestionar la evidencia necesaria para demostrar la implementación y efectividad de los controles de seguridad.
7. *Auditoría y Cumplimiento:* Los administradores pueden revisar la evidencia generada, asegurar la conformidad con las políticas de seguridad y preparar el SGSI para auditorías internas y externas.

== Módulo de Usuarios

El módulo de usuarios es donde se guarda la información de los usuarios de la aplicación. Ya que el módulo de usuarios depende del módulo de autenticación proveído por Django, se agregan algunos modelos relacionados acá.

=== Historias de Usuario

1. Como administrador, deseo tener la capacidad de asignar grupos a los usuarios y, de igual manera, asignar usuarios a grupos.
2. Como administrador, quiero poder crear, editar, ver y listar los usuarios de la plataforma.

=== Modelo de datos

1. *User*: guarda los datos de los usuarios registrados.
    - `id`: identificador único del usuario.
    - `email`: el email del usuario.
    - `first_name`: el(los) nombre(s) del usuario.
    - `last_name`: el(los) apellido(s) del usuario.
    - `is_active`: indica si el usuario está activo en la aplicación.
    - `is_staff`: indica si el usuario tiene la capacidad de loguearse al sitio de administración.
    - `is_superuser`: indica si el usuario tiene todos los permisos, sin tener que asignarselos.
    - `date_joined`: fecha en la cual el usuario fue registrado.
    - `groups`: los grupos asignados al usuario.
    - `user_permissions`: los permisos asignados al usuario.

2. *Group*: guarda los datos de los grupos de la aplicación.
    - `id`: identificador único del grupo.
    - `name`: el nombre del grupo.
    - `permissions`: los permisos asociados al grupo.

3. *Permission*: guarda los datos de los permisos de la aplicación.
    - `id`: identificador único del permiso.
    - `content_type`: el tipo de contenido al cual está relacionado el permiso, donde estos son modelos de Django @django-content-type.
    - `name`: el nombre del permiso.
    - `codename`: el código del permiso.

#figure(
    image("../imagenes/models/users.png", width: 60%),
    caption: [Modelo entidad-relación módulo de usuarios],
)

=== Interfaz de usuario

==== Inicio de sesión

La aplicación presenta una interfaz de inicio de sesión diseñada para ser segura y accesible. Para Magnet, el inicio de sesión se realiza a través de Google Workspace, proporcionando una integración fluida con los servicios de Google. Esto simplifica el proceso para los usuarios que ya están familiarizados con el entorno de Google.

Sin embargo, la flexibilidad de la aplicación permite cambiar el método de autenticación mediante variables de entorno, permitiendo el uso de email y contraseña como alternativa. Esta configuración es útil en entornos donde el uso de Google Workspace no es adecuado o preferido.

Además, el registro de usuarios está estrictamente controlado. Solo los administradores de la aplicación pueden crear nuevas cuentas, lo que evita que usuarios externos se registren sin autorización. No obstante, el registro de usuarios externos también puede ser gestionado mediante variables de entorno, permitiendo configuraciones más abiertas si es necesario. Este enfoque garantiza un control preciso sobre quién puede acceder a la aplicación, mejorando la seguridad y la gestión de usuarios.

#figure(
    image("../imagenes/modulos/users/login.png", width: 80%),
    caption: [Vista de inicio de sesión],
)

==== Listado de usuarios

La vista del listado de usuarios proporciona una tabla con información detallada sobre cada usuario, incluyendo su nombre, dirección de correo electrónico, grupos y estado de la cuenta. Esta vista está diseñada para ser intuitiva y fácil de navegar, permitiendo a los administradores realizar varias acciones importantes:

1. Visualización y Búsqueda: Los administradores pueden ver todos los usuarios registrados y utilizar la barra de búsqueda para encontrar rápidamente usuarios específicos.

2. Botones de Creación, Edición, Detalle y Eliminación: La interfaz incluye botones que permiten a los administradores crear nuevos usuarios, editar la información de los existentes, ver detalles específicos de cada usuario y eliminar usuarios cuando sea necesario.

#figure(
    image("../imagenes/modulos/users/list.png", width: 80%),
    caption: [Vista de listado de usuarios],
)

==== Detalle de usuarios

La vista de detalle de usuario permite a los administradores ver y gestionar información específica de cada usuario. Esta vista incluye:

- *Información personal*: Muestra el primer nombre, apellido, correo electrónico y estado de actividad del usuario.
- *Grupos asignados*: Lista los grupos a los que pertenece el usuario, junto con el número de usuarios y permisos asociados a cada grupo.
Además, la interfaz ofrece los siguientes botones de acción:

- *Update user*: Permite editar la información del usuario.
- *Delete user*: Permite eliminar al usuario de la aplicación.
- *Update group*: Permite modificar los detalles del grupo asignado.
- *Delete group*: Permite eliminar al usuario de un grupo específico.

#figure(
    image("../imagenes/modulos/users/detail.png", width: 80%),
    caption: [Vista de detalle de usuario],
)

==== Creación de usuarios

La vista de creación de usuarios permite a los administradores añadir nuevos usuarios al sistema. Esta interfaz incluye los siguientes campos y opciones:

- *First name (optional)*: Ingrese el primer nombre del usuario.
- *Last name (optional)*: Ingrese el apellido del usuario.
- *Email address*: Ingrese la dirección de correo electrónico del usuario.
- *Active*: Active o desactive la cuenta del usuario.
- *Groups (optional)*: Asigne uno o más grupos al usuario.

Botones de acción:
- *Save*: Guarda el nuevo usuario.
- *Cancel*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/users/create.png", width: 80%),
    caption: [Vista de creación de usuario],
)

==== Actualización de usuarios

La vista de actualización de usuario permite a los administradores editar la información de un usuario. Esta interfaz incluye:

- *First name (optional)*: Editar el primer nombre del usuario.
- *Last name (optional)*: Editar el apellido del usuario.
- *Email address*: Editar la dirección de correo electrónico del usuario.
- *Active*: Activar o desactivar la cuenta del usuario.
- *Groups (optional)*: Asignar o cambiar los grupos del usuario.

Botones de acción:
- *Save*: Guarda los cambios.
- *Cancel*: Cancela la edición y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/users/update.png", width: 80%),
    caption: [Vista de actualización de usuario],
)

==== Eliminación de usuarios

La vista de eliminación de usuario permite a los administradores eliminar un usuario específico de la aplicación de forma segura y definitiva.

La pantalla incluye una confirmación clara para evitar eliminaciones accidentales:

- *Mensaje de confirmación*: Pregunta si realmente se desea eliminar el usuario especificado, mostrando su dirección de correo electrónico para asegurar que se está eliminando la cuenta correcta.
- *Botones de acción*:
  - *Confirm*: Elimina definitivamente al usuario de la aplicación.
  - *Cancel*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

Esta funcionalidad asegura que los administradores puedan gestionar y mantener la base de usuarios de manera efectiva, minimizando el riesgo de errores en el proceso de eliminación.

#figure(
    image("../imagenes/modulos/users/delete.png", width: 80%),
    caption: [Vista de eliminación de usuario],
)

==== Listado de grupos

La vista de listado de grupos permite a los administradores gestionar los grupos existentes en la aplicación. Esta vista incluye una tabla con la siguiente información:

- *Name*: El nombre del grupo.
- *Users*: El número de usuarios en el grupo.
- *Permissions*: El número de permisos asociados al grupo.

La interfaz también proporciona botones de acción:
- *Add group*: Permite crear un nuevo grupo.
- *Update group*: Permite editar un grupo existente.
- *Delete group*: Permite eliminar un grupo, con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/list.png", width: 80%),
    caption: [Vista de listado de grupos],
)

==== Detalle de grupo

La vista de detalle de grupo muestra información detallada sobre un grupo específico. Incluye:

- *Users*: Lista de usuarios que pertenecen al grupo, junto con su nombre y correo electrónico.
- *Assigned permissions*: Una lista detallada de los permisos asignados al grupo, incluyendo el nombre del permiso, el nombre de código y la aplicación/modelo asociado.

Botones de acción:
- *Update group*: Permite editar la información del grupo.
- *Delete group*: Permite eliminar el grupo, con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/detail.png", width: 80%),
    caption: [Vista de detalle de grupo],
)

==== Creación de grupo

La vista de creación de grupos permite a los administradores añadir nuevos grupos al sistema. Esta interfaz incluye los siguientes campos y opciones:

- *Name*: Ingrese el nombre del grupo.
- *Users (optional)*: Asigne uno o más usuarios al grupo.
- *Permissions (optional)*: Asigne uno o más permisos al grupo.

Botones de acción:
- *Save*: Guarda el nuevo grupo.
- *Cancel*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/groups/create.png", width: 80%),
    caption: [Vista de creación de grupo],
)

==== Actualización de grupo
La vista de actualización de grupo permite a los administradores editar la información de un grupo existente. Incluye los siguientes campos y opciones:

- *Name*: Editar el nombre del grupo.
- *Users (optional)*: Asignar o cambiar los usuarios que pertenecen al grupo.
- *Permissions (optional)*: Asignar o cambiar los permisos del grupo.

Botones de acción:
- *Save*: Guarda los cambios realizados en el grupo.
- *Cancel*: Cancela la operación y vuelve a la vista anterior sin guardar los cambios.

#figure(
    image("../imagenes/modulos/groups/update.png", width: 80%),
    caption: [Vista de actualización de grupo],
)

==== Eliminación de grupo
La vista de eliminación de grupo permite a los administradores eliminar un grupo específico de la aplicación. Incluye una confirmación clara para evitar eliminaciones accidentales:

- *Mensaje de confirmación*: Pregunta si realmente se desea eliminar el grupo especificado, mostrando su nombre para asegurar que se está eliminando el grupo correcto.
- *Botones de acción*:
  - *Confirm*: Elimina definitivamente el grupo de la aplicación.
  - *Cancel*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/groups/delete.png", width: 80%),
    caption: [Vista de eliminación de grupo],
)


== Módulo de Documentos

El módulo de documentos es donde se guarda toda la información que define al SGSI. La información se puede dividir en controles, categorías de controles, documentos y evidencia.

=== Controles

Los controles de seguridad son medidas implementadas para proteger datos e infraestructuras importantes para una organización. Cualquier tipo de salvaguarda o contramedida utilizada para evitar, detectar, contrarrestar o minimizar los riesgos de seguridad se considera un control de seguridad. Estos pueden incluir medidas técnicas como firewalls y antivirus, así como procedimientos y políticas como la formación de empleados y la gestión de accesos.

=== Categorías de Controles

Las categorías de controles son grupos de controles relacionados entre sí. Estas categorías permiten organizar y gestionar los controles de manera más efectiva, facilitando la identificación de áreas específicas de seguridad que necesitan ser abordadas. Ejemplos de categorías incluyen controles organizacionales, controles de personas, controles físicos y controles tecnológicos. Cada categoría abarca una serie de controles que cumplen con objetivos específicos dentro del SGSI.

=== Documentos

Los documentos son información registrada que respalda la implementación y gestión del SGSI. Pueden incluir políticas de seguridad, procedimientos operativos, registros de auditoría, planes de continuidad del negocio y cualquier otra información necesaria para mantener y mejorar la seguridad de la información dentro de la organización. La correcta gestión de estos documentos es crucial para asegurar la conformidad con normas y regulaciones y para facilitar la revisión y mejora continua del SGSI.

=== Evidencia

La evidencia se refiere a la documentación y pruebas tangibles que demuestran la implementación y efectividad de los controles de seguridad. Puede incluir registros de auditoría, informes de incidentes, resultados de pruebas de seguridad, registros de capacitación del personal, entre otros. La recopilación y gestión adecuada de la evidencia es esencial para demostrar la conformidad con los requisitos del SGSI y para proporcionar una base sólida para auditorías internas y externas.

=== Historias de Usuario

1. Como administrador, quiero poder crear categorías de controles para agrupar controles relacionados.
2. Como administrador, quiero poder crear controles para definir mi marco de SGSI.
3. Como administrador, quiero poder cargar todas las categorías y controles de ISO 27001 a partir de una plantilla, para tener una base al momento de implementar cada control.
4. Como administrador, quiero poder subir documentos a cada control, para definir mi implementación de dicho control.
5. Como administrador, quiero que los documentos queden versionados, para saber qué versiones han sido leídas por los usuarios y mantener un registro de modificaciones.
6. Como comité, quiero poder aprobar documentos, para validar su contenido.
7. Como usuario, quiero poder ver el listado de controles.
8. Como usuario, quiero poder ver el detalle de cada control.
9. Como usuario, quiero poder ver el detalle de cada documento.

=== Modelo de Datos

1. *ControlCategory*: guarda los datos de las categorías de controles.
    - `id`: el identificador único de la categoría.
    - `name`: el nombre de la categoría.

2. *Control*: guarda los datos de los controles.
    - `id`: el identificador único del control.
    - `category`: la categoría del control.
    - `title`: el título del control.
    - `description`: la descripción del control.

3. *Document*: guarda los datos de un documento.
    - `id`: el identificador único del documento.
    - `title`: el título del documento.
    - `description`: la descripción del documento.
    - `code`: el código del documento.
    - `documented_controls`: los controles que se encuentran documentados en el documento.
4. *DocumentVersion*: guarda los datos de las versiones de un documento.
    - `id`: el identificador único de la versión de un documento.
    - `document`: el documento al cual pertenece la versión.
    - `version`: el número de la versión.
    - `file`: el archivo de la versión.
    - `shasum`: el hash (sha256) del archivo de la versión.
    - `comment`: comentario de la versión.
    - `is_approved`: booleano indicando si la versión se encuentra aprobada.
    - `approval_evidence`: la evidencia de aprobación de la versión.
    - `approved_at`: la fecha y hora en la cual fue aprobada la versión.
    - `approved_by`: el usuario que aprobó la versión.
    - `verification_code`: código utilizado para verificar la lectura de una versión.
    - `read_by`: los usuarios que han marcado como leída la versión.

5. *DocumentVersionReadByUser*: relaciona usuarios y versiones de documentos, marcando una versión de un documento como leída.
    - `id`: el identificador único de la relación entre usuario y versión de documento.
    - `document_version`: la versión leída por el usuario.
    - `user`: el usuario que leyó la versión.

6. *Evidence*: guarda los datos de una evidencia.
    - `id`: el identificador único de la evidencia.
    - `file`: archivo de la evidencia.
    - `url`: URL de la evidencia.
    - `shasum`: el hash (sha256) del archivo o hiperenlace de la evidencia.

#figure(
    image("../imagenes/models/documents.png", height: 40%),
    caption: [Modelo entidad-relación módulo de documentos],
)

=== Interfaz de Usuario

==== Listado de Controles

La vista del listado de controles proporciona una tabla con información sobre cada control, incluyendo su nombre, categoría, fecha de actualización y el usuario que realizó la última actualización.

*Acciones disponibles:*
- *Añadir Control*: Permite a los administradores añadir nuevos controles.
- *Actualizar Control*: Permite a los administradores editar la información de los controles existentes.
- *Eliminar Control*: Permite a los administradores eliminar controles.

#figure(
    image("../imagenes/modulos/controls/list.png", width: 80%),
    caption: [Vista de listado de controles],
)

==== Detalle de Controles

La vista de detalle de controles permite a los administradores ver y gestionar información específica de cada control. Los campos más relevantes incluyen:

- *Categoría*: Categoría a la que pertenece el control.
- *Título*: Título del control.
- *Descripción*: Descripción del control.
- *Creado por*: Usuario que creó el control.
- *Actualizado por*: Usuario que realizó la última actualización.

Además, la vista muestra información sobre los documentos en los que está documentado el control, los riesgos relacionados y las evidencias asociadas.

Botones de acción:
- *Actualizar Control*: Permite editar la información del control.
- *Eliminar Control*: Permite eliminar el control.

#figure(
    image("../imagenes/modulos/controls/detail.png", width: 80%),
    caption: [Vista de detalle de controles],
)

==== Creación de Controles

La vista de creación de controles permite a los administradores añadir nuevos controles al sistema. Esta interfaz incluye:

- *Categoría (opcional)*: Selección de la categoría a la que pertenece el control.
- *Título*: Campo para ingresar el título del control.
- *Descripción (opcional)*: Campo para agregar una descripción del control.

Botones de acción:
- *Guardar*: Guarda el nuevo control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/controls/create.png", width: 80%),
    caption: [Vista de creación de controles],
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
    image("../imagenes/modulos/controls/update.png", width: 80%),
    caption: [Vista de actualización de controles],
)

==== Eliminación de Controles

La vista de eliminación de controles permite a los administradores eliminar un control específico de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el control especificado, mostrando su nombre para asegurar que se está eliminando el control correcto.

Botones de acción:
- *Confirmar*: Elimina definitivamente el control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/controls/delete.png", width: 80%),
    caption: [Vista de eliminación de controles],
)

==== Listado de Categorías de Controles

La vista del listado de categorías de controles proporciona una tabla con información sobre cada categoría de control, incluyendo su nombre, fecha de actualización y el usuario que realizó la última actualización.

*Acciones disponibles:*
- *Añadir Categoría de Control*: Permite a los administradores añadir nuevas categorías de control.
- *Actualizar Categoría de Control*: Permite a los administradores editar la información de las categorías de control existentes.
- *Eliminar Categoría de Control*: Permite a los administradores eliminar categorías de control.

#figure(
    image("../imagenes/modulos/control-categories/list.png", width: 80%),
    caption: [Vista de listado de categorías de controles],
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
    image("../imagenes/modulos/control-categories/detail.png", width: 80%),
    caption: [Vista de detalle de categorías de controles],
)

==== Creación de Categorías de Controles

La vista de creación de categorías de controles permite a los administradores añadir nuevas categorías de control al sistema. Esta interfaz incluye:

- *Nombre*: Campo para ingresar el nombre de la categoría de control.

Botones de acción:
- *Guardar*: Guarda la nueva categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/create.png", width: 80%),
    caption: [Vista de creación de categorías de controles],
)

==== Actualización de Categorías de Controles

La vista de actualización de categorías de controles permite a los administradores editar la información de una categoría de control existente. Esta interfaz incluye:

- *Nombre*: Campo para editar el nombre de la categoría de control.

Botones de acción:
- *Guardar*: Guarda los cambios realizados en la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/update.png", width: 80%),
    caption: [Vista de actualización de categorías de controles],
)

==== Eliminación de Categorías de Controles

La vista de eliminación de categorías de controles permite a los administradores eliminar una categoría específica de control de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la categoría de control especificada, mostrando su nombre para asegurar que se está eliminando la categoría correcta.

Botones de acción:
- *Confirmar*: Elimina definitivamente la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/delete.png", width: 80%),
    caption: [Vista de eliminación de categorías de controles],
)

==== Listado de Documentos

La vista del listado de documentos proporciona una tabla con información sobre cada documento, incluyendo su nombre, la última versión aprobada, la última versión, la fecha de actualización y el usuario que realizó la última actualización.

*Acciones disponibles:*
- *Añadir Documento*: Permite a los administradores añadir nuevos documentos.
- *Editar Documento*: Permite a los administradores editar la información de los documentos existentes.
- *Eliminar Documento*: Permite a los administradores eliminar documentos.

#figure(
    image("../imagenes/modulos/documents/list.png", width: 80%),
    caption: [Vista de listado de documentos],
)

==== Detalle de Documentos

La vista de detalle de documentos permite a los administradores ver y gestionar información específica de cada documento, incluyendo su título, código, descripción, fechas de creación y actualización, y los usuarios responsables.

*Acciones disponibles:*
- *Actualizar Documento*: Permite editar la información del documento.
- *Eliminar Documento*: Permite eliminar el documento.

La sección de versiones del documento proporciona información sobre cada versión, su estado de aprobación, y las fechas y usuarios de actualización.

*Acciones en versiones:*
- *Actualizar Versión*: Editar la versión del documento.
- *Aprobar Versión*: Aprobar la versión del documento.
- *Eliminar Versión*: Eliminar la versión del documento.

#figure(
    image("../imagenes/modulos/documents/detail.png", width: 80%),
    caption: [Vista de detalle de documentos],
)

==== Adición de Documentos

La vista de creación de documentos permite a los administradores añadir nuevos documentos al sistema. Esta interfaz incluye los siguientes campos:

- *Título*: El título del documento.
- *Código*: El código del documento.
- *Descripción (opcional)*: Una breve descripción del documento.
- *Controles documentados (opcional)*: Los controles que están documentados en el documento.

Botones de acción:
- *Guardar*: Guarda el nuevo documento.
- *Cancelar*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/documents/create.png", width: 80%),
    caption: [Vista de creación de documentos],
)

==== Eliminación de Documentos

La vista de eliminación de documentos permite a los administradores eliminar un documento específico de la aplicación de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el documento especificado, mostrando su nombre para asegurar que se está eliminando el documento correcto.

Botones de acción:
- *Confirmar*: Elimina definitivamente el documento de la aplicación.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/delete.png", width: 80%),
    caption: [Vista de eliminación de documentos],
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
    image("../imagenes/modulos/documents/version_detail.png", width: 80%),
    caption: [Vista de detalle de versión de documentos],
)

==== Creación de Versión de Documentos

La vista de creación de versiones de documentos permite a los administradores añadir una nueva versión a un documento existente. Esta interfaz incluye:

- *Archivo*: Campo para subir el archivo de la nueva versión.
- *Comentario (opcional)*: Campo para agregar comentarios sobre la nueva versión.

Botones de acción:
- *Guardar*: Guarda la nueva versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_create.png", width: 80%),
    caption: [Vista de creación de versiones de documentos],
)

==== Aprobación de Versión de Documentos

La vista de aprobación de versiones de documentos permite a los administradores aprobar una versión específica de un documento. Esta interfaz incluye los siguientes campos opcionales:

- *Archivo de evidencia*: Archivo con la evidencia de la aprobación.
- *URL de evidencia*: Enlace a la evidencia de la aprobación.

Botones de acción:
- *Aprobar*: Aprueba la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_approve.png", width: 80%),
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
    image("../imagenes/modulos/documents/version_update.png", width: 80%),
    caption: [Vista de actualización de versiones de documentos],
)

==== Eliminación de Versión de Documentos

La vista de eliminación de versiones de documentos permite a los administradores eliminar una versión específica de un documento de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la versión especificada del documento, mostrando su nombre para asegurar que se está eliminando la versión correcta.

Botones de acción:
- *Confirmar*: Elimina definitivamente la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_delete.png", width: 80%),
    caption: [Vista de eliminación de versiones de documentos],
)


== Módulo de Activos

El módulo de activos es donde se preserva un inventario con todos los activos de la empresa pertinentes a la seguridad de la información. Su principal componente son los activos y los tipos de activos.

=== Tipos de activos

Los tipos de activos son para poder clasificar a los activos por su tipo, por ejemplo, aplicaciones, equipos informáticos, oficinas, entre otros.

=== Activos

Los activos son cualquier recurso que sea valioso para la organización y que necesite protección. Pueden incluir hardware, software, datos, personas, instalaciones y cualquier otro elemento que pueda tener un impacto en la seguridad de la información.

=== Historias de Usuario

1. Como administrador, quiero poder registrar activos de la empresa, para luego definir su riesgo asociado.
2. Como usuario, quiero poder ver el listado de activos.
3. Como usuario, quiero poder ver el detalle de cada activo.

=== Modelo de Datos

1. *AssetType*: guarda los datos de un tipo de activo.
    - `id`: el identificador único.
    - `name`: el nombre del tipo de activo.
    - `description`: la descripción del tipo de activo.

2. *Asset*: guarda los datos de un activo.
    - `id`: el identificador único.
    - `owner`: el dueño del activo.
    - `code`: el código único del activo.
    - `name`: el nombre del activo.
    - `description`: la descripción del activo.
    - `asset_type`: el tipo de activo.
    - `criticality`: la criticidad del activo, que puede ser `muy baja`, `baja`, `media`, `alta` o `muy alta`.
    - `classification`: la clasificación del activo, que puede ser `pública`, `interna` o `privada`.
    - `is_archived`: indica si el activo está actualmente archivado.

#figure(
    image("../imagenes/models/assets.png", height: 30%),
    caption: [Modelo entidad-relación módulo de activos],
)

=== Interfaz de usuario

==== Listado de Tipos de Activos

La vista del listado de tipos de activos proporciona una tabla con información sobre cada tipo de activo, incluyendo su nombre, fecha de actualización y el usuario que realizó la última actualización.

*Acciones disponibles:*
- *Añadir Tipo de Activo*: Permite a los administradores añadir nuevos tipos de activos.
- *Actualizar Tipo de Activo*: Permite a los administradores editar la información de los tipos de activos existentes.
- *Eliminar Tipo de Activo*: Permite a los administradores eliminar tipos de activos.

#figure(
    image("../imagenes/modulos/asset-types/list.png", width: 80%),
    caption: [Vista de listado de tipos de activos],
)

==== Detalle de Tipos de Activos

La vista de detalle de un tipo de activo muestra información específica sobre un tipo de activo en particular. Esta vista incluye los campos más relevantes:

- *Nombre*: El nombre del tipo de activo.
- *Creado el*: La fecha y hora en que se creó el tipo de activo.
- *Creado por*: El usuario que creó el tipo de activo.
- *Actualizado el*: La fecha y hora de la última actualización del tipo de activo.
- *Actualizado por*: El usuario que realizó la última actualización del tipo de activo.

*Acciones disponibles:*
- *Actualizar Tipo de Activo*: Permite editar la información del tipo de activo.
- *Eliminar Tipo de Activo*: Permite eliminar el tipo de activo.

#figure(
    image("../imagenes/modulos/asset-types/detail.png", width: 80%),
    caption: [Vista de detalle de tipos de activos],
)

==== Creación de Tipos de Activos

La vista de creación de tipos de activos permite a los administradores añadir nuevos tipos de activos al sistema. Esta interfaz incluye:

- *Nombre*: Campo para ingresar el nombre del tipo de activo.

Botones de acción:
- *Guardar*: Guarda el nuevo tipo de activo.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/asset-types/create.png", width: 80%),
    caption: [Vista de creación de tipos de activos],
)

==== Modificación de Tipos de Activos

La vista de modificación de un tipo de activo permite al usuario actualizar la información existente sobre un tipo de activo específico. Esta vista incluye los siguientes campos:

- *Nombre*: El nombre del tipo de activo.

*Acciones disponibles:*
- *Guardar*: Guarda los cambios realizados en el tipo de activo.
- *Cancelar*: Cancela los cambios y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/asset-types/update.png", width: 80%),
    caption: [Vista de modificación de tipos de activos],
)

==== Eliminación de Tipos de Activos

La vista de eliminación de un tipo de activo confirma la eliminación del tipo de activo seleccionado. Esta vista presenta un mensaje de confirmación para asegurar que el usuario desea proceder con la acción de eliminación. Los elementos incluidos son:

- *Mensaje de confirmación*: Pregunta al usuario si está seguro de querer eliminar el tipo de activo.
- *Botón Confirmar*: Procede con la eliminación del tipo de activo.
- *Botón Cancelar*: Cancela la acción de eliminación y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/asset-types/delete.png", width: 80%),
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
    image("../imagenes/modulos/asset-types/list.png", width: 80%),
    caption: [Vista de listado de activos],
)

==== Detalle de Activos

La vista de detalle de un activo muestra información específica sobre un activo en particular. Esta vista incluye los campos más relevantes:

- *Código*: El identificador único del activo.
- *Nombre*: El nombre del activo.
- *Propietario*: El usuario responsable del activo.
- *Tipo*: El tipo al que pertenece el activo.
- *Criticidad*: El nivel de criticidad del activo.
- *Clasificación*: La clasificación del activo según su sensibilidad.

*Acciones disponibles:*
- *Archivar*: Permite archivar el activo.
- *Actualizar Activo*: Permite editar la información del activo.

#figure(
    image("../imagenes/modulos/assets/detail.png", width: 80%),
    caption: [Vista de detalle de activos],
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

*Acciones disponibles:*
- *Guardar*: Permite guardar el nuevo activo en el sistema.
- *Cancelar*: Permite cancelar la creación del activo y regresar a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/create.png", width: 80%),
    caption: [Vista de creación de activos],
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

*Acciones disponibles:*
- *Guardar*: Permite guardar los cambios realizados en el activo.
- *Cancelar*: Permite cancelar la edición y regresar a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/update.png", width: 80%),
    caption: [Vista de modificación de activos],
)

==== Archivado de Activos

La vista de archivado de un activo permite confirmar la acción de archivar un activo específico. Los campos más relevantes y acciones disponibles son los siguientes:

- *Mensaje de confirmación*: Indica si el usuario está seguro de querer archivar el activo seleccionado.
- *Nombre del Activo*: Se muestra el nombre del activo a archivar.

*Acciones disponibles:*
- *Archivar*: Confirma la acción de archivar el activo.
- *Cancelar*: Cancela la acción de archivado y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/assets/archive.png", width: 80%),
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

=== Modelo de Datos

1. *Risk*: guarda los datos de un riesgo.
   - `id`: el identificador único.
   - `assets`: los activos para el cual existe el riesgo.
   - `controls`: los controles asociados al riesgo.
   - `title`: el título del riesgo.
   - `description`: la descripción del riesgo.
   - `responsible`: el responsable del riesgo.
   - `severity`: la gravedad del riesgo, que puede ser `muy baja`, `baja`, `media`, `alta` o `muy alta`.
   - `likelihood`: la probabilidad de que se materialice el riesgo, que puede ser `muy baja`, `baja`, `media`, `alta` o `muy alta`.
   - `treatment`: el tratamiento que se le dará al riesgo, que puede ser `mitigar`, `transferir`, `aceptar` o `eliminar`.
   - `residual_risk`: el riesgo residual del riesgo.

#figure(
    image("../imagenes/models/risks.png", height: 35%),
    caption: [Modelo entidad-relación módulo de riesgos],
)

=== Interfaz de usuario

==== Listado de Riesgos

La vista de listado de riesgos muestra una tabla con los riesgos existentes en el sistema. Los campos más relevantes y las acciones disponibles en esta vista son:

- *Nombre*: El nombre del riesgo.
- *Actualizado el*: La fecha y hora de la última actualización del riesgo.
- *Actualizado por*: El usuario que realizó la última actualización del riesgo.

*Acciones disponibles:*
- *Añadir Riesgo*: Permite agregar un nuevo riesgo al sistema.
- *Actualizar Riesgo*: Permite editar la información de un riesgo existente.
- *Eliminar Riesgo*: Permite eliminar un riesgo del sistema.

#figure(
    image("../imagenes/modulos/risks/list.png", width: 80%),
    caption: [Vista de listado de riesgos],
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

*Acciones disponibles:*
- *Actualizar Riesgo*: Permite editar la información del riesgo.
- *Eliminar Riesgo*: Permite eliminar el riesgo del sistema.

#figure(
    image("../imagenes/modulos/risks/detail.png", width: 80%),
    caption: [Vista de detalle de riesgos],
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

*Acciones disponibles:*
- *Guardar*: Permite registrar el nuevo riesgo en el sistema.
- *Cancelar*: Permite cancelar la creación del riesgo.

#figure(
    image("../imagenes/modulos/risks/create.png", width: 80%),
    caption: [Vista de creación de riesgos],
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

*Acciones disponibles:*
- *Guardar*: Permite registrar los cambios realizados en el riesgo.
- *Cancelar*: Permite cancelar la modificación del riesgo.

#figure(
    image("../imagenes/modulos/risks/update.png", width: 80%),
    caption: [Vista de modificación de riesgos],
)

==== Eliminar Riesgo

La vista para eliminar un riesgo permite confirmar la eliminación de un riesgo específico del sistema. Esta vista muestra un mensaje de confirmación con el nombre del riesgo a eliminar.

*Acciones disponibles:*
- *Confirmar*: Permite proceder con la eliminación del riesgo.
- *Cancelar*: Permite cancelar la eliminación del riesgo.

#figure(
    image("../imagenes/modulos/risks/delete.png", width: 80%),
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

=== Modelo de Datos

1. *Process*: guarda los datos de un proceso.
   - `id`: el identificador único.
   - `name`: el nombre de la definición de un proceso.

2. *ProcessVersion*: guarda los datos de una versión de un proceso.
   - `id`: el identificador único.
   - `process`: el proceso al cual pertenece la versión.
   - `version`: el número de la versión del proceso.
   - `defined_in`: el documento en el cual está definido el proceso.
   - `controls`: los controles para los cuales se genera la evidencia al completar las actividades de la versión.
   - `comment_label`: la etiqueta para el comentario de una instancia del proceso.
   - `recurrency`: la periodicidad con la cual sé instancia el proceso, que puede ser `diariamente`, `semanalmente`, `mensualmente`, `trimestralmente`, `semi anualmente` o `anualmente`.
   - `is_published`: indica si la versión está publicada.
   - `published_at`: la fecha y hora en la cual se publicó la versión.
   - `published_by`: el usuario que publico la versión.

3. *ProcessActivity*: guarda los datos de una actividad.
   - `id`: el identificador único.
   - `process_version`: la versión del proceso a la cual pertenece la actividad.
   - `order`: el orden respecto a otras actividades de una versión de un proceso.
   - `description`: la descripción de la actividad a realizar.
   - `asignee_group`: el grupo de usuarios entre los cuales se puede asignar la actividad cuando se inicia una instancia de esta.
   - `email_to_notify`: el email al cual se debe notificar cuando se inicie una instancia de la actividad.

4. *ProcessInstance*:
   - `id`: el identificador único.
   - `process_version`: la versión del proceso usada para su instancia.
   - `comment`: el comentario con el cual se inició la instancia del proceso.
   - `is_completed`: booleano que representa si la instance del proceso fue completada.
   - `completed_at`: fecha y hora en la cual fue completada la instancia del proceso.

5. *ProcessActivityInstance*:
   - `id`: el identificador único.
   - `process_instance`: la instancia de un proceso a la cual esta asociada la instancia de la actividad.
   - `activity`: la actividad de la versión del proceso usada para su instancia.
   - `asignee`: el usuario encargado de realizar la actividad.
   - `is_completed`: booleano que representa si la actividad fue completada.
   - `completed_at`: fecha y hora en la cual fue completada la actividad.
   - `evidence`: la evidencia generada a partir de la actividad.

#figure(
    image("../imagenes/models/processes.png", height: 40%),
    caption: [Modelo entidad-relación módulo de procesos],
)

=== Interfaz de usuario

...