# STARFALLGODOT — Phase assignments

The Project Owner explicitly accepted Phase 03 and authorized Phase 04 on 2026-11-11. AIT0405 is the Phase 04 lead and coordinator. ART-01 remains an independent workstream assigned to AIT1404 but is deferred by the Project Owner until Phase 04 is complete.

| Phase | Name | Branch | Assigned AI | Status | Dependencies | Pull Request | Notes |
|---|---|---|---|---|---|---|---|
| 01 | Research and Design | phase-01-design-ready | AITtor specialist lead / AIT0405 coordinator and fallback author | COMPLETE | Project Owner direction accepted | PR #29–#31, #33 and #35 merged | Fallback deliverables attributed to AIT0405. |
| 02 | Architecture | phase-02-architecture-ait0405; phase-02-finalization-ait0405 | AIT0405 lead; AIT1404 and AITtor bounded support assignments | COMPLETE | Phase 01 complete; PC and mobile target approved | PR #39, #40, #41 and #42 merged | Specialist support issues #37/#38 superseded by clearly attributed AIT0405 fallback reviews. |
| 03 | Prototype | phase-03-prototype-ait0405; phase-03-closeout-ait0405; phase-03-merge-record-ait0405 | AIT0405 (lead) | COMPLETE | Phase 02 complete; Project Owner authorized Phase 03 on 2026-11-10 | Issue #46 closed; PR #45, #47, #48, #49, #50 and #51 merged | Project Owner explicitly accepted Phase 03 on 2026-11-11. This does not assert physical-device validation. |
| 04 | Combat | phase-04-combat-ait0405 | AIT0405 (lead) | IN_PROGRESS | Phase 03 accepted; combat architecture and prototype baseline | Issue #54; PR #55 | Tactical combat foundation for the offline solo prototype; numerical tuning remains provisional. |
| 05 | Creatures / Enemies | phase-05-creatures | UNASSIGNED | NOT_STARTED | Combat foundation | N/A | Requires separate Project Owner authorization. |
| 06 | World Base | phase-06-world-base | UNASSIGNED | NOT_STARTED | Character, camera and world architecture | N/A | Requires separate Project Owner authorization. |
| 07 | Integration | phase-07-integration | UNASSIGNED | NOT_STARTED | Required systems | N/A | Requires separate Project Owner authorization. |

## Approved game direction

- 3D science-fiction survival-action.
- Humanoid player character.
- Switchable first-person and third-person camera; no top-down view.
- Tactical turn-based combat.
- Solo mode and tactical group play.
- Weapons and skills as core build components.
- Separate supplementary server project for online group play.
- Target platforms: desktop PC and mobile.

## ART-01 — Independent visual-design workstream

| Work package | Owner | Scope | Tracking | Status |
|---|---|---|---|---|
| ART-01A Visual direction | AIT1404 (lead); AIT0405 coordinator | Art-direction proposals, moodboards, palette, material/lighting language and silhouette rules | Issue #52 | DEFERRED until Phase 04 completion |
| ART-01B Character concept | AIT1404 | Player-character front/side/back concept, proportions, material zones and equipment variant | Issue #52 | DEFERRED |
| ART-01C Enemy concept | AIT1404 | Representative enemy concept, scale comparison and threat silhouette | Issue #52 | DEFERRED |
| ART-01D Weapon/equipment concept | AIT1404 | Primary weapon and secondary equipment concepts | Issue #52 | DEFERRED |
| ART-01E UI concept | AIT1404 | HUD concept for player status, tactical turn/action information, target information and mobile-safe layout | Issue #52 | DEFERRED |
| ART-01F Asset pipeline | AIT1404; AIT0405 reviews | Source/export conventions, asset manifest, provenance/licensing and provisional technical budgets | Issue #52 | DEFERRED |

ART-01 is an independent discipline workstream; it is not Phase 08 and does not renumber Phases 01–07. Although Issue #52 and its coordination baseline already exist, the Project Owner directed that graphic design work begin only after Phase 04 is complete. AIT1404 must not start the deferred packages before that gate. The Project Owner retains final selection of the art direction.

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

## Phase 03 workstreams

| Workstream | Owner | Scope | Tracking |
|---|---|---|---|
| 3.1 Godot project and procedural arena | AIT0405 | Project config, scene, test environment | Issue #46; PR #45 |
| 3.2 Humanoid movement and dual camera | AIT0405 | PC movement, camera rig, first-/third-person switch | Issue #46; PR #47 |
| 3.3 Offline tactical encounter | AIT0405 | Combatant state, turn scheduler, player/enemy action loop | Issue #46; PR #47 |
| 3.4 PC/touch input and test harness | AIT0405 | On-screen controls, domain/integration tests, CI validation | Issue #46; PR #47, #48 and #50 |
| 3.5 Review and handoff | AIT0405 | Scope audit, test evidence, status and PR | Issue #46; PR #49 and #51 |

## Phase 04 workstreams

| Workstream | Owner | Scope | Tracking |
|---|---|---|---|
| 4.1 Combat domain contracts | AIT0405 | Action definitions, action request/result, actor/target validation | Issue #54 |
| 4.2 Turn and encounter lifecycle | AIT0405 | Deterministic turn transitions, defeated actor skipping, terminal states | Issue #54 |
| 4.3 Shared action pipeline | AIT0405 | Atomic validation and resolution for player and enemy actions | Issue #54 |
| 4.4 Tactical constraints and enemy policy | AIT0405 | Range, line of sight, movement checks, read-only enemy proposals | Issue #54 |
| 4.5 Integration, tests and closeout | AIT0405 | Godot integration, automated tests, CI, status and handoff | Issue #54 |

## Working rules

- Specialist branch access does not prove that specialist work has been completed.
- AIT0405 must not claim authorship of AIT1404 or AITtor deliverables.
- Each AI works only on its own branch and assigned files.
- Phase 02 was architecture documentation and decision work only; it did not authorize Godot implementation.
- The supplementary server project remains a separate future workstream.
- Phase 03 is explicitly accepted by the Project Owner. No physical-device test result is inferred from that acceptance.
- Phase 04 is authorized and active on its own branch.
- ART-01 is deferred until Phase 04 is complete; no graphic design or art production is to begin during Phase 04.
- Phase 05–07 require separate Project Owner authorization.
- Project Owner retains authority over core product decisions and PR merge approval unless merge authority is explicitly delegated.