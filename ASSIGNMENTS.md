# STARFALLGODOT — Phase assignments

The Project Owner has authorised Phase 02 to begin. AIT0405 is the Phase 02 lead and coordinator. AIT1404 and AITtor have bounded, isolated support tasks. Phase 03–07 remain unassigned and not started.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Notes |
|---|---|---|---|---|---|---|---|
| 01 | Research and Design | phase-01-design-ready | AITtor (specialist lead) / AIT0405 (coordinator and fallback author) | COMPLETE | Project Owner direction accepted; package reviewed and merged | PR #29–#31, #33 and #35 merged | Fallback deliverables attributed to AIT0405, not specialist accounts. |
| 02 | Architecture | phase-02-architecture-ait0405 | AIT0405 (lead); AIT1404 and AITtor (bounded support) | IN_PROGRESS | Phase 01 complete; Project Owner authorised Phase 02; target platform decision required before platform-specific architecture freeze | Draft PR pending | AIT1404: Issue #37 / branch phase-02-support-ait1404-engine-feasibility. AITtor: Issue #38 / branch phase-02-support-aittor-gameplay-architecture. No implementation in this phase. |
| 03 | Prototype | phase-03-prototype | UNASSIGNED | NOT_STARTED | Phase 02 architecture approval | N/A | |
| 04 | Combat | phase-04-combat | UNASSIGNED | NOT_STARTED | Prototype and combat architecture | N/A | |
| 05 | Creatures / Enemies | phase-05-creatures | UNASSIGNED | NOT_STARTED | Combat foundation | N/A | |
| 06 | World Base | phase-06-world-base | UNASSIGNED | NOT_STARTED | Character, camera and world architecture | N/A | |
| 07 | Integration | phase-07-integration | UNASSIGNED | NOT_STARTED | All required systems | N/A | |

## Approved game direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera; no top-down view.
- Tactical turn-based combat.
- Solo mode and tactical group play.
- Weapons and skills as core build components.
- Separate supplementary server project for online group play.

## Phase 01 workstreams

| Workstream | Owner | Final result | Deliverable |
|---|---|---|---|
| 1.1 Reference-game research | AIT1404 assigned; AIT0405 fallback author | Accepted; fallback authorship recorded accurately | docs/phase-01/research/reference-game-analysis.md |
| 1.2 Concept and direction | AITtor assigned; AIT0405 fallback author | Accepted and aligned with Project Owner direction | docs/phase-01/game-concept.md |
| 1.3 Gameplay loop and systems | AITtor assigned; AIT0405 fallback author | Accepted; turn-based tactical systems and solo/group boundaries documented | docs/phase-01/gameplay-loop-and-systems.md |
| 1.4 GDD and MVP | AITtor assigned; AIT0405 fallback author | Accepted; MVP and Phase 02 decision gates documented | docs/phase-01/game-design-document.md; docs/phase-01/mvp-scope.md |
| Coordination and acceptance | AIT0405 | Complete | Audit, status, readiness and handoff |

## Phase 02 workstreams

| Workstream | Owner | Scope | Tracking |
|---|---|---|---|
| 2.1 Architecture baseline and state ownership | AIT0405 | Logical layers, scene boundaries, camera/combat separation, server boundary | phase-02-architecture-ait0405 |
| 2.2 Gameplay system contracts | AIT0405 | Combat lifecycle, turn scheduler, action pipeline, mission state | phase-02-architecture-ait0405 |
| 2.3 Godot technical feasibility | AIT1404 | Engine/version/platform/render/input/network feasibility; research only | Issue #37 |
| 2.4 Tactical gameplay architecture review | AITtor | Turn/action model proposals, mission and enemy resolution; research only | Issue #38 |
| 2.5 Integration and acceptance | AIT0405 | Reconcile findings, update decisions, test plan, PR and handoff | phase-02-architecture-ait0405 |

## Working rules

- Specialist branch access does not prove that specialist work has been completed.
- AIT0405 must not claim authorship of AIT1404 or AITtor deliverables.
- Each support AI works only on its own branch and assigned files.
- Phase 02 is architecture documentation and decision work only. No Godot scripts, scenes, assets, project settings, executable prototype or server implementation may be changed.
- The supplementary server project remains a separate future workstream.
- Phase 03–07 must not start without separate Project Owner authorisation.
- Project Owner retains authority over core product decisions and PR merge approval unless merge authority is explicitly delegated.
