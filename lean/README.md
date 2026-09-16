<!-- BEGIN GENERATED PAPER FOLDER README -->
# Artificial Intelligence in the Knowledge Economy

| Field | Value |
|---|---|
| Final status | Partially formalized |
| Paper reference | Artificial Intelligence in the Knowledge Economy by Enrique Ide and Eduard Talamàs; Publication details not listed. |
| Lines of Code | 492 |

## Key Links

- Final validation report: not tracked in this folder.
- Dependency DAG: not tracked in this folder.
- Compact Lean interface: [PaperInterface.lean](PaperInterface.lean)
- Source/status JSON: [status.json](status.json); [paper statement map](audit/paper_statement_map.json).
- Additional documentation: [FORMALIZATION_NOTES.md](docs/FORMALIZATION_NOTES.md)
<!-- END GENERATED PAPER FOLDER README -->

## Partial-work evidence

- [PARTIAL_FORMALIZATION_REPORT.md](PARTIAL_FORMALIZATION_REPORT.md) states the
  proved scope and the six unproved, semantically incomplete source endpoints.
- [PENDING.md](PENDING.md) records the remaining model, Spec, proof, and audit
  work.
- `BUILD_OUTPUT.txt`, `CHECK_OUTPUT.txt`, and `AXIOM_OUTPUT.txt` preserve the
  exact local build, fast-check, and helper-theorem axiom outputs.

## Reproducing after copying this folder

This folder is not a standalone Lake package. Copy it to
`papers/IT25KnowledgeEconomy/` in an AppliedModelingLib checkout, then recreate
the repository-level root module `papers/IT25KnowledgeEconomy.lean` with:

```lean
import IT25KnowledgeEconomy.ProofInterface
```

If it is not already present, append this exact stanza to the repository-level
`lakefile.toml`:

```toml
[[lean_lib]]
name = "IT25KnowledgeEconomy"
srcDir = "papers"
```

The checkout pins `leanprover/lean4:v4.30.0-rc2` in `lean-toolchain`; its
external Lean dependencies are pinned by `lake-manifest.json`. From the
repository root, run:

```sh
lake update
lake build AppliedModelingLib
lake build +IT25KnowledgeEconomy.MainTheorems
lake build +IT25KnowledgeEconomy
```

The last command is expected to report six `sorry` warnings from
`ProofInterface.lean`. A successful build or `check --fast` is compilation
evidence only; neither proves those source-facing endpoints.

## Provenance and licensing

The folder was generated against AppliedModelingLib commit
`2db7d108cd3a2cb10148974bb2a77856e7d87428`, using GPT-5.6 Sol at xhigh
reasoning, Python 3.12.14, Lake 5.0.0, and Lean 4.30.0-rc2. Repository code is
covered by the root Apache-2.0 license. The arXiv PDF and extracted text remain
ignored local audit inputs; they are not repository-code artifacts and must not
be published from this folder without a separate redistribution decision.
