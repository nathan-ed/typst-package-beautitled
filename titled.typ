// titled.typ - Custom heading styles package for Typst
// Provides chapter, section, and subsection styling similar to LaTeX titlesec

// =============================================================================
// Configuration
// =============================================================================

#let titled-config = state("titled-config", (
  // Chapter settings
  chapter-size: 18pt,
  chapter-weight: "bold",
  chapter-prefix: "Chapitre",

  // Section settings
  section-size: 14pt,
  section-weight: "bold",
  section-label-size: 9pt,
  section-prefix: "SECTION",
  section-stroke: 0.8pt,
  section-inset: (x: 1em, y: 0.8em),

  // Subsection settings
  subsection-size: 11pt,
  subsection-weight: "bold",

  // TOC settings
  toc-title: "Table des matières",
  toc-title-size: 14pt,
))

// Function to configure the package
#let titled-setup(
  chapter-size: none,
  chapter-weight: none,
  chapter-prefix: none,
  section-size: none,
  section-weight: none,
  section-label-size: none,
  section-prefix: none,
  section-stroke: none,
  section-inset: none,
  subsection-size: none,
  subsection-weight: none,
  toc-title: none,
  toc-title-size: none,
) = {
  titled-config.update(cfg => {
    let new = cfg
    if chapter-size != none { new.chapter-size = chapter-size }
    if chapter-weight != none { new.chapter-weight = chapter-weight }
    if chapter-prefix != none { new.chapter-prefix = chapter-prefix }
    if section-size != none { new.section-size = section-size }
    if section-weight != none { new.section-weight = section-weight }
    if section-label-size != none { new.section-label-size = section-label-size }
    if section-prefix != none { new.section-prefix = section-prefix }
    if section-stroke != none { new.section-stroke = section-stroke }
    if section-inset != none { new.section-inset = section-inset }
    if subsection-size != none { new.subsection-size = subsection-size }
    if subsection-weight != none { new.subsection-weight = subsection-weight }
    if toc-title != none { new.toc-title = toc-title }
    if toc-title-size != none { new.toc-title-size = toc-title-size }
    new
  })
}

// =============================================================================
// State and Counters
// =============================================================================

#let chapter-info = state("titled-chapter-info", none)
#let section-counter = counter("titled-section")
#let subsection-counter = counter("titled-subsection")

// =============================================================================
// Chapter Heading
// =============================================================================

#let titled-chapter(num, title) = context {
  let cfg = titled-config.get()
  let ch-info = "Ch. " + str(num) + " : " + title
  chapter-info.update(ch-info)
  section-counter.update(0)
  subsection-counter.update(0)

  v(2em)
  align(center, text(
    size: cfg.chapter-size,
    weight: cfg.chapter-weight
  )[#cfg.chapter-prefix #num : #title])
  v(1em)
}

// =============================================================================
// Section Heading
// =============================================================================

#let titled-section(body, ch-info: auto, section-num: auto) = context {
  let cfg = titled-config.get()

  section-counter.step()
  subsection-counter.update(0)

  let sec-num = if section-num == auto {
    section-counter.get().at(0) + 1
  } else {
    section-num
  }

  let ch = if ch-info == auto { chapter-info.get() } else { ch-info }

  let label-text = text(size: cfg.section-label-size, weight: "regular")[
    #if ch != none [#ch #h(0.5em)]
    #text(tracking: 0.1em)[#cfg.section-prefix #sec-num]
  ]

  v(1.2em)
  block(
    width: 100%,
    stroke: cfg.section-stroke,
    inset: cfg.section-inset,
  )[
    #place(top + left, dy: -1em - 2.5pt, dx: 0pt)[
      #box(fill: white, inset: (x: 2pt, y: 2pt))[#label-text]
    ]
    #align(center, text(size: cfg.section-size, weight: cfg.section-weight)[#body])
  ]
  v(1em)
}

// =============================================================================
// Subsection Heading
// =============================================================================

#let titled-subsection(body) = context {
  let cfg = titled-config.get()

  subsection-counter.step()
  let sec-num = section-counter.get().at(0)
  let subsec-num = subsection-counter.get().at(0) + 1

  block(
    above: 1em,
    below: 0.6em,
    text(size: cfg.subsection-size, weight: cfg.subsection-weight)[
      #sec-num.#subsec-num #h(0.5em) #body
    ]
  )
}

// =============================================================================
// Table of Contents
// =============================================================================

#let titled-toc(title: auto) = context {
  let cfg = titled-config.get()
  let toc-title = if title == auto { cfg.toc-title } else { title }

  text(size: cfg.toc-title-size, weight: "bold")[#toc-title]
  v(1em)

  outline(
    title: none,
    indent: auto,
  )
}

// =============================================================================
// Convenience: Apply styles to headings
// =============================================================================

#let titled-init(doc) = {
  show heading.where(level: 1): it => titled-section(it.body)
  show heading.where(level: 2): it => titled-subsection(it.body)
  doc
}
