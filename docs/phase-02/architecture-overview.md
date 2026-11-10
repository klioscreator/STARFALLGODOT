# STARFALLGODOT — System Architecture

**Status:** Draft for Phase 02 review  
**Owner:** AIT0405 — Phase Lead / Coordinator  
**Baseline:** Accepted Phase 01 GDD and MVP  
**Scope:** Architecture and interface contracts only; no executable implementation

## 1. Architectural objectives

The architecture supports the approved direction: a 3D science-fiction survival-action game, humanoid player, switchable first-/third-person camera, tactical turn-based combat, solo-first MVP, weapon/skill builds, and a future group mode supported by a separate server project.

The MVP must run without a network connection or server deployment. Online services must not become dependencies of the single-player simulation.

## 2. Principles

1. Domain rules are independent of presentation. Combat, action validation, damage, status and mission outcomes do not belong in camera, UI or animation scripts.
2. The local game session owns authoritative state in solo mode. A future server may own authoritative state in online sessions, outside this phase.
3. Weapons, skills, enemies, status effects and missions are data-driven definitions. Mutable runtime state is stored separately.
4. Turn, combat and mission transitions are explicit and testable.
5. UI, animation, audio and camera respond to domain events; they do not independently mutate combat rules.
6. Input, persistence and networking are accessed through narrow adapters.
7. Build only the systems required for one complete solo mission slice.

## 3. Logical layers

### Presentation
Owns menus, preparation/loadout UI, mission HUD, action selection, character visuals, animation, VFX, audio, camera rig and input-to-command mapping.

It must not calculate damage, decide action legality, change turn ownership or directly mutate mission state. Camera switching is presentation-only.

### Gameplay application
Coordinates mission start/end, encounter lifecycle, turn sequencing, player commands, enemy decision requests and build/loadout application.

Suggested responsibilities: Mission Coordinator, Combat Coordinator, Turn Scheduler, Player Command Handler, Enemy Turn Controller and Loadout Service. These are conceptual boundaries, not final class names.

### Domain
Owns combatant state, turn/round state, action definitions and costs, action legality, movement/range/line-of-sight/cover queries, weapon and skill effects, damage, status, defeat, mission objectives and persistent progression rules.

Domain logic must be testable without loading a 3D scene. The exact Godot implementation pattern awaits the technical feasibility review.

### Content/data
Proposed definitions: Weapon, Skill, Enemy, Status Effect, Mission, Encounter and Loadout. Each definition has a stable identifier and gameplay parameters. Runtime state must not be written back into immutable definitions.

### Infrastructure
Owns save/load adapters, input mapping, audio/resource loading, local session lifecycle and a future network-session adapter boundary. The MVP uses local session and local persistence. Login, matchmaking and remote authority are not required for the solo slice.

## 4. Runtime state ownership

| State | Single owner | Consumers |
|---|---|---|
| Active mission state | Mission domain / Mission Coordinator | UI and presentation read |
| Encounter state | Combat domain / Combat Coordinator | Turn scheduler and command handler |
| Current actor and phase | Turn Scheduler | HUD reads; command handler validates |
| Health, status and combat resources | Combatant domain state | UI and animation read |
| Weapon/skill definitions | Content registry | Loadout and action systems read |
| Camera mode | Camera Rig | Input/UI request switching |
| Persistent progression | Progression model and Save Adapter | Mission result submits reward changes |
| Online group session | Future server project | Client adapter only |

No two systems may independently own or mutate the same authoritative state.

## 5. Scene boundaries

Proposed scene boundaries, subject to Godot version and platform selection:
- Main application entry and scene routing.
- Menu and settings.
- Preparation and loadout.
- Mission environment and mission coordinator.
- Player humanoid and camera rig.
- Enemy presentation bound to combatant state.
- HUD and tactical action selection.
- Results and reward summary.

Avoid one global singleton owning all gameplay. Application-wide services may include scene routing, settings and content loading. Combat and mission state should be scoped to the active mission.

## 6. Character and camera boundary

The humanoid character owns movement/interaction intent and visual state. A dedicated camera rig supports first-person and third-person modes.

The rig must expose one switching interface, preserve target/orientation consistently, handle third-person obstruction, and never alter combatant position, turn state or action resources. Both camera modes must expose equivalent tactical information for range, target, cover and interaction.

Camera mode is not a gameplay stat. Sensitivity, bindings and UI layout remain platform-dependent.

## 7. Combat command pipeline

1. Input/UI creates a command request: move, attack, skill, item, defence or interaction.
2. Command handler verifies that the requesting actor owns the turn.
3. Action validator checks actor eligibility, action availability, costs, resources, target, range, line of sight and movement constraints.
4. Resolver applies the action to domain state.
5. Domain events report accepted/rejected action and resulting state changes.
6. Presentation updates animation, VFX, audio and HUD from those events.
7. Turn scheduler decides whether the actor continues or ends the turn.

A rejected action must not partially mutate state or consume resources unless an explicitly approved rule says otherwise.

## 8. Enemy AI boundary

Enemy AI receives a read-only tactical snapshot and proposes an action. The same validator and resolver used for player actions validate and resolve enemy actions. AI policy can be replaced independently from combat resolution.

## 9. Persistence boundary

Separate settings, persistent progression, and temporary mission state. The MVP must support clean mission reset and stable persistence of settings and completed rewards. Whether saving during an active mission is supported remains OPEN.

## 10. Supplementary server boundary

Online group play belongs to a separate future server project. Its contract must define session identity/membership, authoritative turn ownership, action validation, command schema versioning, event ordering, state snapshots, reconnect/timeouts, persistence ownership and security.

Do not implement transport or server deployment in Phase 02. The solo MVP uses local execution. The future server boundary should invoke the same rules or a deliberately shared rules package rather than trusting client-calculated outcomes.

## 11. Proposed implementation layout

The repository currently contains documentation only. The following is a proposed future layout, not existing project files:

- scenes: app, menu, preparation, mission, player, enemies, UI
- scripts/application
- scripts/domain: combat, mission, actors, actions, progression
- scripts/presentation: camera, UI, animation
- scripts/infrastructure: input, persistence, content
- data: weapons, skills, enemies, missions
- assets: characters, environments, audio, UI
- tests: unit and integration

Do not create this structure until implementation is authorised and the technical baseline is selected.

## 12. Acceptance criteria

- Logical layers and state ownership are documented.
- Camera/presentation is separated from combat rules.
- Command validation and action resolution have a defined pipeline.
- Player and enemy actions use the same validation/resolution path.
- Solo mode has no server dependency.
- Definitions are separated from runtime state.
- Persistence and server boundaries are explicit.
- Platform-, engine-version- and balance-dependent decisions remain marked OPEN.
- Critical contracts have a test plan.
