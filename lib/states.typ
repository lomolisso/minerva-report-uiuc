/// This is a `state` that is used by the template to
/// know if the document being compiled is `main.typ`
/// or a secondary document.
///
/// -> state
#let is-main = state("minerva.is-main", false)

/// This function allows you to get help on any template function.
/// To see what functions and variables the template defines,
/// let autocomplete guide you, then call this function for more help.
///
/// - name (string): Can be the name of a function or
///                    variable, in which case the function provides
///                    general help about it. If something of the form
///                    `"help(name)"` is provided, it gives specific
///                    help about the `name` argument.
/// -> content
#let help(name) = {
  import "../meta.typ": *
  return help-leaf("states")(name)
}
