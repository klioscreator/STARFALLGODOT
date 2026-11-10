# STARFALLGODOT — Proposed MVP scope

**Document status:** Proposal for Project Owner approval  
**Prepared:** 2026-11-10  
**Phase:** 01 — Research and Design

## 1. Purpose

The MVP should answer one question: can the proposed core combat loop produce a readable, repeatable and strategically meaningful short run?

It should not attempt to represent the full future game. The current repository does not contain an approved product concept; the scope below assumes the provisional top-down science-fiction survival roguelite described in [game-concept.md](game-concept.md).

## 2. MVP objective

Deliver one complete, testable solo combat run with:
- A controllable player unit.
- One compact combat arena.
- A small set of enemy roles.
- A limited set of weapons/attack behaviours.
- One active ability and one defensive/evasion action.
- Run resource collection and upgrade choices.
- Escalating encounter pressure.
- One elite encounter and one simple boss encounter, if schedule permits.
- Victory/defeat handling and a run summary.

These are proposed scope items. Player identity, platform and presentation must be approved before architecture.

## 3. In-scope features

### Player
- One playable player archetype.
- One movement model.
- One primary attack configuration.
- One active ability.
- One defensive/evasion action.
- Health and defeat state.

### Combat
- One arena.
- Three basic enemy archetypes with distinct movement/attack roles.
- One elite modifier.
- One boss with a small, readable attack set.
- Collision, damage, hit feedback and enemy defeat.
- Clear telegraphs for dangerous attacks.

### Run progression
- One run resource.
- One upgrade-choice flow.
- A compact upgrade pool spanning attack, defence/mobility and utility.
- A limited number of explicit synergies, only if the base upgrade flow is stable.
- Run summary with outcome and collected rewards.

### User interface
- Main menu and start-run flow.
- In-run health and ability display.
- Upgrade-choice interface.
- Pause/resume.
- Victory/defeat summary.
- Basic audio and display settings.

## 4. Out of scope

- Multiplayer, PvP, matchmaking, clans and leaderboards.
- Multiple playable characters.
- Large weapon/ability catalogues.
- Multiple biomes or procedural campaign generation.
- Persistent skill trees with many stat nodes.
- Dragon/creature collection, breeding and habitat management.
- Complex crafting, equipment rarity or multi-currency economy.
- Monetization, advertising, paid currency, loot boxes or gacha.
- Narrative cinematics, voice acting and large quest chains.
- Live events and seasonal systems.

## 5. Proposed implementation sequence after Phase 01

This is a planning sequence for later phases, not permission to begin them.

1. **Phase 02 — Architecture:** define scene boundaries, data models, input, combat interfaces, save model and test strategy.
2. **Phase 03 — Prototype:** establish player movement, one attack, one enemy and a basic arena; validate the feel before adding content.
3. **Phase 04 — Combat:** add damage rules, health, projectiles, abilities, enemy attacks, telegraphs and encounter pacing.
4. **Phase 05 — Creatures/enemies:** expand enemy roles and implement elite/boss behaviours.
5. **Phase 06 — World base:** add arena presentation, environment interactions, UI and audio.
6. **Phase 07 — Integration:** tune, test, optimize and verify the complete MVP.

The phase names are taken from the existing repository assignment table; the exact dependencies and acceptance gates must be confirmed by the Project Owner before later phases start.

## 6. MVP acceptance criteria

The MVP is acceptable for internal evaluation when all of the following can be demonstrated:

1. A new player can start a run without external setup instructions.
2. Movement and attack inputs behave consistently on the approved target platform.
3. Player attacks can hit valid enemies and invalid targets do not receive damage.
4. Enemy attack telegraphs are visible before the associated damage event.
5. The player can avoid at least one enemy attack through movement or the defensive action.
6. Enemy roles create different responses; no two basic archetypes are functionally identical.
7. Run resource collection leads to an upgrade choice.
8. Every upgrade offered is valid for the current player/build state.
9. An upgrade produces a visible or measurable change.
10. Encounter pressure increases in a controlled, testable way.
11. Victory and defeat both lead to a stable run summary.
12. Restarting a run does not retain temporary run upgrades unless explicitly intended.
13. The game can complete a full test run without a blocking crash or unrecoverable state.
14. Core combat information remains readable at the approved target resolution and input device.

Numerical performance thresholds, target frame rate and device specifications must be set after the platform decision.

## 7. Required tests

- Movement in all supported directions and at arena boundaries.
- Aim/target selection and attack direction.
- Damage, health reduction, defeat and invulnerability rules.
- Projectile collision and lifetime.
- Enemy telegraph timing and damage area.
- Upgrade selection, invalid-choice prevention and duplicate upgrade behaviour.
- Run resource pickup and reset behaviour.
- Pause/resume and exit confirmation.
- Victory/defeat state transition.
- Save/load of persistent unlocks, if persistent progression is included.
- Performance under the maximum planned enemy/projectile density.

## 8. Dependencies and unresolved decisions

| Dependency | Required decision/input | Blocks |
|---|---|---|
| Product direction | Accept/revise provisional genre and combat loop | Entire MVP |
| Player identity | Operative, ship, creature or another unit | Controls, animation, hitbox, weapons |
| Platform | PC, mobile, console or combination | Input, UI, performance target |
| Presentation | 2D, 2.5D or 3D | Art pipeline and scene architecture |
| Aiming | Manual, assisted or automatic | Combat interface |
| Run objective | Survival time, boss defeat, extraction or other | Encounter pacing and victory |
| Progression | Run-only or persistent unlocks | Save data and reward flow |
| Engine baseline | Godot version and renderer | Phase 02 architecture |

## 9. MVP risks

- **Scope expansion:** adding many weapons, enemies or modes before validating the core loop delays the first test.
- **Unclear target platform:** input and UI may need redesign.
- **Effect overload:** dense combat may obscure telegraphs and player state.
- **Unbalanced upgrade pool:** random choices may produce dead-end builds.
- **Unclear success condition:** survival without a clear objective may make runs feel arbitrary.
- **Unapproved concept assumptions:** architecture may be built around a direction the Project Owner does not want.

## 10. Release gate

This MVP scope is not authorization to start implementation. Phase 02 may begin only after the Project Owner accepts the product direction, the unresolved decisions that affect architecture are resolved, and the Phase 01 package is formally accepted.