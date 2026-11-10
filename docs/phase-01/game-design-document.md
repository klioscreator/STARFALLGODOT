# STARFALLGODOT — Game Design Document

**Document status:** Project Owner direction accepted; system details remain to be finalised  
**Version:** 0.2  
**Phase:** 01 — Research and Design  
**Updated:** 2026-11-10

## 1. Product summary

STARFALLGODOT is a 3D science-fiction survival-action game with a humanoid player character, switchable first-person and third-person camera perspectives, tactical turn-based combat, solo play and tactical group play. Players survive hostile encounters and develop builds through weapons, skills and upgrades.

The Project Owner has approved this high-level direction. The detailed turn system, platform, group size and server deployment model remain open design decisions.

## 2. Product goals

- Deliver tactical combat in a readable 3D environment.
- Support first-person and third-person camera perspectives.
- Make turn order, action costs, enemy intent and positioning understandable.
- Make weapon and skill builds affect tactical choices.
- Provide a complete solo experience.
- Establish a design foundation for tactical group play.
- Keep online server hosting in a separately scoped supplementary project.

## 3. Product boundaries

### Included in the intended product
- Humanoid player character.
- 3D environment and first-/third-person camera switching.
- Tactical turn-based encounters.
- Weapons, skills, upgrades and build development.
- Solo mission mode.
- Tactical group mode.
- Mission rewards and persistent progression, subject to final economy design.

### Not assumed for the first MVP
- Public matchmaking or a dedicated large-scale server fleet.
- PvP, clans, ranked ladders or global leaderboards.
- Persistent shared world.
- Large live-service content cadence.
- Monetisation, paid currency, loot boxes or gacha.
- Large campaign, hundreds of weapons or extensive crafting economy.

## 4. Target player and platform

**OPEN — target platform:** not yet specified.  
**OPEN — minimum hardware/performance target:** not yet specified.  
**OPEN — input devices:** to be selected after platform decision.  
**OPEN — rating/accessibility requirements:** to be specified.

The game must be designed around a humanoid character and two camera perspectives. Input and UI decisions must be validated against the chosen platform.

## 5. Genre, camera and presentation

- **Genre:** science-fiction survival action with tactical turn-based combat.
- **Presentation:** 3D.
- **Player:** humanoid combatant.
- **Camera:** first-person and third-person, switchable.
- **Combat:** turn-based; not continuous real-time shooting and not top-down.

Camera switching must not alter tactical rules or action costs. Both perspectives must provide sufficient information for range, line of sight, cover, enemy position and interaction.

## 6. Core gameplay loop

Preparation → Mission Entry → Exploration/Approach → Tactical Encounter → Player/Group Turn → Enemy Turn → Round Resolution → Objective Progress → Further Encounter → Mission Success/Failure → Rewards → Build Development → Next Mission.

The precise encounter trigger, round structure and mission objective are open.

## 7. Player character

The player controls a humanoid character. Candidate character state includes:
- Health and defensive status.
- Movement and positioning state.
- Equipped weapon(s).
- Active skills and passive build effects.
- Ammunition, energy or other defined resources.
- Inventory and consumables.
- Current mission effects and persistent unlocks.

No numerical stats or equipment slot count are fixed.

## 8. Tactical combat

Combat proceeds through turns. Before implementation, the design must define:
- Initiative and turn ownership.
- Player/team and enemy phases.
- Action economy and movement allowance.
- Weapon use, skill use, item use and defence costs.
- Range, line of sight, cover and area effects.
- Status effects and end-of-round resolution.
- Enemy intent visibility and reaction rules.
- Victory, defeat and retreat conditions.

The same core rules should apply in solo and group modes. Any mode-specific adjustment must be documented.

## 9. Weapons, skills and builds

Weapons and skills are the principal build components. Candidate weapon roles include precision, burst, suppression, area control and armour penetration. Candidate skill roles include protection, healing/support, repositioning, scanning, crowd control and damage.

These are role categories, not a final item list. Each option must communicate tactical function, range, action cost, resource cost and trade-offs.

Build progression should distinguish temporary mission upgrades from persistent unlocks. Exact inventory, equipment slots, rarity, crafting and currency systems remain open.

## 10. Enemies and bosses

Enemy roles should require different tactical responses:
- Assault: pressure and advance.
- Ranged: threaten from distance and use line of sight.
- Flanker: reposition or bypass cover.
- Heavy: durable space control.
- Controller/support: alter status, hazards or ally effectiveness.
- Elite: add a distinctive rule to a base role.
- Boss: multi-stage tactical encounter with readable patterns and counterplay.

Enemy names, visual designs, stats and final roster remain open.

## 11. Mission and survival design

Survival pressure may be expressed through health attrition, ammunition, skill energy, consumables, environmental hazards and enemy escalation. Each resource must have a distinct tactical purpose.

Mission structure may combine exploration, objectives, tactical encounters, optional interactions and extraction. The exact structure and mission length require design validation.

## 12. Solo and tactical group modes

### Solo
Solo mode is a required complete mode. The core mission loop should not require a live server. Whether AI companions are included is open.

### Group
Tactical group play is part of the intended product. Group design must support role coordination, target prioritisation, resource sharing rules and turn ownership. Group size and whether players act sequentially or simultaneously remain open.

### Supplementary server project
A separate project will handle the server-side expansion required for online group sessions. It must define session management, authoritative turn/action validation, state synchronisation, reconnect handling, player identity and persistence boundaries. This project is not silently included in the core MVP.

## 13. UI and accessibility

Required combat information:
- Current turn and acting unit.
- Available actions and action costs.
- Weapon/skill range and resource cost.
- Enemy intent or threat cues where exposed by the rules.
- Health, status effects and survival resources.
- Tactical positioning, cover and line of sight.
- Clear camera switching.
- Group member status and coordination cues.

Options for camera sensitivity, subtitles, audio, screen effects and readable UI should be considered once the target platform is selected.

## 14. Audio and visual feedback

Combat feedback should distinguish weapon fire, hit confirmation, damage, skill activation, enemy intent, turn transitions and mission results. Visual effects must not obscure tactical geometry or enemy telegraphs. Final art direction and audio style remain open.

## 15. Technical and production constraints

- Engine: Godot, as indicated by the repository.
- Phase 01 remains research/design only.
- Phase 02 must define 3D scene architecture, character controller, dual-camera rig, combatant state, turn resolver, data-driven weapons/skills, save model and test strategy.
- Online group functionality must have an explicit boundary with the supplementary server project.
- The solo mode must be testable independently of server deployment.
- No implementation is authorised by this GDD.

## 16. MVP direction

The MVP should validate the core 3D character/camera experience and a complete tactical turn-based solo encounter. It should include enough weapons and skills to demonstrate meaningful build choices, without attempting the full group server stack.

A limited group-play technical slice may follow after the core turn rules and client/server boundary are defined. The exact inclusion gate must be approved before implementation.

## 17. Design acceptance criteria

The design package is ready for architecture when:
- The 3D humanoid and switchable first-/third-person direction is documented.
- Turn lifecycle and action economy are specified.
- Solo mission loop and failure/success conditions are defined.
- Weapon/skill data and build progression are specified at system level.
- Group mode rules and server responsibilities are separated.
- Target platform and input model are decided.
- MVP scope and exclusions are approved.
- Open assumptions and dependencies are recorded.

## 18. Open decision register

| ID | Decision | State |
|---|---|---|
| D-01 | Science-fiction survival-action direction | APPROVED |
| D-02 | Tactical turn-based combat | APPROVED |
| D-03 | 3D humanoid player | APPROVED |
| D-04 | Switchable first-/third-person camera | APPROVED |
| D-05 | Solo mode | APPROVED |
| D-06 | Tactical group mode | APPROVED |
| D-07 | Separate supplementary server project | APPROVED |
| D-08 | Weapons/skills as build foundations | APPROVED |
| D-09 | Target platform and performance target | OPEN |
| D-10 | Initiative, turn order and action economy | OPEN |
| D-11 | Group size and group turn model | OPEN |
| D-12 | Mission objectives and duration | OPEN |
| D-13 | Inventory, resource and persistent progression rules | OPEN |
| D-14 | Server hosting, security and reconnect policy | OPEN |
| D-15 | Art direction and content rating | OPEN |

## 19. Change control

Any change to the approved genre, combat model, camera, player representation or solo/group direction must be recorded as a Project Owner decision and reflected in this GDD, gameplay systems document and MVP scope before Phase 02 architecture is approved.