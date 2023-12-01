#import "@preview/timeliney:0.0.1"

= Plan de Trabajo
// Dar una lista de los pasos que se va a seguir para desarrollar la solución propuesta. La lista debería contemplar la evaluación del trabajo.
// Para el informe final, se recomienda incluir un cronograma planificando el trabajo durante las 15 semanas del semestre del “F”, haciendo referencia a los pasos listados en el plan de trabajo. Se puede extender el ejemplo dado, o usar otro software para generar el cronograma.
// [1–2 páginas]
El plan de trabajo detalla las actividades clave a llevar a cabo para desarrollar la solución propuesta. Se dividirá en fases y se establecerá un cronograma preliminar para orientar el desarrollo del proyecto a lo largo de un período de 15 semanas del semestre.

== Fase 1: Preparación y Planificación (Semana 1-2)
- Creación de historias de usuario y subtareas: Identificación detallada de los requisitos y funcionalidades clave del sistema a través de historias de usuario y descomposición en subtareas específicas.
- Creación del repositorio: Establecimiento de un repositorio centralizado para el seguimiento y control de versiones del código fuente y otros recursos del proyecto.

== Fase 2: Desarrollo Inicial (Semana 3-6)
- Iniciar el proyecto Django: Configuración inicial del entorno de desarrollo Django, incluida la configuración de la base de datos y la estructura del proyecto.
- Creación del módulo de documentos: Desarrollo del primer módulo para gestionar documentos, abordando la versión, aprobación y cambios de archivos asociados a los controles de ISO27001.
- Creación del módulo de activos: Implementación del módulo para mantener un registro de los activos de la empresa, clasificándolos y asignándoles dueño y criticidad.

== Fase 3: Desarrollo Avanzado (Semana 7-10)
- Creación del módulo de riesgos: Desarrollo del módulo de gestión de riesgos, integrando planes de acción basados en políticas y datos de los módulos anteriores.
- Creación del módulo de flujos: Implementación del motor de procesos para gestionar flujos de controles, programados y manuales, registrando las actividades cumplidas.

== Fase 4: Evaluación y Refinamiento (Semana 11-13)
- Realizar encuestas de satisfacción y usabilidad: Recopilación de comentarios y evaluación de la experiencia del usuario mediante encuestas y pruebas de usabilidad.
- Pedir comentarios de expertos en seguridad: Solicitud y revisión de comentarios de expertos en seguridad para identificar posibles vulnerabilidades y mejorar la robustez del sistema.
- Analizar el software en busca de vulnerabilidades: Utilización de herramientas especializadas para realizar análisis de seguridad y corregir cualquier vulnerabilidad identificada.

== Fase 5: Redacción de Memoria (Semana 14-15)
- Redactar memoria: Resumir objetivos, metodología y resultados clave. Introducir el proyecto y su contexto. Revisar tecnologías relacionadas y brechas identificadas. Detallar la solución propuesta. Presentar resultados y evaluación. Concluir destacando contribuciones y futuros desarrollos.

#timeliney.timeline(
  show-grid: true,
  {
    import timeliney: *

    headerline(([*Semana*], 15))
    headerline(
      group(..range(15).map(n => strong(str(n + 1)))),
    )

    taskgroup(title: [*Preparación y planificación*], {
      task("Creación de historias \nde usuario y subtareas", (0, 2), style: (stroke: 2pt + gray))
      task("Creación del repositorio", (1, 2), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Desarrollo Inicial*],{
        task("Iniciar el proyecto Django", (2,6), style: (stroke: 2pt + gray))
        task("Creación del módulo de documentos", (2,6), style: (stroke: 2pt + gray))
        task("Creación del módulo de activos", (2,6), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Desarrollo Avanzado*],{
        task("Creación del módulo de riesgos", (6,10), style: (stroke: 2pt + gray))
        task("Creación del módulo de flujos", (6,10), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Evaluación y Refinamiento*],{
        task("Realizar encuestas de satisfacción \ny usabilidad", (10,13), style: (stroke: 2pt + gray))
        task("Pedir comentarios de expertos en \nseguridad", (10,13), style: (stroke: 2pt + gray))
        task("Analizar el software en busca de \nvulnerabilidades", (10,13), style: (stroke: 2pt + gray))
    })

    taskgroup(title: [*Documentación y Cierre*],{
        task("Redactar informe final", (13,15), style: (stroke: 2pt + gray))
    })

    milestone(
        at: 5,
        style: (stroke: (dash: "dashed")),
        align(center, [
            Avance I
        ])
    )
    milestone(
        at: 10,
        style: (stroke: (dash: "dashed")),
        align(center, [
            Avance II
        ])
    )
    milestone(
        at: 15,
        style: (stroke: (dash: "dashed")),
        align(center, [
            Avance III
        ])
    )
  }
)
