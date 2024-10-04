/// Agrega metadata y estado necesarios para otras funciones del template.
/// Si quieres crear tu propio pie de página, es recomendable pasarlo
/// por esta función.
///
/// - it (content): Contenido del pie de página.
/// -> content
#let base(it) = {
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
  metadata((marker: "PAGE-END"))
}

/// Un header vacío.
///
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**
/// -> content
#let sin-footer(meta) = base[]

/// Un footer con solamente el número de página.
///
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**
/// - romano-hasta-primer-heading (bool): Si es true, las páginas antes del 
///   primer heading con numbering utilizan números romanos en minúsculas.
///   Por defecto es `true`.
/// -> content
#let footer-numero(
  meta,
  romano-hasta-primer-heading: true
) = base[
  #align(center)[
    #context {
        let headings = query(heading.where(outlined: true))
        let first-numbered-heading = headings.at(0, default: none)

        let numbering = "i"
        if first-numbered-heading != none {
          if here().page() == first-numbered-heading.location().page() {
            counter(page).update(1)
          }
          if first-numbered-heading.location().page() <= here().page() {
            numbering = "1"
          }
        }

        context {
          counter(page).display(numbering)
        }
      }
  ]
]

/// El footer por defecto.
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**
/// -> content
#let footer1(meta) = base[
  #set text(style: "italic", weight: 1)

  #line(length: 100%, stroke: 0.4pt)
  #v(8pt)
  #grid(columns: (auto, 1fr), rows: auto)[
    #set align(left + top)
    #meta.curso
  ][
    #set align(right + top)
    #meta.titulo
  ]
]

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
  return help-leaf("footer")(nombre)
}