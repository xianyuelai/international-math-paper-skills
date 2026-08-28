---
name: n-body-paper-reading
description: Read mathematical celestial-mechanics or n-body papers from a user-provided PDF by locating the corresponding arXiv LaTeX source, saving the complete source package into a project subfolder, studying the proof from the source, decomposing the proof into a tree structure, and writing a LaTeX proof-note file. Use when the user provides a PDF and asks for arXiv/source TeX retrieval, proof ideas, proof details, theorem dependency structure, or LaTeX reading notes for n-body, restricted three-body, Hamiltonian dynamics, or related papers.
---

# n体论文阅读

## Core Workflow

When the user provides a PDF, execute the workflow rather than only summarizing the PDF.

1. **Identify the paper**
   - Extract the title, authors, abstract, and any arXiv/DOI hints from the PDF.
   - Search arXiv by exact title first; if needed, search by title fragments plus author names.
   - Confirm the match by title/authors/version, not by filename alone.

2. **Download and preserve the arXiv source**
   - Use the arXiv e-print source endpoint, not only the PDF endpoint.
   - Save the archive and the full extracted source under a subfolder of the current project/workspace.
   - Prefer a deterministic folder name such as `paper-reading/<short-title>-arxiv-<id>/`.
   - Keep the original source archive, extracted source tree, and any generated notes together.
   - If using PowerShell, prefer `scripts/fetch-arxiv-source.ps1` from this skill. Use `-ExecutionPolicy Bypass` when local policy blocks `.ps1` scripts:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File "$SkillDir\scripts\fetch-arxiv-source.ps1" -ArxivId "1207.6531" -OutputDir ".\paper-reading"
```

3. **Read from source, not just PDF text**
   - Find the main `.tex` file and inspect the structure with `rg`.
   - Read the abstract, introduction, theorem statements, proof-outline paragraphs, and sections proving the main technical theorem.
   - Use labels and references in the `.tex` source to follow proof dependencies.
   - For math-heavy papers, inspect macros early so formulas are not misread.

4. **Understand the proof**
   - Identify the target theorem(s), the key reduction(s), and the core technical estimate(s).
   - Separate:
     - geometric/dynamical mechanisms,
     - coordinate changes and normalizations,
     - analytic estimates,
     - symbolic dynamics or final implication steps.
   - Track which parts are imported from earlier literature and which parts are new in the paper.

5. **Decompose as a proof tree**
   - Root node: the main theorem requested by the user.
   - Internal nodes: propositions, reductions, constructions, and estimates.
   - Leaf nodes: definitions, known theorems, explicit computations, symmetry facts, local normal forms, or quoted results.
   - For every important node, record:
     - claim,
     - source location or label,
     - why it is needed,
     - dependencies,
     - role in the proof.

6. **Write LaTeX notes**
   - Use `assets/proof-notes-template.tex` as a starting format when useful.
   - Save the note in the same paper subfolder, typically as `proof-tree-notes.tex`.
   - The note must include:
     - paper metadata and arXiv ID,
     - source archive/extraction path,
     - main theorem statement in paraphrase,
     - proof tree,
     - key estimates/formulas,
     - explanation of the main novelty,
     - unresolved questions or points needing rereading.

7. **Report back**
   - Give the saved source folder and LaTeX note path.
   - Summarize the main proof mechanism and the specific reason the paper’s method works.
   - Mention any failure clearly: no arXiv source, source cannot be extracted, PDF match uncertain, or tests not run.

## Reading Priorities

Use this order unless the paper structure suggests otherwise:

1. `abstract`, `introduction`, and paragraphs containing "main difficulty", "main result", "proof of".
2. Main theorem statements and theorem labels.
3. The theorem or proposition that implies the main result.
4. Sections proving that technical theorem.
5. Appendices containing explicit computations.
6. Bibliography entries only when a result is quoted as a black box.

## Source Search Patterns

Run targeted searches in the extracted source:

```powershell
rg -n "\\begin\{theorem\}|\\begin\{proposition\}|\\begin\{lemma\}|Main Theorem|main theorem|proof of|Melnikov|Poincar|transvers|symbolic|homoclinic|Jacobi|Hamilton" <source-folder>
```

For TeX labels and dependencies:

```powershell
rg -n "\\label\{|\\ref\{|\\eqref\{|\\cite\{" <main-tex-file>
```

## LaTeX Note Standards

- Write notes in Chinese unless the user requests another language.
- Keep formulas faithful to the source; paraphrase prose rather than copying long passages.
- Prefer a tree-shaped structure over a linear summary.
- Include exact file references or TeX labels when available.
- Mark uncertain interpretations with `\textbf{待核对}` rather than pretending certainty.
