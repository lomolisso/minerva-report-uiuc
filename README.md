# Minerva Report UIUC

A professional template for assignments, reports, and academic papers designed for students and faculty at the University of Illinois at Urbana-Champaign. Perfect for those familiar with LaTeX templates who want a modern, streamlined solution.

## Quick Start

### Development Setup
Since this template is not yet published to the Typst universe, you'll need to clone or download this repository to use it locally.

1. Clone this repository:
```sh
git clone https://github.com/Dav1com/minerva-report-uiuc.git
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

The `authors` field accepts either a `string` or an `array` of strings.

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

## Comprehensive Guide
For more detailed information, please refer to the comprehensive guide available in the repository. 
