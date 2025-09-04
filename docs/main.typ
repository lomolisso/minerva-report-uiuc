#import "../meta.typ" as package-meta
#import "@preview/tidy:0.4.1" as tidy
#import "tidy-things.typ" as tidy-things
#import "meta.typ" as meta
#import "../minerva-report-uiuc.typ" as minerva

#set document(
  title: "Minerva Report Documentation",
  author: "David Ibáñez <@Dav1com>",
  keywords: ("article", "uiuc", "report"),
)

#set text(
  font: "Libertinus Serif",
  lang: "en",
  region: "us",
)

#show link: underline
#show link: set text(fill: color.rgb("#1e8f6f"))

#show heading.where(level: 1): smallcaps

#show: minerva.report.with(
  meta,
  title-page: minerva.front.title-page-simple,
  header: minerva.header.no-header,
  footer: minerva.footer.footer-number,
  margins: (top: 3.5cm),
)

#show heading.where(level: 1): it => {
  v(2cm, weak: true)
  it
}

= Introduction
The goal of this template is to allow students at the University of Illinois at Urbana-Champaign to write reports in a simple and fast way. It greatly reduces the amount of unnecessary files and code that only appear as noise to the end user.

Additionally, it should present a familiar appearance for those who have been using templates in other document systems for years.

= Configuration
Configuration is done in 2 ways: first, general values about the report, such as course, title, and authors go in the *meta.typ* file, while how the document should look is configured in the `report` function.

== meta.typ
#let show-type = tidy.styles.default.show-type.with(style-args: tidy.styles.default)
Most values allow using a #show-type("str"), an #show-type("array") of strings, or #show-type("content"). The only exception is authors, as it is used to configure the PDF author!

You can also configure the institution of the report, this is done in `department`. The included departments and how to create your own is in #link(label("departments"))[`departments`].

= Documentation

#show: package-meta.help-show
#show heading.where(numbering: none): it => [
  #it
]

#tidy-things.show-main

#for lib in tidy-things.show-libs {
  lib
}


