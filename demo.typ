// beautitled - Demo Showcase (19 styles)
// ============================================================================
#import "src/lib.typ": *

#set page(margin: 2cm, height: auto)
#set text(font: "Linux Libertine", size: 11pt)

#align(center)[
  #text(size: 28pt, weight: "bold")[beautitled]
  #v(0.3em)
  #text(size: 14pt, fill: gray)[19 Beautiful Title Styles for Typst]
  #v(0.3em)
  #text(size: 10pt, fill: gray)[All styles are print-friendly]
]

#v(2em)

// Helper to show a style
#let show-style(name, description) = {
  pagebreak(weak: true)
  reset-counters()
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
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
#subsection[Définitions]
Ut enim ad minim veniam, quis nostrud exercitation.

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

// ============================================================================
// QUICK REFERENCE
// ============================================================================

#pagebreak()
#align(center)[
  #text(size: 20pt, weight: "bold")[Quick Reference]
]
#v(1em)

== Basic Usage

```typst
#import "@preview/beautitled:0.1.0": *

#beautitled-setup(style: "academic")

#chapter[My Chapter]
#section[My Section]
#subsection[My Subsection]
```

== Using Native Typst Headings

```typst
#show: beautitled-init

= Chapter Title
== Section Title
=== Subsection Title
```

== Configuration

```typst
#beautitled-setup(
  style: "titled",
  primary-color: rgb("#1a5276"),
  accent-color: rgb("#e74c3c"),
  chapter-size: 20pt,
  section-size: 16pt,
  subsection-size: 13pt,
  show-chapter-in-section: true,
)
```

== All 19 Styles

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  stroke: 0.4pt + gray,
  [*Style*], [*Description*],
  [`titled`], [Original boxed sections (DEFAULT)],
  [`classic`], [Traditional with underlines],
  [`modern`], [Clean geometric],
  [`elegant`], [Refined ornaments],
  [`bold`], [Strong left border],
  [`creative`], [Student portfolio],
  [`minimal`], [Ultra-clean],
  [`vintage`], [Classic book],
  [`schoolbook`], [Textbook lessons],
  [`notes`], [Course notes],
  [`clean`], [Maximum simplicity],
  [`technical`], [Documentation],
  [`academic`], [Professional academic],
  [`textbook`], [Bold numbers, hierarchy],
  [`scholarly`], [Centered, thin rules],
  [`classical`], [Small caps, minimal],
  [`educational`], [Left border, numbers],
  [`structured`], [Boxed numbers],
  [`magazine`], [Editorial],
)
