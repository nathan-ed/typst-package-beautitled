#!/usr/bin/env bash
# Assert the text beautitled-ref produces in tests/refs.typ and refs-parts.typ.
#
# Word joiners (U+2060) around numbering dots are stripped before comparing:
# they are a rendering detail of _numsep, not part of the expected text.
#
# Run from the package root:  bash tests/check-refs.sh

set -u
cd "$(dirname "$0")/.."
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

fail=0

expect() { # expect <file> <CHK-name> <expected text>
  local got
  got=$(grep -m1 "^$2:" "$tmp/$1.txt" | sed "s/^$2: //" | tr -d '⁠')
  if [ "$got" = "$3" ]; then
    printf 'ok    %-18s %s\n' "$2" "$got"
  else
    printf 'FAIL  %-18s expected %-24s got %s\n' "$2" "\"$3\"" "\"$got\""
    fail=1
  fi
}

for f in refs refs-parts; do
  if ! typst compile --root . "tests/$f.typ" "$tmp/$f.pdf" 2>"$tmp/$f.err"; then
    echo "FAIL  $f.typ did not compile:"
    cat "$tmp/$f.err"
    exit 1
  fi
  pdftotext "$tmp/$f.pdf" "$tmp/$f.txt"
done

# Native headings transformed by beautitled-init
expect refs CHK-nativechap "Chapitre 1"
expect refs CHK-nativesec  "Section 1.5"
# Custom subsection pattern "1.1.1" -> full hierarchical number
expect refs CHK-subsection "Sous-section 1.5.2"
# Direct #section / #subsection calls continue past the native ones
expect refs CHK-directsec  "Section 1.6"
expect refs CHK-directsub  "Sous-section 1.6.1"
# Modifiers
expect refs CHK-short      "1.5"
expect refs CHK-shortsub   "1.5.2"
expect refs CHK-page       "Chapitre 1 (p. 1)"
# Explicitly unnumbered heading falls back to its title
expect refs CHK-nonum      "Section sans numéro"
# Missing label keeps the historical placeholder
expect refs CHK-missing    "??"
# Native @label references (issue #6)
expect refs CHK-atsec      "Section 1.5"
expect refs CHK-atchap     "Chapitre 1"
expect refs CHK-atdirect   "Section 1.6"
expect refs CHK-atsupp     "Sub. 1.5.2"
expect refs CHK-suppnone   "1.5"

# enable-parts: true, plus a custom section numbering pattern
expect refs-parts CHK-part          "Partie I"
expect refs-parts CHK-partshort     "I"
expect refs-parts CHK-partchap      "Chapitre 1"
expect refs-parts CHK-customsec     "Section I-2"
expect refs-parts CHK-customdirect  "Section I-3"
expect refs-parts CHK-partpage      "Chapitre 1 (p. 1)"
expect refs-parts CHK-atpart        "Partie I"
expect refs-parts CHK-atpsec        "Section I-2"

exit $fail
