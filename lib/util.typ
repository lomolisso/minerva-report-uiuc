#import "../meta.typ": *

/// Array with months in English.
/// -> array
#let months = ("January", "February", "March", "April", "May", "June", "July",
              "August", "September", "October", "November", "December")

/// Array with days of the week in English.
/// -> array
#let days = ("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

/// Applies the format "[month repr: long] [day], [year]" in English
///
/// - date (datetime): date to format.
/// -> string
#let format-date(date) = {
  return months.at(date.month()-1) + " " + str(date.day()) + ", " + str(date.year())
}

/// This function allows you to get help on any template function.
/// To see what functions and variables the template defines,
/// let autocomplete guide you, then call this function for more help.
///
/// - name (string): Can be the name of a function or
///                    variable, in which case the function provides
///                    general help about it. If something of the form
///                    `"help(name)"` is provided, it gives specific
///                    help about the `name` argument.
/// -> content
#let help(name) = {
  import "../meta.typ": *
  return help-leaf("util")(name)
}
