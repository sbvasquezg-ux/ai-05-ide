# Pending work

The paper remains partially formalized. The next sound step is to define the
paper's competitive equilibrium and its primitives before replacing any of the
six source-facing Specs.

- Replace the arbitrary carrier/predicate/function parameters in
  `PaperInterface.lean` with source-defined allocation, firm, market-clearing,
  matching, wage, rental-rate, distribution, and compute-supply objects.
- Rebuild all six proposition Specs from exact byte-pinned source atoms. In
  particular, preserve Proposition 5's connected winner intervals and its
  bottom/top threshold conclusions, and Proposition 6's adoption split and four
  comparative conclusions.
- Run the independent raw-source-to-expanded-Spec and premise-provenance reviews.
- Replace all six `ProofInterface.lean` `sorry` bodies with actual proofs.
- Audit the complete proof/instance/axiom closure and only then allow the
  workflow planner to schedule a final validation report and dependency DAG.

The current local wage and candidate-offer lemmas may be reused as proof
components once the equilibrium model supplies their assignment and zero-profit
hypotheses. They must not be promoted to proofs of Propositions 5 or 6 by name.

