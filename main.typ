#import "conf.typ": conf, pronombre
#show: conf.with(
    titulo: "Plataforma para auditoria de cumplimiento de Sistema de Gestión de Seguridad de la Información",
    autor: (nombre: "Gabriel Rojas Chamorro", pronombre: pronombre.el),
    profesores: ((nombre: "Eduardo Godoy Vega", pronombre: pronombre.el),),
    supervisor: (nombre: "Mauricio Castro García", pronombre: pronombre.el),
    modalidad: "Práctica Extendida",
    informe: false,
)

#include "includes/introduccion.typ"
#include "includes/situacion_actual.typ"
#include "includes/objetivos.typ"
#include "includes/solucion.typ"
#include "includes/plan_de_trabajo.typ"

#pagebreak()

#bibliography(
    "bibliography.bib",
    title: "Referencias",
    style: "ieee",
)
