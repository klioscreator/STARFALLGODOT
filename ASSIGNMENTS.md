# STARFALLGODOT — Phase assignments

This table records who is responsible for each phase. Rules for assignment, handoff, and takeover are in [README.md](README.md).

- Only the Project Owner or the AI Coordinator may confirm an assignment.
- Until an assignment is confirmed, the status is `NOT_STARTED` and the AI is `UNASSIGNED`.
- Status values are defined in [README.md](README.md#status-values).
- Dependencies are not yet defined. They are proposed by the AI Coordinator and approved by the Project Owner before any dependent phase starts.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Last Commit SHA | Notes |
|---|---|---|---|---|---|---|---|---|
| 01 | Design | `phase-01-design-ready` | AITtor (Phase Lead) | BLOCKED — access checks pending | Task 1.1 research review | N/A | N/A — no substantive Phase 01 work | AITtor leads tasks 1.2–1.4 after AIT0405 accepts task 1.1. |
| 02 | Architecture | `phase-02-architecture` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 03 | Prototype | `phase-03-prototype` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 04 | Combat | `phase-04-combat` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 05 | Creatures | `phase-05-creatures` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 06 | World Base | `phase-06-world-base` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 07 | Integration | `phase-07-integration` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |

## Phase 01 supporting assignments

| Subtask | Assigned AI | Branch | Status | Deliverable | Notes |
|---|---|---|---|---|---|
| 1.1 Reference-game analysis | AIT1404 | `phase-01-research-claude1` | BLOCKED — access check pending | `docs/phase-01/research/reference-game-analysis.md` | Evidence-based analysis of Soul Knight, Magic Survival, and City of Dragon: Epic Battle. AIT1404 must verify the third title's exact identity before analysis. |
| 1.2–1.4 Concept, gameplay loop, GDD/MVP | AITtor (lead) | `phase-01-design-ready` | BLOCKED — access check and task 1.1 acceptance pending | Phase 01 design package | AITtor performs a takeover audit first, then waits for AIT0405 to accept task 1.1 before finalizing design deliverables. |

## Access and start gate

- AIT1404 must confirm its authenticated GitHub login is `quockhanh-eng`.
- AITtor must confirm its authenticated GitHub login is `HistoryandGeegraphyEducation`.
- Each AI must verify its assigned branch and perform one branch-specific write-access check.
- AIT0405 verifies each resulting commit on GitHub. Read access alone does not prove write access.
- Substantive Phase 01 work begins only after both identity/access checks pass. AITtor must also complete the takeover audit.
- Phase 01 is research and design only. No Godot code, scenes, assets, or project settings may be changed.
