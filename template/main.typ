#import "@preview/minerva-report-fcfm:0.3.0" as minerva
#import "meta.typ" as meta

#show: minerva.report.with(
  meta,
  showrules: true,
)

//#minerva.resumen[
// Aquí iría el resumen del informe
//]

#outline()

= Escribiendo simples parrafos
Typst se parece mucho a Markdown y secuencias de carácteres especiales puedes dar
estilo al texto, por ejemplo, puedes usar negrite *abc*, itálica _oooo_ y
monoespaciado `typst watch main.typ`.

Un parrafo nuevo se hace simplemente dejando una línea en blanco.

== El símbolo igual `=` se usa para crear un título
En LaTeX se usa `\` para utilizar comandos, en Typst usamos `#`, hay muchas
utilidades como emoji #emoji.face.happy, funciones de cálculo #calc.binom(10, 4), y
conversiones de tiempo #duration(days: 5).minutes()

= Elementos
Los documentos en Typst se forman uniendo contenido, el contenido se obtiene
llamando _element functions_, a continuación las más importantes

== Ecuaciones
Las ecuaciones dentro de línea se hacen con símbolos peso `$`, así:
$sqrt(epsilon/phi + c/d)$

Y en su propia línea con `$ x $`, los espacios son importantes:
$ sqrt(epsilon/phi + c/d) $

== Figuras y referencias
Una figura se introduce con `figure`:
#figure(
  caption: "Una tabla dentro de una figura.",
  table(columns: 2)[nombre][tiempo][Viajar a la U][30 minutos]
) <mi-tabla>

A la tabla le agregamos `<mi-tabla>` para poder referenciarlar con @mi-tabla

= Necesitas más ayuda?
La documentación de typst es muy buena explicando los conceptos claves para usarlo.
- Puedes partir leyendo el tutorial: https://typst.app/docs/tutorial/
- Si tienes expericiencia en LaTeX, entonces la guía para usuarios de LaTeX es un buen punto de partida: https://typst.app/docs/guides/guide-for-latex-users/
- Para consultas específicas, está el servidor de Discord de Typst: https://discord.gg/2uDybryKPe

= Show rules y Utilidades
El template incluye algunas show rules opcionales y utilidades generales, más documentación en el #link("https://github.com/Dav1com/minerva-report-fcfm/blob/master/README.md")[README.md].

== Obteniendo Ayuda
Puedes ver que existe un módulo `minerva.rules` con una función `formato-numeros-es`, pero qué hace exactamente? para eso están las funciones `help`!

Todos los módulos del template tienen esta funciíón y sirve para obtener documentación sobre una función en específico:

#minerva.rules.help("formato-numeros-es")
