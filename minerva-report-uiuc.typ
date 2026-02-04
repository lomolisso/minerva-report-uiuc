/// This function allows you to get help on any template function.
/// To see what functions and variables the template defines,
/// let autocomplete guide you, then call this function for more help.
///
/// - name (str): Can be the name of a function or
///                    variable, in which case the function provides
///                    general help about it. If something of the form
///                    `"help(name)"` is provided, it gives specific
///                    help about the `name` argument.
/// -> content
#let help(name) = {
  import "@preview/tidy:0.4.1" as tidy
  import "meta.typ": *
  let help = tidy.generate-help(
    namespace: local-namespace("minerva-report-uiuc.typ"),
    package-name: package-name,
    style: tidy-styles()
  )

  show: help-show
  help(name)
}

#import "lib/states.typ" as states
/// Contains state variables used by the template.
/// -> module
#let states = states

#import "lib/util.typ" as util
/// Contains various utilities, including fixes and functions that
/// help with localization and formatting.
/// -> module
#let util = util

#import "lib/rules.typ" as rules
/// Contains show and set rules that are not essential to the template
/// and can be activated as desired.
/// -> module
#let rules = rules

#import "lib/front.typ" as front
/// Contains various title pages.
/// -> module
#let front = front

#import "lib/header.typ" as header
/// Contains various headers.
/// -> module
#let header = header

#import "lib/footer.typ" as footer
/// Contains various footers.
/// -> module
#let footer = footer

#import "lib/departments.typ" as departments
/// List of departments, units and centers at the University of Illinois at Urbana-Champaign.
///
/// A department is a dictionary with a name, and optionally a logo,
/// for example:
///
/// ```typ
/// let my-department = (
///   name: (
///      "University of Illinois at Urbana-Champaign",
///      "The Grainger College of Engineering",
///      "Department of Computer Science"
///   ),
///   logo: read("logos/cs.png")
/// )
/// ```
/// -> module
#let departments = departments


/******************************************************************************
 *           Template
 *
 *****************************************************************************/

/// Function that applies the template styles for reports.
///
/// - meta (dictionary, module): The `meta.typ` file.
/// - title-page (function): Title page to use.
/// - header (function): Header to use.
/// - footer (function): Footer to use.
/// - title-page-margins (dictionary): Title page margins.
/// - margins (dictionary): Document margins.
/// - showrules (bool): If `true`, irreversible show rules will be applied.
///   If more customization is needed, I recommend disabling this.
/// - heading-numbering (string, none): Numbering scheme for headings.
///   Use `none` to disable heading numbering. Default is `"1."`.
/// - doc (content): Document to apply the template to.
/// -> content
#let report(
  meta,
  title-page: front.title-page1,
  header: header.header1,
  footer: footer.footer1,
  title-page-margins: (top: 3.5cm),
  margins: (top: 3.5cm),
  showrules: true,
  heading-numbering: "1.",
  doc
) = {
  let title-page-set-extra = (:)
  if title-page-margins != (:) {
    title-page-set-extra.insert("margin", title-page-margins)
  }

  // Convert meta to dictionary for safe access
  let meta-dict = dictionary(meta)
  
  // Extract author name for document metadata
  let doc-author = if meta-dict.at("author", default: none) != none {
    meta-dict.author.name
  } else {
    none
  }

  set document(title: meta.title, author: doc-author, date: datetime.today())
  set page(header: header(meta), footer: footer(meta), margin: margins)
  set text(lang: "en", region: "us", hyphenate: true)

  set heading(numbering: heading-numbering)
  set par(leading: 0.5em, justify: true, linebreaks: "optimized")

  set math.equation(numbering: "(1)")

  show figure.where(kind: table): set block(width: 80%)
  show figure.where(kind: image): set block(width: 80%)

  if title-page != none {
    set page(header: [], footer: [], ..title-page-set-extra)
    title-page(meta)
  }

  set page(numbering: "1")

  if showrules {
    show: rules.first-heading-new-page

    doc
  } else {
    doc
  }
}

/// Creates an abstract that does not appear in the table of contents (outline).
///
/// - body (content): Body of the abstract.
/// -> content
#let abstract(body) = [
  #heading(level: 1, numbering: none, outlined: false)[Abstract]
  #body
  #pagebreak(weak: true)
]

#let summary = abstract