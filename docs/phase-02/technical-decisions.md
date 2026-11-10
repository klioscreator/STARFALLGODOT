# STARFALLGODOT — Technical Decision Register

**Status:** OPEN; proposals are not approvals  
**Owner:** AIT0405  
**Last updated:** 2026-11-10

A recommendation does not become an approved decision until the Project Owner confirms it and this register is updated.

| ID | Decision | State | Consequence / next action |
|---|---|---|---|
| ADR-001 | 3D sci-fi survival-action; humanoid; switchable first-/third-person; tactical turn-based; solo/group | APPROVED in Phase 01 | Preserve |
| ADR-002 | Engine family | Godot direction; exact version OPEN | Verify compatibility and select before implementation |
| ADR-003 | Target platform | **APPROVED: desktop PC and mobile** | Architecture and MVP must support both. Define a common gameplay/domain layer with platform-specific input, UI, rendering/performance profiles and packaging. Do not assume identical controls or visual settings. |
| ADR-004 | Minimum hardware/performance | OPEN | Define separate measurable minimum and target profiles for PC and mobile; specify resolution, frame rate, memory and test devices before performance claims |
| ADR-005 | Input devices | OPEN | Support keyboard/mouse and touch as candidate input schemes; final bindings, controller support and interaction design require feasibility review |
| ADR-006 | Camera rig | PROPOSED | Dedicated dual-camera rig; test obstruction and parity on both platform classes |
| ADR-007 | Turn ownership | PROPOSED | Central scheduler owns actor queue and transitions |
| ADR-008 | Initiative/tie-break | OPEN | Select after encounter pacing tests |
| ADR-009 | Action economy | OPEN | Central cost model; numerical budget awaits approval |
| ADR-010 | Tactical movement representation | OPEN | Compare grid, node-based and continuous movement |
| ADR-011 | Group size/turn coordination | OPEN | Keep group session separate from solo session |
| ADR-012 | Solo companions | OPEN | Do not assume companions in MVP |
| ADR-013 | Mission/extraction/failure | OPEN | Separate mission and encounter state machines |
| ADR-014 | Inventory/resources/progression | OPEN | Separate persistent data and temporary mission state |
| ADR-015 | Mid-mission save | OPEN | Settings/rewards persist; active mission save undecided |
| ADR-016 | Server hosting/authority | OPEN | Separate server project; define authority/reconnect later |
| ADR-017 | Art direction/rating/accessibility | OPEN | Resolve before production asset/UI constraints |

## Platform implications

The approved target is both desktop PC and mobile. This is a product constraint, not a commitment to simultaneous release or a specific store/platform.

Architecture requirements:
- Keep gameplay rules and simulation independent of platform-specific input and presentation.
- Provide input abstraction for keyboard/mouse and touch. Controller support remains undecided.
- Design UI layouts for desktop and mobile aspect ratios, screen sizes and interaction precision.
- Define scalable rendering and quality profiles; select renderer only after Godot-version/device feasibility review.
- Validate camera control, tactical target selection and turn-based interaction on both input classes.
- Establish separate minimum hardware profiles and measured performance targets for PC and mobile.
- Keep cross-platform save synchronisation and cross-play as OPEN decisions; supporting both platform classes does not automatically approve either feature.

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

Target platform is now approved as desktop PC and mobile. Remaining decisions include minimum hardware/performance targets, final Godot version after feasibility review, input/controller scope, initiative and action economy, tactical movement representation, group size/turn coordination, mission/extraction/failure rules, save scope, and server hosting/authority.
