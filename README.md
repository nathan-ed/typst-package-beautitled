# beautitled

A Typst package for creating beautiful, print-friendly title styles for documents. Perfect for textbooks, course materials, academic papers, and any document that needs professional heading styles.

## Features

- **19 distinctive styles** - From classic academic to modern creative
- **Print-friendly** - All styles use minimal ink (no heavy backgrounds)
- **Fully configurable** - Colors, sizes, spacing, and numbering
- **Styled Table of Contents** - Each style has a matching TOC design
- **Page breaks** - Optional automatic page breaks before chapters
- **Multilingual** - Customizable prefixes for any language
- **Native Typst support** - Works with `= Heading` syntax
- **Cross-references** - Full outline and bookmark support

## Quick Start

```typst
#import "@preview/beautitled:0.1.0": *

#beautitled-setup(style: "titled")

#chapter[My Chapter Title]
#section[My Section Title]
#subsection[My Subsection Title]
```

## Available Styles (19)

| Category | Style | Description |
|----------|-------|-------------|
| **Original** | `titled` | Boxed sections with floating labels (DEFAULT) |
| **General** | `classic` | Traditional with underlines |
| | `modern` | Clean geometric with accent |
| | `elegant` | Refined with ornaments |
| | `bold` | Strong left border |
| | `creative` | Student portfolio style |
| | `minimal` | Ultra-clean |
| | `vintage` | Classic book ornaments |
| **Educational** | `schoolbook` | Textbook style |
| | `notes` | Course notes |
| | `clean` | Maximum simplicity |
| **Academic** | `technical` | Documentation |
| | `academic` | Professional academic |
| | `textbook` | Bold numbers, clear hierarchy |
| | `scholarly` | Centered with thin rules |
| | `classical` | Small caps, minimal |
| | `educational` | Left border with numbers |
| | `structured` | Boxed numbers |
| | `magazine` | Editorial style |

## Configuration

### Full Parameter Reference

```typst
#beautitled-setup(
  // Style
  style: "titled",              // Style name

  // Colors
  primary-color: rgb("#2c3e50"),
  secondary-color: rgb("#7f8c8d"),
  accent-color: rgb("#2980b9"),

  // Font sizes
  chapter-size: 18pt,
  section-size: 14pt,
  subsection-size: 12pt,
  subsubsection-size: 11pt,

  // Numbering
  show-chapter-number: true,
  show-section-number: true,
  show-subsection-number: true,
  show-chapter-in-section: true,

  // Prefixes (localization)
  chapter-prefix: "Chapitre",
  section-prefix: "Section",

  // Page breaks
  chapter-pagebreak: false,

  // Table of Contents
  toc-style: none,              // Different style for TOC (none = same as headings)
  toc-indent: 1em,
  toc-fill: repeat[.],
)
```

## Table of Contents

```typst
// Basic TOC
#beautitled-toc()

// Custom title
#beautitled-toc(title: "Contents")

// Different style for TOC
#beautitled-toc(title: "Index", style: "elegant")
```

### Mix Heading and TOC Styles

```typst
#beautitled-setup(style: "titled")  // Headings use "titled"

// TOC uses "scholarly" style
#beautitled-toc(title: "Table of Contents", style: "scholarly")

#chapter[First Chapter]
...
```

## Page Breaks

```typst
#beautitled-setup(
  style: "textbook",
  chapter-pagebreak: true,  // Page break before each chapter
)
```

## Language Presets

```typst
#preset-french()   // "Chapitre", "Section"
#preset-english()  // "Chapter", "Section"
#preset-german()   // "Kapitel", "Abschnitt"
#preset-no-numbers()
```

## Color Themes

```typst
#theme-ocean()   // Blue
#theme-forest()  // Green
#theme-royal()   // Purple
#theme-mono()    // Grayscale
#theme-warm()    // Orange/brown
#theme-coral()   // Red
```

## Native Typst Headings

```typst
#show: beautitled-init

= Chapter Title
== Section Title
=== Subsection Title
```

## Manual & Demo

- Full manual: `manual.typ` / `manual.pdf`
- Style showcase: `demo.typ` / `demo.pdf`

## License

MIT License - see LICENSE file for details.
