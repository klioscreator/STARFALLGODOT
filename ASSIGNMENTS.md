# STARFALLGODOT — Phase assignments

This table records accountable ownership. The Project Owner has delegated Phase 01 coordination, validation and integration to AIT0405 within the approved research/design scope.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Last Commit SHA | Notes |
|---|---|---|---|---|---|---|---|---|
| 01 | Design | `phase-01-design-ready` | AITtor (Phase Lead) | IN_PROGRESS | None between the two Phase 01 workstreams; integration review by AIT0405 | Specialist PR pending | `8fdf925b8d436903646010d893898d245d789943` | AITtor owns concept, gameplay loop/core systems, GDD and MVP. |
| 02 | Architecture | `phase-02-architecture` | UNASSIGNED | NOT_STARTED | Phase 01 acceptance and Project Owner approval | N/A | N/A | |
| 03 | Prototype | `phase-03-prototype` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 04 | Combat | `phase-04-combat` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 05 | Creatures | `phase-05-creatures` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 06 | World Base | `phase-06-world-base` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 07 | Integration | `phase-07-integration` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |

## Phase 01 workstreams

| Workstream | Owner | Branch | Status | Deliverable |
|---|---|---|---|---|
| 1.1 Reference-game research | AIT1404 (`quockhanh-eng`) | `phase-01-research-claude1` | IN_PROGRESS | `docs/phase-01/research/reference-game-analysis.md` |
| 1.2 Game concept and direction | AITtor (`HistoryandGeegraphyEducation`) | `phase-01-design-ready` | IN_PROGRESS | `docs/phase-01/game-concept.md` |
| 1.3 Gameplay loop and core systems | AITtor | `phase-01-design-ready` | IN_PROGRESS | `docs/phase-01/gameplay-loop-and-systems.md` |
| 1.4 GDD and MVP scope | AITtor | `phase-01-design-ready` | IN_PROGRESS | `docs/phase-01/game-design-document.md`; `docs/phase-01/mvp-scope.md` |
| Repository audit, coordination and acceptance | AIT0405 (`klioscreator`) | `phase-01-management-ait0405` | IN_PROGRESS | Management framework, audit record, status and review log |

## Verified GitHub access

- AIT1404 identity and write access: PASS. Commit `038c2d28e930fd75a3529579f1d1019c71e916fa` is authored and committed by `quockhanh-eng` on `phase-01-research-claude1`.
- AITtor identity and write access: PASS. Commit `8fdf925b8d436903646010d893898d245d789943` is authored and committed by `HistoryandGeegraphyEducation` on `phase-01-design-ready`.
- These are access-check commits, not substantive research/design deliverables.
- AIT0405's repository audit is recorded at `docs/phase-01/management/current-audit-2026-11-10.md`.
- Each AI must confirm in its own issue that no other session is currently writing to its assigned branch. GitHub alone cannot prove that no unpushed session work exists.

## Working rules

- AIT1404 and AITtor are independent workstreams. Neither must wait for the other's draft to begin.
- Each AI writes only to its assigned branch. AIT0405 reviews and integrates the outputs.
- Do not recreate completed work. Inspect the existing branch and report the actual file paths and commit SHA.
- Phase 01 is research and design only. No Godot scripts, scenes, assets, project settings or executable prototype may be changed.
- The legacy branch `phase-01-design` is not assigned. Do not use it as a working branch.
- Phase 02–07 remain unassigned and must not start before Phase 01 is accepted and the Project Owner approves the next phase.
