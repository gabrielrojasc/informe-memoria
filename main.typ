#import "conf.typ": conf, pronombre
#show: conf.with(
    titulo: "Plataforma para auditoria de cumplimiento de Sistema General de Seguridad de Información",
    autor: (nombre: "Gabriel Rojas Chamorro", pronombre: pronombre.el),
    profesores: ((nombre: "Eduardo Godoy Vega", pronombre: pronombre.el),),
    supervisor: (nombre: "Mauricio Castro García", pronombre: pronombre.el),
    modalidad: "Práctica Extendida",
    informe: false,
)

#include "includes/introduccion.typ"
#pagebreak()
#include "includes/situacion_actual.typ"
#pagebreak()
#include "includes/objetivos.typ"
#pagebreak()
#include "includes/solucion.typ"
#pagebreak()
#include "includes/plan_de_trabajo.typ"
#pagebreak()

#bibliography(
    "bibliography.bib",
    title: "Referencias",
    style: "ieee",
)
