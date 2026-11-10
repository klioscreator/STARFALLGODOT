# STARFALLGODOT — Phase assignments

The Project Owner has delegated Phase 01 coordination, validation and integration to AIT0405 within the research/design scope.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Notes |
|---|---|---|---|---|---|---|---|
| 01 | Design | `phase-01-design-ready` | AITtor (Phase Lead) | IN_PROGRESS — owner-aligned revision under review | AIT0405 validation and Project Owner-approved direction | PR #29–#31 merged; owner-direction revision pending | AITtor remains accountable for its specialist branch. |
| 02 | Architecture | `phase-02-architecture` | UNASSIGNED | NOT_STARTED | Phase 01 acceptance and platform/turn-system decisions | N/A | |
| 03 | Prototype | `phase-03-prototype` | UNASSIGNED | NOT_STARTED | Phase 02 architecture approval | N/A | |
| 04 | Combat | `phase-04-combat` | UNASSIGNED | NOT_STARTED | Prototype and combat architecture | N/A | |
| 05 | Creatures / Enemies | `phase-05-creatures` | UNASSIGNED | NOT_STARTED | Combat foundation | N/A | |
| 06 | World Base | `phase-06-world-base` | UNASSIGNED | NOT_STARTED | Character, camera and world architecture | N/A | |
| 07 | Integration | `phase-07-integration` | UNASSIGNED | NOT_STARTED | All required systems | N/A | |

## Approved Phase 01 product direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera; no top-down view.
- Tactical turn-based combat.
- Solo mode and tactical group mode.
- Weapons and skills as core build components.
- Separate supplementary server project for online group play.

## Phase 01 workstreams

| Workstream | Owner | Branch | Status | Deliverable |
|---|---|---|---|---|
| 1.1 Reference-game research | AIT1404 (`quockhanh-eng`) | `phase-01-research-claude1` | Accepted baseline report authored by AIT0405 fallback; Issue #15 closed | `docs/phase-01/research/reference-game-analysis.md` |
| 1.2 Concept and direction | AITtor (`HistoryandGeegraphyEducation`) | `phase-01-design-ready` | Coordinator package revised to Project Owner direction; specialist reconciliation/review pending | `docs/phase-01/game-concept.md` |
| 1.3 Gameplay loop and systems | AITtor | `phase-01-design-ready` | Revised for turn-based tactical combat, dual camera and solo/group modes | `docs/phase-01/gameplay-loop-and-systems.md` |
| 1.4 GDD and MVP | AITtor | `phase-01-design-ready` | Revised to owner direction; final validation pending | `docs/phase-01/game-design-document.md`; `docs/phase-01/mvp-scope.md` |
| Coordination and acceptance | AIT0405 (`klioscreator`) | Management and coordination branches | Ongoing | Audit, review, integration and handoff |

## Specialist access evidence

- AIT1404 identity/write access: verified by access-check commit `038c2d28e930fd75a3529579f1d1019c71e916fa`.
- AITtor identity/write access: verified by access-check commit `8fdf925b8d436903646010d893898d245d789943`.
- These access-check commits are not substantive specialist deliverables.
- Specialist branches were not modified by coordinator fallback work.
- GitHub cannot establish whether another AI session has unpushed local work.

## Working rules

- AIT1404 and AITtor were independent workstreams; no dependency required AITtor to wait for AIT1404.
- Do not recreate or overwrite completed work. Review any later specialist material and reconcile it.
- Phase 01 is research/design only. No Godot scripts, scenes, assets, project settings or executable prototype may be changed.
- The supplementary server project is a future separate workstream and is not implemented during Phase 01.
- Phase 02–07 must not begin before Phase 01 sign-off and Project Owner approval.
