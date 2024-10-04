/// Agrega metadata y estado necesarios para otras funciones del template.
/// Si quieres crear tu propio encabezado, es recomendable pasarlo
/// por esta función.
///
/// - it (content): Contenido del encabezado.
/// -> content
#let base(it) = {
  metadata((marker: "PAGE-START"))
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
}

/// Un header vacío.
///
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**
/// -> content
#let sin-header(meta) = base[]

/// El header por defecto.
/// - meta (dictionary, module): Contenidos del archivo **meta.typ**
/// - romano-hasta-primer-heading (bool): Si es true, las páginas antes del 
///   primer heading con numbering utilizan números romanos en minúsculas.
///   Por defecto es `true`.
/// -> content
#let header1(
  meta,
  romano-hasta-primer-heading: true
) = base[
  #set text(weight: 1) // typst bug?
  #grid(columns: (auto, 1fr), rows: auto)[
    #set align(left + bottom)
    #context {
      let loc = here()
      let post-headings = query(selector(heading.where(level: 1, outlined: true)).after(loc))
      let heading-found = none
      if post-headings != () and post-headings.first().location().page() == loc.page() {
        heading-found = post-headings.first()
      } else {
        let prev-headings = query(selector(heading.where(level: 1, outlined: true)).before(loc))

        if prev-headings != () {
          heading-found = prev-headings.last()  
        }
      }

      if heading-found != none and heading-found.numbering != none {
        heading-found.body
      }
    }
  ][
    #set align(right + bottom)
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
  #v(8pt)
  #line(length: 100%, stroke: 0.4pt)
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
  return help-leaf("header")(nombre)
}
