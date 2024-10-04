# Minerva Report FCFM

Template para hacer tareas, informes y trabajos, para estudiantes y académicos de la Facultad de Ciencias Físicas y Matemáticas de la Universidad de Chile que han usado templates similares para LaTeX.

## Guía Rápida

### [Webapp](https://typst.app)
Si utilizas la webapp de Typst puedes presionar "Start from template" y buscar "minerva-report-fcfm" para crear un nuevo proyecto con este template.

### Typst CLI
Teniendo el CLI con la versión 0.11.1 o mayor, puedes realizar:
```sh
typst init @preview/minerva-report-fcfm:0.3.0
```
Esto va a descargar el template en la cache de typst y luego va a iniciar el proyecto en la carpeta actual.

## Configuración
La mayoría de la configuración se realiza a través del archivo `meta.typ`,
allí podrás elegir un título, indicar los autores, el equipo docente, entre otras configuraciones.

El campo `autores` solo puede ser `string` o un `array` de strings.

La configuración `departamento` puede ser personalizada a cualquier organización pasandole un diccionario de esta forma:
```typ
#let departamento = (
  nombre: (
    "Universidad Técnica Federico Santa María",
    "Factultad"
  )
)
```

Las demás configuraciones pueden ser un `content` arbitrario, o un `string`.

## Guía Extensiva
Más información la puedes encontrar en la guía 
