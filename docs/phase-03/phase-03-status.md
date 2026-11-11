# Phase 03 — Prototype Status

**Status:** PENDING_OWNER_VALIDATION  
**Phase lead:** AIT0405  
**Implementation branch:** phase-03-prototype-ait0405  
**Closeout documentation branch:** phase-03-closeout-ait0405
**Merge-record branch:** phase-03-merge-record-ait0405  
**Base branch:** main  
**Current main commit:** ac2b57632040e22bfe436d41d04874de55951669  
**Issue:** #46  
**Implementation PRs:** #45, #47, #48 and #50 (all merged)  
**Latest implementation PR:** [#50](https://github.com/klioscreator/STARFALLGODOT/pull/50), merged 2026-11-11
**Closeout docs PR:** [#49](https://github.com/klioscreator/STARFALLGODOT/pull/49), merged 2026-11-11  
**Latest baseline CI:** [#42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067) — SUCCESS  
**Integration CI:** [#43004438956](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43004438956) — SUCCESS on PR #50 head
**Main CI after merge:** [#43036866188](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43036866188) — SUCCESS  
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
- Follow-up viewport/type corrections merged through PR #48.
- Integration checks exposed an untyped actor-order array at encounter start; the targeted correction and new lifecycle test were merged through PR #50. Its Godot CI run passed.

## Automated verification

The merged implementation's Godot Prototype Checks run, [#42845612067](https://github.com/klioscreator/STARFALLGODOT/actions/runs/42845612067), completed successfully on commit `4a0158d1aac60720a252f29b740a8af03829e027`. The added integration suite in PR #50 also passed in [run #43004438956](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43004438956) on proposed commit `b09baa1ab720d31296746a120995e2a558a3d51a`.

Successful steps:
- Install Godot 4.7.2 standard build.
- Verify engine version.
- Import and parse the project headlessly.
- Run `tests/run_tests.gd`.
- Launch the main scene headlessly for five frames.

The original tested commit was merged through PR #48. The later integration correction and tests were merged through PR #50 (`6c2a9ce6dba772fd4b1fb45b915fa25bf705e3c1`). The closeout records were merged through PR #49. Current main is `ac2b57632040e22bfe436d41d04874de55951669`; main workflow [#43036866188](https://github.com/klioscreator/STARFALLGODOT/actions/runs/43036866188) completed successfully, including build and deploy jobs.

Detailed evidence: [docs/phase-03/test-report.md](test-report.md). Owner-side execution sheet: [Project Owner Validation Checklist](owner-validation-checklist.md).

## Remaining owner-side validation

Automated headless checks do not replace interactive hardware tests. The following still require a desktop/mobile device and the Project Owner's review:
- Play the scene interactively on desktop; inspect movement, camera obstruction, target selection and encounter transitions.
- Test touch controls and screen layout on an actual mobile device.
- Verify Android/iOS export only after the intended mobile OS and export toolchain are confirmed.
- Measure frame time, memory, thermal behavior and input latency on agreed target hardware.
- Confirm whether the prototype behavior meets the acceptance criteria.

These are not reported as passed. No physical target device or Android SDK was available in the implementation environment. Use the [Project Owner Validation Checklist](owner-validation-checklist.md) to record actual desktop/mobile results.

## Scope guard

No online server, multiplayer transport, production assets, campaign, progression/save system or final combat balance is included. Prototype AP/damage/turn/movement parameters are test fixtures only and do not close any Project Owner decision.

## Review state

Implementation PRs #45, #47 and #48 are merged. PR #50's integration checks and typed-array correction are merged; the automated Godot checks and post-merge main workflow pass. Phase 03 remains **PENDING_OWNER_VALIDATION**, not COMPLETED, until interactive owner-device validation and explicit acceptance are recorded.