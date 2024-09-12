#import "preamble.typ": *
#import "@preview/tidy:0.3.0" as tidy
#import "../meta.typ" as package-meta

#let _main = tidy.parse-module(
  main-file,
  name: "minerva",
  require-all-parameters: true
)

#let main = {
  let main_functions = _main
  main_functions.variables = main_functions.variables.filter(it => it.type != "module")
  main_functions
}

#let main_submodules = {
  let main_modules = _main
  main_modules.functions = ()
  main_modules.variables = main_modules.variables.filter(it => it.type == "module")
  main_modules
}

#let libs = {
  let dict = (:)
  for (name, file) in lib-files {
    dict.insert(name,
      tidy.parse-module(
        file,
        name: name,
        require-all-parameters: true
      )
    )
  }
  dict
}

#let show-main = {
  set heading(numbering: none)
  show heading.where(level: 2): set heading(numbering: "1.")
  tidy.show-module(main, show-outline: false)
}

#let show-libs = {
  let arr = ()
  for (name, lib) in libs {
    arr.push[
      #set heading(numbering: none)
      #show heading.where(level: 2): set heading(numbering: "1.")
      
      #tidy.show-module(
        lib,
        show-outline: false,
        style: package-meta.tidy-styles()
      )
    ]
  }
  arr
}
