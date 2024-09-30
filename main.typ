#import "conf.typ": conf, guia, pronombre
#let mostrar_guias = false
#show: conf.with(
    titulo: "DESARROLLO DE UNA PLATAFORMA PARA AUDITORÍA DE CUMPLIMIENTO DE SISTEMA GENERAL DE SEGURIDAD DE INFORMACIÓN (SGSI)",
    autor: (nombre: "GABRIEL HERNÁN ROJAS CHAMORRO", pronombre: pronombre.el),
    profesores: ((nombre: "EDUARDO GODOY VEGA", pronombre: pronombre.el),),
    // supervisor: (nombre: "MAURICIO CASTRO GARCÍA", pronombre: pronombre.el),
    comision: (
        "ALEJANDRO HEVIA ANGULO",
        "CAMILO GÓMEZ NÚÑEZ",
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
            _Dedicado a aquellos que no tuvieron la oportunidad de terminar este camino con nosotros._
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

#pagebreak()
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


#pagebreak()

#include "includes/anexo.typ"