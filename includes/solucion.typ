= Solución

El sistema desarrollado tiene como objetivo principal facilitar la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) de una empresa, siguiendo los estándares de la norma ISO 27001. Para lograr esto, se han definido varios módulos, cada uno con su conjunto de funcionalidades específicas. A continuación, se detalla la funcionalidad, historias de usuario y modelo de datos utilizado para cada uno de estos módulos: documentos, activos, riesgos y procesos.

== Tecnologías escogidas

La solución se adapta de manera efectiva para abordar desafíos relacionados con la escalabilidad, el rendimiento y la seguridad del sistema, incorporando consideraciones específicas en su diseño y arquitectura.

En términos de escalabilidad, si bien el proyecto no está inicialmente diseñado para manejar un gran flujo de usuarios, la implementación en contenedores Docker permite una fácil replicación y despliegue detrás de un balanceador de carga. Esto facilita la escalabilidad horizontal, permitiendo la adición de nuevos contenedores según sea necesario. Para la gestión de datos, la escalabilidad vertical de la base de datos PostgreSQL y la opción de utilizar réplicas para lectura proporcionan una respuesta eficiente a posibles aumentos en la carga de datos.

En cuanto al rendimiento, la elección de tecnologías robustas y bien probadas, como Django, PostgreSQL y Typescript, proporciona una base sólida. La experiencia previa con sistemas similares garantiza que el escalamiento de la aplicación sea un proceso manejable, respaldado por las mejores prácticas y lecciones aprendidas de implementaciones anteriores.

La interoperabilidad entre las tecnologías utilizadas se ve respaldada por la compatibilidad inherente de Django con PostgreSQL y la elección de Typescript como lenguaje en el frontend. Además, se planea seguir estándares y prácticas documentadas para asegurar una integración fluida, aprovechando la documentación existente como guía.

La elección de Django junto con HTML y CSS se justifica por la naturaleza estática de los datos, donde los cambios no son frecuentes. En este contexto, una biblioteca de frontend como React no aportaría un beneficio significativo, ya que la actualización dinámica de la interfaz de usuario no es una prioridad, lo que hace que la simplicidad y la eficiencia de HTML y CSS sean suficientes para cumplir con los requisitos del proyecto.

== Perfiles de usuario del sistema

=== Colaborador

El perfil de colaborador está diseñado para los empleados de la empresa que deben seguir las directrices del SGSI. Los colaboradores tienen acceso para ver toda la información relevante en la aplicación, pero sus permisos de edición están limitados a marcar como leída las versiones de los documentos. No pueden editar información ni gestionar los datos del sistema.

1. *Acceso a la Información:* Los colaboradores pueden ver toda la información del SGSI, incluyendo documentos, activos, riesgos y procesos.
2. *Lectura de Documentos:* Los colaboradores pueden acceder y leer los documentos del SGSI. Pueden marcar las versiones de documentos como leídas, registrando que han revisado la información necesaria.
// 3. *Participación en Procesos:* Los colaboradores pueden participar en los procesos asignados, realizando las actividades correspondientes y generando evidencia según sea necesario.
// 4. *Generación de Evidencia:* Aunque no pueden crear ni modificar la evidencia, los colaboradores participan en la generación de evidencia a través de la realización de actividades asignadas en los procesos.

=== Administrador

El perfil de administrador está destinado a los encargados de implementar, mantener y gestionar el SGSI. Los administradores tienen permisos completos dentro del sistema, lo que incluye la creación y edición de documentos, la gestión de activos y riesgos, y la generación de evidencia. Además, los administradores también actúan como colaboradores, siguiendo las mismas directrices y participando en los procesos necesarios.

1. *Gestión de Controles y Categorías:* Los administradores pueden crear y organizar controles de seguridad y sus respectivas categorías.
2. *Subir y Versionar Documentos:* Los administradores pueden subir nuevos documentos, versionar documentos existentes y mantener un registro de las modificaciones.
3. *Aprobar Documentos:* Los administradores tienen la capacidad de aprobar documentos, asegurando su validez y conformidad con los estándares del SGSI.
4. *Gestión de Activos y Riesgos:* Los administradores pueden registrar y clasificar activos, asignar riesgos y definir los controles necesarios para mitigarlos.
5. *Definir y Supervisar Procesos:* Los administradores pueden crear y gestionar procesos, asignar actividades a los colaboradores y supervisar el cumplimiento de los procesos definidos.
6. *Generación y Gestión de Evidencia:* Los administradores pueden crear, modificar y gestionar la evidencia necesaria para demostrar la implementación y efectividad de los controles de seguridad.
7. *Auditoría y Cumplimiento:* Los administradores pueden revisar la evidencia generada, asegurar la conformidad con las políticas de seguridad y preparar el SGSI para auditorías internas y externas.


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

#figure(
    image("../imagenes/models/documents.png", height: 40%),
    caption: [Modelo entidad-relación módulo de documentos],
)

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

=== Interfaz de usuario

...


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

#figure(
    image("../imagenes/models/assets.png", height: 30%),
    caption: [Modelo entidad-relación módulo de activos],
)

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

== Módulo de Riesgos

El módulo de riesgos es donde se gestiona y asigna un riesgo a cada uno de los activos, evaluando su gravedad y probabilidad. Su único componente es el riesgo.

=== Riesgos

Los riesgos sirven para relacionar a los activos con los controles. En los controles se definen los posibles riesgos y acá se relacionan con un activo real, detallando más a fondo cuál es el riesgo en sí y como este afecta a la información de la empresa.

=== Historias de Usuario

1. Como administrador, quiero poder asignar un riesgo a cada uno de los activos.
2. Como administrador, quiero poder ver el listado de riesgos.
3. Como administrador, quiero poder ver el detalle de cada riesgo.

=== Modelo de Datos

#figure(
    image("../imagenes/models/risks.png", height: 35%),
    caption: [Modelo entidad-relación módulo de riesgos],
)

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

=== Interfaz de usuario

...


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

#figure(
    image("../imagenes/models/processes.png", height: 40%),
    caption: [Modelo entidad-relación módulo de procesos],
)

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

=== Interfaz de usuario

...