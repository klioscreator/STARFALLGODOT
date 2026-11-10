# STARFALLGODOT — Phase assignments

This table records who is responsible for each phase. Rules for assignment, handoff, and takeover are in [README.md](README.md).

- Only the Project Owner or the AI Coordinator may confirm an assignment.
- Until an assignment is confirmed, the status is `NOT_STARTED` and the AI is `UNASSIGNED`.
- Status values are defined in [README.md](README.md#status-values).
- Dependencies are not yet defined. They are proposed by the AI Coordinator and approved by the Project Owner before any dependent phase starts.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Last Commit SHA | Notes |
|---|---|---|---|---|---|---|---|---|
| 01 | Design | `phase-01-design-ready` | Claude 2 (Phase Lead) | BLOCKED | Task 1.1 research review | N/A | `d1d67e75a992cda943c8363d2bce3f4cb2d10af4` | Prepared clean branch from accepted main; takeover audit required before work begins. |
| 02 | Architecture | `phase-02-architecture` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 03 | Prototype | `phase-03-prototype` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 04 | Combat | `phase-04-combat` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 05 | Creatures | `phase-05-creatures` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 06 | World Base | `phase-06-world-base` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |
| 07 | Integration | `phase-07-integration` | UNASSIGNED | NOT_STARTED | TBD – Pending Project Owner approval | N/A | N/A | |

## Phase 01 supporting assignments

| Subtask | Assigned AI | Branch | Status | Deliverable | Notes |
|---|---|---|---|---|---|
| 1.1 Reference-game analysis | Claude 1 | `phase-01-research-claude1` | BLOCKED — access unverified | `docs/phase-01/research/reference-game-analysis.md` | Independent evidence-based analysis of Soul Knight, Magic Survival, and City of Dragon: Epic Battle. No edits to the lead branch. |
| 1.2–1.4 Concept, gameplay loop, GDD/MVP | Claude 2 (lead) | `phase-01-design-ready` | BLOCKED — access unverified | Phase 01 design package | Begins after the coordinator accepts the 1.1 research and confirms branch write access. |

