#import "../meta.typ" as package-meta
#import "@preview/tidy:0.3.0" as tidy
#import "tidy-things.typ" as tidy-things
#import "meta.typ" as meta
#import "../minerva-report-fcfm.typ" as minerva

#set document(
  title: "Documentación de Minerva Report",
  author: "David Ibáñez <@Dav1com>",
  keywords: ("article", "fcfm", "report"),
)

#set text(
  font: "Linux Libertine",
  lang: "es",
  region: "cl",
)

#show link: underline
#show link: set text(fill: color.rgb("#1e8f6f"))

#show heading.where(level: 1): smallcaps

#show: minerva.informe.with(
  meta,
  portada: minerva.front.portada-simple,
  header: minerva.header.sin-header,
  footer: minerva.footer.footer-numero,
)

#show heading.where(level: 1): it => {
  v(2cm, weak: true)
  it
}

= Introducción
El objetivo del template es permitir a estudiantes de la Facultad de Ciencias Físicas y Matemáticas escribir informes de forma sencilla, y rápida. Reduciendo mucho la cantidad de archivos y código inecesario que solo se ven como ruido para el usuario final.

Además debe presentarse con un aspecto familiar para quienes llevan años utilizando templates en otros sistemas de documentos.

= Configuración
La configuración se realiza de 2 formas, primero, los valores generales sobre el informe, como curso, título y autores van en el archivo *meta.typ*, mientras que el cómo se quiere que se vea el documento se configura en la función #link(label("minervainforme()"))[`informe`].

== meta.typ
#let show-type = tidy.styles.default.show-type.with(style-args: tidy.styles.default)
La mayoría de valores permiten utilizar un #show-type("str"), un #show-type("array") de strings o #show-type("content"). La única excepción es autores, ya que se usa para configurar el autor del PDF!

También se puede configurar la intitución del informe, esto se hace en `departamento`, los departamentos incluidos y cómo crear el tuyo propio está en #link(label("departamentos"))[`departamentos`].

= Documentación

#show: package-meta.help-show
#show heading.where(numbering: none): it => [
  #it
]

#tidy-things.show-main

#for lib in tidy-things.show-libs {
  lib
}


