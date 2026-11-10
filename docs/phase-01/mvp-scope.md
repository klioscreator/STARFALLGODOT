# STARFALLGODOT — MVP scope

**Document status:** Aligned with Project Owner direction; proposed implementation boundary  
**Version:** 0.2  
**Phase:** 01 — Research and Design  
**Updated:** 2026-11-10

## 1. MVP purpose

The MVP should validate whether a 3D science-fiction survival-action game with a humanoid character, switchable first-/third-person camera and tactical turn-based combat produces a clear, repeatable and meaningful solo mission.

The MVP is not the full game and does not include the complete supplementary server project.

## 2. MVP objective

Deliver one complete solo mission slice that demonstrates:
- 3D humanoid player control.
- First-person and third-person camera switching.
- Exploration or approach to a combat encounter.
- A complete turn-based combat lifecycle.
- A small set of distinct enemies.
- A limited weapon and skill pool.
- Tactical build choices or loadout changes.
- Survival resources and mission success/failure.
- Mission result and basic progression/reward handling.

## 3. In-scope features

### Player and camera
- One humanoid playable character.
- One 3D test environment.
- First-person and third-person camera modes.
- Camera switching without changing combat rules.
- Basic movement and interaction.

### Tactical combat
- One complete solo encounter.
- Defined turn start, action selection, action validation, action resolution, enemy turn and round-end processing.
- A documented action economy.
- Movement, weapon attack, skill and defensive/item action categories.
- Range, line-of-sight and basic cover rules, if required by the chosen encounter.
- Health, damage, status and defeat handling.
- Clear turn ownership and combat feedback.

### Enemies
- Three basic enemy roles with different tactical responses.
- One elite modifier, if schedule permits.
- Boss encounter is optional for the first MVP; it should not delay validation of the turn system.

### Weapons, skills and build
- A small number of weapons with distinct tactical functions.
- A small number of active skills with different action/resource costs.
- At least one meaningful build choice during preparation or mission progression.
- Basic display of equipment, skill effects and costs.
- No large rarity/crafting/currency economy.

### Mission and survival
- One compact mission.
- A clear objective and success/failure condition.
- At least one survival pressure/resource mechanic with a defined purpose.
- A mission result screen.
- Basic reward or unlock record, if persistent progression is included in the first test.

### User interface
- Main menu and solo mission start.
- Camera mode indicator/control.
- Health and defined survival resources.
- Current turn and acting unit.
- Available actions and costs.
- Weapon/skill selection and effect information.
- Mission objective and result.

## 4. Deferred to later work

- Online group sessions and public matchmaking.
- Dedicated server deployment and operational tooling.
- Group turn coordination and reconnect edge cases.
- PvP, clans, ranked play and leaderboards.
- Large mission campaign and multiple environments.
- Large weapon/skill catalogue.
- Deep crafting, rarity and multi-currency economy.
- Monetisation, paid progression, loot boxes or gacha.
- Live events and persistent shared worlds.

Tactical group play remains an approved product feature; its complete online implementation is deferred to a separate supplementary server project and later integration milestone. It is not removed from the product direction.

## 5. Proposed implementation sequence after Phase 01

This sequence is planning guidance only, not permission to begin implementation.

1. **Architecture:** define 3D character/camera structure, combatant data, turn resolver, action economy, weapon/skill data, save boundaries and server integration interface.
2. **Prototype:** validate character movement, camera switching and one turn-based encounter.
3. **Combat:** implement action validation/resolution, damage, status, enemy turns and tactical feedback.
4. **Enemies:** expand enemy roles and add elite/boss behaviours.
5. **Build/progression:** add weapon/skill choices, mission rewards and persistent unlocks.
6. **World/UI:** complete the test environment, mission flow, interaction and UI.
7. **Integration/testing:** verify the solo mission, balance and stability; separately plan the server-backed group slice.

The existing phase table must be reconciled with this sequence before Phase 02 starts.

## 6. MVP acceptance criteria

1. A player can start and complete or fail a solo mission without external server setup.
2. The humanoid character moves and interacts reliably in the test environment.
3. The player can switch between first-person and third-person views.
4. Camera switching does not alter turn state or action costs.
5. Combat has an explicit and testable turn lifecycle.
6. Invalid actions are rejected without corrupting combat state.
7. Movement, weapon use and skill use follow the documented action economy.
8. Enemy turns resolve in a predictable and testable way.
9. Enemy roles require different tactical responses.
10. Weapon and skill choices create visible or measurable build differences.
11. Survival resources have documented sources, uses and reset rules.
12. Victory and defeat both lead to a stable mission result.
13. Restarting a mission resets temporary mission state correctly.
14. The solo mission does not require a live server.
15. Core tactical information remains readable in both camera modes.

Target frame rate, resolution and device thresholds must be specified after platform selection.

## 7. Required tests

- First-/third-person switching and camera collision/occlusion.
- Character movement and interaction.
- Turn start/end and combatant ordering.
- Action-cost validation and invalid-action rejection.
- Movement range, weapon range and line of sight.
- Weapon hit/miss/damage resolution.
- Skill cost, effect and cooldown/charge rules.
- Enemy intent/action resolution.
- Status effects and round-end processing.
- Defeat, victory and mission result.
- Build/loadout selection and effect application.
- Resource consumption and reset behaviour.
- Save/load of persistent rewards, if included.
- Solo mission operation with network disabled.

## 8. Dependencies and open decisions

| Dependency | Decision required | Blocks |
|---|---|---|
| Target platform | PC/mobile/console and minimum hardware | Input, UI, performance |
| Turn order | Sequential, initiative or phased team turns | Combat architecture |
| Action economy | Actions, movement and skill costs | Combat implementation |
| Group rules | Group size and turn coordination | Server project |
| Mission structure | Objective, extraction and duration | Encounter pacing |
| Resources | Ammo, energy, consumables and healing | Survival balance |
| Progression | Run-only or persistent unlocks | Save model |
| Server project | Hosting, authority, identity and reconnect | Online group mode |

## 9. MVP risks

- Undefined turn/action rules can cause extensive rework.
- Two camera perspectives can create visibility and animation requirements.
- A solo-balanced encounter may not scale directly to group play.
- A server added without a clear authority boundary can create duplicated state logic.
- Too many weapons/skills before validating the turn system increases balance cost.
- Undefined mission objectives can make the survival loop directionless.

## 10. Release gate

The MVP scope does not authorise implementation. Phase 02 may begin after the Project Owner accepts the remaining architecture-shaping decisions, the turn model is specified, the target platform is selected and Phase 01 is formally signed off.