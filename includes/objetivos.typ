= Objetivos
// Describir las metas del trabajo. Hay que contestar acá: ¿qué quieres lograr? (La sección que sigue contestará la pregunta: ¿cómo lo vas a lograr?)
// Ejemplos de metas: lograr que X sea (más) eficiente, usable, seguro, completo, preciso, barato, informativo, posible por primera vez, etc.
// Ejemplos de no metas: implementar algo en Javascript, aplicar modelo Y sobre los datos, etc. (Estas cosas van en la descripción de la Solución Propuesta.)
// Los objetivos deberían ser específicos, medibles, alcanzables y relevantes al problema (ver la clase 2). El plan de trabajo debería argumentar que sean acotados en tiempo (un semestre).
// Al final del trabajo, debería ser factible saber si se ha logrado los objetivos enumerados acá, o saber cuán bien se han logrado, o no. Por ejemplo, si la meta es tener algo eficiente en términos de tiempo, debería haber una forma de evaluar o estudiar los tiempos. Acá tendrás que definir la forma general en que se podrá evaluar el trabajo.
// [No hay que poner texto acá. Se puede empezar directamente con el objetivo general.]
== Objetivo General
// Un resumen conciso (no más de un párrafo) de la meta principal del trabajo, es decir, qué quieres lograr con el trabajo (o qué significa “éxito” en el contexto del trabajo).
// El objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.
// (“Titularse” no es una repuesta válida. :)) [1 párrafo]
Durante este trabajo se desea construir un software que permita auditar el cumplimiento de SGSI. Este software será la plataforma donde se registraran documentos, activos, riesgos y flujos asociados a los diferentes controles de seguridad de ISO27001.

== Objetivos Específicos
// Una lista de los hitos principales que se quieren lograr para (intentar) cumplir con el objetivo general. Divide el objetivo general en varios hitos que formarán las etapas del trabajo.
// Cada objetivo debería ser específico, medible, alcanzable, relevante al problema, y acotado en tiempo.
// No se debería escribir más de un párrafo por hito.
// Los objetivos específicos deberían “sumar” al objetivo general. [Una lista de 3–7 párrafos]
Para cumplir el objetivo general, primero, se debe incorporar un módulo que permita manejar documentos, donde estos queden versionados y se les pueda dar una aprobación o pedir cambios, con el propósito de tener un único lugar con todos los archivos de las políticas para los controles de ISO27001.

El segundo módulo deberá encargarse de mantener un registro de los activos de la empresa, entre estos encontramos equipos electrónicos, lugares físicos, personas, servicios y software, permitiendo definir un dueño, una clasificación y su criticidad.

El tercer módulo se compondrá de un gestor de riesgo. Este complementará los 2 módulos anteriores, permitiendo definir diferentes planes de acción frente a los posibles riesgos, basándose en las políticas del primer módulo.

Por último, se agregará un motor de procesos para manejar flujos de los distintos controles, que se iniciaran tanto manualmente como cada ciertos periodos de tiempo predefinidos. De esta manera se podrá mantener un registro de que se están cumpliendo las actividades definidas por los controles.

== Evaluación
// Describe cómo vas a poder evaluar el trabajo en términos de cuán bien cumple con los objetivos planteados. Se pueden discutir los datos, las medidas, los usuarios, las técnicas, etc., utilizables para la evaluación.
// [1–2 párrafos]
Para evaluar el desempeño del sistema frente a los objetivos mencionados se usarán principalmente encuestas de satisfacción y usabilidad. Además, se intentará que expertos en seguridad usen la plataforma, den su opinión y sugieran posibles mejoras.