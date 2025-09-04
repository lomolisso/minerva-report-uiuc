/// Adds metadata and state necessary for other template functions.
/// If you want to create your own header, it is recommended to pass it
/// through this function.
///
/// - it (content): Header content.
/// -> content
#let base(it) = {
  metadata((marker: "PAGE-START"))
  set block(spacing: 0pt, clip: false)
  set par(leading: 0.4em)
  it
}

/// An empty header.
///
/// - meta (dictionary, module): Contents of the **meta.typ** file
/// -> content
#let no-header(meta) = base[]

/// The default header.
/// - meta (dictionary, module): Contents of the **meta.typ** file
/// - roman-until-first-heading (bool): If true, pages before the
///   first heading with numbering use lowercase Roman numerals.
///   Default is `true`.
/// -> content
#let header1(
  meta,
  roman-until-first-heading: true
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

      if heading-found != none {
        heading-found.body
      }
    }
  ][
    #set align(right + bottom)
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
  #v(8pt)
  #line(length: 100%, stroke: 0.4pt)
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
  return help-leaf("header")(name)
}
