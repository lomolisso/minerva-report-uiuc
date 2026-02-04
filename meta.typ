/** meta.typ
 *
 * File for constants and styles used in documentation,
 * and other elements about the package itself.
 */
#import "@preview/tidy:0.4.1" as tidy

#let minerva() = {
  import "minerva-report-uiuc.typ" as minerva
  return minerva
}

#let package-name = "minerva-report-uiuc"
#let package-version = "0.1.2"
#let package-version-arr = (0,1,2)

#let global-namespace = (
  "minerva": read.with("minerva-report-uiuc.typ"),
  "minerva.departments": read.with("lib/departments.typ"),
  "departments": read.with("lib/departments.typ"),
  "minerva.footer": read.with("lib/footer.typ"),
  "footer": read.with("lib/footer.typ"),
  "minerva.front": read.with("lib/front.typ"),
  "front": read.with("lib/front.typ"),
  "minerva.header": read.with("lib/header.typ"),
  "header": read.with("lib/header.typ"),
  "minerva.rules": read.with("lib/rules.typ"),
  "rules": read.with("lib/rules.typ"),
  "minerva.states": read.with("lib/states.typ"),
  "states": read.with("lib/states.typ"),
  "minerva.util": read.with("lib/util.typ"),
  "util": read.with("lib/util.typ"),
)

#let global-scope() = ("minerva": minerva())

#let local-namespace(local-file) = {
  let local = global-namespace
  local.insert(".", read.with(local-file))
  return local
}

#let tidy-styles() = { // workaround to inject "minerva" to the example scope
  import tidy.styles: default, help
  let mine = dictionary(default)
  mine.insert("show-example", (..args) => {
    let outer-scope = args.named().at("scope", default: (:))
    return help.show-example(..args, scope: outer-scope + global-scope())
  })
  return mine
}

#let help-show(doc) = {
  show heading: it => {
    show "Parameters": "Parameters"
    show "Example": "Example"
    it
  }
  show regex("^Default"): "Default"

  doc
}

#let help-leaf(module-name) = {
  let file-name = "lib/" + module-name + ".typ"
  let base-func = tidy.generate-help(
    namespace: local-namespace(file-name),
    package-name: package-name + module-name,
    style: tidy-styles()
  )

  return (..args) => {
    show: help-show
    base-func(..args)
  }
}
