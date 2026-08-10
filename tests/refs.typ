// Regression fixture for beautitled-ref.
//
// Covers references to native headings transformed by beautitled-init and to
// direct #chapter/#section/#subsection calls, which must agree. Each check
// prints a CHK-<name> line so the expected text can be asserted with
// pdftotext (see tests/check-refs.sh).
//
// Run: typst compile --root .. tests/refs.typ out.pdf && pdftotext out.pdf -

#import "../src/lib.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(size: 10pt)

#beautitled-setup(style: "minimal", subsection-numbering: "1.1.1")

#show: beautitled-init

// --- Native headings ---------------------------------------------------
= Premier chapitre <ch1>

== Section un <s1>
== Section deux <s2>
== Section trois <s3>
== Section quatre <s4>
== Section cinq <s5>

=== Sous-section une <ss1>
=== Sous-section deux <ss2>

// --- Direct function calls ---------------------------------------------
#section(label: <direct-sec>)[Section par appel direct]

#subsection(label: <direct-sub>)[Sous-section par appel direct]

// An explicitly unnumbered heading falls back to its title, not a number.
#section(numbered: false, label: <nonum>)[Section sans numéro]

#pagebreak()

= Deuxième chapitre <ch2>

Native chapter and section:

CHK-nativechap: #beautitled-ref(<ch1>)

CHK-nativesec: #beautitled-ref(<s5>)

Subsection numbering "1.1.1" must yield the full hierarchical number:

CHK-subsection: #beautitled-ref(<ss2>)

Direct-function headings must behave identically:

CHK-directsec: #beautitled-ref(<direct-sec>)

CHK-directsub: #beautitled-ref(<direct-sub>)

Modifiers:

CHK-short: #beautitled-ref(<s5>, short: true)

CHK-shortsub: #beautitled-ref(<ss2>, short: true)

CHK-page: #beautitled-ref(<ch1>, show-page: true)

An explicitly unnumbered heading shows its title:

CHK-nonum: #beautitled-ref(<nonum>)

A missing label keeps the historical placeholder:

CHK-missing: #beautitled-ref(<does-not-exist>)
