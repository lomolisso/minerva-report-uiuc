/// Description of The Grainger College of Engineering
/// -> Department
#let grainger = (
  name: (
    "University of Illinois at Urbana-Champaign",
    "The Grainger College of Engineering"
  ),
  logo: image("../logos/grainger.png")
)

/// This function allows you to get help on any template function.
/// To see what functions and variables the template defines,
/// let autocomplete guide you, then call this function for more help.
///
/// - name (string): Can be the name of a function or
///                 variable, in which case the function provides
///                 general help about it. If something of the form
///                 `"help(name)"` is provided, it gives specific
///                 help about the `name` argument.
/// -> content
#let help(name) = {
  import "../meta.typ": *
  return help-leaf("departments")(name)
}
