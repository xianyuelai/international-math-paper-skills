---
name: celestial-mechanics-proof-audit
description: Audit proofs in celestial mechanics, N-body/N-center dynamics, and singular ODE arguments for collision, separation, cluster, and asymptotic-limit gaps. Use for rigorous review, not for ungrounded numerical confirmation.
metadata:
  short-description: 天体力学证明审计
---

# Celestial-Mechanics Proof Audit

Use this skill when a proof involves singular potentials, collision avoidance, clusters, final motions, scattering, or asymptotic dynamics. Keep the theorem fixed while identifying exactly what the written proof establishes.

## Required Checks

- Distinguish future absence of collision from a uniform positive lower bound on separation.
- In every centre-of-mass argument, identify which bodies are free, which are fixed, and all external-force terms. Do not use an isolated-cluster equation before separation or a quantitative perturbation bound has been proved.
- Track each use of energy conservation: it does not by itself bound singular potential energy or exclude near-collision when kinetic energy can compensate.
- For cluster decompositions, prove the partition is stable on the required time interval before using internal estimates as if the cluster were isolated.
- For asymptotic limits, state the topology, subsequence or full-limit claim, uniform bounds, and theorem justifying every exchange of derivative, limit, integral, or infinite series.
- Check threshold, zero angular-momentum, zero-energy, collision, escape, and degenerate-mass cases separately whenever the stated domain includes them.
- Separate numerical evidence and symbolic calculations from a general proof. State precision, error control, and reproducibility for computer-assisted claims.

## Audit Output

First map the theorem, potential, solution class, energy/angular-momentum assumptions, and claimed asymptotic regime. Then give a table of proof steps with the exact dependence, unproved side condition, severity, and downstream impact. Do not repair a theorem silently; route an actual repair to a proof-writing workflow.
