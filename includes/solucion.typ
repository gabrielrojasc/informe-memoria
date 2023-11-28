= Solución Propuesta
// Una descripción general de la solución propuesta: los datos, las técnicas, las tecnologías, las herramientas, los lenguajes, los marcos, etc., que se usarán para intentar lograr los objetivos planteados. Aquí hay que contestar la pregunta: ¿cómo vas a lograr los objetivos planteados? Aquí, sí, está muy bien hablar de Javascript, CNNs, Numpy, Django, índices invertidos, árboles wavelet, privacidad diferencial, PageRank, Diffie-Hellman, triangulaciones de Delaunay, CUDA, Postgres, etc.
// [1-2 páginas]
La solución consiste en una plataforma capaz de manejar documentos, activos, riesgos y flujos. La idea es poder auditar un SGSI basado en ISO27001, por ende se debe tener una forma de acceso para múltiples tipos de usuarios como auditor, administrador y trabajadores.

Como principal base del sistema se usarán los controles que se definen por parte ISO27001, donde cada empresa tendrá la responsabilidad de decidir cuáles implementara y cuáles serán sus políticas internas.

Para guardar todos los datos generados por la aplicación se usará una base de datos relacional, en específico PostgreSQL. Se decide usar esta base de datos, ya que se posee previa experiencia con la misma, por ser de código abierto y tener funcionalidades que otras opciones como MySQL no poseen.

Para el backend se usará Django. Esta decisión viene dada de que Django posee un ORM ("Modelo de programación que permite mapear las estructuras de una base de datos relacional" @deloitte-orm) ya integrado, tiene una buena documentación, es de código abierto, esta basado en Python y se tiene experiencia previa con el framework y el lenguaje, esto es tanto para el alumno como la empresa.

Para el frontend, ya que se está usando Django se usará un sistema de plantillas de HTML. Además, se usará un framework de CSS para estilar estas plantillas, probablemente siendo este Bootstrap. De ser necesario se usará Typescript para obtener datos o hacer algún componente reactivo. Se decide no usar un framework de Javascript, debido a que la página en sí será bastante estática, por lo que usar un framework más interactivo no muestra una clara ventaja. Al igual que para las herramientas y tecnologías backend, se posee experiencia previa tanto del alumno como la empresa.

Se espera que este proyecto quede desplegado en un servidor, posiblemente en DigitalOcean. Este servidor contará con el sistema operativo Linux y se harán los despliegues usando ansible para tener reproducibilidad y Docker para evitar problemas de portabilidad y consistencia.

Cabe destacar que tener experiencia previa tanto el alumno como la empresa con las herramientas y tecnologías que se usarán ayudara al mantenimiento del software y permitirá hacer futuras mejoras sin tener que invertir en aprender nuevas tecnologías.

Para realizar las encuestas de satisfacción y usabilidad, para evaluar el sistema, se decide en usar los forms de Google dada su facilidad de uso y de distribución.