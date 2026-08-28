---
name: math-journal-preflight
description: Audit a completed mathematical manuscript before submission for claim discipline, proof readiness, reproducibility, anonymization, and journal compliance. Use only after a concrete manuscript and target venue exist.
metadata:
  short-description: 数学期刊投稿前审计
---

# Mathematical Journal Preflight

Produce an evidence-based submission-readiness report. Do not claim that a manuscript will be accepted, and do not turn unverified material into a positive recommendation.

## Inputs

Read the manuscript, its bibliography and appendices, the proof-verification report or dependency status if present, the target journal's current author instructions, and any source/data/code archives the manuscript claims to provide.

## Audit

1. **Claim ledger.** List every headline theorem and novelty claim. For each, locate its exact statement, proof location, assumptions, cited dependencies, and current verification status. Flag claims with no complete proof, assertions stronger than the proof, hidden genericity/regularity conditions, or novelty language that the manuscript cannot support.
2. **Proof presentation.** Check that definitions, notation, domains, quantifiers, constants, boundary cases, and external theorem hypotheses are visible where needed. Ensure reductions and limit/interchange arguments name their justification.
3. **Literature discipline.** Verify each prior-work comparison has a precise citation and does not overstate priority, generality, or novelty. Identify missing source citations and unverified bibliographic metadata; do not invent them.
4. **Reproducibility.** For calculations, code, figures, or computer-assisted arguments, state exact inputs, versions, precision/interval controls, seeds, hardware assumptions where relevant, and a path from raw material to claimed output.
5. **Venue compliance.** Compare source against the current official guide: class file, article type, length, abstract, keyword/classification requirements, reference style, ethics/data/code declarations, author metadata, and anonymous-review requirements.
6. **Submission hygiene.** Check that no comments, tracked changes, local absolute paths, generated cache files, personal metadata, or unlicensed third-party files will be uploaded. For double-anonymous venues, examine acknowledgements, self-citations, repository links, PDF metadata, and file names.

## Decision Classes

- `READY WITH DOCUMENTED LIMITATIONS`: no identified blocking defect; list residual uncertainty.
- `REQUIRES REVISION`: correctable but material issues remain; prioritize them.
- `NOT SUBMISSION-READY`: proof, evidence, reproducibility, or compliance has a blocking gap.

## Report Format

Give the decision class first, then a table with item, evidence location, severity (`blocker`, `major`, `minor`, `check`), and required action. End with an explicit list of facts not established by the supplied materials.
