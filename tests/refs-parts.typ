// Regression fixture for beautitled-ref with enable-parts: true.
//
// Separate from tests/refs.typ because #part flips enable-parts on for the
// rest of the document and shifts the native-heading level mapping by one
// (level 1 = part, level 2 = chapter, level 3 = section...).
//
// Also covers a custom section numbering pattern, which the reference must
// reproduce exactly rather than re-deriving its own format.
//
// Run: typst compile --root .. tests/refs-parts.typ out.pdf && pdftotext out.pdf -

#import "../src/lib.typ": *

#set page(paper: "a4", margin: 2cm)
#set text(size: 10pt)

#beautitled-setup(
  style: "minimal",
  enable-parts: true,
  part-fullpage: false,
  section-numbering: "I-1",
)

#show: beautitled-init

= Première partie <p1>

== Chapitre un <pch1>

=== Section un <psec1>
=== Section deux <psec2>

// Direct call under enable-parts must land on the same level as the native one
#section(label: <pdirect>)[Section par appel direct]

= Deuxième partie <p2>

CHK-part: #beautitled-ref(<p1>)

CHK-partshort: #beautitled-ref(<p1>, short: true)

CHK-partchap: #beautitled-ref(<pch1>)

Custom section numbering "I-1" must come through verbatim:

CHK-customsec: #beautitled-ref(<psec2>)

CHK-customdirect: #beautitled-ref(<pdirect>)

CHK-partpage: #beautitled-ref(<pch1>, show-page: true)
