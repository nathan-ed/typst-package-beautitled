// beautitled - User Manual
// ============================================================================
#import "src/lib.typ": *

#set page(margin: 2.5cm)
#set text(font: "Linux Libertine", size: 11pt)
#set par(justify: true)

#align(center)[
  #text(size: 32pt, weight: "bold")[beautitled]
  #v(0.5em)
  #text(size: 16pt, fill: gray)[User Manual]
  #v(0.3em)
  #text(size: 11pt, fill: gray)[Version 0.1.0]
]

#v(2em)

#beautitled-toc(title: "Table of Contents")

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
- *Four heading levels* - Chapter, section, subsection, subsubsection

// ============================================================================
= Quick Start

== Installation

```typst
#import "@preview/beautitled:0.1.0": *
```

== Basic Usage

```typst
#import "@preview/beautitled:0.1.0": *

#beautitled-setup(style: "titled")

#chapter[My Chapter Title]
#section[My Section Title]
#subsection[My Subsection Title]
#subsubsection[My Subsubsection Title]
```

== Using Native Typst Headings

You can also use the standard Typst heading syntax:

```typst
#import "@preview/beautitled:0.1.0": *

#show: beautitled-init

= Chapter Title
== Section Title
=== Subsection Title
==== Subsubsection Title
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
  [`chapter-size`], [`18pt`], [Font size for chapter titles],
  [`section-size`], [`14pt`], [Font size for section titles],
  [`subsection-size`], [`12pt`], [Font size for subsection titles],
  [`subsubsection-size`], [`11pt`], [Font size for subsubsection titles],

  // Numbering
  [`show-chapter-number`], [`true`], [Show chapter numbers],
  [`show-section-number`], [`true`], [Show section numbers],
  [`show-subsection-number`], [`true`], [Show subsection numbers],
  [`show-chapter-in-section`], [`true`], [Show chapter info in section labels (titled style)],

  // Prefixes
  [`chapter-prefix`], [`"Chapitre"`], [Text before chapter number],
  [`section-prefix`], [`"Section"`], [Text before section number],

  // Spacing
  [`chapter-above`], [`1.2em`], [Space above chapters],
  [`chapter-below`], [`0.5em`], [Space below chapters],
  [`section-above`], [`0.5em`], [Space above sections],
  [`section-below`], [`0.4em`], [Space below sections],
  [`subsection-above`], [`0.5em`], [Space above subsections],
  [`subsection-below`], [`0.3em`], [Space below subsections],
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

#rect(width: 100%, stroke: 0.5pt + gray, inset: 1em)[
  #reset-counters()
  #beautitled-setup(style: "titled", show-chapter-in-section: true)
  #chapter[Géométrie vectorielle]
  #section[Espace vectoriel]
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
  #subsection[Définitions de base]
  Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
]

*Code:*
```typst
#beautitled-setup(style: "titled", show-chapter-in-section: true)
#chapter[Géométrie vectorielle]
#section[Espace vectoriel]
Lorem ipsum dolor sit amet...
#subsection[Définitions de base]
Ut enim ad minim veniam...
```

== Example 2: Without Chapter (Sections Only)

#rect(width: 100%, stroke: 0.5pt + gray, inset: 1em)[
  #reset-counters()
  #beautitled-setup(style: "titled", show-chapter-in-section: false)
  #section[Les vecteurs]
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  #subsection[Addition de vecteurs]
  Ut enim ad minim veniam, quis nostrud exercitation.
]

*Code:*
```typst
#beautitled-setup(style: "titled", show-chapter-in-section: false)
#section[Les vecteurs]
Lorem ipsum dolor sit amet...
#subsection[Addition de vecteurs]
Ut enim ad minim veniam...
```

== Example 3: Academic Style with Custom Colors

#rect(width: 100%, stroke: 0.5pt + gray, inset: 1em)[
  #reset-counters()
  #beautitled-setup(
    style: "academic",
    primary-color: rgb("#1a5276"),
    secondary-color: rgb("#5dade2"),
    chapter-size: 20pt,
    section-size: 15pt,
  )
  #chapter[Introduction to Analysis]
  #section[Limits and Continuity]
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  #subsection[Definition of Limits]
  Ut enim ad minim veniam, quis nostrud exercitation.
]

*Code:*
```typst
#beautitled-setup(
  style: "academic",
  primary-color: rgb("#1a5276"),
  secondary-color: rgb("#5dade2"),
  chapter-size: 20pt,
  section-size: 15pt,
)
#chapter[Introduction to Analysis]
#section[Limits and Continuity]
...
```

== Example 4: English Document

#rect(width: 100%, stroke: 0.5pt + gray, inset: 1em)[
  #reset-counters()
  #beautitled-setup(
    style: "scholarly",
    chapter-prefix: "Chapter",
    section-prefix: "Section",
  )
  #chapter[Theoretical Framework]
  #section[Literature Review]
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  #subsection[Previous Studies]
  Ut enim ad minim veniam, quis nostrud exercitation.
]

*Code:*
```typst
#beautitled-setup(
  style: "scholarly",
  chapter-prefix: "Chapter",
  section-prefix: "Section",
)
#chapter[Theoretical Framework]
#section[Literature Review]
...
```

== Example 5: Without Numbering

#rect(width: 100%, stroke: 0.5pt + gray, inset: 1em)[
  #reset-counters()
  #beautitled-setup(
    style: "elegant",
    show-chapter-number: false,
    show-section-number: false,
    show-subsection-number: false,
  )
  #chapter[Poésie]
  #section[Les Fleurs du Mal]
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  #subsection[Spleen et Idéal]
  Ut enim ad minim veniam, quis nostrud exercitation.
]

*Code:*
```typst
#beautitled-setup(
  style: "elegant",
  show-chapter-number: false,
  show-section-number: false,
  show-subsection-number: false,
)
#chapter[Poésie]
#section[Les Fleurs du Mal]
...
```

== Example 6: Different Styles Comparison

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Modern Style:*
    #rect(width: 100%, stroke: 0.5pt + gray, inset: 0.8em)[
      #reset-counters()
      #beautitled-setup(style: "modern")
      #chapter[Chapitre]
      #section[Section]
      Contenu...
    ]
  ],
  [
    *Classical Style:*
    #rect(width: 100%, stroke: 0.5pt + gray, inset: 0.8em)[
      #reset-counters()
      #beautitled-setup(style: "classical")
      #chapter[Chapitre]
      #section[Section]
      Contenu...
    ]
  ],
)

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Textbook Style:*
    #rect(width: 100%, stroke: 0.5pt + gray, inset: 0.8em)[
      #reset-counters()
      #beautitled-setup(style: "textbook")
      #chapter[Chapitre]
      #section[Section]
      Contenu...
    ]
  ],
  [
    *Educational Style:*
    #rect(width: 100%, stroke: 0.5pt + gray, inset: 0.8em)[
      #reset-counters()
      #beautitled-setup(style: "educational")
      #chapter[Chapitre]
      #section[Section]
      Contenu...
    ]
  ],
)

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
  [`title`], [`"Table des matières"`], [Title displayed above the TOC],
  [`depth`], [`3`], [Maximum heading level to include],
  [`style`], [`none`], [Override style for TOC (none = use heading style)],
)

== Mixing Styles

You can use different styles for your headings and TOC:

```typst
// Headings use "titled" style
#beautitled-setup(style: "titled")

// TOC uses "scholarly" style
#beautitled-toc(title: "Contents", style: "scholarly")

#chapter[First Chapter]
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

== Available TOC Styles (7)

#let demo-toc(style-name) = {
  let primary = rgb("#2c3e50")
  let secondary = rgb("#7f8c8d")
  let accent = rgb("#2980b9")
  let fill = repeat[.]
  let indent = 1em

  if style-name == "titled" {
    block(stroke: (left: 2pt + accent), inset: (left: 0.5em))[
      #text(size: 11pt, weight: "bold", fill: primary)[Chapitre 1 : Introduction #box(width: 1fr, fill) 1]
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary)[1.1 Contexte #box(width: 1fr, fill) 1]
    ]
    block(inset: (left: indent * 2))[
      #text(size: 9pt, fill: secondary)[1.1.1 Historique #box(width: 1fr, fill) 2]
    ]
  } else if style-name == "classic" {
    block[
      #text(size: 11pt, weight: "bold", fill: primary)[Chapitre 1 : Introduction #box(width: 1fr, fill) 1]
      #line(length: 100%, stroke: 0.5pt + secondary)
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary)[1.1 Contexte #box(width: 1fr, fill) 1]
    ]
  } else if style-name == "modern" {
    block[
      #box(width: 3pt, height: 0.9em, fill: accent) #h(0.4em)
      #text(size: 11pt, weight: "bold", fill: primary)[Chapitre 1 : Introduction #box(width: 1fr, fill) 1]
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary)[#text(fill: accent)[▸] 1.1 Contexte #box(width: 1fr, fill) 1]
    ]
  } else if style-name == "elegant" {
    align(center)[
      #text(size: 11pt, weight: "bold", fill: primary, tracking: 0.05em)[#smallcaps[Chapitre 1 : Introduction] #h(1em) 1]
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary, style: "italic")[1.1 Contexte #box(width: 1fr, repeat[#h(0.3em)·]) 1]
    ]
  } else if style-name == "bold" {
    block(stroke: (left: 3pt + accent), inset: (left: 0.6em))[
      #text(size: 11pt, weight: "black", fill: primary)[#upper[Chapitre 1 : Introduction] #box(width: 1fr, fill) 1]
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, weight: "bold", fill: primary)[1.1 Contexte #box(width: 1fr, fill) 1]
    ]
  } else if style-name == "minimal" {
    block[
      #text(size: 11pt, fill: primary)[Chapitre 1 : Introduction #h(1fr) 1]
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary)[1.1 Contexte #h(1fr) 1]
    ]
  } else if style-name == "scholarly" {
    align(center)[
      #line(length: 20%, stroke: 0.4pt + secondary)
      #text(size: 11pt, weight: "bold", fill: primary)[Chapitre 1 : Introduction #h(1em) 1]
      #line(length: 20%, stroke: 0.4pt + secondary)
    ]
    block(inset: (left: indent))[
      #text(size: 10pt, fill: primary)[1.1 Contexte #box(width: 1fr, fill) 1]
    ]
  }
}

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[titled] #text(size: 8pt, fill: gray)[(default)]
    #v(0.3em)
    #demo-toc("titled")
  ],
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[classic]
    #v(0.3em)
    #demo-toc("classic")
  ],
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[modern]
    #v(0.3em)
    #demo-toc("modern")
  ],
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[elegant]
    #v(0.3em)
    #demo-toc("elegant")
  ],
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[bold]
    #v(0.3em)
    #demo-toc("bold")
  ],
  box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt)[
    #text(size: 9pt, weight: "bold")[minimal]
    #v(0.3em)
    #demo-toc("minimal")
  ],
)

#box(stroke: 0.4pt + gray, inset: 0.6em, radius: 2pt, width: 50%)[
  #text(size: 9pt, weight: "bold")[scholarly]
  #v(0.3em)
  #demo-toc("scholarly")
]

// ============================================================================
= Page Breaks

Enable automatic page breaks before chapters:

```typst
#beautitled-setup(
  style: "textbook",
  chapter-pagebreak: true,
)

#chapter[First Chapter]
// Content...

#chapter[Second Chapter]  // Automatic page break here
// Content...
```

Note: The first chapter does not trigger a page break.

// ============================================================================
= Built-in Presets

beautitled includes several presets for common configurations:

== Language Presets

```typst
// French (default)
#preset-french()

// English
#preset-english()

// German
#preset-german()

// No numbering
#preset-no-numbers()
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

== Version 0.1.0
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

// Helper to show a style
#let show-style(name, description) = {
  pagebreak(weak: true)
  reset-counters()
  // Ensure numbering is enabled
  beautitled-setup(
    show-chapter-number: true,
    show-section-number: true,
    show-subsection-number: true,
  )
  align(center)[
    #box(stroke: 0.5pt + gray, inset: 0.8em, radius: 3pt)[
      #text(size: 14pt, weight: "bold")[#name]
      #v(0.2em)
      #text(size: 9pt, fill: gray)[#description]
    ]
  ]
  v(1em)
}

// ============================================================================
// ORIGINAL STYLE (DEFAULT)
// ============================================================================

#show-style("titled", "Original boxed sections with floating labels (DEFAULT)")
#beautitled-setup(style: "titled")
#chapter[Géométrie vectorielle]
#section[Espace vectoriel]
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
#subsection[Définitions de base]
Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris.
#subsubsection[Notation]
Duis aute irure dolor in reprehenderit.

// ============================================================================
// GENERAL PURPOSE
// ============================================================================

#show-style("classic", "Traditional academic with underlines")
#beautitled-setup(style: "classic")
#chapter[Introduction]
#section[Fundamental Concepts]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Basic Definitions]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("modern", "Clean geometric with accent colors")
#beautitled-setup(style: "modern")
#chapter[Digital Innovation]
#section[Technology Trends]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Emerging Platforms]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("elegant", "Refined with decorative ornaments")
#beautitled-setup(style: "elegant")
#chapter[The Art of Typography]
#section[Historical Perspectives]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Classical Influences]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("bold", "Strong left border emphasis")
#beautitled-setup(style: "bold")
#chapter[Key Announcements]
#section[Main Headlines]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Topics]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("creative", "Student portfolio style")
#beautitled-setup(style: "creative")
#chapter[Design Projects]
#section[Creative Work]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Branding]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("minimal", "Ultra-clean with maximum whitespace")
#beautitled-setup(style: "minimal")
#chapter[Simplicity]
#section[Core Principles]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Elements]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("vintage", "Classic book ornamental style")
#beautitled-setup(style: "vintage")
#chapter[Tales of Yore]
#section[The Beginning]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[First Encounters]
Ut enim ad minim veniam, quis nostrud exercitation.

// ============================================================================
// EDUCATIONAL
// ============================================================================

#show-style("schoolbook", "Textbook style for lessons")
#beautitled-setup(style: "schoolbook")
#chapter[Analyse]
#section[Les fonctions affines]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Représentation graphique]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("notes", "Course notes and study materials")
#beautitled-setup(style: "notes")
#chapter[Trigonométrie]
#section[Angles et mesures]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Cercle trigonométrique]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("clean", "Maximum simplicity")
#beautitled-setup(style: "clean")
#chapter[Géométrie]
#section[Vecteurs]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Opérations]
Ut enim ad minim veniam, quis nostrud exercitation.

// ============================================================================
// ACADEMIC
// ============================================================================

#show-style("technical", "Engineering documentation")
#beautitled-setup(style: "technical")
#chapter[System Architecture]
#section[Component Overview]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Module Specifications]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("academic", "Professional academic style")
#beautitled-setup(style: "academic")
#chapter[Introduction]
#section[Background]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Historical Context]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("textbook", "Bold numbers with clear hierarchy")
#beautitled-setup(style: "textbook")
#chapter[Fundamentals]
#section[Core Concepts]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Definitions]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("scholarly", "Centered with thin rules")
#beautitled-setup(style: "scholarly")
#chapter[Methodology]
#section[Research Design]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Data Collection]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("classical", "Small caps, refined and minimal")
#beautitled-setup(style: "classical")
#chapter[Analysis]
#section[Findings]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Discussion]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("educational", "Left border with colored numbers")
#beautitled-setup(style: "educational")
#chapter[Applications]
#section[Real-World Examples]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Case Studies]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("structured", "Boxed chapter numbers")
#beautitled-setup(style: "structured")
#chapter[Problem Solving]
#section[Techniques]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Worked Examples]
Ut enim ad minim veniam, quis nostrud exercitation.

#show-style("magazine", "Editorial/magazine style")
#beautitled-setup(style: "magazine")
#chapter[Feature Story]
#section[The Investigation]
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Key Findings]
Ut enim ad minim veniam, quis nostrud exercitation.
