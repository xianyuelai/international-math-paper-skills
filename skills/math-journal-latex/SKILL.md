---
name: math-journal-latex
description: Compile and audit a mathematical-journal LaTeX manuscript when mathematical typesetting, references, journal templates, or final PDF quality need checking. Do not use to invent or validate the mathematics itself.
metadata:
  short-description: 数学期刊 LaTeX 成稿检查
---

# Mathematical Journal LaTeX

Treat the source and rendered PDF as separate artifacts: a clean compilation does not prove that the manuscript renders correctly.

## Scope

Use this skill after the claims and proofs have already been audited. Preserve the target journal's supplied class, bibliography style, and mandatory submission files unless the user explicitly authorizes a venue change.

## Workflow

1. Identify the root `.tex` file, the journal template, bibliography engine, and expected output.
2. Before changing anything, run an appropriate LaTeX environment check. For ordinary compilation, prefer the dedicated LaTeX compilation workflow when available.
3. Compile enough times to resolve cross-references and bibliography. Record every warning that could affect content: undefined citations/references, multiply-defined labels, missing files, overfull boxes crossing margins, and font or encoding fallbacks.
4. Inspect the final PDF visually, including title/author block, theorem numbering, displayed equations, diagrams, tables, bibliography, page breaks, and appendix.
5. Verify that theorem, lemma, equation, figure, table, and bibliography references resolve to intended targets. Check that each citation has a bibliography entry and every cited item occurs in the bibliography.
6. Keep source changes narrow. Do not silently change mathematical notation, theorem text, author ordering, funding disclosures, or a journal class option.

## Mathematical Typesetting Checks

- Every nontrivial symbol should be defined before its first load-bearing use.
- Use stable semantic labels rather than manual numbering.
- Check displayed equations at page boundaries, especially long aligned derivations and proof endings.
- Confirm that assumptions and quantifiers are not lost in a line break, macro expansion, or optional argument.
- Do not use visual success as evidence that a proof is valid; route proof questions to a proof-audit skill.

## Report

Report the source root, compiler used, produced PDF path, errors, material warnings, visual defects, and any intentionally unresolved item. State explicitly when compilation or PDF inspection was not possible.
