#import "conf.typ": conf
#show: conf.with(
    titulo: "Plataforma para auditoria de cumplimiento de Sistema General de Seguridad de Información",
    autor: "Gabriel Rojas Chamorro",
    profesores: ("Eduardo Godoy Vega",),
    supervisor: "Mauricio Castro García",
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
