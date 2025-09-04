#import "../minerva-report-uiuc.typ" as minerva

#let title = "Minerva Report"
#let subtitle = "Typst Template"
#let topic = "Learning to use the template"

#let department = minerva.departments.grainger
#let course = "CS 101 - Introduction to Computer Science"

#let dates = ( // dates dictionary
  completion: "April 14, 2024",
  submission: minerva.util.format-date(datetime.today())
)
#let location = "Urbana, Illinois"

#let authors = ("Student1", "Student2")
#let teaching-team = (
  Professors: ("Professor1", "Professor2"),
  TA: "PrimaryTA",
  Assistant: [
    Assistant1 \
    Assistant $1+1$
  ],
)
