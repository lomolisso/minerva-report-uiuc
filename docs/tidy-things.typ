#import "preamble.typ": *
#import "@preview/tidy:0.4.1" as tidy
#import "../meta.typ" as package-meta

#let _main = tidy.parse-module(
  main-file,
  name: "minerva",
  require-all-parameters: true
)

#let main = {
  let main-functions = _main
  main-functions.variables = main-functions.variables.filter(it => it.type != "module")
  main-functions
}

#let main-submodules = {
  let main-modules = _main
  main-modules.functions = ()
  main-modules.variables = main-modules.variables.filter(it => it.type == "module")
  main-modules
}

#let libs = {
  let dict = (:)
  for (name, file) in lib-files {
    dict.insert(name,
      tidy.parse-module(
        file,
        require-all-parameters: true
      )
    )
  }
  dict
}

#let show-main = {
  set heading(numbering: none)
  show heading.where(level: 2): set heading(numbering: "1.")
  tidy.show-module(main, show-outline: false, style: package-meta.tidy-styles())
}

#let show-libs = {
  libs.pairs().map((pair) => [
    #let name = pair.first()
    #let lib = pair.last()
    #set heading(numbering: none)
    #show heading.where(level: 2): set heading(numbering: "1.")
    
    #[== #name] #label(name)
    
    #tidy.show-module(
      lib,
      show-outline: false,
      style: package-meta.tidy-styles() 
    )
  ])
}
