# Independent review of local algebraic lemmas

An isolated reviewer compiled `MainTheorems.lean`, compared its formulas with
the pinned arXiv v11 text, and ran the recorded axiom inspection.

The reviewer found the team-size, top-automated profit, zero-profit wage bridge,
specializations, threshold equivalences, and inequality proofs algebraically
correct. The source's broader domain includes conditions such as `h∈(0,1)`,
`0≤z≤zAI<1`, and nonnegative rent; these are not all mathematically needed for
the generic identity and therefore must be supplied by any later equilibrium
application.

The initial names “basic” and “advanced” on the two-type candidate-offer lemmas
were rejected because the paper defines those cases through membership in the
pre-AI occupational sets, not through the simplified inequalities alone. The
lemmas were renamed and documented as generic algebra. The paper does not
display their exact `max` expressions, so they receive no source-result credit.

The reviewer explicitly did not review, validate, or approve any of the six
Specs in `PaperInterface.lean`. Those Specs remain semantically incomplete or
incorrect scaffold drafts, and all six proof endpoints remain `sorry`.

