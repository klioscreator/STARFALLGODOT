# STARFALLGODOT — Gameplay System Contracts

**Status:** Draft for Phase 02 review  
**Owner:** AIT0405  
**Scope:** Behavioural contracts; not executable code

## 1. Core runtime entities

**Combatant** represents an actor in an encounter. Required state categories: stable actor/definition IDs, team, role, health, defensive/status state, position/facing, turn resources, equipped weapon/loadout, active skills and alive/defeated/disabled state. Mutable runtime state is separate from immutable content definitions.

**Action Definition** describes action ID/category, actor/target requirements, range/targeting, action/resource cost, preconditions, effects, cooldown/charge rules and UI/AI metadata.

**Action Request** contains requesting actor ID, action ID, target or destination, optional parameters and encounter/turn sequence identifier to reject stale requests.

**Action Result** contains accepted/rejected state and reason, costs consumed, state changes, emitted domain events and whether the actor may continue.

## 2. Combat lifecycle

Proposed state machine:
1. INACTIVE — no encounter.
2. INITIALIZING — participants and initial state registered.
3. TURN_ORDER — initiative/order calculated.
4. ACTOR_TURN — one eligible combatant owns the active turn.
5. ROUND_END — end-of-round effects and defeat checks resolve.
6. ENCOUNTER_RESOLUTION — victory, defeat, retreat or other terminal conditions checked.
7. COMPLETE — encounter result returned to mission layer.

Encounter lifecycle is separate from mission lifecycle. Completing an encounter does not automatically complete a mission.

## 3. Turn scheduler contract

The scheduler is the only authority for round number, actor queue, current actor, turn phase, start/end transitions and skipping ineligible actors. It does not calculate damage or weapon effects.

Initiative formula, tie-break, individual-vs-team sequencing and unused-action carryover remain OPEN. Implementation must not hard-code an unapproved formula.

## 4. Action economy contract

The architecture supports movement, weapon attack, skill activation, item use, defence/reaction and mission interaction. Exact costs remain OPEN.

Validation checks:
- Actor owns the current turn and is eligible.
- Action exists and is available.
- Action/resource costs can be paid.
- Target/destination is valid.
- Range, line of sight, movement and terrain constraints pass.
- Encounter state permits the action.

Resolution is atomic: a valid action applies defined costs/effects; an invalid action is rejected without partial mutation.

## 5. Spatial queries

A consistent coordinate/distance model is required. Tactical movement must resolve against an explicit movement allowance or cost, even if the 3D presentation uses continuous movement.

Spatial services answer reachability, path blocking, effective range, line of sight, cover modifiers and area-effect inclusion. Grid-based, node-based or free movement remains an OPEN design decision; choose only after encounter scale and camera readability are tested.

## 6. Weapon, skill and enemy resolution

Weapon/skill definitions specify targeting, range, cost, effect and constraints. The resolver applies effects and emits results; presentation translates events into animation/VFX/audio/UI.

Enemy AI receives a read-only tactical snapshot and returns an action proposal. The proposal passes through the normal validator and resolver. Enemy-specific exceptions must be explicit data/rules, not hidden AI bypasses.

## 7. Mission lifecycle

Proposed mission states: NOT_STARTED, BRIEFING, ACTIVE, OBJECTIVE_UPDATED, EXTRACTION_AVAILABLE, SUCCESS, FAILURE and RESULTS.

Mission objectives are evaluated by the mission layer, not the turn scheduler. Objective, extraction, optional-objective and duration rules require Project Owner approval.

## 8. Solo and group compatibility

Solo mode is the MVP baseline and must not require a server. The same command/action contracts should be usable by a local controller and a future server-authoritative group session.

Group size, party roles, player disconnects, shared resources and sequential/simultaneous group turns remain OPEN. Do not implement group networking in the solo MVP.

## 9. Suggested domain events

EncounterStarted, TurnStarted, ActionAccepted, ActionRejected, MovementResolved, DamageApplied, StatusApplied, CombatantDefeated, TurnEnded, RoundEnded, EncounterWon, EncounterLost, MissionObjectiveChanged, MissionSucceeded, MissionFailed and RewardGranted.

Events describe completed changes; they do not replace authoritative state.

## 10. Invariants

- Only the scheduler changes turn ownership.
- Only validated actions mutate combat state.
- Player and enemy actions use the same resolver.
- Defeated actors cannot act unless an explicit rule permits it.
- Rejected actions do not consume resources by default.
- Mission progression is not inferred solely from encounter completion.
- Camera switching cannot mutate combat/mission state.
- Solo mission start, completion, failure and restart work offline.
- Persistent rewards are written only after mission result confirmation.

## 11. Rules awaiting approval

Initiative and tie-break; individual/team turn order; action-point budget and movement costs; reaction/defence rules; tactical spatial representation; range/cover/line-of-sight calculations; enemy intent visibility; mission objective/extraction/retreat; solo companions; group size/turn coordination; ammunition, skill energy, healing and consumables; mid-mission save support.
