#import "../minerva-report-fcfm.typ" as minerva

#let main-file = read("../minerva-report-fcfm.typ")

#let lib-files = {
  let names = ("departamentos", "footer", "front", "header", "rules", "states", "util")

  let dict = (:)

  for name in names {
    dict.insert(name, read("../lib/" + name + ".typ"))
  }

  dict
}
