#import "../meta.typ": *
#import "../minerva-report-uiuc.typ" as minerva

#let title = "Minerva Report"
#let subtitle = "Quick and easy reports."
#let topic = "v" + package-version
#let url = "https://github.com/Dav1com/minerva-report-uiuc"

#let department = minerva.departments.grainger
#let course = ""

#let dates = ( // dates dictionary, if the title page doesn't support
  Creation: minerva.util.format-date(datetime.today())
)
#let location = "Urbana, Illinois"

#let author = (name: "David Ibáñez", netid: "dibanez")
#let teaching-team = none

#let abstract = [
  *Minerva Report UIUC* is a Typst template for assignment reports, labs, or projects. Designed for students and faculty at the University of Illinois at Urbana-Champaign.
]

