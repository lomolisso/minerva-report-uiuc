/// Adds metadata and state necessary for other template functions.
/// If you want to create your own footer, it is recommended to pass it
/// through this function.
///
/// - it (content): Footer content.
/// -> content
#let base(it) = {
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
  metadata((marker: "PAGE-END"))
}

/// An empty footer.
///
/// - meta (dictionary, module): Contents of the **meta.typ** file
/// -> content
#let no-footer(meta) = base[]

/// A footer with only the page number.
///
/// - meta (dictionary, module): Contents of the **meta.typ** file
/// - roman-until-first-heading (bool): If true, pages before the
///   first heading with numbering use lowercase Roman numerals.
///   Default is `true`.
/// -> content
#let footer-number(
  meta,
  roman-until-first-heading: true
) = base[
  #align(center)[
    #context {
        let headings = query(heading.where(outlined: true))
        let first-numbered-heading = headings.at(0, default: none)

        let numbering = if roman-until-first-heading { "i" } else { "1" }
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

/// The default footer.
/// - meta (dictionary, module): Contents of the **meta.typ** file
/// -> content
#let footer1(meta) = base[
  #set text(style: "italic", weight: 1)

  #line(length: 100%, stroke: 0.4pt)
  #v(8pt)
  #grid(columns: (auto, 1fr), rows: auto)[
    #set align(left + top)
    #meta.course
  ][
    #set align(right + top)
    #meta.title
  ]
]

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
  return help-leaf("footer")(name)
}