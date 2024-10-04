/// Show rule que cambia el formato de los números para usar coma decimal.
///
/// #example(```
///   #show: minerva.rules.formato-numeros-es
///   $1.2 + 4.8$
/// ```, mode: "markup")
///
/// - doc (content): documento a aplicar reglas
/// -> content
#let formato-numeros-es(doc) = {
  // https://github.com/typst/typst/issues/1093#issuecomment-1536620129
  show math.equation: it => {
    show regex("\d+.\d+"): it => {
      show ".": {","+h(0pt)}
      it
    }
    it
  }
  
  doc
}

/// Esta show rule cambia los operadores definidos por Typst para
/// que estén en español.
///
/// - doc (content): Contenido a aplicar las reglas.
/// -> content
#let operadores-es(doc) = {
  show math.op.where(text: [#"inf"]): it => {
    show "inf": "ínf"
    it
  }
  show math.op.where(text: [#"lim"]): it => {
    show "lim": "lím"
    it
  }
  show math.op.where(text: [#"lim\u{2009}inf"]): it => {
    show "lim\u{2009}inf": "lím\u{2009}ínf"
    it
  }
  show math.op.where(text: [#"lim\u{2009}sup"]): it => {
    show "lim\u{2009}sup": "lím\u{2009}sup"
    it
  }
  show math.op.where(text: [#"max"]): it => {
    show "max": "máx"
    it
  }
  show math.op.where(text: [#"min"]): it => {
    show "min": "mín"
    it
  }

  doc
}

/// Hace que el primer heading con numbering esté en una página nueva. Esta
/// show rule es aplicada por defecto en el template. Puede ser desactivada
/// usando el parámetro `showrules: false` en la show rule del template.
/// Puede ser reactivada agregando esta línea:
/// ```typ
/// show: primer-heading-en-nueva-pag
/// ```
///
/// - doc (content): Documento a aplicar la regla.
/// -> content
#let primer-heading-en-nueva-pag(doc) = {
  show heading: it => context {
    if counter(heading).get() == (1,) {
      pagebreak(weak: true)
      it
    } else {
      it
    }
  }
  doc
}

/// Permite que el documento compile aún si hay referencias rotas,
/// mostrando un mensaje en lugar de la referencia.
///
/// - mensaje (content): Mensaje a mostrar.
/// - doc (content): Documento a aplicar la regla.
/// -> content
#let permite-ref-rotas(mensaje: text(fill: red, "<ref>"), doc) = {
  show ref: it => {
    if it.element == none {
      mensaje
    }
  }
  doc
}

/// Aplica los estilos por defecto a las figuras con alguno de los `kind`
/// especificados.
///
/// - kind-target (array): Lista de strings con los kind a afectar.
/// - doc (content): Documento a aplicar las reglas.
/// -> content
#let estilos-figure(kind-target: ("image", "table"), doc) = {
  let style-acc = (it) => it
  for kind in kind-target {
    style-acc = (it) => {
      show figure.where(kind: kind): set block(width: 80%)
      it
    }
  }
  style-acc(doc)
}

/// Esta show rule es para utiliza en archivos que no sean `main.typ`,
/// con la idea es permitir que estos archivos sean compilables por separado.
/// Esto es útil para mantener el proyecto ordenado, como también si el documento
/// es demasiado grande como para que la webapp compile en tiempo real.
/// Esta show rules no tienen ningún efecto si el archivo a compilar es `main.typ`.
///
/// - doc (content): Documento a aplicar la regla.
/// -> content
#let permite-compilar-secundarios(doc) = {
  show: permite-ref-rotas-fuera-de-main
  
  doc
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
  return help-leaf("rules")(nombre)
}
