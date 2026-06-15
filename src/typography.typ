// Shared typography helpers.

#let colon-space() = context {
  if text.lang == "fr" { [#"\u{00a0}"] } else { [] }
}
