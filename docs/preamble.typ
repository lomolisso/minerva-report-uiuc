#import "../minerva-report-uiuc.typ" as minerva

#let main-file = read("../minerva-report-uiuc.typ")

#let lib-files = {
  let names = ("departments", "footer", "front", "header", "rules", "states", "util")

  let dict = (:)

  for name in names {
    dict.insert(name, read("../lib/" + name + ".typ"))
  }

  dict
}
