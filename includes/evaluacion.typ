// Evaluación
// Es necesario mostrar/demostrar cuán bien la solución propuesta resuelve el problema
// Varias alternativas según el problema/solución:
//// Usar la aplicación desarrollada en un contexto real y reportar los resultados
//// Simular el uso con caso(s) representativo(s)
//// Encuestar a usuarios finales
//// Etc.
// Puede ser una sección al final del capítulo de solución o un capítulo independiente
La evaluación de la solución desarrollada se ha llevado a cabo mediante la aplicación en un contexto real dentro de la empresa Magnet y mediante una encuesta de usabilidad dirigida a los usuarios finales, utilizando la System Usability Scale (SUS). El objetivo de esta evaluación es demostrar cuán eficaz es la solución propuesta para resolver los problemas planteados y cumplir con los objetivos establecidos.

== Uso en un Contexto Real

La plataforma fue implementada y utilizada en Magnet para la gestión del Sistema de Gestión de Seguridad de la Información (SGSI) según los estándares de la norma ISO 27001. Durante su uso, se recopiló información sobre su desempeño y efectividad en la gestión de documentos, activos, riesgos y procesos.

=== Resultados del Uso Real

- *Gestión de Documentos*: Se logró centralizar y versionar la documentación relevante, facilitando el acceso y asegurando la conformidad con las políticas de la empresa.
- *Gestión de Activos*: La clasificación y seguimiento de activos mejoró la visibilidad y control sobre los recursos críticos de la empresa.
- *Gestión de Riesgos*: La identificación y evaluación de riesgos permitió una respuesta más ágil y eficiente ante posibles amenazas.
- *Gestión de Procesos*: La definición y seguimiento de procesos aseguró la generación de evidencia necesaria para auditorías, cumpliendo con los requisitos de ISO 27001.

== Encuesta de Usabilidad

Para complementar la evaluación, se realizó una encuesta de usabilidad entre los usuarios de la plataforma, utilizando la System Usability Scale (SUS). La encuesta se basó en una escala del 1 al 5, donde 1 representa "totalmente en desacuerdo" y 5 representa "totalmente de acuerdo". A continuación, se presentan los resultados de la encuesta y el puntaje SUS calculado.

=== Resultados de la Encuesta

#table(
  columns: 2,
  table.header[*Pregunta*][*Promedio*],
  [Me gustaría usar este sistema frecuentemente], [4],
  [Encontré el sistema innecesariamente complejo], [1.5],
  [Pensé que el sistema era fácil de usar], [4.5],
  [Creo que necesitaría el soporte de una persona técnica para poder usar este sistema], [1.5],
  [Encontré que las diversas funciones en este sistema estaban bien integradas], [4.5],
  [Pensé que había demasiada inconsistencia en este sistema], [2],
  [Imagino que la mayoría de las personas aprendería a usar este sistema muy rápidamente], [4.5],
  [Encontré el sistema muy engorroso de usar], [2],
  [Me sentí muy seguro usando el sistema], [5],
  [Necesitaba aprender muchas cosas antes de poder comenzar a usar este sistema], [1]
)

=== Puntaje SUS

El puntaje SUS se calcula mediante la siguiente fórmula:

1. Para cada pregunta impar (1, 3, 5, 7, 9), se resta 1 del puntaje.
2. Para cada pregunta par (2, 4, 6, 8, 10), se resta el puntaje de 5.
3. Se suman todos los valores obtenidos y se multiplica por 2.5 para obtener el puntaje SUS.

Los resultados individuales y el puntaje promedio se muestran a continuación:

#table(
  columns: 3,
  table.header[*Pregunta*][*Respuesta Usuario 1*][*Respuesta Usuario 2*],
  [Me gustaría usar este sistema frecuentemente], [3], [5],
  [Encontré el sistema innecesariamente complejo], [1], [2],
  [Pensé que el sistema era fácil de usar], [5], [4],
  [Creo que necesitaría el soporte de una persona técnica para poder usar este sistema], [1], [2],
  [Encontré que las diversas funciones en este sistema estaban bien integradas], [4], [5],
  [Pensé que había demasiada inconsistencia en este sistema], [2], [2],
  [Imagino que la mayoría de las personas aprendería a usar este sistema muy rápidamente], [5], [4],
  [Encontré el sistema muy engorroso de usar], [2], [2],
  [Me sentí muy seguro usando el sistema], [5], [5],
  [Necesitaba aprender muchas cosas antes de poder comenzar a usar este sistema], [1], [1]
)

El puntaje promedio SUS es: 88.75

== Análisis de la Encuesta

El puntaje promedio SUS de 88.75 indica una excelente usabilidad del sistema, ya que un puntaje SUS por encima de 68 se considera bueno y un puntaje por encima de 80 se considera excelente. Este resultado refleja que los usuarios encuentran la plataforma fácil de usar, bien integrada y confiable.

== Conclusiones de la Evaluación

La evaluación demuestra que la solución propuesta ha sido efectiva en la gestión del SGSI en Magnet, cumpliendo con los estándares de ISO 27001. Los resultados de la encuesta de usabilidad indican una alta aceptación y satisfacción por parte de los usuarios, con una interfaz intuitiva y bien integrada que facilita su uso sin necesidad de soporte técnico significativo.

La implementación en un contexto real y la retroalimentación positiva obtenida de los usuarios finales validan la eficacia de la solución desarrollada, asegurando su capacidad para mejorar la gestión de la seguridad de la información en la empresa. Esta plataforma no solo resuelve los problemas planteados, sino que también proporciona una base sólida para futuras mejoras y escalabilidad.
