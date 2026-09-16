import IT25KnowledgeEconomy.MainTheorems
import IT25KnowledgeEconomy.Assumptions

/-!
# Human-Facing Paper Interface: Artificial Intelligence in the Knowledge Economy

This is the compact Lean file a human should read after formalization to check
whether the paper's definitions and named theorem statements were represented
correctly. Keep the row-level dashboard and LLM audit statements in this file
for every paper. Move implementation details, proof aliases, and bulky helper
lemmas behind imported modules such as `AuditInterface.lean`, but expose the
audited paper-facing statements directly here; do not use
`paper_interface.audit_surface_path`.

Rules for completing this file:

- Keep the paper's definitions/formatted objects first, in source order.
- Expose the actual paper formulas here; do not only point to generic library
  definitions or implementation witnesses.
- A material reusable `AppliedModelingLib` primitive may remain a reference here only
  after `audit/library_semantic_review.json` records its exact bounded library
  declaration and an explicit byte-pinned paper-source connection. The
  dashboard and human-review packet show and source-check that declaration
  before the dependent Spec; a library name, docstring, or glossary is not a
  semantic bridge. Do not add a duplicate paper claim merely to restate it.
- If a named theorem needs a hypothesis that is not derived from earlier Lean
  declarations, declare that hypothesis in `Assumptions.lean` and list it in
  `status.json` `review_surface.assumption_names`.
- Then state the named results directly, with assumptions visible in each
  theorem signature by referencing named paper assumptions imported from
  `Assumptions.lean`.
- In the statement-first phase, write every complete source-facing statement as
  a transparent `<name>Spec : Prop` here, exactly once. Put the paired
  theorem/lemma of that exact type in `ProofInterface.lean`; its temporary
  proof body may be `by sorry` only in a private draft. This separation keeps
  the human semantic surface free of thin wrapper declarations.
- Before drafting that Lean surface, independently inventory every material
  source atom from exact pinned source quote bytes. Do not infer source atoms
  from declaration, binder, field, function, or source-map names.
- Run raw-source-to-expanded-Spec statement matching plus Lean-emitted
  premise/conclusion claim-atom review on the skeleton. The semantic comparison uses
  only byte-pinned source quotes (and separately pinned source context) against
  the expanded transparent Spec; map summaries and proof wrappers are not
  semantic inputs. Then freeze each canonical Lean declaration-manifest digest.
- In the proof phase, replace the `ProofInterface.lean` `sorry` with a short
  proof that calls into `MainTheorems.lean` or lower proof files without
  changing the specification or theorem type. Any specification/type change
  invalidates the freeze and requires a fresh statement audit.
- At formalized closeout, complete the v11 realization receipt: Lean Meta checks
  the theorem has exactly the transparent Spec type; each source atom is bound
  to the elaborated Spec surface; closure traversal includes proof and instance
  arguments; and every material terminal has a source, approved correction or
  additional assumption, checked derivation, or version-pinned foundation
  disposition. No data, container, or identifier-based exemption is allowed.
- The transparent `...Spec` is the sole semantic-review target for its source
  claim. The paired theorem/lemma is a proof endpoint whose exact Spec type is
  verified by Lean Meta, not a duplicate source-to-Lean comparison row.
- Keep proof endpoints, exhaustive endpoint aliases, and proof-seam checks in
  `ProofInterface.lean`, implementation modules, or `ProofLedger.lean`, not
  here. Do not create new `PostPaperAudit.lean` or `AuditLedger.lean` files;
  those names are legacy.

## Named Results

Each entry has one semantic-review target (`Spec`) and one proof endpoint (the
paired theorem/lemma). The human dashboard and review packet present that pair
once rather than treating the two declarations as duplicate paper claims.

**Current draft warning.** The six generated `Spec` declarations below are
scaffold drafts, not accepted translations of the paper. They quantify over
otherwise arbitrary equilibrium predicates, wage functions, and occupational
sets instead of defining the paper's equilibrium model and its primitives. In
particular, their quantifier structure can make existence clauses false for
arbitrary or empty carrier types; Proposition 5's draft replaces the paper's
connected extreme intervals and thresholds with an arbitrary winner set; and
the required model parameters and threshold conditions are incomplete. No
source-to-Spec audit has approved these declarations. Their paired endpoints
in `ProofInterface.lean` all still contain `sorry`.

- `proposition1_preAI_equilibriumSpec` -> `proposition1_preAI_equilibrium`: Proposition 1, page 16, Section 3.3, Proposition 1.
- `proposition2_autonomousAI_equilibriumSpec` -> `proposition2_autonomousAI_equilibrium`: Proposition 2, pages 18-19, Section 4, Proposition 2.
- `proposition3_occupational_displacementSpec` -> `proposition3_occupational_displacement`: Proposition 3, page 22, Section 5.1, Proposition 3.
- `proposition4_productivity_and_spanSpec` -> `proposition4_productivity_and_span`: Proposition 4, page 22, Section 5.1, Proposition 4.
- `proposition5_winners_at_extremesSpec` -> `proposition5_winners_at_extremes`: Proposition 5, page 24, Section 5.2, Proposition 5.
- `proposition6_nonautonomousAI_equilibriumSpec` -> `proposition6_nonautonomousAI_equilibrium`: Proposition 6, page 27, Section 6.1, Proposition 6.
-/

namespace IT25KnowledgeEconomy

/--
Proposition 1

Paper statement: In the absence of AI, there is a unique equilibrium. The equilibrium is efficient (i.e., it maximizes total output) and has the following features: occupational stratification W ≼ I ≼ S; positive assortative matching, with m : W → S strictly increasing; W and S are nonempty, while I is nonempty if and only if h > h₀ for some h₀ ∈ (0,1). Moreover, w is continuous, strictly increasing, convex (strictly so on W ∪ S), satisfies the three displayed wage equations on W, I, and S, and w(z) > z outside cl I (hence everywhere when h < h₀).

Source location: page 16, Section 3.3, Proposition 1
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition1_preAI_equilibriumSpec : Prop :=
  ∀ (E : Type) (isEquilibrium efficient : E → Prop) (workers independent solvers : E → Set ℝ) (matching wage teamSize employee : E → ℝ → ℝ) (h : ℝ), 0 < h → h < 1 → (∃! q, isEquilibrium q) ∧ ∃ h0 ∈ Set.Ioo (0 : ℝ) 1, ∀ q, isEquilibrium q → efficient q ∧ sSup (workers q) ≤ sInf (independent q) ∧ sSup (independent q) ≤ sInf (solvers q) ∧ StrictMonoOn (matching q) (workers q) ∧ (workers q).Nonempty ∧ (solvers q).Nonempty ∧ ((independent q).Nonempty ↔ h > h0) ∧ Continuous (wage q) ∧ StrictMonoOn (wage q) (Set.Icc (0 : ℝ) 1) ∧ ConvexOn ℝ (Set.Icc (0 : ℝ) 1) (wage q) ∧ StrictConvexOn ℝ (workers q ∪ solvers q) (wage q) ∧ (∀ z ∈ workers q, wage q z = matching q z - wage q (matching q z) / teamSize q z) ∧ (∀ z ∈ independent q, wage q z = z) ∧ (∃ C : ℝ, (h < h0 → C > sInf (solvers q)) ∧ (h ≥ h0 → C = sInf (solvers q)) ∧ ∀ z ∈ solvers q, wage q z = C + ∫ u in sInf (solvers q)..z, teamSize q (employee q u)) ∧ (∀ z ∈ Set.Icc (0 : ℝ) 1, z ∉ closure (independent q) → wage q z > z) ∧ (h < h0 → ∀ z ∈ Set.Icc (0 : ℝ) 1, wage q z > z)

/--
Proposition 2

Paper statement: In the presence of an autonomous AI, there is a unique equilibrium. The equilibrium is efficient; has occupational stratification W* ≼ I* ≼ S*; no worker is more knowledgeable than AI and no solver less knowledgeable than AI; has strictly increasing human matching m*, with AI-assisted workers below human-assisted workers and human solvers assisting humans below those assisting AI. AI is always used for independent production; if zAI ∈ W it is necessarily used as a worker, and if zAI ∈ S it is necessarily used as a solver. The rental rate is zAI. The wage is continuous, strictly increasing and convex (strictly on W*p ∪ S*p), obeys the five displayed wage formulas, and the three boundary wage equalities stated in the proposition.

Source location: pages 18-19, Section 4, Proposition 2
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition2_autonomousAI_equilibriumSpec : Prop :=
  ∀ (E : Type) (isEquilibrium efficient : E → Prop) (workers independent solvers humanWorkers aiAssistedWorkers humanSolvers aiAssistedSolvers : E → Set ℝ) (matching wage teamSize employee : E → ℝ → ℝ) (rent aiKnowledge : E → ℝ) (aiIndependent aiWorker aiSolver : E → Prop), (∃! q, isEquilibrium q) ∧ ∀ q, isEquilibrium q → efficient q ∧ sSup (workers q) ≤ sInf (independent q) ∧ sSup (independent q) ≤ sInf (solvers q) ∧ sSup (workers q) ≤ aiKnowledge q ∧ aiKnowledge q ≤ sInf (solvers q) ∧ StrictMonoOn (matching q) (humanWorkers q) ∧ sSup (aiAssistedWorkers q) ≤ sInf (humanWorkers q) ∧ sSup (humanSolvers q) ≤ sInf (aiAssistedSolvers q) ∧ aiIndependent q ∧ (aiKnowledge q ∈ workers q → aiWorker q) ∧ (aiKnowledge q ∈ solvers q → aiSolver q) ∧ rent q = aiKnowledge q ∧ Continuous (wage q) ∧ StrictMonoOn (wage q) (Set.Icc (0 : ℝ) 1) ∧ ConvexOn ℝ (Set.Icc (0 : ℝ) 1) (wage q) ∧ StrictConvexOn ℝ (humanWorkers q ∪ humanSolvers q) (wage q) ∧ (∀ z ∈ aiAssistedWorkers q, wage q z = aiKnowledge q * (1 - 1 / teamSize q z) ∧ wage q z > z) ∧ (∀ z ∈ humanWorkers q, wage q z = matching q z - wage q (matching q z) / teamSize q z) ∧ (∀ z ∈ independent q, wage q z = z) ∧ (∃ C : ℝ, C = sInf (humanSolvers q) ∧ ∀ z ∈ humanSolvers q, wage q z = C + ∫ u in sInf (humanSolvers q)..z, teamSize q (employee q u)) ∧ (∀ z ∈ aiAssistedSolvers q, wage q z = teamSize q (aiKnowledge q) * (z - aiKnowledge q) ∧ wage q z > z) ∧ wage q (sSup (workers q)) = sSup (humanWorkers q) ∧ wage q (aiKnowledge q) = aiKnowledge q ∧ wage q (sInf (solvers q)) = sInf (humanSolvers q)

/--
Proposition 3

Paper statement: If zAI ∈ int W, AI displaces humans from routine knowledge work to specialized problem solving, i.e., W* ⊂ W and S* ⊃ S. In contrast, if zAI ∈ int S, AI displaces humans in the opposite direction, i.e., W* ⊃ W and S* ⊂ S.

Source location: page 22, Section 5.1, Proposition 3
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition3_occupational_displacementSpec : Prop :=
  ∀ (zAI : ℝ) (W S Wstar Sstar : Set ℝ), (zAI ∈ interior W → Wstar ⊂ W ∧ S ⊂ Sstar) ∧ (zAI ∈ interior S → W ⊂ Wstar ∧ Sstar ⊂ S)

/--
Proposition 4

Paper statement: If zAI ∈ int W, productivity is strictly lower post-AI for every z ∈ W* ⊂ W; for z ∈ S ⊂ S*, span of control is strictly larger when e(z) < zAI and strictly smaller when e(z) > zAI. If zAI ∈ int S, productivity for z ∈ W ⊂ W* is strictly higher when z < e(zAI) and strictly lower when z > e(zAI); span of control is strictly larger post-AI for every z ∈ S* ⊂ S.

Source location: page 22, Section 5.1, Proposition 4
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition4_productivity_and_spanSpec : Prop :=
  ∀ (zAI : ℝ) (W S Wstar Sstar : Set ℝ) (employee preProductivity postProductivity preSpan postSpan : ℝ → ℝ), (zAI ∈ interior W → Wstar ⊂ W ∧ S ⊂ Sstar ∧ (∀ z ∈ Wstar, postProductivity z < preProductivity z) ∧ (∀ z ∈ S, employee z < zAI → postSpan z > preSpan z) ∧ (∀ z ∈ S, employee z > zAI → postSpan z < preSpan z)) ∧ (zAI ∈ interior S → W ⊂ Wstar ∧ Sstar ⊂ S ∧ (∀ z ∈ W, z < employee zAI → postProductivity z > preProductivity z) ∧ (∀ z ∈ W, z > employee zAI → postProductivity z < preProductivity z) ∧ (∀ z ∈ Sstar, postSpan z > preSpan z))

/--
Proposition 5

Paper statement: There are winners at the bottom if AI is good enough: B is nonempty if and only if zAI > z̄AI, where z̄AI ∈ int W. In contrast, there are always winners at the top: T is nonempty for all zAI ∈ [0,1).

Source location: page 24, Section 5.2, Proposition 5
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition5_winners_at_extremesSpec : Prop :=
  ∀ (W : Set ℝ) (preWage : ℝ → ℝ) (postWage : ℝ → ℝ → ℝ), ∃ threshold ∈ interior W, ∀ zAI ∈ Set.Ico (0 : ℝ) 1, ((Set.Icc (0 : ℝ) zAI ∩ {z | postWage zAI z > preWage z}).Nonempty ↔ zAI > threshold) ∧ (Set.Icc zAI 1 ∩ {z | postWage zAI z > preWage z}).Nonempty

/--
Proposition 6

Paper statement: With non-autonomous AI there is a unique equilibrium; it is efficient, maximizes labor income, and r⋆ = 0. If zAI ≤ w(0), AI is unused and human occupations and wages equal their pre-AI values. If zAI > w(0), only the least knowledgeable use AI as solver: W⋆a ≼ (W⋆p ∪ I⋆ ∪ S⋆p), with all those sets nonempty except possibly I⋆. In all cases output is strictly higher with autonomous AI; non-autonomous AI creates losers; the least knowledgeable weakly prefer non-autonomous AI to no AI and autonomous AI (strictly if zAI > w(0)); and the most knowledgeable weakly prefer autonomous AI to non-autonomous AI (strictly away from z = 1).

Source location: page 27, Section 6.1, Proposition 6
Source status: semantically incomplete scaffold draft; not source-approved

This transparent proposition is the exact statement-audit target. It is not
proof evidence. Its exact-type proof endpoint is declared in
`ProofInterface.lean`, so this human-facing file presents the full semantic
proposition once. At closeout, source atoms must be independently inventoried
from pinned source quote bytes and bound to this elaborated proposition rather
than inferred from identifiers.
-/
def proposition6_nonautonomousAI_equilibriumSpec : Prop :=
  ∀ (E : Type) (isEquilibrium efficient maximizesLaborIncome : E → Prop) (zAI : ℝ) (preWage autonomousWage : ℝ → ℝ) (nonautonomousWage : E → ℝ → ℝ) (rent autonomousOutput nonautonomousOutput : E → ℝ) (preWorkers preIndependent preSolvers : Set ℝ) (aiAssistedWorkers humanWorkers independent humanSolvers : E → Set ℝ), zAI ∈ Set.Ico (0 : ℝ) 1 → (∃! q, isEquilibrium q) ∧ ∀ q, isEquilibrium q → efficient q ∧ maximizesLaborIncome q ∧ rent q = 0 ∧ (zAI ≤ preWage 0 → aiAssistedWorkers q = ∅ ∧ humanWorkers q = preWorkers ∧ independent q = preIndependent ∧ humanSolvers q = preSolvers ∧ nonautonomousWage q = preWage) ∧ (zAI > preWage 0 → sSup (aiAssistedWorkers q) ≤ sInf (humanWorkers q ∪ independent q ∪ humanSolvers q) ∧ (aiAssistedWorkers q).Nonempty ∧ (humanWorkers q).Nonempty ∧ (humanSolvers q).Nonempty) ∧ autonomousOutput q > nonautonomousOutput q ∧ (∃ z ∈ Set.Ioc (0 : ℝ) 1, nonautonomousWage q z ≤ preWage z ∧ (zAI > preWage 0 → nonautonomousWage q z < preWage z)) ∧ (∃ ε > 0, ∀ z ∈ Set.Ico (0 : ℝ) ε, nonautonomousWage q z ≥ max (preWage z) (autonomousWage z) ∧ (zAI > preWage 0 → nonautonomousWage q z > max (preWage z) (autonomousWage z))) ∧ (∃ ε > 0, ∀ z ∈ Set.Ioc (1 - ε) 1, nonautonomousWage q z ≤ autonomousWage z ∧ (z ≠ 1 → nonautonomousWage q z < autonomousWage z))

end IT25KnowledgeEconomy
