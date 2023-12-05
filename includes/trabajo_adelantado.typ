= Trabajo Adelantado
== Historias de Usuario para el Módulo de Documentos:
El módulo de documentos se concibe como una herramienta fundamental para gestionar las políticas establecidas por ISO27001 en la plataforma. A continuación, se presentan las historias de usuario que delinean las funcionalidades clave que los usuarios pueden esperar del sistema:

1. Como usuario, quiero tener todos los documentos/políticas impuestas por ISO27001 precargadas:
  - *Descripción:* Los usuarios deben tener precargados los documentos/políticas de ISO27001, donde cada empresa defina si adoptará o no esa política y cómo la cumplirá.
  - *Criterios de Aceptación:*
    - Los documentos/políticas de ISO27001 están disponibles para referencia.
    - Las empresas pueden indicar su estado de adopción para cada política.

2. Como usuario, quiero poder subir documentos:
  - *Descripción:* Los usuarios deben poder cargar documentos para cada política.
  - *Criterios de Aceptación:*
    - Los usuarios pueden cargar documentos y asociarlos con políticas específicas de ISO27001.
    - Se admiten formatos comunes de documentos, como PDF, Word, entre otros.
    - Los documentos cargados se almacenan de forma segura.

3. Como usuario, quiero poder versionar documentos:
  - *Descripción:* El sistema debe mantener un historial de versiones para cada documento cargado con un hash.
  - *Criterios de Aceptación:*
    - Cada documento tiene un historial de versiones.
    - Los cambios en un documento crean una nueva versión con un hash único.
    - Los usuarios pueden ver versiones anteriores del documento.

4. Como usuario, quiero recibir notificaciones sobre cambios en los documentos:
  - *Descripción:* Los usuarios deben ser notificados cuando se hagan cambios a los documentos que tienen asignados que siguen.
  - *Criterios de Aceptación:*
    - Los usuarios reciben notificaciones sobre cambios en los documentos que se les han asignado o que siguen.
    - Las notificaciones incluyen información sobre la naturaleza del cambio.

5. Como usuario, quiero poder aprobar o solicitar cambios en documentos:
  - *Descripción:* Los usuarios autorizados deben poder aprobar o solicitar cambios en documentos propuestos.
  - *Criterios de Aceptación:*
    - Los usuarios autorizados pueden revisar y aprobar/rechazar cambios propuestos.
    - Los usuarios pueden proporcionar comentarios o retroalimentación al solicitar cambios.

== Modelos de Entidad-Relación Simplificados para el Módulo de Documentos:
Para respaldar estas funcionalidades, se han diseñado modelos de entidad-relación que capturan la esencia de la gestión documental en el contexto de ISO27001. A continuación, se detallan los modelos simplificados:

1. Política ISO27001 (Policy):
  - *Atributos:*
    - `id`
    - `title` Char(255)
    - `content` Text
    - `framework` Char(255)
    - `applicable` Boolean

2. Documento (Document):
  - *Atributos:*
    - `id`
    - `title` Char(255)
    - `file` File
    - `version` Integer
    - `hash` Char(255)
    - `approved` Boolean
    - `policy_id` (FK a Policy)
    - `uploaded_by` (FK a User)

Ambos modelos mencionados heredan de un modelo base, llamado BaseModel, que proporciona la estructura temporal con los siguientes atributos:
- BaseModel:
  - `created_at` DateTime
  - `updated_at` DateTime

Estos modelos proporcionan la base sólida para la implementación del módulo de documentos en la plataforma, permitiendo una gestión eficiente y estructurada de las políticas y documentos relacionados con ISO27001.