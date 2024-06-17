#import "conf.typ": conf, guia, pronombre
#let mostrar_guias = false
#show: conf.with(
    titulo: "Desarrollo de una plataforma para auditoría de cumplimiento de Sistema General de Seguridad de Información (SGSI)",
    autor: (nombre: "Gabriel Rojas Chamorro", pronombre: pronombre.el),
    profesores: ((nombre: "Eduardo Godoy Vega", pronombre: pronombre.el),),
    supervisor: (nombre: "Mauricio Castro García", pronombre: pronombre.el),
    comision: (
        (nombre: "Nombre Apellido I", pronombre: pronombre.el),
        (nombre: "Nombre Apellido II", pronombre: pronombre.el),
        (nombre: "Nombre Apellido III", pronombre: pronombre.el),
    ),
    anno: 2024,
)

#let nonumheading(head) = {
    show heading: it => [
        #set text(24pt)
        #v(3em)
        #block(it.body)
        #linebreak()
    ]
    heading(numbering: none, head)
}

#let nonumoutline() = {
    show heading: it => [
        #set text(24pt)
        #v(3em)
        #block(it.body)
        #linebreak()
    ]
    show outline.entry: it => {
        if it.page == [i] or it.page == [iii] {
            none
        } else if (it.level == 1) {
            v(15pt, weak: true)
            strong(it)
        } else {
            it
        }
    }
    outline(
        title: [Tabla de Contenido],
        target: heading.where(level: 1).or(heading.where(level: 2)),
        indent: 2em
    )
}


#nonumheading([Resumen]) <resumen>

#include "includes/resumen.typ"

#pagebreak()

#{
    [
        #v(0.3fr, weak: true)
        #align(right)[
            _Dedicatoria_
        ]
        #v(0.7fr, weak: true)
    ]
}

#pagebreak()

#nonumheading([Agradecimientos]) <agradecimientos>

#include "includes/agradecimientos.typ"

#pagebreak()

#nonumoutline()

#set page(numbering: "1")
#counter(page).update(1)

= Introducción <introduccion>

#include "includes/introduccion.typ"


= Situación actual <situacion-actual>

#include "includes/situacion_actual.typ"


= Solución <solucion>

#include "includes/solucion.typ"


= Evaluación <evaluacion>

#include "includes/evaluacion.typ"


= Conclusiones <conclusion>

#include "includes/conclusion.typ"


#[
    #show heading: it => [
        #set text(24pt)
        #v(3em)
        #block(it.body)
        #linebreak()
    ]
    #bibliography(
        "bibliografia.yml",
        title: "Bibliografía",
        style: "ieee",
    )
]


= Anexo <anexo>

#include "includes/anexo.typ"
