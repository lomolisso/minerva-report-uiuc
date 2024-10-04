/// Descripción del Área de Humanidades
/// -> Departamento
#let adh = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Área de Humanidades"
  ),
  logo: read.with("../logos/adh.svg")
)

/// Descripción del Departamento de Astronomía
/// -> Departamento
#let das = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Astronomía"
  ),
  logo: read.with("../logos/das.svg")
)

/// Descripción del Departamento de Ciencias de la Computación
/// -> Departamento
#let dcc = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ciencias de la Computación"
  ),
  logo: read.with("../logos/dcc.svg")
)

/// Descripción del Departamento de Física
/// -> Departamento
#let dfi = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Física"
  ),
  logo: read.with("../logos/dfi.svg")
)

/// Descripción del Departamento de Geofísica
/// -> Departamento
#let dgf = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Geofísica"
  ),
  logo: read.with("../logos/dgf.svg")
)

/// Descripción del Departamento de Ingeniería Civil
/// -> Departmento
#let dic = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Civil"
  ),
  logo: read.with("../logos/dic.svg")
)

/// Descripción del Departamento de Ingeniería Electrica
/// -> Departmento
#let die = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Eléctrica"
  ),
  logo: read.with("../logos/die.svg")
)

/// Descripción del Departamento de Ingeniería Industrial
/// -> Departmento
#let dii = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Industrial"
  ),
  logo: read.with("../logos/dii.svg")
)

/// Descripción del Departamento de Ingeniería Matemática
/// -> Departmento
#let dim = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Matemática"
  ),
  logo: read.with("../logos/dim.svg")
)

/// Descripción del Departamento de Ingeniería Mecánica
/// -> Departmento
#let dimec = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Mecánica"
  ),
  logo: read.with("../logos/dimec.svg")
)

/// Descripción del Departamento de Ingeniería de Minas
/// -> Departmento
#let dimin = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería de Minas"
  ),
  logo: read.with("../logos/dimin.svg")
)

/// Descripción del Departamento de Ingeniería Química, Biotecnología y Materiales
/// -> Departmento
#let diqbm = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Departamento de Ingeniería Química, Biotecnología y Materiales"
  ),
  logo: read.with("../logos/diqbm.svg")
)

/// Descripción del Departamento de Geología
/// -> Departmento
#let geo = (
  nombre: (
    "Universidad de Chile",
    "Facultad de Ciencias Físicas y Matemáticas",
    "Deparamento de Geología"
  ),
  logo: read.with("../logos/geo.svg")
)

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
  return help-leaf("departamentos")(nombre)
}
