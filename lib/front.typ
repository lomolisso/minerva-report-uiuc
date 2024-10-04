#import "header.typ" as header
#import "footer.typ" as footer
#import "states.typ" as states

/// Crea un página y settea variables de estado requeridas
/// por otras funciones del template. Si buscas extender
/// el template con tu propia portada, es recomendado
/// pasarlo por esta función.
///
/// - it (content): Contenido de la portada.
/// - ..args (arguments): Argumentos a pasar a la función `page`
/// -> content
#let base(it, ..args) = {
  return page(..args, {
    states.is-main.update(true)
    it
    counter(page).update(0)
  })
}

/// Diseño de portada básico, perfecto para informes y tareas.
/// 
/// - meta (dictionary): Contenidos del archivo **meta.typ**
/// - titulo-centrado (bool): Si es que el título debería ir centrado respecto
///   a la página. Por defecto `false`.
/// -> content
#let portada1(
  meta,
  titulo-centrado: false,
) = {
  let miembros = (:)
  if type(meta.autores) == "string" {
    miembros.insert("Integrante", meta.autores)
  } else if meta.autores.len() > 0 {
    miembros.insert(
      if meta.autores.len() == 1 {
        "Integrante"
      } else {
        "Integrantes"
      },
      meta.autores
    )
  }
  miembros = miembros + meta.equipo-docente

  let header = header.base[
    #grid(columns: (auto, 1fr), rows: auto)[
      #set align(left + bottom)
      #for nombre in meta.departamento.nombre [#nombre \ ]
    ][
      #set align(right + bottom)
      #if meta.departamento.logo != none {
        let logo_raw = if type(meta.departamento.logo) == function {
          meta.departamento.at("logo")()
        } else {
          meta.depatamento.logo
        }

        image.decode(logo_raw, height: 50pt)
      }
    ]
    #v(8pt)
    #line(length: 100%, stroke: 0.4pt)
  ]

  let member-table-args = ()
  for (categoria, nombres) in miembros {
    member-table-args.push[#categoria:]
    member-table-args.push[
      #if type(nombres) == array {
        for nombre in nombres [#nombre \ ]
      } else {
        nombres
      }
    ]
  }

  let titulo = align(center, {
      set text(size: 25pt)
      if meta.titulo != none {
        meta.titulo
        linebreak()
      }
      if meta.subtitulo != none {
        meta.subtitulo
        linebreak()
      }
      if meta.tema != none {
        meta.tema
      }
    })
  
  let member-table = grid(columns: (1fr, auto), rows: auto)[][
      #grid(columns: 2, rows: auto, row-gutter: 10pt, column-gutter: 5pt, ..member-table-args)
  
      #for (nombre, fecha) in meta.fechas [
        Fecha de #nombre: #fecha \
      ]
      #meta.lugar
    ];
  
  let member-table-wrapper = {
    if titulo-centrado {
      (it) => place(bottom+right, align(top+left, it))
    } else {
      (it) => it
    }
  }

  return base(header: header)[
    #v(1fr)
    #titulo
    #v(1fr)
    #member-table-wrapper(grid(columns: (1fr, auto), rows: auto, [], member-table))
  ]
}

/// Portada que contiene en una página el resumen y el outline.
///
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**.
/// - espaciado (length): Espaciado entre los elementos principales de la portada.
/// - indice (boolean): Decide si incluir un índice.
/// -> content
#let portada-simple(
  meta,
  espaciado: 4cm,
  indice: false
) = {
  let meta = dictionary(meta)
  let autores = if type(meta.autores) == array {
    meta.autores.join(", ")
  } else {
    meta.autores
  }

  return base(margin: (x: 4cm), align(center + horizon)[
    #set heading(numbering: none, outlined: false)
    #set text(size: 13pt)

    #let page-content(main-spacing) = stack(dir: ttb, spacing: main-spacing,
      stack(dir: ttb, spacing: 2cm,
        [
          #text(size: 20pt)[*#meta.titulo*]

          #set text(tracking: 1pt)
          #meta.subtitulo
        ],
        [
          #stack(dir: ltr, spacing: 2cm, meta.tema, autores)

          #if meta.at("url", default: none) != none {
            link(meta.url)
          }
        ]
      ),
      ..if meta.at("resumen", default: none) != none {
        ([
          = Resumen
          #meta.resumen],)
      } else {
        ()
      },
      outline(depth: 2)
    )
    
    #layout(size => {
      let desired = measure(page-content(espaciado))
      if desired.height > size.height {
        page-content(1fr)
      } else {
        page-content(espaciado)
      }
    })
  ])
}

/// Esta función permite obtener ayuda sobre cualquier función
/// del template. Para saber qué funciones y variables define
/// el template simplemente deja que el autocompletado te guíe,
/// luego puedes llamar esta función para obtener más ayuda.
///
/// - nombre (string): Puede ser el nombre de una función o
///                    variable, entonces la función entrega
///                    ayuda general sobre esta. Si se entrega
///                    algo de la forma `"help(nombre)"` entonces
///                    entrega ayuda específica sobre el argumento
///                    `nombre`.
/// -> content
#let help(nombre) = {
  import "../meta.typ": *
  return help-leaf("front")(nombre)
}
