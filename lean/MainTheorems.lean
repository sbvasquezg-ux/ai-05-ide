import Mathlib

/-!
# Paper-Facing Theorems: Artificial Intelligence in the Knowledge Economy

This file is the implementation theorem layer for the source paper. Keep
source-faithful definitions and theorem wrappers here, and expose only the
compact human-review subset in `PaperInterface.lean`.

During the statement-first phase, each exact paper-facing proposition lives in a
transparent `<name>Spec : Prop` declaration in `PaperInterface.lean`; the paired
theorem/lemma endpoint belongs in `ProofInterface.lean` and has exactly that
type. Add proof implementations here only after those specifications pass v11
raw-source-to-expanded-Spec review and recursive premise provenance audit. Before full closeout, the v11
realization audit independently binds pinned source atoms to the elaborated Spec
and accounts for the complete Lean closure; a proof hole or a declaration name
is never evidence for that correspondence.
-/

namespace IT25KnowledgeEconomy

/--
The span of a human solver supervising workers with knowledge `z`, as defined
in Section 3.1 (page 9): `n(z) = 1 / (h(1-z))`.
-/
noncomputable def teamSize (h z : ℝ) : ℝ :=
  1 / (h * (1 - z))

/--
Profit of a top-automated two-layer organization from Section 3.1 (page 12):
`Π₂ᵗᴬ(z) = n(z) [zAI - w(z)] - r`.
-/
noncomputable def topAutomatedProfit
    (h z aiKnowledge workerWage computeRent : ℝ) : ℝ :=
  teamSize h z * (aiKnowledge - workerWage) - computeRent

/--
The zero-profit condition for a top-automated organization determines the
worker wage. This is the algebraic bridge from the paper's displayed team-size
and profit equations; it does not prove equilibrium existence or assignment.
-/
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

/--
For non-autonomous AI, the compute rent is zero. Conditional on a human being
assigned to a top-automated firm and that firm earning zero profit, her wage is
the AI knowledge level.
-/
theorem nonautonomous_workerWage_eq_aiKnowledge
    {h z aiKnowledge workerWage : ℝ}
    (h_pos : 0 < h)
    (z_lt_one : z < 1)
    (zeroProfit : topAutomatedProfit h z aiKnowledge workerWage 0 = 0) :
    workerWage = aiKnowledge := by
  rw [workerWage_eq_of_topAutomatedProfit_eq_zero h_pos z_lt_one zeroProfit]
  ring

/--
For autonomous AI, compute rent equals AI knowledge. At `z = 0`, the
zero-profit wage of an assigned worker is `(1-h) zAI`.
-/
theorem autonomous_zeroKnowledge_workerWage
    {h aiKnowledge workerWage : ℝ}
    (h_pos : 0 < h)
    (zeroProfit :
      topAutomatedProfit h 0 aiKnowledge workerWage aiKnowledge = 0) :
    workerWage = (1 - h) * aiKnowledge := by
  rw [workerWage_eq_of_topAutomatedProfit_eq_zero h_pos (by norm_num) zeroProfit]
  ring

/--
Conditional bottom-wage comparison for the non-autonomous branch. The left
side refers to the wage of a worker actually assigned to an AI-solver firm;
the theorem does not assert that such an assignment occurs in equilibrium.
-/
theorem nonautonomous_bottom_improvement_iff
    {h z aiKnowledge workerWage preAIWage : ℝ}
    (h_pos : 0 < h)
    (z_lt_one : z < 1)
    (zeroProfit : topAutomatedProfit h z aiKnowledge workerWage 0 = 0) :
    workerWage > preAIWage ↔ aiKnowledge > preAIWage := by
  rw [nonautonomous_workerWage_eq_aiKnowledge h_pos z_lt_one zeroProfit]

/--
Conditional bottom-wage comparison for the autonomous branch. At `z = 0`,
improvement over the pre-AI wage is equivalent to the AI knowledge threshold
`zAI > w(0)/(1-h)`. This is a local implication used in the intuition around
Proposition 5, not a proof of Proposition 5's equilibrium threshold theorem.
-/
theorem autonomous_bottom_improvement_iff
    {h aiKnowledge workerWage preAIWage : ℝ}
    (h_pos : 0 < h)
    (h_lt_one : h < 1)
    (zeroProfit :
      topAutomatedProfit h 0 aiKnowledge workerWage aiKnowledge = 0) :
    workerWage > preAIWage ↔ aiKnowledge > preAIWage / (1 - h) := by
  rw [autonomous_zeroKnowledge_workerWage h_pos zeroProfit]
  have one_sub_h_pos : 0 < 1 - h := sub_pos.mpr h_lt_one
  constructor
  · intro improvement
    apply (div_lt_iff₀ one_sub_h_pos).2
    simpa [mul_comm] using improvement
  · intro threshold
    have multiplied := (div_lt_iff₀ one_sub_h_pos).1 threshold
    simpa [mul_comm] using multiplied

/--
When the pre-AI bottom wage and helping cost are positive and `h < 1`, the
autonomous threshold `w(0)/(1-h)` strictly exceeds the non-autonomous threshold
`w(0)`.
-/
theorem preAIWage_lt_autonomous_threshold
    {h preAIWage : ℝ}
    (h_pos : 0 < h)
    (h_lt_one : h < 1)
    (preAIWage_pos : 0 < preAIWage) :
    preAIWage < preAIWage / (1 - h) := by
  have one_sub_h_pos : 0 < 1 - h := sub_pos.mpr h_lt_one
  rw [lt_div_iff₀ one_sub_h_pos]
  nlinarith [mul_pos preAIWage_pos h_pos]

/--
In a two-type algebraic reduction, the candidate AI-assisted offer is bounded
by the reference wage `(1-h)H` under the stated inequalities. The paper does
not display this `max` expression or identify these hypotheses with its
"basic AI" condition. This lemma only compares the expression supplied to it.
-/
theorem twoTypeCandidateOffer_le_referenceWage
    {h aiKnowledge humanUpperBound topSolverWage : ℝ}
    (humanUpperBound_pos : 0 < humanUpperBound)
    (h_pos : 0 < h)
    (h_lt_one : h < 1)
    (ai_le_humanUpperBound : aiKnowledge ≤ humanUpperBound)
    (topSolverWage_ge_humanUpperBound : humanUpperBound ≤ topSolverWage) :
    max 0 (max (humanUpperBound - h * topSolverWage)
      ((1 - h) * aiKnowledge)) ≤ (1 - h) * humanUpperBound := by
  have one_sub_h_nonneg : 0 ≤ 1 - h := le_of_lt (sub_pos.mpr h_lt_one)
  have scaled_top_ge : h * humanUpperBound ≤ h * topSolverWage :=
    mul_le_mul_of_nonneg_left topSolverWage_ge_humanUpperBound (le_of_lt h_pos)
  apply max_le
  · exact mul_nonneg one_sub_h_nonneg (le_of_lt humanUpperBound_pos)
  · apply max_le
    · linarith
    · exact mul_le_mul_of_nonneg_left ai_le_humanUpperBound one_sub_h_nonneg

/--
Multiplication by the positive factor `(1-h)` preserves a strict comparison.
This algebraic lemma does not encode the paper's "advanced AI" condition.
-/
theorem scaledCandidateOffer_strictMono
    {h aiKnowledge humanUpperBound : ℝ}
    (h_lt_one : h < 1)
    (humanUpperBound_lt_ai : humanUpperBound < aiKnowledge) :
    (1 - h) * humanUpperBound < (1 - h) * aiKnowledge := by
  exact mul_lt_mul_of_pos_left humanUpperBound_lt_ai (sub_pos.mpr h_lt_one)

/--
For the generic candidate offer `max w₀ zAI`, strict improvement over the
reference wage `w₀` occurs exactly when AI knowledge exceeds `w₀`. The paper
does not define this `max` expression directly; connecting it to Proposition 6
requires the missing equilibrium adoption derivation.
-/
theorem nonautonomousOffer_improves_iff
    {aiKnowledge preAIWage : ℝ} :
    max preAIWage aiKnowledge > preAIWage ↔ aiKnowledge > preAIWage := by
  simp

end IT25KnowledgeEconomy
