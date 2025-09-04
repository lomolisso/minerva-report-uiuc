

/// Makes the first heading with numbering appear on a new page. This
/// show rule is applied by default in the template. It can be disabled
/// using the `showrules: false` parameter in the template's show rule.
/// It can be reactivated by adding this line:
/// ```typ
/// show: first-heading-new-page
/// ```
///
/// - doc (content): Document to apply the rule to.
/// -> content
#let first-heading-new-page(doc) = {
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
  return help-leaf("rules")(name)
}
