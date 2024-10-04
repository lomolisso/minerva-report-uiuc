/// Esta función permite obtener ayuda sobre cualquier función
/// del template. Para saber qué funciones y variables define
/// el template simplemente deja que el autocompletado te guíe,
/// luego puedes llamar esta función para obtener más ayuda.
///
/// - nombre (str): Puede ser el nombre de una función o
///                    variable, entonces la función entrega
///                    ayuda general sobre esta. Si se entrega
///                    algo de la forma `"help(nombre)"` entonces
///                    entrega ayuda específica sobre el argumento
///                    `nombre`.
/// -> content
#let help(nombre) = {
  import "@preview/tidy:0.3.0" as tidy
  import "meta.typ": *
  let help = tidy.generate-help(
    namespace: local-namespace("minerva-report-fcfm.typ"),
    package-name: package-name,
    style: tidy-styles()
  )

  show: help-show
  help(nombre)
}

#import "lib/states.typ" as states
/// Contiene variables de estado utilizadas por el template.
/// -> module
#let states = states

#import "lib/util.typ" as util
/// Contiene múltiples utilidades, como arreglos y funciones que
/// ayudan a la localización al español.
/// -> module
#let util = util

#import "lib/rules.typ" as rules
/// Contiene show y set rules que no son vitales para el template
/// y que pueden ser activadas a gusto.
/// -> module
#let rules = rules

#import "lib/front.typ" as front
/// Contiene portadas varias.
/// -> module
#let front = front

#import "lib/header.typ" as header
/// Contiene encabezados varios.
/// -> module
#let header = header

#import "lib/footer.typ" as footer
/// Contiene pies de página varios.
/// -> module
#let footer = footer

#import "lib/departamentos.typ" as departamentos
/// Lista de departamentos, unidades y centros de la Facultad de Ciencias Físicas
/// y Matemáticas.
/// 
/// Un departamento es un diccionario con un nombre, y opcionalmente un logo,
/// por ejemplo:
///
/// ```typ
/// let mi-departamento = (
///   nombre: (
///      "Universidad de Chile",
///      "Facultad de Ciencias Físicas y Matemáticas",
///      "Centro de Modelamiento Matemático"
///   ),
///   logo: read("logos/cmm.png")
/// )
/// ```
/// -> module
#let departamentos = departamentos


/******************************************************************************
 *           Template
 *
 *****************************************************************************/

/// Función que aplica los estilos del template para informes.
/// 
/// - meta (dictionary, module): Archivo `meta.typ`.
/// - portada (function): Portada a usar.
/// - header (function): Header a usar.
/// - footer (function): Footer a usar.
/// - margenes-portada (dictionary): Márgenes de la portada.
/// - margenes (dictionary): Márgenes del documento.
/// - showrules (bool): Si es `true` se aplicarán showrules irreversibles.
///   Si se requiere más personalización recomiendo desactivar.
/// - doc (content): Documento a aplicar el template.
/// -> content
#let informe(
  meta,
  portada: front.portada1,
  header: header.header1,
  footer: footer.footer1,
  margenes-portada: (top: 3.5cm),
  margenes: (top: 3.5cm),
  showrules: true,
  doc
) = {
  let portada-set-extra = (:)
  if margenes-portada != (:) {
    portada-set-extra.insert("margin", margenes-portada)
  }

  set document(title: meta.titulo, author: meta.autores, date: datetime.today())
  set page(header: header(meta), footer: footer(meta), margin: margenes)
  set text(lang: "es", region: "cl", hyphenate: true)

  set heading(numbering: "1.")
  set par(leading: 0.5em, justify: true, linebreaks: "optimized")
  
  set math.equation(numbering: "(1)")

  show figure.where(kind: table): set block(width: 80%)
  show figure.where(kind: image): set block(width: 80%)
  
  if portada != none {
    set page(header: [], footer: [], ..portada-set-extra)
    portada(meta)
  }

  set page(numbering: "1")

  if showrules {
    show: rules.primer-heading-en-nueva-pag
    show: rules.operadores-es
    
    doc
  } else {
    doc
  }
}

/// Crea un resumen que no aparece en el índice (outline).
/// 
/// - body (content): Cuerpo del resumen.
/// -> content
#let resumen(body) = [
  #heading(level: 1, numbering: none, outlined: false)[Resumen]
  #body
  #pagebreak(weak: true)
]

#let abstract = resumen
