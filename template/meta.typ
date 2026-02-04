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

// Authors can be:
// - A single string: "Student Name"
// - A single dictionary with name (required), netid (optional), uin (optional):
//   (name: "Student Name", netid: "netid1", uin: "123456789")
// - An array of the above formats:
//   ((name: "Student1", netid: "netid1"), (name: "Student2", uin: "987654321"))
#let authors = (
  (name: "Student1", netid: "student1", uin: "123456789"),
  (name: "Student2", netid: "student2")
)

// Partners is nullable and defaults to none
// If partners is specified, authors must be exactly one
// Partners can be in the same formats as authors
#let partners = none  // Set to none to not display partners
// Example with partners:
// #let authors = (name: "Main Student", netid: "main", uin: "111111111")
// #let partners = ((name: "Partner1", netid: "partner1"), (name: "Partner2"))

#let teaching-team = (
  Professors: ("Professor1", "Professor2"),
  TA: "PrimaryTA",
  Assistant: [
    Assistant1 \
    Assistant $1+1$
  ],
)
