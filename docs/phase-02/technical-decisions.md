# STARFALLGODOT — Technical Decision Register

**Status:** OPEN; proposals are not approvals  
**Owner:** AIT0405  
**Last updated:** 2026-11-10

A recommendation does not become an approved decision until the Project Owner confirms it and this register is updated.

| ID | Decision | State | Consequence / next action |
|---|---|---|---|
| ADR-001 | 3D sci-fi survival-action; humanoid; switchable first-/third-person; tactical turn-based; solo/group | APPROVED in Phase 01 | Preserve |
| ADR-002 | Engine family | Godot direction; exact version OPEN | Verify compatibility and select before implementation |
| ADR-003 | Target platform | APPROVED: desktop PC and mobile | Common gameplay/domain layer; platform-specific input, UI, rendering/performance profiles and packaging |
| ADR-004 | Minimum hardware/performance | OPEN | Define separate measurable minimum and target profiles for PC and mobile |
| ADR-005 | Input devices | OPEN | Keyboard/mouse and touch are required input candidates for the approved target. Controller support and final bindings remain OPEN |
| ADR-006 | Camera rig | PROPOSED | Dedicated dual-camera rig; test obstruction and tactical-information parity |
| ADR-007 | Turn ownership | PROPOSED | Central scheduler owns actor queue and transitions |
| ADR-008 | Initiative/tie-break | OPEN | Compare individual initiative, team phases and alternating activation |
| ADR-009 | Action economy | OPEN | Compare action-point and major/minor or primary-action models; no numerical budget approved |
| ADR-010 | Tactical movement representation | OPEN | Compare grid, node-based, continuous-budget and hybrid movement |
| ADR-011 | Group size/turn coordination | OPEN | Keep group session separate from solo session |
| ADR-012 | Solo companions | OPEN | Do not assume companions in MVP |
| ADR-013 | Mission/extraction/failure | OPEN | Separate mission and encounter state machines |
| ADR-014 | Inventory/resources/progression | OPEN | Separate persistent data and temporary mission state |
| ADR-015 | Mid-mission save | OPEN | Settings/rewards persist; active mission save undecided |
| ADR-016 | Server hosting/authority | OPEN | Separate server project; define authority/reconnect later |
| ADR-017 | Art direction/rating/accessibility | OPEN | Resolve before production asset/UI constraints |

## Platform implications

The approved target is desktop PC and mobile. This is a product constraint, not a commitment to simultaneous release, a specific store, cross-play or cloud save.

- Keep gameplay rules and simulation independent of platform-specific input and presentation.
- Provide input abstraction for keyboard/mouse and touch. Controller support remains undecided.
- Design UI layouts for desktop and mobile aspect ratios, screen sizes, safe areas and interaction precision.
- Define scalable rendering and quality profiles; select renderer only after representative device testing.
- Validate camera control, tactical target selection and turn-based interaction on both input classes.
- Establish separate minimum hardware profiles and measured performance targets for PC and mobile.
- Cross-platform save synchronisation and cross-play remain OPEN.

## Feasibility review findings

The AIT0405 fallback technical review records official Godot documentation evidence:
- Godot 4 provides Forward+, Mobile and Compatibility renderers with different feature/hardware trade-offs.
- Mobile is intended for mobile and desktop; Compatibility is relevant when broader older-device support is required.
- Published system requirements are baselines for simple projects, not a performance guarantee for this game.
- InputMap and InputEvent support multiple device event types, including keyboard, mouse, gamepad and touch.
- Godot provides high-level multiplayer RPC/authority primitives, but these do not replace application-level validation or a secure server design.
- Godot documents separate configuration and save-game approaches; save schema/versioning remains a project responsibility.

Detailed analysis and references: docs/phase-02/research/godot-technical-feasibility.md.

## Gameplay architecture review findings

The AIT0405 fallback gameplay review recommends:
- One Turn Scheduler owns actor order, round index and turn transitions.
- Player and enemy actions share the same validator and resolver.
- Enemy AI proposes actions from a read-only tactical snapshot; it does not mutate combat state.
- Mission and encounter lifecycles remain separate.
- Compare action-economy and spatial-movement alternatives in a controlled encounter before selecting numerical rules.
- Keep solo mode offline and avoid assuming companion AI or a group size.

Detailed analysis: docs/phase-02/research/aittor-gameplay-architecture-review.md.

## Provisional architecture recommendations

- Separate domain combat rules from Godot scene/presentation code.
- Use data resources for weapon, skill, enemy, status and mission definitions.
- Separate immutable definitions from mutable runtime state.
- Use one turn scheduler and one action validator/resolver.
- Keep the solo MVP local and offline-capable.
- Make camera switching independent of turn/action state.
- Keep a narrow future server adapter boundary; do not implement the server in Phase 02.
- Validate architecture with one small encounter before expanding content.

## Remaining Project Owner decisions

Minimum hardware/performance targets; final Godot version and renderer after feasibility tests; controller support; initiative and tie-break; action economy and numerical costs; tactical movement representation; cover/line-of-sight rules; group size/turn coordination; mission/extraction/failure rules; active-mission save scope; server hosting/authority; cross-play and cloud-save decisions.
