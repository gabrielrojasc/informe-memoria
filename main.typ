#import "conf.typ": conf, pronombre
#show: conf.with(
    titulo: "Plataforma para auditoria de cumplimiento de Sistema de Gestión de Seguridad de la Información",
    autor: (nombre: "Gabriel Rojas Chamorro", pronombre: pronombre.el),
    profesores: ((nombre: "Eduardo Godoy Vega", pronombre: pronombre.el),),
    supervisor: (nombre: "Mauricio Castro García", pronombre: pronombre.el),
    modalidad: "Práctica Extendida",
    informe: true,
    codigo: "CC6909", // CC6908 para malla v3, CC6907 para malla v5
)

// #include "includes/introduccion.typ"
// #pagebreak()
// #include "includes/situacion_actual.typ"
// #pagebreak()
#include "includes/solucion.typ"

// #pagebreak()
// #bibliography(
//     "bibliography.bib",
//     title: "Referencias",
//     style: "ieee",
// )

#pagebreak()
#include "includes/anexo.typ"