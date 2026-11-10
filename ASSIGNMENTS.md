# STARFALLGODOT — Phase assignments

The Project Owner authorised Phase 02. AIT0405 served as Phase 02 lead and coordinator. Phase 03–07 remain unassigned and not started.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Notes |
|---|---|---|---|---|---|---|---|
| 01 | Research and Design | phase-01-design-ready | AITtor specialist lead / AIT0405 coordinator and fallback author | COMPLETE | Project Owner direction accepted | PR #29–#31, #33 and #35 merged | Fallback deliverables attributed to AIT0405. |
| 02 | Architecture | phase-02-architecture-ait0405; phase-02-finalization-ait0405 | AIT0405 lead; AIT1404 and AITtor bounded support assignments | COMPLETE | Phase 01 complete; PC and mobile target approved | PR #39, #40, #41 and #42 merged | Specialist support issues #37/#38 superseded by clearly attributed AIT0405 fallback reviews. |
| 03 | Prototype | phase-03-prototype | UNASSIGNED | NOT_STARTED | Phase 02 accepted; separate Project Owner authorization required | N/A | |
| 04 | Combat | phase-04-combat | UNASSIGNED | NOT_STARTED | Prototype and combat architecture | N/A | |
| 05 | Creatures / Enemies | phase-05-creatures | UNASSIGNED | NOT_STARTED | Combat foundation | N/A | |
| 06 | World Base | phase-06-world-base | UNASSIGNED | NOT_STARTED | Character, camera and world architecture | N/A | |
| 07 | Integration | phase-07-integration | UNASSIGNED | NOT_STARTED | Required systems | N/A | |

## Approved game direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera; no top-down view.
- Tactical turn-based combat.
- Solo mode and tactical group play.
- Weapons and skills as core build components.
- Separate supplementary server project for online group play.
- Target platforms: desktop PC and mobile.

## Phase 01 workstreams

| Workstream | Owner | Final result | Deliverable |
|---|---|---|---|
| 1.1 Reference-game research | AIT1404 assigned; AIT0405 fallback author | Accepted; fallback authorship recorded accurately | docs/phase-01/research/reference-game-analysis.md |
| 1.2 Concept and direction | AITtor assigned; AIT0405 fallback author | Accepted and aligned with Project Owner direction | docs/phase-01/game-concept.md |
| 1.3 Gameplay loop and systems | AITtor assigned; AIT0405 fallback author | Accepted; tactical systems and solo/group boundaries documented | docs/phase-01/gameplay-loop-and-systems.md |
| 1.4 GDD and MVP | AITtor assigned; AIT0405 fallback author | Accepted; MVP and Phase 02 decision gates documented | docs/phase-01/game-design-document.md; docs/phase-01/mvp-scope.md |
| Coordination and acceptance | AIT0405 | Complete | Audit, status, readiness and handoff |

## Phase 02 workstreams

| Workstream | Owner / authorship | Scope | Tracking |
|---|---|---|---|
| 2.1 Architecture baseline and state ownership | AIT0405 | Logical layers, scene boundaries, camera/combat separation, server boundary | docs/phase-02/architecture-overview.md |
| 2.2 Gameplay system contracts | AIT0405 | Combat lifecycle, turn scheduler, action pipeline, mission state | docs/phase-02/gameplay-system-contracts.md |
| 2.3 Godot technical feasibility | AIT1404 assigned; AIT0405 fallback author | Engine/version/platform/render/input/network feasibility | Issue #37; fallback review in docs/phase-02/research |
| 2.4 Tactical gameplay architecture review | AITtor assigned; AIT0405 fallback author | Turn/action alternatives, mission and enemy resolution | Issue #38; fallback review in docs/phase-02/research |
| 2.5 Integration and acceptance | AIT0405 | Reconcile findings, decisions, test plan, PR and handoff | PR #42 |

## Working rules

- Specialist branch access does not prove that specialist work has been completed.
- AIT0405 must not claim authorship of AIT1404 or AITtor deliverables.
- Each support AI works only on its own branch and assigned files.
- Phase 02 is architecture documentation and decision work only. No Godot scripts, scenes, assets, project settings, executable prototype or server implementation may be changed.
- The supplementary server project remains a separate future workstream.
- Phase 03–07 must not start without separate Project Owner authorization.
- Project Owner retains authority over core product decisions and PR merge approval unless merge authority is explicitly delegated.
