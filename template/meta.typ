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

// Author is a single dictionary with name (required), netid (optional), uin (optional)
#let author = (name: "Student Name", netid: "student1", uin: "123456789")

// Partners is nullable and defaults to none
// If partners is specified, author must be provided
// Partners can be a single dictionary or an array of dictionaries with the same structure as author
#let partners = none  // Set to none to not display partners
// Example with partners:
// #let author = (name: "Main Student", netid: "main", uin: "111111111")
// #let partners = ((name: "Partner1", netid: "partner1"), (name: "Partner2", uin: "222222222"))

#let teaching-team = (
  Professors: ("Professor1", "Professor2"),
  TA: "PrimaryTA",
  Assistant: [
    Assistant1 \
    Assistant $1+1$
  ],
)
