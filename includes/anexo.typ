#let screenshot_width = 60%

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

== Vistas módulo de Usuarios <user-views>
=== Eliminación de Usuario

La vista de eliminación de usuario permite a los administradores borrar una cuenta de usuario existente del sistema. Esta acción es crítica y debe realizarse con precaución, ya que la eliminación de un usuario no puede deshacerse.

*Confirmación de Eliminación*: Se muestra un mensaje de confirmación para asegurar que la eliminación del usuario es intencional y evitar la eliminación accidental de datos importantes.

_Acciones disponibles:_
- *Confirmar:* Permite proceder con la eliminación del usuario.
- *Cancelar:* Permite cancelar la operación de eliminación.

#figure(
    image("../imagenes/modulos/users/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de usuario],
)

=== Creación de grupo

La vista de creación de grupos permite a los administradores añadir nuevos grupos al sistema. Esta interfaz incluye los siguientes campos y opciones:

- *Nombre*: Ingrese el nombre del grupo.
- *Usuarios (opcional)*: Asigne uno o más usuarios al grupo.
- *Permisos (opcional)*: Asigne uno o más permisos al grupo.

_Botones de acción:_
- *Guardar*: Guarda el nuevo grupo.
- *Cancelar*: Cancela la creación y vuelve a la vista anterior.

#figure(
    image("../imagenes/modulos/groups/create.png", width: screenshot_width),
    caption: [Vista de creación de grupo],
)

=== Detalle de grupo

La vista de detalle de grupo muestra información detallada sobre un grupo específico. Incluye:

- *Usuarios*: Lista de usuarios que pertenecen al grupo, junto con su nombre y correo electrónico.
- *Permisos asignados*: Una lista detallada de los permisos asignados al grupo, incluyendo el nombre del permiso, el nombre de código y la aplicación/modelo asociado.

_Botones de acción:_
- *Actualizar grupo*: Permite editar la información del grupo.
- *Eliminar grupo*: Permite eliminar el grupo, con confirmación para evitar eliminaciones accidentales.

#figure(
    image("../imagenes/modulos/groups/detail.png", width: screenshot_width),
    caption: [Vista de detalle de grupo],
)

=== Actualización de grupo

La vista de actualización de grupo permite a los administradores editar la información de un grupo existente. Incluye los siguientes campos y opciones:

- *Nombre*: Editar el nombre del grupo.
- *Ususarios (opcional)*: Asignar o cambiar los usuarios que pertenecen al grupo.
- *Permisos (opcional)*: Asignar o cambiar los permisos del grupo.

_Botones de acción:_
- *Guardar*: Guarda los cambios realizados en el grupo.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin guardar los cambios.

#figure(
    image("../imagenes/modulos/groups/update.png", width: screenshot_width),
    caption: [Vista de actualización de grupo],
)

=== Eliminación de Grupos

La vista de eliminación de grupos permite eliminar un grupo específico del sistema, garantizando que los usuarios y roles asociados se manejen adecuadamente antes de la eliminación final. Esta funcionalidad es esencial para mantener la estructura organizativa actualizada y precisa dentro del SGSI.

*Confirmación de Eliminación*: Se muestra un mensaje de confirmación para asegurar que la eliminación del grupo es intencional y evitar la eliminación accidental de datos importantes.

_Acciones disponibles:_
- *Confirmar*: Permite proceder con la eliminación del grupo seleccionado.
- *Cancelar*: Permite cancelar el proceso de eliminación y regresar a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/groups/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de grupo],
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

== Vistas modulo de Documentos <document-views>
==== Eliminación de Controles

La vista de eliminación de controles permite a los administradores eliminar un control específico de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el control especificado, mostrando su nombre para asegurar que se está eliminando el control correcto.

_Botones de acción:_
- *Confirmar*: Elimina definitivamente el control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/controls/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de controles],
)

==== Detalle de Categorías de Controles

La vista de detalle de categorías de controles permite a los administradores ver y gestionar información específica de cada categoría de control. Los campos más relevantes incluyen:

- *Nombre*: Nombre de la categoría de control.
- *Creado por*: Usuario que creó la categoría de control.
- *Actualizado por*: Usuario que realizó la última actualización.

Además, la vista muestra los controles relacionados con esta categoría.

_Botones de acción:_
- *Actualizar Categoría de Control*: Permite editar la información de la categoría de control.
- *Eliminar Categoría de Control*: Permite eliminar la categoría de control.

#figure(
    image("../imagenes/modulos/control-categories/detail.png", width: screenshot_width),
    caption: [Vista de detalle de categorías de controles],
)

==== Actualización de Categorías de Controles

La vista de actualización de categorías de controles permite a los administradores editar la información de una categoría de control existente. Esta interfaz incluye:

- *Nombre*: Campo para editar el nombre de la categoría de control.

_Botones de acción:_
- *Guardar*: Guarda los cambios realizados en la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/update.png", width: screenshot_width),
    caption: [Vista de actualización de categorías de controles],
)

==== Eliminación de Categorías de Controles

La vista de eliminación de categorías de controles permite a los administradores eliminar una categoría específica de control de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la categoría de control especificada, mostrando su nombre para asegurar que se está eliminando la categoría correcta.

_Botones de acción:_
- *Confirmar*: Elimina definitivamente la categoría de control.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/control-categories/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de categorías de controles],
)

==== Eliminación de Documentos

La vista de eliminación de documentos permite a los administradores eliminar un documento específico de la aplicación de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar el documento especificado, mostrando su nombre para asegurar que se está eliminando el documento correcto.

_Botones de acción:_
- *Confirmar*: Elimina definitivamente el documento de la aplicación.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de documentos],
)

==== Actualización de Versión de Documentos

La vista de actualización de versiones de documentos permite a los administradores actualizar la información de una versión específica de un documento. Los campos más relevantes incluyen:

- *Autor*: Autor de la versión del documento.
- *Archivo actual*: Enlace al archivo de la versión actual del documento.
- *Cambiar archivo*: Opción para subir un nuevo archivo si es necesario.
- *URL del archivo (opcional)*: Enlace opcional al archivo de la versión del documento.
- *Comentario (opcional)*: Campo para agregar comentarios sobre la actualización de la versión del documento.

_Botones de acción:_
- *Guardar*: Permite guardar los cambios realizados en la versión del documento.
- *Cancelar*: Permite cancelar la operación de actualización y volver a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_update.png", width: screenshot_width),
    caption: [Vista de actualización de versión de documentos],
)

==== Eliminación de Versión de Documentos

La vista de eliminación de versiones de documentos permite a los administradores eliminar una versión específica de un documento de forma segura y definitiva.

- *Confirmación*: Se presenta un mensaje claro preguntando si realmente se desea eliminar la versión especificada del documento, mostrando su nombre para asegurar que se está eliminando la versión correcta.

_Botones de acción:_
- *Confirmar*: Elimina definitivamente la versión del documento.
- *Cancelar*: Cancela la operación y vuelve a la vista anterior sin realizar cambios.

#figure(
    image("../imagenes/modulos/documents/version_delete.png", width: screenshot_width),
    caption: [Vista de eliminación de versiones de documentos],
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

== Vistas modulo de Activos <asset-views>
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

==== Eliminación de Tipos de Activos

La vista de eliminación de un tipo de activo confirma la eliminación del tipo de activo seleccionado. Esta vista presenta un mensaje de confirmación para asegurar que el usuario desea proceder con la acción de eliminación. Los elementos incluidos son:

- *Mensaje de confirmación*: Pregunta al usuario si está seguro de querer eliminar el tipo de activo.
- *Botón Confirmar*: Procede con la eliminación del tipo de activo.
- *Botón Cancelar*: Cancela la acción de eliminación y regresa a la vista anterior.

#figure(
    image("../imagenes/modulos/asset-types/delete.png", width: screenshot_width),
    caption: [Vista de eliminación de tipos de activos],
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

== Vistas modulo de procesos <process-views>
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
