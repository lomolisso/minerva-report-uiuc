#import "../meta.typ": *
#import "../minerva-report-fcfm.typ" as minerva

#let titulo = "Informe Minerva"
#let subtitulo = "Informes rápidos y fáciles."
#let tema = "v" + package-version
#let url = "https://github.com/Dav1com/minerva-report-fcfm"

#let departamento = minerva.departamentos.dcc
#let curso = ""

#let fechas = ( // diccionario de fechas, si la portada no soporta
  Creación: minerva.util.formato-fecha(datetime.today())
)
#let lugar = "Santiago, Chile"

#let autores = "David Ibáñez"
#let equipo-docente = none

#let resumen = [
  *Minerva Report FCFM* es un template de Typst para informes de tareas, laboratorios o trabajos. Pensado para estudiantes y académicos de la Facultad de Ciencias Físicas y Matemáticas de la Universidad de Chile.
]

