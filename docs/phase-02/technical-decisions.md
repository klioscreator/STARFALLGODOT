# STARFALLGODOT — Technical Decision Register

**Status:** OPEN; proposals are not approvals  
**Owner:** AIT0405  
**Last updated:** 2026-11-10

A recommendation does not become an approved decision until the Project Owner confirms it and this register is updated.

| ID | Decision | State | Consequence / next action |
|---|---|---|---|
| ADR-001 | 3D sci-fi survival-action; humanoid; switchable first-/third-person; tactical turn-based; solo/group | APPROVED in Phase 01 | Preserve |
| ADR-002 | Engine family | Godot direction; exact version OPEN | Verify compatibility and select before implementation |
| ADR-003 | Target platform | OPEN | Determines renderer, input/UI and performance |
| ADR-004 | Minimum hardware/performance | OPEN | Define measurable target |
| ADR-005 | Input devices | OPEN | Use abstraction; final bindings depend on platform |
| ADR-006 | Camera rig | PROPOSED | Dedicated dual-camera rig; test obstruction and parity |
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

## Provisional architecture recommendations

- Separate domain combat rules from Godot scene/presentation code.
- Use data resources for weapon, skill, enemy, status and mission definitions.
- Separate immutable definitions from mutable runtime state.
- Use one turn scheduler and one action validator/resolver.
- Keep the solo MVP local and offline-capable.
- Make camera switching independent of turn/action state.
- Keep a narrow future server adapter boundary; do not implement the server in Phase 02.
- Validate architecture with one small encounter before expanding content.

## First Project Owner decision needed

Select target platform: desktop PC, mobile, or both. This affects renderer choice, input/UI architecture and minimum performance targets.

Other gameplay decisions can be submitted as proposals with trade-offs and validated through small scenarios. Numerical balance must not be frozen before the core encounter has been tested.
