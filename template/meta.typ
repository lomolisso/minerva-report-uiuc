#import "@preview/minerva-report-fcfm:0.3.0" as minerva

#let titulo = "Informe Minerva"
#let subtitulo = "Typst"
#let tema = "Aprendiendo a usar el template"

#let departamento = minerva.departamentos.dcc
#let curso = "CC4034 - Composición de Documentos"

#let fechas = ( // diccionario de fechas
  realización: "14 de Abril de 2024",
  entrega: minerva.util.formato-fecha(datetime.today())
)
#let lugar = "Santiago, Chile"

#let autores = ("Integrante1", "Integrante2")
#let equipo-docente = (
  Profesores: ("Profesor1", "Profesor2"),
  Auxiliar: "ÚnicoAuxiliar",
  Ayudante: [
    Ayudante1 \
    Ayudante $1+1$
  ],
)
