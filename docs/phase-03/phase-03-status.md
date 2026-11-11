# Phase 03 — Prototype Status

**Status:** PENDING_OWNER_VALIDATION  
**Phase lead:** AIT0405  
**Implementation branch:** phase-03-prototype-ait0405  
**Closeout documentation branch:** phase-03-closeout-ait0405  
**Base branch:** main  
**Current main commit:** 8d0e681d4453763f9925f7034cc016d79e6773d7  
**Issue:** #46  
**Implementation PRs:** #45, #47 and #48 (all merged)  
**Latest fix PR:** [#48](https://github.com/klioscreator/STARFALLGODOT/pull/48), merged 2026-11-11  
**Latest fix CI:** [Godot Prototype Checks #42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067) — SUCCESS  
**Last updated:** 2026-11-11

## Objective

Build a prototype connecting 3D exploration, humanoid control, dual camera, PC/touch input and a solo offline tactical encounter.

## Implemented

- Godot 4 project configuration and main scene.
- Procedural 3D test arena, collision floor and cover obstacles.
- Humanoid placeholder with CharacterBody3D movement.
- First-/third-person camera rig, camera obstruction handling and player-mesh hiding in first-person.
- Keyboard movement and mouse-look controls.
- Touch-oriented directional pad, touch camera drag and action buttons.
- Compact HUD layout for narrower screens.
- Combatant runtime state and centralized turn manager.
- Shared domain action validator and damage resolver used by player and enemy actions.
- One offline encounter with target selection, tactical reposition, weapon attack, skill action, enemy turns, victory/defeat and restart.
- Headless tests for combatant state, turn scheduling, action ownership, range validation and damage resolution.
- Automated Godot import, domain-test and scene-launch workflow.
- Run instructions, prototype-only parameter register, test report and handoff.
- Follow-up type and viewport corrections merged through PR #48.

## Automated verification

The implementation branch's latest Godot Prototype Checks run, [#42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067), completed successfully on commit `4a0158d1aac60720a252f29b740a8af03829e027`.

Successful steps:
- Install Godot 4.7.2 standard build.
- Verify engine version.
- Import and parse the project headlessly.
- Run `tests/run_tests.gd`.
- Launch the main scene headlessly for five frames.

The tested commit was merged to main through PR #48. The merge commit is `8d0e681d4453763f9925f7034cc016d79e6773d7`. The merge-triggered Pages deployment also completed successfully; that deployment is not a substitute for the Godot test workflow.

Detailed evidence: [docs/phase-03/test-report.md](test-report.md).

## Remaining owner-side validation

Automated headless checks do not replace interactive hardware tests. The following still require a desktop/mobile device and the Project Owner's review:
- Play the scene interactively on desktop; inspect movement, camera obstruction, target selection and encounter transitions.
- Test touch controls and screen layout on an actual mobile device.
- Verify Android/iOS export only after the intended mobile OS and export toolchain are confirmed.
- Measure frame time, memory, thermal behavior and input latency on agreed target hardware.
- Confirm whether the prototype behavior meets the acceptance criteria.

These are not reported as passed. No physical target device or Android SDK was available in the implementation environment.

## Scope guard

No online server, multiplayer transport, production assets, campaign, progression/save system or final combat balance is included. Prototype AP/damage/turn/movement parameters are test fixtures only and do not close any Project Owner decision.

## Review state

Implementation PRs #45, #47 and #48 are merged. Automated Godot checks pass. Phase 03 remains **PENDING_OWNER_VALIDATION**, not COMPLETED, until interactive owner-device validation and explicit acceptance are recorded.