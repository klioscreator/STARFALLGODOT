# STARFALLGODOT — Gameplay loop and core systems

**Document status:** Aligned with Project Owner direction; detailed rules remain under design  
**Version:** 0.2  
**Phase:** 01 — Research and Design  
**Updated:** 2026-11-10

## 1. Design basis

The Project Owner has selected a 3D science-fiction survival-action game with a humanoid player character, switchable first-person/third-person camera, tactical turn-based combat, solo play and tactical group play. A separate supplementary server project is planned for online group sessions.

This replaces the earlier top-down, continuous real-time survival-shooter proposal.

## 2. High-level gameplay loop

```text
Main Menu
  -> Select Solo / Group Mode
  -> Select Mission and Prepare Loadout
  -> Enter Science-fiction Environment
  -> Explore / Navigate / Interact
  -> Tactical Encounter Begins
  -> Read Threats and Enemy Intent
  -> Player Turn: Select Movement / Weapon / Skill / Item / Defence
  -> Resolve Player Actions
  -> Enemy Turn: Resolve Enemy Actions
  -> Apply Damage / Status / Environment Effects
  -> Check Survival and Encounter Objectives
  -> Continue Next Round OR Complete / Fail Encounter
  -> Mission Result and Rewards
  -> Improve Weapon / Skill Build
  -> Prepare Next Mission
```

The loop is a structural model. The exact exploration model, encounter trigger and number of combat rounds are not yet fixed.

## 3. Camera and character control

**Approved direction:** 3D humanoid character; first-person and third-person camera perspectives.

Design requirements:
- The player can switch between the two perspectives.
- Camera changes must not change turn order, action costs, weapon statistics or hit resolution.
- Both views must expose the information needed to make a tactical decision.
- First-person view must communicate nearby threats, interaction targets and weapon state.
- Third-person view must communicate player position, nearby geometry and spatial relationships.
- Camera collision, occlusion and field-of-view rules must not reveal information that the game intends to conceal.
- Camera switching during a combat turn must not consume a combat action unless a deliberate rule is approved.

The input scheme and exact camera-switch control depend on the target platform.

## 4. Turn-based combat model

Combat is turn-based. The detailed model remains OPEN, but implementation planning must account for the following components.

### 4.1 Turn lifecycle
A complete encounter requires:
1. Encounter initialisation and combatant ordering.
2. A clear indication that the player may issue actions.
3. Validation of the selected action and its cost.
4. Resolution of movement, attacks, skills, items and defensive actions.
5. Enemy action selection and resolution.
6. Resolution of damage, status effects, hazards and defeat conditions.
7. End-of-round checks and transition to the next round or encounter result.

Whether combatants act one by one, in team/enemy phases or through initiative order must be decided before implementation.

### 4.2 Action economy
Candidate action types:
- Move or reposition.
- Use a weapon.
- Use an active skill.
- Use an item/consumable.
- Defend, guard or take cover.
- Interact with a tactical object.

The design must define action costs, movement limits, action combinations and interruption rules. No action-point values are fixed in this document.

### 4.3 Tactical information
The player should be able to assess, where appropriate:
- Enemy position and visible condition.
- Enemy intent or threat category.
- Weapon range and line-of-sight constraints.
- Skill range, area and resource cost.
- Cover and environmental hazards.
- Current turn owner and remaining actions.

Hidden information is allowed only when it is a deliberate mechanic and the game communicates the uncertainty fairly.

### 4.4 Combat entities
- Player character: health, defensive state, movement, weapon loadout, skills, inventory and build modifiers.
- Enemies: health, tactical role, movement constraints, attack options, intent/telegraph and rewards.
- Environment: cover, obstacles, hazards, interactable objects and line-of-sight blockers.
- Encounter controller: turn order, action validation, combat state and victory/defeat checks.

## 5. Enemy roles

Initial functional roles for evaluation:
- **Assault:** advances and pressures the player's position.
- **Ranged:** attacks from distance and uses line-of-sight.
- **Flanker:** attempts to change angles or bypass defensive positions.
- **Heavy:** durable unit that controls space or absorbs resources.
- **Controller/support:** applies status effects, buffs allies or creates hazards.
- **Elite:** modifies one base role with a distinct tactical rule.
- **Boss:** uses a small set of learnable phases, attacks and counterplay windows.

These are functional roles, not final enemy names, models or numerical stats.

## 6. Weapons, skills and build system

Weapons and skills are the core build components.

A build should be described through:
- Equipped weapon(s) and their tactical role.
- Active skills and their action/resource costs.
- Passive effects or support modules, if included.
- Defensive options and consumables.
- Synergies and trade-offs.

Potential weapon functions include precision, burst, suppression, area control and armour penetration. Potential skill functions include protection, healing/support, repositioning, crowd control, scanning and damage. These are candidate categories, not a locked content list.

Build rules:
1. Every weapon and skill must have a clear tactical purpose.
2. Range, line of sight, action cost, resource cost and effect area must be communicated.
3. Synergies must be documented and testable.
4. Upgrade choices must be valid for the current loadout.
5. Build power must not depend on hidden or unexplained stacking rules.
6. Solo and group balance must be evaluated separately where party composition changes the encounter economy.

## 7. Survival, resources and mission progression

The survival layer governs pressure across an encounter or mission. Candidate pressures include health attrition, limited ammunition, skill energy, consumable supply, environmental hazards and escalating enemy composition.

Each resource must have a defined source, use, reset rule and cap. The project should not add several overlapping resource meters without distinct gameplay functions.

Mission progression may include:
- Preparation and loadout selection.
- Exploration or approach.
- One or more tactical encounters.
- Optional objectives or environmental interactions.
- Mission completion, extraction or defeat.
- Reward and build progression.

Exact mission structure and objective conditions remain open.

## 8. Solo and group play

### Solo mode
- Must be a complete supported mode.
- Must not require an online connection solely to execute the core solo mission.
- Encounter difficulty and action economy must be tuned for one player.
- If AI companions are used, their turn ownership and command model require a separate decision.

### Tactical group mode
- Group play is part of the approved product direction.
- Players must be able to coordinate actions, roles, targets and limited resources.
- The rules must specify whether players act sequentially, simultaneously with a resolution phase, or through another turn-order model.
- Disconnect, reconnect, player defeat and abandoned-turn behaviour must be defined.
- Group size and party roles remain OPEN.

### Supplementary server project
The server is a separate project/workstream. It should provide session and authoritative encounter coordination for online group play. The core game should expose stable game-state and action interfaces without embedding server deployment assumptions into every gameplay system.

## 9. Persistent progression

Separate temporary mission progression from persistent account/save progression.

Potential persistent unlocks:
- New weapon or skill options.
- New starting loadouts.
- Cosmetic character options.
- Access to missions or enemy groups.

Avoid permanent stat inflation until the encounter balance model is validated. Persistent progression should not make group contribution depend solely on accumulated power.

## 10. Game states

| State | Entry | Exit |
|---|---|---|
| Main Menu | Game starts | Mode selected |
| Mode Selection | Player chooses Solo/Group | Mission preparation |
| Preparation | Mission selected | Loadout confirmed |
| Exploration | Mission environment loaded | Encounter trigger or objective |
| Combat Setup | Encounter begins | First combatant turn |
| Player Turn | Player/team action phase | Actions spent or turn ended |
| Enemy Turn | Enemy action phase | Enemy actions resolved |
| Round Resolution | End-of-round processing | Next round or encounter end |
| Mission Success | Objective met | Results |
| Mission Failure | Defeat/failure condition | Results |
| Results | Mission ended | Return to menu/preparation |

The final state machine must distinguish combat rounds from mission progression.

## 11. UI and feedback requirements

- Clear current turn and acting combatant.
- Clear action costs and remaining actions.
- Weapon/skill range and resource indicators.
- Enemy intent or threat information where the design exposes it.
- Distinct player/enemy/neutral targeting cues.
- Health, status effects and survival resources.
- Camera switching feedback without changing tactical state.
- Mission objective and result summary.
- Group member status and coordination cues in group mode.

## 12. Risks and dependencies

| Risk | Consequence | Required mitigation |
|---|---|---|
| Turn rules undefined | Combat implementation becomes inconsistent | Approve turn lifecycle/action economy first |
| Camera perspective hides tactical information | Player cannot make informed choices | Test both camera modes against identical encounters |
| Solo/group action economy differs | One mode becomes trivial or frustrating | Separate balance targets and encounter tests |
| Server owns unclear state | Desynchronisation or exploitable actions | Define authority boundary in supplementary server project |
| Build pool expands too early | Balance and UI complexity rise | Start with a small, role-distinct weapon/skill set |
| Survival resources overlap | UI burden without tactical value | Require a distinct purpose for each resource |

## 13. Open decisions

- Target platform and supported input devices.
- Exact turn order, initiative and round structure.
- Action points/costs and movement model.
- Whether group turns are sequential or simultaneous.
- Group size and party composition.
- Whether AI companions exist in solo mode.
- Ammunition, energy, consumable and healing rules.
- Inventory slots, equipment swapping and build respec.
- Mission objective, extraction and failure rules.
- Server hosting model, authoritative state and reconnect policy.

No implementation is authorised by this document.