#let logos = (
    escudo: "imagenes/institucion/escudoU2014.svg",
    fcfm: "imagenes/institucion/fcfm.svg"
)

#let pronombre = (
    el:   (titulo: "O", guia: ""),
    ella: (titulo: "A", guia: "A"),
    elle: (titulo: "E", guia: "E"),
)

#let guia(visible: true, body) = if visible [
    #set rect(width: 100%, stroke: black)
    #set par(justify: true, first-line-indent: 0pt)
    #block(breakable: false)[#stack(dir: ttb,
        rect(fill: black, radius: (top: 5pt, bottom: 0pt), text(fill: white, "Guía (deshabilitar antes de entregar)")),
        rect(fill: luma(230), radius: (top: 0pt, bottom: 5pt), body)
    )]] else []

#let conf(
    titulo: none,
    autor: none, // diccionario con nombre y pronombre, (nombre: "", pronombre: pronombre.<el/ella/elle>)
    memoria: true, // false para propuesta, true para informe
    // informe: true, // false para propuesta, true para informe
    codigo: "CC6919", // CC6908 para malla v3, CC6907 para malla v5
    modalidad: "Memoria", // puede ser Memoria, Práctica Extendida, Doble Titulación con Magíster,Doble Titulación de Dos Especialidades
    profesores: (), // si es solo un profesor guía, una lista de un elemento es ((nombre: "nombre apellido", pronombre: pronombre.<el/ella/elle>),)
    comision: (),
    coguias: (), // si es solo un profesor co-guía, una lista de un elemento es ((nombre: "nombre apellido", pronombre: pronombre.<el/ella/elle>),)
    supervisor: none, // solo en caso de práctica extendida llenar esto, en otro caso none, (nombre: "nombre apellido", pronombre: pronombre.<el/ella/elle>)
    anno: none, // si no se especifica, se usa el año actual
    doc,
) = {
    // Formato de página
    set page(
        paper: "us-letter",
        number-align: center,
        numbering: none,
        // margin: (left: 3cm, rest: 2cm,) se configura después de la portada
    )
    // Formato de texto
    set text(
        lang: "es",
        font: "New Computer Modern",
        // font: "Times New Roman",
        size: 12pt,
    )
    // Formato de headings
    set heading(
        numbering: (..n) => {
            [#numbering("1.", ..n)]
        } // Para el resto, numerar con formato 1.1.1.
    )

    show heading: it => {
        if it.level == 1 {
            [
                #pagebreak()
                #set text(24pt)
                #v(3em)
                #block([Capítulo #counter(heading).display("1")])
                #h(5em)
                #block(it.body)
                #linebreak()
            ]
        } else if it.level == 2 {
            [
                #v(1em)
                #set text(18pt)
                #block(it)
                #v(1em)
            ]
        } else {
            it
        }
    }

    let header = [
        #set text(size: 13pt)
        #stack(dir: ltr, spacing: 15pt,
            [],
            align(bottom+left, box(width: 1.35cm, image(logos.escudo))),
            align(bottom+left, stack(dir: ttb, spacing: 5pt,
                text("UNIVERSIDAD DE CHILE"),
                text("FACULTAD DE CIENCIAS FÍSICAS Y MATEMÁTICAS"),
                text("DEPARTAMENTO DE CIENCIAS DE LA COMPUTACIÓN"),
                v(5pt),
                ),
            )
        )
    ]

    let _propuesta = "PROPUESTA DE TEMA DE MEMORIA"
    let _informe = "INFORME FINAL DE " + codigo
    let _memoria = "MEMORIA"
    let _documento = [
        // #if informe [#_informe] else [#_propuesta]
        #if memoria [#_memoria] else [#_propuesta]
        PARA OPTAR AL TÍTULO DE \ INGENIER#autor.pronombre.titulo CIVIL EN COMPUTACIÓN]
    // let _modalidad = [MODALIDAD: \ #modalidad]
    let _modalidad = []
    let _guia(gen: pronombre.el) = [PROFESOR#gen.guia GUÍA]
    let _comision(gen: pronombre.el) = [MIEMBROS DE LA#gen.guia COMISIÓN]
    let _coguia(gen: pronombre.el) = [PROFESOR#gen.guia CO-GUÍA]
    let _supervisor(gen: pronombre.el) = [SUPERVISOR#gen.guia]
    let _ciudad = "SANTIAGO DE CHILE"
    let _anno = if anno != none [#anno] else [#datetime.today().year()]

    let portada = align(center)[
        #stack(dir: ttb, spacing: 17mm,
            v(2mm),
            titulo,
            _documento,
            // upper(autor.nombre),
            autor.nombre,
            _modalidad,
            if profesores.len() == 0 [#v(-17mm)]
            else if profesores.len() == 1
                [#_guia(gen: profesores.at(0).pronombre): \ #profesores.at(0).nombre]
            else
                [#_guia(gen: profesores.at(0).pronombre): \ #profesores.at(0).nombre \
                #_guia(gen: profesores.at(1).pronombre) 2: \ #profesores.at(1).nombre],
            if comision.len() == 0 [#v(-17mm)]
            else if comision.len() == 1
                [#_comision(gen: comision.at(0).pronombre): \ #comision.at(0).nombre]
            else
                [#_comision(gen: comision.at(0).pronombre): \ #comision.at(0).nombre \
                #_comision(gen: comision.at(1).pronombre) 2: \ #comision.at(1).nombre],
            if coguias.len() == 0 [#v(-17mm)]
            else if coguias.len() == 1
                [#_coguia(gen: coguias.at(0).pronombre): \ #coguias.at(0).nombre]
            else
                [#_coguia(gen: coguias.at(0).pronombre): \ #coguias.at(0).nombre \
                #_coguia(gen: coguias.at(1).pronombre) 2: \ #coguias.at(1).nombre],
            if supervisor == none [#v(-17mm)]
            else [#v(34mm)#_supervisor(gen: supervisor.pronombre): \ #supervisor.nombre],
        )
        #align(bottom,[#_ciudad \ #_anno])
    ]
    // Portada
    header
    portada
    // Comienza el documento, en página 1
    set page(
        numbering: "i",
        margin: (left: 3cm, rest: 2cm,),
    ) // Activar numeración de páginas y márgenes
    set par(
        justify: true,
        first-line-indent: 15pt,
    ) // Formato de párrafos
    // show par: set block(spacing: 2em) // Espacio entre párrafos
    show par: set block(spacing: 1.2em) // Espacio entre párrafos
    pagebreak(weak: true) // Salto de página
    counter(page).update(1) // Reestablecer el contador de páginas
    doc
}