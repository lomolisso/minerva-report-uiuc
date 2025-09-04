#import "../minerva-report-uiuc.typ" as minerva
#import "meta.typ" as meta

#show: minerva.report.with(
  meta,
  showrules: true,
)

//#minerva.abstract[
// The abstract of the report would go here
//]

#outline()

= Writing Simple Paragraphs
Typst is very similar to Markdown and you can use special character sequences to style
text. For example, you can use *bold* text, _italic_ text, and
`monospace` text like `typst watch main.typ`.

A new paragraph is created simply by leaving a blank line.

== The equals symbol `=` is used to create a heading
In LaTeX you use `\` to use commands, in Typst we use `#`. There are many
utilities like emoji #emoji.face.happy, calculation functions #calc.binom(10, 4), and
time conversions #duration(days: 5).minutes()

= Elements
Documents in Typst are formed by combining content. Content is obtained by calling
_element functions_. Here are some of the most important ones:

== Equations
Inline equations are made with dollar signs `$`, like this:
$sqrt(epsilon/phi + c/d)$

And on their own line with `$ x $`, spaces are important:
$ sqrt(epsilon/phi + c/d) $

== Figures and References
A figure is introduced with `figure`:
#figure(
  caption: "A table within a figure.",
  table(columns: 2)[name][time][Travel to UIUC][30 minutes]
) <my-table>

We add `<my-table>` to the table so we can reference it with @my-table

= Need More Help?
The Typst documentation is excellent for explaining key concepts.
- You can start by reading the tutorial: https://typst.app/docs/tutorial/
- If you have LaTeX experience, the guide for LaTeX users is a good starting point: https://typst.app/docs/guides/guide-for-latex-users/
- For specific questions, there's the Typst Discord server: https://discord.gg/2uDybryKPe

= Show Rules and Utilities
The template includes some optional show rules and general utilities. More documentation in the #link("https://github.com/Dav1com/minerva-report-uiuc/blob/master/README.md")[README.md].

== Getting Help
You can see that there's a `minerva.rules` module with various functions. That's what the `help` functions are for!

All template modules have this function and it serves to get documentation about a specific function:

#minerva.rules.help("first-heading-new-page")
