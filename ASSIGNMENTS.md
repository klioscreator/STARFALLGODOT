# STARFALLGODOT — Phase assignments

The Project Owner delegated Phase 01 coordination, validation and integration to AIT0405. Phase 01 is now complete; Phase 02–07 remain unassigned and not started.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Notes |
|---|---|---|---|---|---|---|---|
| 01 | Research and Design | `phase-01-design-ready` | AITtor (specialist lead) / AIT0405 (coordinator and fallback author) | COMPLETE | Project Owner direction accepted; package reviewed and merged | PR #29–#31, #33 and #35 merged | Fallback deliverables are attributed to AIT0405, not to the specialist accounts. |
| 02 | Architecture | `phase-02-architecture` | UNASSIGNED | NOT_STARTED | Phase 01 complete; Project Owner authorisation and architecture-shaping decisions required | N/A | |
| 03 | Prototype | `phase-03-prototype` | UNASSIGNED | NOT_STARTED | Phase 02 architecture approval | N/A | |
| 04 | Combat | `phase-04-combat` | UNASSIGNED | NOT_STARTED | Prototype and combat architecture | N/A | |
| 05 | Creatures / Enemies | `phase-05-creatures` | UNASSIGNED | NOT_STARTED | Combat foundation | N/A | |
| 06 | World Base | `phase-06-world-base` | UNASSIGNED | NOT_STARTED | Character, camera and world architecture | N/A | |
| 07 | Integration | `phase-07-integration` | UNASSIGNED | NOT_STARTED | All required systems | N/A | |

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
| 1.1 Reference-game research | AIT1404 assigned; AIT0405 fallback author | Accepted; fallback authorship recorded accurately | `docs/phase-01/research/reference-game-analysis.md` |
| 1.2 Concept and direction | AITtor assigned; AIT0405 fallback author | Accepted and aligned with Project Owner direction | `docs/phase-01/game-concept.md` |
| 1.3 Gameplay loop and systems | AITtor assigned; AIT0405 fallback author | Accepted; turn-based tactical systems and solo/group boundaries documented | `docs/phase-01/gameplay-loop-and-systems.md` |
| 1.4 GDD and MVP | AITtor assigned; AIT0405 fallback author | Accepted; MVP and Phase 02 decision gates documented | `docs/phase-01/game-design-document.md`; `docs/phase-01/mvp-scope.md` |
| Coordination and acceptance | AIT0405 | Complete | Audit, status, readiness and handoff |

## Working rules

- Specialist branch access was verified, but access-check commits are not specialist deliverables.
- AIT0405's fallback work was kept on separate coordination branches; specialist branches were not overwritten.
- No specialist authorship is claimed for coordinator-authored fallback documents.
- Phase 01 was research/design only. No Godot scripts, scenes, assets, project settings or executable prototype were changed.
- The supplementary server project is a separate future workstream; it was not implemented in Phase 01.
- Phase 02–07 must not start without separate Project Owner authorisation.
