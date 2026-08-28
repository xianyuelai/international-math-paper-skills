---
name: math-proof-check
description: Strictly review an existing mathematical theorem and proof when the user asks whether it is valid, complete, or rigorous; identify gaps without rewriting the proof.
metadata:
  short-description: 严格审查现有数学证明
---

# 数学证明检查

Use this skill to audit a supplied mathematical proposition and its existing
proof. The task is to decide what follows from the text as written, not to
invent a new proof or repair it.

## Scope

First identify the exact theorem, all declared hypotheses, definitions, and
the proof text. If any of these are absent, state precisely what is missing
and audit only the supplied material; do not infer an intended assumption.

Keep the theorem statement fixed. Never silently strengthen its hypotheses,
weaken its conclusion, or fill a gap with an unstated standard result.

## Review Method

1. Map the proof before judging it:
   - State the declared assumptions, domains, and quantifiers.
   - List definitions and every cited lemma, theorem, or prior result.
   - Record the dependency of each key step and give a source location
     (line, equation, paragraph, or quoted phrase).
2. Examine every key inference for:
   - logical validity and the direction of necessary/sufficient implications;
   - undeclared hypotheses, changes of notation, and quantifier order;
   - interchange of limits, derivatives, integrals, sums, expectations, or
     series, including the theorem and side conditions that justify it;
   - compactness, completeness, continuity, differentiability, regularity,
     and uniform-convergence claims;
   - use of external or earlier lemmas, including whether all their
     hypotheses are discharged and whether any dependency is circular;
   - boundary, degenerate, empty, zero-dimensional, singular, equality-case,
     and limiting-parameter regimes relevant to the stated domain.
3. For a nontrivial calculation, check sign, inequality direction, domain,
   and constant dependence. Treat a phrase such as “clearly”, “standard”, or
   “by compactness” as a proof obligation when it hides a material step.
4. Distinguish a false conclusion from an unsupported derivation. A gap in a
   proof does not by itself prove the theorem false.

## Step Ratings

Classify every key step with exactly one rating:

| Rating | Meaning |
|---|---|
| A. 严格成立 | The conclusion follows from stated hypotheses and cited results, with all material side conditions verified. |
| B. 成立，但需要补充解释 | The inference appears valid, but a routine yet nontrivial justification is omitted. Name the missing justification. |
| C. 依赖未声明的假设 | The step needs a hypothesis not declared in the theorem or preceding result. State the exact missing hypothesis without adding it to the theorem. |
| D. 存在潜在错误 | The inference is invalid, reverses an implication, misses a case, conflicts with the text, or has a concrete counterexample/counterexample candidate. Explain the defect. |
| E. 无法从当前信息判断 | The available text does not supply enough information to verify the step or its cited input. State exactly what information is needed. |

Do not label a step A merely because its conclusion is plausible. If a
reference is unavailable, rate its application E unless the required
statement and hypotheses are supplied in the material.

## Required Review Output

Write the report in Chinese unless the user requests another language.

1. Start with a compact theorem-and-assumption map.
2. Give a step-by-step table with:
   - location;
   - claimed inference;
   - dependencies;
   - rating A--E;
   - rigorous reason, including a missing side condition or defect where
     applicable.
3. For each C, D, or E item, explicitly state its downstream consequence:
   which later conclusion can no longer be regarded as proved.
4. End with all of the following:
   - **总体判断**: choose exactly one of “证明成立”, “基本成立但需要补充”,
     “存在实质性缺口”, or “证明可能错误”, and tie it to the ratings;
   - **最严重的三个问题**: ordered by impact, or state that fewer than three
     were found;
   - **建议优先检查的地方**: concrete equations, lemmas, or assumptions to
     revisit.

Use “证明成立” only when every material proof obligation is rated A. If a
core chain contains B, C, D, or E, use a more cautious overall judgment.
When no defect is found, say that the review found none in the supplied
material and name any residual scope limits; do not claim formal certainty.

## Boundaries

Do not:

* re-prove the statement from scratch;
* silently modify the theorem, introduce a helpful assumption, or replace a
  broken argument;
* guess at omitted definitions or citations;
* treat numerical evidence or intuition as a proof;
* claim an unverified external theorem establishes the present conclusion.
