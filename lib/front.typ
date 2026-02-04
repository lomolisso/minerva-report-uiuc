#import "header.typ" as header
#import "footer.typ" as footer
#import "states.typ" as states

/// Creates a page and sets state variables required
/// by other template functions. If you want to extend
/// the template with your own title page, it is recommended
/// to pass it through this function.
///
/// - it (content): Title page content.
/// - ..args (arguments): Arguments to pass to the `page` function
/// -> content
#let base(it, ..args) = {
  return page(..args, {
    states.is-main.update(true)
    it
    counter(page).update(0)
  })
}

/// Basic title page design, perfect for reports and assignments.
///
/// - meta (dictionary): Contents of the **meta.typ** file
/// - title-centered (bool): Whether the title should be centered relative
///   to the page. Default is `false`.
/// -> content
#let title-page1(
  meta,
  title-centered: false,
) = {
  // Get partners with null as default
  let partners = meta.at("partners", default: none)
  
  // Validate: if partners is not null, authors must be exactly one
  if partners != none {
    let author-count = if type(meta.authors) == "array" {
      meta.authors.len()
    } else if type(meta.authors) == "dictionary" {
      1
    } else {
      1  // string
    }
    assert(author-count == 1, message: "When partners is specified, authors must be exactly one")
  }
  
  // Helper function to format an author
  let format-author(author) = {
    if type(author) == "dictionary" {
      let name = author.name
      let netid = author.at("netid", default: none)
      let uin = author.at("uin", default: none)
      
      let parts = (name,)
      if netid != none {
        parts.push("NetID: " + netid)
      }
      if uin != none {
        parts.push("UIN: " + uin)
      }
      parts.join(" | ")
    } else {
      author  // string or content
    }
  }
  
  let members = (:)
  
  // Handle authors
  if type(meta.authors) == "string" or type(meta.authors) == "content" {
    members.insert("Author", format-author(meta.authors))
  } else if type(meta.authors) == "dictionary" {
    members.insert("Author", format-author(meta.authors))
  } else if type(meta.authors) == "array" and meta.authors.len() > 0 {
    let formatted-authors = meta.authors.map(format-author)
    members.insert(
      if meta.authors.len() == 1 {
        "Author"
      } else {
        "Members"
      },
      formatted-authors
    )
  }
  
  // Handle partners if provided
  if partners != none {
    if type(partners) == "string" or type(partners) == "content" {
      members.insert("Partner", format-author(partners))
    } else if type(partners) == "dictionary" {
      members.insert("Partner", format-author(partners))
    } else if type(partners) == "array" and partners.len() > 0 {
      let formatted-partners = partners.map(format-author)
      members.insert(
        if partners.len() == 1 {
          "Partner"
        } else {
          "Partners"
        },
        formatted-partners
      )
    }
  }
  
  // Add teaching team if present
  if meta.at("teaching-team", default: none) != none {
    members = members + meta.teaching-team
  }

  let header = header.base[
    #grid(columns: (auto, 1fr), rows: auto)[
      #set align(left + horizon)
      #for name in meta.department.name [#name \ ]
    ][
      #set align(right + horizon)
      #if meta.department.logo != none {
        let logo-raw = if type(meta.department.logo) == function {
          meta.department.at("logo")()
        } else {
          meta.department.logo
        }

        box(height: 50pt, move(dy: 0pt, logo-raw))
      }
    ]
    #v(-2pt)
    #line(length: 100%, stroke: 0.4pt)
  ]

  let member-table-args = ()
  for (category, names) in members {
    member-table-args.push[#category:]
    member-table-args.push[
      #if type(names) == array {
        for name in names [#name \ ]
      } else {
        names
      }
    ]
  }

  let title = align(center, {
      set text(size: 25pt)
      if meta.title != none {
        meta.title
        linebreak()
      }
      if meta.subtitle != none {
        meta.subtitle
        linebreak()
      }
      if meta.topic != none {
        meta.topic
      }
    })
  
  let member-table = grid(columns: (1fr, auto), rows: auto)[][
      #grid(columns: 2, rows: auto, row-gutter: 10pt, column-gutter: 5pt, ..member-table-args)
  
      #for (name, date) in meta.dates [
        Date of #name: #date \
      ]
      #meta.location
    ];
  
  let member-table-wrapper = {
    if title-centered {
      (it) => place(bottom+right, align(top+left, it))
    } else {
      (it) => it
    }
  }

  return base(header: header)[
    #v(1fr)
    #title
    #v(1fr)
    #member-table-wrapper(grid(columns: (1fr, auto), rows: auto, [], member-table))
  ]
}

/// Title page that contains the abstract and outline on one page.
///
/// - meta (dictionary, module): Contents of the **meta.typ** file.
/// - spacing (length): Spacing between the main elements of the title page.
/// - include-outline (boolean): Whether to include an outline.
/// -> content
#let title-page-simple(
  meta,
  spacing: 4cm,
  include-outline: false
) = {
  let meta = dictionary(meta)
  
  // Helper function to format an author for simple display
  let format-author-simple(author) = {
    if type(author) == "dictionary" {
      author.name
    } else {
      author  // string or content
    }
  }
  
  let authors = if type(meta.authors) == array {
    meta.authors.map(format-author-simple).join(", ")
  } else if type(meta.authors) == "dictionary" {
    format-author-simple(meta.authors)
  } else {
    meta.authors
  }

  return base(margin: (x: 4cm), align(center + horizon)[
    #set heading(numbering: none, outlined: false)
    #set text(size: 13pt)

    #let page-content(main-spacing) = stack(dir: ttb, spacing: main-spacing,
      stack(dir: ttb, spacing: 2cm,
        [
          #text(size: 20pt)[*#meta.title*]

          #set text(tracking: 1pt)
          #meta.subtitle
        ],
        [
          #stack(dir: ltr, spacing: 2cm, meta.topic, authors)

          #if meta.at("url", default: none) != none {
            link(meta.url)
          }
        ]
      ),
      ..if meta.at("abstract", default: none) != none {
        ([
          = Abstract
          #meta.abstract],)
      } else {
        ()
      },
      outline(depth: 2)
    )
    
    #layout(size => {
      let desired = measure(page-content(spacing))
      if desired.height > size.height {
        page-content(1fr)
      } else {
        page-content(spacing)
      }
    })
  ])
}

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
  return help-leaf("front")(name)
}
