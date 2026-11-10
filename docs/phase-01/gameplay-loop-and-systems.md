# STARFALLGODOT — Gameplay loop and core systems

**Document status:** Coordinator draft / proposal for Project Owner review  
**Phase:** 01 — Research and Design  
**Prepared:** 2026-11-10

## 1. Design basis

This system outline follows the provisional concept in [game-concept.md](game-concept.md): a single-player, top-down science-fiction survival roguelite. The repository does not yet contain an approved game concept. All systems below are therefore **PROPOSALS**, not accepted requirements.

## 2. Core gameplay loop

```text
Main Menu
  -> Loadout / Run Preparation
  -> Enter Combat Zone
  -> Move, Aim, Attack, Evade
  -> Defeat Enemies
  -> Collect Run Experience / Resources
  -> Level-Up Choice
  -> Adapt Build
  -> Escalating Encounter
  -> Elite / Boss Checkpoint
  -> Objective Complete OR Player Defeated
  -> Run Summary and Persistent Reward
  -> Unlock / Upgrade / Return to Menu
```

The loop should preserve a frequent decision point without interrupting combat too often. The exact interval between upgrades and the total run duration require playtesting and are not fixed here.

## 3. Input and player control

**PROPOSAL**
- Movement: continuous directional movement.
- Aim: independent directional aim, with mouse/controller options determined by the target platform.
- Primary attack: player-controlled or assisted firing; final choice remains open.
- Active ability: one clearly signalled action with cooldown or limited charges.
- Evade: short repositioning action with a cost, cooldown or vulnerability window.

**Design requirement:** movement, aiming and firing must not compete for an unintuitive input. If auto-aim is selected, the target priority and target-switch behaviour must be testable and visible.

## 4. Combat system

### 4.1 Combat entities
- Player unit: health, movement, primary attack, defensive/evade action, active ability and upgrade slots.
- Enemies: health, movement pattern, attack pattern, threat range, reward and telegraph.
- Projectiles/effects: owner, direction, speed, lifetime, collision behaviour and damage category.
- Elite/boss: distinct attack phases, readable warning cues and a clear vulnerability window.

### 4.2 Damage and defence
**PROPOSAL.** Use a small set of damage categories at first: direct, area and damage-over-time. Defence can be expressed through health, temporary shield, damage reduction or evasion. Avoid stacking several defensive layers before enemy damage is measurable.

Every damage event should communicate source, target and outcome. Invulnerability windows, knockback, status effects and damage-over-time rules must be specified before implementation.

### 4.3 Enemy roles
Initial archetypes proposed for the first test environment:
- Chaser: closes distance and pressures player movement.
- Ranged attacker: fires a telegraphed projectile or area attack.
- Swarm unit: low individual threat, dangerous in groups.
- Heavy unit: slow, durable, forces sustained damage or repositioning.
- Support/controller: changes the local encounter through buffs, hazards or area denial.
- Elite variant: modifies one existing archetype with a visible modifier.
- Boss: multi-phase encounter using a small number of clearly signalled attack patterns.

These are functional roles, not approved enemy names or art concepts.

## 5. Run progression and build construction

**PROPOSAL**
- Enemies provide run experience or another clearly identified run resource.
- Reaching a threshold pauses or slows combat and presents a small set of upgrade choices.
- Upgrade categories: weapon behaviour, active ability, passive module, defence/mobility and economy/utility.
- Duplicate upgrades may improve an existing effect or unlock a defined synergy.
- Synergies should be deterministic and documented; avoid hidden combinations in the MVP.
- The player should be able to inspect current build effects during a run.

**Choice-quality rules**
1. Each offered choice must be usable by the current build or clearly indicate its prerequisite.
2. The choice pool must not repeatedly offer unavailable or invalid upgrades.
3. The UI must communicate whether a choice is new, an enhancement or a synergy.
4. The player must be able to compare the practical effect of choices without reading a long description.

## 6. Persistent progression

**PROPOSAL.** Keep persistent progression separate from temporary run upgrades.

Potential persistent rewards:
- Unlock a starting weapon or ability.
- Unlock a player archetype after a defined challenge.
- Unlock a new enemy set or arena after completing a milestone.
- Cosmetic rewards that do not alter combat balance.

The initial MVP should avoid a deep currency economy, random paid rewards, breeding, equipment rarity layers and multiple upgrade currencies. Persistent upgrades that increase raw power can undermine run balance; prefer unlocks that add options rather than mandatory stat inflation.

## 7. Encounter and difficulty progression

**PROPOSAL**
- Begin with a low-density introduction that teaches movement, attack and the first enemy telegraph.
- Increase pressure by changing enemy composition and attack overlap, not only by inflating health.
- Introduce a new threat only after the player has had a chance to learn the previous one.
- Use elite encounters to test whether the player's build has a coherent answer to a threat.
- Use boss encounters as a test of movement, threat reading and damage windows.

Exact wave timings, spawn budgets, health/damage curves and boss cadence are intentionally unspecified until a playable test exists.

## 8. Resources and rewards

Keep the resource model small:
- Run resource: earned and spent during a run; resets at run end.
- Persistent unlock progress: earned from completion milestones; saved between runs.

Do not introduce a third currency unless it serves a distinct, explainable purpose. The source, use, reset rule and cap of every resource must be documented in the GDD.

## 9. Game states and transitions

| State | Entry condition | Exit condition |
|---|---|---|
| Main Menu | Game starts or returns from run | Player selects run |
| Preparation | Run selected | Loadout confirmed |
| Active Run | Combat zone loaded | Upgrade, pause, success or defeat |
| Upgrade Choice | Upgrade threshold reached | Choice confirmed |
| Pause | Player pauses | Resume or exit confirmation |
| Victory | Objective condition met | Summary |
| Defeat | Player health reaches defeat condition | Summary |
| Run Summary | Run ends | Return to menu |

Pause and upgrade-choice states must not allow enemies to damage the player unless that is an explicit design decision.

## 10. UI and feedback requirements

- Persistent display of player health and active ability state.
- Clear indication of current objective or survival condition.
- Readable enemy attack telegraphs.
- Upgrade choices with effect descriptions and prerequisite visibility.
- Run summary showing result, duration, rewards and build.
- Options for audio, screen shake and effect intensity.
- Separate visual language for player-owned and enemy-owned projectiles.

## 11. Risks and dependencies

| Risk | Consequence | Mitigation / decision needed |
|---|---|---|
| No approved camera/platform/input | Controls and UI may be designed for the wrong target | Project Owner decision before architecture |
| Too many upgrade combinations | Balance and testing cost rises rapidly | Small explicit upgrade pool for MVP |
| Visual effects obscure threats | Player cannot read combat | Effect budget and telegraph tests |
| Persistent stat inflation | Run difficulty becomes hard to balance | Prefer unlocks over raw permanent power |
| Multiplayer added late | Simulation and networking rework | Exclude from MVP unless approved early |
| Boss and enemy roles overlap | Encounters feel repetitive | Define each archetype by a distinct player response |

## 12. Open decisions

- Final player identity and movement model.
- Manual aim, assisted aim or auto-aim.
- Keyboard/mouse, controller, touch or multiple input targets.
- Health/lives and defeat rules.
- Run objective and expected session duration.
- Exact level-up trigger and choice count.
- Whether persistent progression is required for the first MVP.
- Whether there is one arena or a small sequence of arenas.
- Whether combat is real-time only or includes tactical pauses.

No implementation is authorized by this document.