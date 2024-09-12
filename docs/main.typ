#import "../meta.typ": *
#import "tidy-things.typ" as tidy
#import "meta.typ" as meta
#import "@preview/minerva-report-fcfm:0.3.0" as minerva

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

#show: minerva.report.with(
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
La configuración se realiza de 2 formas, primero, los valores generales sobre el informe, como curso, título y autores van en el archivo *meta.typ*, mientras que el cómo se quiere que se vea el documento se configura en la función `report`.

= Documentación

#tidy.show-main

#for lib in tidy.show-libs {
  lib
}


