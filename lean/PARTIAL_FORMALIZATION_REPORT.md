# Partial Formalization Report

## Scope and source

This folder targets Enrique Ide and Eduard Talamàs, *Artificial Intelligence in
the Knowledge Economy*, arXiv:2312.05481v11. The audited local PDF has SHA-256
`0b3c727a204f7801a9598dacd7ca7fdb385e21ee6877992ea0eb13c0538d8ebf`.
The PDF and extracted text are local audit inputs and are ignored by Git.

This is a partial-work report, not a final validation report. The workflow has
not issued a source-to-Spec audit, accepted obligation graph, dependency DAG, or
terminal closeout receipt.

The run used AppliedModelingLib commit
`2db7d108cd3a2cb10148974bb2a77856e7d87428`, GPT-5.6 Sol at xhigh reasoning,
Python 3.12.14, Lake 5.0.0, and Lean 4.30.0-rc2. Repository code is under the
root Apache-2.0 license; the ignored source PDF/text retain their own provenance
and are not cleared for publication by that code license.

## What Lean proves

`MainTheorems.lean` contains nine compiling theorems with no `sorry`:

1. `workerWage_eq_of_topAutomatedProfit_eq_zero` derives
   `w = zAI - h(1-z)r` from the displayed Section 3.1 formulas
   `n(z)=1/[h(1-z)]` and `n(z)[zAI-w]-r=0`.
2. `nonautonomous_workerWage_eq_aiKnowledge` specializes the bridge to `r=0`.
3. `autonomous_zeroKnowledge_workerWage` specializes it to `r=zAI`, `z=0`,
   yielding `w=(1-h)zAI`.
4. `nonautonomous_bottom_improvement_iff` proves the conditional equivalence
   `w>w₀ ↔ zAI>w₀` for an assigned zero-profit non-autonomous firm.
5. `autonomous_bottom_improvement_iff` proves the conditional equivalence
   `w>w₀ ↔ zAI>w₀/(1-h)` at `z=0` for an assigned zero-profit autonomous firm.
6. `preAIWage_lt_autonomous_threshold` proves
   `w₀ < w₀/(1-h)` when `0<h<1` and `w₀>0`.
7. `twoTypeCandidateOffer_le_referenceWage` proves a supplied two-type `max`
   expression is bounded by `(1-h)H` under explicit inequalities.
8. `scaledCandidateOffer_strictMono` proves the corresponding strict scaled
   comparison when `H<zAI` and `h<1`.
9. `nonautonomousOffer_improves_iff` proves
   `max w₀ zAI>w₀ ↔ zAI>w₀`.

The first six are local wage consequences of the paper's displayed profit and
team-size equations. The last three are algebraic reductions supplied for a
two-type illustration. The paper does not state their exact `max` expressions,
so they receive no direct source-result credit.

The exact Lean bridge suitable for a technical slide is:

```lean
theorem workerWage_eq_of_topAutomatedProfit_eq_zero
    {h z aiKnowledge workerWage computeRent : ℝ}
    (h_pos : 0 < h)
    (z_lt_one : z < 1)
    (zeroProfit :
      topAutomatedProfit h z aiKnowledge workerWage computeRent = 0) :
    workerWage = aiKnowledge - h * (1 - z) * computeRent := by
  have denominator_pos : 0 < h * (1 - z) :=
    mul_pos h_pos (sub_pos.mpr z_lt_one)
  have denominator_ne : h * (1 - z) ≠ 0 := ne_of_gt denominator_pos
  have quotient_eq :
      (aiKnowledge - workerWage) / (h * (1 - z)) = computeRent := by
    calc
      (aiKnowledge - workerWage) / (h * (1 - z)) =
          topAutomatedProfit h z aiKnowledge workerWage computeRent + computeRent := by
            unfold topAutomatedProfit teamSize
            ring
      _ = computeRent := by rw [zeroProfit]; ring
  have numerator_eq :
      aiKnowledge - workerWage = computeRent * (h * (1 - z)) :=
    (div_eq_iff denominator_ne).mp quotient_eq
  calc
    workerWage = aiKnowledge - computeRent * (h * (1 - z)) := by
      linarith
    _ = aiKnowledge - h * (1 - z) * computeRent := by ring
```

This theorem is conditional on the zero-profit equation and an assigned worker.
It does not prove equilibrium existence, assignment, or Proposition 5.

## Proof and build evidence

- `lake build +IT25KnowledgeEconomy.MainTheorems` succeeds without warnings.
- `lake build +IT25KnowledgeEconomy` succeeds, while honestly reporting six
  `sorry` warnings from `ProofInterface.lean`; see `BUILD_OUTPUT.txt`.
- `AXIOM_OUTPUT.txt` records `#print axioms` for all nine proved helpers. It
  lists only Mathlib's standard `propext`, `Classical.choice`, and `Quot.sound`;
  no helper depends on `sorryAx` or a project-declared economic axiom.
- `CHECK_OUTPUT.txt` is the complete output of
  `paper_contribution.py check IT25KnowledgeEconomy --fast`. It succeeds, but
  fast mode builds `PaperInterface` and runs a scoped `git diff --check`; it
  does not certify the six `ProofInterface` endpoints.

## Source-facing gaps

The six generated `Spec` declarations in `PaperInterface.lean` are scaffold
drafts and are semantically incomplete or incorrect as translations of
Propositions 1-6. They quantify over arbitrary carrier types, equilibrium
predicates, functions, and occupational sets without defining the paper's
competitive equilibrium or model primitives. Proposition 1 can be instantiated
with an empty carrier despite asserting unique equilibrium existence.
Proposition 5's draft does not encode the connected intervals
`B=[0,z_b)` and `T=(z_t,1]` or the paper's threshold structure. Parameters and
conditions involving `G`, `h<h₀`, compute supply, firm optimization, zero profit,
and market clearing are not fully represented.

All six corresponding declarations in `ProofInterface.lean` contain `sorry`.
They are compilation stubs only and receive no proof credit. No claim in this
folder proves the full equilibrium existence, uniqueness, efficiency,
occupational assignment, productivity, welfare, or income comparisons of
Propositions 1-6.

## Independent review

An isolated reviewer checked `MainTheorems.lean` against the pinned v11 source.
The reviewer confirmed the algebra and `sorry`-free/axiom output, required the
candidate-offer lemmas to remain generic algebra rather than be labeled as the
paper's “basic” or “advanced” AI cases, and explicitly did not review or approve
the six Specs. The resulting semantic limits are reflected above and in
`INDEPENDENT_REVIEW.md`.
