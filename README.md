# Minerva Report UIUC

A professional template for assignments, reports, and academic papers designed for students and faculty at the University of Illinois at Urbana-Champaign. Perfect for those familiar with LaTeX templates who want a modern, streamlined solution.

## Quick Start

### Development Setup
Since this template is not yet published to the Typst universe, you'll need to clone or download this repository to use it locally.

1. Clone this repository:
```sh
git clone https://github.com/lomolisso/minerva-report-uiuc.git
```

2. Copy the `template/` directory to start your project:
```sh
cp -r minerva-report-uiuc/template my-project
cd my-project
```

### Web App
If you're using the Typst web app, you can upload the template files from the `template/` directory to create a new project.

### Typst CLI (Local Development)
For local development, you can work directly with the template files. The template uses relative imports that work when the files are in the same directory structure.

## Configuration
Most configuration is done through the `meta.typ` file,
where you can set the title, authors, course information, and other document details.

### Authors Configuration
The `authors` field now supports structured data to include additional information:

```typ
// Simple string format (still supported)
#let authors = "Student Name"

// Single author with structured data
#let authors = (name: "Student Name", netid: "netid1", uin: "123456789")

// Multiple authors
#let authors = (
  (name: "Student1", netid: "student1", uin: "111111111"),
  (name: "Student2", netid: "student2")  // netid and uin are optional
)
```

**Note:** Only the `name` field is mandatory. `netid` and `uin` are optional.

### Partners Configuration
The template now supports an optional `partners` field that is `none` by default:

```typ
// No partners (default)
#let partners = none

// With partners (when specified, authors must be exactly one)
#let authors = (name: "Main Student", netid: "main", uin: "111111111")
#let partners = (
  (name: "Partner1", netid: "partner1"),
  (name: "Partner2", netid: "partner2", uin: "222222222")
)
```

**Important:** When `partners` is specified (not `none`), the `authors` field must contain exactly one author.

### Department Configuration
The `department` configuration can be customized for any organization by passing a dictionary like this:
```typ
#let department = (
  name: (
    "University of Illinois at Urbana-Champaign",
    "Department of Computer Science"
  )
)
```

Other configurations can be arbitrary `content` or `string` values.

### Advanced Template Options
For more advanced customization, you can modify the template function call in your main document:

```typ
#show: minerva.report.with(
  meta,
  showrules: true,
  heading-numbering: none,  // Disable automatic heading numbering
)
```

Available options:
- `heading-numbering`: Controls heading numbering format. Use `"1."` for standard numbering, or `none` to disable numbering entirely.

## Comprehensive Guide
For more detailed information, please refer to the comprehensive guide available in the repository. 
