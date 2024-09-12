#import "../meta.typ": *

/// Arreglo con los meses en español.
/// -> array
#let meses = ("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
              "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre")

/// Arreglo con los días de la semana en español.
/// -> array
#let dias = ("Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo")

/// Aplica el formato "[day] de [month repr: long] del [year]" en español
/// 
/// - fecha (datetime): fecha a dar formato.
/// -> string
#let formato-fecha(fecha) = {
  return str(fecha.day()) + " de " + meses.at(fecha.month()-1) + " de " + str(fecha.year())
}

/// Esta función permite obtener ayuda sobre cualquier función
/// del template. Para saber qué funciones y variables define
/// el template simplemente deja que el autocompletado te guie,
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
  return help-leaf("util")(nombre)
}
