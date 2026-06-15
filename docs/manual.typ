// beautitled - User Manual
// ============================================================================
#import "@preview/beautitled:0.2.7": *

#set page(margin: 2.5cm)
#set text(font: "Linux Libertine", size: 11pt)
#set par(justify: true)

#beautitled-setup(
  style: "modern",
  chapter-prefix: "Chapter",
  section-prefix: "Section",
)
#show: beautitled-init

#align(center)[
  #text(size: 32pt, weight: "bold")[beautitled]
  #v(0.5em)
  #text(size: 16pt, fill: gray)[User Manual]
  #v(0.3em)
  #text(size: 11pt, fill: gray)[Version 0.2.7]
  #v(0.5em)
  #text(size: 11pt)[Nathan Scheinmann]
]

#v(2em)

#beautitled-toc(title: "Table of Contents", style: "simple", title-align: left)

#pagebreak()

// ============================================================================
= Introduction

*beautitled* is a Typst package that provides 19 beautiful, print-friendly title styles for documents. It is designed for educational materials, academic papers, textbooks, and any document that needs professional heading styles.

== Features

- *19 distinctive styles* - From classic academic to modern creative
- *Print-friendly* - All styles use minimal ink (no heavy backgrounds)
- *Fully configurable* - Colors, sizes, spacing, and numbering
- *Multilingual* - Customizable prefixes for any language
- *Native Typst support* - Works with `= Heading` syntax
- *Optional parts* - LaTeX-like parts above chapters
- *Four heading levels* - Chapter, section, subsection, subsubsection
- *Cross-references* - `beautitled-ref` for labelled heading refs with optional page numbers

// ============================================================================
= Quick Start

== Installation

```typst
#import "@preview/beautitled:0.2.7": *
```

== Basic Usage

```typst
#import "@preview/beautitled:0.2.7": *

#beautitled-setup(style: "titled")
#show: beautitled-init

= My Chapter Title
== My Section Title
=== My Subsection Title
==== My Subsubsection Title
```

== Parts

Typst has arbitrary heading levels, but no dedicated LaTeX-style `\part`.
*beautitled* adds `#part[...]` and can also remap native headings when parts are enabled.
Using `#part[...]` automatically makes parts the highest outline level for the
rest of the document. Without parts, chapters remain the highest level.

By default (`part-fullpage: true`), each part occupies its own dedicated page with
the title vertically and horizontally centered — matching LaTeX's default `\part` behavior.
Every style has its own coherent part renderer.

```typst
#beautitled-setup(style: "modern")
#show: beautitled-init

#part[Foundations]
#chapter[Numbers]
#section[Integers]
```

=== Part with Image

An optional image can be placed above or below the title on the part page.
The caption uses Typst's native `figure` rendering:

```typst
#part(
  image: image("cover.png", width: 70%),
  image-caption: [A conceptual overview],
  image-position: "below",  // "above" or "below" (default: "below")
)[Advanced Topics]
```

=== Disabling Full-Page Parts

To use inline parts (no dedicated page), set `part-fullpage: false` globally
or override per call:

```typst
#beautitled-setup(part-fullpage: false)

// Or per call:
#part(fullpage: false)[Appendices]
```

=== Native Headings as Parts

With `enable-parts: true`, native headings become:

```typst
#beautitled-setup(style: "modern", enable-parts: true)
#show: beautitled-init

= Foundations
== Numbers
=== Integers
==== Arithmetic
===== Divisibility
```

// ============================================================================
= Configuration

All configuration is done through the `beautitled-setup` function. You can call it multiple times to change settings at any point in your document.

== Complete Parameter Reference

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.4pt + gray,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Parameter*], [*Default*], [*Description*],

  // Style
  [`style`], [`"titled"`], [The visual style to use (see Available Styles)],

  // Colors
  [`primary-color`], [`rgb("#2c3e50")`], [Main color for titles],
  [`secondary-color`], [`rgb("#7f8c8d")`], [Secondary color for labels and decorations],
  [`accent-color`], [`rgb("#2980b9")`], [Accent color for highlights],
  [`background-color`], [`white`], [Background color (rarely used)],

  // Font sizes
  [`part-size`], [`24pt`], [Font size for part titles],
  [`chapter-size`], [`18pt`], [Font size for chapter titles],
  [`section-size`], [`14pt`], [Font size for section titles],
  [`subsection-size`], [`12pt`], [Font size for subsection titles],
  [`subsubsection-size`], [`11pt`], [Font size for subsubsection titles],

  // Numbering
  [`enable-parts`], [`false`], [`false`: `= Heading` is a chapter; `true`: `= Heading` is a part and `== Heading` is a chapter],
  [`show-part-number`], [`true`], [Show part numbers],
  [`show-chapter-number`], [`true`], [Show chapter numbers],
  [`show-section-number`], [`true`], [Show section numbers],
  [`show-subsection-number`], [`true`], [Show subsection numbers],
  [`show-chapter-in-section`], [`true`], [Show chapter info in section labels (titled style)],

  // Prefixes
  [`part-prefix`], [`"Partie"`], [Text before part number],
  [`chapter-prefix`], [`"Chapter"`], [Text before chapter number],
  [`section-prefix`], [`"Section"`], [Text before section number],

  // Spacing
  [`part-above`], [`2em`], [Space above parts],
  [`part-below`], [`1.2em`], [Space below parts],
  [`chapter-above`], [`1.2em`], [Space above chapters],
  [`chapter-below`], [`0.5em`], [Space below chapters],
  [`section-above`], [`0.5em`], [Space above sections],
  [`section-below`], [`0.4em`], [Space below sections],
  [`subsection-above`], [`0.5em`], [Space above subsections],
  [`subsection-below`], [`0.3em`], [Space below subsections],
  [`part-fullpage`], [`true`], [Give each part its own vertically-centred page (LaTeX default)],
  [`part-pagebreak`], [`true`], [Page break before parts after the first (inline mode only)],
  [`chapter-pagebreak`], [`false`], [Page break before chapters after the first],
  [`toc-part-size`], [`14pt`], [Font size for part entries in the table of contents],
)

// ============================================================================
= Available Styles

== Style Categories

=== Original
- *titled* - Boxed sections with floating labels showing chapter info (DEFAULT)

=== General Purpose
- *classic* - Traditional academic with underlines
- *modern* - Clean geometric with accent colors
- *elegant* - Refined with decorative ornaments
- *bold* - Strong left border emphasis
- *creative* - Student portfolio style
- *minimal* - Ultra-clean with maximum whitespace
- *vintage* - Classic book ornamental style

=== Educational
- *schoolbook* - Textbook style for lessons
- *notes* - Course notes and study materials
- *clean* - Maximum simplicity

=== Academic
- *technical* - Engineering documentation style
- *academic* - Professional academic with underlined chapters
- *textbook* - Bold numbers with clear hierarchy
- *scholarly* - Centered chapters with thin rules
- *classical* - Small caps, refined and minimal
- *educational* - Left border with large colored numbers
- *structured* - Boxed chapter numbers
- *magazine* - Editorial/magazine style

// ============================================================================
= Examples

== Example 1: Basic Document with Chapter

#image("/gallery/examples/example-1.png", width: 100%)

*Code:*
```typst
#beautitled-setup(style: "titled", show-chapter-in-section: true)
#show: beautitled-init

= Vector Geometry
== Vector Space
Lorem ipsum dolor sit amet...
=== Basic Definitions
Ut enim ad minim veniam...
```

== Example 2: Without Chapter (Sections Only)

#image("/gallery/examples/example-2.png", width: 100%)

*Code:*
```typst
#beautitled-setup(style: "titled", show-chapter-in-section: false)
#show: beautitled-init

== Vectors
Lorem ipsum dolor sit amet...
=== Vector Addition
Ut enim ad minim veniam...
```

== Example 3: Academic Style with Custom Colors

#image("/gallery/examples/example-3.png", width: 100%)

*Code:*
```typst
#beautitled-setup(
  style: "academic",
  primary-color: rgb("#1a5276"),
  secondary-color: rgb("#5dade2"),
  chapter-size: 20pt,
  section-size: 15pt,
)
#show: beautitled-init

= Introduction to Analysis
== Limits and Continuity
...
```

== Example 4: English Document

#image("/gallery/examples/example-4.png", width: 100%)

*Code:*
```typst
#beautitled-setup(
  style: "scholarly",
  chapter-prefix: "Chapter",
  section-prefix: "Section",
)
#show: beautitled-init

= Theoretical Framework
== Literature Review
...
```

== Example 5: Without Numbering

#image("/gallery/examples/example-5.png", width: 100%)

*Code:*
```typst
#beautitled-setup(
  style: "elegant",
  show-chapter-number: false,
  show-section-number: false,
  show-subsection-number: false,
)
#show: beautitled-init

= Poetry
== Flowers of Evil
...
```

== Example 6: Different Styles Comparison

#image("/gallery/examples/example-6.png", width: 100%)

// ============================================================================
= Table of Contents

beautitled provides a styled table of contents that matches your heading style.

== Basic Usage

```typst
#beautitled-toc()
```

== Custom Title

```typst
#beautitled-toc(title: "Contents")
#beautitled-toc(title: "Table of Contents")
#beautitled-toc(title: "Sommaire")
```

== Parameters

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.4pt + gray,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Parameter*], [*Default*], [*Description*],
  [`title`], [`"Table of Contents"`], [Title displayed above the TOC],
  [`depth`], [`3`], [Maximum heading level to include (1=chapters, 2=+sections, 3=+subsections)],
  [`style`], [`none`], [Override style for TOC (none = use heading style)],
  [`title-align`], [`center`], [Title alignment: `center`, `left`, or `right`],
)

== Simple Style with Sections Only

For a clean, flat TOC showing only sections (no chapters):

```typst
#beautitled-toc(
  title: "Table of Contents",
  style: "simple",
  title-align: left,
  depth: 2,  // Show chapters and sections only
)
```

== Mixing Styles

You can use different styles for your headings and TOC:

```typst
#beautitled-setup(style: "titled")
#show: beautitled-init

// TOC uses "scholarly" style
#beautitled-toc(title: "Contents", style: "scholarly")

= First Chapter
...
```

== TOC Configuration Options

These options can be set via `beautitled-setup`:

#table(
  columns: (auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.4pt + gray,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Parameter*], [*Default*], [*Description*],
  [`toc-style`], [`none`], [Different style for TOC (overrides heading style)],
  [`toc-indent`], [`1em`], [Indentation per level],
  [`toc-chapter-size`], [`12pt`], [Font size for chapters in TOC],
  [`toc-section-size`], [`11pt`], [Font size for sections in TOC],
  [`toc-subsection-size`], [`10pt`], [Font size for subsections in TOC],
  [`toc-fill`], [`repeat[.]`], [Fill between title and page number],
  [`toc-show-subsections`], [`true`], [Include subsections in TOC],
)

== Available TOC Styles (8)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    #text(size: 9pt, weight: "bold")[titled] #text(size: 8pt, fill: gray)[(default)]
    #v(0.3em)
    #image("/gallery/toc/toc-titled.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[classic]
    #v(0.3em)
    #image("/gallery/toc/toc-classic.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[modern]
    #v(0.3em)
    #image("/gallery/toc/toc-modern.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[elegant]
    #v(0.3em)
    #image("/gallery/toc/toc-elegant.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[bold]
    #v(0.3em)
    #image("/gallery/toc/toc-bold.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[minimal]
    #v(0.3em)
    #image("/gallery/toc/toc-minimal.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[scholarly]
    #v(0.3em)
    #image("/gallery/toc/toc-scholarly.png", width: 100%)
  ],
  [
    #text(size: 9pt, weight: "bold")[simple]
    #v(0.3em)
    #image("/gallery/toc/toc-simple.png", width: 100%)
  ],
)

// ============================================================================
= Cross-References

beautitled provides `beautitled-ref` (alias: `btl-ref`) to create clickable,
numbered references to any labelled heading — part, chapter, section, subsection,
or subsubsection.

== Labelling a Heading

Pass a `label:` named argument to any heading function:

```typst
#part(label: <part-found>)[Foundations]
#chapter(label: <ch-intro>)[Introduction]
#section(label: <sec-overview>)[Overview]
```

Or with native headings when using `beautitled-init`:

```typst
#beautitled-setup(enable-parts: false)
#show: beautitled-init

= Introduction <ch-intro>
== Overview <sec-overview>
```

== Referencing

```typst
See #beautitled-ref(<ch-intro>)          // → "Chapitre 1"
See #beautitled-ref(<sec-overview>)       // → "Section 1.1"
See #btl-ref(<ch-intro>)                  // short alias
See #beautitled-ref(<ch-intro>, show-page: true)  // → "Chapitre 1 (p. 2)"
See #beautitled-ref(<sec-overview>, short: true)  // → "1.1"
```

== Parameters

#table(
  columns: (auto, auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.4pt + gray,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Parameter*], [*Type*], [*Default*], [*Description*],
  [`target`], [`label`], [—], [The label attached to the heading],
  [`show-page`], [`bool`], [`false`], [Append a page number in parentheses],
  [`page-prefix`], [`str`], [`"p. "`], [Prefix before page number],
  [`short`], [`bool`], [`false`], [Omit prefix word; show number only (e.g. `1.1` instead of `Section 1.1`)],
)

== Notes

- The displayed prefix (`"Chapitre"`, `"Section"`, etc.) respects the active language preset.
- When `show-part-number: false` (or the heading was called with `numbered: false`), the heading's title is shown instead of a number.
- The reference is a clickable hyperlink to the heading's location in the document.

// ============================================================================
= Page Breaks

Enable automatic page breaks before chapters:

```typst
#beautitled-setup(
  style: "textbook",
  chapter-pagebreak: true,
)
#show: beautitled-init

= First Chapter
// Content...

= Second Chapter  // Automatic page break here
// Content...
```

Note: The first chapter does not trigger a page break.

// ============================================================================
= Built-in Presets

beautitled includes several presets for common configurations. Presets are called *before* `beautitled-init`:

== Complete Example

```typst
#import "@preview/beautitled:0.2.7": *

// 1. Choose a style
#beautitled-setup(style: "scholarly")

// 2. Apply language preset
#preset-english()

// 3. Apply color theme
#theme-ocean()

// 4. Initialize
#show: beautitled-init

= My Chapter
== My Section
```

== Language Presets

```typst
#preset-french()      // "Chapitre", "Section"
#preset-english()     // "Chapter", "Section"
#preset-german()      // "Kapitel", "Abschnitt"
#preset-no-numbers()  // Hide all numbering
```

== Color Themes

```typst
#theme-ocean()   // Blue tones
#theme-forest()  // Green tones
#theme-royal()   // Purple tones
#theme-mono()    // Grayscale
#theme-warm()    // Orange/brown tones
#theme-coral()   // Red tones
```

// ============================================================================
= Running Headers

`beautitled-header` returns the formatted title of the most recent chapter (or
section, depending on `level`) for use in a page header.  It works with both
the `beautitled-init` show-rule approach (native `= Heading` syntax) and direct
function calls (`#chapter[...]`, `#section[...]`, etc.).

== Basic Usage

```typst
#set page(header: context [
  #beautitled-header(level: 1)  // show current chapter title
  #h(1fr)
  #counter(page).display()
])
```

== Parameters

#table(
  columns: (auto, auto, auto, 1fr),
  inset: 8pt,
  stroke: 0.4pt + gray,
  fill: (col, row) => if row == 0 { luma(230) } else { none },
  [*Parameter*], [*Type*], [*Default*], [*Description*],
  [`level`], [`int`], [`1`], [Logical heading level: `1` = chapter, `2` = section, etc. Automatically adjusts when `enable-parts: true`.],
)

== Notes

- Returns `[]` (empty content) if no matching heading has appeared on or before the current page — safe to use from page 1.
- When `enable-parts: true`, the internal heading levels are shifted by one, so `level: 1` still means "chapter" from the caller's perspective.
- The returned title matches the outline title (includes numbering prefix).

// ============================================================================
= Unnumbered Headings

Any heading function accepts `numbered: false` to suppress both the display
number and its increment from the display counter.  The heading still appears
in the document, the outline, and bookmarks — it simply has no number.

== Behavior in 0.2.7

Before 0.2.7, calling `#chapter(numbered: false)[Preface]` would skip the
display number but still advance the internal display counter, so the next
numbered chapter would jump from e.g. Chapter 1 to Chapter 3.  Since 0.2.7,
the display counter is *not* incremented for unnumbered headings.

The *occurrence counter* (used for page-break logic) is always incremented,
so automatic page breaks still fire correctly even for unnumbered headings.

== Example

```typst
#chapter(numbered: false)[Preface]   // no number, counter stays at 0
#chapter[Introduction]               // displays as "Chapter 1"
#chapter[Methods]                    // displays as "Chapter 2"
```

== With `beautitled-init`

Native headings can be made unnumbered with `heading(numbering: none)`:

```typst
#show: beautitled-init

#heading(level: 1, numbering: none)[Preface]   // unnumbered chapter
= Introduction                                  // Chapter 1
```

Note: when using the show-rule approach the `numbered` parameter is controlled
by the native heading's `numbering` field rather than a `numbered:` argument.

// ============================================================================
= French Colon Spacing

beautitled includes a `colon-space()` helper that inserts a non-breaking space
before a colon when the document language is French (`text.lang == "fr"`), and
nothing otherwise.  This is used automatically in heading labels and outline
titles; you do not normally need to call it directly.

The helper is exported from the package for cases where you want consistent
colon spacing in your own content:

```typst
#import "@preview/beautitled:0.2.7": colon-space

Question#colon-space(): Why?
```

When `lang: "fr"` is set via `#set text(lang: "fr")`, this renders as
"Question : Why?" (with the required typographic thin-space before the colon).
In all other languages it renders as "Question: Why?" (no extra space).

// ============================================================================
= Tips and Best Practices

== Choosing a Style

- *For math/science textbooks:* `titled`, `schoolbook`, `textbook`, `academic`
- *For course notes:* `notes`, `clean`, `minimal`
- *For formal academic papers:* `scholarly`, `classical`, `academic`
- *For creative projects:* `creative`, `modern`, `magazine`
- *For classic book feel:* `vintage`, `elegant`

== Print Considerations

All styles are designed to be print-friendly:
- No heavy background fills
- Thin strokes and borders
- High contrast text
- Minimal ink usage

== Combining with Other Packages

beautitled works well with other Typst packages. Just make sure to call `beautitled-setup` after importing the package.

// ============================================================================
= Changelog

== Version 0.2.7
- New `beautitled-header(level:)` function for running page headers
- `numbered: false` no longer advances the display counter (unnumbered headings are truly unnumbered)
- `colon-space()` helper exported for French typographic colon spacing
- French colon spacing applied to part outline titles

== Version 0.2.0
- Initial release
- 19 styles
- Full configuration support
- Native Typst heading support
- Language presets
- Color themes
- Styled Table of Contents
- Page break support

#pagebreak()

// ============================================================================
// Style Showcase - not in TOC
#align(center)[
  #text(size: 24pt, weight: "bold")[Style Showcase]
  #v(0.3em)
  #text(size: 11pt, fill: gray)[All 19 available styles]
]
#v(1em)

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [#text(size: 9pt, weight: "bold")[titled] #v(0.3em) #image("/gallery/styles/titled.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[classic] #v(0.3em) #image("/gallery/styles/classic.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[modern] #v(0.3em) #image("/gallery/styles/modern.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[elegant] #v(0.3em) #image("/gallery/styles/elegant.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[bold] #v(0.3em) #image("/gallery/styles/bold.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[creative] #v(0.3em) #image("/gallery/styles/creative.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[minimal] #v(0.3em) #image("/gallery/styles/minimal.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[vintage] #v(0.3em) #image("/gallery/styles/vintage.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[schoolbook] #v(0.3em) #image("/gallery/styles/schoolbook.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[notes] #v(0.3em) #image("/gallery/styles/notes.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[clean] #v(0.3em) #image("/gallery/styles/clean.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[technical] #v(0.3em) #image("/gallery/styles/technical.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[academic] #v(0.3em) #image("/gallery/styles/academic.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[textbook] #v(0.3em) #image("/gallery/styles/textbook.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[scholarly] #v(0.3em) #image("/gallery/styles/scholarly.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[classical] #v(0.3em) #image("/gallery/styles/classical.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[educational] #v(0.3em) #image("/gallery/styles/educational.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[structured] #v(0.3em) #image("/gallery/styles/structured.png", width: 100%)],
  [#text(size: 9pt, weight: "bold")[magazine] #v(0.3em) #image("/gallery/styles/magazine.png", width: 100%)],
)
