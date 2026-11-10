# STARFALLGODOT — Phase 03 Prototype Scope

**Phase lead:** AIT0405  
**Base:** Phase 02 accepted architecture  
**Target platforms:** Desktop PC and mobile

## Objective

Build a runnable Godot prototype that tests the minimum connected loop: 3D exploration, humanoid movement, first-/third-person camera switching, a local turn-based encounter and an offline test flow.

## Included

- Procedural 3D test arena; no external assets required.
- Humanoid placeholder character and two enemy placeholders.
- Third-person and first-person camera modes.
- Keyboard/mouse and touch-oriented on-screen movement/action controls.
- Start encounter, target selection, tactical reposition, weapon attack, skill action and end turn.
- Local turn manager, combatant state, shared action validator/resolver and deterministic enemy turns.
- Victory/defeat state and encounter restart.
- Headless domain tests for combatant state, turn scheduling, action ownership, range checks and damage resolution.

## Explicit prototype-only parameters

These are test fixtures, not approved product rules:
- Player health 100; enemy health 48 and 58.
- Player turn starts with 2 action points; each enemy receives 1.
- Weapon attack damage 24; skill damage 34; enemy attack damage 8.
- Tactical reposition distance 1.35 metres.
- Fixed test actor order: player, scout, guard.
- Basic range checks and direct enemy approach behavior.

These values make the test encounter repeatable. They do not close Phase 02 OPEN decisions.

## Excluded

Online multiplayer/server, login, matchmaking, production assets/animation/audio, production enemy AI, progression, save system, crafting, campaign, final balance and release-quality platform certification.

## Technical baseline

Godot 4.7.2 stable is the prototype authoring baseline. The official archive lists 4.7.2 as stable and 4.8 beta3 on 2026-11-10. This is not a production engine lock; ADR-002 remains OPEN pending device/export validation.

Prototype renderer: Compatibility, used as a conservative initial configuration. It is not a final renderer decision.

Official references:
- https://godotengine.org/download/archive/
- https://godotengine.org/article/maintenance-release-godot-4-7-2/
