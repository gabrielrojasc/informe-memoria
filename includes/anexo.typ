== Modelo de datos módulo de Usuarios <erd-users>

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

== Modelo de Datos módulo de Documentos <erd-documents>

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

== Modelo de Datos módulo de Activos <erd-assets>

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

== Modelo de Datos módulo de riesgos <erd-risks>

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

== Modelo de Datos módulo de procesos <erd-processes>

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