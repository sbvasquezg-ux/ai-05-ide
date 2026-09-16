# Formalization Working Memo: Artificial Intelligence in the Knowledge Economy

This is a working lead log, not audit evidence and not a final validation
report. Record possible issues while reading and proving; independently verify
each retained item against the pinned source and final Lean surface during
closeout.

For every item, record the exact source location, current mathematical reading,
Lean treatment, and review state. Prefer “clarification” unless the printed
formula or statement is actually false.

## Possible Source Clarifications

- The local source is the 35-page arXiv v11 PDF (24 February 2025), SHA-256
  `0b3c727a204f7801a9598dacd7ca7fdb385e21ee6877992ea0eb13c0538d8ebf`.
  The paper text displays 25 February 2025. The formalization remains pinned to
  arXiv v11 rather than the later v12.
- The source inventory currently identifies one named definition (Competitive
  Equilibrium, page 13) and six named propositions: Proposition 1 (page 16),
  Proposition 2 (pages 18-19), Propositions 3-4 (page 22), Proposition 5
  (page 24), and Proposition 6 (page 27). The required independent byte-pinned
  source-atom inventory and source-map review remain incomplete.

## Possible Printed Typos Or Errors

- None recorded.

## Possible Proof-Strategy Deviations

- `MainTheorems.lean` proves a local algebraic consequence of Section 3.1's
  displayed formulas `n(z) = 1/[h(1-z)]` and
  `Π₂ᵗᴬ(z) = n(z)[zAI-w(z)]-r`: under `0<h`, `z<1`, and zero profit,
  `w(z)=zAI-h(1-z)r`. This proof does not establish equilibrium assignment.
- The non-autonomous (`r=0`) and autonomous (`r=zAI`, `z=0`) wage identities,
  their conditional bottom-wage threshold equivalences, and the comparison of
  those thresholds are proved from that bridge.
- Three two-type candidate-offer comparisons are proved as derived algebraic
  reductions. They do not prove that the corresponding branch is selected in
  equilibrium and are not presented as Proposition 5 or Proposition 6.

## Possible Model Conventions Or Extra Assumptions

- The proved wage bridge assumes an already assigned worker, positive helping
  cost, worker knowledge below one, and the displayed top-automated firm's
  zero-profit equation. These are visible theorem premises rather than a
  hidden equilibrium model.
- The generic two-type offer bound assumes `0<H`, `0<h<1`, `zAI≤H`, and a top
  solver wage `vH≥H`. The scaled strict comparison assumes `H<zAI` and `h<1`.
  These conditions are not equated with the paper's occupational definitions
  of “basic” and “advanced” AI.

## Deferred Formalization Or Library Work

- `PaperInterface.lean` currently contains six generated Specs that are not
  semantically accepted translations of Propositions 1-6. They quantify over
  arbitrary predicates, functions, and carrier types rather than defining the
  paper's competitive equilibrium and model primitives. Proposition 5's draft
  does not encode the connected winner intervals or the paper's threshold
  structure. Proposition 1's universal arbitrary carrier can include an empty
  type, contradicting its asserted unique-existence clause.
- All six `ProofInterface.lean` endpoints contain `sorry`. They receive no proof
  credit. The source-facing propositions still require corrected Specs, a
  source audit, and proofs from explicit model definitions.
- No final validation report or dependency DAG has been issued: the workflow
  has not reached terminal closeout, and the partial report must not be read as
  an audit pass.
