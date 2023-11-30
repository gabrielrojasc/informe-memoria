= Solución Propuesta
// Una descripción general de la solución propuesta: los datos, las técnicas, las tecnologías, las herramientas, los lenguajes, los marcos, etc., que se usarán para intentar lograr los objetivos planteados. Aquí hay que contestar la pregunta: ¿cómo vas a lograr los objetivos planteados? Aquí, sí, está muy bien hablar de Javascript, CNNs, Numpy, Django, índices invertidos, árboles wavelet, privacidad diferencial, PageRank, Diffie– Hellman, triangulaciones de Delaunay, CUDA, Postgres, etc.
// [2–4 páginas]

// La solución consiste en una plataforma capaz de manejar documentos, activos, riesgos y flujos. La idea es poder auditar un SGSI basado en ISO27001, por ende se debe tener una forma de acceso para múltiples tipos de usuarios como auditor, administrador y trabajadores.

// Como principal base del sistema se usarán los controles que se definen por parte ISO27001, donde cada empresa tendrá la responsabilidad de decidir cuáles implementara y cuáles serán sus políticas internas.

// Para guardar todos los datos generados por la aplicación se usará una base de datos relacional, en específico PostgreSQL. Se decide usar esta base de datos, ya que se posee previa experiencia con la misma, por ser de código abierto y tener funcionalidades que otras opciones como MySQL no poseen.

// Para el backend se usará Django. Esta decisión viene dada de que Django posee un ORM ("Modelo de programación que permite mapear las estructuras de una base de datos relacional" @deloitte-orm) ya integrado, tiene una buena documentación, es de código abierto, esta basado en Python y se tiene experiencia previa con el framework y el lenguaje, esto es tanto para el alumno como la empresa.

// Para el frontend, ya que se está usando Django se usará un sistema de plantillas de HTML. Además, se usará un framework de CSS para estilar estas plantillas, probablemente siendo este Bootstrap. De ser necesario se usará Typescript para obtener datos o hacer algún componente reactivo. Se decide no usar un framework de Javascript, debido a que la página en sí será bastante estática, por lo que usar un framework más interactivo no muestra una clara ventaja. Al igual que para las herramientas y tecnologías backend, se posee experiencia previa tanto del alumno como la empresa.

// Se espera que este proyecto quede desplegado en un servidor, posiblemente en DigitalOcean. Este servidor contará con el sistema operativo Linux y se harán los despliegues usando ansible para tener reproducibilidad y Docker para evitar problemas de portabilidad y consistencia.

// Cabe destacar que tener experiencia previa tanto el alumno como la empresa con las herramientas y tecnologías que se usarán ayudara al mantenimiento del software y permitirá hacer futuras mejoras sin tener que invertir en aprender nuevas tecnologías.

// Para realizar las encuestas de satisfacción y usabilidad, para evaluar el sistema, se decide en usar los forms de Google dada su facilidad de uso y de distribución.


La solución propuesta se adapta de manera efectiva para abordar desafíos relacionados con la escalabilidad, el rendimiento y la seguridad del sistema, incorporando consideraciones específicas en su diseño y arquitectura.

En términos de escalabilidad, si bien el proyecto no está inicialmente diseñado para manejar un gran flujo de usuarios, la implementación en contenedores Docker permite una fácil replicación y despliegue detrás de un balanceador de carga. Esto facilita la escalabilidad horizontal, permitiendo la adición de nuevos contenedores según sea necesario. Para la gestión de datos, la escalabilidad vertical de la base de datos PostgreSQL y la opción de utilizar réplicas para lectura proporcionan una respuesta eficiente a posibles aumentos en la carga de datos.

En cuanto al rendimiento, la elección de tecnologías robustas y bien probadas, como Django, PostgreSQL y Typescript, proporciona una base sólida. La experiencia previa con sistemas similares garantiza que el escalamiento de la aplicación sea un proceso manejable, respaldado por las mejores prácticas y lecciones aprendidas de implementaciones anteriores.

La interoperabilidad entre las tecnologías utilizadas se ve respaldada por la compatibilidad inherente de Django con PostgreSQL y la elección de Typescript como lenguaje en el frontend. Además, se planea seguir estándares y prácticas documentadas para asegurar una integración fluida, aprovechando la documentación existente como guía.

En cuanto a la seguridad, se implementan múltiples capas de protección. La confidencialidad de la información se garantiza mediante permisos de usuario, y la autenticación y autorización se plantean a través de un sistema de Single Sign-On (SSO) utilizando G Suite, aunque también se considera el sistema de autenticación interno de Django como alternativa. La integridad de la información se asegura mediante la implementación de hashes para versionar archivos, brindando una capa adicional de seguridad contra manipulaciones no autorizadas.

Para abordar la experiencia del usuario durante el desarrollo, se planea mantener un servidor de desarrollo o staging en funcionamiento. Aunque actualmente no existen prototipos para la interfaz de usuario, se realizarán pruebas continuas de usabilidad durante el desarrollo para garantizar una experiencia intuitiva y fácil de navegar.

La estrategia de mantenimiento del software implica mantener todas las versiones en LTS (long term support), asegurando la obtención de actualizaciones de seguridad y la estabilidad a lo largo del tiempo. Se busca mantener un ciclo de vida de desarrollo continuo, priorizando la corrección de problemas y el desarrollo de nuevas funcionalidades, reconociendo que el tiempo invertido es un factor crítico.

La elección de DigitalOcean como plataforma de implementación se basa en la experiencia previa y en consideraciones económicas, ya que se percibe como una opción más rentable entre los grandes proveedores de servicios en la nube. Aunque se ha considerado Amazon Web Services (AWS) debido a la experiencia previa, la decisión se inclina hacia DigitalOcean por razones monetarias.

La colaboración con expertos en seguridad se plantea actualmente como una posibilidad abierta. Se espera utilizar herramientas de código abierto, como las proporcionadas por OWASP, para analizar posibles vulnerabilidades en el sistema, y se está abierto a sugerencias específicas para facilitar la colaboración con expertos en seguridad.

En relación con la internacionalización y localización, la plataforma se diseñará para ser accesible tanto en inglés como en español mediante la incorporación del sistema de internacionalización de Django. Este enfoque permitirá que la interfaz de usuario se adapte fácilmente a diferentes idiomas, brindando una experiencia inclusiva y personalizada para usuarios de distintas regiones y culturas.

La implementación de la internacionalización en Django facilitará la gestión de cadenas de texto en múltiples idiomas, permitiendo una fácil traducción de la interfaz de usuario. Esto no solo mejora la accesibilidad para un público global, sino que también establece una base sólida para futuras expansiones lingüísticas.

Además, se garantizará que la localización no se limite simplemente a la traducción de contenido, sino que también abarcará otros aspectos culturales relevantes, como formatos de fecha, hora y moneda. Este enfoque integral asegurará una experiencia consistente y adaptada a las preferencias locales de los usuarios, contribuyendo así a la usabilidad y aceptación del sistema en diferentes contextos.

En resumen, la adopción del sistema de internacionalización de Django refuerza el compromiso de la plataforma con la diversidad lingüística y cultural, promoviendo un entorno inclusivo y accesible para una audiencia global.